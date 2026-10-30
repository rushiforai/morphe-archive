package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val CHAT_UI = "Lapp/s/chzzk/extension/ChatUi;"
private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val BUILDER = "Landroidx/compose/ui/text/AnnotatedString${'$'}Builder;"
private const val SPAN = "Landroidx/compose/ui/text/SpanStyle;"
private const val STATUS = "${COMMUNITY}data/core/entity/user/streaming/StreamingUserStatus;"
private const val PROPERTY = "${COMMUNITY}data/core/entity/user/streaming/StreamingProperty"
private const val MESSAGE = "${COMMUNITY}ui/common/ui/chat/message/streaming/entity/StreamingChatMessage;"
private const val NICK_STYLE = "${COMMUNITY}ui/common/ui/chat/message/streaming/designstyle/StreamingMessageDesignStyle${'$'}NicknameStyleInfo;"
private const val INLINE = "${COMMUNITY}core/ui/ui/text/util/InlineTextContentBox"

internal fun BytecodePatchContext.uiBridge(name: String, registers: Int, body: String) {
    val owner = mutableClassDefBy(CHAT_UI)
    val original = owner.methods.single { it.name == name }
    val replacement = MutableMethod(ImmutableMethod(
        owner.type, original.name, original.parameters, original.returnType, original.accessFlags,
        original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())
    ))
    replacement.addInstructions(0, body.trimIndent())
    owner.methods.remove(original)
    owner.methods.add(replacement)
}

