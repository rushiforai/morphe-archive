# Santodan Patches

An independent patch bundle for **Morphe Desktop**, targeting Peafowl Theme Maker
`GMS_27.5.1`, package `h7.hamzio.emuithemeotg`.

Patch: **Peafowl - Unlock Theme Ownership (Experimental)**.

Build the bundle with the official Morphe Gradle project, then import the generated
`patches/build/libs/patches-<version>.mpp` into Morphe Desktop or Manager.

## Apply and test

1. Disable/remove the old `0.1.0` source, then import the generated `.mpp`
   under `patches/build/libs` as a local patch bundle in Morphe Desktop.
2. Select the original Peafowl `GMS_27.5.1` APK and enable the patch above.
3. If you also want the general Pro features, enable Nai64's **Unlock Premium**.
4. Build and sign the APK with Morphe, then install it using your usual process.
5. Open a theme that previously showed `RE_ISOWNED`. Check the normal theme action,
   theme download/export/apply, and repeat after restarting the app.

Pairip Bypass and Free In-app Purchases are not dependencies. Start from the
original APK for each build; this patch deliberately rejects an already modified
theme initialization. Preserve your current Morphe signing key if you want to update an
installation signed with that key.

Morphe should report `Applied: Peafowl - Unlock Theme Ownership (Experimental)`.
The new build logs `SantoDan 0.1.1: routed theme initialization through the existing free-theme path`.
An unsupported layout raises an error instead of silently succeeding.

## Build

The repository now follows the official Morphe Gradle template. Local dependency
resolution requires GitHub credentials with access to Morphe's package registry.

From this folder in PowerShell:

```powershell
.\gradlew.bat :patches:buildAndroid
.\gradlew.bat :patches:generatePatchesList
```

The Android-compatible MPP is written to `patches/build/libs`. Use Java 21, matching
the release workflow. `patches-list.json` is generated from the compiled bundle.

## Scope and implementation

Version 0.1.0 modified the successful customer-info callback. Device testing exposed
`RE_ISOWNED`: the preceding theme-offerings request can fail before that callback
ever executes. Version 0.1.1 replaces that strategy.

The matcher now finds the theme initializer's `sku.equals("free")` decision, its
paid-theme boolean, the RevenueCat offerings branch, and the alternative
`Handler.post(Runnable)` free-theme setup. It requires exactly one matching layout
in `ThemePreviewActivity`; the obfuscated method name is not hard-coded.

One `move-result` becomes a same-width `const/4 <original-register>, 1`. The existing
code clears the paid-theme flag and takes the free-theme branch. This preserves
the original SKU, theme data, and asynchronous UI setup while skipping the theme
offerings/customer-info preflight entirely. It does not merely hide its error.
Register counts, branch offsets, exception-handler layout, and other classes are
preserved. There are no resource edits or app extensions.

This changes local theme access. It does not create a Google Play purchase,
change RevenueCat account records, or supply server-protected theme downloads.
Other network operations remain. Device testing is required to establish whether
the complete download/apply flow works.

## Verification

The verification programs under `patches/src/test/java` check a real input DEX for a unique match, reject
unrelated/ambiguous/changed/already-patched input, verifies one equal-width
replacement, and writes/reloads a patched DEX. The regression check interprets the
actual classification instructions for both paid and free SKUs: both must skip
the offerings request and retain the native asynchronous theme setup. It also
loads the resulting bundle with Morphe's `list-patches` command.

Version 0.1.1 was additionally applied alone to the original APK using Morphe's
default `STRIP_FAST` mode. Patching and rebuilding passed. That unsigned build is
an inspection artifact under `build/verification-0.1.1`, not an installable release.

Only `src/main/java` is packaged. Test code, the original APK, the Morphe JAR, and
build dependencies are not redistributed in the bundle.
