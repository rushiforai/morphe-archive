# Finamp synthetic fixture and Android acceptance

These three standard-library Python scripts exercise the real Finamp 1.0.1 APK
against a disposable local Jellyfin subset. They do not download dependencies,
contact an external server, sign/rewrite APKs, publish anything, or use accounts
other than the generated `fixture` user. Keep generated APKs, private state, keys, tokens and raw captures under ignored
`.scratch`. Reviewed synthetic screenshots and redacted reports may be copied
to the versioned evidence directory when publication is part of the task.

## Pure checks (no Android or SDK required)

Run from the repository root with Python 3.9 or newer:

```sh
python3 -B tests/finamp/mock_jellyfin_test.py
python3 -B tests/finamp/android_acceptance.py self-check
```

The HTTP tests start ephemeral loopback servers and write no output files. They
cover login/views/items, credit order, artist/album-artist union filters,
library/album/genre/type/ID filters, sorting, pagination totals, favorites,
playback reports, all eight decodable generated WAVs, images, HEAD/byte ranges,
CLI startup, control protection, redaction, and concurrent hold/release/reject
behavior. An optional source-decoder audit runs when `FINAMP_SOURCE` points to an
existing Finamp source checkout; otherwise only that audit is skipped.

```sh
FINAMP_SOURCE=/path/to/finamp-source python3 -B tests/finamp/mock_jellyfin_test.py
```

`self-check` is pure: parser requirements, fixed-target arguments, SDK discovery,
output-root containment, current IME state, and system-bar clipping. It never
calls ADB. `make_parser()` is exposed for additional parser checks.

## SDK and output assumptions

Set `ANDROID_SDK_ROOT` or `ANDROID_HOME` to an existing SDK, or pass global
`--adb /path/to/adb`. ADB can also be found on PATH. APK installation additionally
needs existing SDK `aapt2`, or global `--aapt2 /path/to/aapt2`. No setup is installed.

The target is intentionally fixed to **emulator-5580**, AVD **penguin**, API **35**,
boot completed, emulator hardware. All ADB commands include the serial. English
UI, a portrait disposable AVD, and `su 0` for read-only package-state archives are
assumed. There is no physical-device or arbitrary-serial override.

Default evidence root: **`.scratch/finamp/android`** in this repository, derived
from the script location rather than the current machine. `--out` must be below
that safety root. `--out-root` may select another directory inside this repo's
`.scratch`; paths outside it are rejected. The Android fixture writes below
`<out-root>/fixture-live`. Screenshots/XML/full labels go to files; capture stdout
is a short summary. `inspect --limit N` is bounded to at most 50 labels.

## Start the fixture

```sh
python3 -B tests/finamp/android_acceptance.py start-fixture
```

This verifies the AVD, starts/reuses the fixture on **127.0.0.1:18961**, and creates
only `adb -s emulator-5580 reverse tcp:18961 tcp:18961`. The server is kept running;
its PID, command, manifest, and request log are under `fixture-live`. A different
server or missing ownership manifest is a blocker, never a reason to kill it.

Standalone server, without Android:

```sh
python3 -B tests/finamp/mock_jellyfin.py --port 18961 \
  --data-dir .scratch/finamp/android/fixture-live
```

In Finamp, use `http://127.0.0.1:18961`, user **fixture**, empty password, library
**Fixture Music**, and original-quality streaming. Default standalone operation
without `--data-dir` keeps data in memory. It binds only to loopback.

Data: one album (**Fixture Credits**), three artists (**B Guest**, **Z Lead**,
**A Guest**), two genres, and eight four-second mono PCM WAV tracks. Tracks 1–6
supply `Artists=[B Guest,Z Lead,A Guest]` and album artist **Z Lead**. Track 8 has
only A Guest as song artist and Z Lead as album artist, distinguishing union
`ArtistIds` from `ContributingArtistIds`. IDs are stable 32-character hex. UserData
has varied dates/play counts/favorites and changes in memory on reports/toggles.

