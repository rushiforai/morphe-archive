# Streaming picker and alerts

## Service picker

- Update `WatchServicePicker.java` and add `WatchPickerPanel.java` in
  `extensions/extension/src/main/java/app/template/extension/watch`. Reference
  `settings/ArtworkUi.java`, `SurfaceColors`, `AccentPresets`, and stock text
  appearances. Use a recycled logo grid and searchable catalog. Use a neutral
  outline and checkmark for selection and keep the same text color in both
  states. Select all/Clear all apply to the entire displayed region. Leave
  12 dp above the footer and 8 dp between its buttons. Apply
  saves edits and Close/Back discard them. The country selector uses the same
  dialog surface and search treatment.
- Depends on the existing country catalogs, masked logo loader and preferences.
  Run `./gradlew buildAndroid` and exercise the grid, search, region picker,
  bulk selection and cancel on the installed APK.

## Streaming reminders

- Add `WatchAlerts.java`, `WatchAlertJob.java`, and `WatchAlertRules.java` in
  the watch package. Update `WatchScreen.java`, `WatchHooks.java`,
  `WatchViews.java`, `JustWatch.java`, and
  `patches/src/main/kotlin/app/template/patches/letterboxd/WhereToWatchPatch.kt`.
  Remind me arms one notification for a newly observed subscription or free
  offer on a selected service. Existing offers are the baseline. A persisted,
  network-bound Android job uses the existing JustWatch offer lookup.
  Keep registration independent of the release-date patch and follow its
  notification permission and film-link behavior.
- Depends on the existing offer reader and Android JobScheduler. Compile and
  execute `WatchAlertRulesTest.java` with `java -ea` to cover existing offers,
  new offers, excluded providers and a missing or failed baseline.

## Device verification

- Run `./gradlew buildAndroid`, use the known patch selection against stock
  3.6.7, verify the Morphe report, and install with `adb install -r`. Verify
  the picker on the active appearance, reminder persistence and removal,
  and force the registered job using `adb shell cmd jobscheduler run -f`.
