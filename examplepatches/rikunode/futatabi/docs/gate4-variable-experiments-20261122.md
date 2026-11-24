# Gate 4 — isolated URL-variable experiments (2026-11-22 JST)

**Outcome: no single-variable explanation established. The stage-4 board-add gate remains FAILED; stages 5+ are not authorized by this result.**

The previous 2026-11-21 [emulator gate](gate4-emulator-20261121.md) and [HTTP-log triage](gate4-registration-triage-20261121.md) are preserved. The following tests used **unmodified** futatter 3.1.1 (`com.Nanasaki.ftutter`, versionCode 65) installed from the previously hash-verified XAPK. The input field was checked against the **exact requested URL** in the Android UI hierarchy before tapping the current-position OK button.

| Trial | Environment and input | App result | Fixture access-log delta | Interpretation |
| --- | --- | --- | --- | --- |
| 1 — HTTP scheme | Cleared futatter app data in `Medium_Phone_API_36.0`; entered **`http://may.2chan.net/b/`** | **PASS:** a distinct `https://may.2chan.net/b/` board entry appeared. The app may have canonicalized it, but that mechanism is unverified. | **0** (expected: external real board) | Plain HTTP in the input is **not categorically rejected**. |
| 2 — standard port | Switched to the existing **`MTManager_Debug_API36`** Google APIs AVD. Debug `adb root` allowed **`adb reverse tcp:80 tcp:80`** after a production AVD refused with `Permission denied`. Windows fixture bound `127.0.0.1:80` and returned HTTP 200. Entered **`http://127.0.0.1/aimoge/`** | **FAIL:** dialog closed; no board added | **0** | A nonstandard port **alone** does not explain failure. |
| 3 — domain-shaped host | On the debug AVD, `adb reverse tcp:18766 tcp:18766`. Direct `/etc/hosts` write failed (read-only filesystem); temporary bind mount displayed `local.test` but Android resolver still said unknown host. Unmounted and restored hosts. Instead used **`127-0-0-1.nip.io`**, confirmed by device `ping` to resolve to **127.0.0.1**. Entered **`http://127-0-0-1.nip.io:18766/aimoge/`** | **FAIL:** dialog closed; no board added | **0** | Simply replacing the IP literal/localhost with an ordinary DNS hostname **does not make registration succeed**. This substitute does not prove behavior for an actual `/etc/hosts` mapping. |

For trials 2–3, the fixture was reachable through independent probes, and the reverse mapping was confirmed immediately before submission. The access log contains **no requests from futatter during any of these trials**. The only logged port-80 request came from **Windows PowerShell**, and earlier port-18766 requests came from Chrome or Python smoke tests. See [fixture-access.log](gate-evidence/fixture-access.log).

## Saved direct UI evidence
- [Trial 1 exact input](gate-evidence/exp1-before-ok-validated.xml) and [registered board](gate-evidence/exp1-after-valid-submit.xml)
- [Trial 2 exact input](gate-evidence/exp2-before-ok.xml) and [absent board](gate-evidence/exp2-after-ok.xml)
- [Trial 3 exact input](gate-evidence/exp3-before-ok.xml) and [absent board](gate-evidence/exp3-after-ok.xml)
- Screenshot captures for all three trials: `gate-evidence/exp1-result.png`, `exp2-result.png`, `exp3-result.png`

An initial trial-1 keyboard input produced `htttp://`; this was **excluded**. The submitted trial-1 input was independently checked and exactly `http://may.2chan.net/b/`.

## Narrow static inspection (only because no variable identified the cause)

The verified arm64 split contains Flutter AOT `libapp.so`, **11,207,584 bytes**. Literal search confirmed `.2chan.net/`, `https://may.2chan.net/b/`, `futaba.php`, `#cattable > tbody > tr > td`, and `^https?://www.2chan.net((/)|(/bbsmenu.html)|(/index2.html)|(/i.htm))?$` at offset **0xb981e**. That regular expression specifically refers to the www.2chan.net **board-menu page**, not demonstrably to arbitrary board registration. String presence **does not prove** which condition is checked when the app adds a board. No Dart AOT control-flow decompilation was completed; the exact rejection branch remains **unknown**.

**Conclusion:** three individually tested differences (HTTP input scheme, nonstandard port, IP-literal/localhost host shape) do **not** explain registration failure on their own. Remaining plausible causes include a hardcoded board domain or known-board list, a combination of conditions, a URL-specific parser, or another registration rule. None is established by these tests. The existing design **cannot be considered validated** for arbitrary localhost board registration.

No patch, bridge, adapter or new GitHub Release was created; this report is for MUSE to decide how registration should be handled.
