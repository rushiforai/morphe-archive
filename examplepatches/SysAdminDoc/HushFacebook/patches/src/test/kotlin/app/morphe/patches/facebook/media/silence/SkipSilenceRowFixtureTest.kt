/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.silence

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
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #144: on each declared build, a reel's More sheet builder asks for the Skip silent parts
 * row first thing, handing a helper on its class the reel's video id and the row list from v0 and
 * v1. The helper asks the extension for a handler, reads the row's title off it before casting it
 * to the click interface, and builds the row with Facebook's own row class and Clear mode's icon,
 * under its own id. The handler is made to take the row's click interface.
 */
class SkipSilenceRowFixtureTest {
    private val list = "Ljava/util/List;"
    private val string = "Ljava/lang/String;"

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
    fun `a reel's More sheet asks for the Skip silent parts row first thing on each declared build`() {
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
                classes[SKIP_ROW_HANDLER] = ExtensionDex.classDef(SKIP_ROW_HANDLER)

                val context = PatchContexts.of(classes.values)
                val sheet = context.moreSheet("the fixture")
                val parameters = builder.parameterTypes.map(CharSequence::toString)
                assertEquals("$name: the builder takes one String, the video id", 1, parameters.count { it == string })

                context.addSkipSilenceRow("the fixture", sheet)

                val patchedClass = context.mutableClassDefBy(holder.type)
                val body = patchedClass.methods.single { it.name == builder.name && it.parameterTypes.size == builder.parameterTypes.size }
                    .implementation!!.instructions.toList()
                assertEquals("$name: three instructions added", builder.implementation!!.instructions.count() + 3, body.size)
                assertEquals("$name: the two moves come first", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16),
                    body.take(2).map { it.opcode })
                val call = body[2] as FiveRegisterInstruction
                assertEquals("$name: the helper gets the video id and the list from v0 and v1",
                    "${builder.definingClass}->$SKIP_ROW_HELPER($string$list)V 0 1",
                    "${(call as ReferenceInstruction).reference} ${call.registerC} ${call.registerD}")

                val helper = patchedClass.methods.single { it.name == SKIP_ROW_HELPER }
                val strings = helper.implementation!!.instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                }
                assertEquals("$name: the row's id", listOf(SKIP_ROW_ID), strings)
                val fields = helper.implementation!!.instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString()
                }
                assertEquals("$name: Clear mode's icon", listOf(sheet.clearModeIcon.toString()), fields)
                val calls = helper.calls()
                val asked = calls.indexOf("$SKIP_ROW_HANDLER->forReel($string)$SKIP_ROW_HANDLER")
                val titled = calls.indexOf("$SKIP_ROW_HANDLER->title()$string")
                assertTrue("$name: the helper asks the handler, then its title: $calls", asked >= 0 && titled > asked)
                val cast = helper.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.CHECK_CAST }
                val title = helper.implementation!!.instructions.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "title"
                }
                assertTrue("$name: the title is read before the handler is cast to the click", title in 0 until cast)
                assertTrue("$name: the helper builds Facebook's row: $calls", calls.any { it.startsWith("${sheet.row.definingClass}-><init>(") })
                assertTrue("$name: the helper adds it to the list: $calls", "$list->add(Ljava/lang/Object;)Z" in calls)

                val handler = context.mutableClassDefBy(SKIP_ROW_HANDLER)
                assertEquals("$name: the handler takes the row's click", listOf(sheet.click), handler.interfaces.toList())
                assertTrue("$name: the handler answers the click's one method",
                    handler.methods.any { it.name == sheet.clickMethod && it.parameterTypes.isEmpty() && it.returnType == "V" })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