internal fun BytecodePatchContext.addChatUiHooks() {
    val current = packageMetadata.versionName == "3.16.0"
    val layoutOwner = when (packageMetadata.versionName) {
        "3.16.0" -> "Lo7;"
        "3.15.0", "3.15.2" -> "Lj7;"
        else -> "Lh7;"
    }
    val caseField = if (current) "V" else "Z"
    val firstState = if (current) "W" else "a0"
    val secondState = if (current) "X" else "b0"
    val windowState = if (current) "Y" else "c0"
    val dpValue = if (current) "V" else "Z"
    val layoutWidth = mutableClassDefBy(layoutOwner).methods.single { it.name == "invoke" }
    check(layoutWidth.localRegisterCount >= 4)
    layoutWidth.addInstructionsWithLabels(0, """
        iget v0, p0, $layoutOwner->$caseField:I
        const/4 v1, 0x4
        if-eq v0, v1, :chat_width
        const/4 v1, 0x5
        if-eq v0, v1, :chat_width
        const/4 v1, 0x6
        if-eq v0, v1, :video_width
        goto :original_width
        :chat_width
        iget-object v0, p0, $layoutOwner->$firstState:Landroidx/compose/runtime/State;
        invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Landroidx/compose/ui/unit/Dp;
        iget v0, v0, Landroidx/compose/ui/unit/Dp;->$dpValue:F
        iget-object v1, p0, $layoutOwner->$secondState:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->$dpValue:F
        add-float/2addr v0, v1
        iget-object v1, p0, $layoutOwner->$windowState:Landroidx/compose/runtime/MutableState;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->$dpValue:F
        const/high16 v2, 0x42c00000
        sub-float/2addr v1, v2
        const/4 v3, 0x0
        invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F
        move-result v1
        invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F
        move-result v0
        goto :width_result
        :video_width
        iget-object v0, p0, $layoutOwner->$windowState:Landroidx/compose/runtime/MutableState;
        invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Landroidx/compose/ui/unit/Dp;
        iget v0, v0, Landroidx/compose/ui/unit/Dp;->$dpValue:F
        iget-object v1, p0, $layoutOwner->$firstState:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Ljava/lang/Boolean;
        invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v1
        if-eqz v1, :width_result
        iget-object v1, p0, $layoutOwner->$secondState:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->$dpValue:F
        sub-float/2addr v0, v1
        const/high16 v1, 0x42c00000
        invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F
        move-result v0
        :width_result
        new-instance v1, Landroidx/compose/ui/unit/Dp;
        invoke-direct {v1, v0}, Landroidx/compose/ui/unit/Dp;-><init>(F)V
        return-object v1
        :original_width
        nop
    """.trimIndent())
    val extra = "${COMMUNITY}data/core/entity/chat/extra/StreamingChatMessageExtra;"
    check(classDefBy(extra).methods.any { it.name == "g" && it.returnType == "Ljava/lang/String;" })
    uiBridge("deviceType", 1, """
        check-cast p0, $MESSAGE
        iget-object p0, p0, $MESSAGE->e:$extra
        if-eqz p0, :empty
        invoke-virtual {p0}, $extra->g()Ljava/lang/String;
        move-result-object p0
        return-object p0
        :empty
        const-string p0, ""
        return-object p0
    """)
    uiBridge("nicknameSize", 4, """
        check-cast p0, $NICK_STYLE
        check-cast p1, Landroidx/compose/ui/unit/Density;
        invoke-interface {p0, p1}, $NICK_STYLE->e(Landroidx/compose/ui/unit/Density;)Landroidx/compose/ui/text/TextStyle;
        move-result-object v0
        iget-object v0, v0, Landroidx/compose/ui/text/TextStyle;->a:$SPAN
        iget-wide v0, v0, $SPAN->b:J
        return-wide v0
    """)
    val constructor = classDefBy(SPAN).methods.single { it.name == "<init>" && it.parameterTypes.size == 15 }
    uiBridge("appendText", 24, """
        new-instance v0, $SPAN
        const-wide v1, 0xff9399a500000000L
        move-wide/from16 v3, p2
        const/4 v5, 0x0
        const/4 v6, 0x0
        const/4 v7, 0x0
        const/4 v8, 0x0
        const/4 v9, 0x0
        const-wide/16 v10, 0x0
        const/4 v12, 0x0
        const/4 v13, 0x0
        const/4 v14, 0x0
        const-wide/16 v15, 0x0
        const/16 v17, 0x0
        const/16 v18, 0x0
        const v19, 0xfffc
        invoke-direct/range {v0 .. v19}, ${constructor.smaliReference}
        move-object/from16 v1, p0
        check-cast v1, $BUILDER
        invoke-virtual {v1, v0}, $BUILDER->l($SPAN)I
        move-result v0
        move-object/from16 v2, p1
        invoke-virtual {v1, v2}, $BUILDER->f(Ljava/lang/String;)V
        invoke-virtual {v1, v0}, $BUILDER->h(I)V
        return-void
    """)
    val icon = "${COMMUNITY}core/ui/ui/text/util/InlineTextContentIconBox;"
    val iconConstructor = classDefBy(icon).methods.single { it.name == "<init>" }
    check(iconConstructor.parameterTypes.size == if (current) 7 else 6)
    val pcIcon = if (current) "0x7f08049d" else "0x7f080496"
    val mobileIcon = if (current) "0x7f08049e" else "0x7f080497"
    val iosIcon = if (current) "0x7f080461" else "0x7f08045a"
    uiBridge("appendDevice", 20, """
        move/from16 v1, p2
        const/4 v0, 0x1
        if-ne v1, v0, :mobile
        const v1, $pcIcon
        goto :icon
        :mobile
        const/4 v0, 0x3
        if-eq v1, v0, :ios
        const v1, $mobileIcon
        goto :icon
        :ios
        const v1, $iosIcon
        :icon
        new-instance v0, $icon
        move-wide/from16 v2, p3
        move-wide v4, v2
        const/4 v8, 0x0
        const/4 v9, 0x0
        const/4 v10, 0x3
        invoke-static {v8, v9, v10}, Landroidx/compose/foundation/layout/PaddingKt;->a(FFI)Landroidx/compose/foundation/layout/PaddingValuesImpl;
        move-result-object v6
        new-instance v7, Landroidx/compose/ui/graphics/BlendModeColorFilter;
        const-wide v8, 0xff9399a500000000L
        const/4 v10, 0x5
        invoke-direct {v7, v8, v9, v10}, Landroidx/compose/ui/graphics/BlendModeColorFilter;-><init>(JI)V
        const/4 v8, 0x0
        ${if (current) "const/4 v9, 0x0" else ""}
        invoke-direct/range {v0 .. v${if (current) 9 else 8}}, ${iconConstructor.smaliReference}
        move-object/from16 v1, p0
        check-cast v1, $BUILDER
        move-object/from16 v2, p1
        invoke-static {v1, v2, v0}, $INLINE${'$'}Companion;->a($BUILDER${"Ljava/util/Map;"}$INLINE;)V
        move-wide/from16 v2, p3
        invoke-static {v1, v2, v3}, $INLINE${'$'}Companion;->b(${BUILDER}J)V
        return-void
    """)
    uiBridge("resizeModifier", 3, """
        check-cast p0, Landroidx/compose/ui/Modifier;
        invoke-static {}, $CHAT_UI->positionCallback()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Lkotlin/jvm/functions/Function1;
        invoke-static {p0, v0}, Landroidx/compose/ui/layout/OnGloballyPositionedModifierKt;->a(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;)Landroidx/compose/ui/Modifier;
        move-result-object p0
        return-object p0
    """)
    val attached = classDefBy("Landroidx/compose/ui/layout/LayoutCoordinates;").methods.single {
        it.parameterTypes.isEmpty() && it.returnType == "Z"
    }
    uiBridge("chatBounds", 8, """
        check-cast p0, Landroidx/compose/ui/layout/LayoutCoordinates;
        invoke-interface {p0}, ${attached.smaliReference}
        move-result v0
        if-eqz v0, :detached
        const/4 v0, 0x1
        invoke-static {p0, v0}, Landroidx/compose/ui/layout/LayoutCoordinatesKt;->b(Landroidx/compose/ui/layout/LayoutCoordinates;Z)Landroidx/compose/ui/geometry/Rect;
        move-result-object v0
        const/4 v1, 0x4
        new-array v1, v1, [F
        iget v2, v0, Landroidx/compose/ui/geometry/Rect;->a:F
        const/4 v3, 0x0
        aput v2, v1, v3
        iget v2, v0, Landroidx/compose/ui/geometry/Rect;->b:F
        const/4 v3, 0x1
        aput v2, v1, v3
        iget v2, v0, Landroidx/compose/ui/geometry/Rect;->c:F
        const/4 v3, 0x2
        aput v2, v1, v3
        iget v2, v0, Landroidx/compose/ui/geometry/Rect;->d:F
        const/4 v3, 0x3
        aput v2, v1, v3
        return-object v1
        :detached
        const/4 v0, 0x0
        return-object v0
    """)
    val chatScreen = mutableClassDefBy("${COMMUNITY}app/ui/overlayplayerend/live/streaming/chat/StreamingChatScreenKt;")
        .methods.single { it.name == "c" && it.parameterTypes.first().toString() == "Landroidx/compose/ui/Modifier;" }
    chatScreen.addInstructions(0, """
        invoke-static/range {p0 .. p0}, $CHAT_UI->resizeModifier(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p0
        check-cast p0, Landroidx/compose/ui/Modifier;
    """.trimIndent())

    val nickname = mutableClassDefBy("${COMMUNITY}ui/common/ui/chat/message/streaming/util/StreamingNicknameKt;")
    val header = nickname.methods.single { it.returnType == "V" && MESSAGE in it.parameterTypeNames }
    check(header.localRegisterCount >= 5)
    val args = listOf(BUILDER, MESSAGE, NICK_STYLE, "Landroidx/compose/ui/unit/Density;", "Ljava/util/Map;")
        .map { header.parameterRegister(header.parameterTypeNames.indexOf(it)) }
    header.addInstructions(0, args.mapIndexed { i, register -> "move-object/from16 v$i, p$register" }.joinToString("\n") +
        "\ninvoke-static/range {v0 .. v4}, $CHAT_UI->appendHeader(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Map;)V")
    val badges = nickname.methods.single { it.name == "c" && it.parameterTypes.size == 19 }
    val textCall = badges.implementation!!.instructions.withIndex().first {
        it.value.getReference<MethodReference>()?.let { ref -> ref.definingClass == BUILDER && ref.name == "f" } == true
    }
    val nameRegister = (textCall.value as FiveRegisterInstruction).registerD
    badges.addInstructions(textCall.index, """
        invoke-static/range {v$nameRegister .. v$nameRegister}, $CHAT_UI->nicknameText(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$nameRegister
    """.trimIndent())
    val getterHooks = mapOf(
        "$STATUS->${if (current) "t" else "m"}" to Pair("roleBadge", "Ljava/lang/String;"),
        "$PROPERTY${'$'}Subscription;->c" to Pair("subscriptionBadge", "Ljava/lang/Object;"),
        "$PROPERTY${'$'}DonationRanking;->a" to Pair("donationBadge", "Ljava/lang/Object;"),
        "$STATUS->${if (current) "i" else "e"}" to Pair("activityBadges", "Ljava/util/List;")
    )
    val getterCalls = badges.implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        val ref = instruction.getReference<MethodReference>() ?: return@mapNotNull null
        val hook = getterHooks["${ref.definingClass}->${ref.name}"] ?: return@mapNotNull null
        Triple(index, ref.returnType, hook)
    }
    check(getterCalls.size == 4)
    getterCalls.reversed().forEach { (index, type, hook) ->
        val register = (badges.implementation!!.instructions[index + 1] as OneRegisterInstruction).registerA
        badges.addInstructions(index + 2, """
            invoke-static/range {v$register .. v$register}, $CHAT_UI->${hook.first}(${hook.second})${hook.second}
            move-result-object v$register
            check-cast v$register, $type
        """.trimIndent())
    }
    val verified = badges.parameterRegister(7)
    val channel = badges.parameterRegister(8)
    val verifiedType = badges.parameterTypeNames[7]
    val verifiedHook = if (verifiedType == "Z") """
        invoke-static/range {p$verified .. p$verified}, $CHAT_UI->verifiedBadge(Z)Z
        move-result p$verified
    """ else {
        check(verifiedType == "${COMMUNITY}core/base/entity/VerifiedMarkType;")
        """
        invoke-static/range {p$verified .. p$verified}, $CHAT_UI->verifiedMark(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p$verified
        check-cast p$verified, $verifiedType
        """
    }
    badges.addInstructions(0, """
        $verifiedHook
        invoke-static/range {p$channel .. p$channel}, $CHAT_UI->channelBadges(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p$channel
        check-cast p$channel, Lkotlinx/collections/immutable/ImmutableList;
    """.trimIndent())
    addChatInputButtonHooks()
}

