package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
    val layoutWidth = mutableClassDefBy("Lh7;").methods.single { it.name == "invoke" }
    check(layoutWidth.localRegisterCount >= 4)
    layoutWidth.addInstructionsWithLabels(0, """
        iget v0, p0, Lh7;->Z:I
        const/4 v1, 0x4
        if-eq v0, v1, :chat_width
        const/4 v1, 0x5
        if-eq v0, v1, :chat_width
        const/4 v1, 0x6
        if-eq v0, v1, :video_width
        goto :original_width
        :chat_width
        iget-object v0, p0, Lh7;->a0:Landroidx/compose/runtime/State;
        invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Landroidx/compose/ui/unit/Dp;
        iget v0, v0, Landroidx/compose/ui/unit/Dp;->Z:F
        iget-object v1, p0, Lh7;->b0:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->Z:F
        add-float/2addr v0, v1
        iget-object v1, p0, Lh7;->c0:Landroidx/compose/runtime/MutableState;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->Z:F
        const/high16 v2, 0x42c00000
        sub-float/2addr v1, v2
        const/4 v3, 0x0
        invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F
        move-result v1
        invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F
        move-result v0
        goto :width_result
        :video_width
        iget-object v0, p0, Lh7;->c0:Landroidx/compose/runtime/MutableState;
        invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Landroidx/compose/ui/unit/Dp;
        iget v0, v0, Landroidx/compose/ui/unit/Dp;->Z:F
        iget-object v1, p0, Lh7;->a0:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Ljava/lang/Boolean;
        invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v1
        if-eqz v1, :width_result
        iget-object v1, p0, Lh7;->b0:Landroidx/compose/runtime/State;
        invoke-interface {v1}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, Landroidx/compose/ui/unit/Dp;
        iget v1, v1, Landroidx/compose/ui/unit/Dp;->Z:F
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
    uiBridge("appendDevice", 20, """
        move/from16 v1, p2
        const/4 v0, 0x1
        if-ne v1, v0, :mobile
        const v1, 0x7f080496
        goto :icon
        :mobile
        const/4 v0, 0x3
        if-eq v1, v0, :ios
        const v1, 0x7f080497
        goto :icon
        :ios
        const v1, 0x7f08045a
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
        invoke-direct/range {v0 .. v8}, ${iconConstructor.smaliReference}
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
    uiBridge("chatBounds", 8, """
        check-cast p0, Landroidx/compose/ui/layout/LayoutCoordinates;
        invoke-interface {p0}, Landroidx/compose/ui/layout/LayoutCoordinates;->e()Z
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
        "$STATUS->m" to Pair("roleBadge", "Ljava/lang/String;"),
        "$PROPERTY${'$'}Subscription;->c" to Pair("subscriptionBadge", "Ljava/lang/Object;"),
        "$PROPERTY${'$'}DonationRanking;->a" to Pair("donationBadge", "Ljava/lang/Object;"),
        "$STATUS->e" to Pair("activityBadges", "Ljava/util/List;")
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
    badges.addInstructions(0, """
        invoke-static/range {p$verified .. p$verified}, $CHAT_UI->verifiedBadge(Z)Z
        move-result p$verified
        invoke-static/range {p$channel .. p$channel}, $CHAT_UI->channelBadges(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p$channel
        check-cast p$channel, Lkotlinx/collections/immutable/ImmutableList;
    """.trimIndent())
}
