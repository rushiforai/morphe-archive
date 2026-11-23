# Development and local validation

Solo Patches targets only WebNovel `com.qidian.Int.reader` **8.24.2 APKM**. Public installation and safety limits are in the [README](../README.md); contribution rules are in [CONTRIBUTING](../CONTRIBUTING.md). This page preserves the existing local lab methods. Commands below are not evidence that a newly built bundle or a GitLab release has passed those checks.

## Layout and prerequisites

- `patches/src/main/kotlin/app/saketh/patches/`: bytecode/resource patches and compatibility declarations.
- `extensions/extension/src/main/java/app/saketh/extension/`: injected Java runtime and Patch controls. Keep these internal namespaces unchanged when adjusting public branding.
- `scripts/`: offline regression checks, opt-in device probes, release preparation and the relocated `generate_patches_readme.py` catalog generator. The Kotlin patch-list generator lives under `patches/src/main/kotlin/util/`.
- JDK 21, Android SDK with `ANDROID_HOME` configured, Python 3, and the pinned Morphe Desktop CLI 2.1.1 for the recorded patching flow. Gradle's upstream plugin needs GitHub Packages read access through `GITHUB_ACTOR` and `GITHUB_TOKEN`; supply them privately in the process environment, never in tracked files or reports.

Run **one heavy job at a time**. Do not overlap Gradle, jadx or patching; the local workstation has previously exhausted memory. The current release version is `1.0.7` (the default in `build.gradle.kts`). A release tag must match the actual bundle manifest and generated patch list, not merely a renamed file.

The historical lab has this repository inside a `morphe-work` directory, with sibling `tools/`, `apk/` and `out/` directories. Those paths below describe that layout, not files shipped by this repository. Configure Java and Android SDK in your shell; the private lab environment file is not a prerequisite to share or source from unreviewed instructions. Never check in app APK/APKM inputs, patched APKs, signing private keys, credentials or device/account dumps.

## Build the bundle

From the repository root, with JDK 21 selected:

```sh
./gradlew --no-daemon --max-workers=2 -Dorg.gradle.parallel=false \
  -Dorg.gradle.jvmargs=-Xmx2g -Pkotlin.compiler.execution.strategy=in-process \
  buildAndroid --console=plain
```

The bundle is written under `patches/build/libs/`. It includes the pinned compatibility sources and their runtime dependency, HiddenApiBypass 4.3. The Java-only extension excludes `kotlin-stdlib`: packaging another copy previously generated conflicting D8 outline classes and broke the signature hook's initialization. Gradle has also reported deprecation notices for a future Gradle 10 upgrade. The imported upstream code retains deprecated Patcher APIs supported by 2.3.0. GPL, upstream notices and the Apache dependency license are packaged under `META-INF/`.

## Patch a local candidate

This single-bundle command selects the local controls and optional Firebase Analytics deactivation while leaving deferred fonts unselected. **WebNovel GmsCore compatibility** automatically includes the signature, original-certificate and GmsCore dependencies. Run from the parent `morphe-work` directory, adapting paths only to your reviewed local tools and files:

```sh
tools/jdk21/bin/java -Xmx3g -XX:ActiveProcessorCount=2 \
  -jar tools/morphe-desktop-2.1.1-all.jar patch --validate --exclusive \
  -p solo-patches-publish/patches/build/libs/patches-1.0.7.mpp \
  -e 'Hide ads' -e 'Hide popups' -e 'WebNovel GmsCore compatibility' \
  -e 'Material You colors' -e 'AMOLED dark theme' -e 'Main navigation controls' \
  -e 'Disable reader reward timer' -e 'Disable Firebase Analytics' -e 'Copy and translate' \
  -e "Hide blocked authors' books" -e 'GIF search providers' \
  -o out/webnovel-8.24.2-solo-integrated.apk \
  -r out/solo-integrated-result.json apk/webnovel-8.24.2.apkm
```

