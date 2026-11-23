package dev.materialtidal.patches.tidal.layout.sheets

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
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXPRESSIVE_SHEETS_BRIDGE_CLASS
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private val SHEET_CORNER_CHOICES = mapOf(
    "Expressive M3 (28dp Sheets / 22dp Menus)" to "expressive",
    "Extra Expressive (32dp Sheets / 24dp Menus)" to "extra",
    "Subtle Rounded (20dp Sheets / 16dp Menus)" to "rounded",
)

private fun sheetCornerChoiceToCode(value: String?): Int = when (value) {
    "expressive" -> 0
    "extra" -> 1
    "rounded" -> 2
    else -> throw PatchException("Invalid sheetCornerStyle option value: $value")
}

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
        // Replace return-void in place so any branch labels targeting return-void land on the hook first.
        cloned.replaceInstruction(
            retIdx,
            "invoke-static/range { v$saveReg .. v$saveReg }, $bridgeMethodSig",
        )
        cloned.addInstructions(retIdx + 1, "return-void")
    }
}

private fun findSingleSurfaceCallIndex(method: MutableMethod): Int {
    val indices = method.instructions.withIndex()
        .filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Landroidx/compose/material3/SurfaceKt;" &&
                        it.name == "Surface-T9BRK9s" &&
                        it.returnType == "V"
                } == true
        }
        .map { it.index }
    if (indices.size != 1) {
        throw PatchException(
            "Expected 1 Surface-T9BRK9s call in ${method.definingClass}.${method.name}, found ${indices.size}"
        )
    }
    return indices.single()
}

