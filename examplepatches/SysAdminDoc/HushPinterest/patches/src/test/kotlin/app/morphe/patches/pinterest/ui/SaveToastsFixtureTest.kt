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
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Pinterest's toast container, the save confirmation models and the screens that word a save themselves, in each declared APK. */
@Category(FixtureTests::class)
class SaveToastsFixtureTest {
    /**
     * What a test takes from a build: the container with the toast [model] and every class
     * extending it, the text [builders], and the [screens], every other class that reads a text
     * with "saved" or "pinned" in its name or is a helper that shows an Android toast.
     */
    private data class Input(val classes: List<ClassDef>, val model: String, val builders: List<ClassDef>, val screens: List<ClassDef>)

    /**
     * Each save and pinned text in 14.40.0: how many methods read its id, and how many of those
     * show it themselves, as a toast model, as a text builder, or by making a toast in that same
     * method. Counted from the dex by hand, apart from the patch's own rule, so a text or a screen
     * the rule misses turns up here as a number that's off.
     */
    private val counted = linkedMapOf(
        "saved_to" to (1 to 1),
        "saved_onto_board_bold" to (4 to 4),
        "pinned" to (10 to 4),
        "pinned_multiple" to (2 to 2),
        "pinned_multiple_to_board" to (1 to 1),
        "multi_board_save_saved_to_profile" to (1 to 1),
        "saved_onto_board" to (4 to 4),
        "saved_to_board_section" to (5 to 5),
        "saved_multiple_to_board_section" to (1 to 1),
        "pin_saved" to (3 to 1),
    )

    @Test
    fun `each declared original APK drops only the save toasts before the container builds them`() {
        for (build in Fixtures.declaredBuilds()) {
            val (classes, model, builders, screens) = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes + builders + screens)
            hideSaveToastsPatch.execute(context)
            for (name in listOf("hideSaveToasts", "saveToasts")) assertEquals("${build.name}: $name", 1, flag(context, name))
            val readers = { names: (FieldReference) -> Boolean -> classes.filter { owner -> owner.type != model &&
                owner.methods.any { method -> method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let(names) == true } == true } }.map { it.type }.toSet() }
            val saved = readers { it.type == "I" && it.name in SAVE_TOAST_STRINGS }
            val follow = readers { it.name == FOLLOW_UPSELL && it.type == it.definingClass }
            // The confirmation Pinterest shows from the third save in a row to one board reads no save text itself.
            val moreIdeas = readers { it.name == MORE_IDEAS_UPSELL && it.type == it.definingClass }
            assertTrue("${build.name}: saved-to toasts $saved", saved.size >= 3)
            assertEquals("${build.name}: follow suggestion", 1, follow.size)
            assertEquals("${build.name}: more ideas confirmation", 1, moreIdeas.size)
            assertTrue("${build.name}: the more ideas confirmation was already named $saved", (moreIdeas - saved).isNotEmpty())
            assertEquals(build.name, (saved + follow + moreIdeas).sorted(), checked(context, "isSaveToast").sorted())

