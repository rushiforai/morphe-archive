/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project.
 *
 * Original author(s):
 * - lavinhoque33 (https://github.com/lavinhoque33)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20
 */

package app.morphe.patches.youtube.player.icons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.utils.playservice.is_21_39_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val PLAYER_ICON = "Lapp/morphe/extension/youtube/videoplayer/AppPlayerIconDrawable;"
private const val CLEAR_SCREEN_DRAWABLE = "morphe_shorts_clear_screen"
private const val REEL_CONTENT_CLEAR_MODE_COMMAND = 2011L

// Take the unmodified glyph before Overlay buttons can replace the shared fullscreen bitmaps.
internal val shortsClearScreenIconResourcePatch = resourcePatch {
    dependsOn(versionCheckPatch)

    execute {
        if (!is_21_39_or_greater) return@execute

        val bitmaps = listDecodableFiles("res/drawable*/quantum_ic_fullscreen_white_24.png")
        if (bitmaps.isEmpty()) {
            printWarn("Player icon style: the stock Shorts Clear Screen icon resource was not found.")
        }

        bitmaps.forEach { bitmap ->
            get(bitmap).copyTo(get("${bitmap.substringBeforeLast('/')}/$CLEAR_SCREEN_DRAWABLE.png"), overwrite = true)
        }
    }
}

private val BottomSheetRowFingerprint = Fingerprint(
    parameters = listOf("L"),
    strings = listOf("Text missing for BottomSheetMenuItem."),
)

private val ClearModeExtensionFingerprint = Fingerprint(
    name = "<clinit>",
    filters = listOf(literal(REEL_CONTENT_CLEAR_MODE_COMMAND), methodCall(name = "newSingularGeneratedExtension")),
)

private fun BytecodePatchContext.findClearModeExtension(commandType: String): FieldReference? =
    ClearModeExtensionFingerprint.matchAll(0..Int.MAX_VALUE).mapNotNull { match ->
        val instructions = match.originalMethod.instructions
        val initializer = match.instructionMatches.last().index
        // An extension number is scoped to its containing message (the click command here).
        if (instructions.take(initializer).none { it.getReference<FieldReference>()?.type == commandType }) {
            return@mapNotNull null
        }
        instructions.elementAtOrNull(initializer + 2)?.takeIf { it.opcode == Opcode.SPUT_OBJECT }
            ?.getReference<FieldReference>()
    }.singleOrNull()

private class ClearModeLookup(
    val checkIsLite: MethodReference,
    val checkContainingType: MethodReference,
    val extensions: FieldReference,
    val descriptor: FieldReference,
    val get: MethodReference,
)

private fun BytecodePatchContext.findClearModeLookup(commandType: String, extension: FieldReference): ClearModeLookup? {
    val dispatch = Fingerprint(
        parameters = listOf(commandType, "Ljava/util/Map;"),
        returnType = "V",
        filters = listOf(
            fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = extension.definingClass, type = extension.type),
            methodCall(name = "-\$\$Nest\$smcheckIsLite"),
        ),
    ).matchAll(0..Int.MAX_VALUE).singleOrNull {
        it.instructionMatches.first().instruction.getReference<FieldReference>() == extension
    } ?: return null
    val instructions = dispatch.originalMethod.instructions
    val start = dispatch.instructionMatches.first().index
    val lookup = instructions.drop(start + 1).take(6)
    if (lookup.map { it.opcode } != listOf(
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL,
            Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL,
        )
    ) return null

    return ClearModeLookup(
        lookup[0].getReference<MethodReference>() ?: return null,
        lookup[2].getReference<MethodReference>() ?: return null,
        lookup[3].getReference<FieldReference>() ?: return null,
        lookup[4].getReference<FieldReference>() ?: return null,
        lookup[5].getReference<MethodReference>() ?: return null,
    )
}

