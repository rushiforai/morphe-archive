package biz.kushan.ltkey.patches

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `EditDeviceActivity.onCreate(Bundle)` — our single injection site. The package
 * `com.samsung.android.oneconnect.editdevice.view` is not obfuscated in 1.8.52.23, so the full
 * class matches directly. If a future build renames/moves it, this fingerprint fails cleanly and
 * the patch simply does not apply (no mis-patch).
 */
object EditDeviceOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/oneconnect/editdevice/view/EditDeviceActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * `mm.e.g()` in 1.8.52.23 — the app's "is this a Samsung device" gate
 * (`"samsung".equals(Build.MANUFACTURER) && !MODEL.contains("Nexus")`, cached in a static int).
 * Every sign-in site branches on it: true → the on-device Samsung Account path (which validates the
 * APK signature and so fails for a re-signed app), false → the "Ged" web-OAuth path that works on
 * non-Samsung phones. A sibling class has an identical check, so we pin the exact obfuscated
 * class+name (plus its two string constants) to hit only this one; it fails closed on other builds.
 */
object IsSamsungDeviceFingerprint : Fingerprint(
    definingClass = "Lmm/e;",
    name = "g",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("samsung", "Nexus"),
)

/**
 * `com.osp.app.signin.sasdk.common.Util.isStandAloneSaAppInstalled(Context)` — the bundled Samsung
 * Account SDK's gate for whether to hand sign-in to the on-device Samsung Account app's
 * `WebSdkActivity` (which signature-checks the caller and rejects a re-signed app) or open a browser
 * Custom Tab (which authenticates the user and works for a re-signed app). The SDK keeps its original
 * names, so we pin the full descriptor; it fails closed if a future build ships a different SDK.
 */
object SaSdkStandAloneAppFingerprint : Fingerprint(
    definingClass = "Lcom/osp/app/signin/sasdk/common/Util;",
    name = "isStandAloneSaAppInstalled",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * `com.samsung.android.oneconnect.connectionsupport.util.a.e(Context)` — reads a "high contrast
 * keyboard" accessibility flag by querying Samsung Keyboard's `KeyboardSettingsProvider`, which is
 * guarded by the signature permission `com.samsung.android.honeyboard.permission.KEYBOARD_SETTING`.
 * A re-signed app can't hold it, so the query throws `SecurityException` and crashes the device web
 * plugin on open. It's the only unguarded foreign-provider read on the device-open init path.
 * Pinned by the distinctive string so it hits only this method and fails closed on other builds.
 */
object KeyboardSettingsQueryFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/oneconnect/connectionsupport/util/a;",
    name = "e",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("high_contrast_keyboard"),
)
