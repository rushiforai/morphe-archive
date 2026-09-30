/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.dm.saveMessages

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.entity.directItem.directItemEntity
import app.crimera.patches.instagram.misc.actionBar.chatActionBarButton.ChatActionBarBuilderFingerprint
import app.crimera.patches.instagram.misc.actionBar.chatActionBarButton.chatActionBarButtonPatch
import app.crimera.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.crimera.patches.instagram.utils.enableSettings
import app.crimera.patches.shared.declaredParameterRegister
import app.crimera.patches.shared.parameterRegisterStart
import app.crimera.utils.changeFirstString
import app.crimera.utils.classNameToExtension
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOOK_CLASS = "$PATCHES_DESCRIPTOR/dm/SavedMessagesHook;"
private const val DIRECT_THREAD_KEY = "Lcom/instagram/model/direct/DirectThreadKey;"

/** Default for how long a message that was never deleted stays in the local store. */
private const val DEFAULT_RETENTION_DAYS = 30

@Suppress("unused")
val saveDeletedMessagesPatch =
    bytecodePatch(
        name = "Save deleted messages",
        description =
            "Keeps a local copy of incoming DMs so ones the sender deletes stay readable. " +
                "Messages are stored unencrypted in the app's private storage.",
        default = true,
    ) {
        // userDataEntity is deliberately not a dependency: it only backs Hook 6's username
        // enrichment, which reads through DirectItem's own entity.
        dependsOn(instagramExtensionPatch, chatActionBarButtonPatch, directItemEntity, deletedMessagesResourcePatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        val retentionDays by intOption(
            key = "retentionDays",
            default = DEFAULT_RETENTION_DAYS,
            title = "Days to keep messages",
            description =
                "How long a copy of a message that was not deleted is kept. A message deleted " +
                    "after this is not recoverable. Deleted messages are kept until cleared.",
            required = true,
        ) { it != null && it > 0 }

        execute {
            // Every hook is required. They used to be individually wrapped in runCatching, so an
            // anchor that moved skipped its hook silently, and the patch still reported success.
            hookRestParser()
            hookMqttPostprocess()
            hookDatabaseHide()
            hookOpenThread()
            hookThreadUsers()

            RetentionDaysExtensionFingerprint.method.apply {
                removeInstructions(0, implementation!!.instructions.size)
                addInstructions(
                    0,
                    """
                    const v0, ${retentionDays!!}
                    return v0
                    """,
                )
            }

            enableSettings("saveDeletedMessages")
        }
    }

/** Hook 1: the REST/JSON path, at the parser's return. */
context(patchContext: BytecodePatchContext)
private fun hookRestParser() {
    DirectItemFieldParserFingerprint.method.apply {
        val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }
        val itemRegister = returnInstruction.registersUsed[0]
        addInstructions(
            returnInstruction.location.index,
            "invoke-static/range { v$itemRegister .. v$itemRegister }, $HOOK_CLASS->onMessageReceived(Ljava/lang/Object;)V",
        )
    }
}

/**
 * Hook 2: the MQTT/MSys real-time path, which REST never touches. The item's thread key is null
 * here, so the thread id is read off the MSys delta (the second parameter), whose converter to a
 * thread key names the field.
 */
context(patchContext: BytecodePatchContext)
private fun hookMqttPostprocess() {
    val postprocess = DirectItemPostprocessFingerprint.method
    val deltaClass = postprocess.parameterTypes[1].toString()

    fun isConverter(method: Method) =
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == DIRECT_THREAD_KEY &&
            method.parameterTypes.singleOrNull()?.toString() == deltaClass

    val deltaThreadIdField =
        patchContext.classDefByOrNull { classDef -> classDef.methods.any(::isConverter) }
            ?.methods
            ?.first(::isConverter)
            ?.implementation
            ?.instructions
            ?.firstNotNullOfOrNull { instruction ->
                instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }
                    ?.getReference<FieldReference>()
                    ?.takeIf { it.type == "Ljava/lang/String;" }
            } ?: throw PatchException("Could not identify the thread id field of $deltaClass")

    postprocess.apply {
        // iget-object and the non-range invoke both take four-bit registers.
        val registers = getFreeRegisterProvider(index = 0, numberOfFreeRegistersNeeded = 3)
        val item = registers.getFreeRegister4Bit()
        val delta = registers.getFreeRegister4Bit()
        val threadId = registers.getFreeRegister4Bit()
        // The item is the receiver: postprocess is a method of the message itself.
        if (AccessFlags.STATIC.isSet(accessFlags)) throw PatchException("DirectMessage.postprocess is no longer an instance method")
        val itemParameter = parameterRegisterStart(this)
        val deltaParameter = declaredParameterRegister(this, 1)

        // The delta is null on some calls; the thread id hint is then null too.
        addInstructions(
            0,
            """
            move-object/from16 v$item, v$itemParameter
            const/4 v$threadId, 0x0
            move-object/from16 v$delta, v$deltaParameter
            if-eqz v$delta, :no_delta
            iget-object v$threadId, v$delta, $deltaClass->${deltaThreadIdField.name}:Ljava/lang/String;
            :no_delta
            invoke-static { v$item, v$threadId }, $HOOK_CLASS->onMessageReceived(Ljava/lang/Object;Ljava/lang/String;)V
            """,
        )
    }
}

