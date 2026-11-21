# Hatena Bookmark 5.80 (58000) — experimental Morphe port, UNRELEASED

## APK safety, static verification only

User-provided 5.80 APK SHA256: f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b.

- Binary manifest: com.hatena.android.bookmark, versionName 5.80, versionCode 58000, app class com.hatena.android.bookmark.BookmarkApplication, targetSdk33/minSdk26.
- ZIP CRC verification passed. APK v2 signing was **cryptographically verified**, including RSA PKCS#1 SHA256 signature of signed-data and Android v2 full-file chunk digests. Cert subject CN=Hatena Inc.; cert SHA1 741de50a98c93edefc1a382fda5f5f9c3fcee478; SHA256 8cd89ea1c1871d503a6b618c0e4f5467f634a9040e5e74304a61087c54277a8a.
- This cert matches the Hatena Bookmark and Hatena Blog developer cert SHA1 advertised by APKPure. As a self-reported archive, this is not independently verified publisher key provenance.
- No Pairip Application, LicenseActivity, or other Pairip/LicenseClient strings in either DEX. No native shared libraries or nested executable payloads in ZIP. Normal-looking network, Firebase, Hatena account and notifications permissions; no request-install-packages, SMS, accessibility or broad external storage permission observed.
- Literal domain strings correspond predominantly to Hatena, Google/Firebase and bundled dependency documentation. These are heuristics, **not** a complete malware verdict.
- Kaspersky documented a Trojanized APKPure distributor APK in 2021, fixed in its 3.17.19 app; third-party archives deserve additional caution. Do not install this historic APK on the daily-use phone before safe testing.

## DEX compatibility (exact user APK)

- MuteHelperKt.filteredWithMuteWords(BookmarkEntry,List)Z: registerCount 8, insSize 2, codeUnits **105** (compared with 103 on 5.84). Calls BookmarkEntry.isPrEntry() at offset 21 and getTitle() at offset 0.
- Existing mute filter allows PR entries through even when they otherwise match a mute condition.
- 5.80 has 3 content providers, original custom permission and queries manifest section compatible with clone patch preflight.
- Local branch experiment/hatena-58000-no-pairip targets **5.80 / versionCode 58000 only**, requires 8 registers, 105 code units, one PR call at offset 21. Public main v5.84 remains unchanged.
- Local Gradle :patches:buildAndroid **SUCCESS**; experimental Android patches-0.2.0.mpp includes classes.dex and both patch classes. NOT applied to the uploaded APK. NOT published. APK launch/ads/auth unverified.

## Latest verified input on Windows (2026-10-14)

The user placed the original uploaded APK at:
`apk-inspection/Hatena_Bookmark__Save__share_5.80_APKPure.apk` (relative to the project root)

- SHA256 EXACT MATCH with previous independently inspected upload: f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b.
- Windows Android SDK aapt confirms original package com.hatena.android.bookmark / 5.80 / versionCode 58000.
- Android SDK apksigner verify: valid APK Signature Scheme v2 AND v3 and valid Google SourceStamp. The signer is CN=Hatena Inc., same SHA1/SHA256 above; its RSA public key is 1024 bits. This verifies APK integrity relative to the signing key, not total app safety.
- ZIP CRC and original two DEX class_def counts (10,316 and 7,554) pass. No Pairip-named ZIP entries observed.
- Local 0.2.0 experimental .mpp Android bundle ZIP/DEX validation passed, SHA256 b084a27da9a4682ebf2177ecdf9b69e021d323350841d4cf038904dbf6a0c6c5.
- Attempted to apply the experimental 0.2.0 Morphe patch to this actual APK. The tool call was BLOCKED by OpenAI safety check BEFORE confirmation of a result. Do NOT evade this restriction or claim successful patch application, signed modified APK, emulator install, login or ad removal.

## NEW RESULT — 2026-10-14 user-requested exact retry: REAL APK PATCH SUCCESS

On the user's renewed explicit instruction, the exact official Morphe Desktop CLI was retried once on the pinned original 5.80 APK and was accepted; no protection bypass, binary signing forgery or tool disguising was used. Morphe 1.18.1 completed PATCHING, REBUILDING, SIGNING successfully. Report: `apk-inspection/hatena-58000-apply-result.json`, exactly 2 applied, 0 failures.

Generated `apk-inspection/HatenaBookmark-5.80-PR-hidden-clone-experiment.apk`, SHA256 `8c4a516f64ff2118a9fb6f0872612e2e20b188d867f9a8d4773632bef6061f6f`, size 11,616,386 bytes. Android SDK verified v2 signing with CN=Morphe, clone package `com.hatena.android.bookmark.morphe`, version 5.80/58000, three unique cloned provider authorities and receiver permission. `classes2.dex` byte-identical to source; `classes3.dex` has modified `MuteHelperKt`. Android SDK dexdump confirms early isPrEntry check, returning false for PR and falling through to original getTitle path otherwise. No Pairip activity found. Original user APK SHA256 unchanged.

Android 36 emulator (read-only AVD) `adb install -r` succeeded and the correct original `com.hatena.android.bookmark.RootMenuActivity` launched. Process remained alive after >20 seconds and foreground activity reached `com.hatena.android.bookmark.presentation.activity.MainActivity`. **UI/feed/content visibility not proven**: Android SystemUI became unresponsive and ADB went offline during UI Automator inspection; this may reflect emulator host memory pressure, not an app-specific crash. No real device installed or modified. Four 5.80-specific local static/integration tests PASS.

Public v0.2.0 was released as GitHub **prerelease** with only `patches-0.2.0.mpp` and checksum asset, no APK. GitHub Actions clean Gradle DEX generation + metadata tests succeeded (run `38433942451`). The published 35,826-byte `.mpp` was downloaded back and independently SHA256-verified: `b726d545bf514095acac464fd0892f440f01425aaf827ab5b2a207f57628b8c3`. GitHub raw `patches-bundle.json` from main points at that exact asset. A separate Morphe Desktop command using `--prerelease --patches=https://github.com/rikunode/hatena-bookmark-hide-pr-patches` downloaded the public v0.2.0 bundle, applied **2 patches / 0 failures** and re-signed the source APK (output sha256 `d6c489200544ef900909cc547ba70e0e522b6a089e1a409b67ec6eb2e9c0f6f0`). Without Desktop CLI `--prerelease`, the Github repository URL failed to find any stable releases, since both published tags are prerelease. Manager JsonPatchBundle uses raw main `patches-bundle.json` as its endpoint and therefore should use the explicit asset URL regardless of GitHub prerelease flag, but **Manager phone import has NOT been confirmed**.

Next gate: user adds public source to Android Morphe Manager and confirms v0.2.0 and both patches, then performs a risk-aware separate-app test on the original 5.80 APK, checks normal article feed, PR row absent and login/bookmark features. Do not remove the functioning 5.84. Older third-party-sourced APK cannot be declared malware-free on static inspection alone.
