# Releasing

How a Rambler Bangla release is cut in this repository. Releases are
**source only**: a release is a git tag, release notes and a provenance record.
No APK is ever attached, because a patched keyboard contains Google's
proprietary Gboard code (see [`LICENSING-AUDIT.md`](LICENSING-AUDIT.md)).

## Contents

- [Versioning](#versioning)
- [Release checklist](#release-checklist)
- [Release notes](#release-notes)
- [Provenance and verification records](#provenance-and-verification-records)
- [Tags and the GitHub Release](#tags-and-the-github-release)
- [Fingerprint updates](#fingerprint-updates)
- [Signing](#signing)

## Versioning

- **Feature versions** use a `V<major>[.<minor>]` name: V27, V28, V29, V29.3.
  A letter suffix marks a revision of a version line, for example v28d, the
  last stable V28 baseline.
- **Git tags** use the lowercase form of the version: `v29.3`.
- **Maintainer test builds** are numbered (for example builds 245 to 253 in
  October 2026). They are private test artifacts, are not tagged as releases
  and are recorded in the changelog with their evidence level.
- The target Gboard build (18.3.1) is part of the profile name
  (`fingerprints/gboard-18.3.1.json`), not of the Rambler version.

## Release checklist

1. **Tests green.** On a clean checkout:

   ```bash
   python3 -m unittest discover -s tests/python -v
   bash scripts/bootstrap_tools.sh
   source tools/tool-env.sh
   bash tests/run_tests.sh      # expect "TEST SUITE: 22 passed, 0 failed"
   ```

   Both [`ci.yml`](../.github/workflows/ci.yml) and
   [`tests.yml`](../.github/workflows/tests.yml) must pass on `main`. If the
   release changes the conversion behavior, also score the golden corpus in
   [`tests/v29.3/`](../tests/v29.3/README.md) against the previous baseline.
2. **Changelog.** Add a section to [`CHANGELOG.md`](../CHANGELOG.md) headed
   `## V<version> - YYYY-MM-DD` (dates are AEST/AEDT), with short bullets and a
   link to the release notes. State evidence levels honestly: host-tested,
   static review, or confirmed on the maintainer's phone.
3. **Release notes.** Write the notes (see below).
4. **Provenance.** Add `ledger/v<version>-provenance.md` (see below).
5. **README.** Update the "Status and roadmap" section and, if the numbers
   changed, the test counts in the Features and testing tables.
6. **Licensing.** If new third-party data or code is included, add it to
   [`ATTRIBUTION.md`](../ATTRIBUTION.md) (and a notice file if its licence
   requires one, as with `NOTICE-cmudict.txt`).
7. **Tag and publish** (see below).

## Release notes

- Published notes live in `docs/`, named `docs/V<version>-RELEASE-NOTES.md`,
  for example [`V29.3-RELEASE-NOTES.md`](V29.3-RELEASE-NOTES.md).
- Drafts and revised wording live in [`docs/releases/`](releases/), for
  example [`v29.3-notes-revised-DRAFT.md`](releases/v29.3-notes-revised-DRAFT.md).
  A draft names the tag it describes and does not create a new tag.
- Notes open with "Source-only release. This repository distributes no APKs."
  They cover new features, settings, layouts, what was checked and known
  limits, and they distinguish intended behavior from verified behavior.

## Provenance and verification records

- [`ledger/`](../ledger/) holds one provenance record per version
  (`v27-provenance.md` to `v29.3-provenance.md`): date, base version, artifact
  hashes and signer certificate fingerprint for the private build, the patch
  surface, and the evidence behind the release.
- [`verification/`](../verification/) holds dated verification records.
- Never include an APK, a DEX, a key, or Google content in these records. Hashes
  only.

## Tags and the GitHub Release

```bash
git tag -a v<version> -m "V<version>"
git push origin v<version>
```

Then create a GitHub Release from the tag:

- Title: `V<version> - <one-line summary>`, as in the
  [v29.3 release](https://github.com/muhib-karim/Rambler-Bangla/releases/tag/v29.3).
- Body: the contents of the release notes file.
- Attachments: test logs at most. Never attach an APK, an AAB, a DEX file or a
  keystore.

The README's "latest release" badge and the site's release link follow the
newest GitHub Release automatically.

## Fingerprint updates

The patcher supports exactly the build described by its profile. A new Gboard
build is never handled by loosening checks; it gets a new profile.

1. Run `dex_patch.py analyze` against the new build you have obtained
   yourself. The report lists the fingerprint hits and the method anchors
   found.
2. Confirm the cleanup-builder and prompt-owner methods, their signatures and
   DEX locations, and the placeholder dataflow, and record the evidence (see
   [`EVIDENCE.md`](EVIDENCE.md) for the format used for 18.3.1).
3. Add a new profile, for example `fingerprints/gboard-<version>.json`, with the
   same keys as the 18.3.1 profile: `target`, `methods`, `fingerprints`
   (SHA-256, byte length and the short published opening fragment only),
   `anchors`, `extension_class` and `known_limits`. Never commit the full
   strings.
4. If the method shape changed, update the synthetic fixture
   (`fixtures/strings.json`, the fixture smali and `build_fixture.py`) so the
   static suite still mirrors the real anchors, and keep the fail-closed
   negative tests passing.
5. Update `integration/patches-list-entry.json` (`compatibleVersions`) and the
   README if the supported build changes.

## Signing

The patcher never signs, and this repository never contains a signing key,
keystore or password. `.gitignore` blocks `*.keystore`, `*.jks`, `*.apk`,
`*.aab` and `*.dex`.

The maintainer signs private test builds with their own key, kept outside the
repository. Only the signer certificate's SHA-256 is recorded, in the
provenance record. Changing the key means existing installs cannot update in
place and must be uninstalled first (this happened between V29 and V29.3, and
again for V29.4), so key changes are called out in the release notes and
provenance record.

Since V29.4 the maintainer key lives only in GitHub Actions secrets
(`RAMBLER_KEYSTORE_BASE64`, `RAMBLER_KEYSTORE_PASSWORD`, `RAMBLER_KEY_ALIAS`,
`RAMBLER_KEY_PASSWORD`), plus an offline backup kept by the maintainer. The
manual workflow `.github/workflows/maintainer-key-check.yml` decodes the key
into the runner's temp directory, signs the synthetic CI fixture with it,
checks the signer against `EXPECTED_CERT_SHA256`
(`679cfdec6cef6ab17a9778cde4d3bbf3b8ccfe6ae2380d3da11679aae01e2e78`), writes the
result to the job summary and deletes the key. It uploads no APK. Run it after
any change to the key secrets.

The fixture in CI is signed with a throwaway key generated locally by
`fixtures/build_fixture.sh` at test time. It is not a release key.
