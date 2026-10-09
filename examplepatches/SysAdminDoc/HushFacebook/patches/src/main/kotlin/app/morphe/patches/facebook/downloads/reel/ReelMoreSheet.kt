/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.parameterRegister
import app.morphe.patches.facebook.misc.extension.requireFreeAt
import app.morphe.util.findMutableMethodOf
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** The id Facebook gives the More sheet's Clear mode row, in the one method that adds it. */
internal const val CLEAR_MODE_ROW = "fds_control_clear_mode"

/** The id of Facebook's own download row, offered only on your own videos; its icon is borrowed. */
internal const val OWN_DOWNLOAD_ROW = "fds_control_download_video"

/** The id the added row carries, in the place Facebook's rows carry theirs. */
internal const val MENU_ROW_ID = "hushfacebook_download_reel"

internal const val MENU_HANDLER = "Lapp/morphe/extension/facebook/download/ReelMenuDownload;"

private const val REEL_DOWNLOAD = "Lapp/morphe/extension/facebook/download/ReelDownload;"
private const val PLAYER_ORIGIN = "Lcom/facebook/video/common/playerorigin/PlayerOrigin;"
private const val VIDEO_PLAYER_PARAMS = "Lcom/facebook/video/engine/api/VideoPlayerParams;"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val LIST = "Ljava/util/List;"
private const val CONTEXT = "Landroid/content/Context;"
private const val OBJECT = "Ljava/lang/Object;"

/** The helper this adds to the sheet builder's class. */
internal const val ROW_HELPER = "hushfacebookDownloadRow"

/**
 * A reel's More sheet, the one with Playback speed, Captions and Clear mode, as the patch finds it.
 *
 * Each row of the sheet's settings group is added by its own static method, handed the sheet's
 * list. The one for Clear mode looks up the reel's player state by its player origin and video id,
 * and builds its row as `new Row(click, icon, Boolean, title, subtitle, id, Integer)`. That one
 * method gives every name the Download row needs. Nothing obfuscated is written down.
 */
internal class MoreSheet(
    /** The method that adds the Clear mode row, where the Download row goes in first. */
    val builder: MutableMethod,
    /** The player state lookup: (PlayerOrigin, String) on the store, answering a class holding VideoPlayerParams. */
    val lookup: MethodReference,
    /** How the builder calls it, `invoke-virtual/range` or `invoke-interface/range`. */
    val lookupInvoke: String,
    /** The row's constructor. */
    val row: MethodReference,
    /** The row's click interface, and the name of its one method. */
    val click: String,
    val clickMethod: String,
    /** The static that wraps an icon constant for the row, and the constant Facebook's own download row draws. */
    val iconWrap: MethodReference,
    val downloadIcon: FieldReference,
)

