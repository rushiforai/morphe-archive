# Gate 4 — Android emulator result (2026-11-21 JST)

**Decision: FAIL / gate not passed. Do not start bridge/adapters (stages 5+).**

## Test environment
- Windows Android emulator: `emulator-5554`, ABI `x86_64,arm64-v8a`, Android SDK 36.
- Untouched futatter 3.1.1 (`com.Nanasaki.ftutter`): `adb install-multiple -r` returned `Success`. Installed base APK plus arm64-v8a, mdpi and English split APKs (no Morphe patches).
- Input XAPK SHA-256: `11dae3fa2c2882f1223cacbdc14b62bcf2d6ed04bc4436d9fc988e98d6ea53dc` (matched). Inner base APK SHA-256: `f8093dd9cae64a48b0e74831800782a747045902e2171855a672195ef5690486` (matched).
- Windows fixed fixture was listening at `127.0.0.1:18766` (PID 87012). `adb -s emulator-5554 reverse tcp:18766 tcp:18766` succeeded, and `adb reverse --list` showed `host-16 tcp:18766 tcp:18766`.
- Unrelated Windows service on port 18765 was left untouched.
- Local fixture HTTP checks had previously confirmed catalog/thread/image = 200 and POST = 403.

## UI observations and verdict

| Test | Verdict | Evidence |
| --- | --- | --- |
| (1) Add `http://127.0.0.1:18766/aimoge/` | **FAIL** | Flutter board-add dialog displayed exactly this URL (UI hierarchy `EditText.text`), then OK was tapped at the button's actual bounds. Dialog closed, but no board was registered in the visible list. [Input screenshot](gate-evidence/01-url-entered.jpg), [after submit](gate-evidence/02-after-submit.jpg) |
| (2) Board appears in board list | **FAIL** | Only default `2chan.net` / `ねこ` remained in both screenshot and UI hierarchy; no `aimoge` or `18766` field. [After submit](gate-evidence/02-after-submit.jpg) |
| (3) Existing catalog UI shows thumbnail/title/reply count | **NOT TESTED** | Blocked by tests 1–2; cannot open the missing board |
| (4) Existing thread UI shows body/post numbers/images | **NOT TESTED** | Blocked by tests 1–2 |
| (5) Board persists after restart | **NOT TESTED** | The app was force-stopped and relaunched; the board was still missing, but persistence cannot be assessed for an entry that never registered. [After restart](gate-evidence/03-after-restart.jpg) |

The first scripted input attempt was incomplete; it was **corrected and verified in UI hierarchy before final submission**. This report uses only the corrected submission. The UI accessibility dump confirmed the exact string `http://127.0.0.1:18766/aimoge/` and the OK control before tapping.

There was no definitive app-side error message captured; **the reason for registration failure remains unknown**. Do not claim that URL validation, the fixture HTML, network security policy or ADB transport specifically caused it without further evidence.

## Scope boundary
- No Android bridge / ContentProvider / Aimoge / Animanch adapter code was implemented.
- Banner patch remains stage 3 *static verification PASS* only. Signing, post-patch advertisement/rewarded behavior and final device checks remain pending.
- No GitHub Release.
