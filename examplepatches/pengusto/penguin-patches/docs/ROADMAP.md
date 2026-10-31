# Contribution queue

## Current direction — 2026-10-29

The next application tracks are **Mihon**, **Read You** and **AntennaPod**, focused
on reliable downloads/reading state, complete feed imports and Android Auto queue
updates. The [dated app-expansion plan](research/2026-10-29-app-expansion.md)
records current source facts, existing PRs, contribution restrictions, first
release slices and acceptance gates. These are investigation targets, not
released or APK-verified patches. Maintain the seven shipped Finamp patches and
their source PRs alongside this expansion.

The following sections preserve the earlier 2026-10-28 inventory.

Checked **2026-10-28** against GitHub and current upstream source. Re-read issue
discussions and PRs before implementation: this is a dated triage, not a claim
that every reported symptom still reproduces.

Finamp title/banner upstream statuses were refreshed **2026-10-29** below;
the remaining issue inventory and test records retain their dated scope.

The contribution inventory below was taken against Penguin [v1.0.1](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.1)
(13 patches / 10 apps). The three delivered Finamp source contributions now also
have [selectable native patches](FINAMP_NATIVE.md) for the original official
Finamp 1.0.1 APK, producing ARM64 output. Other roadmap candidates remain
investigations; consult the generated catalogue for the current release.

## Mihon status — 2026-10-30

