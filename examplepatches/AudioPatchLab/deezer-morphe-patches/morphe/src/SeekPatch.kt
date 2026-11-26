package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PLAYBACK_RIGHTS = "LllIIllIllIlllI;"
private const val BOX_MUSIC_ACTIONS = "morpheBoxMusicActions"
private const val BOX_LONG = "Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;"

private fun boxMusicActions(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        PLAYBACK_RIGHTS, BOX_MUSIC_ACTIONS,
        listOf("J", "I").map { ImmutableMethodParameter(it, emptySet(), null) },
        "Ljava/lang/Long;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            if-ltz p2, :box
            const/4 v0, 0x2
            if-gt p2, v0, :box
            const-wide/16 v0, 0x100
            or-long/2addr p0, v0
            :box
            invoke-static {p0, p1}, $BOX_LONG
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
    return method
}

internal val seekPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        val rights = mutableClassDefBy(PLAYBACK_RIGHTS)
        val actions = rights.methods.single {
            it.name == "IllIIIlllIIlIlll" && it.parameterTypes == listOf("I") &&
                it.returnType == "LIIIlIllIlIIIIll;"
        }
        val instructions = checkNotNull(actions.implementation).instructions
        val dispatch = instructions.indices.single { instructions[it].opcode == Opcode.PACKED_SWITCH }
        val box = instructions.indices.single { index ->
            index > dispatch && instructions[index].opcode == Opcode.INVOKE_STATIC &&
                (instructions[index] as ReferenceInstruction).reference.toString() == BOX_LONG
        }
        val call = instructions[box] as FiveRegisterInstruction
        check(call.registerCount == 2 && call.registerC == 0 && call.registerD == 1)
        check(actions.implementation?.registerCount == 12)
        val radioMask = (dispatch + 1 until box).single { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.CONST_WIDE_16 && (instruction as WideLiteralInstruction).wideLiteral == -273L
        }
        val mask = instructions[radioMask] as OneRegisterInstruction
        val applyMask = instructions[radioMask + 1] as TwoRegisterInstruction
        check(mask.registerA == 10 && applyMask.opcode == Opcode.AND_LONG_2ADDR && applyMask.registerB == mask.registerA)
        // The 0x107 mask in v3/v4 belongs to other switch cases. Use its registers
        // for the radio mask to keep p1 an integer at the shared exit.
        actions.replaceInstruction(radioMask, "const-wide/16 v3, -0x111")
        actions.replaceInstruction(radioMask + 1, "and-long/2addr v${applyMask.registerA}, v3")
        check(rights.methods.add(boxMusicActions()))
        // In the radio case p1 contains 0 or 2 after its last bit test, both music cases.
        actions.replaceInstruction(
            box,
            "invoke-static {v0, v1, p1}, $PLAYBACK_RIGHTS->$BOX_MUSIC_ACTIONS(JI)Ljava/lang/Long;",
        )
    }
}
