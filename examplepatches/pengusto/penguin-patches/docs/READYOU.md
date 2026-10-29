# Read You — nested OPML import

The selectable **Import nested OPML feeds** patch traverses all descendants of
each outer OPML folder, preserving document order, names, URLs and Read You feed
preferences. Nested folders are flattened into their existing outer group; the
application does not acquire a new nested-group data model. Default is off.

## Provenance

- App/package: Read You `me.ash.reader`, version `0.16.2`, versionCode `47`.
- Exact official GitHub APK: [ReadYou-0.16.2-091c9207-signed.apk](https://github.com/ReadYouApp/ReadYou/releases/download/0.16.2/ReadYou-0.16.2-091c9207-signed.apk), 11,213,788 bytes.
- APK SHA-256: `a27f6da6961f2d5cd27b515349dc71844a0d20cfacc38b5fc398152fa034ce5e`.
- Official signer on Android 33+: `721e4043c439bd70c90f46ae166ddc233fc75c1235bf8cb27b99a4df09cc3b99`.
- Earlier signing lineage (Android 24–32): `715696914a35366d98fa45312af96811f7e6de4085b5e4709f4c1e74f8bde4d0`.
- Issue: [ReadYouApp/ReadYou #1143](https://github.com/ReadYouApp/ReadYou/issues/1143).
- Source baseline: `d2b979ccad9a3e54b9499929a9dc2824578b0fd9`; [source PR #1345](https://github.com/ReadYouApp/ReadYou/pull/1345).

## Implementation

The upstream fix uses an iterative depth-first sequence in `OPMLDataSource`.
The exact-APK backport replaces only the nested-child iterator at the guarded
import site with the independent Java iterator in `extensions/readyou.mpe`.
Existing group/feed creation, duplicate detection, persistence and settings
remain in the app. The importer and shipped Outline class have canonical DEX
guards; modified/already-patched inputs fail before APK export.

The runtime contains no app stubs or Kotlin runtime library. Actual shipped-APK
reference resolution passed for its five non-framework references; all six prior
MPEs remain byte-identical to their released 1.2.0 payloads. Desktop output changes
only `classes.dex` and adds `classes3.dex`; all 1,641 other resource entries are
unchanged, including the manifest.

## Evidence status

The unmodified source fails two of six OPML regressions (nested/default-group
feeds); the fixed source passes all 13 upstream app unit tests. On the original
APK the three-feed synthetic OPML imports only Reader releases. Original and
patched before/after imports use the same fixture bytes.

Actual Android Morphe Manager 2.2.0 imported the candidate through its normal UI,
selected only this Penguin patch (1/1, unrelated source 0/5), applied it using
both embedded JVM and Android ART and exported both APKs. Manager's UPDATE flow
installed the JVM export; installed base.apk matches its exact hash. ART export
was installed with the same disposable key. All 16,342 canonical class digests
match between Desktop, JVM and ART despite different DEX partitioning. The
existing subscription IDs, account and DataStore bytes survived the first update;
the three imported feeds and their flags survived the ART update and same-key
removal/reapply of the patch. Full evidence:
[APK comparison and Manager receipts](../tests/readyou/evidence/2026-10-29/README.md).

Screenshots appear directly in the generated README preview. Public source and
patch are independent deliverables: the upstream PR remains under maintainer
review; the Penguin release is recorded by the generated catalogue.

Raw local artifacts: `.scratch/readyou/`. Reuse the owned `penguin` API35 ARM64
AVD at `emulator-5580`; no physical-device coverage is claimed. Screenshots are
unmodified device PNGs with corresponding fresh XML and hashes.
