# Pizza candidate validation — 2026-09-28

The user subsequently confirmed working Google Play Games, TapBlaze, correct
restored save and gameplay. The additional [billing investigation](pizza-billing.md)
reproduces stock Google Play's refusal of paid checkout in the re-signed APK;
this capability remains unresolved. A new DEX regression check confirms 2166
executable billing methods remain identical to the original.

Current APK: `artifacts/session-20260928/pizza-accepted-activity.apk`.
Pizza 5.57.3 (2277), rebuilt from the clean APKM with both Pizza patches,
Morphe CLI 1.17.0, FULL bytecode mode, Java 21 and the preserved test signing key.

- APK SHA-256: `21c0e913150194d710152fc16db807893fed099fa062a11e2ff0eb99a1bf7b63`.
- Bundle: `patches/build/libs/patches-1.31.0.mpp`.
- Bundle SHA-256: `1f76dbc6ac67ddcdfaeb9da20e046d4377030d53d1f446fa7e05e4be279c38ec`.

Evidence is local and ignored under `artifacts/session-20260928` and
`artifacts/pizza-runtime`. Account identifiers, credentials, saves, keys, raw logs
and intermediate APKs are not included in Git. Failure evidence is retained.

## Verified environment and limits

Two Android API 35 x86_64 emulators run the ARM64 game through Android's native
bridge. Account emulator 5554 uses MicroG-RE 7.1.1 and a user-confirmed TapBlaze
cloud restore. Disposable emulator 5556 handles clean installs and failure
injection. ARM32, physical devices and every seasonal/event offer remain untested.
TapBlaze save restoration is separate from Google Play Games authentication;
Google cloud-save restoration has not been established. These results support
this tested candidate, not a guarantee for every device or future game version.

## Current-candidate results

| Check | Observed result | Evidence prefix |
| --- | --- | --- |
| Source build / clean patch | Build, merge, patch, rebuild and signing pass | `build-accepted-activity-final`, `accepted-activity-patch` |
| Emitted APK | 1459 constants, 4 exact SDK receivers, 1198 unchanged auth/SDK methods; 5 reward scenarios, one dispatch each; 79 unrelated bridge methods preserved | `verify-accepted-integration`, `verify-accepted-reward` |
| Assets / native reconstruction | 35 splits, 6653 assets, 34 libraries; only exact reviewed ARM64 reconstruction differs; native parity/malformed-input tests and 8 asset regressions pass | `verify-accepted-assets`, `verify-accepted-bootstrap`, `accepted-asset-tests` |
| Real account update | Genuine server authorization and current player retrieval succeed after same-key update | `accepted-user-update` |
| Force-stop | Two consecutive force-stop starts authenticate and preserve pixel-identical progress/cash/gem regions | `accepted-user-force-1-retest`, `accepted-user-force-2` |
| Full device reboots | Both reboots authenticate and preserve Chapter 2 / Day 43, cash 356.24, 21 gems | `accepted-user-reboot-1`, `accepted-user-after-second-reboot` |
| Background / sleep / wake | Same PID3044 survives Home, screen sleep, wake and resume | `accepted-user-background-wake` |
| Network loss / recovery | MicroG requests renewed profile consent; after network restoration and that consent, genuine sign-in and all three unchanged save regions are verified | `accepted-user-offline`, `accepted-user-network-after-consent` |
| Clean installation | Actual uninstall/install on disposable 5556 reaches age setup and Day 1; real Games entry opens MicroG on first attempt; cancellation returns to gameplay | `accepted-clean-first`, `accepted-clean-age`, `accepted-clean-google-resolution`, `accepted-clean-reward-cancel` |
| Reward after clean install | Eligible tip-video offer activates one normal 30-minute timer without video or currency debit, including repeated tap and Home/resume | `accepted-clean-tip-offer`, `accepted-clean-tip-reward` |
| Previously completed save | Day 2 / cash66.98 / gems11 survives update, debug backup/restore and repeated lifecycle failure injection; all three save regions match exactly | `accepted-debug-save-comparison`, `accepted-debug-final-save` |
| Tapjoy receiver recreation | Offline connection + font-scale change recreates Activity twice; same PID11915 survives, no receiver leak or fatal exception | `accepted-recreation-*` |
| Rejected Activity | Old APK initializes Games after Cocos rejects non-root window; final APK does not. Initial repaired run plus two repeat runs recover the menu and unchanged cash | `baseline-orphan-permission`, `accepted-orphan-permission`, `accepted-orphan-repeat-1`, `accepted-orphan-repeat-2` |

