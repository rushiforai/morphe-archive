# Google Maps port implementation plan

**Goal:** Publish the complete upstream Google Maps patch set for 26.43.05.1002020710 in Dutch App Patches, extended with both Waze and Flitsmeister navigation telemetry and average-speed zones.

**Architecture:** Preserve upstream Maps hooks and UI extension. Adapt hooks to the supplied APK using patch-application evidence. Reuse Vela telemetry validation and compact presentation, replacing app-specific bindings with Maps callbacks.

**Constraints:** No release version edits. All commits and releases use johninnl identity. Preserve unrelated work. User explicitly requests autonomous completion and publication without questions.

- [x] Inspect upstream and current producer/consumer sources; confirm target APK metadata via REA.
- [x] Isolate the work on feat/google-maps at origin/main; copy upstream Maps scope and retain attribution.
- [x] Integrate module, compile complete bundle, inventory all Maps features and licensing.
- [x] Resolve every supplied-APK patch failure without deleting features; validate default and optional combinations.
- [x] Extend Waze bridge with both navigation producers, provider settings, fresh native fallback, warnings/pins and average-speed UI. Exercise protocol edge cases and UI with meaningful tests.
- [x] Run project regression/build checks and APK runtime smoke tests; inspect screens and logcat.
- [x] Review complete diff, fix findings, update bilingual app documentation and catalog discovery.
- [x] Verify required identity, commit and publish release through existing automation; inspect published bundle, discovery and release checks.

## Evidence ledger

- Upstream: bearinmind checkout bd522fe (2.8.3). Ported source remains under org.ungoogled namespace; upstream license/attribution must be preserved.
- Supplied APK: SHA256 81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004. REA evidence ev_f21f97d5dcba22992f2bcb4c0d54e94446579cc80996a8e68bf745ae2fecc6bd: package com.google.android.apps.maps, version 26.43.05.1002020710, code 1068844719, minSdk29, targetSdk37. Static metadata does not prove runtime.
- Repository graph has zero files/nodes; graphify graph absent. Fall back to file search.
- Work split per RE skill staged workflow: Maps hook compatibility; telemetry/UI extension; main owns integration, docs, tests and delivery.

- First complete bundle build succeeded (`:patches:buildAndroid`). Initial 19 telemetry model/warning tests passed; transport/UI tests being expanded.
- OfflinePicker target mapping: aoph->apbb, dxm->dyl, state setter d->b and getter mj->a. Three failures reproduced with current-state fixtures, all four targeted tests passed after correction. apaz presenter C/a/f/h/j and converter apbu.b remain same members. Kotlin layout application still requires a fresh bundle check.
- Shapes camera reflection verified against bmfk/bmfq/bmfn/bjwh target source: provider d.a, setters i/k/s, position x.d and zoom q unchanged.
- Python regression: 414 tests passed, 45 skipped. Release Node checks: 47 passed. Identity preflight passed for johninnl (no commits yet).
- Added provider visibility resource dependency for nl.flitsmeister/com.waze because Android14 sender validation otherwise cannot resolve the FM package.
- Release guard expects source under patches/src/main/kotlin/patches/<app>; relocate imported Kotlin into patches/googlemaps while preserving upstream packages before committing, and remove unused AllTrails compatibility declaration.

- Full Maps extension debug suite passed 40 tests, including 4 legacy bridge regressions, provider/expiry/Flock cases, rendered source chooser and compact metric/imperial views, offline reflection and search-row filtering.
- Default APK validation progressed 10/27 -> 19/27 -> 23/27 while resolving actual fingerprints/DEX calls. Both microG variants passed isolated patch/rebuild/signing checks; final full-profile application remains pending.
- Search target: avpa.ao typed unified results and avpa.M parsed rows use cgrr.c==5 sponsored discriminator; general server-driven flag cgrr.b&1 is not an ad flag. New fragment avhr.aZ inlines former row builder. Added row-list filtering at typed getter to retain normal rows without fragile fragment register borrowing. Sponsored placemarks scratch changed from live-list v12 to v10 after direct DEX liveness inspection; initial loop object and hasNext now share v2, so scratch must be overwritten CONST4 v3 and builder-dead v5 at separate sites.

