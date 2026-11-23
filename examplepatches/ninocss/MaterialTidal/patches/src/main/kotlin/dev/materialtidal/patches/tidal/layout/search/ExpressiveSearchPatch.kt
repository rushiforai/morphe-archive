package dev.materialtidal.patches.tidal.layout.search

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_SEARCH_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private val SEARCH_BAR_STYLE_CHOICES = mapOf(
    "Expressive Pill (28dp)" to "pill",
    "Expressive Squircle (18dp)" to "squircle",
)

private fun searchBarStyleToCode(value: String?): Int = when (value) {
    "pill" -> 0
    "squircle" -> 1
    else -> throw PatchException("Invalid searchBarPillStyle option value: $value")
}

private fun invokeStaticSingleRegVoid(reg: Int, methodSig: String): String =
    if (reg <= 15) {
        "invoke-static { v$reg }, $methodSig"
    } else {
        "invoke-static/range { v$reg .. v$reg }, $methodSig"
    }

/** Saves {@code this} at entry and calls {@code bridgeMethodSig} on every {@code return-void}. */
private fun hookAfterInstanceVoid(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(1)
    val saveReg = cloned.implementation!!.registerCount - 1
    val origP0 = cloned.p0Register - 1
    cloned.addInstructions(
        added,
        "move-object/from16 v$saveReg, v$origP0",
    )

    val retIndices = cloned.instructions.withIndex()
        .filter { it.index > added && it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .sortedDescending()
    if (retIndices.isEmpty()) {
        throw PatchException("No return-void found in ${cloned.definingClass}.${cloned.name}")
    }
    for (retIdx in retIndices) {
        cloned.replaceInstruction(
            retIdx,
            "invoke-static/range { v$saveReg .. v$saveReg }, $bridgeMethodSig",
        )
        cloned.addInstructions(retIdx + 1, "return-void")
    }
}

/** Saves {@code (this, view)} at entry and calls {@code bridgeMethodSig} before the last {@code return-void}. */
private fun hookAfterViewCreatedLastReturn(
    method: MutableMethod,
    bridgeMethodSig: String,
) {
    val (cloned, added) = method.addFreeRegisters(2)
    val regCount = cloned.implementation!!.registerCount
    val saveP0 = regCount - 2
    val saveP1 = regCount - 1
    val p0AfterPrologue = cloned.p0Register - 2
    val p1AfterPrologue = cloned.p0Register - 1

    cloned.addInstructions(
        added,
        """
            move-object/from16 v$saveP0, v$p0AfterPrologue
            move-object/from16 v$saveP1, v$p1AfterPrologue
        """.trimIndent(),
    )

    val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (retIdx <= added) {
        throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
    }
    cloned.replaceInstruction(
        retIdx,
        "invoke-static/range { v$saveP0 .. v$saveP1 }, $bridgeMethodSig",
    )
    cloned.addInstructions(retIdx + 1, "return-void")
}

private fun injectFloatBeforeRoundedCornerShape(
    method: MutableMethod,
    bridgeFloatGetter: String,
    expectedCalls: Int,
) {
    val shapeCalls = method.instructions.withIndex()
        .filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_STATIC &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Landroidx/compose/foundation/shape/RoundedCornerShapeKt;" &&
                        it.name == "RoundedCornerShape-0680j_4" &&
                        it.parameterTypes == listOf("F")
                } == true
        }
        .map { it.index }

    if (shapeCalls.size != expectedCalls) {
        throw PatchException(
            "Expected $expectedCalls RoundedCornerShape-0680j_4(F) call(s) in ${method.definingClass}.${method.name}, found ${shapeCalls.size}"
        )
    }

    for (idx in shapeCalls.sortedDescending()) {
        val reg = (method.getInstruction(idx) as FiveRegisterInstruction).registerC
        method.addInstructions(
            idx,
            """
                invoke-static {}, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->$bridgeFloatGetter()F
                move-result v$reg
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val expressiveSearchPatch = patch(
    name = "Expressive Material 3 search",
    description = "Redesigns TIDAL's Search & Explore landing page, default UnifiedSearchView, and refactored Compose Search screen with stadium-pill Monet search bars, frosted sticky glass headers, expressive filter pills, suggestion badges, and Monet-harmonized genre/tag cards.",
    default = true,
) {
    dependsOn(materialYouThemePatch)

    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val searchBarPillStyleOption by stringOption(
        key = "searchBarPillStyle",
        default = "pill",
        values = SEARCH_BAR_STYLE_CHOICES,
        title = "Search bar corner shape",
        description = "Controls the corner style for the Search bar across Search Landing, Active Search, and Compose Search.",
        required = true,
    )

    val expressiveSearchCardsOption by booleanOption(
        key = "expressiveSearchCards",
        default = true,
        title = "Expressive Genre & Explore cards",
        description = "Style Browse/Explore genre tiles, cloud pill tags, and navigation rows as tonal Material 3 Expressive cards.",
        required = true,
    )

    val expressiveSearchHeaderBlurOption by booleanOption(
        key = "expressiveSearchHeaderBlur",
        default = true,
        title = "Frosted glass Search header blur",
        description = "Float scrolling Explore and Search results beneath a frosted GPU-blurred header backdrop (API 31+).",
        required = true,
    )

    execute {
        // 1. Wire MaterialYouConfig Search options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressiveSearchEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "getSearchBarCornerStyle" }
            .returnEarly(searchBarStyleToCode(searchBarPillStyleOption))
        configClass.methods.single { it.name == "isExpressiveSearchCardsEnabled" }
            .returnEarly(expressiveSearchCardsOption ?: true)
        configClass.methods.single { it.name == "isExpressiveSearchHeaderBlurEnabled" }
            .returnEarly(expressiveSearchHeaderBlurOption ?: true)

        // 2. TidalSearchView.<init> -> immediate Monet pill styling (avoids white flash on first draw).
        hookAfterInstanceVoid(
            TidalSearchViewInitFingerprint.matchSingle().method,
            "$EXPRESSIVE_SEARCH_BRIDGE_CLASS->onTidalSearchViewInit(Landroid/view/View;)V",
        )

        // 3. Search / Explore Landing Page (Lis6; extends Ljs5;) lifecycle hooks.
        hookAfterViewCreatedLastReturn(
            SearchLandingOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_SEARCH_BRIDGE_CLASS->onSearchLandingViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        SearchLandingOnDestroyViewFingerprint.matchSingle().method.let { m ->
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    m.p0Register,
                    "$EXPRESSIVE_SEARCH_BRIDGE_CLASS->onSearchLandingDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }

        // 4. Default Active Search (UnifiedSearchView) lifecycle hooks.
        hookAfterViewCreatedLastReturn(
            UnifiedSearchOnViewCreatedFingerprint.matchSingle().method,
            "$EXPRESSIVE_SEARCH_BRIDGE_CLASS->onUnifiedSearchViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )
        UnifiedSearchOnDestroyViewFingerprint.matchSingle().method.let { m ->
            m.addInstructions(
                0,
                invokeStaticSingleRegVoid(
                    m.p0Register,
                    "$EXPRESSIVE_SEARCH_BRIDGE_CLASS->onUnifiedSearchDestroyView(Ljava/lang/Object;)V",
                ),
            )
        }

        // 5. XML Filter Chips (Lb8g;->e) -> Material 3 Expressive stadium pills + pop animation.
        val filterSelectedField = classDefBy(SEARCH_FILTER_MODEL_TYPE)
            .fields
            .singleOrNull { it.type == "Z" }
            ?: throw PatchException("Expected exactly 1 boolean field on $SEARCH_FILTER_MODEL_TYPE")

        UnifiedSearchFilterBindFingerprint.matchSingle().method.let { m ->
            val (cloned, added) = m.addFreeRegisters(2)
            val regCount = cloned.implementation!!.registerCount
            val saveVh = regCount - 2
            val saveFilter = regCount - 1
            if (saveVh > 15 || saveFilter > 15) {
                throw PatchException(
                    "Register out of 4-bit iget range in ${cloned.definingClass}.${cloned.name}: v$saveVh/v$saveFilter"
                )
            }
            val p1AfterPrologue = cloned.p0Register - 1 // (p0Register - 2) + 1
            val p2AfterPrologue = cloned.p0Register     // (p0Register - 2) + 2

            cloned.addInstructions(
                added,
                """
                    move-object/from16 v$saveVh, v$p1AfterPrologue
                    move-object/from16 v$saveFilter, v$p2AfterPrologue
                """.trimIndent(),
            )

            val clickIdx = cloned.instructions.indexOfLast { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/view/View;" && it.name == "setOnClickListener"
                    } == true
            }
            if (clickIdx < 0) {
                throw PatchException("Missing setOnClickListener in ${cloned.definingClass}.${cloned.name}")
            }
            val retIdx = clickIdx + 1
            if (retIdx >= cloned.instructions.size || cloned.getInstruction(retIdx).opcode != Opcode.RETURN_VOID) {
                throw PatchException("Expected return-void after setOnClickListener in ${cloned.definingClass}.${cloned.name}")
            }
            cloned.replaceInstruction(
                retIdx,
                "iget-object v$saveVh, v$saveVh, Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;->itemView:Landroid/view/View;",
            )
            cloned.addInstructions(
                retIdx + 1,
                """
                    check-cast v$saveFilter, $SEARCH_FILTER_MODEL_TYPE
                    iget-boolean v$saveFilter, v$saveFilter, $SEARCH_FILTER_MODEL_TYPE->${filterSelectedField.name}:Z
                    invoke-static/range { v$saveVh .. v$saveFilter }, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->onSearchFilterChipBound(Landroid/view/View;Z)V
                    return-void
                """.trimIndent(),
            )
        }

        // 6. XML Search Suggestions / Recent Searches (Ld6j;->c) -> tonal badge + Monet highlight span.
        UnifiedSearchSuggestionBindFingerprint.matchSingle().method.let { m ->
            val (cloned, added) = m.addFreeRegisters(1)
            val saveVh = cloned.implementation!!.registerCount - 1
            if (saveVh > 15) {
                throw PatchException(
                    "Register out of 4-bit iget range in ${cloned.definingClass}.${cloned.name}: v$saveVh"
                )
            }
            val p2AfterPrologue = cloned.p0Register + 1 // (p0Register - 1) + 2

            cloned.addInstructions(
                added,
                "move-object/from16 v$saveVh, v$p2AfterPrologue",
            )

            val retIdx = cloned.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (retIdx <= added) {
                throw PatchException("No return-void found after prologue in ${cloned.definingClass}.${cloned.name}")
            }
            cloned.replaceInstruction(
                retIdx,
                "iget-object v$saveVh, v$saveVh, Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;->itemView:Landroid/view/View;",
            )
            cloned.addInstructions(
                retIdx + 1,
                """
                    invoke-static/range { v$saveVh .. v$saveVh }, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->onSearchSuggestionBound(Landroid/view/View;)V
                    return-void
                """.trimIndent(),
            )
        }

        // 7. Refactored Compose SearchBar (Ln7g;->a) -> dark Monet container fill + primaryAccent cursor.
        ComposeSearchBarFingerprint.matchSingle().method.let { m ->
            val colorsCallIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/material3/TextFieldDefaults;" &&
                            it.name == "colors-0hiis_0"
                    } == true
            }
            val solidColorInitIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_DIRECT &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/graphics/SolidColor;" &&
                            it.name == "<init>"
                    } == true
            }
            if (colorsCallIdx < 0 || solidColorInitIdx <= colorsCallIdx) {
                throw PatchException("Unexpected Compose SearchBar structure in ${m.definingClass}.${m.name}")
            }

            val igetWides = m.instructions.withIndex()
                .filter { (_, insn) -> insn.opcode == Opcode.IGET_WIDE }
                .map { it.index }
            if (igetWides.size != 10) {
                throw PatchException(
                    "Expected 10 iget-wide instructions in Compose SearchBar, found ${igetWides.size}"
                )
            }

            val firstThreeRefs = igetWides.take(3).map {
                ((m.getInstruction(it) as ReferenceInstruction).reference as FieldReference).name
            }.toSet()
            if (firstThreeRefs.size != 1) {
                throw PatchException(
                    "Expected first 3 iget-wide container reads to share field name in Compose SearchBar, found $firstThreeRefs"
                )
            }
            val cursorReadIdx = igetWides.last()
            if (cursorReadIdx !in (colorsCallIdx + 1) until solidColorInitIdx) {
                throw PatchException("Cursor iget-wide out of expected range in Compose SearchBar")
            }

            val edits = mutableListOf<Pair<Int, String>>()
            for (idx in igetWides.take(3)) {
                val reg = (m.getInstruction(idx) as TwoRegisterInstruction).registerA
                edits += (idx + 1) to """
                    invoke-static {}, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->getSearchBarContainerColorCompose()J
                    move-result-wide v$reg
                """.trimIndent()
            }
            val cursorReg = (m.getInstruction(cursorReadIdx) as TwoRegisterInstruction).registerA
            edits += (cursorReadIdx + 1) to """
                invoke-static {}, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->getSearchBarCursorColorCompose()J
                move-result-wide v$cursorReg
            """.trimIndent()

            for ((idx, smali) in edits.sortedByDescending { it.first }) {
                m.addInstructions(idx, smali)
            }
        }

        // 8. Refactored Compose SearchBar DecorationBox (Ll7g;->invoke) -> stadium pill shape.
        injectFloatBeforeRoundedCornerShape(
            ComposeSearchBarDecorationBoxFingerprint.matchSingle().method,
            "getSearchBarCornerRadiusDp",
            expectedCalls = 1,
        )

        // 9. Refactored Compose FilterItemCell (Lh8g;->a) -> full-pill shape + Monet active/inactive tokens.
        ComposeSearchFilterItemCellFingerprint.matchSingle().method.let { m ->
            val igetWides = m.instructions.withIndex()
                .filter { (_, insn) -> insn.opcode == Opcode.IGET_WIDE }
                .map { it.index }
            if (igetWides.size != 4) {
                throw PatchException(
                    "Expected 4 iget-wide color reads in Compose FilterItemCell, found ${igetWides.size}"
                )
            }

            val bridgeColorGetters = listOf(
                "getFilterChipSelectedTextColorCompose",
                "getFilterChipSelectedBgColorCompose",
                "getFilterChipUnselectedTextColorCompose",
                "getFilterChipUnselectedBgColorCompose",
            )
            for (i in igetWides.indices.reversed()) {
                val idx = igetWides[i]
                val reg = (m.getInstruction(idx) as TwoRegisterInstruction).registerA
                m.addInstructions(
                    idx + 1,
                    """
                        invoke-static {}, $EXPRESSIVE_SEARCH_BRIDGE_CLASS->${bridgeColorGetters[i]}()J
                        move-result-wide v$reg
                    """.trimIndent(),
                )
            }

            injectFloatBeforeRoundedCornerShape(
                m,
                "getFilterChipCornerRadiusDp",
                expectedCalls = 2,
            )
        }
    }
}
