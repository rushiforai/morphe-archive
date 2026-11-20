# Custom audio app row — state after the dev.6 crash

**Where the code is:** `custom-audio` branch (commit `ca40e06`). Not in the shipped bundle; `dev` is on
`0.30.63-dev.7`, which is dev.5 plus the YouTube row rename, 35 rows, verified 35/35.

**What the row does** (three edits, ported in our own style from `pomee4/waze-audio-patches`):

1. appends the package to `SdkConfiguration`'s `PackageNames` / `AppNames` / `InstallationUrls` / `Scopes`
   arrays with the audio-only scope `0x200000`, inside `getPartners()` on 5.27.9x and inside
   `updateAppList()` on 5.27.4 and older, after Waze's own null checks;
2. `aq.d(String)` answers true for that package instead of looking for its `ACTION_INIT` receiver;
3. `aq.e(String, String, Runnable)` short-circuits for that package and calls the SDK manager's
   `bf.O(Resources, pkg, token, Bundle{themeColor}, Messenger)` directly, returning its result.

**Crash:** toggling Waze's audio-partner switch on 5.27.90.900 with dev.6 crashes Waze. The owner narrowed
it to this row.

**Hypothesis tested and disproved:** a null `Messenger` in the `bf.O` call. `ao.<init>` guards it —
`iput-object p6, ao->e` then `if-eqz p6, :cond_1` before `Messenger.getBinder()` — so a null messenger is
handled, and it is not the crash.

**Still consistent with the evidence, in order of likelihood:**

1. the session built with a null messenger survives construction but dies later, when something calls
   `ao.e.send(...)` (lines around `ao.smali:1094`, `:1172`) — a null dereference inside Waze, not in our
   injected code;
2. `aq.d()` answering true puts the app into a list whose rows are built from `aw` fields the server would
   normally fill (icon base url, flags); a player that never registered may trip a later assumption;
3. a verifier rejection at class load of `aq` on this build (not seen in the dex scan, but only ART can
   answer it).

**Bisect plan (needs the phone + `adb logcat`, 5 minutes):**

Build three variants, each behind its own row so a single toggle isolates the stage:

- A: arrays only (row appears, never connects);
- B: A + forced installed check (Waze will try to connect and time out after 15 s);
- C: B + connect short-circuit (dev.6 behaviour).

Run each, flip the switch, `adb logcat -b crash -d` and `adb logcat -d | grep -A30 "FATAL EXCEPTION"`.
The stage that first crashes names the culprit; the trace names the exact frame.
