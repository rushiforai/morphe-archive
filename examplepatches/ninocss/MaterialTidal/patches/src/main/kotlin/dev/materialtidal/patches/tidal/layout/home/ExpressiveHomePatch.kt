package dev.materialtidal.patches.tidal.layout.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_HOME_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.MATERIAL_YOU_ENGINE_CLASS
import dev.materialtidal.patches.tidal.theme.materialyou.MarketColorToStringFingerprint
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private val HOME_RADIUS_CHOICES = mapOf(
    "Expressive Squircle (20dp)" to "expressive",
    "Rounded (14dp)" to "rounded",
    "Subtle (8dp)" to "subtle",
)

private fun radiusChoiceToDpInt(choice: String?): Int = when (choice) {
    "expressive" -> 20
    "rounded" -> 14
    "subtle" -> 8
    else -> throw PatchException("Invalid homeCoverRadiusStyle option value: $choice")
}

private fun isRegOverwrittenWithConstBeforeRead(
    method: MutableMethod,
    startIndex: Int,
    reg: Int,
    maxLookahead: Int = 8,
): Boolean {
    val insns = method.instructions
    val end = minOf(insns.size, startIndex + maxLookahead)
    for (i in startIndex until end) {
        val insn = insns[i]
        val isPureConstWrite = when (insn.opcode) {
            Opcode.CONST_4,
            Opcode.CONST_16,
            Opcode.CONST,
            Opcode.CONST_HIGH16 -> (insn as OneRegisterInstruction).registerA == reg
            else -> false
        }
        if (isPureConstWrite) {
            return true
        }
        if (insn.opcode == Opcode.RETURN_VOID ||
            insn.opcode == Opcode.RETURN ||
            insn.opcode == Opcode.RETURN_OBJECT ||
            insn.opcode == Opcode.RETURN_WIDE
        ) {
            return false
        }
        if (insn is FiveRegisterInstruction) {
            val regs = listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                .take(insn.registerCount)
            if (reg in regs) {
                return false
            }
        }
        if (insn is TwoRegisterInstruction && insn.registerB == reg) {
            return false
        }
        if (insn is OneRegisterInstruction && insn.registerA == reg) {
            // Could be a read (e.g. if-eqz)
            return false
        }
    }
    return false
}

