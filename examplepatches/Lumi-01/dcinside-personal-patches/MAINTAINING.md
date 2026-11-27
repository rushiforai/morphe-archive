# Maintaining the DC Inside patch

## App-version checklist

1. Obtain the updated original APK yourself. Record its SHA-256, package name, version name/code, minimum Android version, and native ABIs.
2. Decompile with JADX and Apktool. Compare the methods in `DcInsidePatch.kt` with the new APK. Replace brittle names with verified fingerprints when the app changes; never bypass a failed fingerprint by patching an arbitrary first match.
3. Check `lib/*/libnative-lib.so` for the two `java/security/MessageDigest` references. Their replacement must preserve byte length. Review native app-identity behavior before adding new ABI paths.
4. Confirm every edited XML ID exists and every edited method has the expected signature and semantics. Recheck `PostReadHeaderView.Y`, the shared author span builder `span/g.t`, and `read/V.b` before carrying author or auto-image hooks forward. The metadata hook belongs at the start of `Y`: inserting it just before its final return is skipped by a branch targeting that return.
5. Build `.mpp` with JDK 21 and Morphe's `read:packages` prerequisite. Test it against the original APK with Morphe Desktop or Manager. Verify the output APK's signature and install on Android 11+ and 15+.
6. Check startup, login, login persistence, gallery lists, search, post body, images/video, comments, post/comment composition, push, automatic backup, and remote config online/offline. Do not post to a public gallery merely for regression testing unless explicitly authorized.
7. Add a newly tested `AppTarget` and record results. Keep unknown releases experimental and fail closed when anchors change.

## Patch layout

- `patches/src/main/kotlin/dev/lumi/dcinside/DcTarget.kt`: exact version-specific class/member/field mappings and page-label resource IDs. A reused obfuscated name can mean a different method in another version; never enable arbitrary versions.
- `patches/src/main/kotlin/dev/lumi/dcinside/DcInsidePatch.kt`: package/version compatibility, binary and XML edits, method fingerprints and bytecode edits.
- `patches/src/main/kotlin/dev/lumi/dcinside/DisplayOptionsPatch.kt`: optional home-section and page-indicator changes. Each hard-coded item type and method must be rechecked for a new app version.
- `extensions/extension/src/main/java/local/privacy/HomeFilter.java`: filters home adapter items according to current in-app Morphe choices; on a changed item class it leaves the item visible.
- `extensions/extension/src/main/java/local/privacy/PageIndicator.java`: hides the verified page separator views.
- `extensions/extension/src/main/java/local/privacy/AutoImageFilter.java`: optional leading auto-image heuristic, off by default. Recheck the actual post HTML marker on an updated app; ordinary upload images must remain visible.
- `extensions/extension/src/main/java/local/privacy/AuthorInfo.java` and `IpInfo.java`: optional local author IDs and all matching community IP-prefix labels. The post header shows the ID beside the nickname and expands the existing IP/range text in place; do not add an external lookup.
- `extensions/extension/src/main/java/local/privacy/WebResourceBlocker.java`: Naver analytics source toggle and narrow WebView fallback for known analytics/ad hosts. Recheck the constructor of `wv/l` and its script-insertion guard after each app update. Never block all Naver hosts.
- `extensions/extension/src/main/java/local/privacy/SignerCompat.java`: runtime certificate lookup and narrowly scoped compatibility.
- `extensions/extension/src/main/java/local/privacy/MessageDigest.java`: JNI-facing digest delegate.
- `patches/build/libs/*.mpp`: generated bundle, never handwritten.

The official app, its decompiled original, account data, and signing keys belong outside this public repository. A separate private maintenance repository stores the full decompiled baseline and the manually rebuilt APK.

## Feature-parity status

The manually rebuilt version includes additional native and UI adjustments. This Morphe bundle now includes the Firebase analytics flags, remote-config fallback, and an optional redundant-refresh limiter, but must be independently verified for feature parity. The limiter defaults to off because suppressing refresh can defer changed server settings. Preserve login and content APIs when extending it.

The 1.0.1 bundle was applied to the 5.3.6 original APK and installed on Android 11 and 15 emulators. Home and post body loaded on both; gallery list and comments loaded on Android 11, and the recent-gallery hide option removed that home section. An earlier build changed a boolean register used later by the app's Realm configuration and broke post opening; replacing the Crashlytics enable call with `nop` preserved the register and fixed the same post on both emulators. The login screen opened earlier; account authentication and post/comment submission were not performed with this bundle. Keep 5.3.6 experimental until those and real-device behavior are checked.