/** Hook 4: the SQLite DAO hide, at entry, so the stored copy still exists when the hook fires. */
context(patchContext: BytecodePatchContext)
private fun hookDatabaseHide() {
    DirectItemDbHideFingerprint.method.apply {
        // (DirectThreadKey, server id, client id): the two ids are the second and third parameters.
        val serverId = declaredParameterRegister(this, 1)
        val clientId = declaredParameterRegister(this, 2)
        val registers = getFreeRegisterProvider(index = 0, numberOfFreeRegistersNeeded = 2)
        val first = registers.getFreeRegister4Bit()
        val second = registers.getFreeRegister4Bit()

        addInstructions(
            0,
            """
            move-object/from16 v$first, v$serverId
            move-object/from16 v$second, v$clientId
            invoke-static { v$first, v$second }, $HOOK_CLASS->onMessageHiddenFromDb(Ljava/lang/String;Ljava/lang/String;)V
            """,
        )
    }
}

/**
 * Hook 5: remember the thread that is on screen, so the deleted-messages screen opened from a
 * chat shows that chat. The chain view model -> descriptor -> DirectThreadKey -> thread id is
 * walked in the extension; only the obfuscated names are resolved here.
 */
context(patchContext: BytecodePatchContext)
private fun hookOpenThread() {
    // DirectThreadKey's thread id is its first String instance field, as directItemEntity finds it.
    // piko read it off toString, which on 448 no longer names mThreadId, so this hook never went in.
    val threadIdField =
        patchContext.classDefBy(DIRECT_THREAD_KEY).fields.firstOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/String;"
        } ?: throw PatchException("Could not identify the thread id field of DirectThreadKey")

    ChatActionBarBuilderFingerprint.method.apply {
        val keyConverter =
            instructions.firstNotNullOfOrNull { instruction ->
                instruction.takeIf { it.opcode == Opcode.INVOKE_STATIC }
                    ?.getReference<MethodReference>()
                    ?.takeIf { it.returnType == DIRECT_THREAD_KEY }
            } ?: throw PatchException("The chat header never converts a descriptor to a thread key")
        val descriptorType = keyConverter.parameterTypes[0].toString()
        val descriptorField =
            instructions.firstNotNullOfOrNull { instruction ->
                instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }
                    ?.getReference<FieldReference>()
                    ?.takeIf { it.type == descriptorType }
            } ?: throw PatchException("The chat header never reads the thread descriptor")
        val viewModelType = descriptorField.definingClass

        OpenThreadDescriptorFieldExtension.changeFirstString(descriptorField.name)
        OpenThreadConverterClassExtension.changeFirstString(classNameToExtension(keyConverter.definingClass))
        OpenThreadConverterMethodExtension.changeFirstString(keyConverter.name)
        OpenThreadIdFieldExtension.changeFirstString(threadIdField.name)

        // Inject after the view model's first consumer, where its two producers rejoin. A branch
        // label sits on that call, so anything inserted before it is jumped over.
        val join =
            instructions.firstOrNull { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    instruction.getReference<MethodReference>()?.parameterTypes?.firstOrNull()?.toString() == viewModelType
            } ?: throw PatchException("The chat header never passes its view model on")
        val viewModelRegister = join.registersUsed[0]
        // A move-result must stay with its call, so step past it when present.
        val afterJoin = join.location.index + 1
        val injectIndex =
            if (getInstruction(afterJoin).opcode in MOVE_RESULTS) afterJoin + 1 else afterJoin
        val register = getFreeRegisterProvider(injectIndex, 1).getFreeRegister()

        addInstructionsWithLabels(
            injectIndex,
            """
            move-object/from16 v$register, v$viewModelRegister
            if-eqz v$register, :no_thread
            invoke-static/range { v$register .. v$register }, $HOOK_CLASS->noteOpenThread(Ljava/lang/Object;)V
            """,
            ExternalLabel("no_thread", getInstruction(injectIndex)),
        )
    }
}

/** Hook 6: harvest participant usernames from the thread deserializer's "users" list. */
context(patchContext: BytecodePatchContext)
private fun hookThreadUsers() {
    ThreadUsersDispatchFingerprint.method.apply {
        val usersKeyIndex =
            instructions.indexOfFirst { it.getReference<StringReference>()?.string == "users" }
        if (usersKeyIndex < 0) throw PatchException("The thread deserializer has no users key")
        val listPut =
            instructions.drop(usersKeyIndex + 1).firstOrNull { instruction ->
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    instruction.getReference<FieldReference>()?.type == "Ljava/util/List;"
            } ?: throw PatchException("The thread deserializer never stores the users list")
        val listRegister = listPut.registersUsed[0]

        addInstructions(
            listPut.location.index + 1,
            "invoke-static/range { v$listRegister .. v$listRegister }, $HOOK_CLASS->noteThreadUsers(Ljava/util/List;)V",
        )
    }
}

private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE)
