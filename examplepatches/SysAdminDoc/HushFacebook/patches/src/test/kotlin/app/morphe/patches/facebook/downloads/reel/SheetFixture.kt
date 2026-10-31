/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File

/**
 * A reel's More sheet in one bundle: the method holding the Clear mode row's id ([row]) and the
 * static void method that adds that row to the sheet's list ([builder], on [builderClass]). Up to
 * 584 they are one method. 585 splits it: [row] only builds and answers the row, and its one caller
 * is the builder.
 */
internal class SheetFixture(val builderClass: ClassDef, val builder: Method, val row: Method)

internal fun sheetFixture(bundle: File): SheetFixture {
    val holder = FixtureDex.classesHolding(bundle, CLEAR_MODE_ROW).single()
    val row = holder.methods.single { holdsString(it, CLEAR_MODE_ROW) }
    if (row.returnType == "V") return SheetFixture(holder, row, row)
    val builder = FixtureDex.methodsWhere(bundle, { dex ->
        dex.methodSection.any { it.definingClass == holder.type && it.name == row.name }
    }) { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.implementation?.instructions?.any { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == holder.type && it.name == row.name
                } == true
            } == true
    }.single()
    return SheetFixture(FixtureDex.classes(bundle, setOf(builder.definingClass)).getValue(builder.definingClass), builder, row)
}
