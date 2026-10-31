# Calendar patch verification

Original APK: official Fossify Calendar 1.12.0, SHA-256 d43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987.

Local MPP build: passed. Morphe Desktop 1.18.1 application and resource rebuild: passed. Android 15 ARM64 installation/start: passed. Native preview, exact original source toggle, title-only save/readback after process restart, explicit source edit/save/readback after restart: passed. Same-certificate APK update installation: passed. AndroidRuntime error log: empty.

Synthetic fixture used an html/head/style/body document with paragraphs and an HTTPS anchor. The title-only save preserved the original string exactly. Explicit source replacement with `<p>Edited-source</p>` rendered after restart.

This is not the source fork's 22-test suite. Real Outlook round-trip, full theme/accessibility/rotation coverage and mobile Morphe Manager execution remain open. Scope of the first release: event editor only.

## Day/agenda extension (2026-10-21)

Same official 1.12.0 input and SHA-256 as above. Java 21 offline MPP build and Morphe Desktop 1.18.1 application/resource rebuild passed. Tested in a newly isolated Android 15 ARM64 emulator with a temporary test certificate.

- Day view and Simple event list both displayed `Readable first Second & bold link` from an HTML document containing head/style, paragraphs, entities, formatting and an HTTPS link.
- `<br>` rendered as a summary space; literal plain text `Meet at 10 < 12 & bring notes` stayed exact. HTML containing only hidden/empty content hid the description row.
- Editor preview and exact-source toggle passed. A title-only save and process restart preserved the original HTML byte for byte in the local database. Explicit replacement through the source editor saved and appeared after restart.
- Reinstall/update using the same test certificate passed and retained the edited description.
- Nine native Android instrumentation regression cases passed against the patched APK, including paragraph/line-break summaries, plain newlines, hidden style/script content, empty HTML and link text. Sources and execution instructions are in `tests/`.
- Fresh instrumentation/application run had an empty crash log. Earlier test setup attempts had a synthetic-database ownership error and an unsuitable standalone HTML-parser runner without an Application context; both were corrected before acceptance.

The release APK uses R8: day and agenda binding code resides in `Lb;->g(Object,Object)Object`, rather than named source adapter methods. Each hook requires exactly one matching model description getter followed by `move-result-object`, before the existing newline conversion and TextView binding. Location branches bypass these hooks.

Real Outlook server sync, physical-phone/Morphe Manager acceptance, full themes/font-scale/rotation and widget/notification summaries remain unverified or outside scope. No real calendar/account data was used.


## Wrapperless table fragments (2026-10-22)

The Calendar patch also recognizes paired table, section, row and cell tags without an html/body wrapper. Native Android HTML parsing needs explicit cell spaces and row breaks to avoid merging adjacent cell text. These replacements affect presentation only. Unmatched literal `<table>` text stays plain.

13 native parser cases pass against the installed patched official Calendar 1.12.0, including table cells, uppercase row/header tags, entities and plain bracket text. Original-versus-patched day-list and editor screenshots show the same synthetic table event. A title-only UI save retains the exact table description; source-fork changes and their instrumentation are validated separately. No live Outlook synchronization is claimed.

## Finamp native patches (2026-10-28)

The original official Finamp 1.0.1 universal APK is pinned by SHA-256. Three
optional selections produce ARM64 output: title validation, song artist order
and bounded artist-page loading. All seven selections pass real Morphe Desktop
1.18.1 / Patcher 1.15.1 and 1.19.1 / Patcher 2.0.1 application and retained-entry comparison. Four altered
inputs fail without an output APK. Native resources are validated before release.

The seven pinned source trees pass 224 overlapping Flutter tests (56 in the
all-fix tree). The Android 15/API 35 synthetic fixture passes the same-key
0 → 7 → 1 → 7 → 0 → 7 update chain, including login/theme retention, artist mode
persistence across removal/reapply, actual title/credit UI and bounded requests.
The original main Hive adapter remains unchanged.

