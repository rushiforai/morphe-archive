package app.revanced.patches.rif.comments

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.revanced.patches.rif.shared.proxy

private const val VIDEOS = "Lapp/revanced/extension/rif/InlineVideos;"
private const val KEY_PLAYER_POSITION = "com.andrewshu.android.reddit.KEY_PLAYER_POSITION"

// rif's video player fragment (free v1.k0 / Platinum w1.k0): the only class that saves and
// restores KEY_PLAYER_POSITION. Used to locate the class.
internal val rifVideoPlayerFingerprint = fingerprint {
    custom { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_STRING && (it as ReferenceInstruction).reference.toString() == KEY_PLAYER_POSITION
        } == true
    }
}

private fun invokeOf(insn: com.android.tools.smali.dexlib2.iface.instruction.Instruction): MethodReference? =
    if (insn.opcode == Opcode.INVOKE_INTERFACE || insn.opcode == Opcode.INVOKE_VIRTUAL ||
        insn.opcode == Opcode.INVOKE_DIRECT
    ) {
        (insn as ReferenceInstruction).reference as? MethodReference
    } else {
        null
    }

/**
 * Lets rif's player continue where an inline video was when its full screen button is
 * tapped (InlineVideos.openFullscreen records the state). In the player's setup, which
 * runs when its ExoPlayer is created:
 *
 *     player.setRepeatMode(host.repeatMode())   -> InlineVideos.fullscreenRepeatMode(mode)
 *     player.seekTo(this.position)              -> InlineVideos.fullscreenPosition(position)
 *     setSound(withSound)  (k0.C7(Z)V, where it stores the flag) -> InlineVideos.fullscreenSound(on)
 *
 * Each hook returns rif's own value unless a hand-off is pending, so nothing changes for
 * videos opened any other way. Names are R8-obfuscated per build, so everything is found
 * by shape: the position field is the one restored from KEY_PLAYER_POSITION.
 */
internal fun BytecodePatchContext.hookFullscreenHandoff() {
    val playerClass = proxy(rifVideoPlayerFingerprint.classDef).mutableClass

    // Position field: `this.position = savedState.getLong(KEY_PLAYER_POSITION)`.
    val positionField = playerClass.methods.firstNotNullOfOrNull { method ->
        val insns = method.implementation?.instructions?.toList() ?: return@firstNotNullOfOrNull null
        val key = insns.indexOfFirst {
            it.opcode == Opcode.CONST_STRING && (it as ReferenceInstruction).reference.toString() == KEY_PLAYER_POSITION
        }
        if (key < 0) return@firstNotNullOfOrNull null
        insns.drop(key).take(6).firstOrNull { it.opcode == Opcode.IPUT_WIDE }
            ?.let { (it as ReferenceInstruction).reference.toString() }
    } ?: throw PatchException("player position field not found in ${playerClass.type}")

    // Setup method: `iget-wide vA, this.position` then `invoke player.seekTo(J)V`.
    var hooked = false
    for (method in playerClass.methods) {
        val insns = method.implementation?.instructions?.toList() ?: continue
        val seekGet = insns.indices.firstOrNull { i ->
            i + 1 < insns.size && insns[i].opcode == Opcode.IGET_WIDE &&
                (insns[i] as ReferenceInstruction).reference.toString() == positionField &&
                invokeOf(insns[i + 1])?.let {
                    it.parameterTypes.map(CharSequence::toString) == listOf("J") && it.returnType == "V"
                } == true
        } ?: continue
        val seek = invokeOf(insns[seekGet + 1])!!

        // setRepeatMode(I)V on the same player, before the seek.
        val repeat = (seekGet - 1 downTo 0).firstOrNull { i ->
            invokeOf(insns[i])?.let {
                it.definingClass == seek.definingClass &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("I") && it.returnType == "V"
            } == true
        } ?: throw PatchException("player setRepeatMode not found in ${method.name}")

        // The sound setter: the first call to this class's own (Z)V method after the seek.
        val soundRef = (seekGet + 1 until insns.size).firstNotNullOfOrNull { i ->
            invokeOf(insns[i])?.takeIf {
                insns[i].opcode == Opcode.INVOKE_DIRECT && it.definingClass == playerClass.type &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == "V"
            }
        } ?: throw PatchException("player sound setter not found in ${method.name}")

        val positionRegister = (insns[seekGet] as TwoRegisterInstruction).registerA
        val repeatRegister = (insns[repeat] as FiveRegisterInstruction).registerD
        // Later index first, so the earlier one doesn't shift.
        method.addInstructions(
            seekGet + 1,
            """
                invoke-static/range { v$positionRegister .. v${positionRegister + 1} }, $VIDEOS->fullscreenPosition(J)J
                move-result-wide v$positionRegister
            """,
        )
        method.addInstructions(
            repeat,
            """
                invoke-static/range { v$repeatRegister .. v$repeatRegister }, $VIDEOS->fullscreenRepeatMode(I)I
                move-result v$repeatRegister
            """,
        )

        // In the sound setter, replace the flag where it's stored (past its "has audio" checks).
        val sound = playerClass.methods.first {
            it.name == soundRef.name && it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == "V"
        }
        val p1 = sound.implementation!!.registerCount - 1
        val store = sound.instructions.indexOfFirst {
            it.opcode == Opcode.IPUT_BOOLEAN && (it as TwoRegisterInstruction).registerA == p1
        }
        if (store < 0) throw PatchException("sound flag store not found in ${sound.name}")
        sound.addInstructions(
            store,
            """
                invoke-static { p1 }, $VIDEOS->fullscreenSound(Z)Z
                move-result p1
            """,
        )
        hooked = true
        break
    }
    if (!hooked) throw PatchException("player setup not found in ${playerClass.type}")
}
