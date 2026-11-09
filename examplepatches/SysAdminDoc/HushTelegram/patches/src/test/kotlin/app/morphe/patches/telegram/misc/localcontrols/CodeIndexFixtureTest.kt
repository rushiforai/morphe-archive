/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.localcontrols

import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.commerce.PREMIUM_BLOCKED
import app.morphe.patches.telegram.misc.commerce.PREMIUM_DOCUMENT
import app.morphe.patches.telegram.misc.commerce.SEND_GRAM
import app.morphe.patches.telegram.misc.commerce.SETTINGS_SALES
import app.morphe.patches.telegram.misc.contactsblock.FOLDERS_DIALOG_COUNT
import app.morphe.patches.telegram.misc.contactsblock.TELEGRAM_CONTACTS
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.IdentityHashMap
import app.morphe.util.names.origString
import app.morphe.util.names.tgClassDefBy
import app.morphe.util.names.tgMutableClassDefBy

/**
 * The index has to hand every search each method a walk over the whole app would find, on the
 * real builds: the searches the patches make, and a spread of strings, calls, fields, types and
 * literals taken from the builds themselves. It also has to keep up with a patch's edits and keep
 * one session's classes out of another's.
 */
class CodeIndexFixtureTest {
    /** What one method's code mentions, read once so every probe can be checked against it. */
    private class Facts(
        val references: Set<String>,
        val strings: Set<String>,
        val types: Set<String>,
        val members: Set<String>,
        val literals: Set<Long>,
    )

    /** A search: what the index is asked, and the exact test a patch would run on each method. */
    private class Probe(val name: String, val mention: Mention, val exact: (Facts) -> Boolean)

    private fun facts(method: Method): Facts {
        val references = mutableSetOf<String>()
        val strings = mutableSetOf<String>()
        val types = mutableSetOf<String>()
        val members = mutableSetOf<String>()
        val literals = mutableSetOf<Long>()
        for (instruction in method.implementation?.instructions ?: emptyList()) {
            if (instruction is WideLiteralInstruction) literals += instruction.wideLiteral
            val reference = (instruction as? ReferenceInstruction)?.reference ?: continue
            references += reference.origString()
            when (reference) {
                is StringReference -> strings += reference.string
                is TypeReference -> types += reference.type
                is FieldReference -> {
                    types += reference.definingClass
                    members += "${reference.definingClass}->${reference.name}"
                }
                is MethodReference -> {
                    types += reference.definingClass
                    members += "${reference.definingClass}->${reference.name}"
                }
            }
        }
        return Facts(references, strings, types, members, literals)
    }

    private fun signature(method: Method) =
        "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"

