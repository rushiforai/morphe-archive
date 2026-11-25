package dev.materialtidal.patches.tidal.theme.materialyou

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.MATERIAL_YOU_ENGINE_CLASS

private val MONET_PALETTE_CHOICES = mapOf(
    "Expressive (Rich Tonal, recommended)" to "expressive",
    "Vibrant (High Chroma)" to "vibrant",
    "Subtle (Classic Material You)" to "subtle",
)

private fun monetStyleToCode(value: String?): Int = when (value) {
    "expressive" -> 0
    "vibrant" -> 1
    "subtle" -> 2
    else -> throw PatchException("Invalid monetPaletteStyle option value: $value")
}

private val BLUR_INTENSITY_CHOICES = mapOf(
    "Balanced (Recommended)" to "balanced",
    "Subtle" to "subtle",
    "Strong frosted glass" to "rich",
)

private fun blurIntensityToCode(value: String?): Int = when (value) {
    "subtle" -> 0
    "balanced" -> 1
    "rich" -> 2
    else -> throw PatchException("Invalid blurIntensity option value: $value")
}

private fun invokeStaticSingleReg(reg: Int, methodSig: String): String =
    if (reg <= 15) {
        """
            invoke-static { v$reg }, $methodSig
            move-result v$reg
        """.trimIndent()
    } else {
        """
            invoke-static/range { v$reg .. v$reg }, $methodSig
            move-result v$reg
        """.trimIndent()
    }

private fun MutableMethod.interceptAllStaticCalls(
    definingClass: String,
    methodName: String,
    params: List<String>,
    helperMethodSig: String,
    minExpected: Int,
) {
    val indices = instructions.withIndex()
        .filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_STATIC &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == definingClass &&
                        it.name == methodName &&
                        it.parameterTypes == params
                } == true
        }
        .map { it.index }

    if (indices.size < minExpected) {
        throw PatchException(
            "Expected at least $minExpected calls to $definingClass->$methodName($params) in ${this.definingClass}.${this.name}, found ${indices.size}"
        )
    }

    for (idx in indices.reversed()) {
        val reg = (getInstruction(idx) as FiveRegisterInstruction).registerC
        addInstructions(idx, invokeStaticSingleReg(reg, helperMethodSig))
    }
}

