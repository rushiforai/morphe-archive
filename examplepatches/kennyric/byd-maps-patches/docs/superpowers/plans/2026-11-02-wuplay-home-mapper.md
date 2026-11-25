# Wuplay Home mapper repair

Goal: Offer the user's actual Home catalogs in their configured order, publish portrait posters, and make Cancel / Done the complete picker workflow.

Evidence: The original APK resolves the Home SidebarScreen.rowCatalogIds before falling back to showHome/homeOrder. The inspected TV has ten explicit Home rows; several have showHome=false. The old publisher prefers background artwork and the old Done button only closes.

- [x] Add failing regression for explicit screen rows, false legacy flags, ordering, missing IDs, duplicates, empty Home, legacy fallback and membership changes during fetch.
- [x] Resolve native screen rows in NativeCatalogs; guard the additional public ABI in CatalogChannelsPatch.
- [x] Publish portrait poster URLs with aspect ratio 2:3; keep stable program/channel identity.
- [x] Replace actions with Cancel and Done; retain draft selection until Done, publish then run Android approval queue, use clear focus styling and deterministic D-pad navigation.
- [x] Run JVM/Python regressions and release Gradle checks, apply the built bundle to the original APK, verify DEX and signature, exercise actual Home order, save/cancel/approvals, focus and poster provider data on an isolated TV install.
- [x] Update bilingual user docs and record bounded runtime evidence. Keep main and unrelated work untouched; no stable release without confirmation.

The user approved promotion to main and publication of the updated user guides on 2026-11-02. Release version selection remains automated.
