# SoundCloud car Home and Up next

Date: 2026-11-05. The user confirmed that Home, regular cover tiles and Up next work on the signed-in phone, then approved stable publication.

## Exact input

Publisher APKM: `com.soundcloud.android_2026.10.28-release-379050_4arch_5fa7dc6cd3bd73e9e685182ccf634346_apkmirror.com (1).apkm`, build 379050. Its original base APK SHA-256 is `d93de52b6478805718a9d0f785a3c71eef6cce5bec867bfc872c57a3f2f55fb9`. All four supplied ABIs are preserved.

The confirmed normal phone test APK SHA-256 is `55e2bb2fa87d4a59d088d6051ea5312a64694a774886f7e7f15b6d99f6b64867`. It was signed through Morphe's signer with the user's existing APK key and upgraded in place. Its installed bytes were checked after removing diagnostic instrumentation. APK signing is separate from the MPP release signing identity.

## Home source and presentation

The earlier patch called `sections/data/DefaultSectionsService.b`, the `/home/query` request named `libraryImageBannerPageSectionsRequest` with layout `home-library`. The visible phone Home instead uses `sdui/ui/SDUIHomeViewModel`, `sdui/domain/SDUIRepository` and `sdui/data/DefaultSDUIService`, with GraphQL `HOME_SDUI_QUERY` and `ApiSDUIResponse`.

The repair captures the SDUI Dagger provider, invokes its existing account-aware Home request, unwraps GraphQL success and maps real entities through SoundCloud's media-item builder. Constructor JsonProperty annotations and actual field assignments bind renamed SDUI fields at patch time. Navigation links and cached refs without metadata are not invented as songs.

Music Home follows the supplied Media developer guide: one ungrouped cover grid, single-item style 2, with playable child style 1 for track lists inside collections. Group-title hints are removed; news-style shelves are not used. Home entries are deduplicated by URN while retaining first appearance order.

## Queue producer and selection

MediaService's existing PlayQueueUpdates observable supplies the actual ordered entries and cursor. QueueExport publishes a bounded current-plus-upcoming window with unique stable IDs per occurrence, matching activeQueueItemId, titles/creators/artwork from MetadataOperations, generation checks for stale metadata, and subscription/worker disposal at teardown. Duplicate track URNs are not used as queue IDs.

Eligibility uses the app's existing blocked/offline predicate. Selection maps the exported occurrence to its current internal position and retains the phone selection path's ad handling, cursor transition and save operation. The state hook runs immediately after the real session setter, using that setter's receiver: R8 reuses p0 before the method returns.

A failed phone test exposed a second bytecode contract: ConnectionHelper and PlayerAdsController are interfaces. Invoking them with invoke-virtual stopped queue restoration before metadata requests. Bindings now choose invoke-interface or invoke-virtual from the actual defining type. Inspection of the emitted APK verified the corrected calls and all eleven app-method dispatches in the Home/queue bridges.

## Evidence and limits

- Existing Android aggregate build/tests passed; the exact original APKM rebuilt with the exact four-patch set and no failed patches. Independent additional-patch evidence remains valid.
- Python, Medium and bilingual documentation checks passed. The initial complete verification failed in the old macOS lsof workspace-proof path; current main subsequently supplied its maintained libproc cleanup repair. Release verification uses that current baseline.
- The first covered producer trace stopped at the bad interface invocation. The corrected trace reached MetadataOperations requests against a 21-item private queue, then Android terminated the diagnostic process for a background onStopJob ANR. This is not a passing traced acceptance result.
- Diagnostic scripts were unloaded/detached where available, task forwards removed, and the normal signed APK restored with byte identity checked. The later confirmation that all requested behavior works is the user's normal-build phone acceptance, not a claim of uninterrupted Frida coverage.

Compact receipts, original/normal APKs and private diagnostic evidence are retained outside Git under `~/.local/state/nl-morphe-patches/soundcloud-home-queue-20261105/`. Raw phone diagnostics and task-local observers are excluded from releases.
