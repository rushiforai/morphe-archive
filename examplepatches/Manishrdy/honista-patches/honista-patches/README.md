# Honista Local Patches

A local Morphe `.mpp` bundle implementing the retained changes in the workspace's `action_items.md`. One selectable patch, **Honista v13 complete local fixes**, installs all dependent changes together. This is an independent bundle; it does not require Piko.

## Supported input

Use the **original** `Honista_v13.1__x64.apk`, package `cc.honista.app`, version `426.0.0.37.70`, version code `383207254`. It contains ARM64 native libraries despite its filename.

The patch checks package/version/code and canonical DEX fingerprints of all 17 original classes it modifies. It rejects modified inputs and existing local helper classes. Future Honista versions require a port; do not force compatibility. No original APK or signing key is included in the source archive.

## Apply using Morphe Manager

1. Add `https://github.com/Manishrdy/honista-patches` as a Remote patch source, or copy `honista-patches-1.1.0.mpp` and the original APK to your phone for local import.
2. In Manager, open **Add patch source → Local → Select patch source files** and select the `.mpp`. The exact entry point can vary by Manager release.
3. Select Honista's original APK from storage. Select **Honista v13 complete local fixes** from **Honista Local Patches**.
4. Patch with Manager's default settings, then install the result using the signing-key instructions below.

Morphe Manager source supports local `.mpp` import: https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/ui/screen/home/SourceManagementDialogs.kt

## Preserve the existing installation and data

The installed local build uses `output/local-test-signing.p12` in the parent workspace. Before installing a Manager-produced APK over that app, import that same signing key into Manager's **Signing keystore** settings:

- Format: PKCS12 (`.p12`)
- Alias: `local-build`
- Key/store password: use the existing local key credentials (kept outside this repository)
- Expected certificate SHA-256: `7bd3bde00d9266a17e265aa69d9427a0b610d783208cb0e2e2e04bc0a35e2b28`

Keep this key private and outside the patches source/bundle. Android rejects an update signed with a different key. Do not uninstall or clear Honista data to resolve a signature mismatch; use the same key. Apply to the regular app in user 0, where media already works. The bundle does not change Samsung Dual App/Secure Folder storage.

Manager's PKCS12 import implementation: https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/util/KeystoreConversionUtils.kt

## Included changes

| Area | Behavior |
| --- | --- |
| Local premium features | Retains the tested local eligibility/expiry and account-screen changes; forces remove-ads/remove-suggested controls on |
| Honista advertising module | Neutralizes its six ad initialization, interaction, availability and display command adapters |
| Instagram sponsored content | Filters feed/Reels/GraphQL/ad responses, including nonempty `injected` markers used by native sponsored media |
| Suggested posts | Removes the known suggested-entry wrappers while preserving normal recommended Reels and pagination |
| Startup and module recovery | Retains static/dynamic integrity-crash neutralization, known-module substitution and launcher/init fallback |
| Compatibility fixes | Retains Android-ID exception guards, country checks and quality/profile initialization changes recorded in the action log |

There is no new media-picker patch: normal-gallery access worked after the dual app was deleted. Remaining unknown ad schemas, cached entries, and unresolved investigations in `action_items.md` remain subject to those recorded limits. This packages the implemented fixes, not a guarantee that every future ad format is blocked.

## Build and edit

The project includes Kotlin patch code, replacement method bodies in `payload-smali/` (17 source files across 15 obfuscated classes and 2 `com.instagram` classes), both helper Java sources, and the tested dynamic-module DEX asset. The full APK is not embedded. Original method annotations/register counts/exception tables are retained in the replacements; unrelated methods stay in the input APK.

Requirements: JDK 17+, Python 3 for optional helper regeneration, Android SDK platform 36/build-tools 36.1.0, and the pinned Gradle/Morphe dependencies. Set `ANDROID_HOME` and run:

```sh
./gradlew :patches:buildAndroid
# Result: patches/build/libs/patches-1.0.0.mpp
```

`buildAndroid` is required: `build`/`jar` alone produce JVM classes without the root Android patch-loader DEX. Re-run `buildAndroid` after any task that recreates the jar. GitHub Packages dependencies may require a token with read-package access on a fresh computer. Override the offline placeholders with `-Pgpr.user="$GITHUB_ACTOR" -Pgpr.key="$GITHUB_TOKEN"`; do not commit credentials. This workspace builds offline using its cached dependencies.

To edit filtering logic, change `helper-src/X/LocalSponsoredFilter.java`, run `python3 tools/rebuild_helpers.py`, then rebuild the bundle. The startup module is the frozen tested asset, matching `analysis/integrity/startup-module-patched.dex` in the parent workspace. Its original capture and rebuild scripts are documented in `action_items.md`; changing that asset also requires updating the replacement hash in `LocalModuleOverride.java`. Do not re-export baseline fingerprints from a modified APK.

For the exact local workspace, verification tasks are:

```sh
./gradlew :patches:verifyBundle :patches:verifyRejection
```

These use the parent's original/tested APKs, compare all 17 changed/added output classes and the module asset byte for byte after canonical DEX serialization, and confirm already-patched input rejection. `audit/classes.txt` and `audit/module-methods/` contain the target class list and module replacement source. Detailed logs and the local action record are excluded from Git.

## Desktop usage

```sh
java -Xmx6g -jar morphe-desktop-1.18.1-all.jar patch \
  --unsigned -p honista-patches-1.1.0.mpp \
  -o Honista-morphe-unsigned.apk Honista_v13.1__x64.apk
```

Use Desktop's default bytecode mode. On the tested Desktop 1.18.1/JDK 26 combination, `STRIP_FAST` and `FULL` succeed; explicitly selecting `STRIP_SAFE` hit an upstream `Already closed` mapped-buffer failure during DEX compilation. The default is the mode used by Manager's patcher configuration too. Unsigned output is for inspection and must be signed before installing.

## Validation

Built using Morphe patches plugin 1.3.2 and patcher API 1.5.0, then successfully loaded/patched by **official Morphe Desktop 1.18.1** using its current patcher. The default-mode output matches all 17 tested changed/added classes exactly and includes the identical module asset. A complete descriptor-based comparison checked 179,274 source classes with no unaccounted retained changes.

Android bundle loading was prepared using the official Manager 1.34.0 runtime, but could not execute because ADB reported no connected device. Manager UI import/patch/install is therefore not claimed as device-tested. No app was installed or removed during bundle creation. Earlier Android filtering tests and live observations belong to the installed build documented in section 23 of the action log.

The public repository now includes `patches-bundle.json`, which resolves the remote source to the hosted v1.0.0 MPP asset. Update that descriptor when publishing future bundle versions. Local MPP import remains available.
