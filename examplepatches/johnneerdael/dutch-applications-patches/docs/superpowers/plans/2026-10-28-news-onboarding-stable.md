# Approved news onboarding stable publication

The user approved all Trouw, Volkskrant and NU.nl changes from v1.7.0-dev.1 for stable release on 2026-10-28. Promote the exact tested source to main, retaining ten stable apps/fifty controls and keeping Flitsmeister on dev. NU.nl topic selection remains interactive; fresh notification defaults remain off; saved choices/manual settings remain available.

- [x] Reuse the isolated release worktree from clean main and record phone approval.
- [x] Copy the approved production/test sources unchanged and retain stable-only profiles.
- [x] Verify source identity, final Python tests, build/Android DEX, fifty-control catalog and actual-SDK input guards.
- [x] Independently review the selective promotion, merge its PR, and verify the generated stable release and downloaded bundle.
- [x] Synchronize main back to dev while retaining development-only Flitsmeister.

Stable candidate checks:39 Python tests,312 actual-SDK input assertions, generated50-control/ten-app metadata with exactly three description changes and unchanged defaults/compatibility, and Android DEX containing all three approved policies. Production source and app-specific verifiers are unchanged from the reviewed and phone-approved prerelease, whose original/consent/all APK matrices passed. No additional app implementation is promoted.

Published stable [v1.6.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.6.1) from selective PR11/source738bbc2; main release commit e72394b. Actual downloaded asset SHA256:0543e9f6506716021b59a75728ef7f6c052a54af9ed1466ff145dded84e882ac. Android DEX includes the three approved policies/NU source-bound topic guard, excludes Flitsmeister, and the fifty-control/ten-app catalog matches the reviewed candidate. Published-bundle input regression passes312 assertions. Main workflow40632728193 retry attempt2 succeeded after post-publication backmerge conflicts were resolved by e2025c2; dev retained52 controls and its existing prerelease artifact. Sync tests40PASS; stable-tree tests39PASS. User approval is recorded without claiming exhaustive independent device/network coverage.