- Default profile GREEN: all27 defaultMaps patches applied; no patch/assembler errors; rebuilt APK v2signature verified and all8063 audited direct extension/injected references resolve. Actual Maps inventory30 equals upstream names/defaults. Full optionalprofiles and runtime ongoing.
- Relocated imported Kotlin physicalfiles to patches/src/main/kotlin/patches/googlemaps (upstream packages preserved) so source-based release/app-scope guards recognize every Maps edit. Removed unused AllTrails declaration.

- Fresh review found native fallback freshness defect: speed/limit stores run only when integer display changes. Corrected observation entry hooks now run for every setter call; limit unit bridge accepts explicit km/h or mph and otherwise uses existing native units. Added repeated40-second equal-value and same-numeric-limit unit-change tests. Full Maps extension now42tests green.
- Runtime first launch exposed KeepAccountSheetOpen clobbering a live dispatcher receiver with Booleantrue; fixed using a separately verified scratch register. Fresh runtime test ongoing. Earlier startup PNG showed background RainViewer after crash and is not Maps evidence.
- Full release Gradlecommand passed: Medium reader85, privacy4, Waze30, Flitsmeister13, Vela34, Maps42, patchKotlin21 tests. Medium dependency/ABI audit passed (zero collisions), 15 Medium tooling tests passed. Fresh Python414 passed/45skipped and Node47 passed. Generated actual bundle metadata has30Maps controls; all104 bilingual app pages match names/defaults/targets/input/download rules.
- Local stable moved to v1.24.1 during work; fast-forwarded isolatedworktree to releasecommit32a2c0d preservingdirtyMaps work. Archived only our stale1.24.0generatedbundle/vendorjar so metadata validators cannot pick stale files. Semantic-release still owns nextversion.

- Full4profile functional bundle validation passed: defaults27, microG-RE28, originalmicroG28, media28; union30. Added exacttargetSDK29 and1068844719 codes for all4ABIs; byte-for-byte APK payload comparison confirms metadata pin did not alter DEX/resources.
- Fresh emulator launch and account/source selection passed; actual Maps map, search suggestions and Flitsmeister selection visible. Controlled Flitsmeister zone replay passed senderidentity,82km/h/90limit, observedpartialaverage90, estimated35percent/1200m, attachedcompactwidget, boundnativegenerator,2adapteritems andoneannouncedwarning. NativeUnits bridge explicitkmh/mph executed correctly.
- Runtime pin redraw uncovered IllegalAccessError for package-private personal-place generator apoh; rawadaptercount/boundgenerator do not prove actualpins. Fixing nativeclassaccess and extendingreferenceverification to accesschecks. Publication remains held until realpinrendering andcompleteconsumerreplays pass.

- Finalaccess-fixed4profile matrix passed (defaults27/microG-RE28/originalmicroG28/media28), signed v2, all emitted native references resolve and are accessible. Validatedbundle7a2854111d1f7196c0ab16e8f4124ebccd72d961b034bcdc2e105af827dfd661.
- ActualMapspolice/camera pins visibly render after generatorclassaccess fix; nativeworker consumes2items. Eightconsumercasespassed and a ninthsameprocessWazezone-to-clear transition passed. Nativepins/zone/average clear tozero; allstrictfatallogchecks clean. Submittednormalsearch/place details/Save-Unsave/routepreview passed. Testpublishers/instrumentationremoved and source restoredOff.

- Published v1.25.0 through automated release workflow41380498959 (success), sourcef57abb97c9eb11de5792dc50d66c3bab62d4489a, generatedreleasecommit9d2aa53. Stable Morphe discovery verified; downloadedMPP Ed25519 signature verified, SHA25692263759a8a6694409cff395098d78a04e70da1091e3cc073bfb8f7841af9ee7. All184 Maps/shared compiled entries byte-identical to the validated bundle. Publication proof is retained in docs/maps/validation.json.
