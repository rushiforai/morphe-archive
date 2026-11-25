/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Board order when saving"

internal const val BOARD_PICKER_SORT_HOOK = "$UI_HOOKS->boardPickerSort(Ljava/lang/String;)Ljava/lang/String;"
internal const val PROFILE_BOARD_SORT_HOOK = "$UI_HOOKS->profileBoardSort(Ljava/lang/String;)V"

/** The sort the board picker's request for all your boards starts with. */
internal const val DEFAULT_BOARD_SORT = "alphabetical"

/** The fields Pinterest asks its API for in the board picker's lists, an enum entry whose name stays. */
internal const val BOARD_PICKER_FIELDS = "BOARD_PICKER_FRAGMENT"

/** Logged by the class that reads and changes your profile's board order. */
internal const val BOARD_SORT_UTILS = "BoardSortUtils: myUser is null, Fail to update board sort option"

/** The profile's board order options, an enum whose method names stay, turning your saved key into an option. */
internal const val BOARD_SORT_BY_KEY = "getOptionByApiKey"

private val BOARD_ORDER_INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE,
)

/** The registers a call passes, receiver first. */
internal fun Instruction.passed(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

/**
 * Whether a try range covers the instruction at [index] or ends right at it. Code put in front of
 * it would fall inside the range either way, since the range's end moves along with the instruction.
 */
private fun Method.insideTry(index: Int): Boolean {
    val code = implementation ?: return false
    val address = instructions().take(index).sumOf { it.codeUnits }
    return code.tryBlocks.any { address >= it.startCodeAddress && address <= it.startCodeAddress + it.codeUnitCount }
}

/** Where the board picker asks Pinterest's API for all your boards, and the register its sort is in. */
internal class BoardPickerRequest(val method: Method, val call: Int, val sort: Int)

/**
 * The board picker's request for every board you have. Two of Pinterest's methods start a sort as
 * [DEFAULT_BOARD_SORT] and name the picker's fields (14.45.0): the board section picker sets the
 * sort as a query value instead, so the request is the one whose first call after naming the
 * fields takes four strings (filter, sort, fields and page size), its sort in the register the
 * default went into.
 */
internal fun BytecodePatchContext.boardPickerRequest(): BoardPickerRequest =
    methodsWithString(DEFAULT_BOARD_SORT).filter { candidate -> candidate.fields().any { it.name == BOARD_PICKER_FIELDS } }
        .mapNotNull(::boardRequestIn).toList().one("$PATCH: the board picker's request for your boards")

private fun boardRequestIn(method: Method): BoardPickerRequest? {
    val body = method.instructions()
    val fields = body.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == BOARD_PICKER_FIELDS }
    if (fields < 0) return null
    val call = (fields until body.size).firstOrNull { at ->
        val called = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        body[at].opcode in BOARD_ORDER_INVOKES && called != null && called.parameters() == List(4) { "Ljava/lang/String;" }
    } ?: return null
    val static = body[call].opcode == Opcode.INVOKE_STATIC || body[call].opcode == Opcode.INVOKE_STATIC_RANGE
    val sort = body[call].passed().getOrNull(if (static) 1 else 2) ?: return null
    val starts = body.take(call).any { instruction ->
        instruction.opcode == Opcode.CONST_STRING && (instruction as OneRegisterInstruction).registerA == sort &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == DEFAULT_BOARD_SORT
    }
    return if (starts) BoardPickerRequest(method, call, sort) else null
}

/** The getter for the signed-in user, and the user's getter for the board order key they chose on their profile. */
internal class ProfileBoardSort(val user: MethodReference, val sortKey: MethodReference, val sortKeyCall: String)

/**
 * Read off the profile's own board order reader, the method of [BOARD_SORT_UTILS]'s class that
 * turns a key into an option with [BOARD_SORT_BY_KEY]: the key comes from a no-argument string
 * getter on the user, and the user from a no-argument getter it calls first.
 */