    /** Every class of [build], read from its dex files as the patcher reads them, not copied. */
    private fun everyClass(build: File): List<ClassDef> {
        // Each dex is its own buffer, so keeping its classes keeps nothing a later dex reuses.
        val classes = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex -> classes += dex.classes }
        return classes
    }

    private fun BytecodePatchContext.walk(): List<ClassDef> {
        val walked = mutableListOf<ClassDef>()
        classDefForEach { walked += it }
        return walked
    }

    /** The patches' own searches, which must also narrow the app to a small part of it. */
    private fun searches() = listOf(
        Probe("contacts block builder", Mention.reference(FOLDERS_DIALOG_COUNT) and Mention.reference(TELEGRAM_CONTACTS)) {
            FOLDERS_DIALOG_COUNT in it.references && TELEGRAM_CONTACTS in it.references
        },
        Probe("Settings sales rows", Mention.anyReference(SETTINGS_SALES)) { facts ->
            SETTINGS_SALES.any { it in facts.references }
        },
        Probe("Send Gram", Mention.reference(SEND_GRAM)) { SEND_GRAM in it.references },
        Probe("Premium sticker filter", Mention.reference(PREMIUM_BLOCKED) and Mention.reference(PREMIUM_DOCUMENT)) {
            PREMIUM_BLOCKED in it.references && PREMIUM_DOCUMENT in it.references
        },
    )

    /** Strings, calls, fields, types and literals spread across [classes], each a search of its own. */
    private fun samples(classes: List<ClassDef>): List<Probe> {
        val probes = mutableListOf<Probe>()
        for (at in classes.indices step 701) {
            val instructions = classes[at].methods.flatMap { it.implementation?.instructions ?: emptyList() }
            val references = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
            references.filterIsInstance<StringReference>().map { it.string }.firstOrNull { it.length >= 4 }?.let { text ->
                probes += Probe("string $text", Mention.string(text)) { text in it.strings }
                probes += Probe("reference to string $text", Mention.reference(text)) { text in it.references }
            }
            references.filterIsInstance<MethodReference>().lastOrNull()?.let { call ->
                val text = call.toString()
                probes += Probe("call $text", Mention.reference(text)) { text in it.references }
                val member = "${call.definingClass}->${call.name}"
                probes += Probe("member $member", Mention.member(call.definingClass, call.name)) { member in it.members }
            }
            references.filterIsInstance<FieldReference>().firstOrNull()?.let { field ->
                val text = field.toString()
                probes += Probe("field $text", Mention.reference(text)) { text in it.references }
            }
            references.filterIsInstance<TypeReference>().firstOrNull()?.let { type ->
                val text = type.type
                probes += Probe("type $text", Mention.type(text)) { text in it.types }
                probes += Probe("reference to type $text", Mention.reference(text)) { text in it.references }
            }
            instructions.filterIsInstance<WideLiteralInstruction>().map { it.wideLiteral }
                .firstOrNull { it !in -16L..16L }?.let { value ->
                    probes += Probe("literal $value", Mention.literal(value)) { value in it.literals }
                }
        }
        return probes
    }

    /**
     * Each probe's candidates hold every class a walk over every class finds, in the walk's order.
     * Where a probe narrows the app, its methods are compared one by one as well; a probe that
     * matches most of the app (a common call, say) is held to the classes alone, which is what
     * the methods follow from.
     */
    private fun assertSameMethods(build: File, context: BytecodePatchContext, probes: List<Probe>) {
        val walked = context.walk()
        val expected = probes.associateWith { mutableListOf<String>() }
        val holding = probes.associateWith { IdentityHashMap<ClassDef, Unit>() }
        for (classDef in walked) for (method in classDef.methods) {
            val facts = facts(method)
            for (probe in probes) if (probe.exact(facts)) {
                expected.getValue(probe) += signature(method)
                holding.getValue(probe)[classDef] = Unit
            }
        }
        for (probe in probes) {
            val candidates = context.classDefsMentioning(probe.mention)
            val chosen = IdentityHashMap<ClassDef, Unit>().apply { candidates.forEach { put(it, Unit) } }
            assertEquals("${build.name}: ${probe.name} keeps the walk's order", walked.filter { it in chosen }, candidates)
            val missed = holding.getValue(probe).keys.filter { it !in chosen }.map { it.type }
            assertEquals("${build.name}: ${probe.name} leaves out no class the walk finds", emptyList<String>(), missed)
            if (candidates.size > walked.size / 10) continue
            val found = candidates.flatMap { classDef -> classDef.methods.filter { probe.exact(facts(it)) }.map(::signature) }
            assertEquals("${build.name}: ${probe.name} finds every method the walk finds", expected.getValue(probe), found)
        }
    }

    @Test
    fun `every search finds what a walk over the whole app finds`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = everyClass(build)
            val context = PatchContexts.of(classes)
            val total = context.walk().size
            val searches = searches()
            assertSameMethods(build, context, searches + samples(classes))
            for (search in searches) {
                val candidates = context.classDefsMentioning(search.mention).size
                assertTrue("${build.name}: ${search.name} narrows the app ($candidates of $total)", candidates in 1..total / 50)
            }
        }
    }

    @Test
    fun `a class a patch has edited is searched as it now reads`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = everyClass(build)
            val context = PatchContexts.of(classes)
            val wanted = "hush_index_probe_string"
            val before = context.classDefsMentioning(Mention.string(wanted))
            assertTrue("${build.name}: no class mentions the probe yet",
                before.none { classDef -> classDef.methods.any { wanted in facts(it).strings } })
            // A class the index read before the edit and leaves out, so only its swap for a mutable
            // class can bring it back.
            val target = context.walk().first { classDef ->
                before.none { it === classDef } && classDef.methods.any { (it.implementation?.registerCount ?: 0) >= 1 }
            }
            val method = context.tgMutableClassDefBy(target.type).methods.first { (it.implementation?.registerCount ?: 0) >= 1 }
            method.addInstructions(0, "const-string v0, \"$wanted\"")
            val edited = context.tgClassDefBy(target.type)
            assertTrue("${build.name}: the edited class is a candidate",
                context.classDefsMentioning(Mention.string(wanted)).any { it === edited })
            assertSameMethods(build, context, listOf(Probe("edited string", Mention.string(wanted)) { wanted in it.strings }))
        }
    }

    @Test
    fun `each patching session reads only its own classes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = everyClass(build)
        val whole = PatchContexts.of(classes)
        val part = PatchContexts.of(classes.take(500))
        assertSame(CodeIndex.of(whole), CodeIndex.of(whole))
        assertNotSame(CodeIndex.of(whole), CodeIndex.of(part))
        val own = IdentityHashMap<ClassDef, Unit>().apply { part.walk().forEach { put(it, Unit) } }
        for (search in searches() + samples(classes.take(500))) {
            assertTrue("${build.name}: ${search.name} holds only the session's own classes",
                part.classDefsMentioning(search.mention).all { it in own })
        }
        assertSameMethods(build, part, searches() + samples(classes.take(500)))
    }
}
