# How the Songsterr Premium patch was made — beginner friendly

This explains the whole project like you have never done Android reverse
engineering before. No step is skipped.

Target app: Songsterr Guitar Tabs & Chords, package name `com.songsterr`,
version `7.1.3`, versionCode `2012282384`.
Patch repo: `https://gitlab.com/georgewoodall82/songsterr-patches`
Patch name: `Unlock Premium`.

## 0. Words you need first

- **APK**: the install file for one Android app. It is just a ZIP file
  with code, images, and a manifest.
- **APKM**: APKMirror's bundle format. Also just a ZIP, but it contains
  *several* APKs: one `base.apk` plus small `split_*.apk` files for
  different CPUs, screen sizes, and languages.
- **DEX**: the file inside an APK that holds the compiled app code,
  like `classes.dex`, `classes2.dex`. Android runs DEX, not normal Java.
- **Smali**: human-readable text version of DEX. When we say
  `sget-object v0, Le2;->t`, that is one Smali instruction.
- **Obfuscation**: the app maker renames classes and methods to short
  meaningless names like `f`, `g`, `h` so it is hard to read. The app
  still works, but humans get confused. Songsterr does this.
- **Morphe**: an Android app that edits other apps on your phone.
- **Bundle / .mpp**: a file full of Morphe patches you can share.
  Our bundle builds to `patches-1.0.0.mpp`.
- **Patch**: one edit, like "Unlock Premium".
- **Fingerprint**: a "wanted poster" for a method. Because names like
  `g` change every update, we do not trust the name alone. We describe
  what the method *does*: what strings it uses, what other methods it
  calls, what it returns. Morphe searches the app for the method that
  matches that description.
- **returnEarly**: Morphe helper that says "do not run the original
  code, just return this value immediately".

## 1. What we started with

One file:

```
com.songsterr_7.1.3-2012282384_4arch_6dpi_24lang_*.apkm
```

That long name is helpful: app, version, CPU types, languages, uploader.
Inside it, `info.json` says:

```
pname: com.songsterr
version: 7.1.3
versioncode: 2012282384
```

So we know exactly what we are patching.

## 2. Look inside the APKM

An APKM is a ZIP, so you can list it without any special tool:

```
unzip -l *.apkm
```

You see:

```
info.json
icon.png
base.apk
split_config.arm64_v8a.apk
split_config.en.apk
...
```

`base.apk` (about 24 MB) is the real app. The `split_*` files are tiny
add-ons. Morphe understands APKM directly when we set
`apkFileType=APKM`, so the user just gives Morphe the `.apkm` file.
For detective work I copied `base.apk` out to `/tmp` so I could read it
on the computer.

## 3. Hunt for premium words with `strings`

Every program contains readable text like `"Debug lock happened"` or
`"Cracked"`. The Linux command `strings` prints all of them.

I ran:

```
strings classes.dex | grep -i premium
strings classes.dex | grep -i plus
strings classes.dex | grep -i billing
```

This found a whole neighborhood:

```
com.songsterr.iap.Premium
com.songsterr.iap.GooglePlayBilling
getHasPlus, getHasPro, getHasSRA
hasPlus, hasSRA, hasSub
isPremiumLocked
Billing sync done, hasIAP()={}, hasSub()={}, ...
Debug lock happened
Cracked
```

`iap` means "in-app purchase". That told me: all the "are you premium?"
logic lives in `com.songsterr.iap.*`.

Think of it like hearing people talk about "keys" and "locks" in one
room of a big building — that room is probably the security office.

## 4. List the classes with androguard

`strings` tells you words, but not how the code fits together.
For that I used a Python tool called `androguard`. It can open an APK
without running it and list every class and method. I did not have
`jadx` (a fancier decompiler) installed, and androguard was enough.

I asked: "show me every class with `songsterr/iap` in the name".
In version 7.1.3 the answer was:

```
Lcom/songsterr/iap/f;
Lcom/songsterr/iap/a;
Lcom/songsterr/iap/b;
...
Lcom/songsterr/domain/json/User;
Lcom/songsterr/CrackChecker;
```

The most important one is `Lcom/songsterr/iap/f;`. The `L...;` form is
just how Android writes class names, and `f` is the obfuscated name.
Old leftover text inside the app still says
`Lcom/songsterr/iap/Premium$verifySubscription$1`, which is a clue
that `f` used to be called `Premium`.

Then I asked: "what methods does `f` have?" Answer:

```
b()Lf2;
f()Set
g()Boolean, h()Boolean, i()Boolean, j()Boolean
k()boolean, l()boolean
```

Do not worry about `Lf2` yet — it just means "some object type".

## 5. Read each method in plain English