@Suppress("unused")
val materialYouThemePatch = patch(
    name = "Material You dynamic theme",
    description = "Applies your Android wallpaper's Material You Monet colors, rounder M3 shapes, and smooth frosted-glass blur across TIDAL's surfaces, accents, and cards. Options can also be adjusted live in Settings → MaterialTidal.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val amoledPureBlackOption by booleanOption(
        key = "amoledPureBlack",
        default = false,
        title = "AMOLED pure black background",
        description = "Uses a pure #000000 Dark Mode background instead of a tinted dark surface while keeping Monet accents and elevated cards (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val monetPaletteStyleOption by stringOption(
        key = "monetPaletteStyle",
        default = "expressive",
        values = MONET_PALETTE_CHOICES,
        title = "Monet palette intensity",
        description = "Controls how strongly your wallpaper's Monet colors tint app surfaces and cards (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val expressiveShapesOption by booleanOption(
        key = "expressiveShapes",
        default = true,
        title = "M3 rounded shapes",
        description = "Upgrades button, card, and container corners across TIDAL to rounder M3 squircle and pill shapes (can also be toggled in Settings → MaterialTidal; restart recommended).",
        required = true,
    )

    val expressiveGlassBlurOption by booleanOption(
        key = "expressiveGlassBlur",
        default = true,
        title = "Expressive frosted-glass blur",
        description = "Enables smooth hardware-accelerated blur on hero artwork fades, sticky toolbars, floating bars, menus, and sheets (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    val blurIntensityOption by stringOption(
        key = "blurIntensity",
        default = "balanced",
        values = BLUR_INTENSITY_CHOICES,
        title = "Blur intensity",
        description = "Controls the strength of progressive blur fades and frosted glass surfaces (also adjustable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isMaterialYouPatchInstalled" }.returnEarly(true)
        configClass.methods.single { it.name == "isMaterialYouEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "defaultAmoledPureBlack" }
            .returnEarly(amoledPureBlackOption ?: false)
        configClass.methods.single { it.name == "defaultMonetPaletteStyle" }
            .returnEarly(monetStyleToCode(monetPaletteStyleOption))
        configClass.methods.single { it.name == "defaultExpressiveShapesEnabled" }
            .returnEarly(expressiveShapesOption ?: true)
        configClass.methods.single { it.name == "defaultExpressiveBlurEnabled" }
            .returnEarly(expressiveGlassBlurOption ?: true)
        configClass.methods.single { it.name == "defaultBlurIntensity" }
            .returnEarly(blurIntensityToCode(blurIntensityOption))

        // 1. Intercept Compose ColorKt.Color(int) -> J and Color(long) -> J.
        ComposeColorIntFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            m.addInstructions(
                0,
                invokeStaticSingleReg(p0, "$MATERIAL_YOU_ENGINE_CLASS->remapArgb(I)I"),
            )
        }

        ComposeColorLongFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            val p1 = p0 + 1
            m.addInstructions(
                0,
                """
                    invoke-static/range { v$p0 .. v$p1 }, $MATERIAL_YOU_ENGINE_CLASS->remapArgbLong(J)J
                    move-result-wide v$p0
                """,
            )
        }

        // 1b. Intercept Compose BackgroundKt.background-bw27NRU(Modifier, J, Shape) at render time
        //     so every Surface, Scaffold, WaveScaffold, Box, Card, and Modifier.background(color)
        //     receives live Monet surface remapping regardless of <clinit> caching or Color overload.
        ComposeBackgroundColorFingerprint.matchSingle().method.let { m ->
            val colorReg = m.p0Register + 1
            val colorRegHigh = colorReg + 1
            m.addInstructions(
                0,
                """
                    invoke-static/range { v$colorReg .. v$colorRegHigh }, $MATERIAL_YOU_ENGINE_CLASS->remapComposeColor(J)J
                    move-result-wide v$colorReg
                """,
            )
        }

        // 1c. Live frame-time interception on Compose BackgroundNode.drawRect & drawOutline
        //     so BackgroundElements created before Activity resources attached still paint live Monet colors
        //     without waiting for recomposition.
        for (bgFp in listOf(
            ComposeBackgroundNodeDrawRectFingerprint,
            ComposeBackgroundNodeDrawOutlineFingerprint,
        )) {
            bgFp.matchSingle().method.let { m ->
                val colorReadIndices = m.instructions.withIndex()
                    .filter { (_, insn) ->
                        insn.opcode == Opcode.IGET_WIDE &&
                            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                                it.definingClass == "Landroidx/compose/foundation/BackgroundNode;" &&
                                    it.name == "color" &&
                                    it.type == "J"
                            } == true
                    }
                    .map { it.index }
                if (colorReadIndices.size != 2) {
                    throw PatchException(
                        "Expected 2 BackgroundNode.color reads in ${m.definingClass}.${m.name}, found ${colorReadIndices.size}"
                    )
                }
                val drawReadIdx = colorReadIndices[1]
                val reg = (m.getInstruction(drawReadIdx) as TwoRegisterInstruction).registerA
                val regHigh = reg + 1
                m.addInstructions(
                    drawReadIdx + 1,
                    """
                        invoke-static/range { v$reg .. v$regHigh }, $MATERIAL_YOU_ENGINE_CLASS->remapBackgroundDrawColor(J)J
                        move-result-wide v$reg
                    """,
                )
            }
        }

        // 1d. Universal Material 3 ScaffoldKt.Scaffold-TvnljyQ container color safeguard right before Surface-T9BRK9s.
        Material3ScaffoldFingerprint.matchSingle().method.let { m ->
            val surfaceIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/material3/SurfaceKt;" &&
                                it.name == "Surface-T9BRK9s" &&
                                it.returnType == "V"
                        } == true
                }
                .map { it.index }
            if (surfaceIndices.size != 1) {
                throw PatchException(
                    "Expected 1 Surface-T9BRK9s call in ${m.definingClass}.${m.name}, found ${surfaceIndices.size}"
                )
            }
            val surfaceIdx = surfaceIndices.single()
            val rangeInsn = m.getInstruction(surfaceIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount < 4) {
                throw PatchException("Unexpected Surface-T9BRK9s registerCount=${rangeInsn.registerCount}")
            }
            val colorReg = rangeInsn.startRegister + 2
            val colorRegHigh = colorReg + 1
            m.addInstructions(
                surfaceIdx,
                """
                    invoke-static/range { v$colorReg .. v$colorRegHigh }, $MATERIAL_YOU_ENGINE_CLASS->remapScaffoldContainerColor(J)J
                    move-result-wide v$colorReg
                """,
            )
        }

        // 1e. Collection screen structural parity with Search & Explore: wrap root Modifier.background(surfaceBase)
        //     and replace stale <clinit> WaveTheme tokens in WaveScaffold & TopBar gradient.
        MyCollectionScreenScaffoldFingerprint.matchSingle().method.let { m ->
            val callIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Lcom/tidal/wave2/foundation/WaveScaffoldKt;" &&
                                it.name == "a" &&
                                it.returnType == "V"
                        } == true
                }
                .map { it.index }
            if (callIndices.size != 1) {
                throw PatchException(
                    "Expected 1 WaveScaffoldKt.a call in ${m.definingClass}.${m.name}, found ${callIndices.size}"
                )
            }
            val callIdx = callIndices.single()
            val rangeInsn = m.getInstruction(callIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 10) {
                throw PatchException("Unexpected WaveScaffoldKt.a registerCount=${rangeInsn.registerCount}")
            }
            val modReg = rangeInsn.startRegister
            val colorReg = rangeInsn.startRegister + 3
            val defaultReg = rangeInsn.startRegister + 9
            val s0 = rangeInsn.startRegister + rangeInsn.registerCount
            val s1 = s0 + 1
            val s3 = s0 + 3
            val s4 = s0 + 4
            val s5 = s0 + 5
            if (s5 >= m.p0Register) {
                throw PatchException(
                    "Scratch register v$s5 overlaps p0=${m.p0Register} in ${m.definingClass}.${m.name}"
                )
            }
            m.addInstructions(
                callIdx,
                """
                    invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->getSurfaceBaseCompose()J
                    move-result-wide v$colorReg
                    sget-object v$s0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier${'$'}Companion;
                    move-wide/from16 v$s1, v$colorReg
                    const/16 v$s3, 0x0
                    const/16 v$s4, 0x2
                    const/16 v$s5, 0x0
                    invoke-static/range { v$s0 .. v$s5 }, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU${'$'}default(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;
                    move-result-object v$modReg
                    const/16 v$defaultReg, 0x14
                """,
            )
        }

        MyCollectionTopBarFingerprint.matchSingle().method.let { m ->
            val boxIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    (insn.opcode == Opcode.INVOKE_STATIC || insn.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/ui/graphics/Color;" &&
                                it.name == "box-impl" &&
                                it.parameterTypes == listOf("J") &&
                                it.returnType == "Landroidx/compose/ui/graphics/Color;"
                        } == true
                }
                .map { it.index }
            if (boxIndices.size < 2) {
                throw PatchException(
                    "Expected at least 2 Color.box-impl calls in ${m.definingClass}.${m.name}, found ${boxIndices.size}"
                )
            }
            val firstBoxIdx = boxIndices.first()
            val colorReg = when (val insn = m.getInstruction(firstBoxIdx)) {
                is FiveRegisterInstruction -> {
                    if (insn.registerD != insn.registerC + 1) {
                        throw PatchException("Non-contiguous wide pair in Color.box-impl: v${insn.registerC}, v${insn.registerD}")
                    }
                    insn.registerC
                }
                is RegisterRangeInstruction -> insn.startRegister
                else -> throw PatchException("Unexpected instruction type at Color.box-impl: ${insn.opcode}")
            }
            val colorRegHigh = colorReg + 1
            m.addInstructions(
                firstBoxIdx,
                """
                    invoke-static/range { v$colorReg .. v$colorRegHigh }, $MATERIAL_YOU_ENGINE_CLASS->resolveSurfaceBaseCompose(J)J
                    move-result-wide v$colorReg
                """,
            )
        }

        // 1f. Intercept AndroidComposeView.dispatchDraw(Canvas) for tab fragment hosts
        //     to paint solid Monet canvas behind Compose and trigger one-shot post-fade layer invalidation.
        AndroidComposeViewDispatchDrawFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            val p1 = p0 + 1
            if (p0 < 1 || p0 > 15) {
                throw PatchException("Unexpected p0=$p0 in ${m.definingClass}.${m.name}")
            }
            val hasInvalidateLayers = m.instructions.any { insn ->
                (insn.opcode == Opcode.INVOKE_DIRECT || insn.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/platform/AndroidComposeView;" &&
                            it.name == "invalidateLayers" &&
                            it.parameterTypes == listOf("Landroidx/compose/ui/node/LayoutNode;") &&
                            it.returnType == "V"
                    } == true
            }
            if (!hasInvalidateLayers) {
                throw PatchException("Missing invalidateLayers(LayoutNode) call in ${m.definingClass}.${m.name}")
            }
            m.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { v$p0 .. v$p1 }, $MATERIAL_YOU_ENGINE_CLASS->onComposeDispatchDraw(Landroid/view/View;Landroid/graphics/Canvas;)Z
                    move-result v0
                    if-eqz v0, :mt_skip_compose_inval
                    invoke-virtual { v$p0 }, Landroidx/compose/ui/platform/AndroidComposeView;->getRoot()Landroidx/compose/ui/node/LayoutNode;
                    move-result-object v0
                    invoke-direct { v$p0, v0 }, Landroidx/compose/ui/platform/AndroidComposeView;->invalidateLayers(Landroidx/compose/ui/node/LayoutNode;)V
                    :mt_skip_compose_inval
                    nop
                """,
            )
        }

        // 1g. Disable legacy RenderNode ForceDark in GraphicsLayerV29.<init> so OEM darkeners never
        //     blacken full-screen Compose Scaffold/Surface layers.
        GraphicsLayerV29InitFingerprint.matchSingle().method.let { m ->
            val clipIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/graphics/RenderNode;" &&
                            it.name == "setClipToBounds" &&
                            it.parameterTypes == listOf("Z") &&
                            it.returnType == "Z"
                    } == true
            }
            if (clipIdx < 0) {
                throw PatchException("Missing RenderNode.setClipToBounds(Z)Z in ${m.definingClass}.${m.name}")
            }
            val clipInsn = m.getInstruction(clipIdx) as FiveRegisterInstruction
            val rnReg = clipInsn.registerC
            val falseReg = clipInsn.registerD
            if (rnReg > 15 || falseReg > 15) {
                throw PatchException("Register out of 4-bit invoke-virtual range in ${m.definingClass}.${m.name}: rn=v$rnReg false=v$falseReg")
            }
            m.addInstructions(
                clipIdx + 1,
                "invoke-virtual { v$rnReg, v$falseReg }, Landroid/graphics/RenderNode;->setForceDarkAllowed(Z)Z",
            )
        }

        // 1h. Disable legacy View AlphaAnimation (fade_in / fade_out) in Lll7;->a strictly for
        //     HomeScreenFragment and MyCollectionScreenFragment (entering & back-stack popEnter)
        //     so HWUI never blackens nested Compose RenderNodes while Search & Explore keep theirs.
        MainFragmentPresenterReplaceFingerprint.matchSingle().method.let { m ->
            val setAnimIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/fragment/app/FragmentTransaction;" &&
                                it.name == "setCustomAnimations" &&
                                it.parameterTypes == listOf("I", "I", "I", "I") &&
                                it.returnType == "Landroidx/fragment/app/FragmentTransaction;"
                        } == true
                }
                .map { it.index }
            if (setAnimIndices.size != 1) {
                throw PatchException("Expected 1 setCustomAnimations call in ${m.definingClass}.${m.name}, found ${setAnimIndices.size}")
            }
            val setAnimIdx = setAnimIndices.single()
            val animInsn = m.getInstruction(setAnimIdx) as FiveRegisterInstruction
            val txReg = animInsn.registerC
            val enterReg = animInsn.registerD
            val exitReg = animInsn.registerE
            val popEnterReg = animInsn.registerF
            val popExitReg = animInsn.registerG

            val replaceIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/fragment/app/FragmentTransaction;" &&
                                it.name == "replace" &&
                                it.parameterTypes == listOf("I", "Landroidx/fragment/app/Fragment;", "Ljava/lang/String;") &&
                                it.returnType == "Landroidx/fragment/app/FragmentTransaction;"
                        } == true
                }
                .map { it.index }
            if (replaceIndices.size != 1) {
                throw PatchException("Expected 1 FragmentTransaction.replace call in ${m.definingClass}.${m.name}, found ${replaceIndices.size}")
            }
            val replaceInsn = m.getInstruction(replaceIndices.single()) as FiveRegisterInstruction
            val incomingFragReg = replaceInsn.registerE
            val tagReg = replaceInsn.registerF

            val activityGetInsn = m.instructions.firstOrNull { insn ->
                insn.opcode == Opcode.IGET_OBJECT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Lcom/aspiro/wamp/MainActivity;"
            } as? TwoRegisterInstruction
                ?: throw PatchException("Could not find MainActivity field read in ${m.definingClass}.${m.name}")
            val activityReg = activityGetInsn.registerA

            val protectedRegs = setOf(
                txReg,
                enterReg,
                exitReg,
                popEnterReg,
                popExitReg,
                incomingFragReg,
                tagReg,
                activityReg,
            )
            val tailInsns = m.instructions.drop(setAnimIdx)
            fun isRegReferencedInTail(reg: Int): Boolean = tailInsns.any { insn ->
                when (insn) {
                    is FiveRegisterInstruction -> {
                        val regs = listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                            .take(insn.registerCount)
                        reg in regs
                    }
                    is RegisterRangeInstruction -> reg in insn.startRegister until (insn.startRegister + insn.registerCount)
                    is TwoRegisterInstruction -> insn.registerA == reg || insn.registerB == reg
                    is OneRegisterInstruction -> insn.registerA == reg
                    else -> false
                }
            }
            val scratchReg = (0 until m.p0Register).firstOrNull {
                it !in protectedRegs && !isRegReferencedInTail(it)
            } ?: throw PatchException("No free dead scratch register < p0=${m.p0Register} in ${m.definingClass}.${m.name}")

            if (listOf(activityReg, incomingFragReg, scratchReg, enterReg, exitReg, popEnterReg, popExitReg).any { it > 15 }) {
                throw PatchException("Register out of 4-bit range in ${m.definingClass}.${m.name}")
            }

            m.addInstructionsWithLabels(
                setAnimIdx,
                """
                    invoke-static { v$activityReg, v$incomingFragReg }, $MATERIAL_YOU_ENGINE_CLASS->shouldDisableFragmentFadeAnim(Landroid/app/Activity;Ljava/lang/Object;)Z
                    move-result v$scratchReg
                    if-eqz v$scratchReg, :mt_keep_frag_anim
                    const/4 v$enterReg, 0x0
                    const/4 v$exitReg, 0x0
                    const/4 v$popEnterReg, 0x0
                    const/4 v$popExitReg, 0x0
                    :mt_keep_frag_anim
                    nop
                """,
            )
        }

        // 1i. Pre-tint & register ComposeView in HomeScreenFragment & MyCollectionScreenFragment (onCreateView)
        //     and refresh surface tint + hardware layers on onResume / Home re-tap (j()).
        for (createViewFp in listOf(
            HomeScreenFragmentOnCreateViewFingerprint,
            MyCollectionScreenFragmentOnCreateViewFingerprint,
        )) {
            createViewFp.matchSingle().method.let { m ->
                val returnIndices = m.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                    .map { it.index }
                if (returnIndices.isEmpty()) {
                    throw PatchException("No return-object found in ${m.definingClass}.${m.name}")
                }
                for (idx in returnIndices.reversed()) {
                    val retReg = (m.getInstruction(idx) as OneRegisterInstruction).registerA
                    if (retReg > 15) {
                        throw PatchException("Return register v$retReg out of 4-bit range in ${m.definingClass}.${m.name}")
                    }
                    m.addInstructions(
                        idx,
                        "invoke-static { v$retReg }, $MATERIAL_YOU_ENGINE_CLASS->prepareFragmentComposeView(Landroid/view/View;)V",
                    )
                }
            }
        }

        for (resumeFp in listOf(
            HomeScreenFragmentOnResumeFingerprint,
            HomeScreenFragmentCurrentClickedFingerprint,
            MyCollectionScreenFragmentOnResumeFingerprint,
        )) {
            resumeFp.matchSingle().method.let { m ->
                val p0 = m.p0Register
                if (p0 !in 1..15) {
                    throw PatchException("Unexpected p0=$p0 in ${m.definingClass}.${m.name}")
                }
                val returnIndices = m.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                if (returnIndices.isEmpty()) {
                    throw PatchException("No return-void found in ${m.definingClass}.${m.name}")
                }
                for (idx in returnIndices.reversed()) {
                    m.addInstructions(
                        idx,
                        """
                            invoke-virtual { v$p0 }, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
                            move-result-object v0
                            invoke-static { v0 }, $MATERIAL_YOU_ENGINE_CLASS->onFragmentComposeResume(Landroid/view/View;)V
                        """,
                    )
                }
            }
        }

        // 1j. Paint MyCollectionContent scrollable root with Monet surfaceBase and notify the
        //     Compose host when collection content mounts/reloads.
        MyCollectionContentFingerprint.matchSingle().method.let { m ->
            val vsIndices = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/foundation/ScrollKt;" &&
                                it.name == "verticalScroll\$default"
                        } == true
                }
                .map { it.index }
            if (vsIndices.size != 1) {
                throw PatchException("Expected 1 verticalScroll\$default call in ${m.definingClass}.${m.name}, found ${vsIndices.size}")
            }
            val vsIdx = vsIndices.single()
            val moveObj = m.getInstruction(vsIdx + 1)
            if (moveObj.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Expected move-result-object after verticalScroll\$default in ${m.definingClass}.${m.name}, got ${moveObj.opcode}")
            }
            val modReg = (moveObj as OneRegisterInstruction).registerA
            val rangeInsn = m.getInstruction(vsIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 7) {
                throw PatchException("Unexpected verticalScroll\$default registerCount=${rangeInsn.registerCount}")
            }
            val s0 = rangeInsn.startRegister
            val s1 = s0 + 1
            val s3 = s0 + 3
            val s4 = s0 + 4
            val s5 = s0 + 5
            if (s5 >= m.p0Register) {
                throw PatchException(
                    "Scratch register v$s5 overlaps p0=${m.p0Register} in ${m.definingClass}.${m.name}"
                )
            }
            m.addInstructions(
                vsIdx + 2,
                """
                    move-object/from16 v$s0, v$modReg
                    invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->getSurfaceBaseCompose()J
                    move-result-wide v$s1
                    const/16 v$s3, 0x0
                    const/16 v$s4, 0x2
                    const/16 v$s5, 0x0
                    invoke-static/range { v$s0 .. v$s5 }, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU${'$'}default(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;
                    move-result-object v$modReg
                    invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->notifyFragmentContentMounted()V
                """,
            )
        }

        // 2. Intercept Square Market MarketColor raw ARGB getters (e()I & k()I on Lwha;)
        //    so even View/Canvas or cached MarketColor tokens get dynamic Monet remapping.
        val marketColorClass = MarketColorToStringFingerprint.matchSingle().classDef
        val marketIntGetters = marketColorClass.methods.filter { m ->
            m.parameters.isEmpty() &&
                m.returnType == "I" &&
                m.instructions.let { insns ->
                    insns.size == 2 &&
                        insns[0].opcode == Opcode.IGET &&
                        insns[1].opcode == Opcode.RETURN &&
                        ((insns[0] as? ReferenceInstruction)?.reference as? FieldReference)?.name == "a"
                }
        }
        if (marketIntGetters.size != 2) {
            throw PatchException(
                "Expected 2 raw int getters on ${marketColorClass.type}, found ${marketIntGetters.size}: ${marketIntGetters.map { it.name }}"
            )
        }
        for (getter in marketIntGetters) {
            val retReg = (getter.instructions[1] as OneRegisterInstruction).registerA
            getter.addInstructions(
                1,
                invokeStaticSingleReg(retReg, "$MATERIAL_YOU_ENGINE_CLASS->remapMarketColorArgb(I)I"),
            )
        }

        // 3. Upgrade Square Market, Wave 2, and Wave 1 corner radii to Material 3 Expressive shapes.
        MarketBorderRadiiBuilderFingerprint.matchSingle().method.interceptAllStaticCalls(
            definingClass = "Lcom/squareup/ui/model/resources/a;",
            methodName = "b",
            params = listOf("I"),
            helperMethodSig = "$MATERIAL_YOU_ENGINE_CLASS->remapMarketBorderRadiusDp(I)I",
            minExpected = 9,
        )

        Wave2CornerRadiusesInitFingerprint.matchSingle().method.interceptAllStaticCalls(
            definingClass = "Landroidx/compose/ui/unit/Dp;",
            methodName = "constructor-impl",
            params = listOf("F"),
            helperMethodSig = "$MATERIAL_YOU_ENGINE_CLASS->remapWaveCornerRadiusDp(F)F",
            minExpected = 8,
        )

        Wave1RadiusClinitFingerprint.matchSingle().method.interceptAllStaticCalls(
            definingClass = "Landroidx/compose/ui/unit/Dp;",
            methodName = "constructor-impl",
            params = listOf("F"),
            helperMethodSig = "$MATERIAL_YOU_ENGINE_CLASS->remapWaveCornerRadiusDp(F)F",
            minExpected = 6,
        )

        // 4. Capture Activity resources early right after super.onCreate (before setContentView / Home fragment)
        //    and re-apply full decor/container/fragment root tint on return-void paths.
        MainActivityOnCreateFingerprint.matchSingle().method.let { m ->
            val p0 = m.p0Register
            val returnIndices = m.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returnIndices.isEmpty()) {
                throw PatchException("No return-void found in MainActivity.onCreate")
            }
            val superIndices = m.instructions
                .withIndex()
                .filter { (_, insn) ->
                    (insn.opcode == Opcode.INVOKE_SUPER || insn.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
                        } == true
                }
                .map { it.index }
            if (superIndices.size != 1) {
                throw PatchException(
                    "Expected 1 super.onCreate call in MainActivity.onCreate, found ${superIndices.size}"
                )
            }
            val edits = mutableListOf<Pair<Int, String>>()
            edits += (superIndices.single() + 1) to
                "invoke-static/range { v$p0 .. v$p0 }, $MATERIAL_YOU_ENGINE_CLASS->initEarly(Landroid/app/Activity;)V"
            for (idx in returnIndices) {
                edits += idx to
                    "invoke-static/range { v$p0 .. v$p0 }, $MATERIAL_YOU_ENGINE_CLASS->applyActivityTheme(Landroid/app/Activity;)V"
            }
            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }
    }
}
