# Documentation

Index of the documentation in this folder. Start with the user guide if you want
to apply the patch, or the architecture overview if you want to understand or
change it. The project overview is in the [repository README](../README.md).

## Guides

| Document | What it covers |
| --- | --- |
| [USER_GUIDE.md](USER_GUIDE.md) | Prerequisites, the verify, patch and verify flow, signing and installing on your own device, layouts and settings, exit codes and troubleshooting |
| [ARCHITECTURE.md](ARCHITECTURE.md) | Patcher pipeline (fingerprints, anchors, dataflow, smali patch, verify), the Java policy runtime, `extension-src`, and the CI suite with its synthetic APK |
| [RELEASING.md](RELEASING.md) | Versioning, changelog, release notes, tags, the GitHub Release, fingerprint updates and signing policy |
| [SIDE-BY-SIDE.md](SIDE-BY-SIDE.md) | The package rename that lets a build install next to the stock keyboard, and its verification results |
| [PROJECT_BRAIN.md](PROJECT_BRAIN.md) | Working memory for coding agents (see `AGENTS.md`): current status, next step and a session log |

## Evidence and validation

| Document | What it covers |
| --- | --- |
| [EVIDENCE.md](EVIDENCE.md) | Static evidence behind each anchor and fingerprint, and status detail |
| [VALIDATION.md](VALIDATION.md) | Dated validation record: what passed without a device and what needs one |
| [LICENSING-AUDIT.md](LICENSING-AUDIT.md) | Licensing audit of the repository and of the private test builds |
| [BETA-PERSONALIZATION-ANALYSIS.md](BETA-PERSONALIZATION-ANALYSIS.md) | Analysis only: where the Gboard 18.6.3 beta personalization settings live, found with `scripts/find_personalization_flags.py`. Not enabled or tested |

## Design records

| Document | What it covers |
| --- | --- |
| [V28-SEGMENT-LOCK.md](V28-SEGMENT-LOCK.md) | V28 segment-locked multilingual voice: the defect and the fix |
| [V29-DESIGN.md](V29-DESIGN.md) | V29 design: multilingual dictation and Bangla spelling normalization |
| [V29-FIXTURES.md](V29-FIXTURES.md) | V29 named fixtures: intended output changes against v28d |
| [V29-GBOARD-PARITY.md](V29-GBOARD-PARITY.md) | V29 Gboard parity study for multilingual dictation |

## Release notes

| Document | What it covers |
| --- | --- |
| [V29.4-RELEASE-NOTES.md](V29.4-RELEASE-NOTES.md) | V29.4 release notes (tag `v29.4`): source release and new maintainer signing key |
| [V29.3-RELEASE-NOTES.md](V29.3-RELEASE-NOTES.md) | V29.3 release notes (tag `v29.3`) |
| [releases/v29.3-notes-revised-DRAFT.md](releases/v29.3-notes-revised-DRAFT.md) | Draft revised wording for the V29.3 notes |

## Data and site assets

| File | What it is |
| --- | --- |
| [spelling-corpus-v1.tsv](spelling-corpus-v1.tsv) | V29 spelling corpus: romanized input, v28d converter output and canonical spelling (52 entries) |
| [index.html](index.html) | GitHub Pages landing page, served at <https://muhib-karim.github.io/Rambler-Bangla/> |
| [banner.svg](banner.svg), [assets/](assets/) | Banner, icon, brand sheet, icon showcase, favicon and the test-run render |

## Elsewhere in the repository

- [CHANGELOG.md](../CHANGELOG.md), [CONTRIBUTING.md](../CONTRIBUTING.md),
  [SECURITY.md](../SECURITY.md), [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md),
  [ATTRIBUTION.md](../ATTRIBUTION.md)
- [ledger/](../ledger/): per-version build provenance records
- [verification/](../verification/): dated verification records
- [tests/v29.3/README.md](../tests/v29.3/README.md): V29.3 golden corpus and scorer
- [data/loanspell/README.md](../data/loanspell/README.md): loanword spelling data
