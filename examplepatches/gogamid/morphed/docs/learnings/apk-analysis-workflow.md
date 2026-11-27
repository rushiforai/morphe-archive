# APK analysis workflow on-device (Termux, aarch64)

How the Rossmann fingerprints and stubs were produced and verified. All of this runs in
Termux; `jadx`, `apktool`, `java`, `javap`, `unzip` and `strings` are installed.

## 1. REA's JADX provider does not run here

REA MCP's Android/JADX provider refuses an Android host:

```
Android JADX subprocess ownership is unsupported on android/arm64
```

Fall back to the plain tools. `jadx` and `apktool` are JVM programs, and the JVM runs fine
in Termux — this is not a platform limitation, just a provider guard.

## 2. Unpack the APKM

Rossmann ships as an `.apkm` bundle (`ApkFileType.APKM`), which is a zip:

```sh
unzip -o app.apkm -d app/
ls app/
# base.apk  split_config.arm64_v8a.apk  split_config.xxhdpi.apk  info.json  meta.sai_v2.json …
```

`info.json` carries the package name, `versionCode`, languages and dpis — use it to confirm
you are looking at `5.11.1` / `421000110`. Patch the `.apkm` as a whole: the Morphe CLI
merges the splits itself, so there is no reason to touch `base.apk` in isolation.

## 3. Fast recon with `strings` on the DEX files

R8 keeps Rossmann's class names, so `strings` on the dex files enumerates candidates in
seconds — much cheaper than a full decompile:

```sh
unzip -o app/base.apk 'classes*.dex' -d app/dex/
strings app/dex/classes*.dex | grep -o 'Lde/rossmann/app/android/[^;]*coupon[^;]*;' | sort -u
```

That is how `...models/coupon/CouponDisruptorState$Companion`,
`...business/coupon/ActivateCoupon` and friends were found.

## 4. Full decompile with jadx

```sh
jadx --no-res --threads-count 8 -d jadx-out app/base.apk
```

Expect **5–10 minutes** for the 56 MB `base.apk` (~31k classes). A few hundred
`finished with errors` lines are benign and normal; check the exit code and search the
output before panicking.

Two jadx caveats:

- **Readable, but not authoritative.** jadx renames colliding fields (`f37306t`), reorders
  members and sometimes guesses types.
- Therefore always confirm names and descriptors in smali (next step).

## 5. Ground truth: apktool smali

```sh
apktool d -f --no-res -o apktool-out app/base.apk
```

Then read `.field` / `.method` lines directly. Example checks that mattered:

```sh
grep -n '\.field' apktool-out/smali*/de/rossmann/app/android/models/coupon/Coupon.smali
# .field public final l:Ljava/lang/String;
# .field public final q:Z
# .field public final R:Lde/rossmann/app/android/models/coupon/Coupon$PreviewState;

grep -n '\.method' apktool-out/smali*/de/rossmann/app/android/business/coupon/ActivateCoupon.smali
# .method public final c(Lde/rossmann/app/android/models/coupon/Coupon;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;
```

Any smali that a patch injects must use exactly these names and descriptors — a single
wrong descriptor is an unverifiable method at install/patch time.

### Also verify the library and Hilt names the extension links against

The app R8-reprocesses its bundled Kotlin runtime and Hilt output, so stock names are not
safe. Check the actual fields/methods before relying on them:

```sh
grep -n '\.field' apktool-out/smali*/kotlin/Unit.smali \
    apktool-out/smali*/kotlin/coroutines/EmptyCoroutineContext.smali
# .field public static final a:Lkotlin/Unit;
# .field public static final a:Lkotlin/coroutines/EmptyCoroutineContext;

grep -n '\.method' apktool-out/smali*/de/rossmann/app/android/ui/Hilt_RossmannApplication.smali \
    | grep C0
grep -n '\.method' \
    apktool-out/smali*/de/rossmann/app/android/ui/DaggerRossmannApplication_HiltComponents_SingletonC\$SingletonCImpl.smali \
    | grep 'n()'
```

`C0()`/`n()` are generated Hilt graph members, not app API; re-check them on every version
bump together with the app's own renamed methods. For an injection point, count the `return`
opcodes in the target method as well — `RossmannApplication.onCreate` has two `return-void`
paths, so "inject before the return" is not unique.

To catch constant folding, inspect the **compiled extension**, not only the Java source:

```sh
javap -c -p -classpath <extension-classes> \
    app.gogamid.morphed.extension.rossmann.RossmannAutoClaim | grep -n 'Coupon.q'
# no getfield = the stub's "= false" initialiser removed the runtime read
```

Also search for the string filters used by fingerprints, to see which method they really
pin:

```sh
grep -rn 'findActivatedCoupon' apktool-out/smali*/de/rossmann/ | head
```

## 6. Verify the stub jar with `javap`

After editing `extensions/extension/stubs/**`, rebuild the jar and check the descriptors
must match the app byte-for-byte:

```sh
javap -p -c -classpath extensions/extension/libs/rossmann-stub-5.11.1.jar \
    de.rossmann.app.android.business.coupon.ActivateCoupon | head -20
```

Rebuild recipe is in `extensions/extension/stubs/README.md`; details and pitfalls in
[extension-and-stubs.md](extension-and-stubs.md).

## 7. Give the JVM a heap

This device has little RAM. Without an explicit limit, jadx and friends get killed or crawl:

```sh
export JAVA_OPTS="-Xmx1600m"
```

Use the same `-Xmx1600m` for the `morphe-desktop` CLI (see
[build-and-release.md](build-and-release.md)) and for `javac`/`jar` when rebuilding stubs.
