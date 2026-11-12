package lab.ltediscovery.patches.environment

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import lab.ltediscovery.patches.shared.COMPATIBILITY_LTEDISCOVERY

/**
 * Allows production builds to run on virtual Android devices.
 *
 * The app refuses to start its normal UI on emulators: `MainActivity` shows an
 * "Unsupported device" dialog, and several services skip initialization. All
 * of those checks funnel through one `Z()` predicate built from `Build.*`
 * values. Forcing it to `false` makes every caller take the physical-device
 * branch, including on a stock emulator with no property spoofing.
 *
 * Opt-in: `default = false`, matching the other optional LTE Discovery patch.
 * Enable it when patching for an emulator; leave it off for real devices.
 */
@Suppress("unused")
val disableEmulatorCheckPatch = bytecodePatch(
    name = "Disable emulator check",
    description = "Allows LTE Discovery to run on virtual Android devices by forcing the " +
        "single Build.*-based emulator predicate to false. Opt-in; only needed on emulators.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LTEDISCOVERY)

    execute {
        EmulatorCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}
