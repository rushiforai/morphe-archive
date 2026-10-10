# Santodan Patches

An independent patch bundle for **Morphe Desktop**, targeting MEO Android TV,
NuvioTV, Reddit, Pillo, and Peafowl Theme Maker.

Build the bundle with the official Morphe Gradle project, then import the generated
`patches/build/libs/patches-<version>.mpp` into Morphe Desktop or Manager.

## MEO Android TV 5.7.0

Use the original `com.alticelabs.meo.androidtv` 5.7.0 APKM. Enable both patches:

1. **MEO - Side-by-side installation** changes the manifest package and launcher
   label. It also renames the application task affinity, the app-defined dynamic
   receiver permission and its matching `uses-permission`, and every content-provider
   authority. This includes the search provider whose original authority is exactly
   `com.alticelabs.meo.androidtv`, not merely a package-prefixed suffix.
2. **MEO - Spoof supported device** changes the provisioning payload's manufacturer
   and model to `Sagemcom` and `DIW3930`. MEO can still return the non-fatal
   `WARNCODE_DEVICE_NOT_CERTIFIED_INFO_MODEL_INVALID_VALUE` warning after evaluating
   the remaining hardware fields server-side, so the patch also disables that one
   equipment-warning route. This is equivalent to the app remembering the user's
   **Watch TV** choice. Fatal provisioning and authentication failures are untouched.

The side-by-side defaults are package `com.alticelabs.meo.androidtv.santodan` and
label `MEO Patched`; both are configurable. Always rebuild from the original APKM.
If replacing an existing patched clone, use the same package name and signing key.

Verification must include applying both patches to the real APKM, DEX and cross-DEX
verification, APK signature verification, and inspection of all resulting manifest
authorities. No resulting authority or app-owned permission may equal one from the
official installation. Device testing is still required for server-side behavior.

## Pillo 0.6.19 and 0.6.20

**Pillo - Local backup and restore** supports 0.6.20, independently of the other
Pillo patches. Its Settings callback hook offers Local file / Google backup before
the existing auth gate. A ThreadLocal bypass re-enters the untouched native callback
only when Google is chosen. A platform Fragment hosts SAF import/export in the
Settings activity; the native BackupAndRestoreActivity also gets a local button.
The fresh-install onboarding restore chooser wraps its native BottomSheetController
to offer local import alongside the existing Medisafe and Pillo account callbacks.
OnboardingActivity registers the current host through a weak reference; the local
option attaches the same retained import Fragment without a settings button.

The native unencrypted `PilloDatabaseBackUpHelper.doBackup` snapshots `pillo.db`;
shared preferences are flushed and archived with files/no_backup/primary external
files. Restore validates indexed ZIP paths, sizes and SHA-256, SQLite quick_check,
and native Room identity `acdc24b1947a76c496bdc3ac20b3d60e`. Cache/code and old native
backup directories are excluded; external content URIs and Android Keystore keys
are not portable. A pre-restore archive is retained in `app_santodan-local-backup`.

Preparation copies staged data to target-filesystem siblings on a worker. The
`PilloApp.attachBaseContext` hook runs before its locale/preference reads and commits
only renames before providers/Room initialize. A persistent preparing/prepared/
applying/committed journal supports rollback after process death. Old WAL/SHM/journal
files are removed as part of the same transaction. After native onCreate, Pillo's
alarm audit is requested; committed cleanup runs on a worker. Google backup APIs
are not called by the local transport.

Run `:patches:verifyPilloLocalArchive`, `:patches:verifyPilloLocalBackup`, and
`:patches:verifyPilloLocalBackupBundle` for actual ZIP/filesystem round-trips,
corruption/path-traversal/duplicate rejection, interrupted transaction recovery,
native DEX contracts/hooks, and packaged local-only/combined application to the
original APK. See `docs/PilloLocalBackup.md` for usage and required phone checks.