Default-category download retention has a version-pinned optional [Mihon patch](MIHON.md)
and real Manager/data acceptance. The `0L` correction already exists in Marc Went /
Dunky13's [PR #4182](https://github.com/mihonapp/mihon/pull/4182), head
`11ebfe1d6d204c02a0622a42b3087ad9ccfdb8a8`; main remains
`e588e04359fe1058206a2cbac1b01018ad787359`. Reuse that PR and supplement it with
[public regressions](https://github.com/pengusto/mihon/commit/473c67a); no duplicate
fix PR. This does not implement its separate Hide/Unhide feature.

## Historical Finamp-first queue

[Finamp](https://github.com/finamp-app/finamp) is the Jellyfin music client,
licensed MPL-2.0. Its contribution branch is `redesign`; inspected source:
`b72ba46a45eb45836516f23e3df989c89c693c88`. The complete open-issue/PR inventory
at the check contained **341 issues and 51 PRs**. Priority combines reproducibility,
user impact, existing work and verification cost; it is not a reaction-count ranking.

| Priority | Issue cluster | Decision and next acceptance evidence |
| --- | --- | --- |
| Merged upstream; 1.0.1 backport retained | [Custom-section title #1798](https://github.com/finamp-app/finamp/issues/1798) | [Source PR #1830](https://github.com/finamp-app/finamp/pull/1830) merged into `redesign` on 2026-10-29: live validation/preview and a persistent text controller. Four widget regressions and all 29 tests pass. The selectable Penguin patch remains available for original 1.0.1. [Scope and verification](FINAMP.md). |
| Existing upstream hotfix; 1.0.1 backport retained | [Quick-settings banner contrast #1756](https://github.com/finamp-app/finamp/issues/1756) | Existing fix on `hotfix-1.0.2`, originally committed as [`124edc8`](https://github.com/finamp-app/finamp/commit/124edc8b94ea8fcba637a1dba31e7bd266644aa8) on 2026-10-17. Duplicate [PR #1837](https://github.com/finamp-app/finamp/pull/1837) closed on 2026-10-29. The selectable Penguin patch remains available for original 1.0.1. [Release status and refs](FINAMP.md#upstream-status-2026-10-29). |
| Delivered source contribution | [Song artist credit order #1833](https://github.com/finamp-app/finamp/issues/1833) | [Source PR #1831](https://github.com/finamp-app/finamp/pull/1831): album artists first, remaining credits alphabetically; metadata, first-credit and alphabetical alternatives. 58 tests and Android ARM64 debug compilation pass. [Scope and verification](FINAMP.md#song-artist-order). |
| Delivered source contribution | [Artist screen #1732](https://github.com/finamp-app/finamp/issues/1732) | [Source PR #1832](https://github.com/finamp-app/finamp/pull/1832) removes full-discography display queries, uses bounded preview/count requests and preserves download-status inputs. 41 tests (16 new), clean targeted analysis and Android ARM64 debug compilation pass. Synthetic preview response: 2,148,827 → 2,092 bytes; not a live-library timing measurement. [Scope and verification](FINAMP.md#artist-page-loading). |
| Delivered | [Offline artist tracks #1689](https://github.com/finamp-app/finamp/issues/1689) | [PR #1834](https://github.com/finamp-app/finamp/pull/1834): compare downloaded track credits with the selected artist. Optional native patch and matched APK captures: [acceptance](../tests/finamp/README-next-fixes.md). |
| 1 — correctness | [Likes disappear on track change #1822](https://github.com/finamp-app/finamp/issues/1822), [favorites do not reliably reach Jellyfin #1778](https://github.com/finamp-app/finamp/issues/1778) | Possible shared favorite-state/sync problem, not yet a proven common cause. Compare server state with UI state across track changes, delayed/failed requests, rapid toggles and restart. [PR #1736](https://github.com/finamp-app/finamp/pull/1736) adds star ratings and touches adjacent media/API paths; coordinate rather than assuming it fixes favorites. |
| Delivered correctness / larger follow-up remains | [Tracks alphabet scroller #1790](https://github.com/finamp-app/finamp/issues/1790), [jump-to-letter #694](https://github.com/finamp-app/finamp/issues/694) | [PR #1835](https://github.com/finamp-app/finamp/pull/1835) fixes the mismatched target/candidate case comparison; source widget tests include offline, descending and unloaded-page cases. The larger #694 performance work remains separate. [PR #1786](https://github.com/finamp-app/finamp/pull/1786) explicitly covers album/artist grids and excludes track-list fast scrolling. A track fix needs bounded seeks and queue-order regression checks. |

### Performance scope that must survive a fix

All three PRs and their issues now include before/after widget captures, source
patch links and an optional [combined three-fix preview](https://github.com/pengusto/finamp/releases/tag/penguin-preview-2026-10-28-r2).
The combined source passes **78 tests** and its ARM64 debug APK updates the
previous fixture preview and starts to the welcome screen on Android 15. All
seven PNGs reproduce byte for byte in isolated clones; the
[public harness and provenance](https://github.com/pengusto/finamp/tree/7e168434482e4e1e7b77a0c37337edb28291e2f8/contribution-evidence/2026-10-28)
identify synthetic fixture data and exact revisions. At the 2026-10-28 evidence
capture, upstream Actions required maintainer approval (`action_required`);
local checks do not establish CI success or live Jellyfin/device acceptance.
The title PR's subsequent upstream merge is recorded separately above.

The #1732 discussion correctly warns against adding overlapping counts. Primary
server source establishes that `ArtistIds` already includes track and album
credits, so PR #1832 uses its distinct `TotalRecordCount` instead. The download
button still receives album count + performing-query track count as its expected
direct-child count; complete Play/Shuffle enumeration stays on demand. Offline
counts retain the existing local providers. See the linked server evidence in
[FINAMP.md](FINAMP.md#artist-page-loading). The issue's network timings remain the
reporter's measurements, not our benchmark.

### Reuse existing work and reject false starts

| Candidate | Current evidence / action |
| --- | --- |
| [Search #1729](https://github.com/finamp-app/finamp/issues/1729) | Open [PR #1730](https://github.com/finamp-app/finamp/pull/1730); review or contribute there. |
| [Local-network preference #1734](https://github.com/finamp-app/finamp/issues/1734) | Open [PR #1821](https://github.com/finamp-app/finamp/pull/1821) addresses Android network hand-offs; reproduce remaining behavior before proposing another fix. |
| [Custom headers #1760](https://github.com/finamp-app/finamp/issues/1760) | Open [PR #1805](https://github.com/finamp-app/finamp/pull/1805). |
| [Android widget #156](https://github.com/finamp-app/finamp/issues/156) / [Play On #616](https://github.com/finamp-app/finamp/issues/616) | Open [PR #1632](https://github.com/finamp-app/finamp/pull/1632) / [PR #1642](https://github.com/finamp-app/finamp/pull/1642). |
| [Prefer downloaded files #1745](https://github.com/finamp-app/finamp/issues/1745), [cellular/local preference #1656](https://github.com/finamp-app/finamp/issues/1656) | Maintainer confirms local audio already takes precedence. Separate audio-source choice from online metadata fetching before calling this a missing feature. |
| [Album normalization #1687](https://github.com/finamp-app/finamp/issues/1687) | Merged [PR #1596](https://github.com/finamp-app/finamp/pull/1596) adds album gain; reporter says current source works on Linux. Reproduce an Android-specific remainder first. |
| [Empty Genres #1696](https://github.com/finamp-app/finamp/issues/1696) | Merged [PR #1670](https://github.com/finamp-app/finamp/pull/1670) fixes an empty Genres tab; verify a remainder on current source. |
| [Empty album tracks #1766](https://github.com/finamp-app/finamp/issues/1766), [server-upgrade #1412](https://github.com/finamp-app/finamp/issues/1412) | Maintainer points to Jellyfin migration metadata and rescanning. The issue's proposed recursion change is a hypothesis, not a validated app fix. |
| [Queue removal #1566](https://github.com/finamp-app/finamp/issues/1566) | Current `track_menu.dart` includes `RemoveFromQueueMenuEntry`. Verify the affected queue surface before adding a duplicate action. |

## Other Android apps

These are focused follow-on investigations. No new patch/APK compatibility is
claimed. Finamp received a complete inventory; the other apps received targeted
issue reads, recent issue samples, open-PR lists and relevant merged-PR searches.

| Order | App / bundle | Why it is useful | Existing work and boundary |
| --- | --- | --- | --- |
| 1 | [ReadYou](https://github.com/ReadYouApp/ReadYou): [#1254](https://github.com/ReadYouApp/ReadYou/issues/1254), [#1121](https://github.com/ReadYouApp/ReadYou/issues/1121), [#1240](https://github.com/ReadYouApp/ReadYou/issues/1240) | Read articles become unread again after local/FreshRSS synchronization; repeated notifications can be another symptom. Strong state-preservation test opportunity in a native Android app. | [Merged PR #1269](https://github.com/ReadYouApp/ReadYou/pull/1269) fixes one DAO overload, so start after that fix and check the release containing it. #1254 still has a later 0.16.2 report. Local and FreshRSS paths may need separate fixes; no assumption of one cause. No matching read-state fix appeared in the 34 open PRs. |
| 2 | [AntennaPod](https://github.com/AntennaPod/AntennaPod): [Inbox/tag filters #7782](https://github.com/AntennaPod/AntennaPod/issues/7782) | Clearly scoped queue/inbox navigation improvement with an implementation discussion. | Read the linked maintainer conclusions. No matching PR appeared in the 31 open PRs. [Contribution policy](https://github.com/AntennaPod/AntennaPod/blob/develop/CONTRIBUTING.md) requires an issue without Needs: Triage/Decision; #7782 currently meets that condition. Per-podcast enqueue settings [#7292](https://github.com/AntennaPod/AntennaPod/issues/7292) still need a decision and another author already has a prototype. |
| 3 | [Feeder](https://github.com/spacecowboy/Feeder), [image zoom #391](https://github.com/spacecowboy/Feeder/issues/391) | Finish the upstream path for a Penguin patch that already exists. | Our [PR #1291](https://github.com/spacecowboy/Feeder/pull/1291) is open and mergeable; current applicable CI checks pass. The maintainer's formatting feedback already has a follow-up commit. Maintain this PR rather than submitting another. |
| 4 | Existing Fossify / Tasks.org / Kvaesitso patches | Reuse the existing APK fixtures, runtime modules and prior evidence. | Refresh the linked issue conversations and native-PR state first. Historical local candidate notes are not the current release or PR inventory. |

## Delivery workflow

1. Read the current contribution policy, full issue discussion and relevant open,
   merged and closed PRs. Check the actual current source and released app.
2. Group symptoms by the state transition or subsystem they might share. Record
   uncertainty; use reproduction to decide whether one or several patches fit.
3. Reproduce with disposable data. Build the focused source fix and regressions;
   retain existing behavior outside that fix.
4. Submit one reviewable upstream PR per coherent source change, or update the
   existing PR. Record concrete upstream restrictions or technical blockers.
5. For a Morphe candidate, separately establish bytecode/native feasibility,
   exact official APK provenance, negative-input behavior, UI acceptance and
   update/data retention. Only then add supported versions and release metadata
   through the existing release workflow.

Refresh this dated snapshot before starting the next fix; linked issue
discussions remain the authoritative scope evidence.
