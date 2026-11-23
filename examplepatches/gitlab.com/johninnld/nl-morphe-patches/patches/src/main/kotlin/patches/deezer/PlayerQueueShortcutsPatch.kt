package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

/** Exact publisher bindings for 9.0.27.3 / 9002703; shared with original-input tests. */
internal object PlayerQueue27 {
    const val menu = "LIIllIIIIlIllIIIl;"
    private const val actions = "LIlllIllIlllIIlll;"
    val add = ImmutableFieldReference(actions, "IIllIIIllllllI", actions)
    val next = ImmutableFieldReference(actions, "IllIIllIlIIll", actions)
}

private const val COPY_ACTIONS =
    "Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;"

/** Extend only PLAYER's candidates. Deezer still resolves, renders and dispatches each action. */
internal fun exposePlayerQueueShortcuts(
    method: MutableMethod,
    add: FieldReference,
    playNext: FieldReference,
) {
    val code = method.instructions.toList()
    check(method.name == "<clinit>" && method.implementation!!.tryBlocks.isEmpty() &&
        code.none { it is OffsetInstruction }) { "Deezer player menu initializer changed" }
    check(add.definingClass == add.type && playNext.definingClass == add.type &&
        playNext.type == add.type && add.name != playNext.name) { "Invalid native queue actions" }
    check(code.none { (it as? ReferenceInstruction)?.reference?.toString() == COPY_ACTIONS }) {
        "Deezer player menu already extended or initializer changed"
    }
    val player = code.indices.singleOrNull { index ->
        code[index].opcode == Opcode.CONST_STRING &&
            ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == "PLAYER"
    } ?: error("Expected one native PLAYER menu")
    val name = (code[player] as OneRegisterInstruction).registerA
    val ordinal = code.getOrNull(player + 1) as? OneRegisterInstruction
    val call = code.getOrNull(player + 2) as? FiveRegisterInstruction
    val constructor = (code.getOrNull(player + 2) as? ReferenceInstruction)?.reference as? MethodReference
    check(ordinal?.opcode == Opcode.CONST_4 &&
        (ordinal as? NarrowLiteralInstruction)?.narrowLiteral == 6 &&
        call?.opcode == Opcode.INVOKE_DIRECT && call.registerCount == 4 &&
        call.registerD == name && call.registerE == ordinal.registerA &&
        constructor?.definingClass == method.definingClass && constructor.name == "<init>" &&
        constructor.returnType == "V" &&
        constructor.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "I", "[${add.type}")) {
        "Deezer PLAYER constructor changed"
    }
    val array = call!!.registerF
    val scratch = ordinal!!.registerA
    check(setOf(array, name, scratch).size == 3 && maxOf(array, name, scratch) <= 15) {
        "Deezer PLAYER scratch registers changed"
    }
    val allocation = (0 until player).lastOrNull {
        code[it].opcode == Opcode.FILLED_NEW_ARRAY_RANGE
    } ?: error("Missing native player action array")
    val filled = code[allocation] as RegisterRangeInstruction
    val result = code.getOrNull(allocation + 1) as? OneRegisterInstruction
    check(filled.registerCount == 14 &&
        (filled as ReferenceInstruction).reference.toString() == "[${add.type}" &&
        result?.opcode == Opcode.MOVE_RESULT_OBJECT && result.registerA == array &&
        code.subList(allocation + 2, player).all {
            it.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16)
        }) { "Deezer native PLAYER candidates changed" }

    // The original next two instructions overwrite name/scratch before the constructor.
    // Keep the existing 14 candidates and their order; append native queue actions only.
    // No resolver, consent, availability, queue lock, policy result or callback is patched.
    method.addInstructions(player, """
        const/16 v$scratch, 0x10
        invoke-static {v$array, v$scratch}, $COPY_ACTIONS
        move-result-object v$array
        check-cast v$array, [${add.type}
        sget-object v$name, $add
        const/16 v$scratch, 0xe
        aput-object v$name, v$array, v$scratch
        sget-object v$name, $playNext
        const/16 v$scratch, 0xf
        aput-object v$name, v$array, v$scratch
    """)
}

@Suppress("unused")
val deezerPlayerQueueShortcuts = bytecodePatch(
    name = "Player queue shortcuts",
    description = "Adds Add to queue and Play next candidates to the full player menu. " +
        "Deezer's native resolver decides visibility using the account, track and queue state, " +
        "and retains its normal confirmation and insertion paths. Grants no additional rights.",
    default = true,
) {
    // Original signer/build preflight stays mandatory. No startup or security dependency.
    compatibleWith(deezer)
    dependsOn(deezerBase)

    execute {
        exposePlayerQueueShortcuts(
            exact(PlayerQueue27.menu, "<clinit>", "V").method,
            PlayerQueue27.add,
            PlayerQueue27.next,
        )
    }
}