**Pillo - Import weight history from JSON** supports 0.6.20 and adds a file-picker
button above Skip in the native weight-entry footer. It uses Skip's
RoundedSurfaceClickable capsule, height, padding and semantic accent color, with
the rounded Add icon and SpacedColumn components. The retained Fragment hosts the
file picker. Open the Weight record screen and select the destination profile
before importing. The runtime captures that profile when opening the picker,
defaults to kilograms, and shows a date-range preview before saving. SWT `weights`
entries use numeric `date` (epoch milliseconds) and `weight`. Conversion preserves
the instant at second precision and stores pounds, matching `WeightTrackerRecord`.
No backup data is embedded in the patch bundle.

The extension uses `AppDatabaseManager`'s initialized native event repository,
reads tracked weights with `FlowKt.first`, and inserts each extra record through
`insertWithConstraint`, checking its returned ID. The native bulk method discards
the null-trackerId group and must not be used for these records. Events have
generated IDs, null tracker/alarm fields,
the selected profile, WEIGHT type, and recordedAtEpochSec. Exact timestamp/float
duplicates are skipped within the backup and against that profile's existing records.
Different values at the same timestamp remain separate records. Parse and storage
run on workers; native suspend functions are awaited through a Continuation proxy.
The patch validates native method and model constructor signatures before mutation.

Run `:patches:verifyPilloWeightImport` for real 0.6.20 DEX contracts and round-trip
checks, `:patches:verifyPilloWeightImportRuntime` for conversion, duplicate handling,
profile isolation and coroutine completion/failure checks, and
`:patches:verifyPilloWeightImportBundle` to apply both Pillo patches from the built
bundle to the original APK and verify the merged importer classes. Optionally pass
`-PweightBackup=<local SWT JSON path>` to runtime verification for the user's 68-entry
backup; this file stays outside the repository. Device testing confirmed import
and the capsule button's final appearance. Remaining device checks cover chart
dates/units, rotation, reimport and native editing/deletion of imported records.

**Pillo - Hybrid Lock-Screen Notifications** supports both versions. The matcher
locates the light-reminder foreground decision structurally and fails if the alarm
dispatcher is missing, changed, ambiguous, or already patched. It replaces only the
foreground predicate with Pillo's existing lock-aware `PowerManagerUtil` predicate,
preserving instruction widths, registers, branch layout, and both native alarm routes.

The real 0.6.20 DEX is covered by `verifyPilloPatch`, which checks the unique match,
mutation scope, rejection cases, and DEX write/reload. Full release verification must
also patch and rebuild the original app bundle. Users must select Pillo's Banner/Light
notification mode for the hybrid routing to apply.

## NuvioTV 1.1.0-beta.2, 1.1.0-beta.4, and 1.1.0-beta.5

Eight patches target package `com.nuvio.tv` (airing-series, finale-date, and stream-preloading patches support beta4 and beta5):

1. **NuvioTV - Merge tracking progress** combines Nuvio Sync and connected-provider
   progress for Continue Watching. It retains the last successful snapshot while the
   providers refresh during startup, then publishes the refreshed merged result.
2. **NuvioTV - Remaining episodes in Continue Watching** adds an opt-in setting that
   displays the number of aired, unwatched episodes. It works with every supported
   tracking integration and is disabled by default.
3. **NuvioTV - Side-by-side installation** changes the package and launcher name so
   the patched build can coexist with the official app. Both values are configurable;
   use a unique valid Android package name for each clone.

**NuvioTV - Keep airing series in Upcoming** is a separate beta.4/beta.5 patch. Its
disabled-by-default setting keeps library series with future scheduled episodes in
the Separate Upcoming Row, preserves native labels such as New Season, and adds the
scheduled finale date to Poster, Card, and Wide displays in `dd-MMM` format.
Enable Show unaired next up episodes and Separate Upcoming Row before enabling
Keep airing series in Upcoming. The blue badge uses white 14sp text and bottom-center
alignment, with a higher z-index to draw above captions. Finale dates use the latest
known scheduled release from Nuvio's catalog; unknown dates are not estimated.
Its preferences and runtime bridge are independent of the remaining-episodes patch.
Use `SantodanAiring:D` for diagnostics.

