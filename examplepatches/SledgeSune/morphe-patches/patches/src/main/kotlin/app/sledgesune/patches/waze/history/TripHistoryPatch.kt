package app.sledgesune.patches.waze.history

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_WAZE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/waze/TripHistoryPatch;"
private const val NAVIGATION_INFO = "Lcom/waze/navigate/NavigationInfoNativeManagerBase;"

// region Fingerprints on real names (manifest classes and native callbacks keep their names)

private object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/waze/mobile/WazeMobileApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** The native core reports that navigation started (true) or stopped (false). */
private object NavigationStateChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onNavigationStateChangedJNI",
    returnType = "V",
    parameters = listOf("Z", "I"),
)

/** Called repeatedly while navigating. Used as a "still driving" heartbeat. */
private object EtaSecondsChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onCurrentEtaSecondsChangedJNI",
    returnType = "V",
    parameters = listOf("I"),
)

/** Remaining distance to the destination (DistanceUpdate protobuf). Fallback for the trip distance. */
private object EtaDistanceChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onEtaDistanceChangedJNI",
    returnType = "V",
    parameters = listOf("[B"),
)

/** The destination of the current route (GenericPlace protobuf). */
private object RoutingDestinationChangedFingerprint : Fingerprint(
    definingClass = NAVIGATION_INFO,
    name = "onRoutingDestinationChangedJNI",
    returnType = "V",
    parameters = listOf("[B"),
)

/** The native core reports arrival at the destination. */
private object ReachedDestinationFingerprint : Fingerprint(
    definingClass = "Lcom/waze/NativeManagerBase;",
    name = "onReachedDestinationJNI",
    returnType = "V",
    parameters = listOf(),
)

// endregion

// region Fingerprints on strings (obfuscated classes)

/**
 * Builds the headers the app adds when it loads Waze's own web pages
 * (obfuscated, e.g. `Lcom/waze/sharedui/web/g;->a(II)Ljava/util/Map;` in 5.27.4.900).
 * They identify the signed-in app user to www.waze.com.
 */
private object WebClientHeadersFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    parameters = listOf("I", "I"),
    filters = listOf(string("X-Waze-Mobile-RT-Token")),
)

/**
 * The action list of the side menu, a Compose function
 * (obfuscated, e.g. `Lcom/waze/ui/n/ae;->c(ZLcom/waze/ui/n/ah;Lg/h/a/l;Landroidx/compose/runtime/Composer;I)V`).
 * Each entry (Plan a drive, Inbox, Settings, …, Shut off) is one call to the same menu-row function,
 * followed by a 24 dp Spacer.
 */
private object MainMenuActionsFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.waze.ui.main_menu.MainMenuActions (", StringComparisonType.STARTS_WITH),
    ),
)

/**
 * Builds the "Where to?" empty-state list (obfuscated, e.g. `Lcom/waze/search/h/au;`).
 * The Recent section loops over GenericPlaceListItems and turns each into a DestinationCell.
 */
private object SearchEmptyStateListFingerprint : Fingerprint(
    filters = listOf(
        string(
            "null cannot be cast to non-null type " +
                "com.waze.search.domain.SearchEmptyStateListBuilder.Item.GenericPlaceListItem"
        ),
    ),
)

/** `DestinationCell.toString()` (obfuscated `Lcom/waze/search/e/s;`): names its fields. */
private object DestinationCellToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("DestinationCell(id=")),
)

/** `PlainText.toString()`: the trailing-text variant that shows plain text. */
private object PlainTextToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("PlainText(text=")),
)

/** `Text.toString()`: the UI text model holding a plain String. */
private object TextToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("Text(value=")),
)

// endregion

/** Makes an extension stub method (`static String x() { return ""; }`) return [value] instead. */
private fun setExtensionString(methodName: String, value: String) {
    val method = Fingerprint(
        definingClass = EXTENSION_CLASS,
        name = methodName,
        returnType = "Ljava/lang/String;",
        parameters = listOf(),
    ).method
    method.addInstructions(
        0,
        """
            const-string v0, "$value"
            return-object v0
        """
    )
}

