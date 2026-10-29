# Sequential Dutch-app development rollout

The user requested an SSD worktree and implementations for Parool, Dumpert, RTL Nieuws, Omroep Brabant and Voetbal International first, followed by the remaining researched apps. Implement one app at a time and publish regular development releases for phone testing. Flitsmeister, FD and De Telegraaf are excluded from new work. Keep the ten approved apps functional and retain their stable release boundary.

## Approach

Use the existing Kotlin Morphe bytecode/resource patch architecture, original-input/certificate guards and independent decoded-output verification. Start with Parool's independently matched Trouw cohort, in a separate Parool package. Copy the proven narrowly scoped implementation initially: this keeps approved Trouw/Volkskrant behavior unchanged while Parool-specific gaps are added. A shared-cohort refactor would couple approved apps to untested changes; writing an entirely new framework would discard the verified contracts. Reassess duplication after the new apps have phone acceptance.

This approach follows the user's explicit preference to reuse previous patches and proceed with implementation and dev publication. Routine implementation choices and validation stay with the implementer; publication to dev is authorized. Stable publication is outside this rollout until separately approved.

## Per-app acceptance

- Exact package, version/code, minSdk and publisher signing certificates match the research inventory. Missing/ambiguous source contracts fail clearly.
- Ads, trackers/identifiers and automatic consent controls are separately reviewable, with dependencies preventing consent skips from leaving collection active. Preserve manual privacy/account controls and existing user choices.
- Complete real callbacks, coroutine results and startup readiness. Preserve content, authentication, payments, push and functional audio state coordination. Do not invent subscriptions, receipts, consent or rewarded-ad completion.
- Parool: start with Hide ads, Disable tracking, Skip consent screens, Hide Premium banner and Read full articles. Reuse all verified shared targets and cover the additional audio tracker, game IMA, identifier header, monitoring forwarding and actual BrandMetrics domain. Preserve native onboarding completion and fresh notifications off if the cohort contracts match independently.
- VI: first verify actual body delivery through the shipped request contracts. If Pro bodies remain withheld, remove those articles before user-facing list/pager/index mapping, including relevant refresh/search/recommendation paths; preserve free content and genuine account behavior. Do not expose a known nonfunctional Pro entry as an unlock feature.
- Every app has original-negative and selected-positive decoded checks, retained-content/callback guards, actual patch application and signature verification. Runtime acceptance remains the user's phone-testing result, distinct from these checks.
- Publish via the existing semantic-release dev workflow after each app is coherent and validated. Verify the resulting release/catalog/assets and give the user its version and testing scope. Preserve approved app entries. Do not advance main automatically.

## Storage and execution

Worktree: `/Volumes/MorpheResearch/worktrees/dutch-apps-next`; branch `feat/dutch-apps-next`, based on dev `3bed637`. The APFS volume is backed by a sparsebundle on the attached EXT-SSD1. Inputs stay at `/Volumes/EXT-SSD1/phone-apks`; private research at `/Volumes/MorpheResearch/research-2026-10-28`. New build output, Gradle caches and temporary decodes stay on the SSD. Use JDK21 and existing Android SDK/tools. Run memory-capped JVM jobs sequentially.

The first wave is Parool → Dumpert → RTL Nieuws → Omroep Brabant → VI. Then implement NOS Teletekst, 9292, Marktplaats and TVgids.nl individually, adapting that latter ordering to verified compatibility/tooling findings. Dev releases continue between apps; a phone-testing wait does not prevent independent work on the next app.

## Evidence and review

The app reports under `docs/research/2026-10-28/` supply source contracts, privacy boundaries and unresolved runtime risks. Keep proprietary APKs, decoded source, credentials and raw article/media bodies outside Git. Maintain an execution ledger and release record across compaction. Before dev publication, obtain a fresh code review of the completed app increment and resolve material findings with failing-then-passing verification.

## Tracking transparency follow-up

The user additionally requested a README entry for every app explaining tracking destinations, their purpose, data/identifier fields, privacy implications and patch effect. Backfill the ten approved apps and keep this requirement for every new app. Distinguish inspected sender/configuration evidence from captured transfers, optional SDK capability, loaders and blocklist coverage. Disclose retained mixed/functional traffic and unknown upload hosts; do not infer that all bundled endpoints were contacted or that a patch makes the application anonymous.
