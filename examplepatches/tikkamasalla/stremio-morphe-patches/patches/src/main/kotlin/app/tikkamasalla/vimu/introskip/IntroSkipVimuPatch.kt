package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val INTRO_SKIP = "Lnet/gtvbox/videoplayer/IntroSkip;"
private const val VIMU_FIX = "Lnet/gtvbox/videoplayer/VimuFix;"
private const val MOD_VERSION = "1.0.0"
private const val REPOSITORY_URL = "https://github.com/tikkamasalla/stremio-morphe-patches"

/**
 * Adds intro and recap skip for TV shows, movies and anime in Vimu.
 *
 * Ports the proven apktool mod hook by hook. Every edit reuses only registers
 * that are free at its site, so no method needs extra locals. The media engine
 * byte fix and the Settings row ride along as dependencies.
 */
val introSkipVimuPatch = bytecodePatch(
    name = "Intro Skip (Vimu)",
    description = "Adds intro and recap skip for TV shows, movies and anime in Vimu.\n\nIntro Skip v$MOD_VERSION\nRepository: $REPOSITORY_URL",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(vimuNativePatch, vimuSettingsPatch)

    execute {
        // Start the skip after super.onResume, stop it after super.onPause.
        VimuPlayerFragmentOnResumeFingerprint.method.apply {
            insertAfterSuper(
                "invoke-static {p0}, $INTRO_SKIP->start(Lnet/gtvbox/videoplayer/PlayerFragment;)V",
            )
        }
        VimuPlayerFragmentOnPauseFingerprint.method.apply {
            insertAfterSuper(
                "invoke-static {p0}, $INTRO_SKIP->stop(Lnet/gtvbox/videoplayer/PlayerFragment;)V",
            )
        }

        // Release the player adapter on destroy when it is still set. Uses v0,
        // which is free in onDestroy (.locals 1).
        VimuPlayerFragmentOnDestroyFingerprint.method.apply {
            insertAfterSuper(
                """
                iget-object v0, p0, Lnet/gtvbox/videoplayer/PlayerFragment;->C0:Lnet/gtvbox/videoplayer/f;
                if-eqz v0, :vimufix_released
                invoke-interface {v0}, Lnet/gtvbox/videoplayer/f;->m()V
                :vimufix_released
                nop
                """.trimIndent(),
                withLabels = true,
            )
        }

        // Defer prepare() until the audio session id arrives. v0 holds the player
        // at this instruction, so the static call reuses the same registers.
        VimuPlayerPrepareFingerprint.method.apply {
            val prepare = findInstruction(
                "prepare call",
                { it.opcode == Opcode.INVOKE_INTERFACE && it.referenceString() == "LB/D;->g()V" },
            )
            val loader = implementation!!.instructions[prepare - 1]
            if (loader.opcode != Opcode.IGET_OBJECT) {
                throw PatchException("Vimu prepare hook moved in this build.")
            }
            replaceInstruction(
                prepare,
                "invoke-static {p0, v0}, $VIMU_FIX->prepare(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }

        // Release the media session instead of only deactivating it. The site has
        // no free register pair for the (session, position) values, so the owner
        // is passed and VimuFix reads its fields.
        VimuMediaSessionReleaseFingerprint.method.apply {
            val setActive = findInstruction(
                "media session release",
                {
                    it.opcode == Opcode.INVOKE_VIRTUAL &&
                        (it.referenceString()?.contains("MediaSession;->setActive(Z)") == true)
                },
            )
            if (implementation!!.instructions[setActive - 1].opcode != Opcode.CONST_4) {
                throw PatchException("Vimu media session release moved in this build.")
            }
            val getter = findInstruction(
                "media session field",
                {
                    it.opcode == Opcode.IGET_OBJECT &&
                        (it.referenceString()?.contains("MediaSession") == true)
                },
            )
            if (getter > setActive - 1) {
                throw PatchException("Vimu media session release moved in this build.")
            }
            replaceInstruction(
                setActive - 1,
                "invoke-static {p0}, $VIMU_FIX->stopSession0(Ljava/lang/Object;)V",
            )
            removeInstruction(setActive)
            // Indexes above were captured before any edit; remove the dead session
            // load last so earlier indexes stay valid (getter < setActive - 1).
            removeInstruction(getter)
        }

        // Cancel the pending seek timer before it is cleared. The cleared field is
        // read back, so the hook names the exact field from this build.
        VimuSeekTimerCancelFingerprint.method.apply {
            val clear = findInstruction(
                "seek timer clear",
                {
                    it.opcode == Opcode.IPUT_OBJECT &&
                        (it.referenceString()?.contains("CountDownTimer") == true)
                },
            )
            val field = (implementation!!.instructions[clear] as ReferenceInstruction)
                .reference.toString()
            addInstructionsWithLabels(
                clear,
                """
                iget-object v0, p0, $field
                if-eqz v0, :vimufix_cancelled
                invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V
                :vimufix_cancelled
                nop
                """.trimIndent(),
            )
        }
    }
}

/** Inserts smali right after the leading invoke-super, which every hook site starts with. */
private fun MutableMethod.insertAfterSuper(smali: String, withLabels: Boolean = false) {
    val first = implementation!!.instructions.firstOrNull()
        ?: throw PatchException("Empty method $definingClass->$name.")
    if (first.opcode != Opcode.INVOKE_SUPER) {
        throw PatchException("Expected invoke-super first in $definingClass->$name.")
    }
    if (withLabels) addInstructionsWithLabels(1, smali) else addInstructions(1, smali)
}

/** Index of the first instruction matching the predicate, or throws. */
private fun MutableMethod.findInstruction(
    what: String,
    predicate: (BuilderInstruction) -> Boolean,
): Int {
    val index = implementation!!.instructions.indexOfFirst(predicate)
    if (index < 0) throw PatchException("Vimu $what not found in $definingClass->$name.")
    return index
}

private fun BuilderInstruction.referenceString(): String? =
    (this as? ReferenceInstruction)?.reference?.toString()
