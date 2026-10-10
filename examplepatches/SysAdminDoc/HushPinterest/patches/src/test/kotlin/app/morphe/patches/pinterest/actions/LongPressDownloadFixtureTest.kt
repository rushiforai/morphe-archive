/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/**
 * Resolves the long-press menu's Download button against each declared Pinterest build. Every
 * class any of the patch's whole-APK rules could pick is loaded, so a target the patch finds once
 * here is the only one in the APK.
 */
@Category(FixtureTests::class)
class LongPressDownloadFixtureTest {
    @Test
    fun `the show hook and every stub resolve once and point at real members in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val found = context.longPressMenu()
            val original = found.show.implementation!!
            longPressDownloadPatch.execute(context)
            assertFlag(context, "longPressDownload", 1)
            assertFlag(context, "longPressMenu", 1)

            val show = context.mutableClassDefBy(CONTEXT_MENU).methods.single { it.signature() == found.show.signature() }
            val body = show.implementation!!.instructions.toList()
            val hook = body.first()
            assertEquals("${build.name} hook opcode", Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("${build.name} hook target", LONG_PRESS_HOOK, (hook as ReferenceInstruction).reference.toString())
            // p0 and p1, the menu and its event, as the method starts: nothing borrowed.
            assertEquals("${build.name} hook reads p0", original.registerCount - 3, (hook as RegisterRangeInstruction).startRegister)
            assertEquals("${build.name} hook reads p0..p1", 2, hook.registerCount)
            assertEquals("${build.name} register count", original.registerCount, show.implementation!!.registerCount)
            assertEquals("${build.name} the rest of the show method", render(original.instructions.toList()), render(body.drop(1)))
            val hosts = classes.flatMap { context.mutableClassDefBy(it.type).methods }.filter { method ->
                references(method).any { it.startsWith(LONG_PRESS) }
            }
            assertEquals("${build.name} host methods calling the extension", listOf(found.show.signature()), hosts.map { it.signature() })

            val extension = context.mutableClassDefBy(LONG_PRESS)
            fun stub(name: String) = references(extension.methods.single { it.name == name })
            val face = found.model.type
            assertTrue(build.name, "${found.event}->${found.model.name}:$face" in stub("eventPin"))
            assertTrue(build.name, found.pin in stub("eventPin"))
            assertEquals(build.name, listOf(CONTEXT_MENU, "$CONTEXT_MENU->${found.shown.name}:Ljava/lang/String;"), stub("menuModel"))
            assertEquals(build.name, listOf(face, "$face->${found.modelId.name}()Ljava/lang/String;"), stub("modelId"))
            assertEquals(build.name, listOf(CONTEXT_MENU, "$CONTEXT_MENU->${found.items.name}:Ljava/util/ArrayList;"), stub("menuItems"))
            assertEquals(build.name, listOf(CONTEXT_MENU, "$CONTEXT_MENU->${found.list.name}(Ljava/util/List;)V"), stub("layoutItems"))
            val item = stub("downloadItem")
            assertTrue(build.name, "${found.icon}->DOWNLOAD:${found.icon}" in item)
            assertTrue(build.name, "${found.strings}->download:I" in item)
            assertTrue(build.name, item.any { it.startsWith("${found.factory.definingClass}->${found.factory.name}(") })
            assertTrue(build.name, item.any { it.startsWith("${found.styler.definingClass}->${found.styler.name}(") })
            // Every member a stub names is declared where it says, so none of them fails to link at run time.
            for (name in LONG_PRESS_STUBS) {
                for (target in extension.methods.single { it.name == name }.implementation!!.instructions.mapNotNull {
                    (it as? ReferenceInstruction)?.reference
                }) {
                    val owner = when (target) {
                        is FieldReference -> target.definingClass
                        is MethodReference -> target.definingClass
                        else -> continue
                    }
                    if (owner.startsWith("Ljava/") || owner.startsWith("Landroid/")) continue
                    val declared = context.classDefByOrNull(owner)
                    assertNotNull("${build.name} $name names $owner", declared)
                    val exists = when (target) {
                        is FieldReference -> declared!!.fields.any { it.name == target.name && it.type == target.type }
                        else -> declared!!.methods.any { it.signature() == (target as MethodReference).signature() }
                    }
                    assertTrue("${build.name} $name names $target, which isn't declared", exists)
                }
            }

            // The click only downloads while the menu still holds the pin's id, so the touch handler
            // has to click the button under the finger before it closes the menu and clears the id.
            val menu = context.classDefBy(CONTEXT_MENU)
            val clear = menu.methods.filter { method -> method.signature() != found.show.signature() &&
                method.implementation?.instructions?.any { it.opcode == Opcode.IPUT_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).name == found.shown.name } == true
            }.single()
            val touch = classes.flatMap { it.methods }.filter { it.isMenuTouch() }.single()
            val calls = touch.implementation!!.instructions.toList().map { (it as? ReferenceInstruction)?.reference }
            val firstClose = calls.indexOfFirst { it is MethodReference && it.signature() == clear.signature() }
            assertTrue("${build.name} no close in ${touch.signature()}", firstClose > 0)
            val hit = calls.subList(0, firstClose).indexOfLast { it is MethodReference && it.definingClass == CONTEXT_MENU &&
                it.returnType == CONTEXT_MENU_ITEM }
            val click = calls.subList(0, firstClose).indexOfLast { it.toString() == "Landroid/view/View;->performClick()Z" }
            assertTrue("${build.name} the menu closes before it clicks the button under the finger", hit in 0 until click)

            println(
                "${build.name}: show ${found.show.signature()} regs=${original.registerCount} p0=v${original.registerCount - 3}, " +
                    "list ${found.list.name}, items ${found.items.name}, shown ${found.shown.name} cleared by ${clear.name}, " +
                    "id $face->${found.modelId.name}, event ${found.event}.${found.model.name}, pin ${found.pin}, " +
                    "model ${found.buttonModel.type}, icon ${found.icon}, factory ${found.factory.definingClass}->${found.factory.name}, " +
                    "styler ${found.styler.definingClass}->${found.styler.name}, strings ${found.strings}, touch ${touch.definingClass}",
            )
        }
    }

    @Test
    fun `a menu with no void List method refuses before any edit`() {
        refuses { classes ->
            classes.map { owner -> if (owner.type != CONTEXT_MENU) owner else owner.withMethods(owner.methods.filterNot { it.isItemList() }) }
        }
    }

    @Test
    fun `a menu with two void List methods refuses before any edit`() {
        refuses { classes ->
            classes.map { owner ->
                if (owner.type != CONTEXT_MENU) return@map owner
                val list = owner.methods.single { it.isItemList() }
                owner.withMethods(owner.methods + list.copy("hushSecondList"))
            }
        }
    }

    @Test
    fun `a second button styler refuses before any edit`() {
        refuses { classes ->
            classes.map { owner ->
                val styler = owner.methods.firstOrNull { it.isStyler() } ?: return@map owner
                owner.withMethods(owner.methods + styler.copy("hushSecondStyler"))
            }
        }
    }

    @Test
    fun `a missing status stub refuses before any edit`() {
        refuses(extension = { classes ->
            classes.map { owner ->
                if (owner.type != SETTINGS_STATUS) owner else owner.withMethods(owner.methods.filterNot { it.name == "longPressMenu" })
            }
        }) { it }
    }

    private fun refuses(extension: (List<ClassDef>) -> List<ClassDef> = { it }, host: (List<ClassDef>) -> List<ClassDef>) {
        val classes = host(read(Fixtures.declaredBuilds().first()))
        val context = PatchContexts.of(extension(ExtensionDex.classes()) + classes)
        val watched = classes.map { it.type } + LONG_PRESS + SETTINGS_STATUS
        val before = snapshot(context, watched)
        assertThrows(PatchException::class.java) { longPressDownloadPatch.execute(context) }
        assertEquals(before, snapshot(context, watched))
    }

    private fun snapshot(context: BytecodePatchContext, types: List<String>): Map<String, List<String>> = types.associateWith { type ->
        context.mutableClassDefBy(type).methods.map { "${it.signature()} ${render(it.implementation?.instructions?.toList().orEmpty())}" }.sorted()
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Int) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals(name, expected, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    private companion object {
        val builds = mutableMapOf<File, List<ClassDef>>()

        fun read(build: File): List<ClassDef> = builds.getOrPut(build) {
            val wanted = mutableMapOf<String, ClassDef>()
            FixtureDex.forEach(build) { dex ->
                for (owner in dex.classes) {
                    if (owner.type == CONTEXT_MENU || owner.type == PIN_MENU || owner.type == CONTEXT_MENU_ITEM ||
                        owner.isStrings() || owner.methods.any { it.isCandidate() }) {
                        wanted[owner.type] = ImmutableClassDef.of(owner)
                    }
                }
            }
            // The show event, the pin and the button icon, then the pin's interfaces, the id's owner.
            val menu = wanted.getValue(CONTEXT_MENU)
            val pin = wanted.getValue(PIN_MENU).fields.single { it.name == "pin" }.type
            val events = menu.methods.flatMap { it.parameterTypes.map(CharSequence::toString) }
                .filter { it.startsWith("L") && !it.startsWith("Ljava/") && !it.startsWith("Landroid/") }
            val icons = wanted.values.flatMap { it.methods }.filter { it.name == "<init>" && it.parameterTypes.size == 4 }
                .map { it.parameterTypes[0].toString() }
            wanted += FixtureDex.classes(build, (events + icons + pin).toSet() - wanted.keys)
            wanted += FixtureDex.classes(build, wanted.getValue(pin).interfaces.toSet() - wanted.keys)
            wanted.values.toList()
        }

        /** The same sweep the patch makes over every class, widened so nothing it could pick is missed. */
        private fun Method.isCandidate(): Boolean {
            val static = AccessFlags.STATIC.isSet(accessFlags)
            return when {
                name == "toString" -> strings().any { it.startsWith(MENU_BUTTON_MODEL) }
                static && returnType == CONTEXT_MENU_ITEM -> true
                isStyler() -> true
                name == "onTouch" -> isMenuTouch()
                else -> false
            }
        }

        private fun ClassDef.isStrings(): Boolean {
            val names = staticFields.filter { it.type == "I" }.map { it.name }
            return DOWNLOAD_LABEL in names && MENU_LABEL in names
        }

        fun Method.isStyler() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
            parameterTypes.map(CharSequence::toString) == listOf(CONTEXT_MENU_ITEM) &&
            implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == BUTTON_STYLE_COLOR } == true

        /** A touch handler that asks the menu which button is under the finger. */
        fun Method.isMenuTouch() = name == "onTouch" && implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.definingClass == CONTEXT_MENU && call.returnType == CONTEXT_MENU_ITEM
            } == true
        } == true

        fun Method.isItemList() = returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;") &&
            !AccessFlags.STATIC.isSet(accessFlags)

        private fun Method.strings(): List<String> = implementation?.instructions?.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }.orEmpty()

        fun Method.copy(name: String) = ImmutableMethod(
            definingClass, name, parameters, returnType, accessFlags, annotations, hiddenApiRestrictions, implementation,
        )

        fun ClassDef.withMethods(methods: Iterable<Method>) =
            ImmutableClassDef(type, accessFlags, superclass, interfaces, sourceFile, annotations, fields, methods)

        fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
        fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

        fun references(method: Method): List<String> =
            method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }.orEmpty()

        /** Opcodes and references, without the alignment nop the builder moves when a payload shifts. */
        fun render(instructions: List<Instruction>): List<String> =
            instructions.filter { it.opcode != Opcode.NOP }.map { "${it.opcode} ${(it as? ReferenceInstruction)?.reference ?: ""}" }
    }
}
