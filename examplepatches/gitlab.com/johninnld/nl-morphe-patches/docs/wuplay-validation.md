# Wuplay catalog publisher validation (phase 1)

This records the original standalone-selector implementation. For the in-app,
Home-only update and Android TV visibility approvals, see [phase 2](wuplay-home-channels-validation.md).

Target: original `app.wuplay.androidtv` 0.9.4-beta / 49, minSdk 24.
Original APK SHA-256: `3f6dc351f7aefeb634d55602c4921c1826555153390d7aee0f622ac7a02d0802`.
Original certificate SHA-256: `ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f`.

The root-enabled Android TV had the same version and one stored profile. Only the profile/settings and catalog-definition preference files were copied privately for testing; they are not repository fixtures or packaged assets. The default means the first stored profile, because this build has no explicit default-profile flag. Catalogs are loaded and fetched through the native repository only while that profile is active. Library, Watchlist and navigation groups use different native paths and are excluded.

## Source and APK checks

- `python3 -m unittest discover -s tests`: 392 tests passed, 39 skipped using the repository's existing optional-tool/input conditions. A real-loop JVM regression verifies that deselection during a suspended fetch prevents starting the remaining deselected requests and prevents publishing their results.
- `:patches:buildAndroid`, `:extensions:medium-reader:testDebugUnitTest`, `:extensions:medium-privacy:testDebugUnitTest`: passed with JDK 21 and the Android SDK.
- Bundle signed using the repository's existing Morphe signing key. Release version and generated release metadata were not committed or bumped.
- Morphe Desktop 1.19.1 applied the actual bundle with `--exclusive --validate --bytecode-mode FULL -e "Publish selected catalog channels"`. Patching, rebuilding and signing passed.
- `tests/verify_wuplay.py ORIGINAL_DECODED PATCHED_DECODED`: all 7,961 original classes and methods retained. Exactly one native method changed: `WuPlayApplication.onCreate()`, with one additive initialization call. The 25 added classes all belong to `nl.johninnl.wuplay`; Kotlin/coroutines are not repackaged.
- Original-input guards validate package, version, build, minSdk and signer. Native guards check all reflected fields, repository entry points and coroutine ABI before changing the lifecycle method.
- Final product APK passed `apksigner verify --verbose` and `zipalign -c -p 4`. Its SHA-256 is `38a11c31a7463a7d341c7098800bc7dd879533c2ef128d84d1420168fcd9ad5f`.
- Strict MkDocs build and Markdown link validation passed. Against current-main candidate metadata, the app-page checker passes all 88 bilingual app pages, including Wuplay. Current main already contains the catalogue-only Waze mapping fix that was missing from the original feature base.

## Observed runtime checks

Android TV API 36 emulator, with a private copy of the inspected default-profile preferences. A test-only APK enabled `debuggable` to seed those preferences without altering the real TV. All four DEX files were byte-identical to the final product APK; only the QA manifest/signature differed. Provider assertions ran inside the target UID through `tests/fixtures/wuplay-runtime/WuplayProbe.java`, rather than relying on the shell's restricted TV-provider view.

- The real default profile's catalog checklist loaded. D-pad selection worked. Right moved focus directly to **Save and refresh**.
- **Trending Today** and **Latest On Digital** published two channels and 200 programs. Artwork URLs, weights, stable program keys and explicit Wuplay intents were present.
- Repeating the native refresh preserved both channel IDs and all 200 program IDs, order, artwork and intents.
- Renaming a catalog in the QA fixture changed its channel name without changing its ID.
- A successful empty response cleared only the chosen catalog's programs and retained the channel itself. A subsequent native refresh repopulated it.
- A failing native fetch retained the previous provider content. Switching to a second active profile refused refresh and left the default profile's channel/program snapshot unchanged.
- The final build published both a preset (**Trending Today**) and an add-on catalog (**Cannes — Palme d'Or**), 100 programs each. The deselected previous catalog was removed; the retained catalog ID stayed stable.
- Deselecting the retained preset in the UI and saving with the D-pad removed only that channel, leaving the add-on channel and its 100 programs.

The original rooted TV's APK was not replaced. Public movie links resolved to the native MainActivity, but rendered detail/playback behavior was not established (the physical display capture was black). Launcher-specific presentation, extended lifecycle behavior and device installation remain follow-up acceptance checks; no Monet changes are included.

## Refresh and ownership

No catalogs are selected on a fresh install. Selections use `santodan-launcher/wuplay/<encoded-profile-id>/catalog/<definition-id>`. Names and list positions are not identity. Provider writes are serialized off the main thread, capped at 100 usable movie/series tiles per catalog, and use explicit Wuplay intents and HTTP(S) artwork. Failed catalog fetches do not replace programs. Successful empty results are authoritative. Deselection/removal touches only this publisher's own channels, never Watch Next.

Provider upserts precede pruning but are not transactional: a provider write failure can leave a partially refreshed catalog. Provider write-failure injection and rapid default → other → default profile transitions during a suspended request remain untested.

Refresh occurs on foreground entry, on explicit save, and every 30 minutes while an activity is resumed. Already-running requests may finish after pause. Native suspend requests have a 45-second worker-side deadline and their own cancellable native Job. There is no service or independent account/network implementation.