@Suppress("unused")
val expressiveSheetsAndMenusPatch = patch(
    name = "Expressive Material 3 bottom sheets & menus",
    description = "Redesigns all TIDAL bottom sheets, track/media context menus, toolbar overflow & dropdown menus, and dialogs across XML Views and Jetpack Compose Material 3 with expressive corners, grouped menu cards, tonal icon badges, pill drag handles, and Monet surfaces.",
    default = true,
) {
    dependsOn(materialYouThemePatch)

    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    val sheetCornerStyleOption by stringOption(
        key = "sheetCornerStyle",
        default = "expressive",
        values = SHEET_CORNER_CHOICES,
        title = "Bottom sheet & menu corner style",
        description = "Controls corner curvature for Material bottom sheets, popup/dropdown menus, and alert dialogs.",
        required = true,
    )

    val groupedContextMenuCardsOption by booleanOption(
        key = "groupedContextMenuCards",
        default = true,
        title = "Segmented grouped context menu rows",
        description = "Style track, album, playlist, and settings bottom-sheet menu items as M3 Expressive grouped tonal cards with circular icon badges.",
        required = true,
    )

    val expressivePopupMenusOption by booleanOption(
        key = "expressivePopupMenus",
        default = true,
        title = "Expressive overflow & dropdown menus",
        description = "Apply 22dp rounded floating Monet containers, clean spacing, and pill ripples to AppCompat popup menus and Compose DropdownMenus.",
        required = true,
    )

    val expressiveDialogsOption by booleanOption(
        key = "expressiveDialogs",
        default = true,
        title = "Expressive Material 3 dialogs",
        description = "Upgrade AlertDialogs and Compose AlertDialogs with 28dp Monet containers, crisp borders, and pill action buttons.",
        required = true,
    )

    execute {
        // 1. Wire MaterialYouConfig options.
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isExpressiveSheetsEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "getSheetCornerStyle" }
            .returnEarly(sheetCornerChoiceToCode(sheetCornerStyleOption))
        configClass.methods.single { it.name == "isGroupedContextMenuCardsEnabled" }
            .returnEarly(groupedContextMenuCardsOption ?: true)
        configClass.methods.single { it.name == "isExpressivePopupMenusEnabled" }
            .returnEarly(expressivePopupMenusOption ?: true)
        configClass.methods.single { it.name == "isExpressiveDialogsEnabled" }
            .returnEarly(expressiveDialogsOption ?: true)

        // Hook 1: Universal Material BottomSheetDialog.onStart -> rounded Monet sheet surface,
        // drag handle pill, edge-to-edge nav bar, and specialized header/broadcast styling.
        hookAfterInstanceVoid(
            BottomSheetDialogOnStartFingerprint.matchSingle().method,
            "$EXPRESSIVE_SHEETS_BRIDGE_CLASS->onBottomSheetDialogStart(Landroid/app/Dialog;)V",
        )

        // Hook 2: TIDAL ContextMenu ListAdapter.onBindViewHolder (jr3) -> segmented grouped rows,
        // tonal icon badges, selected/destructive/disabled Monet states.
        ContextMenuAdapterOnBindFingerprint.matchSingle().method.let { m ->
            val (cloned, added) = m.addFreeRegisters(3)
            val regCount = cloned.implementation!!.registerCount
            val sAdapter = regCount - 3
            val sViewHolder = regCount - 2
            val sPosition = regCount - 1
            val origP0 = cloned.p0Register - 3
            val origP1 = cloned.p0Register - 2
            val origP2 = cloned.p0Register - 1

            cloned.addInstructions(
                added,
                """
                    move-object/from16 v$sAdapter, v$origP0
                    move-object/from16 v$sViewHolder, v$origP1
                    move/from16 v$sPosition, v$origP2
                """.trimIndent(),
            )

            // Hook specifically before the normal return following setOnClickListener
            // (never before Kotlin non-null guard throw/return branches at the very end).
            val clickIdx = cloned.instructions.indexOfLast { insn ->
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroid/view/View;" &&
                            it.name == "setOnClickListener"
                    } == true
            }
            if (clickIdx < 0) {
                throw PatchException("Missing View.setOnClickListener in ${cloned.definingClass}.${cloned.name}")
            }
            val retIdx = clickIdx + 1
            if (retIdx >= cloned.instructions.size || cloned.getInstruction(retIdx).opcode != Opcode.RETURN_VOID) {
                throw PatchException(
                    "Expected return-void right after setOnClickListener in ${cloned.definingClass}.${cloned.name}"
                )
            }
            cloned.addInstructions(
                retIdx,
                "invoke-static/range { v$sAdapter .. v$sPosition }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->onContextMenuItemBound(Ljava/lang/Object;Ljava/lang/Object;I)V",
            )
        }

        // Hook 3: AppCompat ListPopupWindow.show() -> rounded floating Monet PopupWindow background & padding
        // before buildDropDown(), and dividerless clipped DropDownListView right after buildDropDown().
        ListPopupWindowShowFingerprint.matchSingle().method.let { m ->
            val buildIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_DIRECT &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/appcompat/widget/ListPopupWindow;" &&
                            it.name == "buildDropDown" &&
                            it.returnType == "I"
                    } == true
            }
            if (buildIdx < 0) {
                throw PatchException("Missing buildDropDown() in ListPopupWindow.show")
            }
            val p0 = m.p0Register
            if (m.getInstruction(buildIdx + 1).opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Expected move-result after buildDropDown() in ListPopupWindow.show")
            }
            m.addInstructions(
                buildIdx + 2,
                "invoke-static/range { v$p0 .. v$p0 }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->onListPopupWindowAfterBuild(Ljava/lang/Object;)V",
            )
            m.addInstructions(
                buildIdx,
                "invoke-static/range { v$p0 .. v$p0 }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->onListPopupWindowBeforeBuild(Ljava/lang/Object;)V",
            )
        }

        // Hook 4: AppCompat MenuAdapter.getView -> expressive 14dp pill rows, Monet checked/icon states.
        MenuAdapterGetViewFingerprint.matchSingle().method.let { m ->
            val (cloned, added) = m.addFreeRegisters(3)
            val regCount = cloned.implementation!!.registerCount
            val sAdapter = regCount - 3
            val sView = regCount - 2
            val sPosition = regCount - 1
            val origP0 = cloned.p0Register - 3
            val origP1 = cloned.p0Register - 2

            cloned.addInstructions(
                added,
                """
                    move-object/from16 v$sAdapter, v$origP0
                    move/from16 v$sPosition, v$origP1
                """.trimIndent(),
            )

            val retIndices = cloned.instructions.withIndex()
                .filter { it.index > added && it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .sortedDescending()
            if (retIndices.isEmpty()) {
                throw PatchException("No return-object found in MenuAdapter.getView")
            }
            for (retIdx in retIndices) {
                val retReg = (cloned.getInstruction(retIdx) as OneRegisterInstruction).registerA
                cloned.addInstructions(
                    retIdx,
                    """
                        move-object/from16 v$sView, v$retReg
                        invoke-static/range { v$sAdapter .. v$sPosition }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->onPopupMenuItemView(Ljava/lang/Object;Landroid/view/View;I)V
                    """.trimIndent(),
                )
            }
        }

        // Hook 5: AppCompat AlertController.installContent -> 28dp Monet AlertDialog container,
        // clean list dividers, and pill action buttons.
        hookAfterInstanceVoid(
            AlertControllerInstallContentFingerprint.matchSingle().method,
            "$EXPRESSIVE_SHEETS_BRIDGE_CLASS->onAlertControllerInstalled(Ljava/lang/Object;)V",
        )

        // Hook 6: Compose M3 SheetBottomTokens drag handle dimensions (40dp x 4.5dp).
        ComposeSheetBottomTokensClinitFingerprint.matchSingle().method.let { m ->
            val dpCalls = m.instructions.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_STATIC &&
                        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.definingClass == "Landroidx/compose/ui/unit/Dp;" &&
                                it.name == "constructor-impl" &&
                                it.parameterTypes == listOf("F")
                        } == true
                }
                .map { it.index }
            if (dpCalls.size != 2) {
                throw PatchException("Expected 2 Dp.constructor-impl calls in SheetBottomTokens.<clinit>, found ${dpCalls.size}")
            }
            val heightReg = (m.getInstruction(dpCalls[0]) as FiveRegisterInstruction).registerC
            val widthReg = (m.getInstruction(dpCalls[1]) as FiveRegisterInstruction).registerC
            m.addInstructions(
                dpCalls[1],
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getDragHandleWidthDp()F
                    move-result v$widthReg
                """.trimIndent(),
            )
            m.addInstructions(
                dpCalls[0],
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getDragHandleHeightDp()F
                    move-result v$heightReg
                """.trimIndent(),
            )
        }

        // Hook 7: Compose M3 ModalBottomSheetContent-IQkwcL4 -> expressive top corners, Monet surfaceContainer
        // + onSurface contentColor, and 1dp outlineVariant border.
        ComposeModalBottomSheetContentFingerprint.matchSingle().method.let { m ->
            val (cloned, _) = m.addFreeRegisters(4)
            val regCount = cloned.implementation!!.registerCount
            val s0 = regCount - 4
            val s1 = regCount - 3
            val s2 = regCount - 2
            val s3 = regCount - 1
            if (s3 > 255) {
                throw PatchException("Register index overflow in ModalBottomSheetContent: s3=$s3")
            }

            val surfaceIdx = findSingleSurfaceCallIndex(cloned)
            val rangeInsn = cloned.getInstruction(surfaceIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 13) {
                throw PatchException("Unexpected Surface-T9BRK9s registerCount=${rangeInsn.registerCount}")
            }
            val r0 = rangeInsn.startRegister
            val shapeReg = r0 + 1
            val containerReg = r0 + 2
            val containerRegHi = containerReg + 1
            val contentReg = r0 + 4
            val contentRegHi = contentReg + 1
            val borderReg = r0 + 8
            val defaultReg = r0 + 12

            cloned.addInstructionsWithLabels(
                surfaceIdx,
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->isExpressiveSheetsEnabled()Z
                    move-result v$s0
                    if-eqz v$s0, :mt_skip_compose_sheet
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getSheetCornerRadiusDp()F
                    move-result v$s0
                    move/from16 v$s1, v$s0
                    const/16 v$s2, 0x0
                    const/16 v$s3, 0x0
                    invoke-static/range { v$s0 .. v$s3 }, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->RoundedCornerShape-a9UjIt4(FFFF)Landroidx/compose/foundation/shape/RoundedCornerShape;
                    move-result-object v$shapeReg
                    invoke-static/range { v$containerReg .. v$containerRegHi }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->resolveSheetContainerColorCompose(J)J
                    move-result-wide v$containerReg
                    invoke-static/range { v$contentReg .. v$contentRegHi }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->resolveSheetContentColorCompose(J)J
                    move-result-wide v$contentReg
                    const v$s0, 0x3f800000
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getSheetBorderColorCompose()J
                    move-result-wide v$s1
                    invoke-static/range { v$s0 .. v$s2 }, Landroidx/compose/foundation/BorderStrokeKt;->BorderStroke-cXLIe8U(FJ)Landroidx/compose/foundation/BorderStroke;
                    move-result-object v$borderReg
                    and-int/lit8 v$defaultReg, v$defaultReg, -0x41
                    :mt_skip_compose_sheet
                    nop
                """.trimIndent(),
            )
        }

        // Hook 8: Compose M3 MenuTokens default container shape -> CornerLarge (expressive rounded menus).
        ComposeMenuTokensClinitFingerprint.matchSingle().method.let { m ->
            val shapeIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                        it.definingClass == "Landroidx/compose/material3/tokens/ShapeKeyTokens;" &&
                            it.name == "CornerExtraSmall"
                    } == true
            }
            if (shapeIdx < 0) {
                throw PatchException("Missing ShapeKeyTokens.CornerExtraSmall in MenuTokens.<clinit>")
            }
            val reg = (m.getInstruction(shapeIdx) as OneRegisterInstruction).registerA
            m.replaceInstruction(
                shapeIdx,
                "sget-object v$reg, Landroidx/compose/material3/tokens/ShapeKeyTokens;->CornerLarge:Landroidx/compose/material3/tokens/ShapeKeyTokens;",
            )
        }

        // Hook 9: Compose M3 MenuKt.DropdownMenuItemHorizontalPadding -> 16dp.
        ComposeMenuKtClinitFingerprint.matchSingle().method.let { m ->
            val sputIdx = m.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.SPUT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                        it.definingClass == "Landroidx/compose/material3/MenuKt;" &&
                            it.name == "DropdownMenuItemHorizontalPadding" &&
                            it.type == "F"
                    } == true
            }
            if (sputIdx < 0) {
                throw PatchException("Missing DropdownMenuItemHorizontalPadding sput in MenuKt.<clinit>")
            }
            val dpIdx = ((sputIdx - 4).coerceAtLeast(0) until sputIdx).lastOrNull { idx ->
                val insn = m.getInstruction(idx)
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/unit/Dp;" &&
                            it.name == "constructor-impl" &&
                            it.parameterTypes == listOf("F")
                    } == true
            } ?: throw PatchException("Missing Dp.constructor-impl before DropdownMenuItemHorizontalPadding")
            val reg = (m.getInstruction(dpIdx) as FiveRegisterInstruction).registerC
            m.addInstructions(
                dpIdx,
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getMenuItemHorizontalPaddingDp()F
                    move-result v$reg
                """.trimIndent(),
            )
        }

        // Hook 10: Compose M3 DropdownMenuContent-Qj0Zi0g -> 22dp rounded container, Monet surfaceContainerHigh,
        // elevated shadow, and crisp 1dp border when caller did not supply a custom border.
        ComposeDropdownMenuContentFingerprint.matchSingle().method.let { m ->
            val (cloned, _) = m.addFreeRegisters(3)
            val regCount = cloned.implementation!!.registerCount
            val s0 = regCount - 3
            val s1 = regCount - 2
            val s2 = regCount - 1
            if (s2 > 255) {
                throw PatchException("Register index overflow in DropdownMenuContent: s2=$s2")
            }

            val surfaceIdx = findSingleSurfaceCallIndex(cloned)
            val rangeInsn = cloned.getInstruction(surfaceIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 13) {
                throw PatchException("Unexpected Surface-T9BRK9s registerCount=${rangeInsn.registerCount}")
            }
            val r0 = rangeInsn.startRegister
            val shapeReg = r0 + 1
            val containerReg = r0 + 2
            val containerRegHi = containerReg + 1
            val shadowReg = r0 + 7
            val borderReg = r0 + 8

            cloned.addInstructionsWithLabels(
                surfaceIdx,
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->isExpressivePopupMenusEnabled()Z
                    move-result v$s0
                    if-eqz v$s0, :mt_skip_compose_menu
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getMenuCornerRadiusDp()F
                    move-result v$s0
                    invoke-static/range { v$s0 .. v$s0 }, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->RoundedCornerShape-0680j_4(F)Landroidx/compose/foundation/shape/RoundedCornerShape;
                    move-result-object v$shapeReg
                    invoke-static/range { v$containerReg .. v$containerRegHi }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->resolveMenuContainerColorCompose(J)J
                    move-result-wide v$containerReg
                    const v$shadowReg, 0x41000000
                    if-nez v$borderReg, :mt_skip_compose_menu
                    const v$s0, 0x3f800000
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getMenuBorderColorCompose()J
                    move-result-wide v$s1
                    invoke-static/range { v$s0 .. v$s2 }, Landroidx/compose/foundation/BorderStrokeKt;->BorderStroke-cXLIe8U(FJ)Landroidx/compose/foundation/BorderStroke;
                    move-result-object v$borderReg
                    :mt_skip_compose_menu
                    nop
                """.trimIndent(),
            )
        }

        // Hook 11: Compose M3 AlertDialogContent-4hvqGtA -> 28dp rounded container, Monet surfaceContainerHigh,
        // and 1dp outlineVariant border.
        ComposeAlertDialogContentFingerprint.matchSingle().method.let { m ->
            val (cloned, _) = m.addFreeRegisters(3)
            val regCount = cloned.implementation!!.registerCount
            val s0 = regCount - 3
            val s1 = regCount - 2
            val s2 = regCount - 1
            if (s2 > 255) {
                throw PatchException("Register index overflow in AlertDialogContent: s2=$s2")
            }

            val surfaceIdx = findSingleSurfaceCallIndex(cloned)
            val rangeInsn = cloned.getInstruction(surfaceIdx) as RegisterRangeInstruction
            if (rangeInsn.registerCount != 13) {
                throw PatchException("Unexpected Surface-T9BRK9s registerCount=${rangeInsn.registerCount}")
            }
            val r0 = rangeInsn.startRegister
            val shapeReg = r0 + 1
            val containerReg = r0 + 2
            val containerRegHi = containerReg + 1
            val borderReg = r0 + 8
            val defaultReg = r0 + 12

            cloned.addInstructionsWithLabels(
                surfaceIdx,
                """
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->isExpressiveDialogsEnabled()Z
                    move-result v$s0
                    if-eqz v$s0, :mt_skip_compose_dialog
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getDialogCornerRadiusDp()F
                    move-result v$s0
                    invoke-static/range { v$s0 .. v$s0 }, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->RoundedCornerShape-0680j_4(F)Landroidx/compose/foundation/shape/RoundedCornerShape;
                    move-result-object v$shapeReg
                    invoke-static/range { v$containerReg .. v$containerRegHi }, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->resolveDialogContainerColorCompose(J)J
                    move-result-wide v$containerReg
                    const v$s0, 0x3f800000
                    invoke-static {}, $EXPRESSIVE_SHEETS_BRIDGE_CLASS->getDialogBorderColorCompose()J
                    move-result-wide v$s1
                    invoke-static/range { v$s0 .. v$s2 }, Landroidx/compose/foundation/BorderStrokeKt;->BorderStroke-cXLIe8U(FJ)Landroidx/compose/foundation/BorderStroke;
                    move-result-object v$borderReg
                    and-int/lit8 v$defaultReg, v$defaultReg, -0x41
                    :mt_skip_compose_dialog
                    nop
                """.trimIndent(),
            )
        }

        // Hook 12: Compose M3 ModalBottomSheetDialogWrapper.<init> -> 22dp native backdrop blur behind sheet.
        ComposeModalBottomSheetDialogWrapperInitFingerprint.matchSingle().method.let { m ->
            hookAfterInstanceVoid(
                m,
                "$EXPRESSIVE_SHEETS_BRIDGE_CLASS->onComposeBottomSheetWindowCreated(Landroid/app/Dialog;)V",
            )
        }

        // Hook 13: Compose UI DialogWrapper.<init> -> 18dp native backdrop blur behind Compose AlertDialog.
        ComposeDialogWrapperInitFingerprint.matchSingle().method.let { m ->
            hookAfterInstanceVoid(
                m,
                "$EXPRESSIVE_SHEETS_BRIDGE_CLASS->onComposeDialogWindowCreated(Landroid/app/Dialog;)V",
            )
        }
    }
}
