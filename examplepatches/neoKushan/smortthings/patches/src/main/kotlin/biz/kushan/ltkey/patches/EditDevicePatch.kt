package biz.kushan.ltkey.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import biz.kushan.ltkey.patches.shared.Constants.COMPATIBILITY_SMARTTHINGS

private const val EXTENSION_CLASS = "Lbiz/kushan/ltkey/DtEntry;"

/**
 * Adds a "LocalThings Owner PSK" section to the device Edit screen. When OneConnect has paired a
 * device whose OwnerPSK is in its local store, the section shows the Owner PSK + Identity (each
 * tap-to-copy) for use in Home Assistant LocalThings. Extraction reuses the app's own
 * CryptoManager; nothing is sent anywhere. Shows nothing unless a validated key is present.
 *
 * Proof of concept — developed/tested against OneConnect 1.8.52.23 and a single HW-Q950A soundbar;
 * anchors re-confirmed unchanged on 1.8.54.23.
 */
@Suppress("unused")
val editDevicePatch = patch(
    name = "LocalThings Owner PSK in device settings",
    description = "Shows a device's OwnerPSK (for Home Assistant LocalThings) on its Edit screen, " +
        "extracted locally via the app's own key store. Tested on HW-Q950A / SmartThings 1.8.54.23, 1.8.52.23.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTTHINGS)

    extendWith("extensions/extension.mpe")

    execute {
        // At the top of EditDeviceActivity.onCreate, hand the Activity (p0) to our extension.
        // DtEntry defers its work to the main looper, so the view tree is ready by the time it runs.
        EditDeviceOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onEditDevice(Landroid/app/Activity;)V",
        )
    }
}
