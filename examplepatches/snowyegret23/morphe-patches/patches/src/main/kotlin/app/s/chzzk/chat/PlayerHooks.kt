package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val PLAYER = "Lcom/naver/prismplayer/player/PrismPlayer;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val BUTTONS = "${COMMUNITY}core/feature/feature/player/ui/LivePlayerButtonsKt;"

internal val playerResources = resourcePatch {
    execute {
        get("res/drawable/s_chzzk_live_catchup.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#00000000" android:strokeColor="#FFFFFFFF" android:strokeWidth="1.6"
                    android:pathData="M12,3 A9,9 0,1 1,12,21 A9,9 0,1 1,12,3 M12,7 A5,5 0,1 1,12,17 A5,5 0,1 1,12,7"/>
                <path android:fillColor="#FFFFFFFF" android:pathData="M12,10 A2,2 0,1 1,12,14 A2,2 0,1 1,12,10"/>
            </vector>
        """.trimIndent())
    }
}

internal fun BytecodePatchContext.addPlayerHooks() {
    val model = "${COMMUNITY}core/feature/feature/player/BasePlayerViewModel;"
    val context = "Lcom/naver/prismplayer/ui/PrismUiContext;"
    val media = "Lcom/naver/prismplayer/Media;"
    uiBridge("seekToLive", 4, """
        check-cast p0, $model
        invoke-virtual {p0}, $model->R()$context
        move-result-object v0
        if-eqz v0, :unavailable
        invoke-virtual {v0}, $context->w()$PLAYER
        move-result-object v0
        if-eqz v0, :unavailable
        invoke-interface {v0}, $PLAYER->isPlayingAd()Z
        move-result v1
        if-nez v1, :unavailable
        invoke-interface {v0}, $PLAYER->getMedia()$media
        move-result-object v1
        if-eqz v1, :unavailable
        invoke-virtual {v1}, $media->z()Z
        move-result v1
        if-eqz v1, :unavailable
        invoke-static {v0}, Lcom/naver/prismplayer/player/PrismPlayerCompatKt;->h($PLAYER)Z
        move-result v1
        if-eqz v1, :unavailable
        invoke-interface {v0}, $PLAYER->play()Z
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, 0x0
        return v0
    """)
    val semantic = classDefBy("${COMMUNITY}core/ui/ui/image/SemanticImageKt;").methods.single { it.name == "c" }
    uiBridge("renderCatchUp", 24, """
        move-object/from16 v13, p1
        check-cast v13, $COMPOSER
        const v0, 0x53434355
        invoke-interface {v13, v0}, $COMPOSER->W(I)V
        invoke-static {}, $CHAT_UI->showCatchUp()Z
        move-result v0
        if-eqz v0, :done
        invoke-static {}, $CHAT_UI->catchUpIcon()I
        move-result v0
        if-eqz v0, :done
        const/4 v1, 0x0
        invoke-static {v0, v1, v13}, Landroidx/compose/ui/res/PainterResources_androidKt;->a(IILandroidx/compose/runtime/Composer;)Landroidx/compose/ui/graphics/painter/Painter;
        move-result-object v0
        const-string v1, "실시간 따라잡기"
        new-instance v2, Landroidx/compose/ui/graphics/Color;
        const-wide v9, 0xffffffff00000000L
        invoke-direct {v2, v9, v10}, Landroidx/compose/ui/graphics/Color;-><init>(J)V
        invoke-static/range {p0 .. p0}, $CHAT_UI->catchUpClick(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v3
        check-cast v3, Lkotlin/jvm/functions/Function0;
        sget-object v4, Landroidx/compose/ui/Modifier${'$'}Companion;->Z:Landroidx/compose/ui/Modifier${'$'}Companion;
        const/4 v5, 0x0
        const/4 v6, 0x0
        new-instance v7, Landroidx/compose/foundation/layout/PaddingValuesImpl;
        const/high16 v8, 0x40a00000
        move v9, v8
        move v10, v8
        move v11, v8
        invoke-direct/range {v7 .. v11}, Landroidx/compose/foundation/layout/PaddingValuesImpl;-><init>(FFFF)V
        const/high16 v8, 0x41c00000
        const/4 v9, 0x0
        const/4 v10, 0x0
        const/4 v11, 0x0
        const/4 v12, 0x0
        const v14, 113246216
        const/4 v15, 0x0
        const/16 v16, 7776
        invoke-static/range {v0 .. v16}, ${semantic.smaliReference}
        :done
        invoke-interface {v13}, $COMPOSER->Q()V
        return-void
    """)
    val buttons = mutableClassDefBy(BUTTONS)
    val fullscreen = buttons.methods.single { it.name == "g" }
    val catchUp = MutableMethod(ImmutableMethod(buttons.type, "sChzzkCatchUp", fullscreen.parameters,
        "V", fullscreen.accessFlags, emptySet(), emptySet(),
        ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    catchUp.addInstructions(0, """
        invoke-static {p1, p2}, $CHAT_UI->renderCatchUp(Ljava/lang/Object;Ljava/lang/Object;)V
        return-void
    """.trimIndent())
    buttons.methods.add(catchUp)
    var added = 0
    classDefForEach { type ->
        if (!type.type.startsWith("${COMMUNITY}app/ui/overlayplayerend/live/")) return@classDefForEach
        for (method in type.methods) {
            val calls = method.implementation?.instructions?.withIndex()?.filter {
                it.value.getReference<MethodReference>()?.smaliReference == fullscreen.smaliReference
            }.orEmpty()
            if (calls.isEmpty()) continue
            val mutable = mutableClassDefBy(type).methods.single { it == method }
            calls.reversed().forEach { (index, instruction) ->
                val call = if (instruction is RegisterRangeInstruction) {
                    "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}}"
                } else {
                    instruction as FiveRegisterInstruction
                    "invoke-static {v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE}, v${instruction.registerF}, v${instruction.registerG}}"
                }
                mutable.addInstructions(index, "$call, ${catchUp.smaliReference}")
                added++
            }
        }
    }
    check(added >= 2) { "Live player fullscreen controls were not found" }
    for ((name, hook) in mapOf("c" to "hideCast", "e" to "hideClip", "k" to "hideShare")) {
        val button = buttons.methods.single { it.name == name }
        check(button.localRegisterCount > 0)
        button.addInstructionsWithLabels(0, """
            invoke-static {}, $CHAT_UI->$hook()Z
            move-result v0
            if-eqz v0, :original
            return-void
            :original
            nop
        """.trimIndent())
    }
    addPlayerMenuEntry()
}

private fun BytecodePatchContext.addPlayerMenuEntry() {
    val image = "${COMMUNITY}core/feature/feature/popup/common/Selectable${'$'}Image;"
    val depth = "${COMMUNITY}core/feature/feature/popup/bottomsheet/DepthItem;"
    val parent = "${COMMUNITY}core/feature/feature/popup/bottomsheet/DepthParent;"
    val ctor = classDefBy(image).methods.single { it.name == "<init>" && it.parameterTypes.size == 12 && it.parameterTypes[2] == "Ljava/lang/Integer;" }
    uiBridge("addPlayerSettings", 15, """
        new-instance v0, $image
        const-string v1, "s-chzzk-settings"
        const/4 v2, 0x0
        const/4 v3, 0x0
        const-string v4, "Morphe 설정"
        const/4 v5, 0x0
        const/4 v6, 0x0
        const/4 v7, 0x0
        const/4 v8, 0x0
        const/4 v9, 0x0
        const/4 v10, 0x0
        invoke-static {}, $CHAT_UI->playerSettingsClick()Ljava/lang/Object;
        move-result-object v11
        check-cast v11, Lkotlin/jvm/functions/Function1;
        const v12, 16302
        invoke-direct/range {v0 .. v12}, ${ctor.smaliReference}
        new-instance v1, $depth
        const/4 v2, 0x0
        const/4 v3, 0x6
        invoke-direct {v1, v0, v2, v3}, $depth-><init>($image${parent}I)V
        const/4 v0, 0x0
        invoke-interface {p0, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V
        return-void
    """)
    val menu = mutableClassDefBy("Lq1;").methods.single { it.name == "invoke" }
    val call = menu.implementation!!.instructions.withIndex().single {
        it.value.getReference<MethodReference>()?.let { ref ->
            ref.name == "<init>" && ref.definingClass == "${COMMUNITY}core/feature/feature/popup/bottomsheet/BottomSheetModelBase${'$'}DepthSelect;"
        } == true
    }
    val list = (call.value as FiveRegisterInstruction).registerD
    menu.addInstructions(call.index, "invoke-static/range {v$list .. v$list}, $CHAT_UI->addPlayerSettings(Ljava/util/List;)V")
}
