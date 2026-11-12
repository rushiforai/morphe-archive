# Issue #8: false Google update warning with universal update blocking — v0.3.5

## Report and established cause

The [request](https://github.com/ryuya0124/gemini-microg-patches/issues/8#issuecomment-6825043821) initially described Gemini updates not being disabled by the universal patch. The [clarification and screenshot](https://github.com/ryuya0124/gemini-microg-patches/issues/8#issuecomment-6825468743) show Gemini's **Update your Google app** screen, not a Play Store update button for Gemini.

The official **Disable Play Store updates** patch sets Android's versionCode to 2147483647 and restores the original version when the app reads PackageInfo. Its [Kotlin patch](https://github.com/MorpheApp/morphe-patches/blob/v2.2.0/patches/src/main/kotlin/app/morphe/patches/all/misc/updates/DisablePlayStoreUpdatesPatch.kt) and [runtime](https://github.com/MorpheApp/morphe-patches/blob/v2.2.0/extensions/all/change-version-code/src/main/java/app/morphe/extension/all/versioncode/DisablePlayStoreUpdatesPatch.java) did not check whose PackageInfo was being read. The same behavior exists in the tested Desktop bundle1.41.0.

Both Google and Gemini really had the maximum installed code. Gemini's universal runtime then restored **Google's** maximum code to **345, Gemini's original code**. Gemini consequently considered Google too old. On the signed-in Android12 Play Store AVD, the uncorrected combination reproduced the reporter's screen. The real installed APK's runtime, invoked through the probe, returned these values:

| Read from Gemini | Before | Fixed |
| --- | --- | --- |
| Gemini installed code | 2147483647 | 2147483647 |
| Gemini's own restored code | 345 | 345 |
| Google installed code | 2147483647 | 2147483647 |
| Google code seen by Gemini | **345** | **2147483647** |

The maximum-code change itself had succeeded. The defect was the cross-package restoration inside the app.

## Change

The default **Compatible Play Store Update Blocking** patch scopes the optional universal runtime's restoration to the current `.morphe` package. Other packages retain their actual int/long version. Its finalizer adds a three-register package classifier and guards the existing two getter methods without expanding their register allocations. The original own-version and versionCodeMajor handling remain in the universal implementation. If that optional extension is absent, no version-reading bytecode is changed and the original manifest code is retained.

This patch does not select or replace the official universal patch. Keep the source defaults, and add **Disable Play Store updates** only when wanted. Unknown input app versions still fail through the version registry. Genuine low/missing Google-clone checks remain enabled.

A separate failure appeared while reproducing the error: the base-only Gemini input references an error logo supplied by a density split. Its native ErrorActivity crashed with Resources.NotFoundException for 0x7f08016f. The baseline was supplied its matching density split to reproduce the original warning visually. The fix uses a framework drawable in the current version's BardErrorLogo style, so base-only builds can display legitimate errors. The style/attribute/fallback and single expected match are recorded in the Gemini1.0.995038376 profile and generated JSON. Older profiles without that resource record are unchanged.

## Actual Store environment

- Dedicated **GeminiPatch_PlayStore_API31**, emulator-5584, Android12/API31, official Google Play ARM64 image revision9. Normal shell UID2000; no root.
- The user manually signed in to the actual Play Store. No account credentials were requested in chat or entered by automation.
- Play Store observed version54.0.09-31 / 85400930. Official Store-installed Google17.72.17.ve.arm64 / 301831138 and Gemini1.0.995038376 / 345 were present.
- Official app listings showed Open. Direct listings for the two `.morphe` packages showed Item not found. The baseline error's Store button also reached Item not found. This separates the app's false dependency warning from a Store update offer.
- Tests remove/install only the test clones and probe. They do not clear Store, stock Play services or account data, or replace the official app packages. Official package versions and signed-in account counts were unchanged over the matrix. The physical Galaxy was not modified.

## Completed verification before publication

| Generation path | Result |
| --- | --- |
| Desktop1.15 / Patcher1.12, release MPP + official patches1.41 | **23/23** Store/runtime matrix assertions |
| Actual Android Manager2.5 GUI / Patcher2.3, release MPP + official patches2.2 | **23/23** of the same matrix with exported APKs |
| Default-only APKs on Google APIs API31/API36 AVDs | **26/26 each** prior permission/process/widget/launcher regression assertions |
| Release-MPP default/legacy clone options and rejected experiments | **11/11** assertions |

The Android Manager build selected the source defaults plus only the official Disable Play Store updates patch: 5 public patches for Gemini and 12 for Google. Clone app, installer spoofing, certificate-pinning overrides and signature spoofing were not selected. A separate default-only Gemini export used 4 source patches and retained code345. Manager source/selection XML and exports were kept locally.

The Store/runtime matrix includes:

- Actual uncorrected runtime returns Google's code as345; native warning and Store-button result reproduced.
- Corrected Gemini and Google runtimes restore only their own code. Additional synthetic inputs passed to those same installed implementations verify preserved long-version major bits and unchanged ordinary foreign code42.
- Both apps blocked, only Google blocked, only Gemini blocked and Gemini without the optional patch all route to the cloned Google activity where appropriate.
- Both maximum installed codes remain unchanged. A same-key ordinary lower-code update is still rejected with INSTALL_FAILED_VERSION_DOWNGRADE. Desktop used Google MAX→1; Manager used Gemini MAX→345, using the same Manager signing key.
- A controlled Google metadata code1 still triggers the native update warning. Removing only the Google clone still triggers the missing-Google warning. Both render without a resource split or fatal crash. Code1 is a negative metadata fixture, not a claim to have tested an older functional Google implementation.
- Official Store listings and unavailable clone listings were checked while signed in. Official app versions/accounts were preserved. No Google/Gemini fatal crash occurred in the fixed portion.

`UniversalVersionProbe` loads the real installed app's universal extension with createPackageContext and invokes both getters. Real PackageManager information supplies the main before/after case; the major-bit edge cases are explicitly synthetic. `VerifyUpdateCompatibility.kt` checks the target package literal, guard/foreign-return shape, register operands and branch targets in the generated APKs. Existing manifest isolation, native-hook, version-profile, signing and MPP checks also passed. All 27 patch JVM classes and the existing two permission-runtime classes are packaged.

The Store login is stock Google authentication, not microG authentication for the clone. Gemini chat/token acquisition, the reporter's OnePlus8 and physical Secure Folder deployment were not verified by this matrix. The previous physical chat confirmation remains the earlier v0.3.2 result.

## Reproduction and local evidence

Use the original API30 Google/API29 Gemini variants in [the Android12 report](issue-8-android12.md). Provide an original microG environment separately if checking authenticated Gemini use. For this issue, the root version check happens before that login stage.

1. Build the candidate MPP. Generate both clones with the default source patches plus the official update-blocking patch. Export Android Manager results before installing them.
2. Keep the uncorrected v0.3.4 universal Gemini APK and its matching, cloned/signed density split as baseline. Keep normal candidate Google/Gemini outputs, the controlled Google-code1 APK and a same-key lower-code update fixture.
3. Sign in manually on the official Play Store AVD. Build the probe with scripts/emulator/build-contract-probe.sh.

```sh
python3 scripts/emulator/test-issue8-playstore.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5584 \
  --fixtures local/issue8/play-store \
  --fixed-gemini local/issue8/play-store/manager-gemini.apk \
  --fixed-google local/issue8/play-store/manager-google.apk \
  --lower-update-apk local/issue8/play-store/manager-gemini-normal.apk \
  --probe build/contract-probe/probe.apk \
  --report-dir local/issue8/play-store/manager-results
```

The runner refuses other serials, AVD names, SDKs or root shell, and requires an existing signed-in account. It never automates login or removes stock apps/accounts. Its signed-in UI XML remains private under local/ and is not a release artifact.

It validates APK package names with SDK aapt2 before installing/removing a clone, including the probe and lower-update fixture. Clone-contract validation normally requires an unchanged version code. For update-blocked outputs, explicitly use `scripts/verify-clone-contract.sh ORIGINAL PATCHED --update-blocked`; this requires exactly MAX and the scoped universal extension, while retaining all permission/provider checks. Omitting the option still rejects changed codes. Android Manager does not run these host verification scripts.

Local evidence: local/issue8/play-store/{desktop-results,manager-results,regression-api31,regression-api36}, options-results.json, baseline/fixed APKs, version probes, crash logs and native warning screenshots. The density split was needed only for the old baseline; the final Gemini exports were base-only.

| Artifact | SHA256 |
| --- | --- |
| Tested MPP | `c8fde8dad57baba664fd8a8f948125fdeca77165b20a0cba37ad73b9ba771778` |
| Manager Gemini, update blocking | `9ddcfc7e3e1ccade7dbea295411d4cd808c7565c2cc359ce32ccd55a5523ea07` |
| Manager Google, update blocking | `334ef93268c15c273b070488270d158879ed5b4b64f66c12d959f896eb186953` |
| Manager Gemini, default only | `f17aecdef834c2d6403ffe30cbf8d00f4b08bbbf3bc7e61ed29748c73433ef0c` |
