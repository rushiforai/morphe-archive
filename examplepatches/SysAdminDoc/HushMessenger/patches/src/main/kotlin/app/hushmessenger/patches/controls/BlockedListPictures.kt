package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The blocked people list under Privacy and safety. Its presenter builds a row for each blocked person, looks the person
 * up by id and gives the row their profile picture. A person it can't look up gets a row with no picture at all, which
 * the row's build step takes as a row without a tile.
 */
internal const val BLOCKED_LIST_PICTURES = "blocked_list_pictures"

/** The presenter's log tag, and the parse failure only its row builder logs. */
internal const val BLOCK_PEOPLE_PRESENTER = "BlockPeopleV2PresenterImpl"
internal const val BLOCKED_ID_UNREADABLE = "user id/phone-number is null/empty when trying to parse the id"

internal const val USER_MODEL = "Lcom/facebook/user/model/User;"

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private fun Method.strings() = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()

private fun Instruction.writes(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

/** The registers a call hands its User parameters, its receiver left out. */
private fun Instruction.userArguments(): List<Int> {
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return emptyList()
    val args = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> return emptyList()
    }
    var at = if (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
    return call.parameterTypes.mapNotNull { type ->
        val register = args.getOrNull(at)
        at += if (type.toString() == "J" || type.toString() == "D") 2 else 1
        register.takeIf { type.toString() == USER_MODEL }
    }
}

/** The goto that carries a known person's picture back to the row's picture store, the picture's register and the store's type. */
internal class BlockedPicture(val index: Int, val register: Int, val type: String)

/**
 * The row's picture store, `iput-object vP, vRow, F`, as the row builder lays it out. The person comes from a call that
 * returns a User, `if-nez` on it jumps to where a known person's picture is built, and the unknown path falls through
 * `const/4 vP, 0` into the store. The known path is one straight run with no branch out and nothing landing inside it:
 * it hands the looked-up person, unchanged, to a call, ends with `move-result-object vP`, and its goto is the only
 * branch to the store. So a guard placed before that goto sees every known person's picture.
 */
private fun Method.blockedPictureAt(code: List<Instruction>, store: Int, targets: Set<Int>): BlockedPicture? {
    if (store < 4 || code[store].opcode != Opcode.IPUT_OBJECT) return null
    val field = (code[store] as ReferenceInstruction).reference as FieldReference
    val picture = (code[store] as OneRegisterInstruction).registerA
    val empty = code[store - 1]
    if (!field.type.startsWith("L") || empty.opcode != Opcode.CONST_4 || (empty as OneRegisterInstruction).registerA != picture ||
        (empty as NarrowLiteralInstruction).narrowLiteral != 0) return null
    val check = code[store - 2]
    if (check.opcode != Opcode.IF_NEZ) return null
    val user = (check as OneRegisterInstruction).registerA
    val result = code[store - 3]
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT || (result as OneRegisterInstruction).registerA != user ||
        ((code[store - 4] as? ReferenceInstruction)?.reference as? MethodReference)?.returnType != USER_MODEL) return null
    val known = code.branchTarget(store - 2)
    val back = code.indices.filter { code[it] is OffsetInstruction && code.branchTarget(it) == store }.singleOrNull() ?: return null
    if (known < 0 || back <= known || code[back].opcode !in GOTOS || store in jumpTargets(branches = false)) return null
    if ((known until back).any { code[it] is OffsetInstruction } || (known + 1..back).any { it in targets }) return null
    val built = code[back - 1]
    if (built.opcode != Opcode.MOVE_RESULT_OBJECT || (built as OneRegisterInstruction).registerA != picture) return null
    val handed = (known until back).firstOrNull { user in code[it].userArguments() } ?: return null
    if ((known until handed).any { code[it].writes(user) }) return null
    return BlockedPicture(back, picture, field.type)
}

/** The builder's one picture store of that shape, when it has exactly one. */
internal fun Method.blockedPicture(): BlockedPicture? {
    val strings = strings()
    if (BLOCK_PEOPLE_PRESENTER !in strings || BLOCKED_ID_UNREADABLE !in strings) return null
    val code = implementation!!.instructions.toList()
    val targets = jumpTargets()
    return code.indices.mapNotNull { blockedPictureAt(code, it, targets) }.singleOrNull()
}

/** The app's only method that logs the presenter's tag and its parse failure, taken when its picture store has that shape. */
internal fun findBlockedListPictures(classes: Iterable<ClassDef>): List<Method> {
    val builders = classes.flatMap { it.methods }.filter { method ->
        method.strings().let { BLOCK_PEOPLE_PRESENTER in it && BLOCKED_ID_UNREADABLE in it }
    }
    val builder = builders.singleOrNull() ?: return emptyList()
    return if (builder.blockedPicture() != null) listOf(builder) else emptyList()
}

internal fun MutableMethod.validateBlockedListPictures(): BlockedPicture = blockedPicture()
    ?: throw PatchException("Messenger controls: the blocked list's picture store changed in ${hookId()}")

/**
 * While the switch is on a known person's picture is swapped for null before it goes back to the store, the same row
 * Messenger builds for someone it can't look up: name, details and Unblock, no picture. The list builds its rows each
 * time it opens, so a flip shows the next time it does. Off, Pause and safe mode keep Messenger's picture.
 */
internal fun MutableMethod.injectBlockedListPictures() {
    val site = validateBlockedListPictures()
    val picture = "v${site.register}"
    addInstructions(site.index, """
        invoke-static/range {$picture .. $picture}, $SETTINGS->blockedListPicture(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object $picture
        check-cast $picture, ${site.type}
    """.trimIndent())
}
