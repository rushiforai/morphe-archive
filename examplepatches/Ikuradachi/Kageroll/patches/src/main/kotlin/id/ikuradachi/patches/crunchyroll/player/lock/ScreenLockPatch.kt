package id.ikuradachi.patches.crunchyroll.player.lock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val SCREEN_LOCK_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/ScreenLockHelper;"
private const val FLAG_LOCK_BUTTON = 1
private const val FLAG_ORIENTATION_LOCK_WHILE_LOCKED = 1 shl 1
private const val FLAG_ALWAYS_LOCK_ORIENTATION = 1 shl 2

@Suppress("unused")
val screenLockPatch = bytecodePatch(
    name = "Screen & orientation lock",
    description = "Adds a screen lock toggle to the player toolbar and locks orientation against accidental rotation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    val enableScreenLockButton = booleanOption(
        key = "enableScreenLockButton",
        default = true,
        title = "Add screen lock button",
        description = "Adds a lock icon to the player toolbar that blocks touch input until unlocked via the floating Unlock pill.",
    )
    val lockOrientationWhileScreenLocked = booleanOption(
        key = "lockOrientationWhileScreenLocked",
        default = true,
        title = "Lock orientation while screen is locked",
        description = "Prevents device rotation from exiting or entering fullscreen while the player screen is locked.",
    )
    val alwaysLockRotationFullscreen = booleanOption(
        key = "alwaysLockRotationFullscreen",
        default = false,
        title = "Always ignore rotation fullscreen changes",
        description = "Prevents device rotation from automatically toggling fullscreen even when the screen is unlocked.",
    )

    execute {
        var optionsMask = 0
        if (enableScreenLockButton.value == true) optionsMask = optionsMask or FLAG_LOCK_BUTTON
        if (lockOrientationWhileScreenLocked.value == true) {
            optionsMask = optionsMask or FLAG_ORIENTATION_LOCK_WHILE_LOCKED
        }
        if (alwaysLockRotationFullscreen.value == true) {
            optionsMask = optionsMask or FLAG_ALWAYS_LOCK_ORIENTATION
        }

        val maskMethod = ScreenLockHelperMaskFingerprint.matchAll(1..1).single().method
        check(maskMethod.implementation!!.registerCount >= 1) {
            "Insufficient registers in ScreenLockHelper.getOptionsMask"
        }
        maskMethod.addInstructions(
            0,
            """
                const/4 v0, 0x${optionsMask.toString(16)}
                return v0
            """.trimIndent(),
        )

        if (optionsMask == 0) return@execute

        // 1. Guard u10.i0.onConfigurationChanged against unwanted rotation fullscreen transitions.
        if ((optionsMask and (FLAG_ORIENTATION_LOCK_WHILE_LOCKED or FLAG_ALWAYS_LOCK_ORIENTATION)) != 0) {
            val configMatch = PlayerOrientationConfigChangeFingerprint.matchAll(1..1).single()
            val configMethod = configMatch.method
            val configImpl = configMethod.implementation!!
            check(configImpl.registerCount >= 7) {
                "Unexpected register count in u10.i0.onConfigurationChanged: ${configImpl.registerCount}"
            }
            val instructions = configImpl.instructions
            val firstToggledIdx = configMatch.instructionMatches[0].index
            val minimizedIdx = configMatch.instructionMatches[2].index

            val firstIfNezIdx = (0 until firstToggledIdx).firstOrNull { i ->
                instructions[i].opcode == Opcode.IF_NEZ
            } ?: error("Missing initial IF_NEZ in u10.i0.onConfigurationChanged")

            val postRotationInvokeIdx = (minimizedIdx + 1 until instructions.size).firstOrNull { i ->
                instructions[i].opcode == Opcode.INVOKE_INTERFACE
            } ?: error("Missing post-branch INVOKE_INTERFACE in u10.i0.onConfigurationChanged")

            val postRotationInstr = instructions[postRotationInvokeIdx]
            configMethod.addInstructionsWithLabels(
                firstIfNezIdx,
                """
                    invoke-static {}, $SCREEN_LOCK_HELPER_CLASS->shouldBlockRotationFullscreenChange()Z
                    move-result v4
                    if-nez v4, :skip_rotation
                """.trimIndent(),
                ExternalLabel("skip_rotation", postRotationInstr),
            )
        }

        // 2. Attach toolbar lock button + intercept touch dispatch on InternalPlayerViewLayout.
        if ((optionsMask and FLAG_LOCK_BUTTON) != 0) {
            val toolbarMatch = PlayerToolbarInitFingerprint.matchAll(1..1).single()
            val toolbarMethod = toolbarMatch.method
            val toolbarInstructions = toolbarMethod.implementation!!.instructions
            val returnVoidIdx = toolbarInstructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            check(returnVoidIdx > 0) {
                "Failed to locate RETURN_VOID in PlayerToolbar.<init>"
            }
            toolbarMethod.addInstructions(
                returnVoidIdx,
                "invoke-static {p0}, $SCREEN_LOCK_HELPER_CLASS->attachToolbarButton(Landroid/view/ViewGroup;)V",
            )

            val dispatchMatch = InternalPlayerDispatchTouchFingerprint.matchAll(1..1).single()
            val dispatchMethod = dispatchMatch.method
            val dispatchImpl = dispatchMethod.implementation!!
            check(dispatchImpl.registerCount >= 5) {
                "Unexpected register count in InternalPlayerViewLayout.dispatchTouchEvent: ${dispatchImpl.registerCount}"
            }
            val firstInstr = dispatchImpl.instructions.first()
            check(firstInstr.location.labels.isEmpty()) {
                "Unexpected branch label on first instruction of InternalPlayerViewLayout.dispatchTouchEvent"
            }

            dispatchMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $SCREEN_LOCK_HELPER_CLASS->handleDispatchTouchEvent(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :dispatch_normal
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
                ExternalLabel("dispatch_normal", firstInstr),
            )
        }
    }
}
