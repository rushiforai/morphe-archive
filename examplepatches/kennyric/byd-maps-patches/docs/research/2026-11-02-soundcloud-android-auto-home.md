# SoundCloud Home in Android Auto

Investigation date: 2026-11-02. Input: publisher APKM `com.soundcloud.android` 2026.10.28-release / 379050 (Android 12L+), signer `aff930d6…441339d2`.

## Finding

The user reported that SoundCloud's car Home tab is empty in Android Auto and in Gearslip/DriveDeck, while Feed, Library and the phone Home work.

- `MediaService` (`MediaBrowserServiceCompat`) delegates to `DefaultMediaBrowserDataSource` and `DefaultMediaBrowserCatalog`. The car root `my_soundcloud` lists three entries: Home (`discovery`), Feed (`stream`) and Library.
- The Home entry, `DiscoveryCatalogEntry`, loads `DiscoveryOperations` cards from the legacy **`/discovery/cards`** endpoint. It maps only `SingleContentSelectionCard`, `PromotedTrackCard` and `MultipleContentSelectionCard`.
- The phone Home uses `DefaultSectionsService` with **`/home/query`**, layout `soundcloud:layouts:home-library`, SDUI version v8/v9/v10.

The empty car Home is consistent with the legacy feed no longer returning cards of those types. The live `/discovery/cards` response was not captured, so that last step is an inference.

## Patch

**Home in Android Auto** (`patches/soundcloud`, extension `extensions/soundcloud`):

1. The constructor of the Dagger factory `SectionsDataModule_Companion_ProvidesSectionServiceFactory` passes itself to `HomeSections.setServiceProvider`. The application graph builds this factory at startup.
2. `DiscoveryCatalogEntry`'s loader (identified by `loadDiscoveryItems`) handles the Home root first. `HomeSections.load` runs on the browser's IO thread. It calls the `SectionsService` method that `DefaultSectionsService` implements with the home-library layout; R8 names are resolved at patch time. Each section with `getTitle()`/`getResults()` maps through the response's `getEntities()` to SoundCloud's own `MediaItemBuilder` items, with `MediaId(urn, DISCOVERY)` IDs.
3. Tracks, track reposts, system playlists (mixes) and users are playable. Playlists and albums are browsable through the existing playlist path. Every item carries `CONTENT_STYLE_GROUP_TITLE_HINT` with its section title.
4. A main-thread call, missing provider, timeout, error response or empty result returns `null`, and the original legacy Home code then runs. Results are cached for five minutes.

## Verification

- `:extensions:soundcloud:testDebugUnitTest`: mapping order, group titles, per-section limit, de-duplication, repost and system-playlist handling, and unexpected shapes.
- Desktop patching and rebuild of the exact APKM succeed. Emitted DEX shows the factory hook, the Home root hook (`SingleJust` result, with the original code as fallback) and all three bridges bound to `SectionsService.b`, `MediaItemBuilder.i` and `MediaItemBuilder.b`.
- API 36 emulator, patched app (debug-signed, no account) with an instrumentation probe in the app process:
  - The provider was captured at startup.
  - `DefaultSectionsService` resolved.
  - The Home request suspended and resumed after 739 ms with `ServerError` 401, which is expected without an account.
  - A real `MediaDescriptionCompat` built by the app's builder kept the group title through `MediaItem` parceling.
  - No verifier or runtime errors at launch.
- Not verified: signed-in Home content, playback and car display. These require the user's account on a device.
