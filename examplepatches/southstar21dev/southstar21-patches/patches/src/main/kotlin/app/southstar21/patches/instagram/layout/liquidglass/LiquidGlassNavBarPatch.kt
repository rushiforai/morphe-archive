package app.southstar21.patches.instagram.layout.liquidglass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

@Suppress("unused")
val liquidGlassNavBarPatch = bytecodePatch(
    name = "Liquid Glass navigation bar",
    description = "Turns the bottom tab bar into a floating iOS 26 style Liquid Glass pill " +
            "with live background blur and edge refraction. " +
            "Refraction needs Android 13+, blur needs Android 12+, older versions get a tinted pill.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(sharedExtensionPatch)

    val blurRadius by intOption(
        key = "blurRadius",
        default = 12,
        values = mapOf(
            "Clear" to 6,
            "Default" to 12,
            "Frosted" to 20,
        ),
        title = "Blur radius",
        description = "Blur applied to content behind the bar, in dp.",
        required = true,
    ) { it!! in 0..40 }

    val refractionStrength by intOption(
        key = "refractionStrength",
        default = 60,
        values = mapOf(
            "Off" to 0,
            "Subtle" to 30,
            "Default" to 60,
            "Strong" to 100,
        ),
        title = "Refraction strength",
        description = "How strongly the glass edge bends the content behind it, from 0 to 100.",
        required = true,
    ) { it!! in 0..100 }

    val extendContent by booleanOption(
        key = "extendContentBehindBar",
        default = true,
        title = "Extend content behind bar",
        description = "Lets feeds scroll underneath the bar so there is something to see through the glass. " +
                "Turn off if the last item of a list ends up hidden.",
        required = true,
    )

    execute {
        BlurRadiusFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $blurRadius
                return v0
            """
        )

        RefractionStrengthFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $refractionStrength
                return v0
            """
        )

        ExtendContentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, ${if (extendContent == true) 1 else 0}
                return v0
            """
        )

        // Reels play through a SurfaceView on some phones, which the glass can't zoom or blur.
        EnforceTextureViewFingerprint.method.apply {
            addInstructions(
                implementation!!.instructions.size - 1,
                """
                    invoke-static { v0 }, $EXTENSION_CLASS->enforceTextureView(Z)Z
                    move-result v0
                """
            )
        }

        markPatchIncluded(EXTENSION_CLASS)
    }
}