internal fun BytecodePatchContext.moreSheet(patch: String): MoreSheet {
    val (builderClass, builderMethod) = classDefByStrings(CLEAR_MODE_ROW, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { classDef -> classDef.methods.filter { holds(it, CLEAR_MODE_ROW) }.map { classDef to it } }
        .singleOrPatchException("$patch: the one method adding the More sheet's \"$CLEAR_MODE_ROW\" row")
    if (!AccessFlags.STATIC.isSet(builderMethod.accessFlags) || builderMethod.returnType != "V") {
        throw PatchException("$patch: ${builderClass.type}->${builderMethod.name} isn't a static method adding a row")
    }
    val instructions = builderMethod.implementation!!.instructions.toList()
    val parameters = builderMethod.parameterTypes.map(CharSequence::toString)

    // The player state: looked up on one of the builder's parameters by origin and video id, and
    // holding the player params the save reads.
    val lookupCall = instructions.filter { instruction ->
        val reference = instruction.methodReference() ?: return@filter false
        reference.parameterTypes.map(CharSequence::toString) == listOf(PLAYER_ORIGIN, STRING) &&
            reference.definingClass in parameters &&
            classDefByOrNull(reference.returnType)?.fields?.any { it.type == VIDEO_PLAYER_PARAMS } == true
    }.distinctBy { instruction -> instruction.methodReference()!!.let { "${it.definingClass}->${it.name}" } }
        .singleOrPatchException("$patch: the player state lookup, (PlayerOrigin, String), in ${builderClass.type}->${builderMethod.name}")
    val lookup = lookupCall.methodReference()!!
    val lookupInvoke = when (lookupCall.opcode) {
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> "invoke-virtual/range"
        Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE -> "invoke-interface/range"
        else -> throw PatchException("$patch: the player state lookup is called with ${lookupCall.opcode.name}")
    }

    // The row: the constructor called after the id, taking the title as a CharSequence.
    val idAt = instructions.indexOfFirst { it.stringValue() == CLEAR_MODE_ROW }
    val row = instructions.drop(idAt).mapNotNull { it.methodReference() }
        .firstOrNull { it.name == "<init>" && CHAR_SEQUENCE in it.parameterTypes.map(CharSequence::toString) }
        ?: throw PatchException("$patch: no row is built after \"$CLEAR_MODE_ROW\"")
    val rowParameters = row.parameterTypes.map(CharSequence::toString)
    rowParameters.firstOrNull { !it.startsWith("L") && !it.startsWith("[") }?.let {
        throw PatchException("$patch: the row ${row.definingClass} takes a $it, which the Download row can't leave empty")
    }

    // The click: the row parameter that is a public interface with one method, ()V. The handler
    // lives outside Facebook's package, so a package-private interface would fail to load with it.
    val click = rowParameters.mapNotNull { type -> classDefByOrNull(type)?.takeIf(::isClick) }
        .singleOrPatchException("$patch: the one public click interface among ${row.definingClass}'s parameters")

    // The icon: a static wrapping an enum constant into one of the row's parameter types.
    val iconWrap = instructions.mapNotNull { it.methodReference() }.filter { reference ->
        reference.returnType in rowParameters && reference.parameterTypes.size == 1 &&
            classDefByOrNull(reference.parameterTypes.single().toString())?.superclass == "Ljava/lang/Enum;"
    }.distinctBy { "${it.definingClass}->${it.name}" }
        .singleOrPatchException("$patch: the one icon wrapper the More sheet's rows are built with")
    val iconEnum = iconWrap.parameterTypes.single().toString()

    // Facebook's own download row, for your own videos, names the icon to borrow.
    val downloadIcon = classDefByStrings(OWN_DOWNLOAD_ROW, StringComparisonType.EQUALS)
        .flatMap { classDef -> classDef.methods.filter { holds(it, OWN_DOWNLOAD_ROW) } }
        .flatMap { it.implementation!!.instructions }
        .firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { instruction.opcode == Opcode.SGET_OBJECT && it.type == iconEnum }
        } ?: throw PatchException("$patch: Facebook's \"$OWN_DOWNLOAD_ROW\" row draws no icon of $iconEnum")

    return MoreSheet(
        builder = mutableClassDefBy(builderClass.type).findMutableMethodOf(builderMethod),
        lookup = lookup,
        lookupInvoke = lookupInvoke,
        row = row,
        click = click.type,
        clickMethod = click.methods.single().name,
        iconWrap = iconWrap,
        downloadIcon = downloadIcon,
    )
}

/** A public interface with one method, taking nothing and answering nothing. */
private fun isClick(classDef: ClassDef) = AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
    AccessFlags.PUBLIC.isSet(classDef.accessFlags) &&
    classDef.methods.count() == 1 &&
    classDef.methods.single().let { it.parameterTypes.isEmpty() && it.returnType == "V" }

private fun holds(method: Method, string: String) =
    method.implementation?.instructions?.any { it.stringValue() == string } == true

private fun Instruction.stringValue() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * The moves that fill the row's arguments from v9 up: the handler (v7) as the click, the icon (v6),
 * the label (v5) as the first CharSequence, which is the title, and [MENU_ROW_ID] as the last one
 * when there are several, the place Facebook puts each row's id. The rest stay null.
 */
internal fun rowArguments(rowParameters: List<String>, click: String, icon: String): String {
    val title = rowParameters.indexOf(CHAR_SEQUENCE)
    val id = rowParameters.lastIndexOf(CHAR_SEQUENCE).takeIf { it != title }
    return rowParameters.mapIndexed { index, type ->
        val register = 9 + index
        when {
            type == click -> "move-object/from16 v$register, v7"
            type == icon -> "move-object/from16 v$register, v6"
            index == title -> "move-object/from16 v$register, v5"
            index == id -> "const-string v$register, \"$MENU_ROW_ID\""
            else -> "const/16 v$register, 0x0"
        }
    }.joinToString("\n")
}

/**
 * Puts a Download row first in the sheet's settings group, right before Clear mode: a helper on the
 * builder's class asks [MENU_HANDLER] for the row's handler and builds the row when it gets one.
 * The handler class is made to implement the row's click interface, with the interface's one method
 * calling its `run()`.
 *
 * @param scopedType the sidebar's scoped context type, which the builder also takes, and
 *        [contextField] its one Context field.
 * @param storyType the reel's props type the sidebar hands its handlers. The builder takes none on
 *        the builds so far, and then the handler gets null and names the file by the video id.
 */
