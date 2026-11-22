# Picker polish and notification history

## Where to Watch

- Update `extensions/extension/src/main/java/app/template/extension/watch/WatchServicePicker.java`,
  `WatchScreen.java`, `WatchHooks.java`, and `WatchViews.java`. Keep the
  selection border on checked tiles, sort selected services ahead of others
  with alphabetical order in each group, and use the host snackbar.
- Depends on the current service grid and stock 3.6.7 snackbar. Verify with
  `./gradlew buildAndroid` and the existing picker/reminder smoke flow on device.

## Alert history on Profile

- Add `AlertHistory.java`, `AlertHistoryEntry.java`, and `AlertHistoryUi.java`
  in `extensions/extension/src/main/java/app/template/extension/alerts`.
  Store delivered entries by stable alert ID and show the latest first.
  Count unread entries beside the More action, mark visible entries read
  when history opens, and confirm clearing delivered entries.
- Add `patches/src/main/kotlin/app/template/patches/letterboxd/AlertHistoryPatch.kt`
  using the stock Me toolbar fingerprint. Make it a shared dependency of
  `WhereToWatchPatch.kt` and `ReleaseAlertsPatch.kt`. Record successful delivery
  in `watch/WatchAlerts.java` and `alerts/ReleaseAlertReceiver.java`.
- Depends on the existing alert publishers and profile toolbar. Run
  `AlertHistoryEntryTest.java` with `java -ea` and verify the toolbar and
  history on the signed build.

## Verification

- Run `./gradlew buildAndroid`, verify each patch succeeds against stock
  3.6.7, install via `adb install -r` and exercise the corrected picker,
  the reminder feedback, and the profile bell.
