/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.pip

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.downloads.reel.CLEAR_MODE_ROW
import app.morphe.patches.facebook.downloads.reel.OWN_DOWNLOAD_ROW
import app.morphe.patches.facebook.downloads.reel.moreSheet
import app.morphe.patches.facebook.downloads.reel.sheetFixture
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #44: on each declared build, a reel's More sheet builder asks for the Picture-in-picture
 * row first thing, handing a helper on its class the sheet's scoped context and row list from v0
 * and v1. The helper reads the context's one Context field, asks the extension for a handler, and
 * builds the row with Facebook's own row class and Clear mode's icon, under its own id. The handler
 * is made to take the row's click interface.
 */
class PictureInPictureRowFixtureTest {
    private val list = "Ljava/util/List;"

    /** Every class [method] names or calls with, and its own parameter types. */
    private fun reachedBy(method: Method): Set<String> = method.implementation!!.instructions.flatMap { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is MethodReference -> listOf(reference.definingClass, reference.returnType) + reference.parameterTypes.map(CharSequence::toString)
            is FieldReference -> listOf(reference.definingClass, reference.type)
            is TypeReference -> listOf(reference.type)
            else -> emptyList()
        }
    }.plus(method.parameterTypes.map(CharSequence::toString)).filter { it.startsWith("L") }.toSet()

    private fun Method.calls() = implementation!!.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
    }

    @Test
    fun `a reel's More sheet asks for the Picture-in-picture row first thing on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val classes = mutableMapOf<String, ClassDef>()
                val sheetFixture = sheetFixture(bundle)
                val holder = sheetFixture.builderClass
                val builder = sheetFixture.builder
                // 585 builds the Clear mode row in a method of its own, which the builder calls.
                val reached = reachedBy(builder) + reachedBy(sheetFixture.row) + sheetFixture.row.definingClass
                FixtureDex.classes(bundle, reached).forEach { (type, classDef) -> classes.putIfAbsent(type, classDef) }
                val rowTypes = reached.mapNotNull(classes::get).flatMap { classDef ->
                    classDef.methods.filter { it.name == "<init>" }.flatMap { it.parameterTypes.map(CharSequence::toString) }
                }.toSet()
                FixtureDex.classes(bundle, rowTypes).forEach { (type, classDef) -> classes.putIfAbsent(type, classDef) }
                FixtureDex.classesHolding(bundle, OWN_DOWNLOAD_ROW).forEach { classes.putIfAbsent(it.type, it) }
                classes[holder.type] = holder
                classes[PIP_ROW_HANDLER] = ExtensionDex.classDef(PIP_ROW_HANDLER)

                val context = PatchContexts.of(classes.values)
                val sheet = context.moreSheet("the fixture")
                val scoped = context.sheetContext(sheet)
                assertEquals("$name: the scoped context is the builder's own parameter", scoped.type,
                    builder.parameterTypes[scoped.parameter].toString())
                assertNotEquals("$name: Clear mode's icon isn't the Download row's", sheet.downloadIcon.toString(),
                    sheet.clearModeIcon.toString())

                context.addPictureInPictureRow(sheet)

                val patchedClass = context.mutableClassDefBy(holder.type)
                val body = patchedClass.methods.single { it.name == builder.name && it.parameterTypes.size == builder.parameterTypes.size }
                    .implementation!!.instructions.toList()
                assertEquals("$name: three instructions added", builder.implementation!!.instructions.count() + 3, body.size)
                assertEquals("$name: the two moves come first", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16),
                    body.take(2).map { it.opcode })
                val call = body[2] as FiveRegisterInstruction
                assertEquals("$name: the helper gets the context and the list from v0 and v1",
                    "${builder.definingClass}->$PIP_ROW_HELPER(${scoped.type}$list)V 0 1",
                    "${(call as ReferenceInstruction).reference} ${call.registerC} ${call.registerD}")

                val helper = patchedClass.methods.single { it.name == PIP_ROW_HELPER }
                val strings = helper.implementation!!.instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                }
                assertEquals("$name: the row's id", listOf(PIP_ROW_ID), strings)
                val fields = helper.implementation!!.instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString()
                }
                assertEquals("$name: the context, then Clear mode's icon",
                    listOf(scoped.field.toString(), sheet.clearModeIcon.toString()), fields)
                val calls = helper.calls()
                assertTrue("$name: the helper asks the handler: $calls",
                    "$PIP_ROW_HANDLER->forSheet(Landroid/content/Context;)$PIP_ROW_HANDLER" in calls)
                assertTrue("$name: the helper builds Facebook's row: $calls", calls.any { it.startsWith("${sheet.row.definingClass}-><init>(") })
                assertTrue("$name: the helper adds it to the list: $calls", "$list->add(Ljava/lang/Object;)Z" in calls)

                val handler = context.mutableClassDefBy(PIP_ROW_HANDLER)
                assertEquals("$name: the handler takes the row's click", listOf(sheet.click), handler.interfaces.toList())
                assertTrue("$name: the handler answers the click's one method",
                    handler.methods.any { it.name == sheet.clickMethod && it.parameterTypes.isEmpty() && it.returnType == "V" })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
