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

**Pillo - Hybrid Lock-Screen Notifications** supports both versions. The matcher
locates the light-reminder foreground decision structurally and fails if the alarm
dispatcher is missing, changed, ambiguous, or already patched. It replaces only the
foreground predicate with Pillo's existing lock-aware `PowerManagerUtil` predicate,
preserving instruction widths, registers, branch layout, and both native alarm routes.

The real 0.6.20 DEX is covered by `verifyPilloPatch`, which checks the unique match,
mutation scope, rejection cases, and DEX write/reload. Full release verification must
also patch and rebuild the original app bundle. Users must select Pillo's Banner/Light
notification mode for the hybrid routing to apply.

## NuvioTV 1.1.0-beta.2 and 1.1.0-beta.4

Five patches target package `com.nuvio.tv` (airing-series and finale-date patches support beta4 only):

1. **NuvioTV - Merge tracking progress** combines Nuvio Sync and connected-provider
   progress for Continue Watching. It retains the last successful snapshot while the
   providers refresh during startup, then publishes the refreshed merged result.
2. **NuvioTV - Remaining episodes in Continue Watching** adds an opt-in setting that
   displays the number of aired, unwatched episodes. It works with every supported
   tracking integration and is disabled by default.
3. **NuvioTV - Side-by-side installation** changes the package and launcher name so
   the patched build can coexist with the official app. Both values are configurable;
   use a unique valid Android package name for each clone.

**NuvioTV - Keep airing series in Upcoming** is a separate beta.4-only patch. Its
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
under Layout > Santodan-Patches (beta4). It reuses the Upcoming badge style and latest known
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
preferences and Compose controls. Old beta4 injected settings rows and merged picker
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

Merged watched badges must follow the same per-show provider winner as progress.
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
`SantodanMergedProgress` logs provider-read and total merge times, per-provider totals, and published
badge totals. Capture live logs before reproducing, rather than using only `logcat -d`.

Beta4 badge metadata runs in `la.e5`. Its unchanged-ID gate (`la.z3.V0`) can skip
unresolved metadata after a cancelled batch; bypass that gate while merging is on.
`la.t5.i` resolves metadata groups. Hook the loop after `hasNext`'s result to publish
already-resolved metadata through native `la.t5.g` after each group, debounced off the
UI thread. The live Home receiver is the same register used for `la.z3.T0`, not the
original constructor argument. This avoids waiting for thousands of titles before
library/collection labels update. New log lines are `Retrying badge metadata` and
`Badge validation progress` (cached metadata, watched IDs, and label totals).
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

Run `:patches:verifyNuvioBeta2` and `:patches:verifyNuvioBeta4` with original DEX files
under the workspace's `.inspect-nuvio-beta2` and `.inspect-nuvio-beta4` directories.
These checks exercise every bytecode hook, validate runtime reflection contracts,
and write/reload the modified classes. Apply all five patches to the original beta4
APK and run SDK DEX verification before distributing a build. Device testing must
check provider refresh, both merged selection modes, and the optional episode badge.

The original beta4 APK triggers 36 cross-DEX missing-class reports for optional
third-party dependencies. The patched APK has the same reports and no new ones;
all six final DEX files pass dexdump/D8 checks. Compare hierarchy reports against
the original APK rather than treating its existing reports as patch regressions.

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
