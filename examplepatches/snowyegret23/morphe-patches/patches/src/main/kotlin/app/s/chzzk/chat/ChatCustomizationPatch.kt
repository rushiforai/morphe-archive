package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.smaliReference
import app.s.chzzk.shared.Constants.CHZZK_TV_VERSIONS
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK
import app.s.chzzk.shared.chzzkType
import app.s.chzzk.shared.nativeKeyboxPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val SETTINGS = "Lapp/s/chzzk/extension/ChzzkSettings;"
private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private val BytecodePatchContext.MESSAGE get() = chzzkType("${COMMUNITY}ui/common/ui/chat/message/streaming/entity/StreamingChatMessage;")
private val BytecodePatchContext.BASE_MESSAGE get() = chzzkType("${COMMUNITY}data/core/entity/chat/message/BaseLiveChatMessage;")
private const val STYLE = "${COMMUNITY}ui/common/ui/chat/message/streaming/designstyle/StreamingMessageDesignStyle"
private val BytecodePatchContext.STATUS get() = chzzkType("${COMMUNITY}data/core/entity/user/streaming/StreamingUserStatus;")

internal fun Method.parameterRegister(index: Int): Int =
    (if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) +
        parameterTypes.take(index).sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }

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

private fun BytecodePatchContext.bridge(name: String, body: String, registers: Int? = null) {
    val owner = mutableClassDefBy(SETTINGS)
    val original = owner.methods.single { it.name == name }
    if (registers == null) original.rewrite(body)
    else {
        val method = MutableMethod(ImmutableMethod(owner.type, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
        method.addInstructions(0, body.trimIndent())
        owner.methods.remove(original)
        owner.methods.add(method)
    }
}

@Suppress("unused")
val chatCustomizationPatch = bytecodePatch(
    name = "Chat customization",
    description = "Adds in-player Morphe settings, draggable chat width, chat styling, individual badge controls, " +
        "device icons, streamer highlighting, chat jump buttons, chat input buttons, live viewer count, live rewind and catch-up, audio compression and volume boost, player button visibility, recent chat and settings copy/paste.",
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    dependsOn(nativeKeyboxPatch)
    extendWith("extensions/chzzk.mpe")
    dependsOn(playerResources)
    dependsOn(localFeaturesResources)

    execute {
        addCodecWorkarounds()
        if (packageMetadata.versionName in CHZZK_TV_VERSIONS) {
            addTvCustomization()
            return@execute
        }
        addStartupPopupHooks()
        addSettingsEntry()
        addChatUiHooks()
        addPlayerInfoBackgroundHooks()
        addPlayerHooks()
        addAudioHooks()
        addViewerCountHooks()
        addLocalFeaturesHooks()
        addFollowingNetworkHooks()
        addPlayerDiagnosticsHooks()
        addAccountFollowingHooks()
        addFollowingEntryHooks()
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
        val contentGetter = base.methods.single {
            it.name == "c" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        }
        bridge("visibleContent", """
            check-cast p0, $BASE_MESSAGE
            invoke-virtual {p0}, ${contentGetter.smaliReference}
            move-result-object p0
            return-object p0
        """)
        for ((helper, methodName, type) in listOf(
            Triple("messageId", "d", "Ljava/lang/String;"),
            Triple("messageTime", "f", "J"),
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
        val nickname = messageClass.fields.single { it.name == "d" && it.type == "Ljava/lang/String;" }
        val kind = messageClass.fields.single { it.type == chzzkType("${COMMUNITY}ui/common/ui/chat/message/streaming/entity/StreamingChatMessageType;") }
        val profile = messageClass.fields.single { it.type == STATUS }
        bridge("messageNickname", """
            check-cast p0, $MESSAGE
            iget-object p0, p0, ${nickname.smaliReference}
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
            it.parameterTypes.isEmpty() && it.returnType == chzzkType("${COMMUNITY}data/core/entity/user/streaming/StreamingUserRole;")
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

        val activity = mutableClassDefBy(chzzkType("${COMMUNITY}app/ui/AppActivity;"))
        for (methodName in listOf("onCreate", "onResume")) {
            val method = activity.methods.single { it.name == methodName }
            val superIndex = method.implementation!!.instructions.indexOfFirst {
                it.opcode in listOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE) &&
                    it.getReference<MethodReference>()?.name == methodName
            }
            check(superIndex >= 0)
            method.addInstructions(superIndex + 1, "invoke-static/range {p0 .. p0}, $SETTINGS->attach(Landroid/app/Activity;)V")
        }

        val widthOwners = when (packageMetadata.versionName) {
            "3.18.0" -> setOf("Ld34;", "Lgy5;", "Lh54;", "Lx5;")
            "3.14.0" -> setOf("Low0;", "Lzp0;")
            "3.14.10" -> setOf("Lpw0;", "Laq0;")
            "3.15.0" -> setOf("Lvx0;", "Lmm0;")
            "3.15.2" -> setOf("Lvx0;", "Lnm0;")
            "3.16.0" -> setOf("La01;", "Lvn0;")
            "3.17.0" -> setOf("Lz21;", "Leq0;")
            else -> error("Unsupported CHZZK version: ${packageMetadata.versionName}")
        }
        var widthMethods = 0
        var fontMethods = 0
        var messageRows = 0
        val minified = packageMetadata.versionName == "3.18.0"
        val styleInterfaces = mutableSetOf(chzzkType("$STYLE${'$'}ChatStyleInfo;"), chzzkType("$STYLE${'$'}NicknameStyleInfo;"))
        if (minified) {
            // R8 keeps subinterfaces for grouped styles in 3.18.
            do {
                val before = styleInterfaces.size
                classDefForEach { type ->
                    if (AccessFlags.INTERFACE.isSet(type.accessFlags) && type.interfaces.any { it in styleInterfaces }) styleInterfaces.add(type.type)
                }
            } while (styleInterfaces.size != before)
        }
        classDefForEach { original ->
            val widthCandidates = original.methods.filter { method ->
                method.name == "invoke" && method.returnType == "Ljava/lang/Object;" &&
                    method.implementation?.instructions?.mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }
                        ?.containsAll(listOf(280f.toRawBits(), 350f.toRawBits())) == true
            }
            for (candidate in widthCandidates) {
                check(original.type in widthOwners) { "Unexpected chat width owner: ${original.type}" }
                val method = mutableClassDefBy(original).methods.single { it == candidate }
                method.implementation!!.instructions.withIndex()
                    .filter { (it.value as? NarrowLiteralInstruction)?.narrowLiteral in listOf(280f.toRawBits(), 350f.toRawBits()) }
                    .reversed().forEach { (index, instruction) ->
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.addInstructions(index + 1, """
                            invoke-static/range {v$register .. v$register}, $SETTINGS->chatWidth(F)F
                            move-result v$register
                        """.trimIndent())
                    }
                widthMethods++
            }
            if ((minified || original.type.startsWith("$STYLE$")) && original.interfaces.any { it in styleInterfaces }) {
                val mutable = mutableClassDefBy(original)
                for (method in mutable.methods.filter { it.parameterTypes.isEmpty() && it.implementation != null }) {
                    when {
                        method.name == (if (minified) "i" else "g") && method.returnType == "J" -> method.mapReturn("scaleTextUnit", "J")
                        method.name == "a" && method.returnType == "F" -> method.mapReturn("scaleLine", "F")
                        method.name in (if (minified) listOf("p", "q") else listOf("n", "o")) && method.returnType == "F" -> method.mapReturn("scaleFont", "F")
                        method.name == (if (minified) "r" else "p") && method.returnType == "F" -> method.mapReturn("scaleEmoji", "F")
                        else -> continue
                    }
                    fontMethods++
                }
            }
            if (packageMetadata.versionName == "3.18.0" || (original.type.startsWith(COMMUNITY) && original.type.endsWith("MessageKt;") &&
                (original.type.contains("/chat/message/streaming/") || original.type.contains("/streaming/chat/message/")))) {
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
        check(widthMethods == widthOwners.size) { "Missing chat width calculations: $widthMethods" }
        check(fontMethods >= 10) { "Missing chat typography getters: $fontMethods" }
        check(messageRows >= 5) { "Missing message renderers: $messageRows" }

        val composerType = "Landroidx/compose/runtime/Composer;"
        val changedRevision = classDefBy(composerType).methods.single {
            it.name == "d" && it.parameterTypeNames == listOf("I") && it.returnType == "Z"
        }
        val styleFactories = mutableClassDefBy(chzzkType("${STYLE}Kt;")).methods.filter {
            it.parameterTypeNames.firstOrNull() in listOf(chzzkType("$STYLE${'$'}ChatStyleInfo;"), chzzkType("$STYLE${'$'}NicknameStyleInfo;"))
        }
        check(styleFactories.size == 2) { "Missing cached chat style factories" }
        for (factory in styleFactories) {
            val instructions = factory.implementation!!.instructions
            val cacheRead = instructions.withIndex().single {
                it.value.getReference<MethodReference>()?.let { ref ->
                    ref.definingClass == composerType && ref.name == "D" && ref.parameterTypes.isEmpty()
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

        val userRow = mutableClassDefBy(chzzkType("${COMMUNITY}ui/common/ui/chat/message/streaming/StreamingUserMessageKt;"))
            .methods.single { it.returnType == "V" && MESSAGE in it.parameterTypeNames }
        val userRows = listOf(userRow) + if (minified) listOf(addGroupedMessageFilter()) else emptyList()
        for (row in userRows) {
            val contentCalls = row.implementation!!.instructions.withIndex().filter {
                val reference = it.value.getReference<MethodReference>()
                reference?.name == contentGetter.name && reference.returnType == "Ljava/lang/String;" &&
                    reference.definingClass in listOf(BASE_MESSAGE, MESSAGE)
            }
            check(contentCalls.size == 1)
            for ((index, instruction) in contentCalls) {
                val register = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC
                    is RegisterRangeInstruction -> instruction.startRegister
                    else -> error("Unexpected content getter opcode")
                }
                row.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $SETTINGS->displayMessage(Ljava/lang/Object;)Ljava/lang/String;")
            }
        }
        val nicknameClass = mutableClassDefBy(chzzkType("${COMMUNITY}ui/common/ui/chat/message/streaming/util/StreamingNicknameKt;"))
        val badges = nicknameClass.methods.single {
            it.name == "c" && it.returnType == "V" && it.parameterTypes.size == 19 && it.parameterTypeNames[14] == "J"
        }
        val badgeRegister = badges.parameterRegister(14)
        badges.addInstructions(0, """
            invoke-static/range {p$badgeRegister .. p${badgeRegister + 1}}, $SETTINGS->scaleBadge(J)J
            move-result-wide p$badgeRegister
        """.trimIndent())
        val overlay = "${COMMUNITY}app/ui/overlayplayerend/live/streaming/chat/"
        if (packageMetadata.versionName == "3.18.0") {
            bridge("headerKind", """
                ${mapOf("Lds0;" to "DonationRank", "Lks0;" to "TongPowRank",
                    "Ljs0;" to "TongPowPrediction", "Les0;" to "FcOnlinePersonalized").entries.mapIndexed { index, (type, kind) -> """
                    instance-of v0, p0, $type
                    if-eqz v0, :next_$index
                    const-string v0, "$kind"
                    return-object v0
                    :next_$index
                """.trimIndent() }.joinToString("\n")}
                const-string v0, ""
                return-object v0
            """, registers = 2)
        }
        val itemType = chzzkType("${overlay}overlay/ChatOverlayHeaderItem;")
        val panels = mutableClassDefBy(chzzkType("${overlay}overlay/StreamingLiveEndChatOverlayHeaderPersistentItemsKt;"))
            .methods.filter { it.returnType == "V" && itemType in it.parameterTypeNames }
        check(panels.size == 3)
        for (panel in panels) {
            val itemRegister = panel.parameterRegister(panel.parameterTypeNames.indexOf(itemType))
            check(panel.localRegisterCount > 0)
            panel.addInstructionsWithLabels(0, """
                invoke-static/range {p$itemRegister .. p$itemRegister}, $SETTINGS->hideHeader(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :show_panel
                return-void
                :show_panel
                nop
            """.trimIndent())
        }
        val followPrompt = mutableClassDefBy(chzzkType("${overlay}popup/StreamingLiveEndFollowEncourageLayerKt;"))
            .methods.single {
                it.returnType == "V" && "Landroidx/compose/runtime/Composer;" in it.parameterTypeNames &&
                    (!minified || it.parameterTypeNames == listOf("Z") + List(5) { "Lkotlin/jvm/functions/Function0;" } +
                        listOf("Landroidx/compose/runtime/Composer;", "I"))
            }
        check(followPrompt.localRegisterCount > 0)
        followPrompt.addInstructionsWithLabels(0, """
            invoke-static {}, $SETTINGS->hideFollowPrompt()Z
            move-result v0
            if-eqz v0, :show_follow_prompt
            return-void
            :show_follow_prompt
            nop
        """.trimIndent())
        mutableClassDefBy(BASE_MESSAGE).methods.single {
            it.name == "i" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }.mapReturn("cleanbot", "Z")
    }
}

internal fun BytecodePatchContext.addGroupedMessageFilter(
    groupType: String = "Ljx3;",
    rendererType: String = "Lq89;",
): MutableMethod {
    // The grouped renderer receives LiveChatMessages, so individual message guards
    // never run. Filter a render-only copy, keeping the app's source list intact.
    val group = mutableClassDefBy(groupType)
    val messages = group.fields.single { it.name == "messages" && it.type == "Ljava/util/List;" }
    val index = group.fields.single { it.name == "groupIndex" && it.type == "J" }
    val constructor = group.methods.single {
        it.name == "<init>" && it.parameterTypeNames == listOf("Ljava/util/List;", "J")
    }
    val helper = MutableMethod(ImmutableMethod(group.type, "sChzzkVisibleMessages",
        listOf(ImmutableMethodParameter(group.type, emptySet(), null)), group.type,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    helper.addInstructions(0, """
        iget-object v0, p0, ${messages.smaliReference}
        invoke-static {v0}, $SETTINGS->filterMessages(Ljava/util/List;)Ljava/util/List;
        move-result-object v1
        if-eq v0, v1, :original
        invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
        move-result v0
        if-nez v0, :empty
        iget-wide v2, p0, ${index.smaliReference}
        new-instance v0, ${group.type}
        invoke-direct {v0, v1, v2, v3}, ${constructor.smaliReference}
        return-object v0
        :original
        return-object p0
        :empty
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    group.methods.add(helper)
    val renderer = mutableClassDefBy(rendererType).methods.single {
        it.returnType == "V" && group.type in it.parameterTypeNames && "Landroidx/compose/runtime/Composer;" in it.parameterTypeNames
    }
    val parameter = renderer.parameterRegister(renderer.parameterTypeNames.indexOf(group.type))
    renderer.addInstructionsWithLabels(0, """
        invoke-static/range {p$parameter .. p$parameter}, ${helper.smaliReference}
        move-result-object p$parameter
        if-nez p$parameter, :visible_messages
        return-void
        :visible_messages
        nop
    """.trimIndent())
    return renderer
}
