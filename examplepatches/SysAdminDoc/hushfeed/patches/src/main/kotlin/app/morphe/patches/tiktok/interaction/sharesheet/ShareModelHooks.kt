/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.interaction.sharesheet

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ANDROID_VIEW = "Landroid/view/View;"
private const val VIEW_HOLDER = "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"
private const val IM_CONTACT = "Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMContact;"
private const val BASE_CONTACT = "Lcom/ss/android/ugc/aweme/im/common/model/BaseContact;"
private const val IM_CONVERSATION =
    "Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMConversation;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val SHARE_TOOLS = "Lapp/morphe/extension/tiktok/share/ShareSheetTools;"

private object ShareSnapshotFingerprint : Fingerprint(
    strings = listOf("click_to_respond_duration", "config_duration"),
    custom = { method, _ -> method.name == "<init>" && method.parameterTypes.size == 1 },
)

/**
 * The contacts adapter bind shared by user and conversation rows. Obfuscated owner and helper
 * names changed in every retained build, while its RecyclerView signature and the model API it
 * renders stayed the same.
 */
private object ShareRecipientBinderFingerprint : Fingerprint(
    name = "onBindViewHolder",
    parameters = listOf(VIEW_HOLDER, "I"),
    returnType = "V",
    custom = { method, _ -> method.isShareRecipientBinder() },
)

/**
 * The small native click branch that invokes a contact component's Function0. It is downstream
 * of View click dispatch, so touch, keyboard and accessibility all reach this one boundary.
 */
private object ShareRecipientClickFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ -> method.isShareRecipientClickDispatcher() },
)

