# CamScanner independent version-porting workflow

## Qualified inputs

General patches support pristine full APKM 7.26.5.2609160000 (72651) and
7.27.0.2609220000 (72701). The lottery skip option is separately qualified for
72701 only. A shell/packed 72751 input is not equivalent and remains unsupported.
Do not widen version ranges or learn fingerprints from a failed input.

The 72701 port independently reviewed changed class pins and the email-login
cache-result register (v3 rather than v2, with the original coroutine retained).
Both signing native libraries were byte-identical across the reviewed inputs;
that is measured evidence, not an assumption for future ports. No scanner native
edit or scanner initialization patch is shipped.

## Reproducible process

1. Acquire the complete original input once into private storage. Validate exact
   version/code/package, split inventory, ABIs, ZIP CRC, size and SHA256. Keep
   originals immutable. Certificate extraction alone is not cryptographic proof
   of origin. Never commit APKs, keys, access links or private device logs.
2. Independently merge the original full input with the qualified Morphe Desktop
   merger. Preserve modules and OCR/language assets; do not substitute an already
   patched or mutable scratch APK for the baseline.
3. Run the read-only `scripts/camscanner/preflight.py` against an independently
   qualified baseline and the candidate, supplying explicit Desktop JAR and Java
   tools. Its report records identities, native hashes, classes and method graphs.
   It never adds acceptance pins or changes an input.
4. Inspect each missing/changed method, register/parameter layout, branch, handler,
   class fingerprint and native byte range. SDK naming/version similarity is not
   compatibility evidence. Keep original network/login/error paths intact.
5. Record root cause/motivation, expected deltas, normal/nearby/rejection cases and
   success criteria before editing. Add only independently measured exact aliases
   for reviewed writer encodings; do not weaken missing/modified-input rejection.
6. Guard optional behavior independently. Lottery dispatch depends on its own
   callback/parser/API/WebView classes and exact UI-thread insertion positions.
   Check actual relocated branch targets and operand lifetimes, not just body
   preservation or analyzer success. Do not infer body verification from metadata.
7. Build with the official Java 21 / Android SDK 36 Gradle workflow. Verify the
   exact artifact and patch catalog from the final source commit, not an old CI
   run. Semantic-release owns release versions and generated metadata.
8. Apply the artifact to clean merged APK and full APKM compositions on reviewed
   patcher runtimes. Validate default/ad-support, premium/privacy/ads, skip and
   offline profiles, including preservation of original identity/modules/assets,
   exact method/native/manifest deltas and the single allowed extension helper.
9. Exercise wrong version, offline/skip conflict, modified target/class/native
   input and already-patched reapply. Expected rejection must have the intended
   reason and no APK output. Separately verify that the retired diagnostic value
   fails option validation. Desktop CLI may warn and continue with default
   `block`; compare that output with explicit `block` rather than assuming
   invalid-option validation necessarily aborts the command.
10. Report build/static and phone acceptance separately. Reuse recorded phone
    evidence where a cleanup produces byte-equivalent app behavior; do not spend
    reward chances to re-test documentation or commit squashing. Native/runtime
    startup, cloud conversions and server grants are not proven by compilation.

## Review and history

Keep current contracts in documentation and production regressions beside code.
Temporary overlays, native observers, duplicate diagnostic implementations and
investigation transcripts do not belong in the shipping patch surface. Preserve
needed research in private evidence/development backups rather than a public PR
of obsolete raw source. Never publish user screenshots, identifiers or absolute
account balances as qualification data.

Before an authorized squash, back up the old branch and record the remote head.
Rebase the final tree onto the actual PR base, inspect the resulting scoped diff,
and use an explicit `--force-with-lease` expectation. Confirm Verify and Release
on the rewritten commit and inspect their artifact/catalog/test results. Do not
merge or publish a stable release as a side effect of preparing a PR.
