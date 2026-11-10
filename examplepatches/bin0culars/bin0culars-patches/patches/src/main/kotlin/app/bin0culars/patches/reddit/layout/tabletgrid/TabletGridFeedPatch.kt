package app.bin0culars.patches.reddit.layout.tabletgrid

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.FEED
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/TabletGridFeedPatch;"

private fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

@Suppress("unused")
val tabletGridFeedPatch =
    patch(
        name = "Tablet grid feed",
        description = "Shows the feed as a grid with 2 or 3 columns on tablets and other wide screens. Phones are unchanged.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)

        dependsOn(binocularsModsSettingsPatch)

        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "tablet_grid_feed",
                    section = FEED,
                    title = "Tablet grid feed",
                    summary =
                    "Shows Home, Popular and community feeds as a 2–3 column grid on tablets and other wide screens. Phones are unchanged.",
                    default = true,
                ),
            )
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "tablet_grid_columns",
                    section = BinocularsModsSection.FEED,
                    title = "Grid columns",
                    summary = "Auto uses 2 columns on smaller tablets and 3 on wider screens.",
                    parentKey = "tablet_grid_feed",
                    choices = listOf(
                        BinocularsModsChoice("auto", "Auto"),
                        BinocularsModsChoice("two", "2 columns"),
                        BinocularsModsChoice("three", "3 columns"),
                    ),
                    defaultChoice = "auto",
                ),
            )

            val cellsClass = StaggeredCellsFingerprint.classDef
            val calculateCellsMethod =
                cellsClass.methods.firstOrNull { method ->
                    method.returnType == "[I" &&
                        method.parameterTypes.map { it.toString() } == listOf("I", "I")
                } ?: throw PatchException("Could not find (II)[I method in ${cellsClass.type}")

            val implementation =
                calculateCellsMethod.implementation
                    ?: throw PatchException("Method ${calculateCellsMethod.name} has no implementation")
            val p0 = implementation.registerCount - 3
            val p1 = implementation.registerCount - 2

            val matchingIndices = mutableListOf<Pair<Int, Int>>()
            calculateCellsMethod.instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode == Opcode.IGET) {
                    val twoReg = instruction as? TwoRegisterInstruction
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    val isCountField = fieldRef != null && fieldRef.definingClass == cellsClass.type && fieldRef.type == "I"
                    if (twoReg != null && isCountField && twoReg.registerB == p0) {
                        matchingIndices.add(index to twoReg.registerA)
                    }
                }
            }

            if (matchingIndices.isEmpty()) {
                throw PatchException("Could not find iget vX, p0, ${cellsClass.type}->...:I in ${calculateCellsMethod.name}")
            }

            for ((matchIndex, registerX) in matchingIndices.reversed()) {
                val invokeInstruction =
                    if (registerX > 15 || p1 > 15) {
                        if (registerX == p1 + 1) {
                            "invoke-static/range { p1 .. v$registerX }, $EXTENSION_CLASS->columnsForWidth(II)I"
                        } else {
                            "invoke-static {p1, v$registerX}, $EXTENSION_CLASS->columnsForWidth(II)I"
                        }
                    } else {
                        "invoke-static {p1, v$registerX}, $EXTENSION_CLASS->columnsForWidth(II)I"
                    }

                calculateCellsMethod.addInstructions(
                    matchIndex + 1,
                    """
                        $invokeInstruction
                        move-result v$registerX
                    """,
                )
            }

            val originalFirstInstruction = ListFeedFingerprint.method.instructions.first()
            ListFeedFingerprint.method.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p1
                    move-object/from16 v2, p2
                    move-object/from16 v3, p4
                    move-object/from16 v4, p5
                    move-object/from16 v5, p7
                    move-object/from16 v6, p9
                    move-object/from16 v7, p28
                    move/from16 v8, p6
                    invoke-static/range {v0 .. v8}, $EXTENSION_CLASS->masonryFeed(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;F)Z
                    move-result v0
                    if-eqz v0, :continue
                    return-void
                """,
                ExternalLabel("continue", originalFirstInstruction),
            )

            val masonryMethod = MasonryFeedFingerprint.method
            val masonryParams = masonryMethod.parameterTypes.map { it.toString() }

            fillBridge(
                "callMasonry",
                """
                    check-cast p0, ${masonryParams[0]}
                    check-cast p1, ${masonryParams[1]}
                    check-cast p2, ${masonryParams[2]}
                    check-cast p3, ${masonryParams[3]}
                    check-cast p4, ${masonryParams[4]}
                    check-cast p6, ${masonryParams[6]}
                    check-cast p7, ${masonryParams[7]}
                    check-cast p9, ${masonryParams[9]}
                    check-cast p10, ${masonryParams[10]}
                    check-cast p11, ${masonryParams[11]}
                    invoke-static/range {p0 .. p13}, $masonryMethod
                    return-void
                """,
            )

            val paddingType = masonryParams[4]
            val paddingClass = classDefBy(paddingType)
            val hasPaddingConstructor =
                paddingClass.methods.any { method ->
                    method.name == "<init>" &&
                        method.parameterTypes.map { it.toString() } == listOf("F", "F", "F", "F")
                }
            if (!hasPaddingConstructor) {
                throw PatchException("Could not find (FFFF)V constructor in $paddingType")
            }

            fillBridge(
                "newPadding",
                """
                    new-instance p4, $paddingType
                    invoke-direct {p4, p0, p1, p2, p3}, $paddingType-><init>(FFFF)V
                    return-object p4
                """,
            )

            val searchCallMatch = SearchMasonryCallFingerprint.instructionMatches.last()
            val searchMethodInstructions = SearchMasonryCallFingerprint.method.instructions

            val footerField =
                searchMethodInstructions
                    .take(searchCallMatch.index)
                    .findLast { instruction ->
                        instruction.opcode == Opcode.SGET_OBJECT &&
                            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type?.toString() ==
                            "Landroidx/compose/runtime/internal/a;"
                    }?.let { (it as ReferenceInstruction).reference as FieldReference }
                    ?: throw PatchException("Could not find footer field before masonry method call in SearchMasonryCallFingerprint")

            fillBridge(
                "footer",
                """
                    sget-object p0, ${footerField.definingClass}->${footerField.name}:${footerField.type}
                    return-object p0
                """,
            )
        }
    }
