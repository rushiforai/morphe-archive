# NuvioTV migration evidence

**Current target (2026-11-23): `com.nuvio.tv` 1.1.1 / 1081.** Evidence is in
`.inspect-nuvio-111`, the app reference in `santodan-patches/docs/Nuvio111.md`, and
bindings in `santodan-patches/contracts/nuvio/native.properties`. Verify with
`verifyNuvioLatest`. 1.1.0 / 1077 (`.inspect-nuvio-110`, `docs/Nuvio110.md`) is the
preceding target. Everything below is the historical beta.13 record. Its lessons
(check both inventories against originals, share full references with runtime
reflection, audit the delivered APK) still apply to the next migration.

## Historical: beta.13

The reviewed beta.13 target was `com.nuvio.tv` 1.1.0-beta.13 / 1076. The app
reference and exact commands are in `E:\Morphe\santodan-patches\docs\NuvioBeta13.md`.

Use `E:\Morphe\Skills\inspection-evidence\.inspect-nuvio-beta13` directly.

- `reviewed-baseline.json` / `.tsv`: regenerated from the original beta.12 APK.
- `reviewed-inventory.json` / `.tsv`: regenerated from the original beta.13 APK.
- `reviewed-report.md`: fresh APK-to-APK comparison; suggestions still require
  semantic inspection. Earlier `baseline.json`, `inventory.json` and mapping
  helpers from the incomplete attempt are not verified migration inputs.
- `completion-backup.txt`: location of the backup taken before completing the
  earlier model's attempt. Historical beta.12 fixtures were restored unchanged.
- `final-validation.log`: complete beta.13 suite before the editor follow-up.
- `final-bundle-apk-validation.log`: pre-editor-fix packaged and actual-APK checks.
- `editor-crash-old-apk-regression.log`: expected rejection of the crashing APK.
- `editor-fix-bundle-validation.log`, `editor-fix-apk-validation.log`,
  `editor-fix-rebuild-result.json`, `editor-fix-apk-audit.json`: corrected delivery.

The latest fixed local APK has `editor-fix-unsigned.apk` in its filename. The
earlier beta.13 APK without that suffix is superseded. Consult the app document
for full paths and hashes; none of these APKs was signed or installed by the agent.

Beta.13 still uses static `ba.q5.l` with ten arguments for native search and
static `g1.h.s(Object)` for Compose state. The earlier proposed `ba.c6.e` and
`c9.b2.s()` are unrelated APIs. Keep static/signature guards intact.

The editor crash was a separate mismatch: patch validation checked `d7.a.H`
with twelve arguments, while runtime read a copied `G` name and the host fixture
invented a matching G renderer. Actual beta.13 has only unrelated `G(int):long`.
The fixed runtime derives owner/name from `REF_LAZY_LIST_I`; the stale duplicate
property is removed. Native fixtures and delivered-APK checks cover this distinction.

One-off migration scripts in the evidence directory include intermediate source
rewrites. Do not rerun them over the completed port. Use the checked source and
app document as the current implementation, not the last script in the folder.
