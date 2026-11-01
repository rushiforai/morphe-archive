# Dedicated Monet Wuplay catalog rows: validation

Target: original `com.klevico.monet` 1.1.0 / 134 / minSdk 26.
Input APK SHA-256: `3fdd45e7ed85f4a26ab6a56924e8a9c298c42c3cb036cb121d15ed6504b9a69c`.
Original signing certificate SHA-256: `4bec386a6baae56f0694d3be54f67e0625b973109e0dbb947df2a5d0254975e0`.

The optional **Individual Wuplay catalog rows** patch recognizes only `app.wuplay.androidtv` preview channels whose provider IDs begin `santodan-launcher/wuplay/`. There is no Nuvio mode, legacy Monet binding or publisher-generalization option. Upstream source and runtime-fixture attribution are retained in NOTICE and AUTHORS.md.

## Native and archive verification

The patch validates package, signer, version, build and minimum SDK before mutation. It then checks 23 native method contracts plus public model/picker/flow ABI symbols. Fingerprints cover registers, references, literal operands, branches, switches, array payload widths/values and ordered exception-handler tables. Four JUnit mutation regressions initially failed against the inherited hash and pass with the complete implementation.

Morphe Desktop 1.19.1 successfully applied the real bundle to the supplied original APK with `--exclusive --validate --bytecode-mode FULL -e "Individual Wuplay catalog rows"`. The signed output was independently audited by:

```sh
python3 tests/verify_monet_wuplay.py ORIGINAL.apk PATCHED.apk --desktop MORPHE_DESKTOP.jar
```

The audit retains all 9,041 original classes, fields, access flags, interfaces and method bodies. Exactly eight native methods contain the reviewed hooks; removing those specific hooks restores their original instruction/branch/payload/exception fingerprints. All 18 added classes belong to `nl.johninnl.monetwuplay`. The extension contains no replacement Kotlin runtime.

All 672 other non-DEX/non-signature archive entries remain byte-identical. The read-only original-input resource preflight causes the manifest and resource table to be reserialized: complete manifest declarations and all resource value/configuration records compare equal independently through aapt. Resource configurations may be reordered. Explicit/default static field encodings are compared by their equivalent typed values.

The final audited APK SHA-256 is `69434b204f71578997c93506bbadf0e9e2a53cb552322bd7c742cbd97d8c5b12`. APK signature and page alignment checks passed. The local bundle is signed with the repository's existing Morphe key; no release version or generated metadata is changed by this feature branch.

## Host and build checks

- Python regressions: 394 passed, 39 skipped under the repository's optional-tool/input conditions.
- `:patches:test`: four native fingerprint mutation tests passed.
- Production adapter/subscription runtime fixtures passed: native Content callback persistence, section labels, ordinary modes/channel filters, no duplicate picker keys, app ownership/icons, shared-title membership, row-local hidden titles, empty/unavailable channels, numeric-ID recreation, independent revisions, bounded retry/recovery and pause cancellation.
- Dedicated publisher-policy tests reject foreign owners, owner suffix spoofing, other publisher prefixes, blank titles and non-preview channels.
- Android bundle, metadata generation and both Medium extension unit suites passed. The required Java helper uses the same JVM 11 target as Kotlin; package-private helper Javadoc is included explicitly.
- All 90 candidate app pages, strict bilingual documentation build, rendered-site validation and Markdown links passed.
- All 39 release integration/identity/discovery regression tests passed.

## Observed Android TV integration

Tests used an isolated Android TV API 36 emulator. Monet ran the actual signed patched APK. Wuplay ran a test-only debuggable APK with DEX files byte-identical to the output of the published v1.11.0 bundle. `PublisherProbe.java` exercised the production Wuplay publisher under its own UID using representative public title/artwork metadata; no account token or private profile data was copied for this integration test.

The publisher created two catalogs, four programs and one shared title. Monet logged `published 2 channels / 4 entries` through its independent subscription. In Monet's native UI:

- **Content from one app** offered the real **Wuplay** source.
- Its Content picker contained the three original modes plus **Wuplay Action** and **Wuplay Drama**, without duplicate catalog choices or Nuvio labels.
- Two custom rows were created and assigned different catalogs while Recommendations was disabled. Each rendered its own exclusive title; the shared title appeared in both rows. Accessible tile descriptions identified Wuplay correctly.
- Installing the final audited APK over the test installation restarted Monet. Both saved catalog selections and their separate/shared title membership were restored after the new foreground scan.

The two-row screenshot and accessibility dumps are retained under the Git-ignored local validation outputs. Physical TV installation, maximum-size performance, extended lifecycle stress and playback were not tested. Native provider queries cannot be interrupted while blocked; pause prevents their late results from publishing. No premium or displayed-card patch is included.