private fun BytecodePatchContext.installClearScreenIconHook(): Boolean {
    val builders = BottomSheetRowFingerprint.matchAll(0..Int.MAX_VALUE).map { it.method }
    val modern = builders.singleOrNull { builder -> builder.instructions.any { it.isModernIconLoader() } }
        ?: return false
    val modernInstructions = modern.instructions
    val primaryLoad = modernInstructions.indexOfFirst { it.isModernIconLoader() }
    val iconAccessor = modernInstructions.getOrNull(primaryLoad - 2)?.getReference<MethodReference>() ?: return false
    val rowType = iconAccessor.parameterTypes.singleOrNull()?.toString() ?: return false

    val iconResult = modernInstructions.getOrNull(primaryLoad + 1) as? OneRegisterInstruction ?: return false
    if (iconResult.opcode != Opcode.MOVE_RESULT_OBJECT) return false

    val primaryIconField = modernInstructions.getOrNull(primaryLoad + 3)?.takeIf { it.opcode == Opcode.IPUT_OBJECT }
        ?.getReference<FieldReference>()?.takeIf { it.type == DRAWABLE } ?: return false
    val modernRow = modernInstructions[primaryLoad - 2] as? FiveRegisterInstruction ?: return false
    val legacy = builders.singleOrNull { it.parameterTypes.singleOrNull()?.toString() == rowType } ?: return false
    val legacyInstructions = legacy.instructions
    val rowConstructor = legacyInstructions.filterIsInstance<FiveRegisterInstruction>().singleOrNull {
        val reference = it.getReference<MethodReference>() ?: return@singleOrNull false
        it.opcode == Opcode.INVOKE_DIRECT && reference.name == "<init>" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", rowType)
    } ?: return false
    val legacyLoad = legacyInstructions.indexOfFirst {
        val reference = it.getReference<MethodReference>() ?: return@indexOfFirst false
        it.opcode == Opcode.INVOKE_DIRECT && reference.definingClass == legacy.definingClass &&
            reference.parameterTypes.size == 2 && reference.parameterTypes.first().toString() == iconAccessor.returnType
    }
    val legacyLoader = legacyInstructions.getOrNull(legacyLoad) as? FiveRegisterInstruction ?: return false
    // The primary icon register is free only if the next icon allocation overwrites it.
    val secondaryIconAccessor = legacyInstructions.getOrNull(legacyLoad + 1) as? FiveRegisterInstruction ?: return false
    val secondaryIconResult = legacyInstructions.getOrNull(legacyLoad + 2) as? OneRegisterInstruction ?: return false
    val secondaryIconConsumer = legacyInstructions.getOrNull(legacyLoad + 3) as? OneRegisterInstruction ?: return false
    val legacyIcon = legacyLoader.registerD
    if (secondaryIconAccessor.opcode != Opcode.INVOKE_STATIC || secondaryIconAccessor.registerCount != 1 ||
        secondaryIconAccessor.registerC != rowConstructor.registerE || secondaryIconAccessor.registerC == legacyIcon ||
        secondaryIconResult.opcode != Opcode.MOVE_RESULT_OBJECT || secondaryIconResult.registerA == legacyIcon ||
        secondaryIconConsumer.opcode != Opcode.NEW_INSTANCE || secondaryIconConsumer.registerA != legacyIcon
    ) return false

    // The row's click-command accessor tries both item variants, then the row's default action.
    val commandAccessor = Fingerprint(
        definingClass = iconAccessor.definingClass,
        parameters = listOf(rowType),
        returnType = "L",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        custom = { method, _ ->
            val instructions = method.implementation?.instructions ?: return@Fingerprint false
            instructions.any { it.opcode == Opcode.IF_EQZ } && instructions.count {
                val called = it.getReference<MethodReference>()
                it.opcode == Opcode.INVOKE_STATIC && called != null && called.definingClass == method.definingClass &&
                    called.parameterTypes == method.parameterTypes && called.returnType == method.returnType
            } == 2
        },
    ).matchAll(0..Int.MAX_VALUE).singleOrNull()?.originalMethod ?: return false
    val extension = findClearModeExtension(commandAccessor.returnType) ?: return false
    val lookup = findClearModeLookup(commandAccessor.returnType, extension) ?: return false

    val selectIcon = ImmutableMethodReference(
        modern.definingClass, "patch_shortsClearScreenIcon", listOf(DRAWABLE, rowType), DRAWABLE,
    )
    mutableClassDefBy(modern.definingClass).methods.add(
        ImmutableMethod(
            selectIcon.definingClass,
            selectIcon.name,
            selectIcon.parameterTypes.map { ImmutableMethodParameter(it.toString(), null, null) },
            selectIcon.returnType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $PLAYER_ICON->isFullscreenEnterIcon($DRAWABLE)Z
                    move-result v0
                    if-eqz v0, :done
                    invoke-static {p1}, $commandAccessor
                    move-result-object p1
                    if-eqz p1, :done
                    sget-object v0, $extension
                    invoke-static {v0}, ${lookup.checkIsLite}
                    move-result-object v0
                    invoke-virtual {p1, v0}, ${lookup.checkContainingType}
                    iget-object v1, p1, ${lookup.extensions}
                    iget-object v0, v0, ${lookup.descriptor}
                    invoke-virtual {v1, v0}, ${lookup.get}
                    move-result-object v0
                    if-eqz v0, :done
                    invoke-static {p0}, $PLAYER_ICON->useStockClearScreenIcon($DRAWABLE)$DRAWABLE
                    move-result-object p0
                    :done
                    return-object p0
                """,
            )
        },
    )

    val modernIcon = iconResult.registerA
    modern.addInstructions(
        primaryLoad + 2,
        """
            invoke-static {v$modernIcon, v${modernRow.registerC}}, $selectIcon
            move-result-object v$modernIcon
        """,
    )

    val legacyRow = rowConstructor.registerC
    legacy.addInstructions(
        legacyLoad + 1,
        """
            iget-object v$legacyIcon, v$legacyRow, $primaryIconField
            invoke-static {v$legacyIcon, v${rowConstructor.registerE}}, $selectIcon
            move-result-object v$legacyIcon
            iput-object v$legacyIcon, v$legacyRow, $primaryIconField
        """,
    )
    return true
}

private fun Instruction.isModernIconLoader(): Boolean {
    val method = getReference<MethodReference>() ?: return false
    val parameters = method.parameterTypes
    return opcode == Opcode.INVOKE_STATIC && method.returnType == DRAWABLE && parameters.size == 5 &&
        parameters[0].toString() == "Landroid/content/Context;" &&
        parameters[2].toString() == "Ljava/lang/Integer;" && parameters[4].toString() == "Z"
}

internal val shortsClearScreenIconPatch = bytecodePatch {
    dependsOn(versionCheckPatch, shortsClearScreenIconResourcePatch)

    execute {
        if (is_21_39_or_greater && !installClearScreenIconHook()) {
            printWarn("Player icon style: the Shorts Clear Screen menu icon could not be isolated.")
        }
    }
}