internal fun BytecodePatchContext.addDownloadRow(
    patch: String,
    sheet: MoreSheet,
    scopedType: String,
    contextField: String,
    storyType: String?,
    hdField: String,
    sdField: String,
    manifestField: String,
) {
    val builder = sheet.builder
    val parameters = builder.parameterTypes.map(CharSequence::toString)
    fun parameter(type: String, what: String) = parameters.indices.filter { parameters[it] == type }
        .singleOrPatchException("$patch: the one $what parameter of ${builder.definingClass}->${builder.name}")

    val store = parameter(sheet.lookup.definingClass, "player state store")
    val origin = parameter(PLAYER_ORIGIN, "PlayerOrigin")
    val id = parameter(STRING, "video id")
    val scoped = parameter(scopedType, "scoped context")
    val list = parameter(LIST, "row list")
    val story = storyType?.let { type -> parameters.indices.singleOrNull { parameters[it] == type } }

    // The six values go to v0 to v5 first thing in the builder. Nothing can read a local at the top
    // of a method before writing it, which is proved here rather than trusted, before anything changes.
    builder.requireFreeAt(patch, 0, (0..5).toList())

    // The handler takes the row's click interface by name, and its one method calls run().
    val handler = mutableClassDefBy(MENU_HANDLER)
    if (sheet.click !in handler.interfaces) handler.interfaces.add(sheet.click)
    if (handler.methods.none { it.name == sheet.clickMethod && it.parameterTypes.isEmpty() }) {
        handler.methods.add(
            ImmutableMethod(
                MENU_HANDLER, sheet.clickMethod, emptyList(), "V", AccessFlags.PUBLIC.value,
                null, null, MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(0, "invoke-virtual { p0 }, $MENU_HANDLER->run()V\nreturn-void")
            },
        )
    }

    // The helper, with fresh registers: v0 to v7 for the handler, v8 up for the row.
    val rowParameters = sheet.row.parameterTypes.map(CharSequence::toString)
    val helperParameters = listOf(sheet.lookup.definingClass, PLAYER_ORIGIN, STRING, scopedType, LIST, OBJECT)
    val locals = maxOf(16, 9 + rowParameters.size)
    val icon = sheet.downloadIcon
    val wrap = sheet.iconWrap
    val helper = ImmutableMethod(
        builder.definingClass,
        ROW_HELPER,
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
                if-eqz p1, :done
                ${sheet.lookupInvoke} { p0 .. p2 }, ${sheet.lookup.definingClass}->${sheet.lookup.name}($PLAYER_ORIGIN$STRING)${sheet.lookup.returnType}
                move-result-object v1
                if-eqz v1, :done
                move-object/from16 v0, p3
                iget-object v2, v0, $scopedType->$contextField:$CONTEXT
                const-string v3, "$hdField"
                const-string v4, "$sdField"
                const-string v5, "$manifestField"
                move-object/from16 v6, p5
                invoke-static/range { v1 .. v6 }, $MENU_HANDLER->forReel($OBJECT$CONTEXT$STRING$STRING$STRING$OBJECT)$MENU_HANDLER
                move-result-object v7
                if-eqz v7, :done
                check-cast v7, ${sheet.click}
                sget-object v6, ${icon.definingClass}->${icon.name}:${icon.type}
                invoke-static { v6 }, ${wrap.definingClass}->${wrap.name}(${wrap.parameterTypes.single()})${wrap.returnType}
                move-result-object v6
                invoke-static { }, $REEL_DOWNLOAD->label()$STRING
                move-result-object v5
                new-instance v8, ${sheet.row.definingClass}
${rowArguments(rowParameters, sheet.click, wrap.returnType)}
                invoke-direct/range { v8 .. v${8 + rowParameters.size} }, ${sheet.row.definingClass}-><init>(${rowParameters.joinToString("")})V
                move-object/from16 v0, p4
                invoke-interface { v0, v8 }, $LIST->add($OBJECT)Z
                :done
                return-void
            """,
        )
    }
    mutableClassDefBy(builder.definingClass).methods.add(helper)

    // First thing in the builder, before its own checks.
    val storyMove = story?.let { "move-object/from16 v5, ${builder.parameterRegister(it)}" } ?: "const/4 v5, 0x0"
    builder.addInstructions(
        0,
        """
            move-object/from16 v0, ${builder.parameterRegister(store)}
            move-object/from16 v1, ${builder.parameterRegister(origin)}
            move-object/from16 v2, ${builder.parameterRegister(id)}
            move-object/from16 v3, ${builder.parameterRegister(scoped)}
            move-object/from16 v4, ${builder.parameterRegister(list)}
            $storyMove
            invoke-static/range { v0 .. v5 }, ${builder.definingClass}->$ROW_HELPER(${helperParameters.joinToString("")})V
        """,
    )
}
