# Bstation patch consolidation

Six selectable entries replace the former twenty. Original behavior defaults are retained as options. Remove user content, Disable tracking and GmsCore support remain independent; their names/options are unchanged.

## Selection migration

Old options files must be remapped explicitly; old patch names are no longer registered. Grouped entries default enabled, except Remove user content (still opt-in).

| Former entry | New entry | Enable option (default) | Existing option mapping |
| --- | --- | --- | --- |
| Hide feed ads | Remove ads | `hideFeedAds` (false) | `hideQuestionCards` unchanged |
| Disable floating ads | Remove ads | `disableFloatingAds` (true) | None |
| Disable inner push banner | Remove ads | `disableInnerPush` (true) | None |
| Disable splash ads | Remove ads | `disableSplashAds` (true) | None |
| Disable player overlay ads | Remove ads | `disablePlayerOverlayAds` (true) | None |
| Disable under-player ads | Remove ads | `disableUnderPlayerAds` (false) | None |
| Hide home search bar | Clean interface | Existing options; all false disables behavior | `hideHomeSearchBar` unchanged |
| Hide home tab bar items | Clean interface | Existing options; all false disables behavior | `hideFeaturedTab` unchanged; `hidePlazaTab` unchanged; `hideCampaignTabs` unchanged; `hideSubscriptionsTab` unchanged; `hideAnimeTab` unchanged; `hideShortsTab` becomes `hideHomeShortsTab`; `hideOpusTab` unchanged |
| Hide bottom navigation items | Clean interface | Existing options; all false disables behavior | `hideDiscoverTab` unchanged; `hideCreateButton` unchanged; `hideChatsTab` unchanged; `hideMeTab` unchanged; `hideShortsTab` becomes `hideBottomShortsTab` |
| Clean Me page | Clean interface | Existing options; all false disables behavior | `hideCreatorCenter` unchanged; `hideCampaignMenu` unchanged; `hideFaqMenu` unchanged; `hideFeedbackMenu` unchanged |
| Debloat search landing page | Clean interface | Existing options; all false disables behavior | `hideTrendingSearches` becomes `hideSearchTrending`; `hideDiscoveryModules` unchanged; `cleanSearchBarHint` unchanged |
| Pure discover search bar | Clean interface | Existing options; all false disables behavior | `hideDiscoverTabs` unchanged; `hideTrendingSearches` becomes `hideDiscoverTrending` |
| Disable rating prompts | Clean interface | `disableRatingPrompts` (false) | None |
| Disable player watermark | Clean player | `disableWatermark` (true) | None |
| Disable player recommendation widget | Clean player | `disableRecommendations` (true) | None |
| Disable player outro unlock card | Clean player | `disableOutroCard` (true) | None |
| Hide user interactions | Clean player | `hideUserInteractions` (false) | None |

Home tab layout additionally uses `simplifySinglePageHome` (default true), preserving the old automatic single-page reconciliation. Disable it and all Home tab filters to avoid Home fingerprints. All other UI behaviors skip matching when their options are false. Feed questions are meaningful only with `hideFeedAds` enabled.

## Home search precedence

When single-page simplification is enabled, the actual installed native adapter count governs presentation. Exactly one destination keeps native search visible even with `hideHomeSearchBar=true`. Other destination counts apply the hide-search preference after restoring only tabs owned by the helper. Initial native search hiding runs before final reconciliation. Refresh returns also reconcile, so transitions from one destination to multiple destinations hide search again when requested. Missing views/adapters remain guarded.

## Implementation and evidence

Existing execute bodies became internal BytecodePatchContext functions; three new registrations call them only for selected options. No new APK fingerprints, dependencies, compatibility targets or version changes. Existing comments, register checks and control-flow guards remain.

Fingerprint evidence remains `analysis/bstation/notes/content-filtering*-smali.md`, `ui-debloat-targets.md` and `home-single-page-targets.md`. Targets and selectors are unchanged. Home search precedence uses the already verified native search ID and the existing hide helper; it adds no new selector.

Build: `./gradlew buildAndroid --offline`, exit 0; log `analysis/bstation/notes/consolidation-write-build.log`. Registration/application and runtime tests are separate gates.

Focused emitted-code check: `python3 Kagebili/scripts/check-home-search.py <emitted-HomeFragmentV2.smali>`. It reuses the established bounded evaluator and covers search precedence, adapter-count transitions and missing bindings. It requires a variant with both search hiding and single-page simplification enabled.

No device installation or Android runtime verification.

## Changed files

- `docs/patch-consolidation.md`
- `patches-list.json`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/FeedAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/FloatingAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/InnerPushPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/RatingPromptsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/RemoveAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/SplashAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ads/UnderPlayerAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/content/HideUserInteractionsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/player/CleanPlayerPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/player/OverlayAdsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/player/PlayerOutroPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/player/PlayerRecommendPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/player/PlayerWatermarkPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/CleanInterfacePatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/CleanMePagePatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/DebloatSearchPagePatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/HideBottomNavItemsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/HideHomeSearchBarPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/HideHomeTabBarItemsPatch.kt`
- `patches/src/main/kotlin/id/ikuradachi/patches/bstation/ui/PureDiscoverSearchBarPatch.kt`
- `scripts/check-home-search.py`

Catalog/README generation: `./gradlew :patches:generatePatchesList --offline`, exit 0; log `analysis/bstation/notes/consolidation-catalog-build.log`. The old 1.0.0 bundle was temporarily renamed so the existing generator selected the version-resolved current bundle, then restored. Catalog assertions confirmed exactly six expected named entries and no duplicate option keys.

## Android bundle detection repair

The first delivered bundle passed Desktop registration and application checks but was missing `classes.dex`, which Android uses for patch discovery. The Gradle plugin's `buildAndroid` task compiles DEX and merges it into the same MPP produced by `jar`. Running the old `generatePatchesList` task afterward depended only on `build`: `jar` recreated the archive without the DEX payload. Desktop loads JVM classes, so its successful listing did not catch this packaging failure.

`generatePatchesList` now depends on both `build` and `buildAndroid`, keeping `jar` before Android packaging and catalog generation afterward. The generator receives the exact version-resolved archive path rather than choosing the first MPP in `build/libs`. `buildAndroid` now fails if its output lacks `classes.dex`.

Regression check: `python3 scripts/check-android-bundle.py` checks archive CRC, DEX magic, the six current owner descriptors and registration getters (including all three new groups), and absence of all seventeen obsolete getters. A fresh D8 build produced 166,988 DEX bytes, distinct from the 178,056-byte baseline DEX.

From the repository root, `./gradlew :patches:generatePatchesList --offline` passed twice, including a second invocation after Android packaging. Both runs preserved current Android registrations and generated exactly six catalog entries for version `1.1.0-dev.1`. Build logs: `build/consolidation-android-build.log` and `build/consolidation-android-repeat.log`.

Final bundle after the repeated generation: `patches/build/libs/patches-1.1.0-dev.1.mpp`; SHA-256 `4019d0f8870e0a31b6d8356ab4398c4fdaa675df06d774c66dc9f4026111e665`. This repair changes only packaging/configuration, the catalog utility and its check; APK patch behavior is unchanged. Device import remains untested.