[Guide, provenance and limits](FINAMP_NATIVE.md),
[repeatable checks](../tests/finamp/README.md),
[recorded APK evidence](../tests/finamp/evidence/2026-10-28/README.md).
Actual Android Manager 2.2.0 / Patcher 2.0.1 acceptance now passes on that API 35
emulator: remote source download, default-off independent selections, four JVM
exports (each single and all three), one ART all-three export, signature/native
hash/retained-entry/alignment checks, and a GUI update/start retaining login,
Dark theme and Metadata order. Controlled cached-input corruption fails visibly
through a selected patch; restoring the original permits another successful ART
run. No production patch change was needed.

[Manager captures, normalized report and limits](../tests/finamp/evidence/2026-10-28-manager/README.md).
Physical devices, other Android/Manager versions and real-library timing/RAM
remain unverified. Pairwise masks were tested on Desktop. This native release
is separate from the upstream redesign PRs and rebuilt debug preview.

## Reviewed Finamp player menus (2026-10-30)

[Released v1.6.1 remote-source acceptance](../tests/finamp/evidence/2026-10-30-player/released-1.6.1/README.md)
passes normal Manager download/hash verification, Player32 JVM and full127 ART
apply/export/Install/Open,127 fresh Desktop selections and four rejection cases.
The final cold start retains login, preferences and all22 downloaded files.
The primary raw after screenshots come from that released Player32 export.

Final PR #1836 is backported to the existing bit32 selection for the original
Finamp1.0.1 APK. All64 affected complete source suites pass (4,096 overlapping
executions;101 in the all-seven tree), while the same focused tests reproduce
22 failures on the previous player source and27 passes on the reviewed source.
The other63 payloads and all seven existing MPEs remain byte-identical. All127
native replays and actual Desktop1.19.1 selections pass. Four unsupported inputs
fail through a selected patch without output. Both applicable source diffs
recreate the exact feature tree and all128 public source refs match the matrix.

The actual Manager Player-only JVM export is installed through Manager Install;
its installed/export/native/engine/signer hashes match, with uncompressed native
entries and16KiB alignment. Raw paired APK PNG/XML are embedded directly in the
README. Output, Queue and Lyrics routes, Lyrics Output/Queue without recursion,
five disabled-gesture swipes and Player artwork secondary input are verified.
All six Manager outputs (JVM32/64/96/127/31, ART127) pass independent native,
retained-entry, signer and16KiB checks. The selected Player32 ART fault fails
visibly; fresh recovery succeeds. Compact fallback routes and the same-key
127→31→original0→127 chain preserve login, preferences and22 download files.
NIO file-time tracking prevents same-size ART writes being omitted from export;
the actual Patcher regression is a release gate.
[Current evidence and scope](../tests/finamp/evidence/2026-10-30-player/README.md).

## Mihon excluded Default downloads (2026-10-30)

The optional Mihon 0.21.3 ARM64 patch reuses Marc Went / Dunky13's `0L` correction
from existing PR #4182. The official APK, signer and exact owner bytecode are
pinned. Seven source regressions reproduce one original failure; all 37 source
app tests pass with the correction. The installed-APK six-case suite reproduces
one lost protected page before and passes all six with the real Manager ART export.
Same-key update/removal/reapply preserve database rows, preferences and downloads.
Raw matched PNG/XML are used directly by the README generator. No new app schema,
preference, Kotlin runtime or MPE is introduced; all seven prior MPEs are unchanged.

The release gate applies the final MPP with pinned Morphe Desktop 1.19.1, verifies
that only the deletion fallback/helper changes across 19,958 classes while keeping
resources/native libraries, and rejects reapplication without export. It is
separate from the real Android Manager acceptance. [Guide and limits](MIHON.md),
[repeatable tests](../tests/mihon/README.md),
[Manager and data evidence](../tests/mihon/evidence/2026-10-30/README.md).
