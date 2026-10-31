/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.pip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.facebook.downloads.reel.MoreSheet
import app.morphe.patches.facebook.downloads.reel.implementClick
import app.morphe.patches.facebook.downloads.reel.rowArguments
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireFreeAt
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

/** The extension class that answers the row and handles its tap. */
internal const val PIP_ROW_HANDLER = "Lapp/morphe/extension/facebook/media/PictureInPictureRow;"

/** The id the added row carries, in the place Facebook's rows carry theirs. */
internal const val PIP_ROW_ID = "hushfacebook_picture_in_picture"

/** The helper this adds to the sheet builder's class. */
internal const val PIP_ROW_HELPER = "hushfacebookPipRow"

private const val CONTEXT = "Landroid/content/Context;"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"

/**
 * The scoped context among the More sheet builder's parameters: the one whose class keeps exactly
 * one Context of its own, the screen the sheet is built for. Its position, type and that field.
 */
internal class SheetContext(val parameter: Int, val type: String, val field: FieldReference)

internal fun BytecodePatchContext.sheetContext(sheet: MoreSheet): SheetContext {
    val parameters = sheet.builder.parameterTypes.map(CharSequence::toString)
    val found = parameters.withIndex().mapNotNull { (index, type) ->
        val fields = classDefByOrNull(type)?.fields?.filter {
            it.type == CONTEXT && !AccessFlags.STATIC.isSet(it.accessFlags)
        }.orEmpty()
        fields.singleOrNull()?.let { SheetContext(index, type, ImmutableFieldReference(type, it.name, CONTEXT)) }
    }
    // 585's builder takes the scoped context twice (same class, two parameters): either one answers, so the first is used.
    val type = found.map { it.type }.distinct().singleOrPatchException("$PATCH: the one kind of parameter of the More sheet builder that keeps one Context")
    return found.first { it.type == type }
}

/**
 * Puts a Picture-in-picture row in a reel's More sheet, right before Clear mode, drawn with Clear
 * mode's icon (Facebook keeps no icon name to find a picture-in-picture one by). A helper on the
 * builder's class hands the sheet's Context to [PIP_ROW_HANDLER] and builds the row when it gets a
 * handler back, which it does only while the window is armed on that screen. The handler class is
 * made to implement the row's click interface, with the interface's one method calling its `run()`.
 */
internal fun BytecodePatchContext.addPictureInPictureRow(sheet: MoreSheet) {
    val builder = sheet.builder
    val context = sheetContext(sheet)
    val list = builder.parameterTypes.map(CharSequence::toString).indices
        .filter { builder.parameterTypes[it].toString() == LIST }
        .singleOrPatchException("$PATCH: the one row list parameter of ${builder.definingClass}->${builder.name}")

    // The two values go to v0 and v1 first thing in the builder, proved free there before anything changes.
    builder.requireFreeAt(PATCH, 0, listOf(0, 1))
    implementClick(sheet, PIP_ROW_HANDLER)

    // The helper, with fresh registers: v0 to v7 for the handler, v8 up for the row.
    val rowParameters = sheet.row.parameterTypes.map(CharSequence::toString)
    val helperParameters = listOf(context.type, LIST)
    val locals = maxOf(16, 9 + rowParameters.size)
    val icon = sheet.clearModeIcon
    val wrap = sheet.iconWrap
    val helper = ImmutableMethod(
        builder.definingClass,
        PIP_ROW_HELPER,
        helperParameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(locals + helperParameters.size),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                move-object/from16 v0, p0
                if-eqz v0, :done
                iget-object v1, v0, ${context.field}
                invoke-static { v1 }, $PIP_ROW_HANDLER->forSheet($CONTEXT)$PIP_ROW_HANDLER
                move-result-object v7
                if-eqz v7, :done
                check-cast v7, ${sheet.click}
                sget-object v6, ${icon.definingClass}->${icon.name}:${icon.type}
                invoke-static { v6 }, ${wrap.definingClass}->${wrap.name}(${wrap.parameterTypes.single()})${wrap.returnType}
                move-result-object v6
                invoke-static { }, $PIP_ROW_HANDLER->label()$STRING
                move-result-object v5
                new-instance v8, ${sheet.row.definingClass}
${rowArguments(rowParameters, sheet.click, wrap.returnType, PIP_ROW_ID)}
                invoke-direct/range { v8 .. v${8 + rowParameters.size} }, ${sheet.row.definingClass}-><init>(${rowParameters.joinToString("")})V
                move-object/from16 v0, p1
                invoke-interface { v0, v8 }, $LIST->add($OBJECT)Z
                :done
                return-void
            """,
        )
    }
    mutableClassDefBy(builder.definingClass).methods.add(helper)

    // First thing in the builder, before its own checks.
    builder.addInstructions(
        0,
        """
            move-object/from16 v0, ${builder.parameterRegister(context.parameter)}
            move-object/from16 v1, ${builder.parameterRegister(list)}
            invoke-static { v0, v1 }, ${builder.definingClass}->$PIP_ROW_HELPER(${helperParameters.joinToString("")})V
        """,
    )
}