Androguard can also print the Smali instructions. I read them one by one.
Here is what each one *means*, not the raw code:

- **`User.getHasPlus()`, `getHasPro()`, `getHasSRA()`**: these come from
  the server when you log in. They are simple true/false flags:
  "does this account own Plus? Pro? SRA (synced audio)?" They live in
  `Lcom/songsterr/domain/json/User;` and their names were *not*
  obfuscated, so they are easy to trust.

- **`Premium.h()`**: asks the User object "do you have Plus?" and wraps
  the answer as a `Boolean` object. So `h == server says Plus`.

- **`Premium.i()`**: same, but for SRA. `i == server says SRA`.

- **`Premium.g()` and `j()`**: both mean "did you buy something on this
  phone?" They check if a Set of owned products is empty, or if you have
  a manual web subscription. That is why they both contain an `isEmpty`
  check. They are twins with slightly different storage.

- **`Premium.k()`**: "do you have a web subscription?" It looks at the
  subscription type and returns true for `BRAINTREE`, `STRIPE`, or
  `PAYPAL`. Those are payment companies for the website, not Google Play.

- **`Premium.l()`**: "do you have a Google Play subscription?" It looks
  for type `GOOGLE_PLAY` *and* that `j()` is true.

- **`CrackChecker.a()`**: anti-tamper. It checks the app signature hash
  number `1046298818` and a flag `Songsterr.e`. If it thinks the app was
  modified, it returns true for "cracked". The premium code uses this to
  lock you out.

- **`Premium.b()`**: the boss. This is the one method every screen asks:
  "what tier is this user?" Its full logic in plain English is:

  1. If debug-lock is on -> return `e` (locked). It also logs
     `"Debug lock happened"`.
  2. If `CrackChecker` says cracked -> return `e`. It logs `"Cracked"`.
  3. If `User.getHasPro()` is true -> return `v`.
  4. If `h()` (server Plus) is true -> return `t`.
  5. If `j()` (owned products) is true -> return `t`.
  6. If a bonus timer is still active -> return `t`.
  7. If `i()` (server SRA) is true -> return `u`.
  8. If `g()` (owned products, other storage) is true -> return `u`.
  9. Otherwise return `e` (free) or `w` (unknown/error).

  That is why `b()` contains both strings `"Debug lock happened"` and
  `"Cracked"` plus a call to `getHasPro`. No other method has that
  combination, so that combination is its fingerprint.

## 6. What are `e, u, t, v, w`?

When `b()` returns, it does not return true/false. It returns a little
object from an enum called `Le2`. Think of an enum like a menu with
fixed choices. In 7.1.3 the menu is built like this:

```
e = 0  free / locked
u = 3  SRA (synced real audio)
t = 7  PLUS (the main subscription)
v = 9  PRO (old lifetime purchase)
w = -1 unknown / error
```

The number is stored in a field called `c`. So `c=7` means PLUS.

I learned this by reading `Le2.<clinit>`, which is the method that
creates those five choices, and by watching who checks for what:

- `checkForPlus` checks `b() == t`. It only cares about PLUS.
- `TabPlayerModel` (the tab player that resets solo/mute) checks
  `b==e`, `b==w`, and `c-7 >= 0`. That last one means "7 or 9", in other
  words "t or v". So PLUS and PRO both unlock the player, SRA (`u=3`)
  does not.
- Settings screen `Lbe5` has separate branches for `e/u/t/v/w` just to
  show different text.
- Almost every "is it free?" check is just `b()==e`. Anything not `e`
  counts as premium.

Why force `t` and not `v`? Because `t` passes the most gates. `v` also
passes `!=e` and `c>=7`, but it *fails* exact `==t` checks like
`checkForPlus`. `t` passes both `==t` and `c>=7` and `!=e`. So `t`
unlocks the most: speed, solo/mute, loop, etc.

## 7. Fingerprints = wanted posters

Because `f`, `g`, `h`, `b`, `Le2` will all be renamed in the next
Songsterr update, we do not want to trust names alone.

A fingerprint says, for example for `h`:

> "Look in class `com.songsterr.iap.f`, instance method, no inputs,
>  returns a `Boolean` object, and inside it calls
>  `User.getHasPlus`. Its obfuscated name happens to be `h` in 7.1.3."

If Songsterr renames `h` to `q` next month, the fingerprint fails loudly
instead of patching the wrong thing. That is good — silent wrong patches
cause crashes.

The file `Fingerprints.kt` has 11 such posters:

- 3x `User.getHasPlus/Pro/SRA` — stable names, easy.
- 1x `CrackChecker.a` — stable class + `literal(1046298818)` + call to
  `getFirstPackageSignatureHashCode`.
