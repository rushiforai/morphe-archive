package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val BUILDER = "Landroidx/compose/ui/text/AnnotatedString${'$'}Builder;"
private const val SPAN = "Landroidx/compose/ui/text/SpanStyle;"
private const val STATUS = "${COMMUNITY}data/core/entity/user/streaming/StreamingUserStatus;"
private const val PROPERTY = "${COMMUNITY}data/core/entity/user/streaming/StreamingProperty"
private const val MESSAGE = "${COMMUNITY}ui/common/ui/chat/message/streaming/entity/StreamingChatMessage;"
private const val NICK_STYLE = "${COMMUNITY}ui/common/ui/chat/message/streaming/designstyle/StreamingMessageDesignStyle${'$'}NicknameStyleInfo;"
private const val INLINE = "${COMMUNITY}core/ui/ui/text/util/InlineTextContentBox"

internal fun BytecodePatchContext.addTvChatUiHooks() {
    val extra = "${COMMUNITY}data/core/entity/chat/extra/StreamingChatMessageExtra;"
    check(classDefBy(extra).methods.any { it.name == "g" && it.returnType == "Ljava/lang/String;" })
    uiBridge("deviceType", 1, """
        check-cast p0, $MESSAGE
        iget-object p0, p0, $MESSAGE->d:$extra
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
        invoke-virtual {v1, v0}, $BUILDER->j($SPAN)I
        move-result v0
        move-object/from16 v2, p1
        invoke-virtual {v1, v2}, $BUILDER->e(Ljava/lang/String;)V
        invoke-virtual {v1, v0}, $BUILDER->g(I)V
        return-void
    """)
    val icon = "${COMMUNITY}core/ui/ui/text/util/InlineTextContentIconBox;"
    val iconConstructor = classDefBy(icon).methods.single { it.name == "<init>" }
    check(iconConstructor.parameterTypes.size == 7)
    val pcIcon = "0x7f08049d"
    val mobileIcon = "0x7f08049e"
    val iosIcon = "0x7f080461"
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
        invoke-static {v8, v10}, Landroidx/compose/foundation/layout/PaddingKt;->a(FI)Landroidx/compose/foundation/layout/PaddingValuesImpl;
        move-result-object v6
        new-instance v7, Landroidx/compose/ui/graphics/BlendModeColorFilter;
        const-wide v8, 0xff9399a500000000L
        const/4 v10, 0x5
        invoke-direct {v7, v8, v9, v10}, Landroidx/compose/ui/graphics/BlendModeColorFilter;-><init>(JI)V
        const/4 v8, 0x0
        const/4 v9, 0x0
        invoke-direct/range {v0 .. v9}, ${iconConstructor.smaliReference}
        move-object/from16 v1, p0
        check-cast v1, $BUILDER
        move-object/from16 v2, p1
        invoke-static {v1, v2, v0}, $INLINE${'$'}Companion;->a($BUILDER${"Ljava/util/Map;"}$INLINE;)V
        move-wide/from16 v2, p3
        invoke-static {v1, v2, v3}, $INLINE${'$'}Companion;->b(${BUILDER}J)V
        return-void
    """)
    val nickname = mutableClassDefBy("${COMMUNITY}ui/common/ui/chat/message/streaming/util/StreamingNicknameKt;")
    val header = nickname.methods.single { it.returnType == "V" && MESSAGE in it.parameterTypeNames }
    check(header.localRegisterCount >= 5)
    val args = listOf(BUILDER, MESSAGE, NICK_STYLE, "Landroidx/compose/ui/unit/Density;", "Ljava/util/Map;")
        .map { header.parameterRegister(header.parameterTypeNames.indexOf(it)) }
    header.addInstructions(0, args.mapIndexed { i, register -> "move-object/from16 v$i, p$register" }.joinToString("\n") +
        "\ninvoke-static/range {v0 .. v4}, $CHAT_UI->appendHeader(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Map;)V")
    val badges = nickname.methods.single { it.name == "a" && it.parameterTypes.size == 16 }
    // TV resolves the nickname from StreamingUserStatus before replacing its spaces.
    val nameCall = badges.implementation!!.instructions.withIndex().single {
        it.value.getReference<MethodReference>()?.smaliReference == "Ljava/lang/String;->replace(CC)Ljava/lang/String;"
    }
    val nameRegister = (badges.implementation!!.instructions[nameCall.index + 1] as OneRegisterInstruction).registerA
    badges.addInstructions(nameCall.index + 2, """
        invoke-static/range {v$nameRegister .. v$nameRegister}, $CHAT_UI->nicknameText(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$nameRegister
    """.trimIndent())
    val getterHooks = mapOf(
        "$STATUS->p" to Pair("roleBadge", "Ljava/lang/String;"),
        "$PROPERTY${'$'}Subscription;->c" to Pair("subscriptionBadge", "Ljava/lang/Object;"),
        "$PROPERTY${'$'}DonationRanking;->a" to Pair("donationBadge", "Ljava/lang/Object;"),
        "$STATUS->j" to Pair("activityBadges", "Ljava/util/List;")
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
    val verified = badges.parameterRegister(8)
    val channel = badges.parameterRegister(9)
    val verifiedType = badges.parameterTypeNames[8]
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
}
