package me.toidicakhia.patches.vtvgo

import me.toidicakhia.patches.shared.Constants.VTVGO_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val QUALITY_CONTROL_CLASS = "Lme/toidicakhia/extension/player/VideoQualityControl;"

@Suppress("unused")
val vtvgoVideoQualityButtonPatch = bytecodePatch(
    name = "Video quality control",
    description = "Adds an on-screen settings menu for the player's video quality. Auto follows " +
        "the app's own selection; the other presets override the player's quality caps.",
    default = true
) {
    compatibleWith(VTVGO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Route every quality change through the helper so the selected preset
        // survives when the player re-applies its own limits. Auto keeps the
        // values requested by the app, so its own quality menu still works.
        SetTrackParametersFingerprint.matchSingle().method.addInstructions(
            0,
            """
                invoke-static {p1, p2, p3}, $QUALITY_CONTROL_CLASS->resolve(III)[I
                move-result-object v0
                const/4 p1, 0x0
                aget p1, v0, p1
                const/4 p2, 0x1
                aget p2, v0, p2
                const/4 p3, 0x2
                aget p3, v0, p3
            """
        )

        // Track live player instances so the button can target the current
        // player and only appear while a video is active.
        BetterPlayerConstructorFingerprint.matchSingle().method.apply {
            val superIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_DIRECT &&
                    getReference<MethodReference>()?.let { reference ->
                        reference.definingClass == "Ljava/lang/Object;" &&
                            reference.name == "<init>"
                    } == true
            }
            addInstruction(
                superIndex + 1,
                "invoke-static {p0}, $QUALITY_CONTROL_CLASS->register(Ljava/lang/Object;)V"
            )
        }

        BetterPlayerDisposeFingerprint.matchSingle().method.addInstruction(
            0,
            "invoke-static {p0}, $QUALITY_CONTROL_CLASS->unregister(Ljava/lang/Object;)V"
        )

        // The Flutter activity is reused for every screen. Installing from
        // onResume recreates the overlay after an activity recreation.
        MainFlutterActivityOnResumeFingerprint.matchSingle().method.addInstruction(
            1,
            "invoke-static {p0}, $QUALITY_CONTROL_CLASS->install(Landroid/app/Activity;)V"
        )
    }
}
