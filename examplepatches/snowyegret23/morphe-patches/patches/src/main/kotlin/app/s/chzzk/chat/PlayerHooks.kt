package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.smaliReference
import app.s.chzzk.shared.chzzkType
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val PLAYER = "Lcom/naver/prismplayer/player/PrismPlayer;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private val BytecodePatchContext.BUTTONS get() = chzzkType("${COMMUNITY}core/feature/feature/player/ui/LivePlayerButtonsKt;")

internal val playerResources = resourcePatch {
    execute {
        get("res/drawable/s_chzzk_live_rewind.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#00000000" android:strokeColor="#FFFFFFFF" android:strokeWidth="1.8"
                    android:strokeLineCap="round" android:strokeLineJoin="round"
                    android:pathData="M5,8 A8,8 0,1 1,4,15 M5,3 L5,8 L10,8 M12,8 L12,12 L15,14"/>
            </vector>
        """.trimIndent())
        get("res/drawable/s_chzzk_live_catchup.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#00000000" android:strokeColor="#FFFFFFFF" android:strokeWidth="1.6"
                    android:pathData="M12,3 A9,9 0,1 1,12,21 A9,9 0,1 1,12,3 M12,7 A5,5 0,1 1,12,17 A5,5 0,1 1,12,7"/>
                <path android:fillColor="#FFFFFFFF" android:pathData="M12,10 A2,2 0,1 1,12,14 A2,2 0,1 1,12,10"/>
            </vector>
        """.trimIndent())
        // TV 1.5.0 removes the unused device drawables from the upstream resources.
        if (packageMetadata.versionName == "1.5.0") {
            for ((name, paths) in mapOf(
                "pc" to listOf("M3 6.38c0-1.66 1.35-3 3-3h12c1.65 0 3 1.34 3 3v7.02c0 1.66-1.35 3.01-3 3.01H6c-1.65 0-3-1.35-3-3V6.37Zm3-1.3h12c0.71 0 1.3 0.58 1.3 1.3v7.02c0 0.72-0.59 1.31-1.3 1.31H6c-0.71 0-1.3-0.59-1.3-1.3V6.37c0-0.72 0.59-1.3 1.3-1.3Z", "M8.44 19.02c-0.47 0-0.85 0.39-0.85 0.86 0 0.46 0.38 0.85 0.85 0.85h8.03c0.46 0 0.85-0.39 0.85-0.86 0-0.46-0.39-0.85-0.85-0.85H8.44Z"),
                "phone" to listOf("M14 17.15c0.47 0 0.85 0.38 0.85 0.85s-0.38 0.85-0.85 0.85h-4c-0.47 0-0.85-0.38-0.85-0.85s0.38-0.85 0.85-0.85h4Z", "M14.55 2.1c0.54 0 1 0 1.38 0.03 0.4 0.03 0.77 0.1 1.13 0.29 0.55 0.27 1 0.72 1.27 1.26 0.19 0.37 0.26 0.74 0.29 1.13 0.03 0.38 0.03 0.85 0.03 1.39v11.78c0 0.55 0 1.01-0.03 1.39-0.03 0.39-0.1 0.77-0.29 1.13-0.28 0.54-0.72 0.99-1.27 1.26-0.36 0.19-0.74 0.26-1.13 0.3-0.37 0.02-0.84 0.02-1.38 0.02h-5.1c-0.55 0-1.01 0-1.39-0.03-0.39-0.03-0.77-0.1-1.13-0.29-0.54-0.27-0.99-0.72-1.27-1.26-0.18-0.36-0.25-0.74-0.28-1.13-0.03-0.38-0.03-0.84-0.03-1.39V6.2c0-0.54 0-1 0.03-1.39 0.03-0.39 0.1-0.76 0.28-1.13C5.94 3.14 6.4 2.7 6.93 2.42 7.3 2.23 7.67 2.16 8.06 2.13 8.44 2.1 8.9 2.1 9.45 2.1h5.1Zm-5.1 1.7c-0.57 0-0.96 0-1.25 0.02C7.92 3.85 7.79 3.9 7.7 3.93 7.53 4.02 7.4 4.14 7.28 4.3l-0.1 0.17c-0.04 0.08-0.08 0.21-0.1 0.5C7.04 5.24 7.04 5.62 7.04 6.2v11.78c0 0.57 0 0.96 0.02 1.25 0.03 0.28 0.07 0.41 0.1 0.5l0.1 0.16c0.12 0.15 0.26 0.27 0.43 0.36 0.09 0.04 0.22 0.08 0.5 0.1 0.3 0.03 0.68 0.03 1.25 0.03h5.1c0.57 0 0.95 0 1.25-0.02 0.28-0.03 0.41-0.07 0.5-0.11 0.22-0.12 0.4-0.3 0.52-0.52 0.04-0.09 0.08-0.22 0.1-0.5 0.03-0.3 0.03-0.68 0.03-1.25V6.2c0-0.57 0-0.95-0.03-1.25L16.9 4.77c-0.01-0.11-0.03-0.18-0.05-0.24l-0.03-0.07c-0.12-0.23-0.3-0.41-0.53-0.53-0.08-0.04-0.21-0.08-0.5-0.1C15.5 3.8 15.13 3.8 14.56 3.8h-5.1Z"),
                "ios" to listOf("M8.96 21.95c1.28 0 1.84-0.89 3.43-0.89 1.6 0 1.98 0.85 3.4 0.85 1.41 0 2.32-1.32 3.2-2.63 1-1.49 1.4-2.95 1.44-3.02-0.1-0.02-2.77-1.15-2.77-4.31 0-2.74 2.11-3.98 2.23-4.07-1.4-2.07-3.52-2.11-4.1-2.11-1.55 0-2.83 0.98-3.64 0.98-0.87 0-2.01-0.92-3.37-0.92-2.59 0-5.2 2.2-5.2 6.34 0 2.58 0.97 5.3 2.16 7.07 1.02 1.5 1.92 2.72 3.22 2.72v-0.01Zm3.29-16.43c0.93 0 2.1-0.65 2.8-1.51 0.63-0.8 1.1-1.9 1.1-3 0-0.14-0.02-0.3-0.05-0.4-1.04 0.04-2.3 0.71-3.04 1.62-0.6 0.7-1.14 1.78-1.14 2.89 0 0.16 0.02 0.32 0.05 0.38l0.28 0.02Z"),
            )) {
                get("res/drawable/s_chzzk_device_$name.xml").writeText("""
                    <vector xmlns:android="http://schemas.android.com/apk/res/android"
                        android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                        ${paths.joinToString("\n") { "<path android:fillColor=\"#FFFFFFFF\" android:fillType=\"evenOdd\" android:pathData=\"$it\"/>" }}
                    </vector>
                """.trimIndent())
            }
        }
    }
}