Each `-e` applies to the preceding `-p` bundle; each `-O` applies to the preceding `-e` patch. The included GmsCore patch defaults to `mainActivityName=/BaseSignInActivity;` and `gmsCoreVendor=app.revanced.android.gms`. Do not select duplicate upstream patches from another source. Start with the untouched publisher-signed **8.24.2 APKM**, never an earlier patched output. Keep the APK signing keystore private and backed up; an update needs the same package and signing key. Bundle signing and APK signing are distinct.

Only six upstream source files were imported from [rushiranpise v1.23.1, commit 92c0fca](https://github.com/rushiranpise/morphe-patches/tree/92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a): the certificate extractor, GmsCore patch/fingerprints, signature patch and two Java hooks. Original package names and attribution are retained. Local changes restrict compatibility to WebNovel 8.24.2, set its activity default and declare the finalizer's dependencies. No unrelated patch catalog or provider APK is included. [Credits](../README.md#credits) identifies direct imports separately from design references.

The integrated bundle built with Patcher 2.3.0 and patched the clean APKM with one source and automatic dependencies. That removes the earlier mixed-Patcher source requirement. Fresh device startup/login and Manager installation remain unverified for this integrated output. The previous signed two-source beta and recovery artifacts remain separate, valid evidence for their own builds, not proof for this output. A local build without the private bundle key is unsigned and must not be published as the signed release candidate.

## Startup and Google sign-in findings

Re-signing even the unchanged original APK caused this native startup error on the tested device:

```text
No implementation found for void com.qidian.QDReader.components.api.Urls.S(int)
```

The now-included **Spoof app signature** dependency extracts the untouched input's publisher certificate. Its [upstream Application hook](https://github.com/rushiranpise/morphe-patches/blob/v1.23.1/extensions/extension/src/main/java/app/template/extension/extension/SignatureHookApp.java) changes framework package-signature deserialization before native initialization. The earlier external-bundle implementation passed startup alone and with local patches. Official Morphe **Spoof signature** rewrites DEX call sites and is not the tested substitute. NPatch was an uninstalled fallback experiment, not a requirement. Certificate-pinning overrides, package cloning, installer spoofing and native-library byte edits were not used.

Signature spoofing does **not** change the APK's actual signer or the identity seen by a separate Google Play services process. See Google's [client authentication requirements](https://developers.google.com/android/guides/client-auth).

The now-included **GmsCore support (MicroG)** patch routes calls through `app.revanced.android.gms` and supplies original publisher identity metadata. The tested device already had that provider; its build provenance was not independently audited. Do not replace the provider as an assumed fix. Users must decide whether to trust it before signing in.

Keep the default `mainActivityName=/BaseSignInActivity;`: the older generic Activity fingerprint matched 230 methods, `MainActivity.onCreate` is native, and `BaseSignInActivity.onCreate` has one matching DEX implementation.

WebNovel uses classic Google Sign-In plus a server authorization-code exchange. An early microG candidate left the button inert because the SDK rejected the provider signature. After availability adaptation, the native hub rejected the rewritten inbound action. Local **WebNovel GmsCore compatibility** restores that inbound action and redirects the hub's outbound Google sign-in intent to the installed GmsCore action/package. Other outbound intents retain superclass behavior; native `onCreate` remains intact. It finalizes after the bundled GmsCore dependency and rejects builds without the expected routing change. This follows [Morphe's availability adaptation](https://github.com/MorpheApp/morphe-patches/blob/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms/GmsCoreSupportPatch.kt), scoped to this SDK.

An intermediate build opened an account picker but failed OAuth: opening the picker, reaching `app.revanced.android.gms/org.microg.gms.auth.login.LoginActivity`, or passing startup does not prove successful authentication. On 2026-11-09, the owner completed authentication and confirmed login in `webnovel-8.24.2-google-login.apk`. No assistant selected an account or approved consent. The older `webnovel-8.24.2-adblock.apk` remains known-broken for Google login. No sign-in success is fabricated and no backend exchange is bypassed.

## Prior device-validation boundary

The installed recovery baseline was `../out/webnovel-8.24.2-controls-cleanup.apk`, with matching bundle `../out/patches-1.0.0-controls-cleanup-verified.mpp`. Its nine-patch validation, startup and actual Patch controls screenshot inspection passed. The cleanup shortened descriptions and removed the informational Compatibility card; it retained the reward-loss warning. Separate Library-blocking, timer, navigation, semantic-reader/native-palette/customization bundles and the owner-confirmed Google-login APK were retained as recovery artifacts, not public downloads.

Earlier navigation checks covered all optional tabs hidden/re-shown, Profile moved to the start edge, Library/Profile reachability, persistence after cold launch and stock restoration in the same process. The navigation build passed eight-patch validation, serialized branches, constraint-bridge inspection and `check_launch.py`. Earlier semantic-reader probes checked on/off/dependency behavior on a Samsung device reporting Android API 37. This is limited device coverage, not a minimum Android requirement or a cross-device guarantee.

A Library screenshot before the popup fix showed a floating SALE box; after the fix it was absent while manual Check in remained clickable. A separate inactive `iconWelcomeGifts` node remained in the hierarchy. A free chapter exposed readable text through accessibility; an earlier reader-exit check returned to Library without a dialog. Reader screenshots were black, so reader-ad visual coverage is **not established**. Launch can restore the last reader screen; launch success does not prove Library visibility.

Purchases, rewarded ads, every reader ad placement and all server-driven campaign variants remain unverified. Server API changes or forced updates can break an old app's login. Manager multi-source selection/order, GitLab source discovery and end-to-end installation have not been demonstrated with this combination. No remote CI or deployment success is claimed.

The ten-patch `webnovel-8.24.2-solo-beta.1.apk` subsequently passed patch validation, same-key installation, startup and serialized branch checks. Its privacy probe confirmed deactivation in installed metadata and the actual Firebase measurement configuration. No new Google sign-in, purchase, rewarded-ad or network-traffic test was performed.

Comments-only push filtering is not implemented: replies and likes share a native path without a proven discriminator. Do not use unknown/localized message text to discard notifications. Prior checks did not change Android notification permission.

## Opt-in device checks

Run device commands only with the device owner's permission and an agreed recovery plan. These are interactive validation methods, not unattended CI tests. Do not inspect account/consent screens or publish captured UI content.

For an already patched installation signed with the **same** key, the recorded update method was:

```sh
# From this repository, with ANDROID_HOME configured.
"$ANDROID_HOME/platform-tools/adb" install -r ../out/webnovel-8.24.2-controls-cleanup.apk
python3 scripts/check_launch.py
```

The prior update preserved app data. A publisher-signed installation has a different signer and may reject the update. Stop on a signature mismatch; do not uninstall, clear data or log out to work around it. `check_launch.py` discards its temporary hierarchy through `/dev/null` rather than retaining screen text on the device.

Use **Profile > Settings > Patch controls** to choose each scenario before a probe. Choices save automatically. **Reopen app** recreates the activity stack, not the OS process, and does not clear data or sign out. Restore the owner's choices after testing; do not change global phone settings.

### Appearance

1. Enable app and reader Material You, then run `python3 scripts/check_customization.py --scope reader --material-you on --reader-theme on`.
2. Disable only reader Material You; run with `--material-you on --reader-theme off` to check native preset restoration.
3. Enable the reader choice again, disable app Material You; run with `--material-you off --reader-theme on` to check the parent dependency.
4. Check native app/reader light and dark modes and restore Follow System Appearance when that was the owner's prior selection.
5. For **AMOLED dark theme**, run `--amoled on --dark on`, `--amoled off --dark on` and `--amoled on --dark off` in both `theme` and `reader` scopes, and once more with Material You app and reader colors on. `--dark` fails the run when WebNovel's tracked dark mode differs, so a light-mode run cannot pass as an AMOLED check.

The `reader` scope opens the first visible Library book, so normal reading/history can update. It checks actual WTextView/page background colors, not chapter text, and requires a solid native page background and covered WTextView mode. `--scope theme` skips live book navigation. Both skip deferred font checks. The runner installs/removes only its own `app.saketh.webnovel.check` probe, restarts WebNovel without clearing data, and neither writes customization preferences nor inspects account/consent data.

Material You hooks native skin lookups, XML backgrounds and resource-ID resolution. Android 14+ reader colors use system surface/on-surface/on-surface-variant/primary roles; Android 12/13 use neutral/accent tonal equivalents. App aliases and ARGB mappings preserve alpha; reader text uses opaque roles; stateful selectors preserve states. Navigation vectors retain path alpha and selected/inactive states. Covers and downloaded app artwork stay native; reader background artwork is hidden only while the override is active, without deleting saved choices/files. Decorative gradients, bitmaps, WebView and Flutter surfaces may remain stock. This is color adaptation, not a Material 3 widget/layout replacement.

**AMOLED dark theme** shares those hooks and works without Material You. While WebNovel's dark mode is on and its switch is on, `neutral_surface`, `bottomBar_color_surface` and `reader_color_background` resolve to black, and the reader page and header replace their night color or theme artwork with black. Cards, dialogs, reader menus and Flutter/WebView screens stay stock. In dark mode it takes precedence over Material You for those surfaces.

Android references: [color roles](https://developer.android.com/reference/android/R.color#system_surface_dark), [dynamic colors](https://developer.android.com/develop/ui/views/theming/dynamic-colors), [document picker](https://developer.android.com/training/data-storage/shared/documents-files), [Typeface](https://developer.android.com/reference/android/graphics/Typeface).

### Reader reward timer

Choose **Disable reading reward timer**, close/reopen the reader, then run one explicit scenario:

```sh
python3 scripts/check_customization.py --scope timer --reward-timer disabled
python3 scripts/check_customization.py --scope timer --reward-timer native
```

The probe opens a Library book, checks the controller/widget and native interval registry, waits three seconds, then checks native progress or disabled absence. The disabled scenario exercises both native refresh entry points to ensure they cannot recreate the controller. It does not fabricate activity/rewards, but normal foreground reading/history effects can occur. The patch blocks both controller-creation paths and tears down an existing controller on resume through native cleanup; independent reading statistics continue. Timer-based rewards stop while disabled. Battery savings are unproven.

### Library promotions and popups

Choose **Hide ads**, then run one matching scenario:

```sh
python3 scripts/check_customization.py --scope library --ads hidden
python3 scripts/check_customization.py --scope library --ads native
```

This opens the real main Activity directly, avoiding unrelated splash duration, and selects Library without opening a book. It checks both recommendation views while retaining books and manual Check in. Native restoration requires the server to supply both placements. The patch uses native no-promoted-book/no-daily-banner paths, blocks cached promoted-slot reinsertion, and preserves daily/task payload and market data.

For popup regression: open Library and wait for network content; confirm the SALE gift-box is absent and manual Check in remains; open a free chapter and return to Library without an exit promotion. Do not attach chapter screenshots or accessibility dumps to reports.

### Navigation

The Navigation card offers **Reorder tabs**, per-tab visibility and **Reset to stock**. Choose a tab, then its position. Apply on return to the main screen and verify after relaunch. Positions follow start/end direction, not absolute left/right. Library and Profile cannot be hidden. Writing remains subject to native language/server availability and promotional replacements. Reset clears only navigation preferences, not account, theme, fonts or app data.

## Offline regression methods

The branch checker catches malformed serialized DEX jump destinations that previously caused a reader-exit `VerifyError`. It covers reader, text, skin, native color/navigation consumers, reader-exit popup handling and the Google hub. It is not a replacement for Android's verifier or UI checks.

```sh
../tools/jdk21/bin/javac -cp ../tools/morphe-desktop-2.1.1-all.jar \
  -d /tmp/webnovel-branch-check scripts/CheckPatchBranches.java
../tools/jdk21/bin/java -Xmx512m -XX:ActiveProcessorCount=2 \
  -cp ../tools/morphe-desktop-2.1.1-all.jar:/tmp/webnovel-branch-check \
  CheckPatchBranches ../out/webnovel-8.24.2-controls-cleanup.apk
```

The standalone navigation policy check covers all 120 tab orders, malformed saved order, hidden-tab combinations, pinned reachability and native availability:

```sh
../tools/jdk21/bin/javac -d /tmp/webnovel-navigation-check \
  extensions/extension/src/main/java/app/saketh/extension/navigation/NavigationPolicy.java \
  scripts/NavigationPolicyCheck.java
../tools/jdk21/bin/java -Xmx512m -XX:ActiveProcessorCount=2 \
  -cp /tmp/webnovel-navigation-check NavigationPolicyCheck
```

The README generator check runs without changing release files:

```sh
python3 scripts/check_readme_generator.py
```

It checks literal backslashes, description/version-column alignment and preservation of surrounding README text. The human-written landing page need not be replaced by a generated catalog.

The optional catalog command is `python3 scripts/generate_patches_readme.py solo-patches/solo-patches main patches-list.json README.md`. It requires `PATCHES_START`/`PATCHES_END` HTML-comment markers; the concise landing page deliberately has none, so do not run it there unchanged. The isolated regression check supplies its own marked document.

The patch-list generator requires exactly one non-source/non-javadoc `.mpp` in `patches/build/libs/`, reads its real manifest, and rejects ambiguity or a missing `Version` before replacing metadata. After building, its isolated regression check needs the actual bundle, CLI and a Gson JAR on the JVM classpath:

```sh
python3 scripts/check_patch_list_generator.py 'patches/build/libs/patches-1.0.7.mpp:../tools/morphe-desktop-2.1.1-all.jar:/path/to/gson.jar'
```

Both generator checks use temporary directories and neither publish nor modify the repository's generated metadata.

## Deferred fonts

The retained implementation supports private UI/reader TTF/OTF imports, previews and resets, but further font work is paused. The font-file boundary check was run before that pause:

```sh
../tools/jdk21/bin/javac -d /tmp/webnovel-font-check \
  extensions/extension/src/main/java/app/saketh/extension/fonts/FontFile.java \
  scripts/FontFileCheck.java
../tools/jdk21/bin/java -cp /tmp/webnovel-font-check app.saketh.extension.fonts.FontFileCheck
```

If font work resumes, the full device probe accepts `--ui-font original|custom` and `--reader-font original|custom` to require explicit persisted scenarios. Assertions compare exact glyph rasters and advance widths, not Typeface object/native-handle identity. Do not present retained code as freshly validated font support.

## Optional Firebase Analytics patch

**Disable Firebase Analytics** is unselected by default and has no runtime switch. It sets the application's `firebase_analytics_collection_deactivated` manifest metadata to `true`, using [Firebase's documented Android deactivation control](https://firebase.google.com/docs/analytics/android/configure-data-collection#permanently_deactivate_collection). Repatch clean input with or without this patch to change it; removing the flag does not override native consent or saved Analytics preferences.

The patch does not remove Firebase Auth/FCM or touch Facebook, AppsFlyer, Knobs, native anti-tamper reports, independent reading accounting, purchases or reward enforcement. It is not a general tracking blocker or anti-ban measure. Source-level scope is not evidence of runtime/network traffic reduction; the prior nine-patch recovery baseline did not include it. In the CLI, select `-e 'Disable Firebase Analytics'` after the local bundle's `-p`, never after the external bundle.

The opt-in device probe accepts `python3 scripts/check_customization.py --scope privacy --firebase-analytics disabled` or `--firebase-analytics native`, matching the build being tested. It checks manifest metadata and the SDK's real configuration without writing account or customization preferences. The disabled check passed on the ten-patch beta APK after failing on the preceding build. Network traffic reduction still needs separate evidence.

## Publish a release

Releases are built, signed and published from a maintainer's machine. Morphe Manager reads root `patches-bundle.json` on `main`, then downloads its `download_url`, so the release asset must exist before `main` points at it. Bundle signing in pinned plugin 2.1.0 uses an **embedded ZIP-comment signature**. `morphe-signing.pub` is the public verification key; keep the private key out of the repository and release assets, and never regenerate it for an ordinary release.

Run from the repository root, with `VERSION` set to the new version (for example `1.0.0`):

```sh
# 1. Build, sign and verify. MORPHE_SIGNING_KEY holds the private bundle-signing key.
MORPHE_SIGNING_KEY="$(cat /path/to/morphe-signing.key)" ./gradlew -PreleaseVersion=$VERSION \
  :patches:clean :patches:buildAndroid :patches:generatePatchesList \
  :patches:checkPatchListGenerator :patches:checkBundleSignature

# 2. Stage the release files into a new, empty dist/.
python3 scripts/prepare_release.py --tag v$VERSION \
  --project-url https://gitlab.com/solo-patches/solo-patches \
  --bundle patches/build/libs/patches-$VERSION.mpp \
  --patch-list patches-list.json --public-key morphe-signing.pub --notes CHANGELOG.md
cp dist/patches-bundle.json patches-bundle.json

# 3. Commit patches-bundle.json and patches-list.json, tag v$VERSION, push only the tag.
# 4. Upload the files and create the GitLab release (GITLAB_TOKEN: token with `api` scope).
GITLAB_TOKEN=... python3 scripts/publish_release.py --tag v$VERSION

# 5. Push main. Manager now sees the new version.
```

`:patches:checkBundleSignature` runs Morphe Patcher's real verifier and rejects tampered, unsigned and wrong-key bundles. `prepare_release.py` checks version, signer and patch-list agreement, writes `patches-$VERSION.mpp`, `morphe-signing.pub`, `patches-list.json`, `patches-bundle.json`, `SHA256SUMS` and `release-notes.md`, and never overwrites existing output. `publish_release.py` uploads those six files to the public generic package `solo-patches/$VERSION`, verifies anonymous downloads, creates the release with `direct_asset_path` links and refuses to modify an existing release. No app APKs are published.

## GitLab maintainer setup

The destination is https://gitlab.com/solo-patches/solo-patches. The local `origin` points there. Preserve the remote's initial commit. Use normal fast-forward pushes or reviewed merge requests. Do not force-push over `main`.

1. Protect `main`. Disable merge-request access to protected CI resources.
2. Configure protected GitHub Packages read credentials as `GITHUB_ACTOR` and masked/hidden `GITHUB_TOKEN`. The upstream Gradle plugin still requires GitHub Packages even though this project is hosted on GitLab.
3. Keep package downloads public.

Merge-request jobs run credential-free Python checks. Protected default-branch builds compile patches and regenerate the patch list. These jobs share a heavy-work lock and bounded Gradle settings.

## Community directory and Add to Morphe

The [community directory](https://morphe-patches.software/#submit) accepts public GitHub or GitLab repositories through **Submit a bundle**. Its form checks the default branch, then `main`, `master` and `dev`, for a nonempty `patches-list.json`. Generate the catalog from the actual bundle and publish it with the source before submission. Submit `https://gitlab.com/solo-patches/solo-patches`, identify yourself as the maintainer, and describe the supported WebNovel target. The form has optional email/notes and may require a CAPTCHA. No submission was made during local preparation. Directory maintainers decide inclusion.

Publish and verify the matching signed `.mpp`, immutable download URLs, public key and root `patches-bundle.json` before advertising installation. Test Manager source discovery and the integrated app's startup/login separately. A directory entry does not make Solo Patches part of the pre-installed Morphe source and does not establish Morphe review or endorsement.

The README follows [hxreborn's header/badge pattern](https://github.com/hxreborn/morphe-patches) and [rushiranpise's installation, patch-list, FAQ and credits structure](https://github.com/rushiranpise/morphe-patches). The Add to Morphe button uses the documented GitLab deep link `https://morphe.software/add-source?gitlab=solo-patches/solo-patches`. This is an install link, not an approval badge. It needs no directory approval, but installation cannot succeed until the referenced release assets exist. See [Morphe's source guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md#remote).
