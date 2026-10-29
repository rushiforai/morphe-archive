# Actual Finamp APK acceptance — 2026-10-28

[Verification report](verification.json) records the original APK and native
hashes, seven real patcher combinations, four rejected inputs, source-test
counts and the six-stage same-key Android update chain. [Capture provenance](captures.json)
records the unedited PNG hashes. All music, names, login and server responses
are generated fixture data. These are Android APK screenshots, separate from
the Flutter widget goldens linked in the upstream PRs.

| Scenario | Original code | Native patches |
| --- | --- | --- |
| Album song credits | [Alphabetical](credits-before.png) | [Album artist first, others alphabetical](credits-after.png) |
| Artist page with unbounded queries held | [Spinner / zero count](artist-held-before.png) | [Count and preview visible](artist-held-after.png) |
| Custom title, before hiding keyboard | Original APK XML reproduces stale Save (the IME obscures the PNG); see also upstream widget before/after evidence | [Empty title invalid](title-empty-after.png), [typed title enables Save](title-valid-after.png) |
| Optional song-credit mode | No setting in original | [Saved mode](artist-order-setting.png), [metadata-order credits](artist-order-metadata.png) |

The credit pair uses the same Dark theme. The held-query pair uses Light for
the original and Dark for the final APK; the theme change is a fixture choice,
not patch behavior. Its evidence is the visible preview/count plus the recorded
bounded/unbounded HTTP queries, not a measured speed ratio.

Mask 0 is the official original APK re-signed with the same disposable
certificate as masks 1–7, to permit update testing. Its native code matches the
official original. The chain uses `install -r` only: **0 → 7 → 1 → 7 → 0 → 7**.
It preserves synthetic login and Dark theme, verifies live title validation and
bounded loading on mask 7, and restores the chosen Metadata order after cold
restart and after feature removal/reapplication. It does not prove that a
different certificate can update an official installation.

The isolated original-APK roundtrip also reproduces stale Save in the current
UI hierarchy: `Playlists` leaves it disabled, and empty text leaves it enabled.
Both controls are obscured in that probe's PNG, so it is not published as a
visual before-image. The restored final APK retains login/theme/Metadata order.

The earlier baseline acceptance runner stopped on an incorrect whitespace-test
expectation. The corrected native acceptance retains Finamp's existing
`isEmpty` rule: whitespace is nonempty and valid. The report records this
boundary explicitly; no trimming rule was added to make a test pass.

Physical/OEM devices, other Android versions, live Jellyfin performance/RAM and
on-device Manager execution are outside this recorded run. Both tested Desktop versions return valid rejection reports naming a selected
patch, nonzero exit status and no output APK. Selected attribution is required
for Manager 2.x, which filters unselected dependency errors.
