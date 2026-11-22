# Streaming preferences and alerts in Mods backup

## Export

- Extend `settings/ConfigTransfer.java` and the watch and release alert stores.
  Add independent Streaming preferences and Alerts sections to the export
  chooser. Alerts contains pending streaming alerts and pending film release
  alerts. Existing formats 1–3 and the artwork-only flow keep their behavior.
- Run `./gradlew buildAndroid` and inspect the exported JSON from Android.
  The on-device codec tests use
  `python3 extensions/extension/src/testHost/device/config_transfer.py`
  with the Java and Android SDK paths configured.

## Restore

- Validate all included objects before applying settings. Restore the exact
  service selection if the backup contains it. Merge pending alerts by their
  identifiers, retain existing alerts, skip past release dates and reconcile
  the Android scheduler on devices carrying the corresponding patch.
- Update `settings/ModSettingsActivity.java` import feedback. Restore from an
  older backup and from a populated export, verifying no duplicate alerts.
- Compile `watch/WatchPreferences.java` and `alerts/AlertBackup.java` in the
  test runner. The Activity uses `watch/WatchHooks.java` and
  `alerts/ReleaseAlerts.java` to reconcile schedules after restore.
