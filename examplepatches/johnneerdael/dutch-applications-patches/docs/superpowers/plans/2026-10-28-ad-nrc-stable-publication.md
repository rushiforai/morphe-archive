# AD and NRC stable publication

On 2026-10-28 the user reported NRC and AD work and explicitly approved publication after v1.6.0-dev.3. Promote the exact tested AD/NRC production sources to main through a selective release branch. Retain the existing eight stable apps; keep Flitsmeister implementation and its validator out of stable. The existing dev-to-main PR is intentionally not merged wholesale.

- [x] Verify clean dev and stable baselines, and record user phone acceptance.
- [x] Import unchanged AD/NRC production sources, independent tests and audits; extend stable validation profiles/input guards only for those apps.
- [x] Verify the release tree, its generated 50-control/ten-app catalog, actual original-input guards and combined AD/NRC FULL/sign/redecode/browser checks.
- [x] Independently review the promotion, merge its PR to main, and verify the automatic stable release and published bundle.
- [x] Synchronize release changes back to dev while retaining development-only Flitsmeister work.

Pre-publication evidence: 19-test main baseline, 37 final Python tests, 312 actual-SDK guard assertions, generated 50-control/ten-app catalog with all 39 existing entries unchanged, and both original-plus-combined FULL/sign/redecode matrices. NRC requires Chromium, private original source and genuine premium fixtures; AD requires genuine premium fixture pairs. Independent promotion review found no Critical/Important issues.

Published stable [v1.6.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.6.0), main release commit `b209245`. Actual MPP SHA256 `b1b2d26ccb5ea1204ec5903bd4ef94ed40815e3472781f559e63c67b6d2a44c6`; published metadata has 50 controls/ten apps and the actual published bundle passes 312 guard assertions. Post-publication automatic backmerge conflicts were resolved through `ceb0138`, preserving dev-only Flitsmeister controls and current dev metadata. Workflow `40628099459` retry attempt2 succeeded.
