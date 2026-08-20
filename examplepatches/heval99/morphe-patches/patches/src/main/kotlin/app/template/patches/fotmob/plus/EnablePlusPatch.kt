package app.template.patches.fotmob.plus

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.fotmob.misc.extension.sharedExtensionPatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.util.returnBoxedBooleanEarly
import app.morphe.util.returnEarly

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable FotMob+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(sharedExtensionPatch)

    execute {
        // Force subscription check to return true
        HasActiveEntitlementFingerprint.methodOrNull?.returnBoxedBooleanEarly(value = true, force = true)

        // Disable staff account bypass (forces normal path)
        IsStaffAccountFingerprint.methodOrNull?.returnBoxedBooleanEarly(value = false, force = true)
    }
}