For 1.1.2, the final APK was installed on Android 11 and 15 emulators. Android 11 rendered a supplied account ID and a masked IP with its offline range label on separate post-header lines. Android 15 displayed the first Morphe setting without clipping. Automatic-image detection on a known auto-image post, account login, and post/comment submission were not reverified for this bundle.

For 1.1.3, `collapse_long_ip_info` defaults on. Android 11 verified that the masked IP and the beginning of the offline range description stay on the nickname line; the right-side button expands and collapses that same text. A registered author's ID appeared beside the nickname without an `아이디` label. On Android 11, temporary host-only logging showed requests to `wcs.naver.net` and `wcs.naver.com` when the Naver toggle was off, and no such requests on a loaded post when it was on. The final bundle omits this diagnostic logging. The patch suppresses both script tags in `wv/l` before WebView loading and keeps a narrow intercept fallback. The default is on. The residual web ad switch is also on by default, but no residual ad host was observed in that test; do not claim complete network-level ad removal. The final APK was installed on Android 11 and a fresh Android 15 emulator. On Android 15, the top Morphe setting was visible and a post body loaded without an app crash. Neither emulator test quantified network latency or battery life.

For 1.1.1, retest the optional auto-image switch against both an actual auto-image post and an ordinary first image. The heuristic requires a DC Inside `viewimage.php` URL, a long hex `alt` marker, and no upload-file marker on the first image. If the server changes the markup, leave the image visible until a reliable new marker is confirmed. IP prefix labels may be numerous; the app's one-line list layout may ellipsize the visible text even though all known labels are appended.

For performance and battery, source suppression of the two Naver scripts avoids their WebView work and follow-on analytics requests. The auto-image HTML scan avoids copying and lowercasing the entire post body. The repeated remote-config refresh limiter remains opt-in because it can delay server changes. Intermittent network stalls were not reproducibly isolated in the emulator; measure on a real device before making broad background-work changes or claiming a quantified battery gain.

