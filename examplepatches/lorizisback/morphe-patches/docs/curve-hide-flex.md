# Hide Flex in Curve Pay

This optional patch hides Flex UI and entry points in `com.imaginecurve.curve.prd` version **5.63.0**, developed against version code **56300002**. Select **Hide Flex** when patching. It is off by default.

The patched APK retains Android 9 (API 28) as its minimum version. The patch targets this Curve release, not a particular Android release; runtime checks currently cover Android 16 only.

The supplied APKMirror bundle contains ARM64/ARM32 and xxhdpi/xxxhdpi splits. Its SHA-256 is `ad8b0bee060d45d82558eb4bcc1b5538cd113de70ea85e4f23f7ceedd944e022`. Original APKs and decompiled sources stay under the Git-ignored `build/curve-5.63.0/` directory; they are not project source.

## Scope

| Surface | Change |
| --- | --- |
| Main Wallet | Removes Flex from the local inclusion set used by initial fetch and live refresh. |
| Wallet list/reorder and backup editor | Hides Flex rows and collapses their height, restoring ordinary rows on reuse. Adapter lists and saved IDs remain complete. |
| Card picker and Android quick-access wallet | Filters local presentation copies, including selections requested by ID. The quick-access UI retains a valid selection index. |
| Wallet headers and banners | Removes Flex headers, local Flex banners, and remote banners identified by a Flex destination or explicit Flex promotional text. |
| Launchpad | Filters Flex buttons and banners after loading; a response containing only Flex yields an empty display rather than a server error. |
| Transactions and settings | Removes Flex/Flex It action rows, promotional amount subtitles, swipe actions, swipe hints, and the Apply for Flex setting. |
| Navigation | Uses the existing menu without Flex It, prevents selection of the hidden credit tab, and ignores known Flex-family deep-link events. |

The main Wallet constructor retains its complete inclusion set. Initial fetch and live refresh each filter a copy when Hide Flex is enabled; disabling it restores the original inclusion set and presentation behavior. Other hooks use exact class/method signatures, unique matching, and checked call counts. The menu IDs and obfuscated classes are specific to this release. Do not expand version support without inspecting and testing the new bytecode.

The runtime extension filters copied UI lists and restores recycled row visibility. Backup models lose their original type, so it remembers one Flex source ID in process memory to identify that row without relying on its name. It does not log or persist this ID. Shared account-state APIs, selected-source lookups, stored backup/reorder IDs, and transaction records remain unchanged.

This hides Flex in every state, including active borrowing and loan-management entry points. It **does not disable Flex, cancel borrowing, change repayment obligations, or change the selected payment source**. Users with active Flex must retain another way to access their account. Historical transaction descriptions remain accurate. Future server promotions with unknown destinations and no recognizable Flex text cannot be identified from this APK alone.

## Patches menu

Select **Patches menu** to add a local Launchpad tile. It includes Hide Flex automatically. The switch defaults to on and saves in a separate private preferences file. **Save and reopen** saves the choice and starts a fresh activity task so cached screens reload; credentials and app data are retained. Toolbar Back and system Back leave the saved choice unchanged; a draft survives screen recreation. Turning the switch off restores the original Flex behavior; it does not activate borrowing.

The tile opens a dedicated, non-exported `PatchesActivity`. It uses Curve's AppCompat host, theme, toolbar, panel, settings row, Material switch and button stack. Curve's app-wide passcode and device-state lifecycle observers remain active; the screen has no lock opt-out or external intent filter. The extension compiles against Curve's existing AppCompat 1.8.0 without packaging another AndroidX copy. The tile uses Curve's existing grid, icon loader and label style. Its click is handled locally before Launchpad analytics and server actions. It is appended to a successfully loaded button list, including an empty list; it cannot appear while Launchpad itself is loading or showing an error. Screen copy is currently English. The icon is a transparent PNG generated with the built-in image-generation tool, stored at [`patches.png`](../patches/src/main/resources/curve/patches.png). The exact prompt is embedded in PNG metadata and saved in [`patches.prompt.txt`](../patches/src/main/resources/curve/patches.prompt.txt).

## Optional telemetry

