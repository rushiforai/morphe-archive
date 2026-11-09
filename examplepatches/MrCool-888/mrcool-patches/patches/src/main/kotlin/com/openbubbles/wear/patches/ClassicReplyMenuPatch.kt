package com.openbubbles.wear.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22x
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Element

private const val APP = "Lcom/localob/messaging/app/messaging/"
private const val DOMAIN = "Lcom/localob/messaging/backend/domain/"
private const val CONVERSATION = "${APP}ConversationViewScreenKt;"
private const val COMPOSER_BAR = "${APP}composer/MessageComposerBarKt;"
private const val COMPOSER_STATE = "${APP}composer/MessageComposerState;"
private const val REACTION_TARGET = "${APP}ReactionTarget;"
private const val INLINE_REPLY = "Lcom/openbubbles/wear/patch/ClassicReply;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val FOCUS_REQUESTER = "Landroidx/compose/ui/focus/FocusRequester;"
private const val MUTABLE_STATE = "Landroidx/compose/runtime/MutableState;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val FUNCTION2 = "Lkotlin/jvm/functions/Function2;"
private const val MESSAGE = "${DOMAIN}Message;"
private const val MESSAGE_REF = "${DOMAIN}MessageRef;"
private const val INSTALLED = "com.openbubbles.wear.patch.CLASSIC_REPLY_MENU"

private val classicReplyManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")
            if (applications.length != 1) throw PatchException("Expected one application in the manifest")
            (applications.item(0) as Element).appendChild(document.createElement("meta-data").apply {
                setAttributeNS(ANDROID_NS, "android:name", INSTALLED)
                setAttributeNS(ANDROID_NS, "android:value", "true")
            })
        }
    }
}

@Suppress("unused")
val classicReplyMenuPatch = bytecodePatch(
    name = "Classic reply menu",
    description = "Adds inline replies and a separate swipe direction switch in OpenBubbles Settings → Morphe patches.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            packageName = "com.openbubbles.messaging",
            name = "OpenBubbles",
            targets = listOf(AppTarget(version = "2.0.0", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 20002293))),
        ),
    )
    dependsOn(sharedSettingsPatch, classicReplyManifestPatch)
    execute { addClassicReplyHooks() }
}