The [Ample bundle](https://github.com/AmpleReVanced/revanced-patches) currently marks DC Inside 5.3.4 as its target. This repository ports only the ad-dimension idea, home-section choices, and page-label hiding after 5.3.6 verification. Its gallery watch, DCCon loading, memo, author identifier, and history-filter features need separate runtime and layout checks before adoption. Gallery watch can increase refresh activity and battery use, so do not enable it as a battery optimization.

## Release maintenance

Generate source metadata with `python scripts/bundle-metadata.py --release v<VERSION>`, push it to both `main` and `dev`, then run `python scripts/bundle-metadata.py --remote`. Morphe's prerelease source option selects `dev`; it does not select GitHub releases by prerelease flag. Both branches currently publish the same experimental bundle. This validator checks strict ISO date strings, the public asset/digest and internal MPP version; do not use shell locale conversions for `created_at`. See `AGENTS.md` for the required publication procedure.

For 1.1.5, only extension overhead was reduced: optional list/comment ID getters, IP validation pattern construction and WebView preference reads for unrelated hosts. No vendor lifecycle, refresh interval, content API or layout was changed. Runtime regression tests, original-APK patch application and CPU measurements were intentionally skipped at the user's request. Retest these before treating 1.1.5 as verified; compilation alone establishes neither runtime compatibility nor a measured CPU reduction.

For a manual release, update `version` in `gradle.properties`, build with `buildAndroid generatePatchesList`, upload the resulting `patches-<version>.mpp` to the matching `v<version>` GitHub release, and update `patches-bundle.json` with its URL, version and UTC creation time. Use `yyyy-MM-ddTHH:mm:ss` without a trailing `Z` for `created_at`; Morphe Manager 1.34.0 rejects the `Z` suffix and reports `Metadata N/A`. Check the released asset hash against the locally built bundle, then confirm Morphe Manager can read the repository as a patch source. The optional release workflow is manual-only (`workflow_dispatch`); it must not be used on top of a release already created by hand.

## 1.2.0 / 5.3.18 port

Original 5.3.18: versionCode 100187, min SDK 23, target SDK 36, SHA-256 `4a52133fa826f80a296c0c4a6ffaf21caa6d8106cc8b7814ecb9c068ac54693e`. Official signing certificate SHA-256: `e6b27144a27660b1e00608fa45d319065d97d0a71fb54b8ca1756e8346ec29dd`. Original APKs and decompiled analysis stay outside this repository.

Reviewed mappings include the WebView client/builder, Remote Config class and callback types, ad loader methods, footer binding fields, RecyclerView item field, home list update, page separator ID and author model getters. `AuthorInfo.configure` and `RemoteConfigFallback.configure` select reflective getter names once at process startup. Firebase config-value source changed from `Q()` to `R()`; leaving the old reflection would silently disable cached-config fallback. The Naver script hook additionally validates the actual boolean parameter register. The fetch callback uses its actual move-result register.

The final 1.2.0 bundle built and applied all four patches to both original 5.3.18 and 5.3.6 APKs. Signed output verification passed for 5.3.18. These checks establish patch generation, not complete runtime behavior or Android 17 compatibility. No CPU or battery measurement was performed for this compatibility port.

Android 15 emulator smoke check (2026-10-23): installed the signed 5.3.18 output, loaded the home list and a post body, opened the native settings and the in-app Morphe screen (first option visible), and enabled home search/menu hiding. The home search/menu section disappeared on return. Crash buffer remained empty. This did not cover authenticated login, writing, Android 17, every optional switch, or every possible ad placement.

## 1.2.1 rendering overhead

The author hook now passes the original getter result into the extension. It validates that receiver/result are distinct and fit the two-register invoke form on both reviewed APKs. Do not overwrite the model receiver or call the nickname getter twice. Header view resource IDs are cached per process; disabled author options still clear the recycled expand button and invalidate pending work but skip reflection/posting. Home filtering returns the original list if no row is removed, preserving ordering and leaving the input untouched.

Run `python scripts/check-render-work.py` with `JAVA_HOME` and `ANDROID_HOME` set. Its host checks use the Android SDK API jar plus a test-only preference fixture: 20,000 disabled-ID formatting calls invoke no model getter; enabled ID labels use both version mappings; home filtering preserves identity when unchanged, order, null/unknown rows and input contents. It does not emulate Android layout or measure CPU. Both original APKs must still pass actual Morphe application.

1.2.1 Android 15 smoke check: signed 5.3.18 APK updated successfully; home and post body loaded; comment screen displayed names, masked IPs and comment content; crash buffer stayed empty. Host checks cover enabled IDs; enabled-ID Android layout and authenticated workflows were not rechecked in this release. No percentage CPU measurement was made.

## 1.2.2 / 5.3.20

Original APK: versionCode 100191, SHA-256 `88cc3662f1002e95fe819025c13908ca7539565ce5e9e91c839cdd25756be7d6`, verified with the same official certificate as 5.3.18. The app classes containing all hooks were compared with 5.3.18; they are identical except IntroFragment startup version strings. The supplied APK's resource table and edited layout entries are unchanged. This is an explicit reviewed target addition, not an unconditional newer-version match.

1.2.2 verification: bundle built; all four patches applied to original 5.3.20 and produced a signed APK. Android 15 emulator update installation succeeded, post body/header loaded, and crash buffer was empty. Login, posting and physical Android 17 were not retested.

## 1.2.3 version-number gate removal

Wildcard experimental metadata permits attempts on other app versions. `DcTarget` selects the legacy 5.3.6 mapping only for that exact version; otherwise it tries the reviewed 5.3.20 mapping. Every current-profile fingerprint also compares `MethodShape.digest` with `reviewed-methods.properties` (51 reviewed methods). The SHA-256 shape includes method signature/access, register count, instruction opcodes/operands/references/literals/branch offsets, payloads and exception handlers. The check runs only while patching, not inside the target app. No vendor method body is shipped. Model getters used by reflection are explicitly checked for unreviewed app versions.

To review an update, compare the actual target semantics before updating hashes. `MethodShape.main` can generate candidate hashes from a local APK and a file of class descriptors; retain only deliberately reviewed target methods in the resource. Never regenerate/accept hashes merely to suppress a failure. Unknown native or resource behavior can still require a new port even when method shapes match.

Validation: all four patches applied to original 5.3.20. A private copy of the bundle with the onCreate hash deliberately corrupted failed at the fingerprint and produced no output APK. Runtime DEX, native libraries, resources, assets and manifest in the final output are byte-identical to the 1.2.2 output already smoke-tested on Android 15. No repeated runtime or CPU test was needed for this patch-time-only change. Arbitrary future app versions were not runtime-tested.

## 1.2.4 preference snapshot

`SettingsState` caches its 14 known boolean options in a volatile bit mask. Home bits occupy the first six positions. The strong static preference listener reloads the snapshot on external changes or a clear/null-key event; `set` publishes the changed bit before returning. Unknown keys still use SharedPreferences. This removes repeated API locking/map reads, not presumed disk I/O on every get. Run `scripts/check-settings-cache.py` with JAVA_HOME/ANDROID_HOME: 60,000 hot reads caused no preference API reads, and defaults/toggles/external changes/clear passed. No app-wide CPU saving is quantified.