private fun BytecodePatchContext.addChatInputButtonHooks() {
    val owner = mutableClassDefBy("${COMMUNITY}ui/common/ui/overlayplayerend/chat/StreamingChatTextFieldKt;")
    val input = owner.methods.single { it.name == "a" && it.returnType == "V" }
    val calls = input.implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
        instruction.getReference<MethodReference>()?.let { Triple(index, instruction, it) }
    }
    val semantic = "${COMMUNITY}core/ui/ui/image/SemanticImageKt;"
    val profile = calls.single { it.third.definingClass == semantic && it.third.name == "e" }
    val emoji = calls.single { it.third.definingClass == semantic && it.third.name == "c" }
    val visibilityName = if (packageMetadata.versionName in listOf("3.14.0", "3.14.10")) "g" else "f"
    val visibility = calls.filter {
        it.third.definingClass == "Landroidx/compose/animation/AnimatedVisibilityKt;" && it.third.name == visibilityName
    }
    check(visibility.size == 2 && visibility.first().first > emoji.first) { "Donation and send button visibility calls were not found" }
    val targets = listOf(profile, emoji, visibility.first())
    val hooks = listOf("showChatProfileButton", "showChatEmojiButton", "showChatDonationButton")
    for ((kind, call) in targets.withIndex()) {
        val (index, instruction, reference) = call
        val original = classDefBy(reference.definingClass).methods.single { it.smaliReference == reference.smaliReference }
        val words = original.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
        val composer = original.parameterRegister(original.parameterTypeNames.indexOf("Landroidx/compose/runtime/Composer;"))
        val wrapper = MutableMethod(ImmutableMethod(
            owner.type, "sChzzkInputButton$kind", original.parameters, "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(words + 2, emptyList(), emptyList(), emptyList())
        ))
        val body = if (kind == 2) {
            check(original.parameterTypeNames.first() == "Z" && words == 9 && composer == 6)
            // Native visibility uses the second Compose change slot (0x70).
            """
                invoke-static {p0}, $CHAT_UI->${hooks[kind]}(Z)Z
                move-result p0
                and-int/lit8 p7, p7, -0x71
                invoke-static/range {p0 .. p${words - 1}}, ${original.smaliReference}
                return-void
            """
        } else """
            move-object/from16 v1, p$composer
            const v0, ${0x53434950 + kind}
            invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->W(I)V
            invoke-static {}, $CHAT_UI->${hooks[kind]}()Z
            move-result v0
            if-eqz v0, :done
            invoke-static/range {p0 .. p${words - 1}}, ${original.smaliReference}
            :done
            invoke-interface {v1}, Landroidx/compose/runtime/Composer;->Q()V
            return-void
        """
        wrapper.addInstructions(0, body.trimIndent())
        owner.methods.add(wrapper)
        check(instruction is RegisterRangeInstruction && instruction.registerCount == words)
        input.replaceInstruction(index,
            "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + words - 1}}, ${wrapper.smaliReference}")
    }
}
