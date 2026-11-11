# Patch 01 — Disable "Spoof app signature" (CRASH FIX)

## Status

**REMOVED from the active patch set in v1.3.1.**

## Background

The v1.3.0 "Spoof app signature" patch rewrote the `.super` directive of two
Application classes to point at a custom `SignatureHookApp`:

* `com.opera.android.OperaApplication` (`smali_classes3/com/opera/android/OperaApplication.smali`)
* `com.leanplum.LeanplumApplication` (`smali_classes3/com/leanplum/LeanplumApplication.smali`)

Both originals extend `Landroid/app/Application;`. The patch swapped them to
`.super Lcom/.../SignatureHookApp;` so that `SignatureHookApp`'s overridden
`getPackageInfo` would feed a hardcoded original Opera signature to any caller
that asked.

## Why it crashed

The bisect matrix in v1.3.0 (ladder rungs B0–B3, C1, C2) conclusively
isolated the crash to this patch:

| Rung | Contents | Boots? |
| --- | --- | --- |
| B0 | merge + sign only (v1+v2+v3) | yes |
| B2b | Morphe with all patches disabled | yes |
| B3 | diagnostics-only patch | yes |
| B1 | all feature patches | **no — instant SIGSEGV** |
| C1 | all feature patches **minus spoof** | **yes** |
| C2 | spoof + diagnostics only | **no — instant SIGSEGV** |

Failure of an `Application` subclass to call the proper `Application` lifecycle
(`attachBaseContext` / `onCreate` / `registerComponentCallbacks` etc.) is a
classic signature of an instant process death on Android — the runtime cannot
even reach `ActivityThread.main`. The `SignatureHookApp` parent swap broke the
Application lifecycle chain for both classes; the moment Android tried to
instantiate `OperaApplication` (named in `<application android:name=…>` of the
manifest), the process died.

The signing pipeline (v1+v2+v3, keystore `morphe.keystore`), the merge step,
and the diagnostics patch were all exonerated by the matrix above.

## v1.3.1 decision

**Drop the spoof patch entirely.** Rationale:

1. The user is sideloading the patched APK; Google Play Billing is not in use,
   so signature spoofing buys nothing functional for the v1.3.1 use case.
2. Opera Beta does not gate first-party features behind a self-signature check
   that would require spoofing.
3. A safe, runtime-level signature hook (LSPatch-style proxy Application) is
   out of scope for static APK patching — it needs an `app_component_factory`
   redirect plus a proxy Application, which is a separate project.
4. C1 (every other feature patch minus spoof) is verified to boot.

## What to do in the build

* Do **not** apply any patch under `SignatureHookApp`, `OperaApplication.super`,
  or `LeanplumApplication.super`.
* Keep `OperaApplication` and `LeanplumApplication` extending
  `Landroid/app/Application;` exactly as the original APK ships them.
* No manifest changes related to signature spoofing.

## Future work (out of v1.3.1 scope)

If signature spoofing is ever needed (e.g., to keep Google Play Billing working
on the patched APK), the right approach is a **`androidx.core.app.AppComponentFactory`
redirect** that intercepts `Application` instantiation and returns a proxy
whose `getPackageManager().getPackageInfo(...)` is hooked via reflection. This
preserves the original Application class hierarchy and only patches the
signature lookup, not the Application lifecycle.

That is a separate patch design and should land in v1.4.x at the earliest,
after a fresh bisect cycle.