context(patchContext: BytecodePatchContext)
internal fun hookShareModel() {
    val method = ShareSnapshotFingerprint.method
    val builder = method.parameterTypes.single().toString()
    val fields = patchContext.mutableClassDefBy(builder).fields
    check(fields.any { it.type == "Lcom/ss/android/ugc/aweme/share/base/model/BaseSharePackage;" }) {
        "Share sheet: $builder holds no BaseSharePackage, so it is not the share model builder."
    }
    val callbacks = mapOf("LIZ" to "channels", "LJFF" to "actions", "LJJIIJZLJL" to "contacts")
    val found = mutableSetOf<String>()
    method.implementation!!.instructions.withIndex().toList().asReversed().forEach { (index, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return@forEach
        val callback = callbacks[field.name] ?: return@forEach
        if (field.definingClass != builder) return@forEach
        val boolean = field.name == "LJJIIJZLJL"
        val opcode = if (boolean) Opcode.IGET_BOOLEAN else Opcode.IGET_OBJECT
        if (instruction.opcode != opcode) return@forEach
        val type = if (boolean) "Z" else "Ljava/util/List;"
        if (field.type != type) throw PatchException("Share builder ${field.name} changed type")
        val register = (instruction as TwoRegisterInstruction).registerA
        method.addInstructions(index + 1, """
            invoke-static/range { v$register .. v$register }, Lapp/morphe/extension/tiktok/share/ShareModelFilter;->$callback($type)$type
            move-result${if (boolean) "" else "-object"} v$register
        """)
        found.add(field.name)
    }
    if (found != callbacks.keys) throw PatchException("Share panel hooks are incomplete: $found")
}

context(patchContext: BytecodePatchContext)
internal fun hookShareRecipientConfirmation() {
    ShareRecipientBinderFingerprint.method.bindShareRecipient()
    ShareRecipientClickFingerprint.method.interceptShareRecipientClick()
}

internal fun Method.isShareRecipientBinder(): Boolean {
    if (name != "onBindViewHolder" || returnType != "V" ||
        parameterTypes.map(CharSequence::toString) != listOf(VIEW_HOLDER, "I") ||
        AccessFlags.STATIC.isSet(accessFlags)
    ) {
        return false
    }
    val implementation = implementation ?: return false
    val instructions = implementation.instructions.toList()
    val holderParameter = implementation.registerCount - numberOfParameterRegisters + 1
    val holderCopy = instructions.firstOrNull() as? TwoRegisterInstruction ?: return false
    if (holderCopy.opcode != Opcode.MOVE_OBJECT_FROM16 ||
        holderCopy.registerB != holderParameter || holderCopy.registerA >= 16
    ) {
        return false
    }
    val contactCasts = instructions.withIndex().filter { (index, instruction) ->
        instruction.opcode == Opcode.CHECK_CAST &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == IM_CONTACT &&
            instructions.getOrNull(index + 1)?.opcode == Opcode.IF_NEZ
    }
    if (contactCasts.size != 1) return false

    return referencesMethod(BASE_CONTACT, "getDisplayName", emptyList(), "Ljava/lang/String;") &&
        referencesMethod(BASE_CONTACT, "getUid", emptyList(), "Ljava/lang/String;") &&
        referencesMethod(IM_CONVERSATION, "getConversationId", emptyList(), "Ljava/lang/String;") &&
        referencesMethod(
            ANDROID_VIEW,
            "setContentDescription",
            listOf("Ljava/lang/CharSequence;"),
            "V",
        )
}

/**
 * The native recipient click dispatcher in either of the shapes R8 has given it.
 *
 * <p>Up to 46.8.3 it is an outlined static body on the listener group, `(group, View, String)V`,
 * reading the captured component out of an `Object` field and casting it. 46.9.3 keeps it as an
 * ordinary `(View, String)V` on a listener class of its own whose component field is typed, so
 * the cast is gone and the body is five instructions instead of six. In both, p0 is the listener,
 * p1 the view and p2 the string, which is what the hook writes to, and the body is: read the
 * component, read its Function0, skip if null, invoke it, return.
 */
internal fun Method.isShareRecipientClickDispatcher(): Boolean {
    val static = AccessFlags.STATIC.isSet(accessFlags)
    if (!AccessFlags.PUBLIC.isSet(accessFlags) || returnType != "V") return false
    val expectedParameters = if (static) listOf(definingClass, ANDROID_VIEW, "Ljava/lang/String;")
    else listOf(ANDROID_VIEW, "Ljava/lang/String;")
    if (parameterTypes.map(CharSequence::toString) != expectedParameters) return false
    val implementation = implementation ?: return false
    val instructions = implementation.instructions.toList()
    val cast = instructions.size == 6
    val expectedOpcodes = if (cast) listOf(
        Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.IGET_OBJECT,
        Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID,
    ) else listOf(
        Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
        Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID,
    )
    if (instructions.map { it.opcode } != expectedOpcodes) return false

    val firstField = (instructions[0] as? ReferenceInstruction)?.reference as? FieldReference
        ?: return false
    val componentRead = instructions[0] as? TwoRegisterInstruction ?: return false
    val component = componentRead.registerA
    val componentType: String
    val callbackAt: Int
    if (cast) {
        val componentCast = instructions[1] as? OneRegisterInstruction ?: return false
        val castType = (instructions[1] as? ReferenceInstruction)?.reference as? TypeReference
            ?: return false
        if (firstField.type != "Ljava/lang/Object;" || componentCast.registerA != component) return false
        componentType = castType.type
        callbackAt = 2
    } else {
        componentType = firstField.type
        callbackAt = 1
    }
    val callbackField = (instructions[callbackAt] as? ReferenceInstruction)?.reference as? FieldReference
        ?: return false
    val callbackRead = instructions[callbackAt] as? TwoRegisterInstruction ?: return false
    val nullGuard = instructions[callbackAt + 1] as? OneRegisterInstruction ?: return false
    val callbackCall = instructions[callbackAt + 2] as? FiveRegisterInstruction ?: return false
    val callback = (instructions[callbackAt + 2] as? ReferenceInstruction)?.reference as? MethodReference
        ?: return false
    val self = implementation.registerCount - numberOfParameterRegisters
    val callbackRegister = callbackRead.registerA
    return componentRead.registerB == self && firstField.definingClass == definingClass &&
        callbackRead.registerB == component && callbackField.definingClass == componentType &&
        callbackField.type == FUNCTION0 && nullGuard.registerA == callbackRegister &&
        callbackCall.registerCount == 1 && callbackCall.registerC == callbackRegister &&
        callback.definingClass == FUNCTION0 && callback.name == "invoke" &&
        callback.parameterTypes.none() && callback.returnType == "Ljava/lang/Object;"
}

internal fun MutableMethod.bindShareRecipient() {
    check(isShareRecipientBinder()) {
        "Share sheet: the recipient binder no longer has its verified native shape."
    }
    val instructions = implementation!!.instructions.toList()
    val holder = (instructions.first() as TwoRegisterInstruction).registerA
    val castIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CHECK_CAST &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == IM_CONTACT
    }
    val contact = (instructions[castIndex] as OneRegisterInstruction).registerA
    check(holder != contact && holder < 16 && contact < 16) {
        "Share sheet: recipient binder registers do not fit its model hook."
    }
    // Preserve any labels on the null check. A null model also reaches the extension so a
    // recycled row cannot retain the previous recipient's identity.
    addInstructionsAtControlFlowLabel(
        castIndex + 1,
        "invoke-static { v$holder, v$contact }, " +
            "$SHARE_TOOLS->bindRecipient(Ljava/lang/Object;Ljava/lang/Object;)V",
    )
}

internal fun MutableMethod.interceptShareRecipientClick() {
    check(isShareRecipientClickDispatcher()) {
        "Share sheet: the native recipient click dispatcher no longer has its verified shape."
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { p1 }, $SHARE_TOOLS->allowRecipientClick(Landroid/view/View;)Z
            move-result p2
            if-nez p2, :native_share_recipient_click
            return-void
        """,
        ExternalLabel("native_share_recipient_click", getInstruction(0)),
    )
}

private fun Method.referencesMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    result: String,
): Boolean = implementation!!.instructions.any { instruction ->
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ?: return@any false
    reference.definingClass == owner && reference.name == name &&
        reference.parameterTypes.map(CharSequence::toString) == parameters &&
        reference.returnType == result
}