private fun BytecodePatchContext.addClassicReplyHooks() {
    val bind = hook("bindComposer", listOf(MUTABLE_STATE, COMPOSER_STATE), "V")
    val select = hook("replyCallback", listOf(FUNCTION1, REACTION_TARGET, MUTABLE_STATE, COMPOSER), FUNCTION1)
    val swipe = hook("swipeCallback", listOf(FUNCTION1, MUTABLE_STATE, COMPOSER), FUNCTION1)
    val dispatchSwipe = hook("dispatchSwipe", listOf(FUNCTION1, MESSAGE, "I"), "V")
    val swipeAction = hook("swipeAction", listOf(FUNCTION1, FUNCTION0), FUNCTION0)
    val swipeDirection = hook("swipeDirection", listOf(FUNCTION0, "Z"), "Z")
    val header = hook("composerHeader", listOf(COMPOSER_STATE, FUNCTION2), FUNCTION2)
    val focus = hook("composerFocusRequester", listOf(COMPOSER_STATE, FOCUS_REQUESTER), FOCUS_REQUESTER)
    val replyTo = hook("replyTarget", listOf(COMPOSER_STATE, MESSAGE_REF), MESSAGE_REF)
    val clear = hook("clearAfterSend", listOf(COMPOSER_STATE), "V")
    val setThread = hook("setThread", listOf(MUTABLE_STATE, "Ljava/lang/String;"), "V")
    val extensionMethods = classDefBy(INLINE_REPLY).methods
    if (listOf(bind, select, swipe, dispatchSwipe, swipeAction, swipeDirection, header, focus, replyTo, clear, setThread)
            .any { target -> extensionMethods.none { it == target } }) {
        throw PatchException("Classic reply extension is missing a hook")
    }
    requireExactMethods(FOCUS_REQUESTER, listOf("requestFocus()V"),
        classDefBy(FOCUS_REQUESTER).methods.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }.toSet())

    val chat = mutableClassDefBy(CONVERSATION)
    val threadSetter = chat.methods.single { it.name == "ConversationViewBody\$lambda\$20" }
    val setter = threadSetter.implementation?.instructions?.firstOrNull() as? Instruction35c
    if (threadSetter.parameterTypes != setThread.parameterTypes || setter?.opcode != Opcode.INVOKE_INTERFACE ||
        setter.reference.toString() != "$MUTABLE_STATE->setValue(Ljava/lang/Object;)V") {
        throw PatchException("Unexpected native thread setter")
    }
    threadSetter.replaceInstruction(0, BuilderInstruction35c(Opcode.INVOKE_STATIC,
        2, setter.registerC, setter.registerD, 0, 0, 0, setThread))

    val bottomBar = chat.methods.single { it.name == "ConversationViewBody\$lambda\$81\$3\$0\$0" }
    if (bottomBar.parameterTypes.drop(2).take(2) != bind.parameterTypes) {
        throw PatchException("Unexpected composer binding parameters")
    }
    bottomBar.addInstructions(0, "invoke-static/range {p2 .. p3}, $bind")

    val overlay = chat.methods.single { it.name == "ConversationViewBody\$lambda\$81\$3\$0\$2\$0" }
    val reactionOverlay = overlay.callTo(CONVERSATION, "ReactionOverlay", Opcode.INVOKE_STATIC_RANGE)
    if (overlay.implementation!!.registerCount != 19 || overlay.parameterTypes.getOrNull(4) != MUTABLE_STATE ||
        reactionOverlay.start != 0 || reactionOverlay.count != 10 ||
        reactionOverlay.method.parameterTypes.getOrNull(4) != FUNCTION1) {
        throw PatchException("Unexpected native reply callback registers")
    }
    // v14 is the thread state captured by the stock Reply callback. The overlay still owns dismissal.
    overlay.addInstructions(reactionOverlay.index, """
        invoke-static {v4, v0, v14, v7}, $select
        move-result-object v4
    """.trimIndent())

    val transcript = chat.methods.single { it.name == "ConversationViewBody\$lambda\$81\$3\$0\$1\$1\$5\$0\$0\$3" }
    val nativeSwipe = "${CONVERSATION.dropLast(1)}\$\$ExternalSyntheticLambda132;-><init>($MUTABLE_STATE)V"
    val transcriptInstructions = transcript.implementation!!.instructions
    val swipeConstructor = transcriptInstructions.indices.singleOrNull {
        (transcriptInstructions[it] as? ReferenceInstruction)?.reference.toString() == nativeSwipe
    } ?: throw PatchException("Expected one swipe callback in the main transcript")
    val constructor = transcriptInstructions[swipeConstructor] as? Instruction35c
    val remember = transcriptInstructions.getOrNull(swipeConstructor + 1) as? Instruction35c
    if (constructor?.opcode != Opcode.INVOKE_DIRECT || constructor.registerCount != 2 ||
        remember?.opcode != Opcode.INVOKE_INTERFACE || remember.registerCount != 2 ||
        remember.reference.toString() != "$COMPOSER->updateRememberedValue(Ljava/lang/Object;)V" ||
        constructor.registerC != remember.registerD) {
        throw PatchException("Unexpected swipe callback registers")
    }
    // Wrap only the remembered main-transcript callback. Thread overlays retain their native action.
    transcript.addInstructions(swipeConstructor + 1, """
        invoke-static {v${constructor.registerC}, v${constructor.registerD}, v${remember.registerC}}, $swipe
        move-result-object v${constructor.registerC}
    """.trimIndent())

    val bubble = chat.methods.single { it.name == "MessageBubble-4u75S8o" }
    val bubbleInstructions = bubble.implementation!!.instructions
    // Mark the remembered actions for single and grouped message parts.
    for (lambda in listOf(156, 141)) {
        val actionConstructor = "${CONVERSATION.dropLast(1)}\$\$ExternalSyntheticLambda$lambda;-><init>($FUNCTION1${MESSAGE}I)V"
        val index = bubbleInstructions.indices.singleOrNull {
            (bubbleInstructions[it] as? ReferenceInstruction)?.reference.toString() == actionConstructor
        } ?: throw PatchException("Expected native swipe action $lambda")
        val action = bubbleInstructions[index] as? Instruction35c
        val store = bubbleInstructions.getOrNull(index + 1) as? Instruction35c
        if (action?.opcode != Opcode.INVOKE_DIRECT || action.registerCount != 4 ||
            store?.opcode != Opcode.INVOKE_INTERFACE || store.registerCount != 2 ||
            store.reference.toString() != "$COMPOSER->updateRememberedValue(Ljava/lang/Object;)V" ||
            action.registerC != store.registerD) {
            throw PatchException("Unexpected native swipe action registers")
        }
        bubble.addInstructions(index + 1, """
            invoke-static {v${action.registerD}, v${action.registerC}}, $swipeAction
            move-result-object v${action.registerC}
        """.trimIndent())
    }

    val swipeBox = chat.methods.single { it.name == "SwipeToReplyBox" }
    val gesture = swipeBox.callTo("${CONVERSATION.dropLast(1)}\$SwipeToReplyBox\$1\$3\$1;",
        "<init>", Opcode.INVOKE_DIRECT_RANGE)
    val swipeInstructions = swipeBox.implementation!!.instructions
    if (swipeBox.implementation!!.registerCount != 38 || gesture.start != 0 || gesture.count != 8 ||
        gesture.method.parameterTypes.getOrNull(3) != FUNCTION0 ||
        gesture.method.parameterTypes.getOrNull(5) != "Z" ||
        !swipeInstructions[gesture.index - 9].isMove(Opcode.MOVE_OBJECT_FROM16, 4, 31) ||
        !swipeInstructions[gesture.index - 3].isMove(Opcode.MOVE_FROM16, 6, 30)) {
        throw PatchException("Unexpected native swipe gesture registers")
    }
    // The sender flag also aligns the bubble. Reverse only the pointer handler's copy.
    swipeBox.addInstructions(gesture.index, """
        invoke-static {v4, v6}, $swipeDirection
        move-result v6
    """.trimIndent())

    val swipeBodies = listOf(
        "MessageBubble_4u75S8o\$lambda\$39\$0\$0\$0\$0\$0",
        "MessageBubble_4u75S8o\$lambda\$39\$0\$0\$10\$0\$0",
    )
    for (name in swipeBodies) {
        val handler = chat.methods.single { it.name == name }
        val implementation = handler.implementation ?: throw PatchException("Missing swipe handler")
        val instructions = implementation.instructions
        if (handler.parameterTypes != dispatchSwipe.parameterTypes || implementation.registerCount != 3 ||
            instructions.size != 5 ||
            (instructions[0] as? ReferenceInstruction)?.reference.toString() !=
                "${APP}ReplyThreadingKt;->resolveReplyTarget(${MESSAGE}I)$MESSAGE_REF" ||
            instructions[1].opcode != Opcode.MOVE_RESULT_OBJECT ||
            (instructions[2] as? ReferenceInstruction)?.reference.toString() !=
                "$FUNCTION1->invoke(Ljava/lang/Object;)Ljava/lang/Object;") {
            throw PatchException("Unexpected native swipe handler $name")
        }
        handler.replaceInstruction(0, BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, 0, 1, 2, 0, 0, dispatchSwipe))
        implementation.removeInstruction(2)
        implementation.removeInstruction(1)
    }

    val composerRows = mutableClassDefBy(COMPOSER_BAR).methods.single { it.name == "ComposerRows" }
    val textField = composerRows.callTo(COMPOSER_BAR, "StyledMessageTextField-GHTll3U", Opcode.INVOKE_STATIC_RANGE)
    if (textField.start != 0 || textField.count != 11 ||
        textField.method.parameterTypes.getOrNull(3) != FUNCTION2) {
        throw PatchException("Unexpected native composer header registers")
    }
    composerRows.addInstructions(textField.index, """
        invoke-static {v0, v3}, $header
        move-result-object v3
        and-int/lit16 v9, v9, -7169
    """.trimIndent())
    if (composerRows.parameterTypes.firstOrNull() != COMPOSER_STATE ||
        composerRows.parameterTypes.getOrNull(7) != FOCUS_REQUESTER || composerRows.implementation!!.registerCount != 61) {
        throw PatchException("Unexpected native composer focus parameters")
    }
    composerRows.addInstructions(0, """
        move-object/from16 v0, p0
        move-object/from16 v1, p7
        invoke-static {v0, v1}, $focus
        move-result-object p7
    """.trimIndent())

    val send = chat.methods.single { it.name == "ConversationViewBody\$lambda\$74\$0" }
    val content = send.callTo("${DOMAIN}MessageContent;", "<init>", Opcode.INVOKE_DIRECT_RANGE)
    val clearCall = send.callTo(COMPOSER_STATE, "clear", Opcode.INVOKE_VIRTUAL_RANGE)
    if (send.implementation!!.registerCount != 32 || send.parameterTypes.first() != COMPOSER_STATE ||
        content.start != 10 || content.count != 10 || content.method.parameterTypes.getOrNull(3) != MESSAGE_REF ||
        clearCall.start != 20 || clearCall.count != 1 || clearCall.index <= content.index) {
        throw PatchException("Unexpected native send registers")
    }
    send.replaceInstruction(clearCall.index, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, clearCall.start, 1, clear))
    // v0 is overwritten immediately after the native MessageContent constructor.
    send.addInstructions(content.index, """
        move-object/from16 v0, p0
        invoke-static {v0, v14}, $replyTo
        move-result-object v14
    """.trimIndent())
}

private fun hook(name: String, parameters: List<String>, result: String) =
    ImmutableMethodReference(INLINE_REPLY, name, parameters, result)

private fun Instruction.isMove(
    opcode: Opcode, destination: Int, source: Int,
) = this is Instruction22x && this.opcode == opcode && registerA == destination && registerB == source

private data class RangeCall(val index: Int, val start: Int, val count: Int, val method: MethodReference)

private fun MutableMethod.callTo(owner: String, name: String, opcode: Opcode): RangeCall {
    val calls = implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass != owner || reference.name != name) return@mapIndexedNotNull null
        val call = instruction as? Instruction3rc
            ?: throw PatchException("Expected a range invocation of $owner->$name")
        if (call.opcode != opcode) throw PatchException("Unexpected invocation of $owner->$name")
        RangeCall(index, call.startRegister, call.registerCount, reference)
    }
    return calls?.singleOrNull() ?: throw PatchException("Expected one call to $owner->$name")
}
