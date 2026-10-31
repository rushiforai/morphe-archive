package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.matthewriley05.machu.patches.earthwallpaper.Constants.COMPATIBILITY_EARTH_SUPER_WALLPAPER

@Suppress("unused")
val earthSuperWallpaperUnlockPatch = bytecodePatch(
    name = "Unlock Earth Super Wallpaper",
    description = "Restores the lock-to-home unlock animation and prevents the wallpaper " +
        "from pausing while it is visible on AOSP-based ROMs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_EARTH_SUPER_WALLPAPER)

    execute {
        // Do not pause Unity while the wallpaper is visible. The screen-off and
        // hidden-wallpaper pause paths are untouched.
        listOf(
            DeskPauseDelayFingerprint,
            Aod2LockPauseDelayFingerprint,
            WallPaperOffsetDelayFingerprint,
        ).forEach { fingerprint ->
            val match = fingerprint.instructionMatches.first()
            val register = match.getInstruction<OneRegisterInstruction>().registerA

            fingerprint.method.replaceInstruction(
                match.index,
                "const v$register, 0x7fffffff",
            )
        }

        // Always register ACTION_USER_PRESENT, including when the app is in
        // command notification mode (Android 14+).
        IntentFilterRegistrationFingerprint.let {
            val index = it.instructionMatches.first().index

            it.method.addInstructionsAtControlFlowLabel(
                index,
                """
                    const-string v1, "android.intent.action.USER_PRESENT"
                    invoke-virtual { v0, v1 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
                """,
            )
        }

        // Remove the USE_COMMAND_NOTIFICATION early-return so the USER_PRESENT
        // branch always continues to the unlock handling code.
        UserPresentEarlyReturnFingerprint.let {
            it.method.replaceInstruction(
                it.instructionMatches.last().index,
                "nop",
            )
        }

        // Do not discard the unlock while the display state is changing.
        DisplayStateCheckFingerprint.let {
            val branchIndex = it.instructionMatches.last().index
            val method = it.method
            val branch = method.getInstruction<BuilderOffsetInstruction>(branchIndex)
            val target = branch.target.location.instruction!!

            method.addInstructionsWithLabels(
                branchIndex,
                "goto :run_desk_action",
                ExternalLabel("run_desk_action", target),
            )
            method.removeInstruction(branchIndex + 1)
        }

        // Post the "Desk" Unity message immediately instead of 100 ms later.
        DeskMessagePostFingerprint.let {
            it.method.addInstruction(
                it.instructionMatches.last().index,
                "const-wide/16 v3, 0x0",
            )
        }

        // Delay the AOD zoom-out so it does not run during the display fade.
        AodPostFingerprint.let {
            val index = it.instructionMatches.first().index

            it.method.addInstruction(index, "const-wide/16 v2, 0x1f4")
            it.method.replaceInstruction(
                index + 1,
                "invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z",
            )
        }
    }
}