Implemented routes include public info, synthetic authentication/user/views,
items/details/latest/counts, artists/album artists/genres, favorites, playback
info/reports, primary artwork, lyrics, and direct audio. Normal Finamp playback
uses `/Items/{id}/File`; `/Audio/{id}/Universal` and WAV stream aliases also work.
Query results preserve full `TotalRecordCount` before pagination. `Fields` does
not trim metadata. HLS/transcoding is 501; PlayOn WebSockets, playlist CRUD,
metadata writes/deletion, and real accounts are absent. `/socket` 404s are known
non-blocking PlayOn noise. Unknown calls remain explicit in the request log.

## Deterministic HTTP controls

Controls require a loopback peer/Host, no Origin, and `X-Fixture-Control` equal
to the random `controlToken` in `manifest.json`. They are excluded from logs.

| Route | Effect |
|---|---|
| GET `/_fixture` | Manifest and stable IDs |
| GET `/_fixture/requests?since=N` | Retained snapshots, pending count, mode/scope |
| DELETE `/_fixture/requests` | Clear retained snapshots, keep increasing IDs |
| POST `/_fixture/control` | `{"mode":"hold","scope":"artist","holdTimeoutSeconds":120}` |
| POST `/_fixture/release` | Release waiters and set mode off |

Modes: `off`, `hold`, `reject`; scope: `artist` or `all`. Explicit Audio/
IsNotFolder queries without `Limit` are unbounded; artist scope also requires
artist IDs. Limit 0/1/5 queries succeed while unbounded queries are held. Holds
have a ceiling and a 32-waiter cap. Logs include lifecycle/status/timing and
redacted queries, never request bodies or auth headers. Disk JSONL has multiple
events per request ID; memory retains up to 5,000 final/live snapshots.

## Actual APK commands

Global options precede the subcommand. APK paths are explicit; originals are not
bundled. The matrix requires the official 1.0.1 input SHA-256
`0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.

```sh
python3 -B tests/finamp/android_acceptance.py verify
python3 -B tests/finamp/android_acceptance.py install --apk "$APK" --sha256 "$APK_SHA256"
python3 -B tests/finamp/android_acceptance.py --expected-features 7 \
  --out .scratch/finamp/android/core-7 suite --require-preserved-login
```

Feature bits: **1 title refresh / 2 artist order / 4 bounded artist requests**.
`--require-preserved-login` refuses to silently reauthenticate after an update.
`--require-preserved` also requires the seeded **PenguinSyntheticTitle** section.
Default install uses `-r`; failures never trigger implicit uninstall or reset.

Explicitly authorized clean replacement of only `com.unicornsonlsd.finamp` is
available as `install --clean --baseline-data PATH`. It requires a verified
synthetic state archive, matching archive and installed-APK hashes. It does not
remove the separate debug preview. `snapshot-data --title-marker Playlists`
archives only this synthetic package; title state is in Hive, login in Isar.
Archive creation stops the package for consistency but does not restore data.

## Title validity and real selectors

**Approved #1798 preserves `isEmpty/isNotEmpty`: `''` is invalid; every nonempty
string, including spaces, is valid. There is no new trimming rule.** The required
ordinary title is **Playlists**. Patched checks read Save before hiding the IME,
then test clearing back to empty; a layout refresh must not substitute for live
text-change state. A prior whitespace-rejection expectation was retracted.

Observed selectors use actual Flutter `content-desc` and text: `Get Started!`,
the composite `Finamp Synthetic Fixture` server card, `fixture`, `Log In`,
`Albums\nTab 2 of 6`, `Fixture Credits\nZ Lead`, composite song rows,
`Z Lead (Artist)\nZ Lead`, `Customize home screen`, `Add New Section`,
`Custom Section\nConfigure your own section`, and `Save`. The title EditText has
no useful label, so it is resolved uniquely within the observed editor. Saved
section editing scopes `Edit section` to the named row. Settings uses the quick
settings shortcut or the unlabeled drawer ImageView uniquely anchored to the
named Fixture Music toolbar, then the actual `Settings` and `Layout & Theme`.

Actions require fresh dumps, enabled controls, usable bounds, and safe window
insets. IME-service visibility can be stale; only current `mInputShown` decides
whether Back hides the keyboard. Text replacement verifies empty and final
focused values because ADB Ctrl+A did not select Flutter text. Screenshots are
real `screencap` PNGs, with raw XML and hashes. Bounds alone do not prove visibility
when the IME covers a control; never use an obscured capture as a visual before.

## Final same-key chain and evidence limits

Start from a fresh re-signed original mask 0 with fixture login and app-only Dark
theme. The older proof used enum-in-main-box storage; archive it and perform the
explicitly authorized one-package cleanup first. Do not migrate that old proof
as if it were final auxiliary-box storage.

```sh
python3 -B tests/finamp/android_acceptance.py \
  --out .scratch/finamp/android/final-chain matrix-chain \
  --apk "$OFFICIAL_ORIGINAL_APK" --signed-matrix "$SIGNED_MATRIX_JSON"
