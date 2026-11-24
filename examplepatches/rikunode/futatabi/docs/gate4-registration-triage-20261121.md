# Gate 4: board registration triage — 2026-11-21 (JST)

The preceding [five-point emulator gate](gate4-emulator-20261121.md) remains **FAILED** (items 1–2 FAIL, 3–5 untested). This follow-up isolates whether the app reaches the local fixture.

## Observations
- Emulator `emulator-5554`; unpatched futatter 3.1.1; fixture at `127.0.0.1:18766`; `adb reverse --list` reported `host-16 tcp:18766 tcp:18766` during the trials.
- Fixture HTTP logger captures UTC timestamp, method, path and User-Agent. The two captured HTTP requests were made by **Android Chrome**, not futatter:
  - 2026-11-21 **16:54:18 JST**: `GET /aimoge/`
  - 2026-11-21 **16:54:21 JST**: `GET /aimoge/thumb/1.png`
  - UA for both: `Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36`
- For board-add trials with `http://127.0.0.1:18766/aimoge/`, `http://localhost:18766/aimoge/`, and `http://10.0.2.2:18766/aimoge/`: **0 fixture requests** recorded during the attempts; UI dialog dismissed but no board appeared. The input and the OK button position were checked from UI hierarchy after keyboard hide for the successful-to-submit attempts.
- Emulator TCP `nc -z` to `127.0.0.1:18766` and `10.0.2.2:18766` both exited 0, corroborating transport connectivity. Chrome loaded the fixture HTML and thumbnail.
- **Positive control**: `https://may.2chan.net/b/` board addition succeeded. The resulting UI hierarchy contains a separate entry with `https://may.2chan.net/b/`, proving the board-add functionality works for that known URL. The earlier `http://may.2chan.net/c/` trial could not be distinguished from existing HTTPS entries; **do not count it as a successful HTTP scheme trial**.
- No definitive app error dialog or 404 message was found in the saved UI dumps. Brief Android toasts were not exhaustively captured.

## Interpretation
The HTTP fixture is reachable from emulator networking and its handler responds to Chrome, but futatter did not issue HTTP requests to it in the three local-URL registration tests. **The HTML format cannot yet explain the failure** because there is no evidence futatter fetched HTML. An app-side input validation/registration branch is the leading hypothesis, but whether it checks the scheme, port or hostname (or something else) is **not established**.

## Source evidence
- [Previous emulator gate report](gate4-emulator-20261121.md)
- `docs/gate-evidence/ip-after-confirmed-ok.xml` — IP URL registration attempt
- `docs/gate-evidence/hostalias-before-ok.xml` and `hostalias-after-ok.xml` — `10.0.2.2` trial
- `docs/gate-evidence/localhost-before-ok-1650.xml` and `localhost-after-ok-retry.xml` — localhost trial
- `docs/gate-evidence/may-proper-before-ok.xml` and `may-proper-after-ok.xml` — HTTPS positive control
- `docs/gate-evidence/fixture-access.log.pretest-1639` and live `fixture-access.log` — HTTP observation
