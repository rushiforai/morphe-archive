# Higher-impact Penguin candidates — 2026-10-29

This is a researched delivery plan, not a released-patch catalogue. No candidate
below was built, reproduced on a device, submitted upstream or declared compatible
with Morphe during this planning pass. Prioritize durable reading state, complete
imports, reliable offline downloads and correct playback integration. Keep one
root cause per source change and selectable patch.

## Recommended order

| Track | App and user benefit | First concrete work | Status |
| --- | --- | --- | --- |
| 1 — manga | **Mihon**: reliable downloads and reading state | Review/support [download recovery PR #3500](https://github.com/mihonapp/mihon/pull/3500); investigate [Komga unread sync #2202](https://github.com/mihonapp/mihon/issues/2202) against existing page-sync work | Best new application focus; download recovery already has an implementation, Komga behavior needs a current regression and scope agreement |
| 2 — RSS | **Read You**: complete subscriptions when migrating readers | [Nested OPML #1143](https://github.com/ReadYouApp/ReadYou/issues/1143), then separately [read-state durability #1254](https://github.com/ReadYouApp/ReadYou/issues/1254) | #1143 has a concrete omission in stable/current importer source and no matching open PR; #1254 is higher-risk investigation |
| 3 — podcasts | **AntennaPod**: an accurate Android Auto queue | [#8829](https://github.com/AntennaPod/AntennaPod/issues/8829): notify a connected browser when the queue changes | Strong source-supported invalidation hypothesis; a MediaBrowser/Media3 reproduction and Android Auto acceptance are required |
| Conditional — files | **Material Files**: preserve an existing file during Save as | [#1664](https://github.com/zhanghai/MaterialFiles/issues/1664), separate from [USB move #1543](https://github.com/zhanghai/MaterialFiles/issues/1543) | Serious reported loss and supporting source ordering, but the maintainer normally declines code PRs |
| Later — connectivity | **KDE Connect**: reliable cellular/Wi-Fi handoff | [525472](https://bugs.kde.org/show_bug.cgi?id=525472), after testing current code and [MR !782](https://invent.kde.org/network/kdeconnect-android/-/merge_requests/782) | Needs a current distinct reproduction; canonical upstream is KDE GitLab with human-owned submission requirements |

Start with a Mihon investigation and the bounded Read You importer fix as the
first two app tracks. They offer an ambitious reader direction and a concrete
subscription-integrity delivery. AntennaPod supplies a third distinct audience.
Maintain the seven shipped Finamp patches and their existing PRs alongside this
new work. A later proven shared Mihon fix can be evaluated independently for
TachiyomiSY or Komikku; source ancestry alone never establishes APK compatibility.

## Why Mihon for the Tachiyomi direction

The [original Tachiyomi organization](https://github.com/tachiyomiorg) preserves
its January 13, 2024 discontinuation announcement. Its original core project no
longer offers the active upstream route requested for Penguin contributions.
[Mihon](https://github.com/mihonapp/mihon) is maintained Kotlin/Android code under
Apache-2.0. Current official release: [0.21.3, October 25, 2026](https://github.com/mihonapp/mihon/releases/tag/v0.21.3).
The [official fork directory](https://mihon.app/forks/) lists TachiyomiSY and
Komikku. Both have active Kotlin repositories at this snapshot.

The full open Mihon inventory contained **568 issues / 164 PRs**. Titles, bodies,
closing references and available file lists were searched; selected discussions
and related closed/merged work were read. Large API file lists can be truncated;
this is not an assertion that every diff/review was exhaustively reviewed.
Current inspected source: `e588e04359fe1058206a2cbac1b01018ad787359`.
[Contribution instructions](https://github.com/mihonapp/mihon/blob/e588e04359fe1058206a2cbac1b01018ad787359/CONTRIBUTING.md)
welcome PRs and request an issue comment when starting; the README asks for
advance discussion of major changes. No comments were posted in this pass.

### Download recovery: support the existing work

[PR #3500](https://github.com/mihonapp/mihon/pull/3500) already addresses downloads
waiting for network/Wi-Fi and automatically continuing after recovery, for
[#1053](https://github.com/mihonapp/mihon/issues/1053). Review its diff and validate
it against the current release before considering a Penguin backport. Do not
open a second upstream implementation of the same recovery path. Author test
claims are not tests performed by Penguin.

Proposed acceptance: interrupt a synthetic chapter transfer at a known offset,
restore connectivity, finish exactly once, and preserve the queue and valid
pages. Check explicit pause/cancel, restart, failed replies, Wi-Fi-only behavior,
notifications and temporary files. Any contribution to the existing PR should
cover a demonstrated missing regression or implementation defect.

### Komga: intentional unread state should survive synchronization

[#2202](https://github.com/mihonapp/mihon/issues/2202) reports that marking a chapter
unread locally does not reach Komga and can later be overwritten by server state.
The report used 0.18.0, so establish it on 0.21.3 first. Current source supplies
concrete investigation points:

- [`MangaViewModel.markChaptersRead`](https://github.com/mihonapp/mihon/blob/e588e04359fe1058206a2cbac1b01018ad787359/app/src/main/java/eu/kanade/tachiyomi/ui/manga/MangaViewModel.kt#L770)
  writes local state, then returns early when `read` is false (line 782).
- [`TrackChapter`](https://github.com/mihonapp/mihon/blob/e588e04359fe1058206a2cbac1b01018ad787359/app/src/main/java/eu/kanade/domain/track/interactor/TrackChapter.kt#L33)
  skips progress not greater than stored tracker progress.
- [`KomgaApi`](https://github.com/mihonapp/mihon/blob/e588e04359fe1058206a2cbac1b01018ad787359/app/src/main/java/eu/kanade/tachiyomi/data/track/komga/KomgaApi.kt#L84)
  sends continuous progress. This does not establish a safe individual-book
  unread operation or a universal fix for every tracker.

[Page-sync PR #1032](https://github.com/mihonapp/mihon/pull/1032) and
[#3481](https://github.com/mihonapp/mihon/pull/3481) overlap these paths; both were
open/conflicting. #3481 discussion describes a fetch-versus-resume race and
excessive refresh requests. Closed [#3825](https://github.com/mihonapp/mihon/pull/3825)
is another prior attempt. Define a Komga-specific first slice and determine
whether it belongs in that existing work before writing a new PR.

Acceptance needs local and server state, read/unread reversal, noncontiguous
progress, a second simulated client, delayed/failing replies and restart.
Keep other trackers' monotonic-counter semantics intact. Additional persistent
state must remain safe after a Penguin patch is removed.

### Later reader work and exclusions

- [Large CBZ crash #4070](https://github.com/mihonapp/mihon/issues/4070) is worth
  a separate reader-stability investigation. The maintainer asks for latest-
  nightly reproduction. The reporter's direct-buffer/GC theory is unproven.
  Compare archive-lifetime [#3092](https://github.com/mihonapp/mihon/pull/3092),
  decode retry [#3770](https://github.com/mihonapp/mihon/pull/3770), and reader
  rewrites [#4194](https://github.com/mihonapp/mihon/pull/4194) /
  [#4195](https://github.com/mihonapp/mihon/pull/4195). A native decoder fix has
  different patch costs from a Java/Kotlin caller fix.
- Cloud sync already has [#4047](https://github.com/mihonapp/mihon/pull/4047);
  in [#3460](https://github.com/mihonapp/mihon/pull/3460#issuecomment-5784362148),
  the maintainer states an intent to deliver their own sync. Coordinate with
  that direction before undertaking another data-model/merge implementation.
- SAF rename fallback has [#3446](https://github.com/mihonapp/mihon/pull/3446);
  duplicate navigation has [#3653](https://github.com/mihonapp/mihon/pull/3653).
- Download indexing is being rewritten in [#4196](https://github.com/mihonapp/mihon/pull/4196).
  [Orphaned downloads #3661](https://github.com/mihonapp/mihon/issues/3661) have
  disputed app/extension causes and changed metadata; do not presume one fix.
- [0.21.x release notes](https://github.com/mihonapp/mihon/releases/tag/v0.21.3)
  already contain many backup, migration, reader and download repairs. An old
  open report alone is not a current failing regression.

## Read You: complete imports, then durable read state

Checked all **34 open PR bodies**, selected issue discussions and closed/merged
work. Latest GitHub release: [0.16.2](https://github.com/ReadYouApp/ReadYou/releases/tag/0.16.2).
Current source: `d2b979ccad9a3e54b9499929a9dc2824578b0fd9`. The
[README welcomes PRs](https://github.com/ReadYouApp/ReadYou/blob/d2b979ccad9a3e54b9499929a9dc2824578b0fd9/README.md#L111-L125);
no dedicated contribution/AI restriction was found in the inspected policy files.

[#1143](https://github.com/ReadYouApp/ReadYou/issues/1143) concerns nested OPML
imports omitting feeds. The
[importer](https://github.com/ReadYouApp/ReadYou/blob/d2b979ccad9a3e54b9499929a9dc2824578b0fd9/app/src/main/java/me/ash/reader/infrastructure/rss/OPMLDataSource.kt#L36-L94)
visits top-level outlines and direct children, then skips child folders without
`xmlUrl` rather than traversing descendants. The importer source blob is identical
in 0.16.2 and current main; no matching open traversal fix was found. Merged
[#1282](https://github.com/ReadYouApp/ReadYou/pull/1282) adds importer tests, not
recursive traversal. Adjacent [#1326](https://github.com/ReadYouApp/ReadYou/pull/1326)
changes ordering/schema and should remain separate.

First slice: preserve every descendant feed using the existing flat group model,
retaining order, names and optional attributes. Full nested-folder UI is a
separate feature. Test a tiny three-level OPML file, empty groups and attributes,
then installed-app subscription count and restart persistence. The source omission
is confirmed; runtime reproduction and original-APK hook feasibility are pending.

Follow-up [#1254](https://github.com/ReadYouApp/ReadYou/issues/1254) reports read
articles returning as unread, including a later 0.16.2 report. Source cache/DB
ordering is a plausible seam, not a proven explanation. Local and Google Reader
paths must be tested separately. Merged [#1269](https://github.com/ReadYouApp/ReadYou/pull/1269)
already fixed one DAO overload; closed/unmerged [#1216](https://github.com/ReadYouApp/ReadYou/pull/1216)
previously proposed cache durability changes. Establish a deterministic failing
state transition before adopting or replacing that design.

## AntennaPod: reliable Android Auto queue

Checked all **31 open PR bodies**, selected discussions and related closed/merged
work. Latest official release: [3.12.3](https://github.com/AntennaPod/AntennaPod/releases/tag/3.12.3).
Current develop: `d3e41c6cb37c8e1a060b142686f818999de89859`.
[Contribution policy](https://github.com/AntennaPod/AntennaPod/blob/d3e41c6cb37c8e1a060b142686f818999de89859/CONTRIBUTING.md#L31-L40)
requires choosing issues without Needs: Triage/Decision and announcing work before
a PR. #8829 meets that label gate; it remains a possible, unconfirmed bug.

[#8829](https://github.com/AntennaPod/AntennaPod/issues/8829) reports completed
episodes remaining visible in Android Auto until reconnecting/switching apps.
Current Media3 source removes completed items from the DB and posts `QueueEvent`,
but lacks the queue-event subscriber/library-child invalidation present in the
legacy service. The relevant Media3 files match the 3.12.3 source blobs.
[Legacy fix #6373](https://github.com/AntennaPod/AntennaPod/pull/6373) is useful
precedent, not a fix in the new service. No matching open queue-invalidation PR
was found; [#8839](https://github.com/AntennaPod/AntennaPod/pull/8839) covers the
subscription browse list, and [#8840](https://github.com/AntennaPod/AntennaPod/pull/8840)
is adjacent player UI work.

First slice: deliver queue changes through the Media3 browser subscription
contract on the correct session thread, with safe teardown. Reproduce with three
synthetic episodes and a real MediaBrowser subscription: after A completes,
DB queue, notification and refreshed children should all reflect B/C. Test add,
remove, reorder and clear, then Android Auto/head-unit acceptance. A mocked
callback test alone does not establish real Android Auto behavior. No device or
head-unit testing was performed in this planning pass.

A secondary [#7325](https://github.com/AntennaPod/AntennaPod/issues/7325) reports
inbox membership disappearing after an unsuccessful download. Current code
supports a setting-dependent cancellation path, but the old report needs a fresh
reproduction. Restoration must not undo later explicit user actions. Keep this
separate from queue invalidation and already-open auto-delete/playback fixes.

## Conditional alternatives

**Material Files:** [#1664](https://github.com/zhanghai/MaterialFiles/issues/1664)
reports same-file Save as loss; current and 1.7.5 source delete an existing target
before opening a source stream in the cross-provider path. This supports, but
does not independently reproduce, the reported URI-alias failure. Safe local
staging/atomic replacement is a proposed design, not a tested patch. A failing
copy or cancellation must preserve existing bytes and unrelated files. The
[PR template](https://github.com/zhanghai/MaterialFiles/blob/93c333960aa897836ba3f215a19d0cb0de494db1/.github/pull_request_template.md)
says the author normally declines code PRs and requests issue suggestions.
Record that concrete limitation for the requested upstream-PR delivery, or obtain
a specific exception before promising a PR. This is a normal contribution policy,
not evidence that the application is abandoned.

**KDE Connect:** [525472](https://bugs.kde.org/show_bug.cgi?id=525472) concerns
mobile-data/Wi-Fi reconnect. Current [1.37.0](https://invent.kde.org/network/kdeconnect-android/-/tags/v1.37.0)
already includes several discovery/receive fixes; open
[!782](https://invent.kde.org/network/kdeconnect-android/-/merge_requests/782) is
adjacent. A fresh trace must distinguish OEM policy and a missing readiness
callback from already-fixed interface binding. Canonical upstream is
[KDE GitLab](https://invent.kde.org/network/kdeconnect-android), not its GitHub
mirror. The [KDE Connect contribution policy](https://invent.kde.org/network/kdeconnect-kde/-/blob/e458ee0d8bdb45b981658c981345c0bdcbb994aa/CONTRIBUTING.md#ai-usage-guidelines-for-contributors)
permits exploration/assistance under human ownership, but excludes automated
submissions and AI-written MR descriptions/replies. This is a human-led upstream
track, not a normal autonomous PR candidate. No submission was attempted.

## Delivery gates for every selected app

1. Refresh the issue, relevant full PR diffs/discussions and contribution policy;
   select a currently failing, coherent behavior.
2. Reproduce on current source and an exact official release with disposable data.
   Keep actual source facts distinct from reporter claims and hypotheses.
3. Add a failing behavioral regression, then a focused source fix or contribution
   to existing work. Publish attribution and the exact source revision.
4. Inspect the original APK and R8 output before promising a Morphe hook. Pin
   package/version/signature/input hashes and reject unsupported input.
5. Test actual Manager selection/application/export, install, state retention and
   patch removal/reapply; test the feature's real external contract as needed.
6. Preserve raw matched PNG/XML/hash provenance and embed both sides directly in
   README. Backend fixes additionally need event/response/state evidence.

The current seven Finamp patches stay in maintenance. These investigations add
new application coverage; they do not alter generated release metadata or the
current 1.3.0 catalogue.