**NuvioTV - Finale dates in library and collections** adds independent opt-in switches
under Layout > Santodan-Patches (beta4/beta5). It reuses the Upcoming badge style and latest known
catalog episode date, including past dates, with `dd-MMM-yy` formatting and its own
preferences and runtime.
Library uses `ba.n3.m`; collection row cards use `ba.q1.o`, both MetaPreview fields.
`ba.i1` scopes the library/collection calls. Card and restart lambdas capture that
scope so recomposition retains the right setting and other catalog rows stay unaffected.
Only poster images are hooked; collection logos are excluded. Unknown/non-IMDb IDs
and movies are skipped. Dates refresh asynchronously with a six-hour persistent cache.
Use `SantodanFinale:D` for diagnostics. Verify both switches independently on device.

Beta4 runtime patches share an unnamed settings-menu dependency. It inserts one keyed
lazy item in Layout's native section list, rendered with `sa.kc.a` as **Santodan-Patches**.
The menu discovers installed runtime bridges independently and uses their existing
preferences and Compose controls. Native non-focusable section labels (`sa.kc.e`)
group merged progress, its strategy, remaining episodes, and airing-series settings
under **Continue Watching**, and library/collection finale-date switches under **UI**.
The two stream-preloading switches appear under **Streams**. Empty groups are omitted.
The menu runtime check covers all 128 bridge selections.
Old beta4 injected settings rows and merged picker
choices are removed; beta2 retains its original UI. Merged controls register `o9.a1`
and capture the initialized `p8.e` component. If the coordinator has not been created,
they resolve its native `w3` provider on demand; Layout must work before opening the
native tracking settings page. They use its native `f` persistence route with a ContinuationImpl adapter, retaining the
previous native source per profile when enabling merging. `SantodanSettings:D` diagnoses
menu failures. Run `:patches:verifyNuvioSettingsMenuRuntime` for expansion/collapse,
partial patch selections, and coroutine completion checks. Run
`:patches:verifyNuvioSettingsStoreRuntime` for lazy coordinator resolution and reuse.
Verify TV focus/scrolling,
each patch alone, and saved choices on device.

**NuvioTV - Preload streams in Continue Watching** and **NuvioTV - Preload streams on detail page**
are independent opt-in beta4/beta5 patches. Their shared unnamed dependency captures
the initialized `p8.e` component. Its scoped `K2` provider lazily supplies the native
stream repository (`v9.i4` on beta4, `v9.h4` on beta5), whose `j(type, videoId, season,
episode, false)` flow warms the same native sessions as playback. Do not cache stream
links separately or force refresh: native sessions include the profile and source
configuration, expire after 15 minutes, and are bounded to 12 entries.

Continue Watching hooks the card lambda (`ba.e2`/`ba.f2`) and reads its `x` WatchProgress
or `y.a` NextUpInfo. Use the exact native video ID and season/episode; skip unaired
NextUp entries. Detail preloading observes `ka.l9.u()`/`ka.n9.u()`, the final UI StateFlow
including shuffle selection, and reads `b` Meta and `h` NextToWatch. Its observer stops
at `onCleared`. Use native `ka.d1.C`/`ka.e1.C` to resolve the hero Play video from Meta,
NextToWatch, and the current season's episodes, including resume and default-video
fallbacks. Movie IDs without a hero video come from Meta. Repeated composition and
state emissions deduplicate requests; queued detail targets are replaced when Play changes.

