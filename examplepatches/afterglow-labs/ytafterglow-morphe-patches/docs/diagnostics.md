# About actions and diagnostics

About contains Advanced mode, cache maintenance, preferences transfer, full
settings reset and diagnostic logging. These base settings are available when
any Afterglow tweak is installed.

Advanced defaults OFF and reveals the advanced pages and search entries live.
Clear cache removes the app's cache asynchronously and retains preferences and
files. Restore default settings asks for confirmation; No leaves the app alone,
and Yes clears only Afterglow's preference domain, flushes pending writes and
relaunches YouTube through its internal restart activity.

## Log behavior

Debug logging and Firehose default OFF. Downloads, Player UI and Premium controls
categories default ON; Picture in Picture and Diagnostics default OFF. Category
prefixes match `Utils/YTAGLog.m` in the iOS reference. Firehose enables logging,
bypasses the category filters, and includes player response and clock events.
Turning the master switch OFF also turns Firehose and the HUD OFF.

The log keeps 200 recent entries in memory. A serial worker writes
`ytag-debug.log` in app-private files storage, rotating at one MiB to a single
`.1` backup. Entries use `HH:mm:ss.SSS [category] message`. Messages are redacted
before entering the worker queue and bounded to 1024 characters plus a truncation
marker. Redaction covers URLs, private paths, authentication/cookie fields,
visitor and tracking data, account identifiers, prompts and video identifiers.
Native video events use salted process-local correlation identifiers.

Native player creation, status, play/pause, player type and Shorts open/close
callbacks supply events where their Afterglow hooks are installed. Preference
changes record key names without values. Extension exceptions add a short class
summary. Installing the logger does not enable unrelated native feature hooks.

OFF stops new diagnostic entries and retains existing logs. Clear debug log and
the HUD's double tap clear the ring, current file and backup in worker order.
Sharing waits behind pending writes or clears, reads the current file, and falls
back to the ring when necessary. An empty log follows the existing translated
No log yet path.

## Sharing and HUD

The Android chooser receives `YTAfterglow-debug-log.txt` through an unexported,
read-only content provider. Each share has a separate immutable snapshot URI;
only the selected recipient receives read access. The provider supports metadata
and reading the exact snapshot, with no insert/update/delete or file-path input.
The four newest cache snapshots are retained. Clearing app cache removes those
copies; it does not erase the private diagnostic file. Clipboard is the fallback
if file sharing cannot open.

The HUD is a translucent rounded panel, at most 320 by 180 dp, with monospaced
9-sp text showing the end of the latest 25 entries. It attaches to the foreground
app activity and detaches on pause, so it requires no system overlay permission.
Touches outside the panel remain available to native YouTube. Dragging follows
raw screen coordinates and clamps the panel inside the window; rotation updates
its bounds. Double tap clears the log. A stationary 600-ms hold hides the HUD and
sets its preference OFF. Enabling the HUD enables logging; cold launch restores
it after the iOS-equivalent two-second delay.

## Validation and remaining coverage

`python3 -B -I tools/check_debug_log.py` checks category routing, redaction, ring
limits, actual file rotation/clear, concurrent appends and disk-error retention.
The settings check also compiles the logger's Android dependencies.

Delivered build89 verifies Advanced OFF/ON, cache reduction from 155.4 MB to zero
with preferences retained, reset cancellation, a new process after confirmation
and restored values. Fourteen observations are reviewed. An extra native-screen
observation from an incorrect test launch is retained and excluded.

Development build91 has 34 reviewed observations, including preserved buffering,
incorrect test-navigation/tap assumptions and a real half-distance drag finding.
Its valid continuations verify category filtering, Firehose override and cold
native playback/file persistence. Build92 fixes raw-coordinate dragging and passes
91 log tests, 427 settings checks, strict selections 28/29/30/1/3, ZIP integrity
and all 251 production hashes. Twenty-six full and fifteen independent observations
are reviewed. Final checks cover exact drag distance/edge clamping, rotation,
advancing decoded playback, pause/resume, share receipts, cold base persistence,
clear and actual page reset. Both final log audits are clean. Wrapper interruptions
are preserved with bounded continuations; no unexplained termination is attributed
to an app defect. Defaults and the exact full APK are restored and stopped.

Evidence is recorded by execution-92.json and diagnostics-audit-92.json under
port-completion-20261113; delivery-92.json records the committed-source bundle.

Native network Firehose capture and diagnostic events for unported download,
Premium controls and offline features remain pending. PiP category routing and
its native player-type event are connected, but device PiP activation has not
been verified. Physical devices remain untested. The full Android port is active.
