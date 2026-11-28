# v2.2.0 recovery review — not a release

Publication was approved by the maintainer, but this branch is a preparation branch, not a publishable release. The standard build, version and generated Manager metadata remain at 2.1.9 until the recovered payload, corresponding sources and licensing are reviewed.

## Reviewed JVM sources

These are reconstructed, locally compiled sources, not a claim to have recovered the original development history. The following Git blobs match the independently reproduced candidate source files:

- `NicoidModPatch.kt`: `29bd4549ebe49b4952b5f4b7855c9e99bfbc9ecb`
- `SwipeInterfaceMerge220.java`: `07681e1e20d6fa22b286563a7b5253493c90257e`

The remaining removal guard, helper/method smali and compiled resources are in the separately retained reconstruction tree. Do not compile the two review files on their own or replace the active patcher without the rest of the verified tree.

## Actual payload inventory

Local inspection of the reconstructed MPP (SHA-256 `151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7`), exact stock APK and local four-DEX output:

- Stock 8,016 classes, helper 8,898 disjoint classes, method-delta 211 classes (all present in stock); final 11,414 classes.
- 4,547 stock and 953 helper classes removed, total 5,500. The final class set contains 7,945 helper classes.
- Compiled resource delta 1,191 entries: 26 byte-identical to stock, 376 changed relative to same-named stock entries, 789 new paths relative to stock. This is not a v2.1.9 comparison or a rights determination.
- One test class in the helper is absent from the final DEX. No change to the approved candidate was made.
- The MPP itself carries network238 notices (Apache-2.0, MPL-2.0, AndroidX Annotation license and NOTICE). The base repository additionally carries the v2.1.9 runtime update notices under `porting/revisions/v2.1.9-dev.7/licenses/`. Retain those notices; identify other applicable notices and preferred source before distribution.
- The source input archive retains POM and embedded-license evidence, but package namespaces and POMs alone cannot establish full license compliance. In particular, audit the actual retained Media3, Guava, LAME, Kotlin, AndroidX, Commons Lang components, modified stock methods and resource provenance; distinguish build-only dependencies.

## Release gates

- Transfer and review the full source tree; recover original dev.5 and dev.6–110 source changes or establish an equivalent maintainable source tree and its provenance.
- Connect the exact reproducible build to the normal Gradle and release staging process. Do not publish a raw v2.1.9 MPP with a changed version string.
- Keep the approved 80-item release notes. Run source/build/CI/CodeQL checks and actual Manager 2.8.0 / Patcher 2.6.0 verification before merging to main and invoking the existing approved release workflow.
- No tag or release has been created here. No release safeguards are disabled.
