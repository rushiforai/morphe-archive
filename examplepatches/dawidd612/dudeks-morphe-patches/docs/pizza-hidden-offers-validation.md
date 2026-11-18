# Hide paid offers: validation, 2026-09-28

Candidate APK SHA-256:
`4baed6a374788afb3be919b74b08169eeb910440c7a76e842fe2ba4b82974da7`.
Local candidate bundle (version field still 1.31.1) SHA-256:
`b2f250b5fba247f969eed83418a858a7bc6d3d67a15f46f9b131dd9f1901652f`.

Published [v1.32.0](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.32.0)
from implementation `1bd0c2b` / metadata `c519c17`, workflow `36452104570`.
Release MPP SHA-256:
`e3a1e311b2b5fa756f527e0c1af7e7766c43a292885a7bbdd280a2c418f39cca`.
Downloaded checksum and GitHub build attestation pass. All 12 Pizza patch class,
bootstrap resource and extension entries are byte-identical to the tested local
candidate bundle. Version metadata and the new patch's default selection match.

Built from source with Java 21, then patched the clean 5.57.3 APKM with CLI
1.17.0/FULL and three selected patches: Skip rewarded ads, Google Play Games via
MicroG-RE, Hide paid offers. Both installations retain the existing test key.
All raw evidence, APKs, saves and test instrumentation remain ignored under
`artifacts/hide-paid-20260928` and timestamped `artifacts/pizza-runtime` folders.

## Verified results

- Source build and clean-input patch succeeded. All 35 input splits were
  checked: 34 native libraries and 6653 assets; only the exact reviewed ARM64
  library output differs. All game data tables remain unchanged.
- 1459 restored constants, four exact SDK restorations, five reward placement
  scenarios and 79 untouched bridge methods pass. All 2165 other executable
  billing methods retain canonical DEX parity. Native reconstruction tests and
  11 split-asset verifier regressions pass.
- On diagnostic AVD 5556, the existing Day 2 save survives the update. The
  starter popup disappears and the shop displays four gem-to-funds exchanges,
  without real-money sections. Buying 50 funds costs exactly 10 gems:
  cash 66.98 -> 116.98, gems 11 -> 1. Force-stop/relaunch retains the result.
- Runtime observation of the real Java checkout entry with starter, gems and
  unknown product IDs records three original cancellation callbacks on GLThread,
  zero purchase-success callbacks and zero internal Billing entry calls.
  Instrumentation forwards observed methods unchanged. Cash/gems/day regions
  remain pixel-identical in RGB; no item or balance is granted.
- The Day 2 sponsor reward remains functional: exactly one gem, 1 -> 2, and
  normal UI completion across background/foreground. No paid product is used
  to test rewards.
- Clean installation on disposable 5556 reaches age setup, real MicroG account
  resolution, cancellation and the Day 1 tutorial. The previous diagnostic save
  was archived first. No real user's account or save was cleared.
- Account AVD 5554: same-key update and two force-stop launches retain genuine
  Games sign-in success. Chapter 2 / Day 43, cash 361.24 and gems 36 are unchanged.
  OpenCV compares actual RGB pixels in the three menu regions after waiting for
  a rendered menu, rather than accepting an arbitrary loading screenshot.
- Two subsequent full reboots of account AVD 5554, with the diagnostic AVD
  closed and boot services settled, both pass: Games sign-in success, identical
  RGB save/currency regions, no new fatal exception/native crash/receiver error.
  The app is left installed and open at the preserved main menu.

## Failed attempts and limits

- The initial source patch stopped on its compatibility check: DEX uses a
  synthetic bridge between the existing cancellation Runnable and JNI, unlike
  JADX's simplified display. The corrected patch checks that existing bridge;
  full source build, clean patch and runtime tests above used the correction.
- An exploratory asset-table edit did not hide the native starter popup. It is
  not part of the source patch or final APK. The separate native visibility
  predicate replaces that experiment; no edited catalog assets are shipped.
- Early startup of the clean diagnostic AVD after reboot encountered System UI
  ANR, Activity recreation and a black game surface after cancelling MicroG.
  The game process did not crash; Home/resume did not recover the black surface,
  while force-stop/relaunch recovered Day 1. This run is **not a passing reboot
  test**. Related renderer/boot symptoms were also recorded before this feature;
  that history alone does not prove the cause of this occurrence. Failure
  captures are `hidden-clean-reboot-systemui-anr` and `hidden-clean-reboot-black`.
- The account AVD is tested separately with the other AVD closed and boot
  services allowed to settle. Do not equate emulator boot completion with a
  fully initialized UI, or silently count a recovered run as an uninterrupted
  pass.
- These checks do not establish physical ARM64 phone compatibility, every
  server-driven event advertisement, or restoration of a newly paid purchase.
  Checkout is intentionally cancelled. Existing purchase processing is preserved
  by code/data parity; no real-money transaction was performed.
