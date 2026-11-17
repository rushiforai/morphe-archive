package app.template.patches.samsungkeyboard.controls

import app.morphe.patcher.Fingerprint

/*
 * The settings fragment, the keyboard layout and the service are kept by the app's XML and manifest, so these match by
 * class, name and descriptor (checked unique with FingerprintProbe on 5.9.40.75), never by R8 names.
 */

private const val SETTINGS_FRAGMENT = "Lcom/samsung/android/honeyboard/settings/common/HoneyBoardSettingsFragment;"

/** The settings fragment's options menu builder: where the "Patch settings" item is added. */
internal object SettingsOptionsMenuFingerprint : Fingerprint(
    definingClass = SETTINGS_FRAGMENT,
    name = "onCreateOptionsMenu",
    returnType = "V",
    parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
)

/** The settings fragment's options menu click handler: where the "Patch settings" item is handled. */
internal object SettingsOptionsItemFingerprint : Fingerprint(
    definingClass = SETTINGS_FRAGMENT,
    name = "onOptionsItemSelected",
    returnType = "Z",
    parameters = listOf("Landroid/view/MenuItem;"),
)

/** The keyboard layout's touch interception: where a swipe down from the strip is recognised. */
internal object KeyboardLayoutInterceptFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/honeyboard/keyboard/view/HoneyBoardLayout;",
    name = "onInterceptTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

/** The keyboard service's onCreate: where the running service is remembered. */
internal object KeyboardServiceCreateFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/honeyboard/service/HoneyBoardService;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
