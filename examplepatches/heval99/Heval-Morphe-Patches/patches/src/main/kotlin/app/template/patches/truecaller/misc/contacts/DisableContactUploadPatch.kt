package app.template.patches.truecaller.misc.contacts

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.truecaller.shared.overrideFeatureToggle
import app.template.patches.truecaller.shared.requireFeatureToggleRead
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The argument registers of an invoke, in order, or null for other instructions. */
private fun Instruction.arguments(): List<Int>? = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> null
}

@Suppress("unused")
val disableContactUploadPatch = bytecodePatch(
    name = "Disable contact upload",
    description = "Stops uploading your contacts. Chat can no longer find which contacts use it.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Local contacts, T9, caller ID lookups (/v2/search, /v2/bulk), backup and the phonebook
        // sync are left alone.

        // 1. The two jobs that read every saved mobile number (chat contact discovery and the
        // contacts' Premium status) query with a selection that now ends in " AND 0", so the
        // cursor is empty. Both treat no numbers as done: the chat job returns Success at once,
        // the Premium status job returns Unit and its work action then reports Success, so
        // WorkManager does not retry them.
        var emptied = 0
        for (match in PhonebookMobileNumbersQueryFingerprint.matchAllOrNull().orEmpty()) {
            val method = match.method
            val label = "${match.classDef.type}->${method.name}"
            val insns = method.implementation!!.instructions.toList()
            for (index in insns.indices.filter { insns[it].string() == PHONEBOOK_MOBILE_SELECTION }) {
                val register = (insns[index] as OneRegisterInstruction).registerA
                // The first instruction after the const-string that uses or replaces the register
                // must be the query, with the register as its selection.
                val use = (index + 1 until insns.size).firstOrNull { next ->
                    insns[next].arguments()?.contains(register) == true ||
                        (insns[next].opcode.setsRegister() && (insns[next] as? OneRegisterInstruction)?.registerA == register)
                }
                val call = use?.let { insns[it].call() }
                if (call == null || call.definingClass != CONTENT_RESOLVER || call.name != "query" ||
                    insns[use].arguments()?.getOrNull(QUERY_SELECTION_ARGUMENT) != register
                ) {
                    throw PatchException("Disable contact upload: the mobile number selection in $label is not passed to ContentResolver.query")
                }
                method.replaceInstruction(index, "const-string v$register, \"$EMPTY_PHONEBOOK_MOBILE_SELECTION\"")
                if (method.getInstruction(index).string() != EMPTY_PHONEBOOK_MOBILE_SELECTION) {
                    throw PatchException("Disable contact upload: the selection in $label was not replaced")
                }
                emptied++
            }
        }
        if (emptied != EXPECTED_PHONEBOOK_MOBILE_QUERIES) {
            throw PatchException(
                "Disable contact upload: emptied $emptied mobile number queries, expected $EXPECTED_PHONEBOOK_MOBILE_QUERIES",
            )
        }

        // 2. The Call Assistant whitelist sync: its toggle reads as off, so the should-sync check
        // is false and the work action returns Success before any number is uploaded. The request
        // class is checked so a reworked upload fails the patch instead of slipping past it.
        if (classDefByOrNull(SET_WHITELIST_NUMBERS_REQUEST) == null) {
            throw PatchException("Disable contact upload: $SET_WHITELIST_NUMBERS_REQUEST not found")
        }
        requireFeatureToggleRead(CALL_ASSISTANT_NUMBER_SYNC_TOGGLE)
        overrideFeatureToggle(CALL_ASSISTANT_NUMBER_SYNC_TOGGLE, false)

        // 3. The contact editor's name suggestion checkbox: its toggle reads as off, so the
        // checkbox is hidden and saving a contact never enqueues the name suggestion upload. The
        // other name suggestion sources (MOBILE_CLIENT and SURVEY) are left alone.
        requireFeatureToggleRead(CONTACT_EDITOR_NAME_SUGGESTION_TOGGLE)
        overrideFeatureToggle(CONTACT_EDITOR_NAME_SUGGESTION_TOGGLE, false)
    }
}
