package io.github.sabopura.morphe.patches.youtube.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import java.util.logging.Logger

internal const val PLAYER_HOOKS_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/shared/PlayerHooks;"
internal const val FLYOUT_BRIDGE_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/shared/FlyoutBridge;"
internal const val FEATURE_FLAGS_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/shared/FeatureFlags;"
private val logger = Logger.getLogger("Morphe.YouTube.PlayerHooks")

/**
 * Replaces the first integer constant of a static extension method. Used to bake patch
 * options and feature switches into the shared extension at patch time.
 */
internal fun BytecodePatchContext.replaceExtensionConstant(
    definingClass: String,
    methodName: String,
    value: Int,
) {
    Fingerprint(definingClass = definingClass, name = methodName).method.apply {
        val constantIndex = implementation!!.instructions.toList().indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST ||
                instruction.opcode == Opcode.CONST_4 ||
                instruction.opcode == Opcode.CONST_16
        }
        check(constantIndex >= 0) { "Extension config constant missing: $methodName" }
        val register = getInstruction<OneRegisterInstruction>(constantIndex).registerA
        replaceInstruction(constantIndex, "const v$register, $value")
    }
}

internal fun BytecodePatchContext.enableFeature(flagMethod: String) =
    replaceExtensionConstant(FEATURE_FLAGS_CLASS, flagMethod, 1)

/**
 * Hooks shared by the YouTube feature patches: player overlay construction, the media
 * clock, and the player settings flyout. Installed once even when several features use it.
 */
internal val playerHooksPatch = bytecodePatch(
    name = null,
    description = "Shared YouTube player overlay, media time, and settings flyout hooks.",
    default = false,
) {
    dependsOn(sharedSettingsResourcePatch)
    compatibleWith(YOUTUBE)
    extendWith("extensions/youtube.mpe")

    execute {
        // Feed every feature YouTube's own media time callback for smooth synchronization.
        (PlayerControllerSetTimeReferenceFingerprint.matchOrNull()
            ?: LegacyPlayerControllerSetTimeReferenceFingerprint.match())
            .instructionMatches
            .first()
            .getMethodCalled()
            .addInstruction(
                2,
                "invoke-static {p1, p2}, $PLAYER_HOOKS_CLASS->setVideoTime(J)V",
            )

        // Attach feature layers whenever the regular-player overlay is built.
        val controlsOverlayMatch =
            StableControlsOverlayFingerprint.matchOrNull()
                ?: LegacyControlsOverlayFingerprint.match()
        controlsOverlayMatch.method.apply {
            val checkCastIndex = controlsOverlayMatch.instructionMatches.last().index
            val overlayRegister = getInstruction<OneRegisterInstruction>(checkCastIndex).registerA
            addInstruction(
                checkCastIndex + 1,
                "invoke-static {v$overlayRegister}, " +
                    "$PLAYER_HOOKS_CLASS->initializeOverlay(Landroid/view/ViewGroup;)V",
            )
        }

        // Reuse YouTube's own player-settings rows for quick toggles and detailed settings.
        PlayerBottomSheetFlyoutFingerprint.method.apply {
            implementation!!.instructions.withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstruction(
                        index,
                        "invoke-static {v$register}, " +
                            "$FLYOUT_BRIDGE_CLASS->setBottomSheetFlyout(Landroid/app/Dialog;)V",
                    )
                }
        }

        PlayerPopupWindowFlyoutFingerprint.matchAll(2..4).forEach { match ->
            match.method.apply {
                val index = match.instructionMatches.last().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(
                    index,
                    "invoke-static {v$register}, " +
                        "$FLYOUT_BRIDGE_CLASS->setPopupWindowFlyout(Landroid/widget/PopupWindow;)V",
                )
            }
        }

        logger.info("Installed shared player overlay, media time, and flyout hooks")
    }
}
