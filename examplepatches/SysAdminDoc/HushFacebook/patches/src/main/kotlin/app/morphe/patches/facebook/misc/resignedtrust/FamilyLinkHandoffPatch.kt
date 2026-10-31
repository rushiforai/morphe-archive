/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.resignedtrust

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val FAMILY_LINK_HANDOFF = "Lapp/morphe/extension/facebook/coexist/FamilyLinkHandoff;->" +
    "publicLink(Landroid/content/Intent;Ljava/util/List;)Landroid/content/Intent;"

internal const val FAMILY_SCOPE_DROP = "Components matching the intent were found but none match the given scope. ["

private const val HANDOFF = "Instagram link handoff"

/**
 * The family scope filter's refusal, `return-object` of the null it answers when no target is left
 * and the scope isn't fail-open, asks the extension first. The extension answers a link-only intent
 * for a plain Instagram or Threads web link and null for anything else, so every other refusal stays
 * as it was (#287).
 *
 * The refusal is the first `return-object` after the drop's log line, and the next instruction
 * returns the intent the scope was given (its fail-open answer); anything shaped otherwise is
 * refused with the reason. On 585 the filter is an instance method, so its intent and target list
 * are p2 and p4; a static one would hold them in p1 and p3. `invoke-static` takes 4-bit registers,
 * so both must be v15 or lower.
 */
internal fun MutableMethod.handOffDroppedFamilyLinks() {
    val refusal = familyScopeRefusal()
    addInstructions(
        refusal.index,
        """
            invoke-static { v${refusal.intent}, v${refusal.targets} }, $FAMILY_LINK_HANDOFF
            move-result-object v${refusal.register}
        """,
    )
}

/** Where the scope filter answers its null refusal, the register it returns, and its intent and target list. */
internal data class FamilyScopeRefusal(val index: Int, val register: Int, val intent: Int, val targets: Int)

/** The scope filter's null refusal. */
internal fun MutableMethod.familyScopeRefusal(): FamilyScopeRefusal {
    val code = implementation!!.instructions.toList()
    val logged = code.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == FAMILY_SCOPE_DROP
    }
    if (logged < 0) throw PatchException("$HANDOFF: the scope filter has no drop log line.")
    val index = (logged + 1 until code.size).firstOrNull { code[it].opcode == Opcode.RETURN_OBJECT }
        ?: throw PatchException("$HANDOFF: nothing returns after the scope filter's drop log line.")

    val instance = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val parameterBase = implementation!!.registerCount - (parameterTypes.size + instance)
    val intent = parameterBase + instance + 1
    val targets = parameterBase + instance + 3
    if (targets > 15) throw PatchException("$HANDOFF: the scope filter's intent and targets sit in v$intent and v$targets, which the call can't name.")
    val refusal = (code[index] as OneRegisterInstruction).registerA
    val failOpen = code.getOrNull(index + 1)
    if (refusal == intent || failOpen?.opcode != Opcode.RETURN_OBJECT || (failOpen as OneRegisterInstruction).registerA != intent) {
        throw PatchException("$HANDOFF: the scope filter's refusal isn't followed by its fail-open answer.")
    }
    return FamilyScopeRefusal(index, refusal, intent, targets)
}
