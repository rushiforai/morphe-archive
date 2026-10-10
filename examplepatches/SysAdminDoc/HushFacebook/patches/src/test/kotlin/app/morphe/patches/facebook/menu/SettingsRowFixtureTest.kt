/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.namesString
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The anchors of Hushfacebook in the Menu on every declared Facebook build: the native group
 * section makes row items and stores one finished row list it reads back; one tap handler takes that row
 * item and picks by its id; two loggers take it too; the item has one full constructor storing
 * each argument, the id last, and Facebook's own rows pass their address first.
 */
class SettingsRowFixtureTest {
    /** How many row loggers each declared build's tap class has, by ABI. 582's 32-bit build dropped both. */
    private val loggerCount = mapOf(
        "582.0.0.50.54" to mapOf("arm64-v8a" to 2, "armeabi-v7a" to 0),
    )

    private fun Method.instructionList() = implementation?.instructions?.toList().orEmpty()

    /** The argument registers of an invoke, in order. */
    private fun arguments(instruction: Any): List<Int> = when (instruction) {
        is RegisterRangeInstruction ->
            (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
            instruction.registerF, instruction.registerG).take(instruction.registerCount)
        else -> emptyList()
    }

    /** The strings [method] passes as the first address of a row it builds with [constructor]. */
    private fun firstAddresses(method: Method, constructor: String): List<String> {
        val instructions = method.instructionList()
        val found = mutableListOf<String>()
        instructions.forEachIndexed { index, instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
            if ("${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})V" != constructor) return@forEachIndexed
            // this, the title, then the address.
            val register = arguments(instruction).getOrNull(2) ?: return@forEachIndexed
            val load = instructions.subList(0, index).lastOrNull {
                it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == register
            }
            ((load as? ReferenceInstruction)?.reference as? StringReference)?.let { found += it.string }
        }
        return found
    }

    @Test
    fun `each declared build has one row list, one row tap handler and the row item they share`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val natives = mutableListOf<Method>()
                FixtureDex.forEach(bundle) { dex ->
                    if (NATIVE_SECTION_KEY !in dex.stringSection.toSet()) return@forEach
                    for (classDef in dex.classes) {
                        for (method in classDef.methods) {
                            if (isNativeSectionChildren(method)) natives += ImmutableMethod.of(method)
                        }
                    }
                }
                // 582 asks a string table for the trace, so a tap's dex can hold no copy of it.
                val tables = FixtureDex.classesHolding(bundle, ROW_TAP_TRACE).associateBy { it.type }
                val table: (MethodReference) -> Method? = { call -> tables[call.definingClass]?.let { resolveStatic(it, call) } }
                val taps = FixtureDex.methodsWhere(bundle, { dex ->
                    ROW_TAP_TRACE in dex.stringSection || dex.methodSection.any { it.definingClass in tables }
                }) { isRowTap(it, table) }
                assertEquals("${bundle.name}: native Menu group sections", 1, natives.size)
                assertEquals("${bundle.name}: Menu row tap handlers", 1, taps.size)
                val native = natives.single()
                val stores = settingsListStores(native)
                assertEquals("${bundle.name}: finished row lists the native section stores", 1, stores.size)
                val tap = taps.single()
                val item = rowItemType(tap)

                val classes = FixtureDex.classes(bundle, setOf(item, tap.definingClass))
                val itemClass = classes.getValue(item)
                assertTrue("${bundle.name}: the native section makes no $item", native.instructionList().any {
                    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == item
                })

                // The item: one full constructor storing every argument, the id last.
                val constructor = fullConstructor(itemClass)
                assertNotNull("${bundle.name}: $item's full constructor", constructor)
                val fields = constructorFields(constructor!!)
                assertNotNull("${bundle.name}: $item's constructor fields", fields)
                val id = idField(itemClass)
                assertNotNull("${bundle.name}: $item's id field", id)
                assertEquals("${bundle.name}: the constructor's id field", id!!.name, fields!!.last().name)
                assertTrue("${bundle.name}: the factory would need ${rowFactoryLocals(constructor)} locals",
                    rowFactoryLocals(constructor) <= 15)
                assertTrue("${bundle.name}: $item already has a method the patch adds",
                    itemClass.methods.none { it.name == ROW_FACTORY || it.name == ROW_ID_READER })

                // Facebook's own rows pass the address a tap opens first: Scam protection center
                // is built with its web address there.
                val full = "${constructor.definingClass}-><init>(${constructor.parameterTypes.joinToString("")})V"
                val addresses = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.typeSection.any { it == item }
                }) { method -> method.instructionList().any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == item && it.name == "<init>" && it.parameterTypes.size == constructor.parameterTypes.size
                    } == true
                } }.flatMap { firstAddresses(it, full) }
                assertTrue("${bundle.name}: no row built with a web address first: $addresses",
                    addresses.any { it.startsWith("https://www.facebook.com/") })

                // The tap handler picks by the row's id, and the loggers of its class take the row.
                assertTrue("${bundle.name}: the tap handler never reads the row's id", tap.instructionList().any {
                    it.opcode == Opcode.IGET_WIDE && ((it as ReferenceInstruction).reference as FieldReference).name == id.name
                })
                val owner = classes.getValue(tap.definingClass)
                val ownerTap = owner.methods.single { it.name == tap.name && it.parameterTypes.size == tap.parameterTypes.size }
                val loggers = rowLoggers(owner, ownerTap, item)
                val abi = bundle.name.substringAfter("-$version-").substringBefore(".apkm")
                assertEquals("${bundle.name}: row loggers", loggerCount[version]?.get(abi), loggers.size)
                for (method in loggers + ownerTap) {
                    assertTrue("${bundle.name}: ${method.name} has ${method.localRegisterCount()} locals",
                        method.localRegisterCount() >= 3)
                }
                assertTrue("${bundle.name}: a logger doesn't read the row's id", loggers.all { logger ->
                    logger.instructionList().any {
                        it.opcode == Opcode.IGET_WIDE && ((it as ReferenceInstruction).reference as FieldReference).name == id.name
                    }
                })
                assertTrue(namesString(tap, ROW_TAP_TRACE, table))
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
