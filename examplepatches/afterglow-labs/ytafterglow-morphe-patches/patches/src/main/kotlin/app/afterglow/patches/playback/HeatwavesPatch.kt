package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

/** Hide only the heat-wave drawing; native model, visibility and callbacks survive. */
internal val heatwavesHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val wave = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            filters = listOf(resourceLiteral(ResourceType.COLOR, "heat_wave_background_color")),
        )
        val draw = Fingerprint(classFingerprint = wave, name = "onDraw",
            accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
            parameters = listOf("Landroid/graphics/Canvas;"), returnType = "V").method
        require(draw.implementation!!.registerCount - 2 >= 1)
        draw.addInstructionsWithLabels(0, """
            invoke-static {}, $EXTENSION_PACKAGE/playback/PlayerBehavior;->hideHeatwaves()Z
            move-result v0
            if-eqz v0, :afterglow_native_heatwave
            return-void
            :afterglow_native_heatwave
            nop
        """)
        println("Afterglow heat waves: ${draw.definingClass}->onDraw")
    }
}
