# Testing

Offline course download, disconnected study, restart persistence, and automatic
server synchronization have separate [acceptance evidence](offline-mode.md).
The current local suite passes 17 tests; the folder-only results below remain
the historical acceptance record for that patch.

## Current evidence

- Original 3.0.4 APK installs and launches on a fresh headless Android 15 ARM64 emulator.
- Original app reaches the email/password login screen.
- Static inspection located the folder and random-review restrictions described in
  [patch-design.md](patch-design.md).
- [CI run 35977727563](https://github.com/JCapretta/chessable-patches/actions/runs/35977727563)
  passed all 11 tests with zero skips and built the bundle on commit `7bac646`.
- Local Java 21 verification passes all 12 tests with zero failures or skips,
  including the additional trial-banner navigation regression test.
- Morphe Desktop 1.17.0 applied the bundle and signed the test APK successfully.
- An independent archive comparison verified exactly the six intended edits and
  checksum update. All six functions also disassemble successfully with hermes-dec.
- A modified bundle with a valid checksum was rejected by Morphe; no output APK
  was produced.
- Patched app installs and reaches the same login screen on a separate fresh
  headless Android 15 ARM64 emulator, with an empty crash log.
- Patched bundle SHA-256:
  `b21c83592645c3eb4f6e953654bc66ca8d1861e2ec7280b8dbdfa84cc9f1f922`.
- Original app signs into the dedicated fresh account and completes onboarding.
  Both original and locally built patched apps authenticate successfully.
- Live testing found the original dashboard replaces Folders with a trial banner
  on this fresh account. The added navigation edit restores the native entry.
- Folder test contains Beginner Starter Kit (course 295333) and Everything You
  Need to Know About Chess (193039). Basic Endgames (6371) stays outside it.
  An Empty test folder has no courses. Membership survives app restart.
- Original-app learning is visible in the patched app: course counts are 7/60,
  2/92, and 1/194 respectively. Some starter-course entries are introductory reading.
  Actual tactical and endgame recall exercises were also completed.
- Empty folder displays its native empty state. The two-course folder lists only
  its members and has no review action while nothing is due. Light-theme screens
  were inspected and retained privately.
- Account remains non-PRO; no trial was activated. Native Dark selection persisted
  but the UI stayed light after restart. Dark-theme rendering is **not validated**.
- Live non-PRO acceptance on 2026-09-25 passed for patch code at
  `cef5ad7762a99f5d898c753788261e7ecd8bec68`, using the APK and bundle
  fingerprints above on headless Android 15 ARM64.
- Initial due variations: Starter Kit 1, Everything 2, Basic Endgames 1.
  The two-course folder displayed **Review Folder (3)** and opened Starter Kit.
  Completing it advanced to Everything, without selecting Basic Endgames.
- Canceling after Starter Kit reduced the folder count to 2. After force-stopping
  and restarting the app, the completed review remained saved and folder review
  resumed the two Everything variations. Both completed with 100% accuracy.
- After completion, neither member course nor its folder offered due review.
  Refreshing the original, unpatched app independently showed both member courses
  clear and Basic Endgames still at 1 due variation. Global due count went from
  4 to 1. No scheduling data or server results were fabricated.
- The native randomized-review control was editable without PRO. Both enabled and
  disabled states survived force-stop/restart. Folder review completed while the
  preference was enabled; sequential review crossed courses earlier in the run.
  The small sample does not establish a statistical distribution of random order.
- Global Review All and normal single-course review both opened Basic Endgames.
  The random switch remained absent in single-course mode, as intended. These
  entry/cancel regressions did not complete the outside variation.
- Pausing the control variation removed its due count. Adding its course to the
  separate test folder produced no folder-review action. Unpausing through the
  native course page restored **Review Folder (1)**.
- With the test emulator offline, folder review displayed the native connection
  error. Restoring connectivity and selecting Retry opened the same folder's
  Basic Endgames variation.
- For the missing-folder race, one client held that folder request offline while
  a second patched client deleted the disposable folder through the native UI.
  Reconnecting and retrying produced **Oops! Something went wrong. Please try
  again.** with Go back, rather than falling back to global review. Course data
  remained intact. The original-app persistence evidence was captured before
  reusing that emulator as the second patched client.
- No fatal exception appeared in the patched app's crash buffer. Both emulators
  were shut down after testing. Private screenshots retain the relevant states.
- PRO-account regressions: **not tested; no PRO account supplied**.
- Dark-theme rendering remains **unverified**. Exact next-review timestamps and
  statistical cross-course randomization were not independently asserted.

The real folder queue, review persistence, eligibility counts, cancellation,
restart, preference persistence, and failure handling have authenticated evidence.
The limitations above are not represented as passed checks. Automated tests cover
patch integrity and branch semantics, not Chessable's authenticated service.

## Automated checks

`task verify` checks whitespace, runs Kotlin tests, and builds the `.mpp` bundle.
Tests cover malformed input, wrong versions, unexpected code, corrupt checksums,
overlapping edits, input immutability, bounded changes, repeat application, and
the branch/register semantics of the edited instructions.

Apply the bundle with the official Morphe Desktop CLI to the supported original
APK. Use `scripts/verify-patched-apk.py ORIGINAL.apk PATCHED.apk` to independently
check that only the declared bundle bytes and checksum changed. Install the
result in an isolated headless emulator, launch it, and inspect screenshots and
crash logs. A successful patch or login-screen launch is only a smoke test.

## Authenticated acceptance procedure

Use a dedicated non-PRO account, not a personal study account. Arrange credentials
through a private local file or another agreed mechanism. Never put passwords,
tokens, raw network logs, APKs, or extracted app code in Git or CI artifacts.

Prepare a folder with two accessible courses, each containing several learned
variations due for review. Keep another course with due material outside the
folder. Also prepare an empty folder and paused or not-yet-due material. Record
course IDs, folder membership, and initial counts privately.

1. On the original APK, confirm the account is non-PRO and the folder action is
   hidden despite due reviews. Capture the baseline without account identifiers.
2. Use a separate clean emulator installation for the patched APK. Sign in with
   the same test account. Verify the button label, count, placement, and themes.
3. Start folder review. Finish variations from both courses. Record course IDs;
   none may come from outside the selected folder or be ineligible for review.
4. Turn the native randomized setting on and off. Verify that it persists after
   restart and that enabled mode can select across courses between variations.
   One randomly contiguous run does not prove randomization failed. Inspect the
   selected native branch alongside multiple-course session evidence.
5. Cancel and restart review. Completed work must remain saved; remaining eligible
   work must remain available. Finish the session and check due counts.
6. Refresh the account in the original app. Verify persisted progress and next
   review times for completed material, with the outside course unchanged.
7. Check empty and fully reviewed folders, paused variations, a folder deleted
   before loading finishes, and a temporary connection failure. Missing folders
   must stop with an error, never expand to global Review All.
8. Exercise normal single-course review and global Review All. Confirm the account
   remains non-PRO and unrelated premium controls keep their original behavior.

Use only owned test emulators with `-no-window`. Drive taps and inspect UI with
ADB; capture screenshots with `adb exec-out screencap -p`. Store evidence privately,
then commit a sanitized results summary naming the APK fingerprint, patch commit,
Android version, account tier, date, scenarios, and any limitations.

If additional real due material must be prepared, use normal study operations and
wait for it to become due. Do not fabricate server success or modify production
scheduling to make a test pass. Deterministic branch tests supplement live review;
they are not a substitute for the authenticated queue and persistence tests.
