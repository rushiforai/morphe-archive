# Vogelkop patches v1.2.1 — sandbox verification report

Date: 2026-11-08 · Environment: headless Linux sandbox (no Android runtime — see
"Waydroid" below) · Toolchain: **Morphe Desktop CLI v2.1.1** (the real release
jar), Morphe Patcher 2.3.0, bundle `patches-1.2.1.mpp` (Ed25519-signed, SHA-256
`bbfc11d839e7f63dc64c3f3b5daae79c42b43c9ec951a49158034078776b5918`).

## The v1.2.0 crash, root-caused

Every app patched with v1.2.0 crashed at startup (black screen, app closes)
because the signature-spoof extension was compiled against hand-written
Android stubs whose API shape did not match the real framework. The shipped
extension dex contained:

```
Landroid/util/Base64;->INSTANCE:Landroid/util/Base64;   ← no such field
Landroid/util/Base64;->decode(Ljava/lang/String;,I)[B   ← called as instance; real method is static
Landroid/content/pm/PackageInfo;->getPackageName()Ljava/lang/String;  ← no such method (public field)
Landroid/content/pm/PackageInfo;->getSignatures()[Landroid/content/pm/Signature;   ← no such method
Landroid/content/pm/PackageInfo;->getSigningInfo()Landroid/content/pm/SigningInfo; ← no such method
```

These throw `NoSuchFieldError`/`NoSuchMethodError` inside
`SignatureHookApp.<clinit>` (which runs before any app code), i.e.
`ExceptionInInitializerError` at process start — before the first pixel is
drawn. Found mechanically with the new `tools/AuditExtDex.java`, which
resolves every `android/*` reference of a dex against the real framework.

## Fix

`tools/build_extension.sh` now compiles the extension against the real Android
framework (Robolectric's `android-all` AOSP build) instead of stubs, and runs
the audit as a build gate. Post-fix audit: **4 class refs, 7 method refs,
5 field refs into android/* — all valid; zero problems.**

## Patching all three apps with the Morphe Desktop CLI

`java -jar morphe-desktop-2.1.1-all.jar patch -p patches-1.2.1.mpp <app>.apkm`

| App (APKM input) | Patches applied | Result |
|---|---|---|
| Opera stable 103.3.5234.91185 (vc 1910312306) | 7/7 | ✓ 11.4 s |
| Opera Beta 104.0.5262.91143 (vc 1910404306) | 7/7 | ✓ 11.8 s |
| Opera GX 3.3.18 (vc 199) | 3/3 | ✓ 5.2 s |

Per-patch details (Beta): whitelists neutralized 2 (`97bda3c5…`, `f66a1f2c…`);
ad modules 3/3; **analytics 80 const-strings + Leanplum's
`Constants.API_HOST_NAME` static field = 81 constants** (app-measurement x6,
googleadservices x10, doubleclick x45, pagead2.googlesyndication x13,
imasdk x6, api.leanplum x1); boot-failure announcements rewritten 2/2 on the
`"MainLibraryBoot: "` coordinator; SQL 3/3; signature spoof attached to
`OperaApplication` + `LeanplumApplication`. GX: analytics 8 constants,
sponsored tiles −77 entries across 23 topSites JSONs, spoof attached.

## Output verification

| Check | stable | beta | GX |
|---|---|---|---|
| Stored entries 16 KiB/4 B aligned (`.so`, `resources.arsc`) | ✓ (20) | ✓ (19) | ✓ (13) |
| `libopera.so` byte-identical to input (CRC) | ✓ | ✓ | n/a (WebView app) |
| Only expected entries differ from base (manifest, merged arsc, patched dex, 2 whitelist assets) | ✓ | ✓ | ✓ |
| Live tracker endpoint refs remaining in dex | 0 | 0 | 0 |
| Patched SQL parses in SQLite (`… WHERE 0 [LIMIT 1]`) | ✓ | ✓ | n/a |
| Manifest: `OperaApplication`, `extractNativeLibs=false` kept, split requirements removed (standalone-installable) | ✓ | ✓ | ✓ |
| APK signature (apksig, platform 29) | ✓ v2 | ✓ v2 | ✓ v2 |
| `android/*` refs in the modified dex (AuditExtDex) | 0 unresolved | 0 unresolved | 0 unresolved |
| `Base64.decode` in final `SignatureHookApp` | static call ✓ | static call ✓ | static call ✓ |
| Bundle: dex present, `MorpheSig1` Ed25519 signature valid, name "Vogelkop patches", version 1.2.1 | ✓ | ✓ | ✓ |

## Why no Waydroid runtime test

The sandbox is an unprivileged Docker container: no `binder`/`binderfs`
(`grep binder /proc/filesystems` is empty, `/dev/binder*` absent), no KVM
(`/dev/kvm` absent), no root (sudo unavailable). Waydroid fundamentally needs
LXC + binder kernel support, and an x86 emulator without KVM is not viable in
CPU time. Android runtime testing therefore has to happen on your device —
which is where the crash was reported from anyway. The static + mechanical
verification above covers everything that is checkable without booting
Android; the remaining unknown is whether Opera's first-run flow behaves with
the (now correct) signature spoof, which only a real device can answer.

If anything still misbehaves on device, capture:
`adb logcat -b crash '*:S'` plus
`adb logcat | grep -iE 'MainLibraryBoot|AndroidRuntime|opera'` — the
MainLibraryBoot coordinator logs its failure reason (`LIB_LOAD` /
`CHROMIUM_START` / `EMULATED_ARM`) with the throwable.

## Files

- `patches-1.2.1.mpp` — the release bundle (upload as the v1.2.1 release asset)
- `opera-stable-103.3.5234-patched-v1.2.1.apk`,
  `opera-beta-104.0.5262-patched-v1.2.1.apk`,
  `opera-gx-3.3.18-patched-v1.2.1.apk` — CLI-patched outputs (signed with the
  CLI's local `CN=Morphe` debug keystore; Morphe Manager on your device signs
  with its own keystore — same pipeline otherwise)
