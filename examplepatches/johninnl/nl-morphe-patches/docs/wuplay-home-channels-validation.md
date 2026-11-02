# Wuplay Home catalog channels validation (phase 2)

Target: original `app.wuplay.androidtv` 0.9.4-beta / 49.
Original APK SHA-256: `3f6dc351f7aefeb634d55602c4921c1826555153390d7aee0f622ac7a02d0802`.
Candidate APK SHA-256: `157ced4f87ff203f617b497c795c733c8d66278bf445dae255f36e288cc19269`.

## Result and scope

**Settings > Catalogs > TV channels** opens an internal D-pad selector. The
separate launcher entry is removed. Only supported content catalogs with native
`showHome=true` appear, in native Home order, for the first stored profile while
it is active. Navigation groups, Library and Watchlist remain excluded. Fresh
installs select nothing; existing eligible selections retain their stable keys.

Publication intersects saved selection with current Home eligibility. The real
refresh loop checks both again before and after native suspended fetches and
prunes removed/deselected channels on a successful refresh. Failed native reads
retain existing content; successful empty results clear programs. The existing
foreground refresh lifecycle, native account access and provider ownership scope
remain in use. No separate network client or background service was added.

Publishing and launcher visibility are separate. Wuplay already declares
`WRITE_EPG_DATA`; this update adds no runtime permission. **Add to TV Home** uses
Android's channel-browsable approval activity only for selected, eligible,
owned preview channels that are not already browsable. Cancellation stops the
queue and keeps published content. Launchers without that activity receive a
message directing the user to launcher settings. Monet can consume the
published rows without Home-screen visibility approval.
See [Android's channel lifecycle](https://developer.android.com/training/tv/discovery/recommendations-channel)
and [TvContract](https://developer.android.com/reference/android/media/tv/TvContract).

## Artifact and regression checks

- Python suite: 396 tests run, 39 skipped under existing optional-tool/input
  conditions, no failures. New tests execute production Home snapshot, refresh
  loop, policy and native Settings-row code against deterministic ABI fixtures.
  They cover non-Home exclusion, Home ordering, selection/visibility changes
  during fetch, ownership/browsability filtering and native Left/Back forwarding.
- Gradle `:patches:buildAndroid`, `:patches:test`,
  `:extensions:medium-reader:testDebugUnitTest`,
  `:extensions:medium-privacy:testDebugUnitTest` and
  `:patches:generatePatchesList` passed.
- Morphe Desktop 1.19.1 applied the actual candidate bundle to the original APK
  with exclusive selection, validation and full bytecode mode. APK signature
  verification and `zipalign -c -p 4` passed.
- Independent decoded-APK audit retained all 7,961 original classes and methods.
  Exactly four native methods changed: application initialization, appending the
  Catalogs row, extending its previous final-row focus boundary, and preserving
  the validated original signing digest in native `BuildIdentity` construction.
  All 32 added classes belong to the Wuplay extension; no replacement Kotlin or
  Compose runtime is bundled. The selector is non-exported with no intent filter.
- Original package/version/build/minSdk/signer and native ABI/body fingerprints
  guard the changes. Re-signing otherwise caused native device registration to
  display a modified-build HTTP 403 error. The scoped `BuildIdentity` adjustment
  restored native startup in the test install. PackageManager results and native
  account/device authentication code are retained; future server acceptance is
  not guaranteed by this local test.
- Candidate metadata passed the app-page checker for all 90 bilingual pages.
  Strict MkDocs, rendered-site validation and Markdown link checks passed.
  Generated release metadata and version files are excluded from the commit.

## Observed Android TV behavior

The isolated test target is an Android TV API 36 emulator. A QA APK differs in
manifest debugging/signature so private preferences can be seeded; all four DEX
files match the candidate product APK byte for byte. Preferences copied from the
rooted TV are private test input, never fixtures or packaged assets.

- Native Home and Settings loaded. D-pad navigation reached the appended row
  after the two existing Catalogs actions. The native row retained its styling
  and Left/Back callback. Closing the selector returned to the native pane.
- The inspected profile had 70 definitions, of which four eligible content
  catalogs were enabled on Home. The selector showed those four, initially
  unchecked, rather than all definitions.
- Selecting **Trending Today** and **Latest On Digital** and saving published
  exactly two channels with 200 programs. The first channel was automatically
  approved by Android; the second used the standard system Add/Cancel dialog.
- Cancel kept the content and returned to the selector. Retrying displayed the
  same pending channel. Granting completed the queue. Repeating the action
  produced no additional dialog. In-UID provider evidence reported both channels
  as browsable.

The final candidate's exact DEX files were reinstalled after the last policy
change. Native D-pad entry, the four-row selector with retained selections,
successful two-catalog refresh, skipping already-approved channels, returning
to the native pane and Left-to-Catalogs focus were rechecked.

The physical ATV at `192.168.50.89` was separately captured running its installed
0.9.4-beta / 49 baseline. Its existing Catalogs pane had refresh controls and
web-configurator guidance, with no TV-channel selector. Its APK and private app
data were not replaced. Baseline screenshots and emulator candidate screenshots
must not be presented as the same installed build.

## Limits

The phase-2 APK has not been installed on the physical TV. Provider writes remain
serialized but nontransactional; write failures may leave a partial refresh.
Unsupported-launcher handling and approval queue restoration were source
reviewed but have no device-level acceptance test. Rapid default/other/
default transitions during a suspended fetch remain an untested race boundary.
The source stays on a feature branch pending approval for promotion to main.
