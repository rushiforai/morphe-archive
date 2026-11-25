package dev.materialtidal.patches.tidal.layout.navbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXPRESSIVE_FACTORY_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS

private val NAVBAR_STYLE_CHOICES = mapOf(
    "Dark Tonal (Recommended)" to 0,
    "Pastel Monet" to 1,
    "Vibrant Contrast" to 2,
)

@Suppress("unused")
val expressiveNavbarPatch = patch(
    name = "M3 navbar & mini-player",
    description = "Replaces TIDAL's bottom bar and mini-player with a floating M3 split-pill navigation dock, detached Search button, and separate floating mini-player card with swipe gestures and progressive backdrop blur.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val colorStyleOption by intOption(
        key = "navbarColorStyle",
        default = 0,
        values = NAVBAR_STYLE_CHOICES,
        title = "Navbar & mini-player style",
        description = "Color palette style for the floating navigation dock and mini-player (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val hideUploadTabOption by booleanOption(
        key = "hideUploadTab",
        default = true,
        title = "Keep 3 core tabs in dock",
        description = "Shows Home, Explore, and Library in the left pill and Search in the detached circle button, hiding the Uploads tab (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val miniPlayerSwipeOption by booleanOption(
        key = "miniPlayerSwipeToSkip",
        default = true,
        title = "Mini-player swipe gestures",
        description = "Swipe the floating mini-player left or right to skip tracks and pull up to expand the full-screen player (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val navbarProgressiveBlurOption by booleanOption(
        key = "navbarProgressiveBlur",
        default = true,
        title = "Progressive dock blur",
        description = "Replaces the solid bottom fade behind the floating navigation dock and mini-player with a frosted progressive blur (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressiveNavbarPatchInstalled" }
            .returnEarly(true)
        configClass.methods.single { it.name == "defaultNavbarColorStyle" }
            .returnEarly(colorStyleOption ?: 0)
        configClass.methods.single { it.name == "defaultHideUploadTab" }
            .returnEarly(hideUploadTabOption ?: true)
        configClass.methods.single { it.name == "defaultMiniPlayerSwipeEnabled" }
            .returnEarly(miniPlayerSwipeOption ?: true)
        configClass.methods.single { it.name == "defaultNavbarProgressiveBlurEnabled" }
            .returnEarly(navbarProgressiveBlurOption ?: true)

        // 2. Discover TIDAL obfuscated Scaffold / TabBar / MiniPlayer types.
        val appScaffoldOuterMatch = AppScaffoldOuterFingerprint.matchSingle()
        val appScaffoldInnerMatch = AppScaffoldInnerFingerprint.matchSingle()
        val shapesClinitMatch = AppScaffoldShapesClinitFingerprint.matchSingle()
        val tabBarMatch = TabBarComposableFingerprint.matchSingle()
        val miniPlayerOuterMatch = MiniPlayerOuterComposableFingerprint.matchSingle()
        val miniPlayerMatch = MiniPlayerComposableFingerprint.matchSingle()
        val sheetStateShowMatch = SheetStateShowFingerprint.matchSingle()
        val sheetAnchorsInvokeMatch = ModalBottomSheetAnchorsInvokeFingerprint.matchSingle()
        val updateAnchorsMatch = AnchoredDraggableStateUpdateAnchorsFingerprint.matchSingle()

        val scaffoldVmType = appScaffoldOuterMatch.method.parameterTypes[0].toString()
        val tabStateType = tabBarMatch.method.parameterTypes[0].toString()
        val function1Type = tabBarMatch.method.parameterTypes[1].toString()
        val miniStateType = miniPlayerMatch.method.parameterTypes[0].toString()
        val mediaStateType = mutableClassDefBy(miniStateType).fields
            .firstOrNull { it.name == "b" }
            ?.type
            ?: throw PatchException("Could not resolve mediaViewState field 'b' in $miniStateType")
        val miniVmClassType = "Lcom/tidal/android/feature/appscaffold/ui/MiniPlayerViewModel;"
        val playerControllerType = mutableClassDefBy(miniVmClassType).fields
            .firstOrNull { it.name == "a" }
            ?.type
            ?: throw PatchException("Could not resolve playerController field 'a' in $miniVmClassType")

        // 3. Implement Function1 (Lbn7;) on ExpressiveViewFactory.
        val factoryClass = mutableClassDefBy(EXPRESSIVE_FACTORY_CLASS)
        if (!factoryClass.interfaces.contains(function1Type)) {
            factoryClass.interfaces.add(function1Type)
        }

        // 4. Populate the 9 native* stubs on ExpressiveScaffoldBridge.
        val bridgeClass = mutableClassDefBy(EXPRESSIVE_BRIDGE_CLASS)

        replaceBridgeMethod(
            bridgeClass,
            "nativeMountAndroidView",
            """
                check-cast p0, $function1Type
                check-cast p1, $function1Type
                check-cast p2, Landroidx/compose/runtime/Composer;
                sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier${'$'}Companion;
                const/4 v1, 0x0
                const/4 v2, 0x1
                const/4 v3, 0x0
                invoke-static { v0, v1, v2, v3 }, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth${'$'}default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;
                move-result-object v1
                move-object v0, p0
                move-object v2, p1
                move-object v3, p2
                const/4 v4, 0x0
                const/4 v5, 0x0
                invoke-static/range { v0 .. v5 }, Landroidx/compose/ui/viewinterop/AndroidView_androidKt;->AndroidView(${function1Type}Landroidx/compose/ui/Modifier;${function1Type}Landroidx/compose/runtime/Composer;II)V
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetSelectedTabName",
            """
                check-cast p0, $tabStateType
                iget-object v0, p0, $tabStateType->a:Lcom/tidal/android/feature/appscaffold/ui/TabBarContract${'$'}TabType;
                if-nez v0, :has_tab
                const-string v0, "HOME"
                return-object v0
                :has_tab
                invoke-virtual { v0 }, Lcom/tidal/android/feature/appscaffold/ui/TabBarContract${'$'}TabType;->name()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetTabFlags",
            """
                check-cast p0, $tabStateType
                const/4 v0, 0x0
                iget-boolean v1, p0, $tabStateType->b:Z
                if-eqz v1, :no_upload
                or-int/lit8 v0, v0, 0x1
                :no_upload
                iget-boolean v1, p0, $tabStateType->c:Z
                if-eqz v1, :no_badge
                or-int/lit8 v0, v0, 0x2
                :no_badge
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchTabSelected",
            """
                check-cast p0, $function1Type
                invoke-static { p1 }, Lcom/tidal/android/feature/appscaffold/ui/TabBarContract${'$'}TabType;->valueOf(Ljava/lang/String;)Lcom/tidal/android/feature/appscaffold/ui/TabBarContract${'$'}TabType;
                move-result-object v0
                new-instance v1, Lcom/tidal/android/feature/appscaffold/ui/d${'$'}a;
                invoke-direct { v1, v0 }, Lcom/tidal/android/feature/appscaffold/ui/d${'$'}a;-><init>(Lcom/tidal/android/feature/appscaffold/ui/TabBarContract${'$'}TabType;)V
                invoke-interface { p0, v1 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetMiniPlayerStrings",
            """
                const/4 v0, 0x4
                new-array v0, v0, [Ljava/lang/String;
                check-cast p0, $miniStateType
                iget-object v1, p0, $miniStateType->b:$mediaStateType
                if-eqz v1, :no_media
                iget-object v2, v1, $mediaStateType->a:Ljava/lang/String;
                const/4 v3, 0x0
                aput-object v2, v0, v3
                iget-object v2, v1, $mediaStateType->b:Ljava/lang/String;
                const/4 v3, 0x1
                aput-object v2, v0, v3
                iget-object v2, v1, $mediaStateType->d:Ljava/lang/String;
                const/4 v3, 0x2
                aput-object v2, v0, v3
                :no_media
                iget-object v1, p0, $miniStateType->c:Lcom/tidal/android/feature/appscaffold/ui/MiniPlayerContract${'$'}PlayState;
                if-eqz v1, :no_play_state
                invoke-virtual { v1 }, Lcom/tidal/android/feature/appscaffold/ui/MiniPlayerContract${'$'}PlayState;->name()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x3
                aput-object v2, v0, v3
                :no_play_state
                return-object v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeGetMiniPlayerFlags",
            """
                check-cast p0, $miniStateType
                const/4 v0, 0x0
                iget-object v1, p0, $miniStateType->b:$mediaStateType
                if-eqz v1, :check_skip
                or-int/lit8 v0, v0, 0x1
                iget-boolean v2, v1, $mediaStateType->e:Z
                if-eqz v2, :check_skip
                or-int/lit8 v0, v0, 0x4
                :check_skip
                iget-boolean v1, p0, $miniStateType->d:Z
                if-eqz v1, :done
                or-int/lit8 v0, v0, 0x2
                :done
                return v0
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchMiniPlayerPlayPause",
            """
                check-cast p0, $function1Type
                sget-object v0, Lcom/tidal/android/feature/appscaffold/ui/c${'$'}b;->a:Lcom/tidal/android/feature/appscaffold/ui/c${'$'}b;
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchMiniPlayerNext",
            """
                check-cast p0, $function1Type
                sget-object v0, Lcom/tidal/android/feature/appscaffold/ui/c${'$'}a;->a:Lcom/tidal/android/feature/appscaffold/ui/c${'$'}a;
                invoke-interface { p0, v0 }, $function1Type->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchMiniPlayerPrevious",
            """
                instance-of v0, p0, $miniVmClassType
                if-eqz v0, :done
                check-cast p0, $miniVmClassType
                iget-object v0, p0, $miniVmClassType->a:$playerControllerType
                if-eqz v0, :done
                const/4 v1, 0x0
                invoke-interface { v0, v1 }, $playerControllerType->h(Z)V
                :done
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchMiniPlayerOpenFull",
            """
                check-cast p0, $scaffoldVmType
                sget-object v0, Lcom/tidal/android/feature/appscaffold/ui/b${'$'}b;->a:Lcom/tidal/android/feature/appscaffold/ui/b${'$'}b;
                invoke-interface { p0, v0 }, $scaffoldVmType->c(Lcom/tidal/android/feature/appscaffold/ui/b;)V
                return-void
            """,
        )

        replaceBridgeMethod(
            bridgeClass,
            "nativeDispatchFullPlayerCollapse",
            """
                check-cast p0, $scaffoldVmType
                sget-object v0, Lcom/tidal/android/feature/appscaffold/ui/b${'$'}a;->a:Lcom/tidal/android/feature/appscaffold/ui/b${'$'}a;
                invoke-interface { p0, v0 }, $scaffoldVmType->c(Lcom/tidal/android/feature/appscaffold/ui/b;)V
                return-void
            """,
        )

        // 5. Register AppScaffoldViewModel at AppScaffoldKt.a entry and MiniPlayerViewModel at MiniPlayerKt.b entry.
        appScaffoldOuterMatch.method.let { m ->
            val p0 = m.p0Register
            m.addInstructions(
                0,
                "invoke-static/range { v$p0 .. v$p0 }, $EXPRESSIVE_BRIDGE_CLASS->registerScaffoldViewModel(Ljava/lang/Object;)V",
            )
        }

        miniPlayerOuterMatch.method.let { m ->
            val p0 = m.p0Register
            m.addInstructions(
                0,
                "invoke-static/range { v$p0 .. v$p0 }, $EXPRESSIVE_BRIDGE_CLASS->registerMiniPlayerViewModel(Ljava/lang/Object;)V",
            )
        }

        // 5b. Hook Compose M3 SheetState.show and ModalBottomSheetContent$3$1.invoke-GpV2Q24 so
        //     interactive Mini-Player swipe-up expansion snaps ModalBottomSheet straight to Expanded
        //     without re-running a second slide-up animation from the bottom.
        sheetStateShowMatch.method.let { m ->
            val animateIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/material3/SheetState;" &&
                            it.name == "animateTo\$material3_release\$default"
                    } == true
            }
            if (animateIdx < 0) {
                throw PatchException("Could not find animateTo\$material3_release\$default in SheetState.show")
            }
            val contType = m.parameterTypes[0].toString()
            m.addInstructionsWithLabels(
                animateIdx,
                """
                    invoke-static {}, $EXPRESSIVE_BRIDGE_CLASS->consumePendingInstantSheetSnap()Z
                    move-result v0
                    if-eqz v0, :mt_normal_sheet_show
                    invoke-virtual { v1, v2, v4 }, Landroidx/compose/material3/SheetState;->snapTo${'$'}material3_release(Landroidx/compose/material3/SheetValue;$contType)Ljava/lang/Object;
                    move-result-object v0
                    return-object v0
                    :mt_normal_sheet_show
                    nop
                """.trimIndent(),
            )
        }

        sheetAnchorsInvokeMatch.method.let { m ->
            val agetIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.AGET
            }
            if (agetIdx < 0) {
                throw PatchException("Could not find aget in ModalBottomSheetContent\$3\$1.invoke-GpV2Q24")
            }
            m.addInstructionsWithLabels(
                agetIdx + 1,
                """
                    invoke-static {}, $EXPRESSIVE_BRIDGE_CLASS->isPendingInstantSheetSnap()Z
                    move-result v3
                    if-eqz v3, :mt_keep_anchor_target
                    const/4 v1, 0x3
                    :mt_keep_anchor_target
                    nop
                """.trimIndent(),
            )
        }

        updateAnchorsMatch.method.let { m ->
            val ifNezIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IF_NEZ
            }
            if (ifNezIdx < 0) {
                throw PatchException("Could not find if-nez in AnchoredDraggableState.updateAnchors")
            }
            m.addInstructionsWithLabels(
                ifNezIdx,
                """
                    if-eqz v0, :mt_anchors_changed
                    invoke-static {}, $EXPRESSIVE_BRIDGE_CLASS->isPendingInstantSheetSnap()Z
                    move-result v0
                    xor-int/lit8 v0, v0, 0x1
                    :mt_anchors_changed
                    nop
                """.trimIndent(),
            )
        }

        // 6. Un-fuse AppScaffold's shared outer gray background & corner clip, and normalize
        //    MiniPlayer's 9dp horizontal padding literal (0x41100000) to 8dp (0x4100) so
        //    MiniPlayer and TabBar share identical 16dp horizontal outer alignment.
        appScaffoldInnerMatch.let { match ->
            val m = match.method
            val padIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn is NarrowLiteralInstruction && insn.narrowLiteral == 0x41100000
                }
                .map { it.index }
            if (padIndices.size != 1) {
                throw PatchException(
                    "Expected 1 9dp horizontal padding literal 0x41100000 in ${m.definingClass}.${m.name}, found ${padIndices.size}"
                )
            }
            val padIdx = padIndices.single()
            val padReg = (m.getInstruction(padIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(padIdx, "const/high16 v$padReg, 0x41000000")

            val dCallIdx = match.instructionMatches[1].index
            val moveWideInsn = m.getInstruction(dCallIdx + 1)
            if (moveWideInsn.opcode != Opcode.MOVE_RESULT_WIDE) {
                throw PatchException("Expected move-result-wide after Lc53;->d in ${m.name}, got ${moveWideInsn.opcode}")
            }
            val colorReg = (moveWideInsn as OneRegisterInstruction).registerA
            m.addInstructions(
                dCallIdx + 2,
                "const-wide/16 v$colorReg, 0x0",
            )
        }

        shapesClinitMatch.method.let { m ->
            val clipIdx = m.instructions.indexOfFirst { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0x42100000
            }
            if (clipIdx < 0) {
                throw PatchException("Could not find 36dp clip literal 0x42100000 in Lqj0;.<clinit>")
            }
            val clipReg = (m.getInstruction(clipIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(clipIdx, "const/4 v$clipReg, 0x0")

            val getBlackIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/graphics/Color\$Companion;" &&
                            it.name == "getBlack-0d7_KjU" &&
                            it.returnType == "J"
                    } == true
            }
            if (getBlackIdx < 0) {
                throw PatchException("Could not find Color.getBlack in Lqj0;.<clinit>")
            }
            val moveRes = m.getInstruction(getBlackIdx + 1)
            if (moveRes.opcode != Opcode.MOVE_RESULT_WIDE) {
                throw PatchException("Expected move-result-wide after Color.getBlack in Lqj0;.<clinit>, got ${moveRes.opcode}")
            }
            val colorReg = (moveRes as OneRegisterInstruction).registerA
            m.addInstructions(
                getBlackIdx + 2,
                """
                    invoke-static {}, $EXPRESSIVE_BRIDGE_CLASS->getBottomScrimEndColorCompose()J
                    move-result-wide v$colorReg
                """.trimIndent(),
            )
        }

        // 7. Redirect TabBarKt.c and MiniPlayerKt.c to ExpressiveScaffoldBridge.
        tabBarMatch.method.let { m ->
            val p0 = m.p0Register
            val p4 = p0 + 4
            m.addInstructions(
                0,
                """
                    invoke-static/range { v$p0 .. v$p4 }, $EXPRESSIVE_BRIDGE_CLASS->renderTabBar(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
                    return-void
                """,
            )
        }

        miniPlayerMatch.method.let { m ->
            val p0 = m.p0Register
            val p3 = p0 + 3
            m.addInstructions(
                0,
                """
                    invoke-static/range { v$p0 .. v$p3 }, $EXPRESSIVE_BRIDGE_CLASS->renderMiniPlayer(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
                    return-void
                """,
            )
        }
    }
}

private fun replaceBridgeMethod(
    bridgeClass: MutableClass,
    methodName: String,
    smali: String,
) {
    val oldMethod = bridgeClass.methods.singleOrNull { it.name == methodName }
        ?: throw PatchException("Bridge method not found: $EXPRESSIVE_BRIDGE_CLASS->$methodName")

    val newMethod = ImmutableMethod(
        bridgeClass.type,
        oldMethod.name,
        oldMethod.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
        oldMethod.returnType,
        oldMethod.accessFlags,
        oldMethod.annotations,
        oldMethod.hiddenApiRestrictions,
        MutableMethodImplementation(10),
    ).toMutable()

    newMethod.addInstructionsWithLabels(0, smali.trimIndent())

    bridgeClass.methods.remove(oldMethod)
    bridgeClass.methods.add(newMethod)
}
