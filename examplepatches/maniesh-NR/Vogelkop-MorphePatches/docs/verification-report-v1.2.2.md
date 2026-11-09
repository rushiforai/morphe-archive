# Vogelkop patches v1.2.2 — sandbox verification report

Date: 2026-11-08 · Environment: headless Linux sandbox (no Android runtime)
· Toolchain: Morphe Desktop CLI v2.1.1, Morphe Patcher 2.3.0, bundle
`patches-1.2.2.mpp` (Ed25519-signed, SHA-256
`f6d47085802467204d3c472d2cec246eb4aa6e4e213f0534a3966238de1307e9`).

## The v1.2.1 crash, root-caused

v1.2.1 fixed every *compile-time* reference in the signature-spoof extension,
yet patched apps still crashed instantly on open ("app closes immediately").
The remaining fault was *runtime* semantics:

```
findField(PackageInfo.class, "CREATOR").set(null, creator)   // CREATOR is public static final
...
} catch (Exception e) { throw new RuntimeException("Failed to modify package manager", e); }
```

1. ART — exactly like the desktop JDK — refuses `Field.set()` on final
   fields. The ApkSignatureKillerEx lineage clears the FINAL bit through the
   hidden `java.lang.reflect.Field#accessFlags` field first; that step had
   been dropped in the port, so on current Android the `set` throws
   `IllegalAccessException`.
2. The catch block re-threw from a static initializer. The hook runs from
   `SignatureHookApp.<clinit>` (both re-parented Application subclasses trigger
   it before any app code), so the escaping throwable surfaces as
   `ExceptionInInitializerError` at `new OperaApplication()` — an immediate
   crash on open, before the first frame, indistinguishable to the user from
   the v1.2.0 stub crash. (`catch (Exception)` also misses linkage `Error`s;
   only `catch (Throwable)` makes a `<clinit>` safe.)

The upstream `rushiranpise/morphe-patches` `SignatureHookApp.java` carries the
same two flaws (verified against its current source).

## Fix (v1.2.2)

`killPackageManager` can no longer throw at all, and the CREATOR swap now runs
the full technique chain, attempted in order until one succeeds:

1. best-effort hidden-API exemptions (`VMRuntime.setHiddenApiExemptions("L")`
   via meta-reflection — now requested **before** the swap it enables),
2. reflection after clearing the FINAL bit via `Field#accessFlags`,
3. `sun.misc.Unsafe` `staticFieldBase`/`staticFieldOffset`/`putObject` static
   write (bypasses the final check entirely),
4. plain `Field.set` (for ART builds that allow final writes).

A spoof that cannot be installed now leaves a **working** app that simply sees
the Morphe certificate — logged via `android.util.Log` (tag `VogelkopSpoof`)
instead of crashing.

## Patching all three apps with the Morphe Desktop CLI

`java -jar morphe-desktop-all.jar patch -p patches-1.2.2.mpp <app>.apkm`

| App (APKM input) | Patches applied | Result |
|---|---|---|
| Opera stable 103.3.5234.91185 (vc 1910312306) | 7/7 | ✓ 22.9 s |
| Opera Beta 104.0.5262.91143 (vc 1910404306) | 7/7 | ✓ 16.0 s |
| Opera GX 3.3.18 (vc 199) | 3/3 | ✓ 11.0 s |

## Output verification

| Check | stable | beta | GX |
|---|---|---|---|
| Final-dex decompile: `<clinit>` non-throwing, layered `installCreator` (accessFlags → Unsafe → plain set), no `throw` path | ✓ | ✓ | ✓ |
| Placeholders replaced (real package name + official Opera certificate) | ✓ | ✓ | ✓ |
| `OperaApplication` + `LeanplumApplication` re-parented onto `SignatureHookApp` | ✓ | ✓ | n/a (attached) |
| Extension build gates: 0 kotlin-stdlib code refs, 0 leaked framework classes, every `android/*` ref resolves (AuditExtDex: 4 class, 12 method, 5 field refs) | ✓ | ✓ | ✓ |
| `libopera.so` byte-identical to input (SHA-256) | ✓ | ✓ | n/a (WebView app) |
| `.so` entries STORED with 16 KiB-aligned **data offsets**, `resources.arsc` 4 B-aligned | ✓ (20/20) | ✓ (19/19) | ✓ (13/13) |
| APK signature (apksig, platform 29) | ✓ v2 | ✓ v2 | ✓ v2 |
| Endpoint neutralization (81 const-strings + Leanplum `API_HOST_NAME` on stable/beta, 8 on GX) | ✓ | ✓ | ✓ |
| Bundle: `classes.dex` present, `MorpheSig1` Ed25519 signature valid, name "Vogelkop patches", version 1.2.2 | ✓ | ✓ | ✓ |

Honest limitation (unchanged from v1.2.1, verified by identical string-pool
comparison): ~44 dormant ad-SDK strings (GMA/IMA/PAL loader and OM-SDK
resource URLs, cookie-domain lists) survive inside static `String[]` array
initializers, which the current two passes (const-string instructions + static
field initial values) do not rewrite. Their code paths belong to the disabled
ad stack, and rewriting array constants wholesale risks Opera's own adblock
domain lists, so they were deliberately left alone. Zero regression vs v1.2.1
(same 44 pool strings in both builds).

## What to expect on device

- **Play Protect** prompts "app hasn't been seen before" for every Morphe/
  ReVanced-style build — the APK is re-signed with a local key, so it never
  matches a Play-distributed certificate. Scan it or confirm with the screen
  lock; either path is fine, and the prompt is not related to the crash.
- If anything still misbehaves, capture the stack trace:
  `adb logcat -b crash '*:S'` and
  `adb logcat | grep -iE 'VogelkopSpoof|MainLibraryBoot|AndroidRuntime|opera'`
  — `VogelkopSpoof` now logs which CREATOR-swap route installed (or why one
  was skipped) at startup.

## Files

- `patches-1.2.2.mpp` — the release bundle (upload as the v1.2.2 release asset)
- `opera-stable-103.3.5234-patched-v1.2.2.apk`,
  `opera-beta-104.0.5262-patched-v1.2.2.apk`,
  `opera-gx-3.3.18-patched-v1.2.2.apk` — CLI-patched outputs (signed with the
  CLI's local `CN=Morphe` debug keystore; Morphe Manager on your device signs
  with its own keystore — same pipeline otherwise)