Select **Disable optional telemetry** to suppress known analytics, marketing, crash and performance reporting in this APK. This is a separate patch, not a runtime switch. It does **not** make Curve or the modified app untrackable.

| System | Change |
| --- | --- |
| Curve analytics adapters | Stops event dispatch, identification, default properties and tracker activation. |
| AppsFlyer | Completes optional startup without initializing attribution; suppresses its token registration and attribution ID. |
| Braze | Keeps the SDK disabled and offline. Remote marketing banners emit an empty list so other Wallet banner sources can finish loading. |
| Snowplow | Suppresses new event submission and the queued-event upload loop. |
| Embrace | Suppresses startup and Curve's reporting logger setup. |
| Firebase Analytics, Performance, Crashlytics and Sessions | Forces collection gates off regardless of saved consent. The Google CCT reporting transport rejects queued diagnostic batches locally, without opening a connection. |

Firebase distinguishes collection gates from persisted overrides and local queues; see the official [Analytics collection guide](https://firebase.google.com/docs/analytics/android/configure-data-collection), [Performance API](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/FirebasePerformance), and [Crashlytics collection guide](https://firebase.google.com/docs/crashlytics/android/customize-crash-reports). These hooks are tied to the supplied bytecode, including obfuscated SDK methods.

Account, payment, login, push delivery, Remote Config, support, identity verification and fraud/security services remain active. Servers can still observe requests, account identifiers and network addresses. Existing uploads cannot be withdrawn by this patch. Old Snowplow queues remain local and may resume if the telemetry patch is later removed. Marketing content cards, attribution and deferred referral behavior may be lost. This patch does not establish the absence of every possible reporting path or replace a network audit.

## Reported login loading screen

The user reported one loading hang immediately after login; closing and reopening recovered it. Static tracing found no confirmed cause in the Flex changes. The privacy patch completes optional analytics startup calls without waiting for their dependencies, but this is not a verified fix for the reported hang. Authentication, notification-token registration and account synchronization retain their original flow. Do not force a logout or bypass those steps to test a speculative fix.

## Accept any signing certificate

Select **Accept any signing certificate** when patching Curve 5.63.0 with Morphe's keystore or another signing key. This replaces the earlier **Trust local signing certificate** patch, which accepted only this workspace's certificate. It remains optional and off by default, so reselect the renamed patch when importing this bundle into Morphe.

The patch makes only the local signing-certificate mismatch method (`uo3.c()`) return false. The original official-certificate allowlist is untouched. Startup and resume still run the other device checks, login, and server integrity behavior. This deliberately removes Curve's local signer-based tamper detection; it does not change Android's APK signature verification or installation rules.

Morphe can use its own keystore without importing the Mac's key. Keep using the same key for subsequent updates. Switching the key for an already installed build requires uninstalling that build, which removes local data and requires login again. No private keystore or password is included in the patch bundle.

## Build and apply

Use the environment from the [project build instructions](../README.md#build), then:

```sh
./gradlew build buildAndroid --no-daemon --console=plain
export MORPHE_DATA_DIR="$PWD/build/curve-5.63.0/morphe-data"
java -jar tools/morphe-desktop-1.19.1-all.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --exclusive -e "Hide Flex" -e "Accept any signing certificate" \
  -e "Patches menu" -e "Disable optional telemetry" \
  --validate --bytecode-mode FULL --unsigned \
  -o build/curve-5.63.0/patched-base-unsigned.apk \
  build/curve-5.63.0/input/base.apk
```

The command patches the extracted base APK for bytecode testing. It is **not a standalone installable app**: native libraries and density resources live in the supplied splits. Morphe Desktop also accepts the original `.apkm` as input and merges it before patching; use that input when producing a complete APK. Sign the result with a persistent local key and verify it with `apksigner` before installation. Keep that key for future updates.

The earlier Hide Flex and certificate build passed DEX parsing/compilation, but Morphe's optional `--verify-with-sdk "$ANDROID_HOME"` rejected 414 missing-library references. The original APK produced the identical set, with none added or removed by those patches. This is a baseline limitation, not a clean strict-verifier result for every future build. Keep `--validate` for fingerprint validation; the command above omits the stricter SDK check so it can produce the APK. Logs and baseline comparisons are in `build/curve-5.63.0/`.

On a non-rooted device, the changed signature cannot replace the official Curve installation. Uninstalling the official app removes its local data and requires signing in again. The companion certificate patch disables the local certificate mismatch decision only; other integrity checks may still prevent the modified app from working. Keep the official installation until you are ready to test. No account credentials are needed for the local tests below.

## Test the actual Curve bytecode

[`WalletIncludeProbe.java`](../tests/curve/WalletIncludeProbe.java) runs the real original or patched Curve classes through Android's `app_process`. It checks the exact Wallet inclusion set and Card options, initial fetch and refresh, every Flex state, order/identity of other entries, empty lists, and source-list preservation. Unexpected dependency calls fail instead of reaching a server.

[`FlexUiProbe.java`](../tests/curve/FlexUiProbe.java) checks real presentation getters before and after patching, including a Flex-only Launchpad response. On the patched APK it also checks URL matching, banners, backup identification, navigation guards, and recycled-row visibility. Its test-only allocation of models avoids creating authenticated services. Neither probe logs in or sends account requests.

[`SigningCertificateProbe.java`](../tests/curve/SigningCertificateProbe.java) checks that the official allowlist is unchanged and invokes Curve's real certificate check against an installed APK signed with a nonofficial key. Run it on the dedicated emulator. Original bytecode must reject the signer; patched bytecode must accept it. A second patched invocation without a Context verifies that the decision no longer depends on reading a particular signing key.

[`TelemetryProbe.java`](../tests/curve/TelemetryProbe.java) exercises real analytics dispatch, saved consent overrides, startup completion, SDK gates, banner-flow emissions and queued diagnostic transport. Synthetic dependencies and a guarded URL prevent network I/O. [`PatchSettingsProbe.java`](../tests/curve/PatchSettingsProbe.java) checks private preference defaults, hide/show persistence and failed writes without reading user app data. Wallet and UI probes exercise hide/show/hide transitions; `FlexUiProbe patched menu` also checks the local Launchpad tile contract and deduplication.

Compile the probe using the installed SDK:

```sh
mkdir -p build/curve-5.63.0/probe/classes build/curve-5.63.0/probe/dex
javac --release 17 -classpath "$ANDROID_HOME/platforms/android-36/android.jar" \
  -d build/curve-5.63.0/probe/classes tests/curve/*.java
"$ANDROID_HOME/build-tools/36.0.0/d8" --min-api 28 \
  --lib "$ANDROID_HOME/platforms/android-36/android.jar" \
  --output build/curve-5.63.0/probe/dex \
  build/curve-5.63.0/probe/classes/*.class
```

Use only the dedicated emulator from the [sample setup](../tests/README.md). Confirm `adb -s emulator-5556 emu avd name` reports `morphe_sample_api36`, then:

```sh
adb -s emulator-5556 shell mkdir -p /data/local/tmp/morphe-curve
adb -s emulator-5556 push build/curve-5.63.0/probe/dex/classes.dex /data/local/tmp/morphe-curve/probe.dex
adb -s emulator-5556 push build/curve-5.63.0/input/base.apk /data/local/tmp/morphe-curve/original.apk
adb -s emulator-5556 push build/curve-5.63.0/patched-base-unsigned.apk /data/local/tmp/morphe-curve/patched.apk
adb -s emulator-5556 shell chmod 444 /data/local/tmp/morphe-curve/probe.dex /data/local/tmp/morphe-curve/original.apk /data/local/tmp/morphe-curve/patched.apk
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/original.apk app_process /system/bin WalletIncludeProbe original'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/patched.apk app_process /system/bin WalletIncludeProbe patched'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/original.apk app_process /system/bin FlexUiProbe original'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/patched.apk app_process /system/bin FlexUiProbe patched menu'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/original.apk app_process /system/bin SigningCertificateProbe original'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/patched.apk app_process /system/bin SigningCertificateProbe patched'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/original.apk app_process /system/bin TelemetryProbe original'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/patched.apk app_process /system/bin TelemetryProbe patched'
adb -s emulator-5556 shell 'CLASSPATH=/data/local/tmp/morphe-curve/probe.dex:/data/local/tmp/morphe-curve/patched.apk app_process /system/bin PatchSettingsProbe'
```

The stored inclusion set stays `[Card, Rewards, Flex, PayPal]`. With Hide Flex on, each fetch receives `[Card, Rewards, PayPal]`; switching off restores the full set. Final acceptance on the user's Android 16 device must cover Wallet refresh, list/reorder, card selection, backup editing, Launchpad, settings, transaction details/swipes, and Flex deep links. These probes cannot establish successful login, device-integrity acceptance, or every authenticated layout.

## Initial Hide Flex validation

- `./gradlew build buildAndroid` passed, including Android lint with no issues.
- Both probes passed against the original and patched APK bytecode on the dedicated Android 16 emulator.
- The existing sample patch's installation, runtime, and visible-UI regression checks passed.
- The merged Curve APK passed signature verification and 16 KB native-library ZIP alignment checks. Signing preserved all 36 DEX files exactly.
- Both original and patched Curve installed and stayed alive on the AOSP emulator. Original startup showed `SERVICE_INVALID` with missing Google Play services; patched startup showed **Device restricted**. Successful login and authenticated UI remain unverified.
- Re-signing the original three-split installation, with all 35 original DEX files unchanged, reproduced the same **Device restricted** screen. The emulator restriction occurs independently of the Flex changes; no security checks were bypassed.
- The Hide Flex-only APK also installed on the user's Android 16 phone and reached `AccessDeniedActivity`. This prompted the separate certificate-trust patch above. These startup results precede that companion patch.
- With the certificate patch installed, the user confirmed successful sign-in and hidden Flex UI on the phone. The new menu and privacy changes require their own build and device validation.

The initial signed artifact remains at `build/curve-5.63.0/curve-5.63.0-hide-flex.apk`. The current four-patch APK is `build/curve-5.63.0/launchpad-tiles/curve-5.63.0-patches.apk`; the bundle is `patches/build/libs/patches-1.0.0.mpp`. The signing key lives outside build output at `~/.android/morphe-curve-signing/`, so a Gradle clean does not delete it. Do not share its key or password file.

## Menu and privacy validation — 30 October 2026

- The final complete branch passed three fresh independent adversarial reviews. Earlier validation caught a Morphe null-return API mismatch; the UI finish review caught low-contrast native dialog actions. Both were fixed and reviewed again.
- `./gradlew build buildAndroid` passed. Android lint reported zero errors and five warnings for the deliberately English-only dialog strings.
- All four original-APK baseline probes and all five final patched-APK probes passed on the dedicated Android 16 emulator. This includes hide/show/hide transitions, settings persistence, analytics dispatch, startup completion, SDK collection gates and guarded queued-report transport.
- The sample fixture regression passed. Subsequent edits were confined to the Curve telemetry null returns and dialog button colors.
- All 36 final DEX files passed `dexdump`. The cross-DEX verifier still reports exactly the original APK's 414 missing-library findings, with zero added or removed. It is not a clean strict-verifier pass.
- The final APK passed signature and 16 KB ZIP alignment checks. Signing preserved the tested DEX files and generated icon. The existing local signing certificate was retained.
- The phone and emulator were updated without uninstalling or clearing app data. Emulator startup before the color-only fix matched the original AOSP `SERVICE_INVALID` limitation. The user unlocked Curve and reached Launchpad on the final phone build.
- On the phone, Cancel discarded a draft change. Saving Hide Flex off reopened Curve and restored the Flex Launchpad entry; saving it on reopened Curve and removed the entry again. Hide Flex was left enabled. The final update also retained the saved setting across a process restart.
- Native screenshots cover both themes, normal and 1.3× text, and enabled/disabled dialog actions. Larger text remained usable with the existing grid scrolling. The phone's original dark theme and 1.0 font scale were restored.

Logs, screenshots, hashes and `verification-summary.json` are in `build/curve-5.63.0/controls-privacy/`. These checks do not constitute an exhaustive network audit. Android 9–15, tablets, TalkBack and font scales above 1.3× remain untested. The one-off login hang was not reproduced or attributed to a confirmed defect.

## Dedicated Patches screen

The screen replaces the original AlertDialog. Its layout is merged by a decoded resource patch, which also registers the activity in the manifest. Resource IDs are resolved from the patched APK at runtime. Only **Save and reopen** commits the current draft; leaving with either Back action discards it. Rotation and theme recreation retain the draft and any save error. The existing private preferences file is reused, so an installed update retains the Hide Flex choice. The screen retains Curve's original subtitle opacity at the user's explicit preference. Its light-theme explanation measures 3.95:1 contrast; a stronger treatment was tested and reverted at the user's request.

[`tests/curve-screen/`](../tests/curve-screen/) contains an emulator-only instrumentation check for the actual screen. It complements the isolated failed-save probe above. This screen has its own build, instrumentation and phone evidence, separate from the earlier dialog validation.

Launchpad tile hiding is now implemented below using the scoped display-only hook; Patches remains visible.

### Dedicated screen validation — 30 October 2026

- The final restored source passed three fresh independent adversarial reviews.
- `./gradlew build buildAndroid` passed after the revert. Lint reports zero errors and three advisory warnings: synchronous preference rollback, dynamic resource IDs assigned by the patcher, and the pinned compile-only AppCompat dependency outside the version catalog.
- The original four baseline probes and all five patched probes passed against the restored APK. The sample fixture's SDK, runtime and visible-UI regression checks also passed.
- Screen instrumentation passed again after the revert: native component contracts, private activity/theme, drafts, recreation, toolbar/system Back, persistence and actual Apply/relaunch. It restores the emulator's original preference.
- Freshly rebuilt code, resources and native files match the previously tested softer-text APK across 3,607 entries. Signing metadata is compared separately; signature verification and 16 KB alignment pass. All 36 DEX files passed `dexdump`. The strict verifier matches the original APK's 414 missing-library findings, with no added or removed findings.
- Phone captures cover light/dark themes, normal and 1.3 font scale, enabled/disabled Apply, and toolbar Back discarding a draft. Hide Flex remained on. Font scale 1.0 and night mode were restored.
- The final APK retains the original subtitle styling as explicitly requested. The UI finish reviewer accepted the revised brief with the documented contrast exception. This is not a claim that light-theme subtitle contrast meets 4.5:1.

Final APK SHA-256: `8a6bad42d12cd9e88b060aa818c9ce8bb96bfbf4e428e6807e4b4fd870068286`. Evidence is under `build/curve-5.63.0/dedicated-screen/`, including `signing-verification.json`, `restored-build.log`, `probes.log`, `screen-test/restored-instrumentation.log`, `verifier.log`, and the phone captures. Android releases below 16 and live TalkBack interaction remain untested. Launchpad tile hiding was deferred at this screen handoff and is implemented in the following section.

## Hide selected Launchpad tiles

Patches includes a **Hide selected Launchpad tiles** master switch, an inline checklist (checked means hidden) and **Reset selection**. The master defaults off; turning it off remembers the selected IDs. Reset clears all custom hidden IDs, including IDs no longer in the server list, without changing Hide Flex or the master switch. All changes are drafts until **Save and reopen**; Back discards them. Drafts survive recreation. Settings commit together, and failed writes restore the previous preference cache.

**Patches always stays visible** and cannot be selected. Filtering runs only inside `LaunchpadFragment.updateUI` immediately before the grid's `submitList`, preserving shared getters, deep-link resolution, ordinary button actions, source-list identity and model order. Only exact Button models with nonempty IDs are eligible. Duplicate IDs share one checklist entry and hide together; unfamiliar server IDs appear normally. The checklist captures IDs/titles before custom filtering, so hidden choices remain available. It stores no activity, view or account model references.

Existing Hide Flex filtering runs first and keeps its own precedence. Resetting custom tiles does not re-enable Flex. If the screen is restored before Launchpad loads, it explains how to populate the checklist; saved selections can still be reset. The implementation remains pinned to Curve 5.63.0.

`LaunchpadTilesProbe` exercises real APK models, filtering and catalog edge cases. `PatchSettingsProbe` covers atomic preferences and failed-write rollback. Screen instrumentation covers controls, reset, cancellation, recreation and Apply.

### Launchpad tile validation (2026-10-30)

- Three independent adversarial reviewers reported no findings before automated checks. Native UI review accepted the screen, including the user's preferred softer subtitles.
- `./gradlew build buildAndroid` passed. Android lint reported zero errors and the same three advisory warnings described above.
- All ten original/patched probes passed. Screen instrumentation passed checklist, reset, protected Patches, draft recreation, Back cancellation, atomic Apply and relaunch checks. The sample fixture end-to-end test passed.
- The merged APK passed signature verification, 16 KB ZIP alignment and parsing of all 36 DEX files. The strict SDK verifier reproduced the original 414 missing-library findings, with none added or removed; it is not a clean strict-verifier pass.
- The update installed on the Android 16 phone without clearing app data. Physical checks confirmed that Settings and Support disappear when selected, Patches remains visible and opens, and switching hiding off restores both tiles while remembering their selections. Reset passed automated tests; its final physical check was interrupted by a network-failure report and was not completed.
- Phone layouts were checked in light/dark mode and at 1.0×/1.3× font scale. Original 1.0× font scale and dark mode were restored. Android releases below 16 and live TalkBack interaction remain untested.

APK SHA-256: `38db1b1ff61befec30296d6e7f72ee4d4c3f6d138e3b25d1601509962882b39e`. Evidence is under `build/curve-5.63.0/launchpad-tiles/`. The signing report records the bundle used for this APK; the sample fixture subsequently rebuilt the bundle, so its current archive hash may differ.

The user subsequently reported failed card selection, card settings and GBIT requests, then confirmed recovery without an app update or patch change. A bounded source inspection found no confirmed defect: the new tile filter only changes the displayed grid, and inspected authentication/error handlers remain unchanged. No failure-time diagnostic evidence was captured, so the cause is unconfirmed and an intermittent patch interaction is not ruled out. No speculative network or authentication changes were made.

## Remove Cringe

Select **Remove Cringe** in Morphe Manager for plain feature names and descriptions in English (including UK English), German, Spanish, French, Italian, Lithuanian and Norwegian Bokmål. It is optional and not selected by default. Selecting it includes **Patches menu** and that menu's existing Hide Flex dependency; Hide Flex can be turned off inside Patches.

The **Remove Cringe** switch appears only when this patch was included in the APK. It defaults on. Changes are drafts until **Save and reopen**, share the existing atomic save/rollback flow, survive screen recreation and are discarded by Back. Switching off restores the original resource reads and Launchpad titles.

The terminology is Backup cards, Spending limits, Currency conversion, Automatic card selection and Features, with translations. Selected promotional headings and FX descriptions are simplified. Go Back in Time, Magic link, Fronted, Flex (including the “Flex FREELY” headline), legal document names and URLs remain unchanged. Cashback timing and the complete geographic exclusions are retained. The reviewed copy lives in `patches/src/main/resources/curve/remove_cringe.json`.

The bytecode patch redirects resource text reads, XML typed-array reads and integer TextView setters to a helper that checks specific resource IDs. Original resources stay intact. Unlisted strings and user text are passed through. Launchpad button display getters additionally translate exact known feature titles; button IDs, actions and original model fields remain unchanged. Unknown server wording, images containing text and web pages are outside this catalog. Translations follow the resource configuration; unsupported languages fall back to English.

Run `python3 tests/check_remove_cringe.py` against the extracted resources for catalog checks. The screen instrumentation covers patch-present/absent variants and all seven languages; the preference probe covers failed-save rollback of the new setting with the existing settings.

## Menu copy and supported apps

The bundle supports Curve only; template app support and its fixture runner have been removed. Patches uses “tiles” consistently, with **Tiles to hide**, **Reset selection** and **Save and reopen**. Descriptions explain each switch; a shared footer explains saving and Back cancellation. Remove Cringe retains its conditional visibility and localized description in all seven languages. Existing preference keys and behavior are unchanged.
