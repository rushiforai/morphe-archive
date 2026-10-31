# Pillo 0.6.27

All six Pillo patches support `xyz.rtrvr.pillo` **0.6.27**, version code **472**:
hybrid notifications, local backup/restore, JSON weight import, weight summaries,
weight in Progress, and premium/ad-free state. Progress includes summaries.
Historical app-version support remains separate.

Original input: `E:/Morphe/OriginalApps/pillo-0.6.27.apks`, exported by the user
from Google Play. Its base manifest confirms the package/version above, and its
nine root DEX files are byte-identical to the initially inspected APKPure build.
Inspection is in `E:/Morphe/.inspect-pillo-627-play/`. Preserve
`split_config.arm64_v8a.apk`, `split_config.en.apk`, and `split_config.xxhdpi.apk`
when repackaging. The original APKPure XAPK supplies only ARMv7 libraries and
cannot install on the ARM64-only emulator configuration. No older patched APK
supplies resources or executable code for this port.

## Premium fingerprint failure

The external **Unlock Premium** patch (`app.template.patches.pillo.premium`)
expects `xyz.rtrvr.pillo.subscription.SubscriptionStateProvider` and return type
`kotlinx.coroutines.Job`. In 0.6.27, the provider moved under
`xyz.rtrvr.pillo.data.subscription` and Job became `jw.q1`, breaking its fingerprint.
Select **Pillo - Premium and ad-free** instead and deselect the external patch.
The replacement validates both private/final instance setters
`setIsPremiumState(Z)Ljw/q1;` and `setIsAdfreeState(Z)Ljw/q1;`, their coroutine
captures, emission and preference writes before mutation. Each original setter
has five registers and eight instructions; p0=v3 and p1=v4. Insert `const/4 v4, 1`
before the constructor at original index 3 captures the boolean. Preserve native
launch/persistence and purchase/authentication handlers. Verification confirms
that only the two setter-entry instructions change within the provider; this
does not prove server-side entitlement or device behavior for individual features.

## Native hook contracts

`Pillo627*` Java contracts and `*627` runtime classes isolate the new R8/Compose
ABI. Exact reflection contracts are in `Pillo627Contracts.java` and
`Pillo627Import.java`; dispatch is restricted to the exact package/version.

- **Notifications:** unique `ui/alarm/process/StartAlarmProcess.invoke(Context,
  String,models/alarm/Alarm,String,Continuation):Object`. The foreground decision
  is at instruction 565; its light-route branch targets 602 and invokes at 607;
  fullscreen invokes at 586. Both use context v3. Replace the predicate with
  `shared/android/PowerManagerUtil.INSTANCE.isTrulyInteractive(Context):Z` and
  invert the branch without changing registers, widths or exception regions.
  Select Pillo's Banner/Light mode.
- **Backup lifecycle:** run before `PilloApp.attachBaseContext` locale reads and
  at the final normal-process return of `onCreate`. Preserve its new crash-report
  early return; restore runs only in the main process. The audit scheduler now
  lives under `domain/audit`. Database/preferences remain `pillo.db` and
  `pillo_preferences`. Current Room identity:
  `0b0400f334f4d39ec5f093b3c677e070`, schema version 53.
- **Backup choices:** Settings uses static
  `SettingsOtherEntriesKt.SettingsOtherEntries$lambda$0$2$2$0(Function0,Context,
  ComponentActivity,Function0):Unit` with parameters v17-v20. Range invocation
  preserves this layout and early return uses `Unit.a`. Onboarding's
  `rememberChooseRestoreDataOption(Function0,Function0,g3.q,int)` returns
  `ui.compose.BottomSheetController`. Capture the original callbacks before p0
  is reused for the result; retain native Medisafe/account restore routes.
- **Weight import:** redirect `LoggingBottomBar` in
  `TrackerRecordLogLayoutWeightKt.LogWeightLayout_Uww_Ezs$lambda$1`. Compose uses
  `g3.q`/`s3.s`; use native `ButtonM-vRFhKjU` and `SpacedColumn-DzVHIIc` defaults.
  The repository moved to `data.repository.tracker.TrackerEventRepository`.
  `shared.coroutine.FlowExtensionsKt.firstOnIO(mw.l,Continuation)` provides
  initial records; singleton fields are `a`, resumed failures use `ResultKt.b`.
  Preserve async completion, units, profiles, duplicates and partial retries.
- **Summaries:** `jv.e.s1(int,List)` reverses the old takeLast argument order.
  Keep full history in the list wrapper. The filter button moved into
  `WeightChartContent$lambda$7$0`. Wrap the static bridge to
  `WeightLineChart_TN_CM5M$lambda$12$0`, capturing its explicit unit/record state
  and restoring prior rendering context in `finally`. Redirect its native
  Latest/Avg renderers. Last since uses the native filter button/date picker.
  Date comparisons use native timestamps' ISO representation and device calendar.
- **Progress:** replace the single 12-register `z0.l.c` call in
  `ProgressScreenKt.ProgressScreen$lambda$5`; append chart and dated entries to
  the same lazy list. Native retained viewModels factory/store/extras suppliers
  and `androidx.lifecycle.j1` resolve the Hilt reading VM in the host store.
  `g3.q0.c` owns disposal and `jw.q1.b(CancellationException)` cancels once.
  Observe selection with `ComparisonsKt.t`; never pass the empty-ID sentinel to
  the chart. Use `ViewTrackerReadingListContent$lambda$4$0$1$0` for native items.

