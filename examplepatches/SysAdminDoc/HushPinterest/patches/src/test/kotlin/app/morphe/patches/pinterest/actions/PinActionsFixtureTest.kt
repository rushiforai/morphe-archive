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
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** Resolves and applies the real native action targets in each declared build. */
@Category(FixtureTests::class)
class PinActionsFixtureTest {
    @Test
    fun `all action hooks use the real pin menu Visit dispatcher and chooser in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            downloadPinsPatch.execute(context)
            externalBrowserPatch.execute(context)
            systemSharePatch.execute(context)
            for (name in listOf("downloadPins", "pinDownloads", "externalBrowser", "visitLinks", "systemShare", "pinShare")) {
                assertFlag(context, name, 1)
            }
            val menu = context.mutableClassDefBy(PIN_MENU)
            assertTrue(build.name, menu.methods.map { it.name }.containsAll(
                listOf("hushDownloadPin", "hushDownloadMenu", "hushDownloadOrigin", "hushDownloadCloseup", "hushDismissDownload"),
            ))
            val create = menu.methods.single { it.name == "createModalView" }
            val instructions = create.implementation!!.instructions.toList()
            val attach = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() == "$EXTENSION_PACKAGE/actions/PinDownloads;->attach(Ljava/lang/Object;)V"
            }
            assertTrue("${build.name} menu hook", attach > 0)
            assertEquals("${build.name} hook must follow native layout assignment", Opcode.IPUT_OBJECT, instructions[attach - 1].opcode)
            val downloads = context.mutableClassDefBy("$EXTENSION_PACKAGE/actions/PinDownloads;")
            val closeup = menu.methods.single { it.name == "hushDownloadCloseup" }.implementation!!.instructions.toList()
            assertEquals(listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN), closeup.map { it.opcode })
            assertTrue(references(closeup).any { it.endsWith("->isPinCloseup:Z") })
            val row = downloads.methods.single { it.name == "menuRow" }.implementation!!.instructions.toList()
            assertTrue("${build.name} native Download icon", references(row).any { "->DOWNLOAD:" in it })
            assertTrue("${build.name} native row factory", references(row).any { it.endsWith(")Landroid/widget/RelativeLayout;") })
            val cell = downloads.methods.single { it.name == "cellPin" }.implementation!!.instructions.toList()
            assertEquals("${build.name} typed cell guard", Opcode.INSTANCE_OF, cell.first().opcode)
            assertEquals("${build.name} typed model getters", 2, cell.count { it.opcode == Opcode.INVOKE_INTERFACE })
            assertTrue(references(cell).any { it.contains("->getInternalCell()") })
            assertTrue(references(cell).any { it.endsWith("->getPin()${menu.fields.single { field -> field.name == "pin" }.type}") })
            assertTrue("${build.name} native presenter dismissal", references(menu.methods.single { it.name == "hushDismissDownload" }
                .implementation!!.instructions.toList()).any { "->" in it && it.endsWith("()V") })
            for ((owner, helper, expected) in listOf(
                Triple("ExternalBrowser", "open(Ljava/lang/String;Ljava/lang/Object;)Z", 1),
                Triple("ExternalBrowser", "openProfile(Ljava/lang/String;)Z", 2),
                Triple("SystemShare", "open(Ljava/lang/Object;Ljava/lang/Object;)Z", 1),
                Triple("SystemShare", "openSendable(Ljava/lang/Object;Ljava/lang/Object;)Z", 1),
            )) {
                val calls = classes.flatMap { original -> context.mutableClassDefBy(original.type).methods }.count { method ->
                    method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() ==
                        "$EXTENSION_PACKAGE/actions/$owner;->$helper" } == true
                }
                assertEquals("${build.name} $owner $helper handler count", expected, calls)
            }
        }
    }

    @Test
    fun `closeup share closes through the close-screen method its own fragment inherits in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            systemSharePatch.execute(context)
            val open = "$EXTENSION_PACKAGE/actions/SystemShare;->openSendable(Ljava/lang/Object;Ljava/lang/Object;)Z"
            val (fragment, onCreate) = classes.flatMap { original ->
                context.mutableClassDefBy(original.type).methods.map { original.type to it }
            }.single { (_, method) -> open in references(method.implementation?.instructions?.toList() ?: emptyList()) }
            val instructions = onCreate.implementation!!.instructions.toList()
            val call = instructions.drop(instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == open })
                .first { it.opcode == Opcode.INVOKE_VIRTUAL }
            val close = (call as ReferenceInstruction).reference as MethodReference
            val chain = generateSequence(fragment) { type -> classes.firstOrNull { it.type == type }?.superclass }.toList()
            assertTrue("${build.name} ${close.definingClass} is not above $fragment: $chain", close.definingClass in chain.drop(1))
            val target = classes.single { it.type == close.definingClass }.methods.single {
                it.name == close.name && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            assertTrue("${build.name} ${close.definingClass}->${close.name} is not the close-screen method", target.closesScreen())
        }
    }

    @Test
    fun `missing close-screen method refuses system share before host changes`() {
        val classes = read(Fixtures.declaredBuilds().first())
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { owner -> owner.methods.any { it.closesScreen() } })
        assertThrows(PatchException::class.java) { systemSharePatch.execute(context) }
        assertFlag(context, "systemShare", 0)
        assertFlag(context, "pinShare", 0)
        assertFalse(classes.flatMap { context.mutableClassDefByOrNull(it.type)?.methods ?: emptyList() }.any { method ->
            references(method.implementation?.instructions?.toList() ?: emptyList()).any { "/SystemShare;->" in it }
        })
    }

    @Test
    fun `missing profile website binding refuses browser capability before host changes`() {
        val classes = read(Fixtures.declaredBuilds().first())
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { owner ->
            owner.methods.any { "websiteUrlView" in it.strings() }
        })
        assertThrows(PatchException::class.java) { externalBrowserPatch.execute(context) }
        assertFlag(context, "externalBrowser", 0)
        assertFlag(context, "visitLinks", 0)
        assertFalse(classes.flatMap { context.mutableClassDefByOrNull(it.type)?.methods ?: emptyList() }.any { method ->
            references(method.implementation?.instructions?.toList() ?: emptyList()).any { "/ExternalBrowser;->" in it }
        })
    }

    @Test
    fun `missing typed grid interface refuses downloads before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build).filterNot { owner -> owner.methods.any { it.name == "getInternalCell" } }
        val context = PatchContexts.of(ExtensionDex.classes() + classes)
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "downloadPins", 0)
    }

    @Test
    fun `missing menu row dependency refuses download capability before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build)
        val menu = classes.single { it.type == PIN_MENU }
        val layout = menu.fields.single { it.name == "modalView" }.type
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { it.type == layout })
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "downloadPins", 0)
        assertFlag(context, "pinDownloads", 0)
    }

    private fun references(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>): List<String> =
        instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    // Pinterest's base screen fragment closes itself by comparing its ScreenDescription with the
    // top of the screen stack, then signals back navigation with TRUE or removes itself.
    private fun Method.closesScreen(): Boolean {
        val refs = references(implementation?.instructions?.toList() ?: return false)
        return returnType == "V" && parameterTypes.isEmpty() &&
            refs.count { it.endsWith("()Lcom/pinterest/framework/screens/ScreenDescription;") } == 2 &&
            "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;" in refs && refs.any { it.endsWith("->onNext(Ljava/lang/Object;)V") }
    }

    private fun Method.strings(): Set<String> = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }?.toSet() ?: emptySet()

    private fun read(build: File): List<ClassDef> {
        val wanted = mutableMapOf<String, ClassDef>()
        val sourceTypes = mutableSetOf<String>()
        val potentialShareFragments = mutableListOf<ClassDef>()
        val superclasses = mutableMapOf<String, String?>()
        var dispatchers = 0
        var choosers = 0
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                superclasses[owner.type] = owner.superclass
                val visit = owner.methods.any { it.strings().containsAll(setOf("_url", "android_client_tracking_params_consistency")) }
                val profile = owner.methods.any { method ->
                    "websiteUrlView" in method.strings() || method.name == "onClick" &&
                        method.implementation?.instructions?.any {
                            (it as? ReferenceInstruction)?.reference?.toString()?.startsWith("Lcom/pinterest/navigation/Navigation;->") == true
                        } == true
                }
                val share = owner.methods.any { method ->
                    method.parameterTypes.size == 5 && method.parameterTypes[1].toString() == "I" &&
                        method.parameterTypes[3].toString() == "Z" && method.fields().map { it.name }.toSet().containsAll(
                            setOf("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"),
                        )
                }
                owner.methods.filter { method ->
                    method.parameterTypes.size == 5 && method.parameterTypes[1].toString() == "I" &&
                        method.parameterTypes[3].toString() == "Z" && method.fields().map { it.name }.toSet().containsAll(
                            setOf("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"),
                        )
                }.mapTo(sourceTypes) { it.parameterTypes[2].toString() }
                val shareFragment = owner.methods.any { method ->
                    method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf("Landroid/os/Bundle;") &&
                        method.strings().contains("context") &&
                        method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() ==
                            "Lcom/pinterest/sendshare/model/SendableObject;" } == true
                }
                if (visit) dispatchers++
                if (share) choosers++
                if (shareFragment) potentialShareFragments += owner
                val grid = com.android.tools.smali.dexlib2.AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
                    owner.methods.any { it.name == "getInternalCell" || it.name == "getPin" && it.returnType.startsWith("Lcom/pinterest/api/model/") }
                if (owner.type == PIN_MENU || visit || share || profile || grid) wanted[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        potentialShareFragments.filter { owner ->
            owner.methods.any { method ->
                method.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference?.toString() in sourceTypes
                } == true
            }
        }.forEach { wanted[it.type] = ImmutableClassDef.of(it) }
        // The share fragment closes itself through a method it inherits, so its superclasses come too.
        val shareFragments = wanted.keys.filter { type -> potentialShareFragments.any { it.type == type } }
        wanted += FixtureDex.classes(build, shareFragments.flatMap { fragment ->
            generateSequence(superclasses[fragment]) { superclasses[it] }.toList()
        }.toSet())
        assertEquals("${build.name} Visit owner", 1, dispatchers)
        assertEquals("${build.name} share chooser owner", 1, choosers)
        val menu = wanted.getValue(PIN_MENU)
        val dependencies = FixtureDex.classes(build, menu.fields.filter { it.name in setOf("modalView", "presenter") }.map { it.type }.toSet())
        wanted += dependencies
        val icons = dependencies.values.flatMap { owner -> owner.methods.filter { it.returnType == "Landroid/widget/RelativeLayout;" }
            .flatMap { it.parameterTypes }.map { it.toString() }.filter { it.startsWith('L') && it != "Ljava/lang/String;" } }.toSet()
        wanted += FixtureDex.classes(build, icons)
        return wanted.values.toList()
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Int) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals(name, expected, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
    }
}
