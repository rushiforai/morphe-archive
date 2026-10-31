# Reviewed Artist backport acceptance — 2026-10-30

The existing optional **Load artist pages faster** selection follows final
[PR1832](https://github.com/finamp-app/finamp/pull/1832) commit
`3f463b0e697f11aeebc37e1a6b614cde391b7f7f`. It uses a bounded `ArtistIds` union
count, retains the loading/error row, and resolves the actual track count for
download warnings, including guest-only artists. Full enumeration remains on demand.

This directory distinguishes source tests, private complete-candidate acceptance
and public release verification. [Source and ART diagnosis](SOURCE_AND_ART.md)
records the exact trees, overlapping test runs and separately identified checkpoints.

## Matched installed-APK comparison

Both raw captures use Android 15/API35 ARM64, 1080×1920, density 320, English,
Dark theme, the same synthetic library, sort and eight downloaded tracks plus
14 downloaded images. The fixture holds full artist-track enumeration. The
patched APK was exported and installed through actual Morphe Manager 2.2.0.

| Original official code, re-signed for same-key updates | Manager Artist-only output |
| --- | --- |
| <img src="artist-held-before.png" width="300" alt="Original artist page waits on full enumeration and shows zero tracks"> | <img src="artist-held-after.png" width="300" alt="Patched artist page shows eight tracks and its bounded preview"> |

[PNG/XML hashes, installed APK and source provenance](captures.json),
[original HTTP requests](artist-held-before-requests.json),
[patched HTTP requests](artist-held-after-requests.json).
The held full-track request is absent after patching. These are query-behavior
checks, not a live-server latency or RAM benchmark.

## Complete private candidate

[Verification index](verification.json) and [composition](private-candidate/composition.json)
identify candidate `eb48836340eb74d59d817859d238659fd216cbe4f3a16bcac99678023f1aa1a6`.
It was composed before dependency publication and is explicitly labelled private.

| Check | Passed |
| --- | ---: |
| [Native replay and exact source pins](private-candidate/native-report.json) | 127 |
| [Actual Desktop 1.19.1 / Patcher 2.0.1 selections](private-candidate/desktop-matrix.json) | 127 |
| [Altered snapshot, engine, ABI and version inputs rejected](private-candidate/rejections.json) | 4 |
| [Actual Manager exports, independently verified](private-candidate/manager/output-verification.json) | 7 |

The seven Manager cases are JVM masks **4,12,36,127,123** and Android ART masks
**4,127**. All verify native output, unchanged retained entries/engine, ARM64-only
libraries, the expected disposable signing certificate, uncompressed libraries
and 16 KiB ZIP alignment. The [source cache receipt](private-candidate/manager/source-cache.json)
binds the normally imported MPP, source enablement and all-seven-off defaults;
each case retains its actual runtime log and raw UI captures.

Mask 12 also shows the six correct downloaded guest tracks. Mask 36 verifies the
Artist/Player integration with bounded requests. Installed Loading/Error probes
show no false zero or unbounded fallback. Their exact Artist snapshot is shared
with mask 4; [executable/payload equivalence](private-candidate/checkpoint-equivalence.json)
also binds the separately recorded selected ART fault and fresh recovery.

## Same-key data retention

The observed chain is **original 0 → 4 → 12 → 36 → 127 → 123 → original 0 → 127**.
Manager Install/Open performs patched updates; Android UPDATE is recorded when
shown. Removal to0 uses `adb install -r` of the exact official code re-signed
with the same disposable certificate. No uninstall, app-data clear or settings
repair occurs in the chain.

Every recorded stage retains login, Dark theme, warning cutoff 4 and all 22
baseline media files byte for byte. Metadata order is seeded once at 127, then
the actual rendered credits and primitive auxiliary Hive bytes survive removal
and reapplication. Original0 starts with its unchanged adapter and ignores that
auxiliary file. [Stage receipts](verification.json).

The matched guest dialog comparison uses those same eight downloads: original 0
omits the warning for six guest tracks, while final 127 warns about six tracks.
Both dialogs are cancelled. Raw captures and receipts are in
[original](private-candidate/original-guest-matched/original-guest-warning.json) and
[patched](private-candidate/guest-127-art/artist-guest-warning.json).

Only the official Finamp 1.0.1 universal input and pinned engine are supported;
outputs are ARM64-only. The release API isolate serializes requests, so a held
count can delay its second preview query. This emulator fixture establishes
neither physical/OEM-device coverage nor other app/Android compatibility.


## Candidate on published v1.6.1

The final candidate `c0ff605a009773103ea229b6dcd2512c2acf80d442d741cec0f762d03b858388`
uses the complete published [v1.6.1](https://github.com/pengusto/penguin-patches/releases/tag/v1.6.1)
MPP. [Composition](final-candidate/composition.json) preserves all 63 non-Artist
payloads and changes exactly 64 Artist deltas plus their manifest.
[Executable comparison](final-candidate/official-core-comparison.json) proves
identical Finamp JVM classes, extensions and native outputs to the private suite;
the official build's changes in other executable entries are retained.

[Final checks](final-candidate/verification.json) pass all 127 native replays,
127 real Desktop selections and four invalid inputs. Because the official
`classes.dex` differs, Artist alone and all features were repeated under actual
ART, exported, independently verified and installed through Manager.
[Both ART exports](final-candidate/manager/output-verification.json) pass signature,
retained-entry, native hash, ARM64-only and 16 KiB alignment checks. This two-case
recheck is deliberately not labelled as a new seven-case suite.

Both installed APKs match their Manager exports. Login, Dark theme, cutoff 4,
all 22 baseline files and auxiliary preference bytes are retained after
[Artist alone](final-candidate/persistence-4-art/persistence.json) and
[all features](final-candidate/persistence-127-art/persistence.json).
Metadata order and the actual credit order are retained after the latter;
no preference is seeded or repaired during these checks.

Public release-package acceptance is recorded separately after publication.
