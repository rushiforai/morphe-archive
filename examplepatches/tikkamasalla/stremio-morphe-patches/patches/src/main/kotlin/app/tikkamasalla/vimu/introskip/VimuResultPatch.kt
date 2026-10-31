package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val VIMU_RESULT = "Lnet/gtvbox/videoplayer/VimuResult;"
private const val INTRO_SKIP = "Lnet/gtvbox/videoplayer/IntroSkip;"
private const val PLAYER_ACTIVITY = "Lnet/gtvbox/videoplayer/PlayerActivity;"

/**
 * Returns an MX Player style result from Vimu so Stremio saves progress.
 *
 * Ports the two proven smali hooks: w1 normalizes "position" / "extra_position"
 * to "startfrom", and j1 puts position, duration and end_by on the result
 * Intent. Every edit reuses only registers that are free at its site. A third call (track)
 * keeps the latest position on the activity result, so exits that bypass j1 still return it.
 */
val vimuResultPatch = bytecodePatch(
    name = "External player result (Vimu)",
    description = "Returns position and duration from Vimu so Stremio saves progress. Runs with the Intro Skip (Vimu) patch.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Start position: v1 holds the extras Bundle right before "startfrom" is read.
        // The hand-off extras Stremio added (media identity, subtitles) are captured here too;
        // p0 is the fragment, v1 the extras Bundle.
        VimuResultStartFingerprint.method.apply {
            val anchor = findInstruction(
                "start position anchor",
                { it.opcode == Opcode.CONST_STRING && it.referenceStringContains("startfrom") },
            )
            // After the const-string: a label sits on it (the "airplay" branch ends there), so code
            // inserted before it would run only for airplay launches. v1 and p0 are untouched.
            addInstructions(
                anchor + 1,
                """
                invoke-static {v1}, $VIMU_RESULT->normalize(Landroid/os/Bundle;)V
                invoke-static {p0, v1}, $INTRO_SKIP->capture(Ljava/lang/Object;Landroid/os/Bundle;)V
                invoke-static {p0}, $VIMU_RESULT->track(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        // Finish: p0 is the fragment, p1 the result code, v0 the result Intent.
        VimuResultFinishFingerprint.method.apply {
            val setResult = findInstruction(
                "setResult call",
                {
                    it.opcode == Opcode.INVOKE_VIRTUAL &&
                        (it.referenceString()?.contains("Activity;->setResult(ILandroid/content/Intent;)V") == true)
                },
            )
            addInstructions(
                setResult,
                """
                invoke-static {p0, p1, v0}, $VIMU_RESULT->fill(Ljava/lang/Object;ILandroid/content/Intent;)I
                move-result p1
                """.trimIndent(),
            )
        }

        // Home or recents: return the result right away, while the caller can still take it.
        // Vimu opening its own preferences from the player is reported first, so it is skipped.
        try {
            VimuOwnScreenFingerprint.method.addInstructions(
                0,
                "invoke-static {}, $VIMU_RESULT->ownScreen()V",
            )
        } catch (_: Exception) {
            // Opening Vimu's preferences from the player would also return the result.
        }
        try {
            val activity = mutableClassDefBy(PLAYER_ACTIVITY)
            if (activity.methods.none { it.name == "onUserLeaveHint" && it.parameterTypes.isEmpty() }) {
                val method = ImmutableMethod(
                    PLAYER_ACTIVITY,
                    "onUserLeaveHint",
                    emptyList(),
                    "V",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(1),
                ).toMutable()
                method.addInstructions(
                    0,
                    """
                    invoke-super {p0}, Landroid/app/Activity;->onUserLeaveHint()V
                    invoke-static {p0}, $VIMU_RESULT->userLeave(Ljava/lang/Object;)V
                    return-void
                    """.trimIndent(),
                )
                activity.methods.add(method)
            }
        } catch (_: Exception) {
            // The result still returns when Vimu stops, as before.
        }
    }
}

/** Index of the first instruction matching the predicate, or throws. */
private fun MutableMethod.findInstruction(
    what: String,
    predicate: (BuilderInstruction) -> Boolean,
): Int {
    val index = implementation!!.instructions.indexOfFirst(predicate)
    if (index < 0) throw PatchException("Vimu result $what not found in $definingClass->$name.")
    return index
}

private fun BuilderInstruction.referenceString(): String? =
    (this as? ReferenceInstruction)?.reference?.toString()

private fun BuilderInstruction.referenceStringContains(value: String): Boolean =
    referenceString()?.contains(value) == true
