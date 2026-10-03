/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.comment

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/*
 * What both comment families write into the common menu: the renderer's one call, and each
 * family's own row subtype, factory and callback reader, so neither mistakes the other's rows.
 */

internal fun BytecodePatchContext.validateCommentHook() {
    stub(COMMENT_HOOK.substringBefore("->"), "rows", listOf(LIST, OBJECT, "Landroid/content/Context;"), LIST)
}

internal fun BytecodePatchContext.validateActionRow(rowType: String, bridge: String) {
    stub(bridge, "newRow", listOf(OBJECT), OBJECT)
    stub(bridge, "callback", listOf(OBJECT), OBJECT)
    stub(rowType, "<init>", List(4) { OBJECT }, "V", false)
}

/**
 * The renderer's one call into the extension. The first family in a patch run puts it in, and the
 * second finds it there; the surface they share refused a renderer that already had it.
 */
internal fun BytecodePatchContext.applyCommentHook(surface: CommentSurface) {
    val renderer = mutableClassDefBy(surface.renderer.definingClass).methods.single { it.matches(surface.renderer) }
    when (renderer.code().count { it.call()?.toString() == COMMENT_HOOK }) {
        0 -> Unit
        1 -> return
        else -> refuse("renderer carries the comment hook more than once")
    }
    val (rows, selected, context) = surface.spares
    renderer.addInstructionsAtControlFlowLabel(surface.at, """
        move-object/from16 v$rows, v${surface.rows}
        move-object/from16 v$selected, v${surface.selected}
        move-object/from16 v$context, v${surface.context}
        invoke-static { v$rows, v$selected, v$context }, $COMMENT_HOOK
        move-result-object v${surface.rows}
    """.trimIndent())
}

/** A family's row: a subtype of the native row with the family's icon and label, and its reader. */
internal fun BytecodePatchContext.applyActionRow(surface: CommentSurface, rowType: String, bridge: String,
                                                 icon: Int, label: Int) {
    val row = stub(rowType, "<init>", List(4) { OBJECT }, "V", false)
    val factory = stub(bridge, "newRow", listOf(OBJECT), OBJECT)
    val callback = stub(bridge, "callback", listOf(OBJECT), OBJECT)
    mutableClassDefBy(rowType).setSuperClass(surface.rowConstructor.definingClass)
    val types = surface.rowConstructor.parameters()
    replace(row, 5, """
        check-cast p1, ${types[0]}
        check-cast p2, ${types[1]}
        check-cast p3, ${types[2]}
        check-cast p4, $FUNCTION
        invoke-direct { p0, p1, p2, p3, p4 }, ${surface.rowConstructor}
        return-void
    """)
    replace(factory, 6, """
        new-instance v0, $rowType
        sget-object v1, ${surface.style}
        new-instance v2, ${surface.iconConstructor.definingClass}
        const v4, $icon
        invoke-direct { v2, v4 }, ${surface.iconConstructor}
        new-instance v3, ${surface.labelConstructor.definingClass}
        const v4, $label
        invoke-direct { v3, v4 }, ${surface.labelConstructor}
        invoke-direct { v0, v1, v2, v3, p0 }, $rowType-><init>($OBJECT$OBJECT$OBJECT$OBJECT)V
        return-object v0
    """)
    replace(callback, 2, """
        instance-of v0, p0, $rowType
        if-eqz v0, :stock
        check-cast p0, ${surface.callback.definingClass}
        iget-object p0, p0, ${surface.callback}
        return-object p0
        :stock
        const/4 v0, 0x0
        return-object v0
    """)
}

internal fun BytecodePatchContext.stub(type: String, name: String, parameters: List<String>, returns: String,
                                       static: Boolean = true) =
    mutableClassDefBy(type).methods.filter { it.name == name && it.parameters() == parameters && it.returnType == returns &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
        .singleOrNull() ?: refuse("extension has no unique $name bridge on $type")

internal fun BytecodePatchContext.replace(method: MutableMethod, registers: Int, body: String) {
    val replacement = ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
        ImmutableMethodImplementation(registers, emptyList(), null, null)).toMutable().apply {
        addInstructionsWithLabels(0, body.trimIndent())
    }
    val owner = mutableClassDefBy(method.definingClass)
    owner.methods.remove(method)
    owner.methods.add(replacement)
}
