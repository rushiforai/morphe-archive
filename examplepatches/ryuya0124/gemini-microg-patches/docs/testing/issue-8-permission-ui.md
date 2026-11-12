# Issue #8: account permission wording and refusal handling — v0.3.4

## Report and reproduced behavior

The [follow-up](https://github.com/ryuya0124/gemini-microg-patches/issues/8#issuecomment-6822070486) confirms that Google works after v0.3.3, but reports a Contacts prompt followed by “perform an unknown action.” Both screenshots were inspected. Both prompts were reproduced on Android12/API31 and API36 with actual Google APKs and microG RE7.3.0.

The first is `android.permission.GET_ACCOUNTS`, displayed under Android's Contacts permission group. This setup does not request READ_CONTACTS. The second is `app.revanced.gms.EXTENDED_ACCESS`, a dangerous permission owned by `app.revanced.android.gms`. The installed microG APK declares a label, but no description. This matches [microG RE's Manifest](https://github.com/MorpheApp/MicroG-RE/blob/7.3.0/play-services-core/src/main/AndroidManifest.xml). [Android12 PermissionController's description fallback](https://android.googlesource.com/platform/packages/modules/Permission/+/refs/heads/android12-release/PermissionController/src/com/android/permissioncontroller/permission/utils/Utils.java) calls loadDescription and substitutes default_permission_description when it is empty. The fallback text is “perform an unknown action.”

This is a permission description problem, not the earlier VerifyError. Google cannot replace a permission declaration owned by microG. The system dialog's text remains unchanged. The v0.3.4 change explains the account purpose before requesting permissions and respects the user's choice to postpone or deny them. Re-declaring microG's permission in Google, removing original Google, automatically granting permissions or suppressing the system confirmation are not used.

The old v0.3.3 request also reappeared after denying extended access and restarting. That behavior was reproduced before testing the change.

## Implementation

`MicrogRuntimePermissionsPatch` invokes `MicrogPermissions.onCreate(Activity)` at the validated MainActivity completion flag. The Activity alias and register allocation are preserved. The small Java runtime is compiled against Android36, converted with pinned D8, stored as `extensions/microg-permissions.bin`, and merged with Patcher's extension API. It requires only Android/Java APIs, not Kotlin or Patcher classes inside Google.

The English/Japanese DialogFragment explains the two prompts and provides Continue / Not now. Continue requests only missing account permissions. Not now, Back and system denial do not trigger repeated startup requests. The decision is stored in the clone's profile-local preferences. Already-granted setups skip the explanation. Missing/disabled microG does not consume the setup decision; installing/enabling it later allows setup. The permission owner and dangerous protection level are checked. No permission is declared on microG's behalf.

DialogFragment manages background/resume and restoration. A restored dialog dismisses when the choice was already recorded or all permissions are granted. Declined or subsequently revoked permissions remain denied; Android app info can be used to grant them later. The tests' shell grant/revoke commands create those states in the disposable AVD; they do not simulate Google authentication or test the app-info screen itself.

## Completed checks before publication

The final MPP was imported through **Android Morphe Manager2.5.0 / Patcher2.3.0's actual GUI**, using the original Google API30 nodpi APK. Its default 10 compatible patches completed, and the generated APK was saved/exported. The final APK below, rather than an independently compiled mock of the helper, was installed for the final permission matrix.

| Check | API31 | API36 |
| --- | --- | --- |
| v0.3.3 Contacts → unknown action | Reproduced | Reproduced |
| v0.3.3 repeats request after denial | Reproduced | Reproduced |
| Same-key v0.3.3 → v0.3.4 update retains UID and both grants | Pass | Pass |
| Authorized update has no setup interruption | Pass | Pass |
| Explanation appears before any permission grant | Pass | Pass |
| Not now and Back survive process restart without granting access | Pass | Pass |
| Background/resume retains the explanation | Pass | Pass |
| Continue permits both original system confirmations | Pass | Pass |
| Only GET_ACCOUNTS already granted | Only extended access requested | Same |
| Only extended access already granted | Only account access requested | Same |
| Both already granted | No setup/request | Same |
| Either system permission denied | Denial retained; no startup re-prompt | Same |
| Later grant/revocation through controlled shell state | Reflected; no override | Same |
| microG disabled, then enabled | No unusable request; setup can retry | Same |
| microG uninstalled, then installed after Google | No unusable request; setup can retry | Same |
| Japanese explanation and decision across locale change | Not exercised | Pass |
| Final permission matrix assertions | **48/48** | **52/52** |

English/API31 and Japanese/API36 screenshots were also visually inspected: the full message and both buttons fit without clipping. The final matrix crash buffers contained no fatal crash for Google, Gemini or microG. A separate read-only audit found no ANR for those packages in either AVD's event buffer.

Other regressions were repeated with the frozen runtime:

- Desktop default outputs: **26/26** assertions on each API31/API36 AVD, including v0.3.0 duplicate-permission/cache/widget failure reproduction, fixed Lens permission, cached process names, receiver startup, and launcher routing with original Google disabled. The original Google state was restored.
- Android Manager output: **16/16** prior register-regression assertions, reproducing public v0.3.2's exact VerifyError and verifying the final v0.3.4 provider/cache/widget/Google startup.
- Release-MPP configuration checks: **11/11**, including legacy clone options and rejection of the three historical account experiments.
- Manifest/DEX permission isolation, branch targets, work-profile/compliance/trampoline changes, process-name helper registers and signatures passed for the final Manager output and Desktop builds.
- `VerifyPermissionSetup.kt` verifies the actual runtime classes in the APK, the single correctly placed hook and Activity register, register bounds, absence of the old direct request and absence of READ_CONTACTS/Patcher/Kotlin runtime dependencies in the extension.
- MPP verification checks all **26 patch JVM classes** in Android DEX and both extension classes in the embedded payload. JDK21 and JDK24 produced identical extension DEX bytes with the pinned compiler options and D8.

### Scope

All mutations used normal shell UID2000 on dedicated disposable AVDs, not root or a physical device. The new runner checks emulator status, exact AVD name, SDK and absence of Android accounts before clearing test data. It removes only the test Google clone and, when explicitly supplied an original microG APK, exercises microG removal/reinstallation on that AVD. The original system Google package stays installed for the permission matrix.

No Google account was added. The same OS prompts were reproduced over the unauthenticated Google screen, not the reporter's signed-in onboarding background. These checks do not establish token acquisition, chat replies, complete widget behavior or the reporter's OnePlus8 result. The physical Galaxy was not updated during this investigation; its last user-confirmed chat result remains the earlier v0.3.2 Desktop build. Only the installed microG APK code was read from it for the emulator fixture; no account data was copied.

## Reproduction and evidence

Use the original API30 Google / API29 Gemini variants and hashes in [the Android12 report](issue-8-android12.md), plus microG RE7.3.0 (`app.revanced.android.gms`). Keep both Manager exports signed with the same Manager key when testing an in-place upgrade. Retain original v0.3.3 and candidate MPP files; always patch the original Google APK, not a modified output.

```sh
scripts/build-mpp.sh
# Import the built MPP in Android Manager, patch original Google with defaults,
# and export the result separately from the v0.3.3 baseline.
python3 scripts/emulator/test-issue8-permissions.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5582 \
  --baseline-apk local/issue8/register-fix/manager-v0.3.3-google.apk \
  --fixed-apk local/issue8/permission-ui/manager-v0.3.4-google.apk \
  --gemini-apk local/issue8/api31/build/dist/gemini-login.apk \
  --microg-apk local/issue8/permission-ui/microg-installed.apk \
  --verify-upgrade --report-dir local/issue8/permission-ui/manager-api31
```

Repeat with emulator-5580 and a separate manager-api36 report directory. The runner detects the SDK and exercises Japanese app locales on API36. It restores microG availability/locale after those cases and removes the test Google clone at successful completion.

The UI runner waits for dialogs to actually dismiss before checking grants or force-stopping the app. Early harness iterations inspected grant state before Android had processed the button event; later state/UI inspection confirmed the grant. A repeated denial also uses a different Android button ID. Resume testing uses Gemini's exported launcher, because Google's internal MainActivity correctly rejects direct shell launch. These harness issues were corrected, and the complete final matrix was rerun.

Ignored evidence: `local/issue8/permission-ui/manager-api31/`, `manager-api36/`, `runtime-audit.json`, `regression-api31/`, `regression-api36/`, `register-regression/`, `options-results.json`, build logs, exported APK, and English/Japanese screenshots. Manager GUI XML is under `local/issue8/register-fix/manager-ui/`. APKs, signing keys and raw device logs are not distributed.

| Artifact | SHA256 |
| --- | --- |
| Tested MPP | `3958947638c8ecebe6f9752a4395dd4e24c2a55da88b7c1a1a4de956e0ac0393` |
| Final Manager Google APK | `afa47b423814476bb8c039fdbe6a8257cf26bda29d39f5c6f032e07d062aa5b7` |
| microG RE7.3.0 fixture | `67b794fd5221512a11d5950ec214fc0af0e3a8f72840d01235920729c7e73f5e` |
| Embedded runtime DEX | `7cf34aabe99b705fc2837b13fa3347b82c964aecd64a5e4a35e070dee5b0d968` |
