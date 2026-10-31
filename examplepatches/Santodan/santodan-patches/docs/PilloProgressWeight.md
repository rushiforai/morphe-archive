# Weight in Progress

**Pillo 0.6.27 (code 472) is supported.** See [the 0.6.27 port notes](Pillo627.md)
for current contracts, verification, and version-specific backup restrictions.
Existing 0.6.20 support is retained; contracts below describe that historical implementation.

Target: **Pillo 0.6.20** (`xyz.rtrvr.pillo`, version code 447).
Select **Pillo - Weight in Progress**. It includes **Pillo - Weight change
summaries** as a dependency; the existing Weight screen remains available.

The Progress list keeps its calendar and existing cards, then appends the native
Weight chart and date-grouped weight records to the same scrolling list. There
is no nested scrolling list. The chart retains All, Total, Last since, Last 30
days, Last 15 days and Change from the summary patch, native unit handling,
premium visibility and profile selection. Tap a record to open Pillo's native
editor. The initial profile is Pillo's first available profile; use the native
chart profile selector to choose another. The calendar's date does not filter
weight history.

## Original evidence and hook

- Original: `../OriginalApps/Pillo__0.6.20_APKPure.xapk`; its manifest metadata
  identifies package/version/code above. The extracted base
  `../.inspect-pillo-620/xyz.rtrvr.pillo.apk` is byte-identical to the archive
  member: SHA-256 `8bd9c668c63fa0106005b6ef4d891c8e64509d4284e5e9e58941b5e9fbace0a3`.
- Across all 17 original DEX files, the typed instance method
  `ProgressScreenKt$ProgressScreen$6.invoke(PaddingValues,Composer,int):void`
  has one static-range `LazyDslKt.LazyColumn` call (instruction 56), passing
  v0–v12. Replace only its method reference with the extension's erased-object
  signature, preserving all register types, arguments, instruction width,
  branches and existing instructions. The return is void, without move-result.
- The extension delegates to that same native LazyColumn and original body
  builder before appending native weight items. Unselected, the patch makes no
  Progress mutation and runs no additional observer.
- `ViewTrackerReadingListViewModel.initialize(ComponentActivity,String,
  TrackerMetricType):Job` creates native profile/metric collectors and a
  STARTED `repeatOnLifecycle` observer. Empty initial profile ID follows the
  proven native first-profile fallback. A Compose DisposableEffect cancels
  the initialization Job on disposal; the keyed native Hilt ViewModel belongs
  to the local ViewModelStoreOwner, with no global profile/history cache.
- `ViewTrackerReadingListState(TrackerMetricType,List,TrackerType)` receives
  the VM's snapshot-observable `getReadingEntryGroups()` and loggable type.
- Observe the reading VM's native `access$get_selectedUserProfile$p` StateFlow
  through `FlowExtKt.collectAsStateWithLifecycle(StateFlow,LifecycleOwner,
  Lifecycle.State,CoroutineContext,Composer,int,int):State`. Supply the actual
  activity owner, default mask 6; passing null would make reflective overload
  selection ambiguous with the Lifecycle overload. Pass the resolved
  `UserProfile.getUserProfileId():String` to the chart and defer it while pending.
  **Never pass the empty-string list fallback sentinel to the chart**:
  `WeightChartViewModel$initialize$1$1$3.invokeSuspend` uses
  `listOfNotNull(selectedId ?: defaultId)`, not a first-profile fallback. The
  initial implementation did this, producing the user-reported empty graph and
  summary labels despite populated records.
- `ViewTrakcerReadingListScreenKt.access$TrackerChartContent(Modifier,String,
  TrackerMetricType,ViewTrackerReadingListViewModel,Composer,int,int):void`
  is the same chart/profile renderer used by the native reading page (default
  modifier bit 1). The summary dependency modifies its shared weight renderer.
- The native static private
  `ViewTrakcerReadingListScreenKt$ViewTrackerReadingListContent$2.
  invoke$lambda$6$lambda$4$lambda$3(ViewTrackerReadingListState,MutableIntState,
  Function2,Function1,LazyListScope):Unit` appends the native chart, empty-state,
  dated record groups and spacers. It has no enclosing Activity requirement.
  Its record-click callback receives a boxed event ID, which is forwarded to
  `EditLoggedTrackerEventActivity$Companion.startActivity(Context,long):void`.
- The patch validates native method signatures and the static WEIGHT metric
  before mutation; it rejects missing/ambiguous or already-redirected hooks.
- The summary patch exposes one shared patch instance, so selecting it explicitly
  and through this dependency cannot run the same mutation twice.

## Verification

Run `:patches:verifyPilloProgressWeightBundle` for deferred observer startup,
idempotent cancellation/reopen/failure host checks, original native contracts,
pending/resolved/invalid chart profile ID regressions,
missing/ambiguous/already-patched hook rejection, standalone dependency application and
combination with the four existing Pillo patches. Reload assembled DEX and
check extension signature resolution and the single-call Progress mutation.
Include untouched original DEX in the assembled definition set: STRIP_FAST
returns only changed/new files, not a complete replacement for every APK DEX.
Run `:patches:verifyPilloWeightSummaryBundle` for existing summary regressions.

Local verification on 2026-10-30 passed `:patches:verifyPilloProgressWeightBundle`,
`:patches:verifyPilloWeightSummaryBundle`, `:patches:generatePatchesList`,
`:patches:verifyMorpheDesktopImport` (Desktop 1.19.1), and
`:patches:verifyAndroidBundle`, using `build-local.ps1` with Java 21.
Bundle: `patches/build/libs/patches-0.15.0.mpp`. The fixed patch was applied to the
original and its complete assembled DEX set reloaded in both combinations.
Desktop 1.19.1 rebuilt the original XAPK with all five Pillo patches, retaining
its split resources/native libraries and signing with the existing Morphe key.
The signature verified and matched the installed app; `adb -s emulator-5554
install -r` preserved app data. The manifest is byte-identical to the prior
installed APK, with no identity/provider changes.

Device-tested output: `../Apps/Pillo/Pillo-0.6.20-progress-profile-fix.apk`.
Installed and delivered APK SHA-256 both equal
`6a75dbe8acabbe71bab18285da6d8452e3bb35f28b2814e3b989f1e05d7aff68`.
On `emulator-5554`, the graph plots records and summaries show Latest 238.1 lbs,
Total -99.2 lbs, Min 231.5 lbs, Max 337.3 lbs and Change +6.6 lbs. Tab re-entry
and a force-stop/cold restart retain populated values. Last since is correctly
unset until a date is selected; windows with insufficient records retain dashes.
Screenshot evidence stays outside the repository at
`../.inspect-pillo-620/progress-profile-fix.png`, alongside re-entry/restart XML.

Remaining device checks: additional profiles, empty/large histories, chart
filters/comparison-date changes, editing/deleting records, rotation and a
physical phone. Do not generalize the emulator result to these untested cases.
