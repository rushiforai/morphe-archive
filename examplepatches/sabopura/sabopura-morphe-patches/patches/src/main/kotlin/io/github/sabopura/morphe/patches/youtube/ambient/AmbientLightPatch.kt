package io.github.sabopura.morphe.patches.youtube.ambient

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import io.github.sabopura.morphe.patches.youtube.shared.enableFeature
import io.github.sabopura.morphe.patches.youtube.shared.playerHooksPatch
import io.github.sabopura.morphe.patches.youtube.shared.replaceExtensionConstant
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/ambient/AmbientLightController;"
private const val SEE_THROUGH_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/ambient/SeeThroughPage;"
private val logger = Logger.getLogger("Morphe.YouTube.AmbientLight")

@Suppress("unused")
val ambientLightPatch = bytecodePatch(
    name = "Ambient light",
    description = "Fills the black bars around the video with a soft glow of the picture's colours, " +
        "like Ambient light for YouTube. Configurable in Settings > Video and audio > Ambient light.",
    default = true,
) {
    dependsOn(playerHooksPatch, ambientLightResourcePatch)
    compatibleWith(YOUTUBE)

    val enabledOption = booleanOption(
        key = "ambient_enabled_by_default",
        default = true,
        title = "Enabled by default",
        description = "Whether the ambient light is on before it is changed in the app.",
        required = true,
    )

    val blurOption = intOption(
        key = "ambient_blur",
        default = 60,
        title = "Blur",
        description = "Initial blur strength in percent (0-100).",
        required = true,
    ) { value -> value != null && value in 0..100 }

    val spreadOption = intOption(
        key = "ambient_spread",
        default = 30,
        title = "Spread",
        description = "Initial spread of the picture into the bars in percent (0-100).",
        required = true,
    ) { value -> value != null && value in 0..100 }

    val brightnessOption = intOption(
        key = "ambient_brightness",
        default = 100,
        title = "Brightness",
        description = "Initial glow brightness in percent (30-200).",
        required = true,
    ) { value -> value != null && value in 30..200 }

    val saturationOption = intOption(
        key = "ambient_saturation",
        default = 120,
        title = "Saturation",
        description = "Initial glow saturation in percent (0-250).",
        required = true,
    ) { value -> value != null && value in 0..250 }

    val frameRateOption = intOption(
        key = "ambient_frame_rate",
        default = 30,
        title = "Frame rate",
        description = "Initial glow updates per second (5-60).",
        required = true,
    ) { value -> value != null && value in 5..60 }

    execute {
        // Theater makes the page background transparent where it is painted. The hook goes
        // after the colour is set, so it works with or without other bundles' colour hooks
        // on the same method and does not disturb their fingerprints.
        // A fingerprint with a class fingerprint throws instead of returning null when the
        // class is missing (YouTube 21.29 and older), so each attempt is guarded: the
        // see-through hook is optional and must never fail the whole patch.
        val match = runCatching { LithoBackgroundBoundsFingerprint.matchOrNull() }.getOrNull()
            ?: runCatching { LithoBackgroundBoundsLegacyFingerprint.matchOrNull() }.getOrNull()
        if (match == null) {
            logger.warning("Litho background drawable not found; theater uses its fallback")
            return@execute
        }
        try {
            match.method.apply {
                val setColorIndex = match.instructionMatches.last().index
                val paintRegister = getInstruction<FiveRegisterInstruction>(setColorIndex).registerC
                // The paint is usually loaded over the register that held "this", so the
                // drawable is handed over first, while that register is still intact.
                val thisRegister = getInstruction<TwoRegisterInstruction>(setColorIndex - 1).registerB
                addInstruction(
                    setColorIndex + 1,
                    "invoke-static {v$paintRegister}, $SEE_THROUGH_CLASS->" +
                        "onLithoBackground(Landroid/graphics/Paint;)V",
                )
                addInstruction(
                    setColorIndex - 1,
                    "invoke-static {v$thisRegister}, $SEE_THROUGH_CLASS->" +
                        "onLithoBounds(Ljava/lang/Object;)V",
                )
            }
        } catch (exception: Exception) {
            logger.warning("See-through page hook skipped: ${exception.message}")
            return@execute
        }
        logger.info("Installed the see-through page background hook")
    }

    finalize {
        enableFeature("ambientLight")
        fun replaceConfig(methodName: String, value: Int) =
            replaceExtensionConstant(EXTENSION_CLASS, methodName, value)

        replaceConfig("configEnabledByDefault", if (enabledOption.value != false) 1 else 0)
        replaceConfig("configBlurPercent", blurOption.value ?: 60)
        replaceConfig("configSpreadPercent", spreadOption.value ?: 30)
        replaceConfig("configBrightnessPercent", brightnessOption.value ?: 100)
        replaceConfig("configSaturationPercent", saturationOption.value ?: 120)
        replaceConfig("configFrameRate", frameRateOption.value ?: 30)
    }
}