internal fun BytecodePatchContext.addSeekHooks() {
    val model = chzzkType("${COMMUNITY}core/feature/feature/player/BasePlayerViewModel;")
    val context = "Lcom/naver/prismplayer/ui/PrismUiContext;"
    val media = "Lcom/naver/prismplayer/Media;"
    for ((hook, position) in mapOf("seekToLive" to "catchUpPosition", "seekBack" to "rewindPosition")) {
        uiBridge(hook, 9, """
            if-eqz p0, :unavailable
            check-cast p0, $model
            invoke-virtual {p0}, $model->${when (packageMetadata.versionName) { "1.5.0" -> "u"; "1.3.0", "1.4.0" -> "y"; "3.18.0" -> "I"; "3.17.0" -> "Q"; else -> "R" }}()$context
            move-result-object v0
            if-eqz v0, :unavailable
            invoke-virtual {v0}, $context->${if (packageMetadata.versionName in setOf("3.17.0", "3.18.0", "1.4.0", "1.5.0")) "y" else "w"}()$PLAYER
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
            invoke-interface {v0}, $PLAYER->getCurrentPosition()J
            move-result-wide v2
            invoke-interface {v0}, $PLAYER->getDuration()J
            move-result-wide v4
            invoke-static {v2, v3, v4, v5}, $CHAT_UI->$position(JJ)J
            move-result-wide v4
            const-wide/16 v6, 0x0
            cmp-long v1, v4, v6
            if-ltz v1, :no_seek
            invoke-interface {v0, v4, v5}, $PLAYER->seekTo(J)Z
            move-result v1
            if-eqz v1, :unavailable
            invoke-interface {v0}, $PLAYER->play()Z
            const/4 v0, 0x1
            return v0
            :no_seek
            const-wide/16 v6, -0x2
            cmp-long v1, v4, v6
            if-nez v1, :unavailable
            const/4 v0, 0x2
            return v0
            :unavailable
            const/4 v0, 0x0
            return v0
        """)
    }
}