private fun javaName(type: String) = type.removePrefix("L").removeSuffix(";").replace('/', '.')

private fun areRegisters4Bit(vararg registers: Int) = registers.all { it < 16 }

@Suppress("unused")
val tripHistoryPatch = patch(
    name = "Trip history",
    description = "Records how long each drive took and how far you drove. Shows it next to each place " +
        "under Recent in \"Where to?\", and lists all drives under \"Trip history\" in the side menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        // Range invokes are used for parameters, since parameter registers can be above v15.
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onApplicationCreate(Landroid/app/Application;)V"
        )

        // region Recording

        NavigationStateChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onNavigationStateChanged(ZI)V"
        )
        EtaSecondsChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onNavigationHeartbeat(I)V"
        )
        EtaDistanceChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onRemainingDistance([B)V"
        )
        RoutingDestinationChangedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onDestinationChanged([B)V"
        )
        ReachedDestinationFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS->onArrived()V"
        )

        // endregion

        // region Names the extension reaches by reflection

        WebClientHeadersFingerprint.method.let {
            setExtensionString("webHeadersClass", javaName(it.definingClass))
            setExtensionString("webHeadersMethod", it.name)
        }

        DestinationCellToStringFingerprint.method.apply {
            val instructions = instructions.toList()
            fun fieldAfter(label: String): String {
                val labelIndex = instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label
                }
                if (labelIndex < 0) throw PatchException("\"$label\" not found in DestinationCell.toString()")
                val field = instructions.drop(labelIndex).firstNotNullOfOrNull {
                    if (it.opcode == Opcode.IGET_OBJECT) (it as ReferenceInstruction).reference as FieldReference else null
                } ?: throw PatchException("Field after \"$label\" not found")
                return field.name
            }
            setExtensionString("trailingTextField", fieldAfter(", trailingText="))
            setExtensionString("secondaryTrailingTextField", fieldAfter(", secondaryTrailingText="))
        }
        setExtensionString("plainTextClass", javaName(PlainTextToStringFingerprint.classDef.type))
        setExtensionString("textClass", javaName(TextToStringFingerprint.classDef.type))

        // endregion

        // region Recent: decorate each DestinationCell of the Recent section

        SearchEmptyStateListFingerprint.method.apply {
            val instructions = instructions.toList()
            val castMessageIndex = SearchEmptyStateListFingerprint.instructionMatches.first().index

            val itemCast = instructions.drop(castMessageIndex).first { it.opcode == Opcode.CHECK_CAST }
            val itemRegister = (itemCast as OneRegisterInstruction).registerA

            // The call that turns the item into a cell, then its move-result-object.
            val callIndex = (castMessageIndex until instructions.size).first {
                val reference = (instructions[it] as? ReferenceInstruction)?.reference as? MethodReference
                instructions[it].opcode == Opcode.INVOKE_DIRECT && reference?.definingClass == definingClass &&
                    reference.parameterTypes.size == 2 && reference.parameterTypes[1] == "I"
            }
            val resultIndex = callIndex + 1
            val result = instructions[resultIndex]
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Unexpected instruction after the Recent cell factory: ${result.opcode}")
            }
            val cellRegister = (result as OneRegisterInstruction).registerA
            if (!areRegisters4Bit(cellRegister, itemRegister)) {
                throw PatchException("Recent cell registers too high: v$cellRegister, v$itemRegister")
            }

            addInstruction(
                resultIndex + 1,
                "invoke-static { v$cellRegister, v$itemRegister }, " +
                    "$EXTENSION_CLASS->decorateRecentCell(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }

        // endregion

        // region Side menu: add a "Trip history" row after the last entry

        MainMenuActionsFingerprint.method.apply {
            val instructions = instructions.toList()

            val rowCalls = instructions.withIndex().filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_STATIC_RANGE && reference != null &&
                    reference.parameterTypes.size == 11 && reference.parameterTypes[0] == "Ljava/lang/String;" &&
                    reference.parameterTypes[8] == "Landroidx/compose/runtime/Composer;"
            }
            if (rowCalls.isEmpty()) throw PatchException("Side menu row calls not found")
            val rowFunction = (rowCalls.last().value as ReferenceInstruction).reference as MethodReference
            val rowParameters = rowFunction.parameterTypes.map { it.toString() }
            val iconType = rowParameters[5]
            val onClickType = rowParameters[7]

            // The icon model's constructor: (image, ?, Dp, defaults mask).
            val iconConstructorIndex = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                it.opcode == Opcode.INVOKE_DIRECT && reference?.definingClass == iconType &&
                    reference.name == "<init>" && reference.parameterTypes.size == 4 &&
                    reference.parameterTypes[3] == "I"
            }
            if (iconConstructorIndex < 0) throw PatchException("Side menu icon constructor not found")
            val iconCall = instructions[iconConstructorIndex] as FiveRegisterInstruction
            val iconConstructor = (iconCall as ReferenceInstruction).reference as MethodReference
            val iconParameters = iconConstructor.parameterTypes.joinToString("")

            // The image model holding a drawable resource id: built with <init>(I) just before, in the register
            // the icon constructor gets as its image.
            val imageType = (iconConstructorIndex - 1 downTo 0).firstNotNullOfOrNull { index ->
                val instruction = instructions[index]
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (instruction.opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
                    reference.parameterTypes.map { type -> type.toString() } == listOf("I") &&
                    (instruction as FiveRegisterInstruction).registerC == iconCall.registerD
                ) reference.definingClass else null
            } ?: throw PatchException("Side menu image model not found")

            // Insert before the closing Spacer, after the last row.
            val spacerIndex = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroidx/compose/foundation/layout/SpacerKt;" && reference.name == "Spacer"
            }
            if (spacerIndex < rowCalls.last().index) throw PatchException("Side menu Spacer not found")
            val composerRegister = (instructions[spacerIndex] as FiveRegisterInstruction).registerD
            val insertIndex = rowCalls.last().index + 1

            val locals = implementation!!.registerCount - parameterRegisterCount()
            if (locals < 27) throw PatchException("Side menu method has too few registers: $locals")

            addInstructions(
                insertIndex,
                """
                    invoke-static { }, $EXTENSION_CLASS->menuTitle()Ljava/lang/String;
                    move-result-object v15
                    sget-object v16, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier${'$'}Companion;
                    check-cast v16, Landroidx/compose/ui/Modifier;
                    const/16 v17, 0x0
                    const/16 v18, 0x0
                    const-wide/16 v19, 0x0
                    new-instance v21, $iconType
                    new-instance v22, $imageType
                    invoke-static { }, $EXTENSION_CLASS->menuIcon()I
                    move-result v23
                    invoke-direct/range { v22 .. v23 }, $imageType-><init>(I)V
                    const/16 v23, 0x0
                    const/16 v24, 0x0
                    const/16 v25, 0x6
                    invoke-direct/range { v21 .. v25 }, $iconType-><init>(${iconParameters})V
                    const/16 v22, 0x0
                    invoke-static { }, $EXTENSION_CLASS->menuOnClick()Ljava/lang/Object;
                    move-result-object v23
                    check-cast v23, $onClickType
                    move-object/from16 v24, v$composerRegister
                    const/16 v25, 0x0
                    const/16 v26, 0x50
                    invoke-static/range { v15 .. v26 }, $rowFunction
                """
            )
            setExtensionString("onClickInterface", javaName(onClickType))
        }

        // endregion
    }
}

/** Registers used by `this` and the parameters (wide types take two). */
private fun com.android.tools.smali.dexlib2.iface.Method.parameterRegisterCount(): Int {
    val isStatic = accessFlags and com.android.tools.smali.dexlib2.AccessFlags.STATIC.value != 0
    return (if (isStatic) 0 else 1) + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
}