The clean-install resolution test invokes the game's actual `loginGooglePlay`
entry from a temporary Frida helper on the disposable emulator because the
initial tutorial has no Games menu button. It does not replace authentication,
return values or native reward behavior. Account-emulator authentication is
uninstrumented. Debug Frida has been stopped.

## Gameplay coverage shared with the preceding candidate

The immediately preceding receiver candidate has the same native repair, assets,
reward bridge and SDK receivers. Its only subsequent runtime change is moving
Games initialization behind the game's existing accepted-root Activity assignment.

- Completed Day 1: dough/sauce/cheese preparation, oven, cutting, serving,
  delivery, end-of-day results and transition to Day 2.
- A real video oven offer enables boost without spending its alternative 7-cash
  price; a tip offer enables 30 minutes; a sponsor offer adds exactly one gem
  (10 to 11), including Home/resume during completion.
- The new Day 2 save survives force-stop and full reboot. The final candidate
  reads that same save and repeats the clean-install reward/cancellation tests.
- Evidence: `day1-summary`, `day2-confirmed-header`, `reward-real-after`,
  `reward-tip-after`, `day2-sponsor-reward`, `day2-restart2-menu`.

## Retained failures and interpretation

- Original candidates had null bootstrap constants, native PairIP crashes and
  four SDK receiver failures. The initialization reconstruction addresses these.
- Old lifecycle candidate reproduces fatal Tapjoy receiver unregister during
  Activity destruction; application-context ownership removes it in the same
  scenario. `baseline-recreation-*` and `fixed-recreation-*` preserve the comparison.
- One earlier black renderer after an interrupted notification prompt and
  MicroG cancellation recovered with Home/resume. The invalid Games initialization
  in a rejected Activity was reproduced and fixed. The black symptom itself was
  not deterministic; it did not recur in the final clean/cancellation/orphan tests.
  Retain this as a regression scenario rather than claiming proven direct causality.
- The initial final-candidate force-stop comparison ran before the menu loaded.
  Authentication had already succeeded. The corrected test waits for actual
  progress/currency regions; both repeated starts then match exactly.
- The second final emulator reboot exceeded the helper's boot timeout. Android
  subsequently reached boot-completed; verification continued after that same
  reboot and passed. No Pizza process was running during the boot delay.
- Network recovery initially stopped at MicroG's renewed profile-consent screen.
  The helper had terminated the game while that external screen remained open,
  so the attempted restart did not authenticate and was correctly recorded as a
  failed test. After approving the already selected profile through the real UI,
  a normal start completed authorization and preserved the save. This was not
  silent/automatic offline recovery and no authenticated result was substituted.
- MicroG on debug had one earlier CheckinService foreground-service timeout,
  recorded separately from Pizza. It did not recur in the final tests.

## Device cleanup

MicroG is enabled on both emulators. Debug font scale is1.0, airplane mode is off,
`always_finish_activities` is absent, and the temporary debug Frida server is
stopped. User5554 was never reset, cleared or uninstalled. Its restored TapBlaze
save and original test signing key remain preserved. Debug Day2 backup is local
and was restored with the new installation UID and SELinux contexts; this is a
local recovery test, not a claim of Google cloud restore.