internal fun BytecodePatchContext.addPlayerHooks() {
    addSeekHooks()
    val semantic = classDefBy(chzzkType("${COMMUNITY}core/ui/ui/image/SemanticImageKt;")).methods.single { it.name == "c" }
    val modifierField = if (packageMetadata.versionName in setOf("3.16.0", "3.17.0", "3.18.0")) "V" else "Z"
    for (rewind in listOf(true, false)) {
        val action = if (rewind) "Rewind" else "CatchUp"
        val prefix = if (rewind) "rewind" else "catchUp"
        uiBridge("render$action", 24, """
            move-object/from16 v13, p1
            check-cast v13, $COMPOSER
            const v0, ${if (rewind) 0x53435257 else 0x53434355}
            invoke-interface {v13, v0}, $COMPOSER->W(I)V
            invoke-static {}, $CHAT_UI->show$action()Z
            move-result v0
            if-eqz v0, :done
            invoke-static {}, $CHAT_UI->${prefix}Icon()I
            move-result v0
            if-eqz v0, :done
            const/4 v1, 0x0
            invoke-static {v0, v1, v13}, Landroidx/compose/ui/res/PainterResources_androidKt;->a(IILandroidx/compose/runtime/Composer;)Landroidx/compose/ui/graphics/painter/Painter;
            move-result-object v0
            const-string v1, "${if (rewind) "라이브 되감기" else "실시간 따라잡기"}"
            new-instance v2, Landroidx/compose/ui/graphics/Color;
            const-wide v9, 0xffffffff00000000L
            invoke-direct {v2, v9, v10}, Landroidx/compose/ui/graphics/Color;-><init>(J)V
            invoke-static/range {p0 .. p0}, $CHAT_UI->${prefix}Click(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v3
            check-cast v3, Lkotlin/jvm/functions/Function0;
            sget-object v4, Landroidx/compose/ui/Modifier${'$'}Companion;->$modifierField:Landroidx/compose/ui/Modifier${'$'}Companion;
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
    }
    val buttons = mutableClassDefBy(BUTTONS)
    val fullscreen = buttons.methods.single { it.name == "g" }
    val controls = MutableMethod(ImmutableMethod(buttons.type, "sChzzkPlayerControls", fullscreen.parameters,
        "V", fullscreen.accessFlags, emptySet(), emptySet(),
        ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    controls.addInstructions(0, """
        invoke-static {p1, p2}, $CHAT_UI->renderRewind(Ljava/lang/Object;Ljava/lang/Object;)V
        invoke-static {p1, p2}, $CHAT_UI->renderCatchUp(Ljava/lang/Object;Ljava/lang/Object;)V
        return-void
    """.trimIndent())
    buttons.methods.add(controls)
    var added = 0
    classDefForEach { type ->
        if (packageMetadata.versionName != "3.18.0" && !type.type.startsWith("${COMMUNITY}app/ui/overlayplayerend/live/")) return@classDefForEach
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
                mutable.addInstructions(index, "$call, ${controls.smaliReference}")
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
    val image = chzzkType("${COMMUNITY}core/feature/feature/popup/common/Selectable${'$'}Image;")
    val depth = chzzkType("${COMMUNITY}core/feature/feature/popup/bottomsheet/DepthItem;")
    val parent = chzzkType("${COMMUNITY}core/feature/feature/popup/bottomsheet/DepthParent;")
    val current = packageMetadata.versionName in setOf("3.16.0", "3.17.0", "3.18.0")
    val ctor = classDefBy(image).methods.single {
        it.name == "<init>" && it.parameterTypes.size == (if (current) 13 else 12) && it.parameterTypes[2] == "Ljava/lang/Integer;"
    }
    val callback = if (current) 12 else 11
    val depthConstructor = if (current) """
        const/4 v3, 0x0
        const/4 v4, 0x6
        invoke-direct {v1, v0, v2, v3, v4}, $depth-><init>(${image}Z${parent}I)V
    """ else """
        const/4 v3, 0x6
        invoke-direct {v1, v0, v2, v3}, $depth-><init>($image${parent}I)V
    """
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
        ${if (current) "const/4 v11, 0x0" else ""}
        invoke-static {}, $CHAT_UI->playerSettingsClick()Ljava/lang/Object;
        move-result-object v$callback
        check-cast v$callback, Lkotlin/jvm/functions/Function1;
        const v${callback + 1}, ${if (current) 32686 else 16302}
        invoke-direct/range {v0 .. v${callback + 1}}, ${ctor.smaliReference}
        new-instance v1, $depth
        const/4 v2, 0x0
        $depthConstructor
        const/4 v0, 0x0
        invoke-interface {p0, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V
        return-void
    """)
    val menuOwner = if (packageMetadata.versionName == "3.18.0") "La4;" else if (packageMetadata.versionName == "3.17.0") "Lz1;" else if (packageMetadata.versionName in listOf("3.15.0", "3.15.2", "3.16.0")) "Lt1;" else "Lq1;"
    val menu = mutableClassDefBy(menuOwner).methods.single { it.name == if (packageMetadata.versionName in setOf("3.17.0", "3.18.0")) "a" else "invoke" }
    val call = menu.implementation!!.instructions.withIndex().single {
        it.value.getReference<MethodReference>()?.let { ref ->
            ref.name == "<init>" && ref.definingClass == chzzkType("${COMMUNITY}core/feature/feature/popup/bottomsheet/BottomSheetModelBase${'$'}DepthSelect;")
        } == true
    }
    val list = (call.value as FiveRegisterInstruction).registerD
    menu.addInstructions(call.index, "invoke-static/range {v$list .. v$list}, $CHAT_UI->addPlayerSettings(Ljava/util/List;)V")
}
