/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The players Pinterest makes for its save chime, in each declared APK. */
@Category(FixtureTests::class)
class SaveSoundFixtureTest {
    @Test
    fun `each declared APK hands every player for the save chime to the extension and no other sound`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val clean = players(classes)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            customSaveSoundPatch.execute(context)
            for (flag in listOf("customSaveSound", "saveSound")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            var hooked = 0
            val hookedIn = mutableListOf<String>()
            for ((method, sounds) in clean) {
                val before = method.implementation!!.instructions.toList()
                val after = patched(context, method)
                assertEquals("${build.name}: ${method.name} keeps its length", before.size, after.size)
                for ((index, sound) in sounds) {
                    val call = after[index] as FiveRegisterInstruction
                    val was = before[index] as FiveRegisterInstruction
                    assertEquals("${build.name}: ${method.name} keeps the context register", was.registerC, call.registerC)
                    assertEquals("${build.name}: ${method.name} keeps the sound register", was.registerD, call.registerD)
                    assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, after[index + 1].opcode)
                    val target = (call as ReferenceInstruction).reference.toString()
                    if (sound == "success_2") {
                        assertEquals("${build.name}: the save chime in ${method.definingClass}->${method.name}", SAVE_SOUND_HOOK, target)
                        hooked++
                        hookedIn += "${method.definingClass}->${method.name}"
                    } else {
                        assertEquals("${build.name}: $sound in ${method.definingClass}->${method.name} stays Pinterest's", CREATE, target)
                    }
                }
                val rest = before.indices.filter { index -> sounds.none { it.first == index } }
                assertEquals("${build.name}: the rest of ${method.name} is unchanged", rest.map { before[it].opcode }, rest.map { after[it].opcode })
            }
            // The 14.44.0 dex makes the chime's player in five places: both pin pages' save
            // callbacks, the two pin page fragments' save events, and the shared sound player.
            assertEquals("${build.name}: save chimes hooked", 5, hooked)
            for (presenter in listOf(ORGANIC_PRESENTER, PROMOTED_PRESENTER)) {
                assertEquals("${build.name}: $presenter", 1, hookedIn.count { it == "$presenter->repinToBoard\$lambda\$2" })
            }
            assertEquals("${build.name}: other sounds left alone", 4,
                clean.values.sumOf { sounds -> sounds.count { it.second != "success_2" } })
        }
    }

    @Test
    fun `a missing hook, status stub or chime refuses with every player untouched`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = read(build)
        val extension = ExtensionDex.classes()
        fun without(owner: String, name: String) = extension.map { classDef -> if (classDef.type != owner) classDef else
            ImmutableClassDef(classDef.type, classDef.accessFlags, classDef.superclass, classDef.interfaces, classDef.sourceFile,
                classDef.annotations, classDef.fields, classDef.methods.filterNot { it.name == name }) }
        val noChime = classes.filter { classDef -> players(listOf(classDef)).values.flatten().none { it.second == "success_2" } }
        assertTrue("the chime's classes were left out", noChime.size < classes.size)
        val cases = linkedMapOf(
            "missing customSaveSound stub" to (without(SETTINGS_STATUS, "customSaveSound") + classes to "customSaveSound"),
            "missing saveSound stub" to (without(SETTINGS_STATUS, "saveSound") + classes to "saveSound"),
            "missing saveSound hook" to (without(UI_HOOKS, "saveSound") + classes to "no saveSound(Landroid/content/Context;I)"),
            "no save chime" to (extension + noChime to "makes no player for its save chime"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { customSaveSoundPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (name in listOf("customSaveSound", "saveSound")) {
                if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) {
                    assertEquals("$reason left $name set", 0, flag(context, name))
                }
            }
            val present = input.map { it.type }.toSet()
            for (method in players(classes).keys.filter { it.definingClass in present }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.implementation!!.instructions.map { it.render() }, patched(context, method).map { it.render() })
            }
        }
    }

    /**
     * Each method that calls MediaPlayer.create on a raw resource, with each call's index and the
     * R field read into its sound register by the instruction before it, read off the clean dex.
     */
    private fun players(classes: List<ClassDef>): Map<Method, List<Pair<Int, String>>> =
        classes.flatMap { it.methods }.mapNotNull { method ->
            val body = method.implementation?.instructions?.toList() ?: return@mapNotNull null
            val calls = body.indices.filter { body[it].isCreate() }.map { index ->
                val register = (body[index] as FiveRegisterInstruction).registerD
                val read = body.getOrNull(index - 1)
                val field = (read as? ReferenceInstruction)?.reference as? FieldReference
                val name = if (read?.opcode == Opcode.SGET && field != null &&
                    (read as OneRegisterInstruction).registerA == register) field.name else "?"
                index to name
            }
            if (calls.isEmpty()) null else method to calls
        }.toMap()

    /** An instruction by what it does: opcode, registers, literal and reference. */
    private fun Instruction.render(): String = buildString {
        append(opcode).append(namedRegisters())
        (this@render as? NarrowLiteralInstruction)?.let { append(" #").append(it.narrowLiteral) }
        (this@render as? ReferenceInstruction)?.let { append(" ").append(it.reference) }
    }

    private fun Instruction.isCreate(): Boolean =
        opcode == Opcode.INVOKE_STATIC && ((this as ReferenceInstruction).reference as? MethodReference)?.toString() == CREATE

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    /** Every class in the APK that makes a player from a raw resource. */
    private fun read(build: java.io.File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            method.implementation?.instructions?.any { it.isCreate() } == true
        }
        check(found.isNotEmpty()) { "${build.name}: nothing makes a MediaPlayer from a raw resource" }
        return found
    }
}

private const val CREATE = "Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;"
private const val ORGANIC_PRESENTER = "Lcom/pinterest/feature/pin/closeup/presenter/OrganicPinCloseupPresenter;"
private const val PROMOTED_PRESENTER = "Lcom/pinterest/feature/pin/closeup/presenter/PromotedPinCloseupPresenter;"
