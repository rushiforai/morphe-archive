package app.template.patches.lockmeout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.LOCKMEOUT_COMPATIBILITY
import org.w3c.dom.Element

private val makeDebuggablePatch = resourcePatch(
    description = "Sets android:debuggable=\"true\" in AndroidManifest.xml."
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val applicationNode = document
                .getElementsByTagName("application")
                .item(0) as Element

            applicationNode.setAttribute("android:debuggable", "true")
        }
    }
}

@Suppress("unused")
val lockMeOutPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Dynamically injects a return-early bypass into the main license gate and enables debugging.",
    default = true
) {
    compatibleWith(LOCKMEOUT_COMPATIBILITY)
    dependsOn(makeDebuggablePatch)

    execute {
        IsPremiumLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