            // The board picker's toast shows whatever its text builder hands it, a save or a removal.
            // Only the two builders that read a save text count: Saved to a board, and Saved to profile.
            val text = context.saveTextToasts(model).one("${build.name}: toast model that asks a field for its text")
            val reads = { type: String, name: String -> builders.single { it.type == type }.methods.any { method ->
                method.fields().any { it.type == "I" && it.name == name } } }
            assertEquals("${build.name}: ${text.sources}", 2, text.sources.size)
            assertTrue(build.name, text.sources.any { reads(it, "saved_onto_board_bold") })
            assertTrue(build.name, text.sources.any { reads(it, "multi_board_save_saved_to_profile") })
            assertTrue("${build.name}: a text builder that reads no save text stays out",
                builders.any { owner -> owner.type !in text.sources && owner.interfaces.any { text.field.endsWith(":$it") } })
            val asks = context.mutableClassDefBy(UI_HOOKS).methods.single { it.name == "isSaveTextToast" }.implementation!!.instructions.toList()
            assertEquals(build.name, listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.INSTANCE_OF,
                Opcode.IF_NEZ, Opcode.INSTANCE_OF, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN), asks.map { it.opcode })
            assertEquals(build.name, listOf(text.model, text.model) + text.sources, asks.filter { it.opcode == Opcode.INSTANCE_OF ||
                it.opcode == Opcode.CHECK_CAST }.map { ((it as ReferenceInstruction).reference as TypeReference).type })
            val held = (asks[3] as ReferenceInstruction).reference as FieldReference
            assertEquals(build.name, text.field, "${held.definingClass}->${held.name}:${held.type}")
            val show = context.mutableClassDefBy(TOAST_CONTAINER).methods.single { method ->
                method.parameterTypes.singleOrNull()?.toString() == model }
            val body = show.implementation!!.instructions.toList()
            val hook = (body[0] as ReferenceInstruction).reference as MethodReference
            assertEquals(build.name, "$UI_HOOKS->hideSaveToast(Ljava/lang/Object;)Z", "${hook.definingClass}->${hook.name}(Ljava/lang/Object;)Z")
            assertEquals(build.name, listOf(show.implementation!!.registerCount - 1), (body[0] as FiveRegisterInstruction).let {
                listOf(it.registerC).take(it.registerCount) })
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), body.subList(1, 4).map { it.opcode })
        }
    }

    @Test
    fun `every method that words a save and shows it is covered, counted apart from the patch's rule`() {
        for (build in Fixtures.declaredBuilds()) {
            val (classes, model, builders, screens) = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes + builders + screens)
            hideSaveToastsPatch.execute(context)
            val text = context.saveTextToasts(model).one("${build.name}: toast model that asks a field for its text")
            val models = classes.map { it.type }.toSet() - TOAST_CONTAINER
            val methods = (classes + builders + screens).flatMap { it.methods }
            val helpers = methods.filter { it.androidToastHelper() }.map { it.key() }.toSet()
            fun Method.builds() = instructions().filter { it.opcode == Opcode.NEW_INSTANCE }
                .map { ((it as ReferenceInstruction).reference as TypeReference).type }.filter { it in models }
            fun Method.handsOver() = calls().count { "${it.definingClass}->${it.name}(${it.parameters().joinToString("")})${it.returnType}" in helpers }
            fun Method.shows() = definingClass in models || definingClass in text.sources || builds().isNotEmpty() ||
                androidToasts() > 0 || handsOver() > 0

            val readers = counted.keys.associateWith { name -> methods.filter { method -> method.fields().any { it.type == "I" && it.name == name } } }
            if ("-14.42.0-" in build.name) {
                for ((name, expected) in counted) {
                    val found = readers.getValue(name)
                    assertEquals("${build.name}: methods that read $name: ${found.map { it.key() }}", expected.first, found.size)
                    assertEquals("${build.name}: methods that read $name and show it: ${found.filter { it.shows() }.map { it.key() }}",
                        expected.second, found.count { it.shows() })
                }
                // 14.40.0 made its save toast in the screen itself; 14.42.0 hands it to one helper again, shared with a sign-in toast.
                assertEquals("${build.name}: helpers that show an Android toast $helpers", 1, helpers.size)
            }

            val saveToasts = checked(context, "isSaveToast").toSet()
            val messageToasts = checked(context, "isMessageToast").toSet()
            assertTrue("${build.name}: a toast is told two ways ${saveToasts intersect messageToasts}", (saveToasts intersect messageToasts).isEmpty())
            val showing = readers.values.flatten().distinctBy { it.key() }.filter { it.shows() }
            for (method in showing) {
                val untold = method.builds().toSet() - saveToasts - messageToasts - text.model
                assertTrue("${build.name}: ${method.key()} builds a toast nothing tells apart: $untold", untold.isEmpty())
                if (method.androidToasts() > 0) assertTakenOver(build, context, method)
            }
            val calledHelpers = showing.flatMap { it.calls() }
                .map { "${it.definingClass}->${it.name}(${it.parameters().joinToString("")})${it.returnType}" }.filter { it in helpers }.toSet()
            for (helper in methods.filter { it.key() in calledHelpers }) assertTakenOver(build, context, helper)

            // The toasts told by their words: each one the extension reads a text from is a model a
            // save screen builds with a ready-made text, never the one HushPinterest's own messages use.
            for (type in messageToasts) {
                val owner = classes.single { it.type == type }
                assertTrue("${build.name}: $type isn't public", AccessFlags.PUBLIC.isSet(owner.accessFlags))
                assertTrue("${build.name}: $type is the text toast HushPinterest's own messages are built with",
                    owner.methods.none { it.name == "<init>" && it.parameters() == listOf("Ljava/lang/String;", "I") })
            }
            // What the extension looks up by name is what those screens read, no more and no less.
            val worded = showing.filter { method -> method.builds().any { it in messageToasts } || method.androidToasts() > 0 || method.handsOver() > 0 }
            assertEquals("${build.name}: texts the screens that word a save themselves read", SAVE_TEXT_NAMES,
                counted.keys.filter { name -> worded.any { method -> method.fields().any { it.type == "I" && it.name == name } } }.toSet())
            val runtime = ExtensionDex.classDef("${UI_HOOKS.removeSuffix("UiHooks;")}SaveToastTexts;").methods.single { it.name == "<clinit>" }
                .strings().filter { Regex("[a-z_]+").matches(it) }.toSet()
            assertEquals("the names the extension looks up", SAVE_TEXT_NAMES, runtime)

            if ("-14.42.0-" in build.name) {
                assertEquals("${build.name}: toasts handed their text $messageToasts", 2, messageToasts.size)
                val taken = (showing + methods.filter { it.key() in calledHelpers }).distinctBy { it.key() }.map { method ->
                    context.mutableClassDefBy(method.definingClass).methods.single { it.key() == method.key() }
                }.flatMap { it.calls() }.filter { it.definingClass == UI_HOOKS && it.name == "androidToast" }
                // The helper's one toast and the three the screens still make themselves, each taken over.
                assertEquals("${build.name}: Android toasts taken over", listOf("I") + List(3) { "Ljava/lang/CharSequence;" },
                    taken.map { it.parameters()[1] }.sorted())
            }
        }
    }

    @Test
    fun `a build whose screens word no save themselves keeps the toasts it has and claims no more`() {
        val (classes, _, builders) = read(Fixtures.declaredBuilds().last())
        val context = PatchContexts.of(ExtensionDex.classes() + classes + builders)
        hideSaveToastsPatch.execute(context)
        assertEquals("the patch is on", 1, flag(context, "hideSaveToasts"))
        assertEquals("the save toasts aren't all there", 0, flag(context, "saveToasts"))
        assertTrue("the toasts it has are still named", checked(context, "isSaveToast").isNotEmpty())
        assertEquals("no toast is told by its words", listOf(Opcode.CONST_4, Opcode.RETURN),
            context.mutableClassDefBy(UI_HOOKS).methods.single { it.name == "isMessageToast" }.implementation!!.instructions.map { it.opcode })
    }

    /**
     * The board picker's toast is told by the class that built its text. Take those classes away
     * and nothing can tell its save from its removal, so the patch has to say the build is short
     * of one kind of confirmation instead of leaving the question unasked and claiming them all.
     */
    @Test
    fun `a build with no class that builds a save text for the board picker claims no more than it covers`() {
        val (classes, model, _, screens) = read(Fixtures.declaredBuilds().last())
        val context = PatchContexts.of(ExtensionDex.classes() + classes + screens)
        assertTrue("the fake build still has a toast told by its text builder", context.saveTextToasts(model).isEmpty())
        hideSaveToastsPatch.execute(context)
        assertEquals("the patch is on", 1, flag(context, "hideSaveToasts"))
        assertEquals("the save toasts aren't all there", 0, flag(context, "saveToasts"))
        assertTrue("the toasts it has are still named", checked(context, "isSaveToast").isNotEmpty())
        assertEquals("no toast is asked what built its text", listOf(Opcode.CONST_4, Opcode.RETURN),
            context.mutableClassDefBy(UI_HOOKS).methods.single { it.name == "isSaveTextToast" }.implementation!!.instructions.map { it.opcode })
    }

    @Test
    fun `missing container or status stub refuses before any change`() {
        val (classes, _, _) = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        fun without(type: String, drop: (Method) -> Boolean) = extension.map { owner -> if (owner.type != type) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot(drop)) }
        val cases = linkedMapOf(
            "missing container" to extension + classes.filterNot { it.type == TOAST_CONTAINER },
            "missing status stub" to classes + without(SETTINGS_STATUS) { it.name == "saveToasts" },
            "missing message toast stub" to classes + without(UI_HOOKS) { it.name == "isMessageToast" },
            "missing Android toast stand-in" to classes + without(UI_HOOKS) { it.name == "androidToast" && it.parameters()[1] == "I" },
            "no save toasts" to extension + classes.filter { it.type == TOAST_CONTAINER },
        )
        for ((reason, input) in cases) {
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            assertThrows(reason, PatchException::class.java) { hideSaveToastsPatch.execute(context) }
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
        }
    }

    /** What SettingsStatus.[name]() answers after patching: 1 or 0. */
    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    /** The classes the UiHooks stub [name] checks for. */
    private fun checked(context: BytecodePatchContext, name: String) =
        context.mutableClassDefBy(UI_HOOKS).methods.single { it.name == name }.implementation!!.instructions
            .filter { it.opcode == Opcode.INSTANCE_OF }.map { ((it as ReferenceInstruction).reference as TypeReference).type }

    /** After patching, [method] makes no Android toast of its own: each one goes to the extension's stand-in. */
    private fun assertTakenOver(build: File, context: BytecodePatchContext, method: Method) {
        val patched = context.mutableClassDefBy(method.definingClass).methods.single { it.key() == method.key() }
        assertEquals("${build.name}: ${method.key()} still makes an Android toast itself", 0, patched.androidToasts())
        assertEquals("${build.name}: ${method.key()} Android toasts sent to the extension", method.androidToasts(),
            patched.calls().count { it.definingClass == UI_HOOKS && it.name == "androidToast" })
        assertEquals("${build.name}: ${method.key()} changed length", method.instructions().size, patched.instructions().size)
    }

    private fun Method.key() = "$definingClass->$name(${parameters().joinToString("")})$returnType"

    /** How many times this method calls Toast.makeText, whatever it's handed. */
    private fun Method.androidToasts() = calls().count { it.definingClass == "Landroid/widget/Toast;" && it.name == "makeText" }

    /** A static method that takes what Toast.makeText takes, answers nothing and makes the toast. */
    private fun Method.androidToastHelper() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
        parameters() == listOf("Landroid/content/Context;", "Ljava/lang/CharSequence;", "I") && androidToasts() > 0

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    /**
     * The container, the toast model base and every class extending it, then the classes behind
     * each interface a model's view builder asks for its text, then every other class with a method
     * that reads a text named for a save or that is a helper showing an Android toast.
     */
    private fun read(build: File): Input = inputs.getOrPut(build.canonicalPath) {
        val all = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex -> dex.classes.forEach { all[it.type] = it } }
        val container = all.getValue(TOAST_CONTAINER)
        val model = container.methods.mapNotNull { method -> method.parameterTypes.singleOrNull()?.toString()?.takeIf { type ->
            method.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.definingClass == type && call.parameterTypes.map(CharSequence::toString) == listOf(TOAST_CONTAINER) } == true } == true
        } }.single()
        fun extends(type: String): Boolean {
            var at: String? = type
            repeat(20) {
                if (at == model) return true
                at = all[at ?: return false]?.superclass
            }
            return false
        }
        val selected = all.values.filter { it.type == TOAST_CONTAINER || extends(it.type) }.map { ImmutableClassDef.of(it) }
        val asked = selected.filter { it.type != TOAST_CONTAINER }.flatMap { owner ->
            owner.methods.filter { it.returnType == TOAST_VIEW && it.parameters() == listOf(TOAST_CONTAINER) }.flatMap { it.calls() }
                .filter { it.returnType == "Ljava/lang/CharSequence;" }.map { it.definingClass }
        }.toSet()
        val builders = all.values.filter { owner -> owner.interfaces.any { it in asked } && !extends(owner.type) }.map { ImmutableClassDef.of(it) }
        val taken = (selected + builders).map { it.type }.toSet()
        val named = Regex("saved|pinned")
        val screens = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex ->
            if (dex.fieldSection.none { it.type == "I" && named.containsMatchIn(it.name) } &&
                dex.methodSection.none { it.definingClass == "Landroid/widget/Toast;" && it.name == "makeText" }) return@forEach
            for (owner in dex.classes) {
                if (owner.type in taken || owner.type in screens) continue
                if (owner.methods.any { method -> method.androidToastHelper() || method.implementation?.instructions?.any {
                        it.opcode == Opcode.SGET && ((it as ReferenceInstruction).reference as FieldReference).let { read ->
                            read.type == "I" && named.containsMatchIn(read.name) } } == true }) screens[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        Input(selected, model, builders, screens.values.toList())
    }

    private companion object {
        /** Each build is read once for the whole class: the search for its screens goes through every dex. */
        val inputs = mutableMapOf<String, Input>()
    }
}