internal fun BytecodePatchContext.profileBoardSort(): ProfileBoardSort {
    val owner = classDefByStrings(BOARD_SORT_UTILS).toList().one("$PATCH: the profile's board order class")
    val reader = owner.methods.filter { method -> method.calls().any { it.name == BOARD_SORT_BY_KEY } }
        .one("$PATCH: the profile's board order reader")
    val body = reader.instructions()
    val byKey = body.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == BOARD_SORT_BY_KEY }
    val sortKey = (body.getOrNull(byKey - 2) as? ReferenceInstruction)?.reference as? MethodReference
    if (sortKey == null || body[byKey - 2].opcode !in BOARD_ORDER_INVOKES || sortKey.returnType != "Ljava/lang/String;" ||
        sortKey.parameterTypes.isNotEmpty() || body[byKey - 1].opcode != Opcode.MOVE_RESULT_OBJECT
    ) throw PatchException("$PATCH: the profile's board order no longer comes from a string getter on the user")
    val user = body.take(byKey).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.firstOrNull {
        it.returnType == sortKey.definingClass && it.parameterTypes.isEmpty()
    } ?: throw PatchException("$PATCH: the profile's board order no longer reads the signed-in user first")
    val call = body[byKey - 2].opcode
    if (call != Opcode.INVOKE_VIRTUAL && call != Opcode.INVOKE_INTERFACE) {
        throw PatchException("$PATCH: the user's board order key is read with $call")
    }
    return ProfileBoardSort(user, sortKey, if (call == Opcode.INVOKE_VIRTUAL) "invoke-virtual/range" else "invoke-interface/range")
}

/**
 * Lists your boards in the Save to sheet in your profile's board order (#48). Pinterest asks for
 * them A to Z, whatever order your profile shows them in, so a custom order you dragged them into
 * never reached the sheet. Every time Pinterest reads the signed-in user, the extension notes the
 * order the profile uses. The board picker's request then asks for that order instead of A to Z
 * while the switch is on.
 */
@Suppress("unused")
val boardOrderWhenSavingPatch = bytecodePatch(
    name = PATCH,
    description = "Lists your boards in the Save to sheet in the order your profile shows them, a custom order " +
        "included, instead of A to Z. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Pin page")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("boardOrderWhenSaving")
        requireStatusMethod("boardPickerSort")
        val request = boardPickerRequest()
        val profile = profileBoardSort()
        val user = profile.user
        val getter = classDefBy(user.definingClass).methods.singleOrNull {
            it.name == user.name && it.parameters().isEmpty() && it.returnType == user.returnType && it.implementation != null
        } ?: throw PatchException("$PATCH: the signed-in user's getter $user has no body here")
        val returns = getter.instructions().withIndex().filter { (_, it) -> it.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("$PATCH: the signed-in user's getter never returns")
        // A call in front of a return inside a try range can leave the method unverifiable. 14.45.0's
        // getter catches only around reading the user it saved, well before its one return.
        val guarded = returns.filter { getter.insideTry(it) }
        if (guarded.isNotEmpty()) throw PatchException("$PATCH: $user now returns inside a try range at $guarded")

        val picker = mutable(request.method)
        picker.addInstructionsAtControlFlowLabel(request.call, """
            invoke-static/range { v${request.sort} .. v${request.sort} }, $BOARD_PICKER_SORT_HOOK
            move-result-object v${request.sort}
        """)
        val reads = mutable(getter)
        for (at in returns.sortedDescending()) {
            val answer = (getter.instructions()[at] as OneRegisterInstruction).registerA
            val key = getter.freeLocalsAt("$PATCH: the user's board order", at, 1, highest = 255, reads = listOf(answer)).single()
            // In front of the return, where anything that jumps to it now comes too; the null check
            // skips to the return itself.
            reads.addInstructionsAtControlFlowLabel(at, """
                if-eqz v$answer, :hush_board_order_kept
                ${profile.sortKeyCall} { v$answer .. v$answer }, ${profile.sortKey}
                move-result-object v$key
                invoke-static/range { v$key .. v$key }, $PROFILE_BOARD_SORT_HOOK
            """, ExternalLabel("hush_board_order_kept", reads.getInstruction(at)))
        }
        enableCapability("boardPickerSort")
        enableStatus("boardOrderWhenSaving")
    }
}