The shared queue has two background consumers, at most eight queued targets, detail
priority, 15-second queue freshness, a 45-second consumer timeout, and bounded
60-second success / 15-second failure cooldowns. Recheck preferences, active profile,
and native playback pause state before starting a search. Native session producers
retain their own lifecycle when a preload consumer stops. Run
`:patches:verifyNuvioStreamPreload` and `:patches:verifyNuvioStreamPreloadRuntime` for
target selection, bounded work, profile isolation, lazy repository resolution,
off-UI-thread searches, playback reuse, and detail observer disposal; keep beta2/4/5
DEX checks passing. Device verification must check both settings independently,
movie/resume/next-up/shuffle targets, source changes, and actual cached playback.
Use `SantodanStreams` for diagnostics.
Debug messages report runtime registration, setting changes, each accepted search's
start and terminal status, elapsed milliseconds, addon-group count, and stream-source
count. Recomposition duplicates and cooldown hits stay silent. Custom video IDs are
redacted; stream URLs and credentials are never included in these debug messages.
The native cache does not expose cache-hit provenance, so elapsed time alone must
not be labelled as proof of a cache hit. Timeouts stop the preload consumer; native
search-session producers retain their own lifecycle.

Merged watched badges must follow the same per-show provider winner as progress.
Prime each provider's Next Up flow before reading progress, then read Next Up again after watched-history and alias loading completes. Simkl may refresh its projection during the later getters; publishing the initial seed list can discard cached cards using a stale snapshot. `Provider snapshot` logs initial/refreshed seed counts; focused `Show seed` / `Show merge selection` logs diagnose the reported Rage of Bahamut / Virgin Soul entry without dumping the full library. Playback deferral checks also guard the final seed read.
On beta4/beta5, the optional **Show merged progress provider** setting uses the persisted merge origins to draw a 24dp local provider icon at the bottom-right of Continue Watching posters. Read the card's `x` WatchProgress, or the concrete `y.a` NextUpInfo, by content type and ID; never match titles or infer provenance from the carrier provider. Unknown origins stay unbadged. The icon uses a separate Compose group, native Box alignment, and the existing Coil loader with bundled raw SVGs or the Nuvio launcher artwork. This adds no tracking-provider or artwork network calls. Run `:patches:verifyNuvioProviderBadge` and beta4/beta5 DEX checks, including coexistence with remaining-episode badges.
The proxy's `g(Continuation)` supplies the coherent bulk watched episode map;
`d()` supplies watched items. Alternate catalog IDs come from `v(Continuation)`
on beta2 or `w(Continuation)` on beta4. These must not fall through to the carrier
provider, which omits shows watched only on other connected providers. Resolve
local watched items from repository `e` / store `h`, and retain one provider's
episode numbering per show. Bulk requests immediately return cached watched
projection instead of publishing a partial carrier map. Interface default accessors
(such as Trakt's empty `d()`) need inherited-method reflection fallback.
Run `:patches:verifyNuvioWatchedHistory` for source selection and alternate-ID checks.
Cache `snapshot_v2_<profileId>` contains progress, seeds, origins, watched items, episode maps, and aliases. Restore it off the UI thread. Every merged getter emits immediately, including on first launch without a cache. Background refresh runs every two minutes and checks for profile changes every second; discard results when the active profile changes. Reflection members are cached, seeds are indexed by show, and badge publication uses one reusable worker.
On beta4/beta5, observe the native stream repository's Boolean playback pause setter (`v9.i4` / `v9.h4`, writing `k`). Defer merged refreshes, badge retries, and incremental badge publications while native source searches are paused for playback. Recheck between provider reads and before posting a snapshot; a playback revision prevents an older read from publishing after a playback transition. Resume deferred badges and refresh after leaving playback. Already-running native requests are allowed to finish; beta2 retains its existing behavior.
`SantodanMergedProgress` logs provider-read and total merge times, per-provider totals, and published
badge totals. Capture live logs before reproducing, rather than using only `logcat -d`.

Beta4 badge metadata runs in `la.e5`. Its unchanged-ID gate (`la.z3.V0`) can skip
unresolved metadata after a cancelled batch; bypass it on history changes and at most once every two minutes for retries.
`la.t5.i` resolves metadata groups. Hook the loop after `hasNext`'s result to publish
changed cached metadata through native `la.t5.g` after each group, debounced off the
UI thread. The live Home receiver is the same register used for `la.z3.T0`, not the
original constructor argument. This avoids waiting for thousands of titles before
library/collection labels update. `Badge validation progress` reports changed IDs, cached metadata, and label totals at most every 30 seconds.
Once per changed watched-history snapshot, before the key comparison, discard in-memory validation deadlines for IDs lacking
episode metadata; a persisted "fresh" deadline alone cannot validate the new merged
history. Preserve deadlines for cached metadata and keep existing labels until native
validation decides their state. `Badge validation pending` reports missing metadata.
Keep `__ambiguous__` sibling markers as markers; never create a title ID or cross-show
alias group from them. The real beta4 DEX check verifies both badge-loader anchors.

Beta4's remaining-episode hook reads `la.z3.T0`, the aired-episode map. `W0` is the
provider-alias map and must never be used to count episodes: it produced six aliases
per title and overwrote correct counts with `6` after synchronization.

Remaining counts also follow native `publishBadgeUpdate`: watched-count coverage
(`watched.size >= aired.size`) means zero aired episodes remain, even if provider and
addon episode keys differ. Otherwise count exact unmatched aired keys, preserving
watch-history gaps. Do not subtract raw totals for partially watched shows. Unaired
episodes remain excluded. Cached counts use `count_v3_` to discard earlier incorrect
values. Run `:patches:verifyNuvioRemainingCounts` for the Bleach regression (414 aired,
418 watched, 41 exact matches), partial progress, gaps, specials, and empty sets.

The progress and remaining-episode patches may be enabled independently. The
side-by-side patch affects installation identity only. Rebuild from the original APK,
and keep the package name and signing key unchanged when updating an existing clone.

Both versions have explicit bytecode layouts. Beta4 uses a new NextUpInfo constructor
with MDBList ratings, new Compose settings controls, and inlined Continue Watching
cutoff calls. The runtime bridges select the corresponding provider interface and
Compose classes. Unknown versions and changed hook anchors fail closed.

Provider flow return types are erased to `Flow` in DEX. Beta2's `q()` carries
progress lists, but beta4's `q()` carries the Boolean remote-loaded flag and `r()`
carries progress lists. `NuvioProviderLayout` is shared by the runtime and regression
checks; using the Boolean flow for progress caused an `ArrayList`/`Boolean` crash.
Provider origins use stable enum identities rather than obfuscated class names.

Run `:patches:verifyNuvioBeta2`, `:patches:verifyNuvioBeta4`, and `:patches:verifyNuvioBeta5` with original DEX files
under the workspace's `.inspect-nuvio-beta2`, `.inspect-nuvio-beta4`, and `.inspect-nuvio-beta5` directories.
These checks exercise every bytecode hook, validate runtime reflection contracts,
and write/reload the modified classes. Apply all seven patches to the original beta4
APK and run SDK DEX verification before distributing a build. Device testing must
check provider refresh, both merged selection modes, and the optional episode badge.

The original beta4 APK triggers 36 cross-DEX missing-class reports for optional
third-party dependencies. The patched APK has the same reports and no new ones;
all six final DEX files pass dexdump/D8 checks. Compare hierarchy reports against
the original APK rather than treating its existing reports as patch regressions.

Beta5 retains the provider interface, repositories, flow accessors, model fields,
and settings coordinator contracts. Its Home classes, card renderers, Layout section
lambda, and toggle renderer have different obfuscated names. `NuvioLayout` selects
an explicit per-thread mapping during each patch execution; runtime extensions select
reflection names using the installed APK version. The Watch Progress summary helper
is `sa.p3.h1` on beta5 (`sa.o3.g1` on beta4). Keep all three original-DEX checks passing.

## Reddit 2026.37.0

Three patches target package `com.reddit.frontpage`:

1. **Reddit - Content filters (Experimental)** adds keyword and per-community flair
   filtering under **Morphe > Filters**. It installs the home-flair support patch as a
   dependency because reliable flair filtering requires native flair data in the feed.
2. **Reddit - Show flairs in home feed (Experimental)** restores native post-flair
   badges below titles, including cached and joined-community posts. Its display option
   is under **Morphe > Layout** and the patch can be enabled independently.
3. **Reddit - Start as guest** invokes Reddit's native logged-out browsing action in
   place of the forced startup login screen. Login remains available from the account
   menu. This behavior is also available upstream through Morphe Patches PR #3109.

The Reddit matchers are deliberately version-bound and fail closed when the expected
bytecode layout is missing or ambiguous. `verifyRedditContentFilter` and
`verifyRedditGuestMode` run focused checks against locally extracted original DEX files;
those proprietary inputs are not stored in this repository.

## Peafowl Theme Maker GMS_27.5.1

**Peafowl - Unlock Theme Ownership (Experimental)** targets package
`h7.hamzio.emuithemeotg`. It routes theme initialization through Peafowl's existing
local free-theme path, bypassing the RevenueCat ownership preflight without fabricating
a purchase or modifying a server account. Server-protected downloads are not guaranteed.

## Apply and test

1. Disable/remove the old `0.1.0` source, then import the generated `.mpp`
   under `patches/build/libs` as a local patch bundle in Morphe Desktop.
2. Select the original Peafowl `GMS_27.5.1` APK and enable the patch above.
3. If you also want the general Pro features, enable Nai64's **Unlock Premium**.
4. Build and sign the APK with Morphe, then install it using your usual process.
5. Open a theme that previously showed `RE_ISOWNED`. Check the normal theme action,
   theme download/export/apply, and repeat after restarting the app.

Pairip Bypass and Free In-app Purchases are not dependencies. Start from the
original APK for each build; this patch deliberately rejects an already modified
theme initialization. Preserve your current Morphe signing key if you want to update an
installation signed with that key.

Morphe should report `Applied: Peafowl - Unlock Theme Ownership (Experimental)`.
The new build logs `SantoDan 0.1.1: routed theme initialization through the existing free-theme path`.
An unsupported layout raises an error instead of silently succeeding.

## Build

The repository now follows the official Morphe Gradle template. Local dependency
resolution requires GitHub credentials with access to Morphe's package registry.

From this folder in PowerShell:

```powershell
.\build-local.ps1 :patches:buildAndroid
.\build-local.ps1 :patches:generatePatchesList
```

The Android-compatible MPP is written to `patches/build/libs`. Use Java 21, matching
the release workflow. `build-local.ps1` loads credentials from the ignored `.env` file;
the Gradle wrapper can be used directly when equivalent credentials are already in the
environment. `patches-list.json` is generated from the compiled bundle.

## Peafowl scope and implementation

Version 0.1.0 modified the successful customer-info callback. Device testing exposed
`RE_ISOWNED`: the preceding theme-offerings request can fail before that callback
ever executes. Version 0.1.1 replaces that strategy.

The matcher now finds the theme initializer's `sku.equals("free")` decision, its
paid-theme boolean, the RevenueCat offerings branch, and the alternative
`Handler.post(Runnable)` free-theme setup. It requires exactly one matching layout
in `ThemePreviewActivity`; the obfuscated method name is not hard-coded.

One `move-result` becomes a same-width `const/4 <original-register>, 1`. The existing
code clears the paid-theme flag and takes the free-theme branch. This preserves
the original SKU, theme data, and asynchronous UI setup while skipping the theme
offerings/customer-info preflight entirely. It does not merely hide its error.
Register counts, branch offsets, exception-handler layout, and other classes are
preserved. There are no resource edits or app extensions.

This changes local theme access. It does not create a Google Play purchase,
change RevenueCat account records, or supply server-protected theme downloads.
Other network operations remain. Device testing is required to establish whether
the complete download/apply flow works.

## Peafowl verification

The verification programs under `patches/src/test/java` check a real input DEX for a unique match, reject
unrelated/ambiguous/changed/already-patched input, verifies one equal-width
replacement, and writes/reloads a patched DEX. The regression check interprets the
actual classification instructions for both paid and free SKUs: both must skip
the offerings request and retain the native asynchronous theme setup. It also
loads the resulting bundle with Morphe's `list-patches` command.

Version 0.1.1 was additionally applied alone to the original APK using Morphe's
default `STRIP_FAST` mode. Patching and rebuilding passed. That unsigned build is
an inspection artifact under `build/verification-0.1.1`, not an installable release.

Only the production source set is packaged. Test code, original APKs and bundles, the
Morphe JAR, extracted DEX files, and build dependencies are not redistributed.

## Release and versioning

Do not manually bump `version` in `gradle.properties` for a normal release. Commits use
Conventional Commit prefixes such as `feat:` and `fix:`. After a non-skipped commit is
pushed, `.github/workflows/release.yml` runs semantic-release, determines the next
version from commit history, updates release-owned metadata, builds the `.mpp`, creates
the GitHub release and tag, and publishes provenance. Commits containing `[skip ci]`
do not start that workflow.

Pushing `dev` also runs `.github/workflows/open_pull_request.yml`, which opens or reuses
a pull request into `main`. A direct push to another branch runs the release workflow,
but the repository's branch and semantic-release configuration determine whether that
branch publishes a stable or prerelease version.

Remaining Episodes performance: constructor registration retains seed/title data only.
`prepareBadge` marks recently composed Continue Watching cards; the native bulk-update
hook retains episode maps and queues counting only for those cards. Never enumerate
all watched-history IDs or persist unchanged counts. Keep counting off composition,
coalesce updates, skip disabled work, and limit fallback metadata to one worker with
60-second retry backoff (10 minutes after success). Validate with
`patches/src/test/python/verify_nuvio_remaining_work.py <org.json-jar>` using JAVA_HOME;
it compiles the production bridge against host fixtures with 1,000 unrelated titles.

Merged badge performance: `NuvioBadgeDelta` compares only entries in the bounded
native metadata cache and sends changed entries to native badge publication, which
preserves existing labels. Remaining Episodes resolves `completeWatchedHistory`
to retain the full watched map when that publication invokes its bulk-update hook.
Keep native unchanged-key skipping, retry incomplete validation no more than once
per two minutes, and throttle incremental progress logs to 30 seconds. Run
`:patches:verifyNuvioBadgeDelta` for changed metadata, unchanged state, watch updates,
and cache-eviction regression coverage.

All injected badge renderers must open their own replace group with composer `d0`
and close it with `p(false)` (beta2 `g1.k0`, beta4/beta5 `g1.m0`). Native text has a
restart group but the badge's placement can still collide with the host's remembered
slots without this wrapper. Use stable distinct keys for the three extensions and
close groups on early returns. `q()` ends defaults; do not use it for this wrapper.
Run `:patches:verifyNuvioBadgeComposition` for all three production wrappers, alongside
the beta2/beta4/beta5 DEX checks for the start/end contracts.

**NuvioTV - Upcoming movie dates in library and collections** is independent of the
series finale patch and supports beta4/beta5. Two disabled-by-default switches appear
under UI. It reuses the verified poster/scope hooks with a distinct extension and
Compose group key, and skips series and released movies. Exact preview `released`
then `releaseInfo` values take precedence; year-only data never invents a date.
Missing dates can use the movie catalog for IMDb IDs, with one background worker,
a bounded queue, request timeouts, and a six-hour persistent cache. Other IDs can
show their exact preview dates without a catalog lookup. Date-only releases use UTC
midnight, zoned releases use their exact instant, and timestamp badges use the local
date, matching Nuvio's native release rules. `verifyNuvioMovieReleaseDates` checks
these rules; beta4/beta5 DEX checks exercise both movie and series hooks together.
Use `SantodanMovieRelease:V` for diagnostics. Release dates describe metadata releases,
not a guarantee that a streaming source exists.

Movie-date lookup optimization: a plain past release year skips catalog requests;
current/future years and ambiguous year ranges still require exact dates. Exact
preview dates retain precedence. Setting-change diagnostics include the scope,
while normal settings rendering stays silent. Runtime checks cover these rules.
