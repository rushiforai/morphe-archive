package app.fluffy.patches.scene.privacy

import app.fluffy.patches.scene.DeviceIdCollectorFingerprint
import app.fluffy.patches.scene.fragmentedStringSmali
import app.fluffy.patches.scene.generateRandomString
import app.fluffy.patches.shared.Constants.COMPATIBILITY_SCENE
import app.fluffy.patches.waypoint.clearBody
import app.fluffy.patches.waypoint.ensureRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val randomDeviceIdPatch = bytecodePatch(
    name = "Random device ID",
    description = "Replaces the device SN (serial_id/serial_no/cpu_id/gid read by the " +
        "root scene-daemon) with a random one everywhere the app itself uses it: the user " +
        "page display and the SN-keyed cloud sync / API calls to omarea. The SN is baked " +
        "per patch run. The daemon's own server report during real code activation is " +
        "native and not affected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SCENE)

    execute {
        // 16 lowercase hex chars: same shape as the cpu_id/serial values the
        // daemon reports, so the spoofed SN does not stand out by format.
        val spoofedSn = generateRandomString(16, ('0'..'9') + ('a'..'f'))

        DeviceIdCollectorFingerprint.method.apply {
            clearBody()
            ensureRegisters(4)
            addInstructions(0, fragmentedStringSmali(spoofedSn, "v0", "v1") + "\nreturn-object v0")
        }
    }
}
