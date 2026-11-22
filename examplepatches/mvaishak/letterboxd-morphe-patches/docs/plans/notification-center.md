# Notification center polish

## Availability

- Update `watch/WatchViews.java` and `watch/WatchScreen.java` in the
  extension. Resolve the live elevated surface and accent for feedback, use
  the native settings gear at 18 dp in its 24 dp slot and label the alert actions Set alert and Remove
  alert. Depends on the current Availability fragment and appearance.
- Run `./gradlew buildAndroid` and verify the renamed actions, gear and
  feedback on the phone. Add the fourth-provider case to `WatchAlertRulesTest.java`.

## Notification center

- Move `watch/WatchPickerPanel.java` to `ui/ThemedDialogPanel.java`. Reuse
  it in `watch/WatchServicePicker.java` and `alerts/AlertHistoryUi.java`.
  Use a compact history list, standard close icon and themed clear action.
  Cap the whole dialog to the usable window after system bars and cutouts.
  Keep the normal sized popup on taller screens and scroll the list if needed
  on short screens.
- Add `alerts/NativeAlertHistory.java` and extend `AlertHistoryPatch.kt`
  to capture posted notifications from NotificationMessagingService and
  Firebase's DisplayNotification in the stock 3.6.7 APK. Reuse the existing
  local store and badge. Preserve the system notification action while available.
  Disable FCM notification delegation for this app build and clear an existing
  Play Services delegate on startup so posted pushes reach the app's handlers.
- Verify the two patch hooks apply and use an isolated sample to check inbox
  listing, badge and clear. Live server-originated push delivery is a separate check.

## Verification

- Run host tests with `java -ea`, build and patch stock 3.6.7, then install
  the signed candidate with `adb install -r`. Confirm the device routes and
  compare the settings and notification panels under the active theme.
  Verify both dialogs fit in a short split-screen pane, then return the app
  to fullscreen.
