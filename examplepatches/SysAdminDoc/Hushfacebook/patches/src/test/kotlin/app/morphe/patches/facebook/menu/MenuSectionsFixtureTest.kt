/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.isEnumNaming
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
 * The anchors of Hide Menu promotions on every declared Facebook build: one native group section
 * and one server group section, each reading the Menu's group enum once and building its children
 * through the same list; a free local where the hooks go; the native section drawing the
 * collapsible header the phone reads out; and the Upgrades and Also from Meta groups being the
 * enum's UPSELL and PRODUCTS_FROM_FACEBOOK, where the root adds them.
 */
class MenuSectionsFixtureTest {
    /**
     * The id of "%1$s, header. Section is %2$s. Double-tap to %3$s the section." in each build, the
     * label TalkBack reads on the Menu's group headers ("Upgrades, header. Section is expanded.").
     * Read from assets/strings/default.frsc.xz, where Facebook keeps its English strings.
     */
    private val headerLabel = mapOf(
        "580.0.0.51.74" to 0x7f140436,
        "577.0.0.50.72" to 0x7f14042d,
    )

    private val testKeys = listOf(UPGRADES_TEST_KEY, ALSO_FROM_META_TEST_KEY)

    private fun Method.instructionList() = implementation?.instructions?.toList().orEmpty()

    private fun loadsLiteral(method: Method, value: Int): Boolean = method.instructionList().any {
        it.opcode in setOf(Opcode.CONST, Opcode.CONST_HIGH16) && (it as NarrowLiteralInstruction).narrowLiteral == value
    }