private fun MutableMethod.addEarlyHideGuard(bridgeBooleanGetter: String) {
    if (p0Register < 1) {
        throw PatchException(
            "Cannot safely use v0 as scratch register at index 0 in ${this.definingClass}.${this.name} (p0=$p0Register)"
        )
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->$bridgeBooleanGetter()Z
            move-result v0
            if-eqz v0, :mt_show_module
            return-void
            :mt_show_module
            nop
        """.trimIndent(),
    )
}

@Suppress("unused")
val expressiveHomePatch = patch(
    name = "Expressive Material 3 homepage",
    description = "Redesigns TIDAL's Homepage with Material 3 Expressive shortcut cards, rounded carousel artwork, Monet-styled Vibe chips and AppBar, unlocked pull-to-refresh, and promo decluttering.",
    default = true,
) {
    dependsOn(materialYouThemePatch)

    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val homeCoverRadiusStyleOption by stringOption(
        key = "homeCoverRadiusStyle",
        default = "expressive",
        values = HOME_RADIUS_CHOICES,
        title = "Homepage cover & shortcut shape",
        description = "Corner radius style for album/playlist carousel cards and quick-access shortcut cards.",
        required = true,
    )

    val enablePullToRefreshOption by booleanOption(
        key = "enableHomePullToRefresh",
        default = true,
        title = "Unlock homepage pull-to-refresh",
        description = "Enables TIDAL's native Material pull-to-refresh gesture on the Homepage feed.",
        required = true,
    )

    val hideHeadlinersBannerOption by booleanOption(
        key = "hideHomeHeadlinersBanner",
        default = true,
        title = "Hide Headliners upload banner",
        description = "Hides the top creator upload promotional banner on the Homepage.",
        required = true,
    )

    val hidePromoModulesOption by booleanOption(
        key = "hideHomePromoModules",
        default = true,
        title = "Hide promo modules",
        description = "Hides promotional banners injected between Homepage music carousels.",
        required = true,
    )

    val hideMerchModulesOption by booleanOption(
        key = "hideHomeMerchModules",
        default = true,
        title = "Hide merch store modules",
        description = "Hides merchandising shopping carousels from the Homepage.",
        required = true,
    )

    execute {
        // 1. Configure MaterialYouConfig homepage options.
        val radiusDp = radiusChoiceToDpInt(homeCoverRadiusStyleOption)
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressiveHomeEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "getHomeCoverCornerRadiusInt" }.returnEarly(radiusDp)
        configClass.methods.single { it.name == "getHomeShortcutCornerRadiusInt" }.returnEarly(radiusDp)
        configClass.methods.single { it.name == "getHomeShortcutHeightInt" }.returnEarly(66)
        configClass.methods.single { it.name == "isHomePullToRefreshEnabled" }
            .returnEarly(enablePullToRefreshOption ?: true)
        configClass.methods.single { it.name == "isHideHomeHeadlinersBanner" }
            .returnEarly(hideHeadlinersBannerOption ?: true)
        configClass.methods.single { it.name == "isHideHomePromoModules" }
            .returnEarly(hidePromoModulesOption ?: true)
        configClass.methods.single { it.name == "isHideHomeMerchModules" }
            .returnEarly(hideMerchModulesOption ?: true)

        // Resolve Square Market MarketColor descriptor dynamically (Lwha;) & ensure it has <init>(I)V.
        val marketColorClass = MarketColorToStringFingerprint.matchSingle().classDef
        val marketColorType = marketColorClass.type
        if (marketColorClass.methods.none {
                it.name == "<init>" && it.parameterTypes == listOf("I") && it.returnType == "V"
            }
        ) {
            throw PatchException("MarketColor class $marketColorType lacks expected <init>(I)V constructor")
        }

        // Hook A: Grid/carousel artwork corner radius in Ll78;.<clinit>()V (AlbumGridItemCell companion).
        val gridCellClass = AlbumGridItemCellFingerprint.matchSingle().classDef
        val gridCellClinit = gridCellClass.methods.singleOrNull { it.name == "<clinit>" }
            ?: throw PatchException("Missing <clinit> on ${gridCellClass.type}")
        gridCellClinit.let { m ->
            val dpIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/unit/Dp;" &&
                            it.name == "constructor-impl" &&
                            it.parameterTypes == listOf("F")
                    } == true
            }
            if (dpIdx < 0) {
                throw PatchException("Could not find Dp.constructor-impl in ${gridCellClass.type}.<clinit>")
            }
            val reg = (m.getInstruction(dpIdx) as FiveRegisterInstruction).registerC
            m.addInstructions(
                dpIdx,
                """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getGridCoverCornerRadiusDp()F
                    move-result v$reg
                """,
            )
        }

        // Hook B: Shortcut card height (field 'a:F' initialized first in ShortcutListModuleKt.<clinit>).
        ShortcutListModuleClinitFingerprint.matchSingle().method.let { m ->
            val dpIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/unit/Dp;" &&
                            it.name == "constructor-impl" &&
                            it.parameterTypes == listOf("F")
                    } == true
            }
            if (dpIdx < 0) {
                throw PatchException("Could not find Dp.constructor-impl in ShortcutListModuleKt.<clinit>")
            }
            val reg = (m.getInstruction(dpIdx) as FiveRegisterInstruction).registerC
            m.addInstructions(
                dpIdx,
                """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getShortcutCardHeightDp()F
                    move-result v$reg
                """,
            )
        }

        // Hook C: ShortcutCard outer corner radius + elevated Monet tonal card container color.
        ShortcutCardFingerprint.matchSingle().method.let { m ->
            val edits = mutableListOf<Pair<Int, String>>()

            val roundIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/foundation/shape/RoundedCornerShapeKt;" &&
                            it.name == "RoundedCornerShape-0680j_4" &&
                            it.parameterTypes == listOf("F")
                    } == true
            }
            if (roundIdx < 0) {
                throw PatchException("Could not find RoundedCornerShape in ShortcutCard")
            }
            val radiusReg = (m.getInstruction(roundIdx) as FiveRegisterInstruction).registerC
            edits += roundIdx to """
                invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getShortcutCardCornerRadiusDp()F
                move-result v$radiusReg
            """.trimIndent()

            val colorCallIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.parameterTypes == listOf(marketColorType) && it.returnType == "J"
                    } == true
            }
            if (colorCallIdx < 0) {
                throw PatchException("Could not find MarketColor->Compose Long converter in ShortcutCard")
            }
            val moveWide = m.getInstruction(colorCallIdx + 1)
            if (moveWide.opcode != Opcode.MOVE_RESULT_WIDE) {
                throw PatchException("Expected move-result-wide after MarketColor->J in ShortcutCard, got ${moveWide.opcode}")
            }
            val bgReg = (moveWide as OneRegisterInstruction).registerA
            edits += (colorCallIdx + 2) to """
                invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getShortcutCardBgCompose()J
                move-result-wide v$bgReg
            """.trimIndent()

            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }

        // Hook D: Shortcut card inner thumbnail concentric corner radius.
        ShortcutPlayableItemFingerprint.matchSingle().method.let { m ->
            val roundIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/foundation/shape/RoundedCornerShapeKt;" &&
                            it.name == "RoundedCornerShape-0680j_4" &&
                            it.parameterTypes == listOf("F")
                    } == true
            }
            if (roundIdx < 0) {
                throw PatchException("Could not find RoundedCornerShape in ShortcutListPlayableContentItem")
            }
            val radiusReg = (m.getInstruction(roundIdx) as FiveRegisterInstruction).registerC
            m.addInstructions(
                roundIdx,
                """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getShortcutArtworkCornerRadiusDp()F
                    move-result v$radiusReg
                """,
            )
        }

        // Hook E: Vibe picker filter chips (Leoj;.a -> VibeCell).
        VibeCellFingerprint.matchSingle().method.let { m ->
            val edits = mutableListOf<Pair<Int, String>>()

            val tokenCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Lcom/squareup/ui/market/core/theme/MarketStylesheet\$c;" &&
                                it.parameterTypes.isEmpty() &&
                                it.returnType == marketColorType
                        } == true
                }
                .map { it.index }

            if (tokenCalls.size != 4) {
                throw PatchException("Expected 4 MarketStylesheet\$c color token calls in VibeCell, found ${tokenCalls.size}")
            }

            // #0 = I0() selected label color, #2 = j0() unselected label color
            listOf(
                tokenCalls[0] to "getVibeChipSelectedTextArgb",
                tokenCalls[2] to "getVibeChipUnselectedTextArgb",
            ).forEach { (callIdx, bridgeMethod) ->
                val moveObj = m.getInstruction(callIdx + 1)
                if (moveObj.opcode != Opcode.MOVE_RESULT_OBJECT) {
                    throw PatchException("Expected move-result-object after MarketStylesheet\$c call in VibeCell, got ${moveObj.opcode}")
                }
                val textReg = (moveObj as OneRegisterInstruction).registerA
                val scratchReg = textReg + 1
                if (!isRegOverwrittenWithConstBeforeRead(m, callIdx + 2, scratchReg)) {
                    throw PatchException("Scratch register v$scratchReg after callIdx=$callIdx in VibeCell is not provably dead")
                }
                edits += (callIdx + 2) to """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->$bridgeMethod()I
                    move-result v$scratchReg
                    new-instance v$textReg, $marketColorType
                    invoke-direct/range { v$textReg .. v$scratchReg }, $marketColorType-><init>(I)V
                """.trimIndent()
            }

            val bgCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.parameterTypes == listOf(marketColorType) && it.returnType == "J"
                        } == true
                }
                .map { it.index }

            if (bgCalls.size != 2) {
                throw PatchException("Expected 2 MarketColor->J calls in VibeCell, found ${bgCalls.size}")
            }

            // #0 = selected chip pill background, #1 = unselected chip container background
            listOf(
                bgCalls[0] to "getVibeChipSelectedBgCompose",
                bgCalls[1] to "getVibeChipUnselectedBgCompose",
            ).forEach { (callIdx, bridgeMethod) ->
                val moveWide = m.getInstruction(callIdx + 1)
                if (moveWide.opcode != Opcode.MOVE_RESULT_WIDE) {
                    throw PatchException("Expected move-result-wide after MarketColor->J in VibeCell, got ${moveWide.opcode}")
                }
                val bgReg = (moveWide as OneRegisterInstruction).registerA
                edits += (callIdx + 2) to """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->$bridgeMethod()J
                    move-result-wide v$bgReg
                """.trimIndent()
            }

            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }

        // Hook F: Homepage Top App Bar surface-matched Monet background & content colors (AppBarWithActions).
        HomeAppBarFingerprint.matchSingle().method.let { m ->
            val colorCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.parameterTypes == listOf(marketColorType) && it.returnType == "J"
                        } == true
                }
                .map { it.index }

            if (colorCalls.size != 3) {
                throw PatchException("Expected 3 MarketColor->J calls in AppBarWithActions, found ${colorCalls.size}")
            }

            val edits = listOf(
                colorCalls[0] to "getHomeTopBarBgCompose",
                colorCalls[1] to "getHomeTopBarBgCompose",
                colorCalls[2] to "getHomeTopBarContentCompose",
            ).map { (callIdx, bridgeMethod) ->
                val moveWide = m.getInstruction(callIdx + 1)
                if (moveWide.opcode != Opcode.MOVE_RESULT_WIDE) {
                    throw PatchException("Expected move-result-wide after MarketColor->J in AppBarWithActions, got ${moveWide.opcode}")
                }
                val colorReg = (moveWide as OneRegisterInstruction).registerA
                (callIdx + 2) to """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->$bridgeMethod()J
                    move-result-wide v$colorReg
                """.trimIndent()
            }

            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }

        // Hook F2: Guarantee HomeScreen Scaffold container background AND root Modifier.background match TopBar Monet surfaceBase.
        HomeScreenScaffoldFingerprint.matchSingle().method.let { m ->
            val colorCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.parameterTypes == listOf(marketColorType) && it.returnType == "J"
                        } == true
                }
                .map { it.index }

            if (colorCalls.size != 1) {
                throw PatchException(
                    "Expected 1 MarketColor->J call in HomeScreenScaffold, found ${colorCalls.size}"
                )
            }

            val callIdx = colorCalls.single()
            val moveWide = m.getInstruction(callIdx + 1)
            if (moveWide.opcode != Opcode.MOVE_RESULT_WIDE) {
                throw PatchException(
                    "Expected move-result-wide after MarketColor->J in HomeScreenScaffold, got ${moveWide.opcode}"
                )
            }
            val colorReg = (moveWide as OneRegisterInstruction).registerA

            val scaffoldCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/material3/ScaffoldKt;" &&
                                it.name == "Scaffold-TvnljyQ"
                        } == true
                }
                .map { it.index }

            if (scaffoldCalls.size != 1) {
                throw PatchException(
                    "Expected 1 Scaffold-TvnljyQ call in HomeScreenScaffold, found ${scaffoldCalls.size}"
                )
            }

            val scaffoldIdx = scaffoldCalls.single()
            val rangeInsn = m.getInstruction(scaffoldIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 15) {
                throw PatchException("Unexpected Scaffold-TvnljyQ registerCount=${rangeInsn.registerCount}")
            }
            val modReg = rangeInsn.startRegister
            val containerColorReg = rangeInsn.startRegister + 6
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

            val edits = listOf(
                (callIdx + 2) to """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getHomeTopBarBgCompose()J
                    move-result-wide v$colorReg
                """.trimIndent(),
                scaffoldIdx to """
                    move-object/from16 v$s0, v$modReg
                    move-wide/from16 v$s1, v$containerColorReg
                    const/16 v$s3, 0x0
                    const/16 v$s4, 0x2
                    const/16 v$s5, 0x0
                    invoke-static/range { v$s0 .. v$s5 }, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU${'$'}default(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;
                    move-result-object v$modReg
                """.trimIndent(),
            )

            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }

        // Hook F3: Paint Home LazyColumn itself with Monet surfaceBase and notify the fragment
        // Compose host that async Home content has mounted (so post-Loading hardware layers invalidate).
        HomeScreenScrollableContentLazyColumnFingerprint.matchSingle().method.let { m ->
            val lazyCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/foundation/lazy/LazyDslKt;" &&
                                it.name == "LazyColumn"
                        } == true
                }
                .map { it.index }

            if (lazyCalls.size != 1) {
                throw PatchException(
                    "Expected 1 LazyColumn call in ${m.definingClass}.${m.name}, found ${lazyCalls.size}"
                )
            }

            val lazyIdx = lazyCalls.single()
            if (lazyIdx < 4) {
                throw PatchException("Unexpected LazyColumn index $lazyIdx in ${m.definingClass}.${m.name}")
            }
            val rangeInsn = m.getInstruction(lazyIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 13) {
                throw PatchException("Unexpected LazyColumn registerCount=${rangeInsn.registerCount}")
            }

            val modReg = rangeInsn.startRegister
            val shapeReg = modReg + 5
            val colorReg = modReg + 6
            val colorRegHigh = colorReg + 1
            if (modReg > 15 || shapeReg > 15 || colorRegHigh > 15) {
                throw PatchException(
                    "Register out of 4-bit invoke-static range in ${m.definingClass}.${m.name}: mod=v$modReg"
                )
            }

            for (offset in 0..3) {
                val insn = m.getInstruction(lazyIdx - 4 + offset)
                val expectedReg = modReg + 5 + offset
                val isZeroConst4 = insn.opcode == Opcode.CONST_4 &&
                    insn is NarrowLiteralInstruction &&
                    insn.narrowLiteral == 0 &&
                    (insn as OneRegisterInstruction).registerA == expectedReg
                if (!isZeroConst4) {
                    throw PatchException(
                        "Expected const/4 v$expectedReg, #0 at offset ${lazyIdx - 4 + offset} in ${m.definingClass}.${m.name}, got ${insn.opcode}"
                    )
                }
            }

            m.addInstructions(
                lazyIdx - 4,
                """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->getHomeTopBarBgCompose()J
                    move-result-wide v$colorReg
                    invoke-static {}, Landroidx/compose/ui/graphics/RectangleShapeKt;->getRectangleShape()Landroidx/compose/ui/graphics/Shape;
                    move-result-object v$shapeReg
                    invoke-static { v$modReg, v$colorReg, v$colorRegHigh, v$shapeReg }, Landroidx/compose/foundation/BackgroundKt;->background-bw27NRU(Landroidx/compose/ui/Modifier;JLandroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;
                    move-result-object v$modReg
                    invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->notifyFragmentContentMounted()V
                """,
            )
        }

        // Hook G: Native Homepage Pull-to-Refresh (Lvze;.<clinit> + a$d.<init>).
        HomePullToRefreshFlagFingerprint.matchSingle().method.let { m ->
            val zeroIdx = m.instructions.indexOfFirst { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 0
            }
            if (zeroIdx < 0) {
                throw PatchException("Could not find false literal in home-page-pull-to-refresh <clinit>")
            }
            val reg = (m.getInstruction(zeroIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(
                zeroIdx,
                "invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->isPullToRefreshEnabled()Z",
            )
            m.addInstructions(zeroIdx + 1, "move-result v$reg")
        }

        HomeUiStateSuccessInitFingerprint.matchSingle().method.let { m ->
            val iputIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.name == "e"
            }
            if (iputIdx < 0) {
                throw PatchException("Could not find iput-boolean e:Z in home ui a\$d.<init>")
            }
            val reg = (m.getInstruction(iputIdx) as TwoRegisterInstruction).registerA
            m.addInstructions(
                iputIdx,
                """
                    invoke-static {}, $EXPRESSIVE_HOME_BRIDGE_CLASS->isPullToRefreshEnabled()Z
                    move-result v$reg
                """,
            )
        }

        // Hook H: Homepage Declutter (Headliners banner, Promo modules, Merch modules).
        HeadlinersBannerFingerprint.matchSingle().method.addEarlyHideGuard("shouldHideHeadlinersBanner")
        PromoModuleRowFingerprint.matchSingle().method.addEarlyHideGuard("shouldHidePromoModules")
        MerchModuleRowFingerprint.matchSingle().method.addEarlyHideGuard("shouldHideMerchModules")
    }
}