- 2x `Premium h/i` — same class, same shape, split by
  `getHasPlus` vs `getHasSRA` call.
- 2x `Premium g/j` — both contain `isEmpty`, split by `name=g/j`
  because their logic is otherwise identical in 7.1.3.
- 1x `Premium k` — looks for `BRAINTREE` + `STRIPE` fields.
- 1x `Premium l` — looks for `GOOGLE_PLAY` field.
- 1x `Premium b` — `returnType=L` means "any object" (so we survive
  a rename of `Lf2`), plus both strings and the `getHasPro` call.
  That combo is unique.

`verify.py` re-checks all 11 against your exact `.apkm` using only
androguard. On your file it prints 22 PASS lines. If a future Songsterr
breaks one, you will see which FAILed and know what to update.

## 8. The patch, line by line

File: `UnlockPremiumPatch.kt`, patch name `Unlock Premium`.

```kotlin
UserHasPlusFingerprint.method.returnEarly(true)
```

"Find the `getHasPlus` method and do not run it. Just return true."
Same for `getHasPro` and `getHasSRA`. Now the app thinks the server
said yes to everything.

```kotlin
CrackCheckerFingerprint.method.returnEarly(false)
```

"Even if the signature does not match, say not-cracked." This stops
`b()` from taking the early `return e` locked path.

```kotlin
PremiumHasPlusFingerprint.method.returnBoxedBooleanEarly(true)
```

Same idea, but these methods return a `Boolean` *object*, not a primitive
`boolean`. Morphe needs a different helper for that, hence
`returnBoxedBooleanEarly`. We do it for `h/i/g/j`.

```kotlin
PremiumManualSubFingerprint.method.returnEarly(true)
PremiumGooglePlaySubFingerprint.method.returnEarly(true)
```

`k()` and `l()` return primitive `boolean`, so plain `returnEarly`.

```kotlin
PremiumTierFingerprint.method.addInstructions(0, """
  sget-object v0, Le2;->t:Le2;
  return-object v0
""")
```

"At the very start of `b()`, load the PLUS choice `t` into register `v0`
and return it." `v0` is safe to use here because the original `b()`
sets `v0` itself on its first line. This overrides everything above
and guarantees every caller sees PLUS.

Why do both the Booleans *and* `b()`? Because some screens call `h()`
directly, some call `b()`. Forcing both covers both paths.

## 9. Building and sharing

Morphe patches are Kotlin. They build to a `.mpp` bundle with:

```
./gradlew buildAndroid
# -> patches/build/libs/patches-*.mpp
```

That needs JDK 17+ and a GitHub token with `read:packages` because the
Morphe library lives on GitHub Packages.

- Local test: Morphe Manager -> Sources -> `+` -> Local -> pick the `.mpp`,
  then pick Songsterr 7.1.3 APKM, enable `Unlock Premium`, Patch, Install.
  Same package name means you must uninstall stock Songsterr first.
- Remote share: push the repo, let `release.yml` build releases. Our repo
  did `v1.0.0-dev.1` (pre-release, needs pre-release toggle) then stable
  `v1.0.0`. Users add it with:
  `https://morphe.software/add-source?github=georgewoodall82/songsterr-patches`
- Official `MorpheApp/morphe-patches` only takes YouTube/Music/Reddit,
  so a separate repo is required. Discovery is via
  `nvbangg/awesome-morphe` issue #40, which feeds the website and Telegram.

## 10. If Songsterr updates

1. Put the new `.apkm` next to `verify.py` and run:
   `python3 verify.py --apkm "*.apkm"`.
2. The FAIL lines tell you what renamed. Open the new `base.apk`
   the same way (unzip, `strings`, androguard), find the new
   `com.songsterr.iap.*` class that calls `User.getHasPlus`,
   update `definingClass`/`name` in `Fingerprints.kt`.
3. If the enum `Le2` was renamed (e.g. to `Lm7`), update the
   `sget-object v0, Le2;->t` line too.
4. Add `AppTarget(version="x.y.z")` in `Constants.kt`, rebuild,
   commit with `feat: ...` on `dev`, let stable release happen on `main`.

## Glossary in one place

- APKM/APK/DEX/Smali/obfuscation: see section 0.
- `User`: server account flags. Patch to true.
- `Premium f`: obfuscated gatekeeper. Patch its letters to true.
- `b()`: boss tier getter. Force to `t`.
- `Le2`: tier menu. `t=PLUS` is the one you want.
- `CrackChecker`: tamper detector. Force to false.
- Fingerprint: description of a method so Morphe can find it after
  renaming. Fail-fast is a feature.
- `verify.py`: independent re-check so you know the posters still match.