```

The observed chain **0 → 7 → 1 → 7 → 0 → 7 passed** using only `install -r` inside
the chain. Login and Dark theme survived every update. Metadata order survived
cold restart and both feature-off/original-code visits, restoring the song row
to **B Guest, Z Lead, A Guest** without reselecting it. First mask 7 also passed
default credits **Z Lead, A Guest, B Guest**, live Playlists Save-state checks,
and actual artist queries with **Limit=5/1/5**, zero unbounded requests and zero
holds. Original artist-page evidence had a held no-Limit request. The final
mask-7 native hash was independently verified as
`9af3249be1360cdf3b7662137e2ca2daec90d004a59c978e9526edd42062c85e`.
Android accepted the same-certificate updates; certificate fingerprints were
also recorded from Main's signed-matrix manifest. No signing is done here.

`original-title-roundtrip --apk ... --signed-matrix ...` is a separate isolated
same-key original-code visit followed by final-7 restoration. Fresh original XML
observed `Playlists` with stale Save disabled before IME hide, and empty text with
stale Save enabled. **The original PNG obscures the field/Save behind the IME; it
is XML evidence, not a suitable visible before panel.** Use after-only title
visuals or a separately identified upstream-widget-before image. Do not claim a
visible shipped-original title before image from that capture.

Main retains/copies authoring-run captures separately; none are vendored here.
Read each run's JSON outcome instead of treating earlier diagnostic failures as
current results. The GUI chain covers selected masks 0/1/7, not every flow on all
seven masks. Other source/CLI combinations are Main's separate evidence. All
four artist menu options were visible; default and Metadata order were exercised.
Auxiliary-file hashing now checks a real stat size first, so remote cat diagnostics
cannot masquerade as file contents. The initial authoring-run mask-0 raw auxiliary
probe was not verified and must not be used as an existence claim.


## Alphabet-navigation profile

`mock_jellyfin.py --profile navigation` preserves the original eight-track credit
fixture and adds **Alphabet Library**, a second album with 105 generated tracks.
The combined Tracks tab crosses its 100-item page boundary. Titles include
numeric entries, `Écho`, `Midnight` and `Zebra`; no personal files are used.
`android_acceptance.py start-fixture --profile navigation` selects this profile
when starting a new owned server and refuses to silently switch a running server.

On the original 1.0.1 build, Android Back can minimize Finamp while its drawer
hierarchy is visible. The new acceptance helper closes it by selecting the
observed **Fixture Music** library button before resolving tab controls.
Screenshots use fixed portrait size, Dark theme, matching filters and sort order;
the evidence documents any emulator density/SystemUI demo settings.