## Restore older local backups into 0.6.27

The initial port rejected all older local archives. The user explicitly requested
restoring their 0.6.20 backup, so the 0.6.27 restore path now accepts version-1
archives tagged **0.6.20** as well as **0.6.27**. Existing older-app APIs and hooks
retain their behavior; this is migration into the latest app, not downgrade support.

Verify the archive's files/checksums first. A 0.6.20 database must have SQLite version
51 and Room identity `acdc24b1947a76c496bdc3ac20b3d60e`. Current backups require
version 53 and the current identity. Reject other versions, damage or inconsistent
metadata. Merely changing a version label or Room identity is unsafe.

`PilloRestoreMigration627` creates an independent Room builder naming only the
staged database and registers native `AppDatabase.Companion.getMIGRATION_51_52()`
and `getMIGRATION_52_53()`. It uses no live singleton, diagnostic callbacks or
destructive fallback. Opening through `RoomDatabase.getOpenHelper()` and
`lb.f.getWritableDatabase()` runs native migration and generated schema validation
transactionally. Migration 51-52 adds Symptom/SymptomLog tables and indexes;
52-53 converts three reminder/intake interval columns from hours to minutes.
Checkpoint/truncate WAL and close before copying a single database file. Recheck
integrity, version and identity before confirmation/live replacement. Failed imports
discard staging, log the error with `PilloLocalBackup627`, and keep current data.
Retain pre-restore backup, journal/rollback, restart and native alarm audit behavior.

The supplied `Apps/Pillo/Pillo-local-20261030-124624.pillo-backup.zip` is intact
and contains schema 51. Native migration and Room validation succeeded on a copy
in the emulator's `/data/local/tmp/pillo-restore-check/` sandbox, using the Play
base DEX and the built extension through `PilloRestoreDeviceCheck`/`app_process`.
No installation or access to live Pillo storage was required. Row-level checks
verified all original application data except the native interval conversions;
Room identity/SQLite device-locale metadata changed, and two native tables were
added. Every other archived file remains byte-identical, and checksums validate.
Wrong-identity input was rejected without writes; an injected native migration
failure rolled back schema/data changes; current schema was accepted without
rerunning the upgrade.

Original archive unchanged. A separate compatible archive is available at
`Apps/Pillo/Pillo-local-20261030-124624-for-0.6.27.pillo-backup.zip`, usable with
the previously installed 0.6.27 patch. The updated bundle accepts the original
0.6.20 archive directly.

## Android storage aliases during restore

The subsequent device log confirmed the updated runtime was loaded but failed at
`PilloRestoreMigration627.prepare` with "Staged backup database is missing or
unsafe." The original guard compared absolute and canonical file paths directly;
this rejected files reached through aliased app-storage parents. Earlier staged
migration tests canonicalized the supplied path and therefore missed this case.

The migration helper now canonicalizes the parent first, requires the database to
remain the expected direct child of that canonical parent, and uses the resulting
canonical file for SQLite/Room. Missing files and leaf symlinks remain rejected.
The device fixture preserves the supplied path rather than canonicalizing it
before invoking production code. Its optional fifth argument extracts the complete
archive using the actual LocalArchive implementation before migration.

The user's original archive passed full extraction/checksums and native 51-53
migration on Android through an explicitly aliased parent directory. A separate
fixture verified rejection of a database-leaf symlink. This exercises staging;
the UI confirmation, capture of current data and live restore/restart remain
separate device checks. The archive does not need conversion for this fix.

## Verification and delivery

From `E:/Morphe/santodan-patches`, Java 21 / Android SDK 36:

```powershell
.\build-local.ps1 :patches:buildAndroid
.\build-local.ps1 :patches:verifyPillo627Bundle :patches:verifyPillo627Runtime :patches:verifyPilloLocalArchive
.\build-local.ps1 :patches:generatePatchesList :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=../../morphe-desktop-1.19.1-all.jar'
```

Bundle verification checks native contracts, missing/ambiguous/modified/already
patched input rejection, each individual selection and all six together. It reloads
all DEX, rejects duplicate classes, resolves injected signatures, and rebuilds an
unsigned base at `patches/build/verification/pillo-627/combined/pillo-0.6.27-base-unsigned.apk`.
Host tests cover archive restrictions/checksums/rollback, observer lifecycle,
profiles, render cleanup, totals, reordered history arguments, async import,
duplicates, partial retry and write rejection. Device migration fixtures use real
Android SQLite and the native Room migrations/validator on staged copies.

Bundle: `patches/build/libs/patches-0.15.0.mpp`; release version unchanged. Android
archive and Desktop 1.19.1 import validate the actual packaged file. The user reports
successful installation on emulator and phone using their Play ARM64 input.
For this restore fix, no new app signing or installation was performed, and the
full restore UI/live swap was not run. Remaining checks include restore/restart,
alarm audit, selected profiles and normal app behavior after restoring on a device.


On 2026-10-30, after rebuilding with the path-guard fix, the user reported that
everything seemed to be working. Keep that user-reported device result distinct
from the isolated emulator migration checks and host/bundle verification above.
