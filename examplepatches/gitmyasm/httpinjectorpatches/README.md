# HTTP Injector Pro Patches

Morphe patches for `com.evozi.injector` version `6.5.0` (versionCode `244`).

## Add to Morphe

Manual source URL:

`https://github.com/gitmyasm/HttpInjectorPatches`

Or tap this link to add it directly:

`https://morphe.software/add-source?github=gitmyasm/HttpInjectorPatches&name=HTTP%20Injector%20Pro&app=com.evozi.injector`

The published bundle is available from the [v1.0.3 release](https://github.com/gitmyasm/HttpInjectorPatches/releases/tag/v1.0.3).

## What the patch does

- Applies the 40-byte Pro unlock directly to the app's original `libevozi_sentinel.so`.
- Replaces `libDexHelper.so` with the premium version so the anti-tamper helper loads.
- Bundles `libdexfix.so` with only the single toast-displaying JNI call replaced by a NOP. All anti-tamper logic is left intact, so the helper still works and the app does not crash.

There is no `Mod By :MafiaSSS` toast and no modded sentinel library.

Patch the original HTTP Injector `.apks` bundle. Morphe merges the split APKs and writes a single patched `.apk`.

Server-side account/purchase features still depend on Evozi's servers.