    private fun created(method: Method): Set<String> = method.instructionList()
        .filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }
        .toSet()

    /**
     * The classes [method] builds: what it creates, and what the calls it makes hand back. Redex
     * moves some constructions into static factories of their own, as 577 does for both sections.
     */
    private fun built(method: Method): Set<String> = created(method) + method.instructionList()
        .filter { it.opcode.name.startsWith("invoke-") }
        .map { ((it as ReferenceInstruction).reference as MethodReference).returnType }

    private fun staticReads(method: Method): Set<String> = method.instructionList()
        .filter { it.opcode == Opcode.SGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .map { "${it.definingClass}->${it.name}" }
        .toSet()

    /** Every type [method] could hand the group in: what its calls answer and its fields hold. */
    private fun candidateTypes(method: Method): Set<String> = method.instructionList().mapNotNull {
        when (val reference = (it as? ReferenceInstruction)?.reference) {
            is MethodReference -> reference.returnType
            is FieldReference -> reference.type
            else -> null
        }
    }.filter { it.startsWith("L") }.toSet()

    /**
     * The static field each constant of [enum] is stored in, by the constant's name: the name
     * handed to the constructor of the instance its class initializer stores there.
     */
    private fun constantFields(enum: ClassDef): Map<String, String> {
        val initializer = enum.methods.single { it.name == "<clinit>" }
        // What each register holds as the initializer runs: a string, or the instance made at an index.
        val strings = mutableMapOf<Int, String>()
        val instances = mutableMapOf<Int, Int>()
        val names = mutableMapOf<Int, String>()
        val fields = mutableMapOf<String, String>()
        fun constructed(instance: Int?, name: String?) {
            if (instance != null && name != null) names[instance] = name
        }
        initializer.instructionList().forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            when (instruction.opcode) {
                Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> {
                    val register = (instruction as OneRegisterInstruction).registerA
                    strings[register] = (reference as StringReference).string
                    instances.remove(register)
                }
                Opcode.NEW_INSTANCE -> {
                    val register = (instruction as OneRegisterInstruction).registerA
                    instances[register] = index
                    strings.remove(register)
                }
                Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> {
                    val copy = instruction as TwoRegisterInstruction
                    strings.remove(copy.registerA)
                    instances.remove(copy.registerA)
                    strings[copy.registerB]?.let { strings[copy.registerA] = it }
                    instances[copy.registerB]?.let { instances[copy.registerA] = it }
                }
                Opcode.INVOKE_DIRECT -> {
                    val invoke = instruction as FiveRegisterInstruction
                    val call = reference as MethodReference
                    if (call.name == "<init>" && call.definingClass == enum.type && invoke.registerCount >= 2) {
                        constructed(instances[invoke.registerC], strings[invoke.registerD])
                    }
                }
                Opcode.INVOKE_DIRECT_RANGE -> {
                    val invoke = instruction as RegisterRangeInstruction
                    val call = reference as MethodReference
                    if (call.name == "<init>" && call.definingClass == enum.type && invoke.registerCount >= 2) {
                        constructed(instances[invoke.startRegister], strings[invoke.startRegister + 1])
                    }
                }
                Opcode.SPUT_OBJECT -> {
                    val field = reference as FieldReference
                    val name = instances[(instruction as OneRegisterInstruction).registerA]?.let(names::get)
                    if (field.type == enum.type && name != null) fields[name] = "${field.definingClass}->${field.name}"
                }
                else -> Unit
            }
        }
        return fields
    }

    @Test
    fun `each declared build has one native and one server Menu group section, typed by the group enum`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            val label = headerLabel[version]
                ?: throw AssertionError("no header label id for $version: read it from that build's default.frsc.xz")
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val natives = mutableListOf<Method>()
                val servers = mutableListOf<Method>()
                val keyHolders = mutableMapOf<String, MutableList<Method>>()
                var nativeKeyHolders = 0
                FixtureDex.forEach(bundle) { dex ->
                    val strings = dex.stringSection.toSet()
                    if (listOf(NATIVE_SECTION_KEY, SERVER_POSITIONS.first()).plus(testKeys).none { it in strings }) {
                        return@forEach
                    }
                    for (classDef in dex.classes) {
                        for (method in classDef.methods) {
                            if (holdsString(method, NATIVE_SECTION_KEY)) nativeKeyHolders++
                            if (isNativeSectionChildren(method)) natives += ImmutableMethod.of(method)
                            if (isServerSectionChildren(method)) servers += ImmutableMethod.of(method)
                            for (key in testKeys) {
                                if (holdsString(method, key)) keyHolders.getOrPut(key, ::mutableListOf) += ImmutableMethod.of(method)
                            }
                        }
                    }
                }
                assertEquals("${bundle.name}: methods loading \"$NATIVE_SECTION_KEY\"", 1, nativeKeyHolders)
                assertEquals("${bundle.name}: native Menu group sections", 1, natives.size)
                assertEquals("${bundle.name}: server Menu group sections", 1, servers.size)
                val native = natives.single()
                val server = servers.single()

                val classes = FixtureDex.classes(bundle,
                    candidateTypes(native) + candidateTypes(server) + created(native))
                val isGroupEnum = { type: String -> classes[type]?.let { isEnumNaming(it, SECTION_NAMES) } == true }

                // Each section reads the group once, and both read the same enum.
                val nativeRead = nativeGroupRead(native, isGroupEnum)
                val serverRead = serverGroupRead(server, isGroupEnum)
                assertNotNull("${bundle.name}: the native section's one group call", nativeRead)
                assertNotNull("${bundle.name}: the server section's one group field", serverRead)
                assertEquals("${bundle.name}: the two sections' group enums", nativeRead!!.type, serverRead!!.type)
                val enum = classes.getValue(nativeRead.type)

                // Both hand their children back through the same list, which the hooks build empty.
                val nativeList = childrenList(native)
                assertNotNull("${bundle.name}: the native section's children list", nativeList)
                assertEquals("${bundle.name}: the two sections' children lists", nativeList, childrenList(server))

                // A local no higher than v15 is free where each hook goes.
                for ((method, read) in listOf(native to nativeRead, server to serverRead)) {
                    val free = method.freeLocalsAt(PATCH, read.index + 1, 1)
                    assertTrue("${bundle.name}: v${free.single()} in ${method.name}", free.single() <= 15)
                }

                // The native section draws the group's collapsible header, the one TalkBack reads
                // as "Upgrades, header. Section is expanded." on the phone.
                val headers = created(native).mapNotNull(classes::get)
                    .filter { component -> component.methods.any { loadsLiteral(it, label) } }
                assertEquals("${bundle.name}: header components the native section creates", 1, headers.size)

                // Where the root adds the Upgrades and Also from Meta groups, it tags each with its
                // test key, reads the group's constant, and builds both hooked sections.
                val constants = constantFields(enum)
                for ((key, group) in listOf(UPGRADES_TEST_KEY to UPGRADES, ALSO_FROM_META_TEST_KEY to ALSO_FROM_META)) {
                    val holders = keyHolders[key].orEmpty()
                    assertEquals("${bundle.name}: methods loading \"$key\"", 1, holders.size)
                    val adder = holders.single()
                    val constant = constants[group] ?: throw AssertionError("${bundle.name}: ${enum.type} has no $group")
                    assertTrue("${bundle.name}: \"$key\"'s method doesn't read $group", constant in staticReads(adder))
                    assertTrue("${bundle.name}: \"$key\"'s method doesn't build both sections",
                        built(adder).containsAll(setOf(native.definingClass, server.definingClass)))
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
