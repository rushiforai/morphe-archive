package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val MESSAGE = "${COMMUNITY}ui/common/ui/chat/message/streaming/entity/StreamingChatMessage;"
private const val BASE_MESSAGE = "${COMMUNITY}data/core/entity/chat/message/BaseLiveChatMessage;"
private const val STYLE = "${COMMUNITY}ui/common/ui/chat/message/streaming/designstyle/StreamingMessageDesignStyle"
private const val STATUS = "${COMMUNITY}data/core/entity/user/streaming/StreamingUserStatus;"

private fun MutableMethod.mapReturn(hook: String, type: String) {
    val opcode = if (type == "J") Opcode.RETURN_WIDE else Opcode.RETURN
    implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }
    .reversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        val end = register + if (type == "J") 1 else 0
        addInstructions(index, """
            invoke-static/range {v$register .. v$end}, $SETTINGS->$hook($type)$type
            move-result${if (type == "J") "-wide" else ""} v$register
        """.trimIndent())
    }
}

private fun BytecodePatchContext.bridge(name: String, body: String) {
    mutableClassDefBy(SETTINGS).methods.single { it.name == name }.rewrite(body)
}

internal fun BytecodePatchContext.addTvCustomization() {
    addTvSettingsEntry()
    addTvChatUiHooks()
    addSeekHooks()
    addAudioHooks()
    addViewerCountHooks()
    val stateFactory = classDefBy("Landroidx/compose/runtime/SnapshotStateKt;").methods.single {
        it.returnType == "Landroidx/compose/runtime/MutableState;" &&
            it.parameterTypeNames == listOf("Ljava/lang/Object;")
    }
    bridge("createRevision", """
        const/4 v0, 0x0
        invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v0
        invoke-static {v0}, ${stateFactory.smaliReference}
        move-result-object v0
        return-object v0
    """)
    val rawGetter = classDefBy(BASE_MESSAGE).methods.single {
        it.parameterTypes.isEmpty() && it.returnType == "Lcom/naver/chatting/library/model/LiveChatMessage;"
    }
    bridge("messageContent", """
        check-cast p0, $BASE_MESSAGE
        invoke-virtual {p0}, ${rawGetter.smaliReference}
        move-result-object p0
        invoke-virtual {p0}, Lcom/naver/chatting/library/model/LiveChatMessage;->getMessage()Ljava/lang/String;
        move-result-object p0
        return-object p0
    """)
    bridge("messageStatus", """
        check-cast p0, $BASE_MESSAGE
        invoke-virtual {p0}, ${rawGetter.smaliReference}
        move-result-object p0
        invoke-virtual {p0}, Lcom/naver/chatting/library/model/LiveChatMessage;->getSendStatus()Lcom/naver/chatting/library/model/LiveChatMessage${'$'}SendStatus;
        move-result-object p0
        invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object p0
        return-object p0
    """)
    val base = classDefBy(BASE_MESSAGE)
    val contentGetter = classDefBy(MESSAGE).methods.single {
        it.name == "r" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }
    bridge("visibleContent", """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, ${contentGetter.smaliReference}
        move-result-object p0
        return-object p0
    """)
    for ((helper, methodName, type) in listOf(
        Triple("messageId", "c", "Ljava/lang/String;"),
        Triple("messageTime", "e", "J"),
    )) {
        val getter = base.methods.single { it.name == methodName && it.returnType == type && it.parameterTypes.isEmpty() }
        bridge(helper, """
            check-cast p0, $BASE_MESSAGE
            invoke-virtual {p0}, ${getter.smaliReference}
            move-result${if (type == "J") "-wide v0" else "-object p0"}
            return${if (type == "J") "-wide v0" else "-object p0"}
        """)
    }
    val messageClass = classDefBy(MESSAGE)
    val kind = messageClass.fields.single { it.type.endsWith("/StreamingChatMessageType;") }
    val profile = messageClass.fields.single { it.type == STATUS }
    bridge("messageNickname", """
        check-cast p0, $MESSAGE
        iget-object p0, p0, ${profile.smaliReference}
        if-eqz p0, :empty
        invoke-virtual {p0}, $STATUS->l()Ljava/lang/String;
        move-result-object p0
        return-object p0
        :empty
        const-string p0, ""
        return-object p0
    """)
    bridge("messageKind", """
        check-cast p0, $MESSAGE
        iget-object p0, p0, ${kind.smaliReference}
        invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object p0
        return-object p0
    """)
    val roleGetter = classDefBy(STATUS).methods.single {
        it.parameterTypes.isEmpty() && it.returnType.endsWith("/StreamingUserRole;")
    }
    bridge("messageRole", """
        check-cast p0, $MESSAGE
        iget-object p0, p0, ${profile.smaliReference}
        if-eqz p0, :empty
        invoke-virtual {p0}, ${roleGetter.smaliReference}
        move-result-object p0
        if-eqz p0, :empty
        invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object p0
        return-object p0
        :empty
        const-string p0, ""
        return-object p0
    """)

    val activity = mutableClassDefBy("${COMMUNITY}tv/ui/TvActivity;")
    for (methodName in listOf("onCreate", "onResume")) {
        val method = activity.methods.single { it.name == methodName }
        val index = method.implementation!!.instructions.indexOfFirst {
            it.opcode in listOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE) &&
                it.getReference<MethodReference>()?.name == methodName
        }
        check(index >= 0)
        method.addInstructions(index + 1, "invoke-static/range {p0 .. p0}, Lapp/s/chzzk/extension/TvSettings;->attach(Landroid/app/Activity;)V")
    }
    val dispatch = activity.methods.single { it.name == "dispatchKeyEvent" }
    check(dispatch.localRegisterCount > 0)
    dispatch.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p1}, Lapp/s/chzzk/extension/TvSettings;->onKey(Landroid/view/KeyEvent;)Z
        move-result v0
        if-eqz v0, :native_key
        return v0
        :native_key
        nop
    """.trimIndent())

    val screen = mutableClassDefBy("${COMMUNITY}tv/ui/overlayplayerend/live/streaming/StreamingLiveEndScreenKt;")
        .methods.single { it.name == "a" }
    val widths = screen.implementation!!.instructions.withIndex().filter {
        (it.value as? NarrowLiteralInstruction)?.narrowLiteral == 330f.toRawBits()
    }
    check(widths.size == 1) { "TV chat width changed" }
    for ((index, instruction) in widths.reversed()) {
        val register = (instruction as OneRegisterInstruction).registerA
        screen.addInstructions(index + 1, """
            invoke-static/range {v$register .. v$register}, $SETTINGS->chatWidth(F)F
            move-result v$register
        """.trimIndent())
    }
    val layout = mutableClassDefBy("Ljv;").methods.single { it.name == "invoke" }
    val layoutInstructions = layout.implementation!!.instructions
    val expandedWidth = layoutInstructions.withIndex().single {
        (it.value as? NarrowLiteralInstruction)?.narrowLiteral == 330f.toRawBits()
    }
    check((layoutInstructions[expandedWidth.index + 2] as? NarrowLiteralInstruction)?.narrowLiteral == 260f.toRawBits())
    val animatedWidth = layoutInstructions.withIndex().drop(expandedWidth.index + 3).first {
        it.value.getReference<MethodReference>()?.let { ref ->
            ref.definingClass == "${COMMUNITY}core/foundation/util/animation/AnimationV2Kt;" && ref.name == "a"
        } == true
    }
    val widthRegister = (animatedWidth.value as FiveRegisterInstruction).registerC
    check(widthRegister == (expandedWidth.value as OneRegisterInstruction).registerA)
    layout.addInstructions(animatedWidth.index, """
        invoke-static/range {v$widthRegister .. v$widthRegister}, $SETTINGS->chatWidth(F)F
        move-result v$widthRegister
    """.trimIndent())
    val chatState = mutableClassDefBy("Luk;").methods.single { it.name == "invoke" }
    val stateInstructions = chatState.implementation!!.instructions
    val wideState = stateInstructions.withIndex().single {
        (it.value as? NarrowLiteralInstruction)?.narrowLiteral == 330f.toRawBits()
    }
    check((stateInstructions[wideState.index + 2] as? NarrowLiteralInstruction)?.narrowLiteral == 260f.toRawBits())
    val boxedWidth = stateInstructions.withIndex().drop(wideState.index + 3).first {
        it.value.getReference<MethodReference>()?.smaliReference == "Landroidx/compose/ui/unit/Dp;-><init>(F)V"
    }
    val stateRegister = (boxedWidth.value as FiveRegisterInstruction).registerD
    check(stateRegister == (wideState.value as OneRegisterInstruction).registerA)
    chatState.addInstructions(boxedWidth.index, """
        invoke-static/range {v$stateRegister .. v$stateRegister}, $SETTINGS->chatWidth(F)F
        move-result v$stateRegister
    """.trimIndent())
    val bounds = mutableClassDefBy("Ly3;").methods.single { it.name == "invoke" }
    val boundInstructions = bounds.implementation!!.instructions
    val halves = boundInstructions.withIndex().filter { it.value.opcode == Opcode.DIV_FLOAT_2ADDR }
    check(halves.size == 3)
    check(halves.count { boundInstructions[it.index + 1].opcode == Opcode.CMPL_FLOAT } == 2)
    check(halves.count { boundInstructions[it.index + 1].opcode == Opcode.CMPG_FLOAT } == 1)
    for ((index, instruction) in halves.reversed()) {
        val register = (instruction as TwoRegisterInstruction).registerA
        val hook = if (boundInstructions[index + 1].opcode == Opcode.CMPL_FLOAT) "maxChatWidth" else "minVideoWidth"
        bounds.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, Lapp/s/chzzk/extension/TvSettings;->$hook(F)F")
        bounds.addInstructions(index + 1, "move-result v$register")
    }
    var fontMethods = 0
    var messageRows = 0
    classDefForEach { original ->
        if (original.type.startsWith("$STYLE$") &&
            original.interfaces.any { it == "$STYLE${'$'}ChatStyleInfo;" || it == "$STYLE${'$'}NicknameStyleInfo;" }) {
            val mutable = mutableClassDefBy(original)
            for (method in mutable.methods.filter { it.parameterTypes.isEmpty() && it.implementation != null }) {
                when {
                    method.name == "g" && method.returnType == "J" -> method.mapReturn("scaleTextUnit", "J")
                    method.name == "a" && method.returnType == "F" -> method.mapReturn("scaleLine", "F")
                    method.name in listOf("n", "o") && method.returnType == "F" -> method.mapReturn("scaleFont", "F")
                    method.name == "p" && method.returnType == "F" -> method.mapReturn("scaleEmoji", "F")
                    else -> continue
                }
                fontMethods++
            }
        }
        if (original.type.startsWith(COMMUNITY) && original.type.endsWith("MessageKt;") &&
            (original.type.contains("/chat/message/streaming/") || original.type.contains("/streaming/chat/message/"))) {
            val methods = original.methods.filter {
                it.returnType == "V" && MESSAGE in it.parameterTypeNames &&
                    "Landroidx/compose/runtime/Composer;" in it.parameterTypeNames
            }
            for (candidate in methods) {
                val method = mutableClassDefBy(original).methods.single { it == candidate }
                val parameter = method.parameterRegister(method.parameterTypeNames.indexOf(MESSAGE))
                check(method.localRegisterCount > 0)
                method.addInstructionsWithLabels(0, """
                    invoke-static/range {p$parameter .. p$parameter}, $SETTINGS->hideMessage(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :show_message
                    return-void
                    :show_message
                    nop
                """.trimIndent())
                messageRows++
            }
        }
    }

    check(fontMethods >= 10) { "TV chat typography was not found" }
    check(messageRows >= 5) { "TV chat renderers were not found" }
    val composerType = "Landroidx/compose/runtime/Composer;"
    val changedRevision = classDefBy(composerType).methods.single {
        it.name == "d" && it.parameterTypeNames == listOf("I") && it.returnType == "Z"
    }
    val styleFactories = mutableClassDefBy("${STYLE}Kt;").methods.filter {
        it.parameterTypeNames.firstOrNull() in listOf("$STYLE${'$'}ChatStyleInfo;", "$STYLE${'$'}NicknameStyleInfo;")
    }
    check(styleFactories.size == 2) { "Missing cached chat style factories" }
    for (factory in styleFactories) {
        val instructions = factory.implementation!!.instructions
        val cacheRead = instructions.withIndex().single {
            it.value.getReference<MethodReference>()?.let { ref ->
                ref.definingClass == composerType && ref.name == "B" && ref.parameterTypes.isEmpty()
            } == true
        }
        val composer = (cacheRead.value as FiveRegisterInstruction).registerC
        check(instructions[cacheRead.index + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        check(instructions[cacheRead.index + 2].opcode == Opcode.IF_NEZ)
        val scratch = (instructions[cacheRead.index + 1] as OneRegisterInstruction).registerA
        val invalid = (instructions[cacheRead.index + 2] as OneRegisterInstruction).registerA
        check(composer < 16 && scratch < 16 && scratch != invalid)
        factory.addInstructions(cacheRead.index, """
            invoke-static {}, $SETTINGS->settingsRevision()I
            move-result v$scratch
            invoke-interface {v$composer, v$scratch}, ${changedRevision.smaliReference}
            move-result v$scratch
            or-int v$invalid, v$invalid, v$scratch
        """.trimIndent())
    }

    val userRow = mutableClassDefBy("${COMMUNITY}ui/common/ui/chat/message/streaming/StreamingUserMessageKt;")
        .methods.single { it.returnType == "V" && MESSAGE in it.parameterTypeNames }
    val contentCalls = userRow.implementation!!.instructions.withIndex().filter {
        val reference = it.value.getReference<MethodReference>()
        reference?.name == contentGetter.name && reference.returnType == "Ljava/lang/String;" &&
            reference.definingClass == MESSAGE
    }
    check(contentCalls.size == 1)
    for ((index, instruction) in contentCalls) {
        val register = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> error("Unexpected content getter opcode")
        }
        userRow.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $SETTINGS->displayMessage(Ljava/lang/Object;)Ljava/lang/String;")
    }

    mutableClassDefBy(BASE_MESSAGE).methods.single {
        it.name == "h" && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }.mapReturn("cleanbot", "Z")
}
