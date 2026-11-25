# Version-independent YT Music Gearslip patch

User request: expose Any compatibility, like the Waze integration, while keeping actual caller UID ownership and original unrelated-client behavior. Testing must use files or a disposable emulator, never the phone.

Approach: discover the original UID-check method by its diagnostic string and PackageManager UID lookup; follow the browser-root call graph to its eligibility method. Recover Context and package fields from their typed use/constructors. Preserve original method bodies behind wrappers so register allocation changes are supported. Do not retain release-version maps, obfuscated names, or a particular server flag as selectors. Reject missing/ambiguous/changed contracts before mutation.

- [x] Add failing discovery tests for renamed methods/types/fields, different register allocations, ambiguous anchors, incorrect UID arguments and broken browser links.
- [x] Implement structural discovery and Any compatibility with fail-closed guards; preserve security policy.
- [x] Apply to both available real APKs and a metadata-relabeled unknown-version fixture; inspect emitted DEX.
- [x] Run Android policy probes on a disposable emulator, full regressions/build/docs, and independent review.
- [ ] Publish through the established dev then main release workflow under johninnl; generated metadata/version files remain release-owned.

Any means no fixed version restriction, not guaranteed support for every future internal layout. Known tested builds remain documented separately. Full signed-in catalog/playback acceptance is still outside the proven policy scope.

Verification: seven semantic-discovery regression tests pass, including an inaccessible-field guard added after independent review (RED then GREEN). Both real APKs and a metadata-only unlisted-version fixture pass strict application and nine Android policy checks each with Android Auto absent. Any metadata contains no version/build restrictions. Full account/catalog/playback remains unverified.
