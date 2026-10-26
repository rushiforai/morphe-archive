/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.facebook.downloads.photo.MENU_LISTENER
import app.morphe.patches.facebook.downloads.photo.OFFERS_PHOTO_SAVE
import app.morphe.patches.facebook.downloads.photo.VIDEO_TYPE
import app.morphe.patches.facebook.downloads.photo.WRAP_SAVE_ACTION
import app.morphe.patches.facebook.downloads.photo.isSavePhotoAction
import app.morphe.patches.facebook.downloads.photo.photoDownloadGates
import app.morphe.patches.facebook.downloads.photo.unlockPhotoSave
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ReferenceIndex
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedClassDef
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

/** Full-APK scan equivalence for #236, retaining the vendor's dex-backed classes rather than copying their code. */
class PatchScanFixtureTest {
    private data class ColourSite(
        val owner: String,
        val method: String,
        val index: Int,
        val opcode: Opcode,
        val registers: List<Int>,
        val source: String,
        val target: String,
    )

    private data class PhotoGate(val owner: String, val method: String, val index: Int, val flag: Int)
    private data class PhotoAction(val owner: String, val method: String, val index: Int, val listener: Int)
    private data class Census(
        val colours: MutableList<ColourSite> = mutableListOf(),
        val gates: MutableList<PhotoGate> = mutableListOf(),
        val actions: MutableList<PhotoAction> = mutableListOf(),
        val logging: MutableList<String> = mutableListOf(),
    )

    private fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Instruction.referenceText() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (0 until registerCount).map { startRegister + it }
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> error("Unexpected call form $opcode")
    }

    // Deliberately use the former full-descriptor lookup as the oracle, independently of owner/name filtering.
    private fun colourSites(method: Method, calls: Map<String, String>): List<ColourSite> {
        val found = mutableListOf<ColourSite>()
        for ((index, instruction) in (method.implementation?.instructions ?: emptyList()).withIndex()) {
            when (instruction.opcode) {
                Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> Unit
                else -> continue
            }
            val source = instruction.referenceText() ?: continue
            val target = calls[source] ?: continue
            found += ColourSite(method.definingClass, method.descriptor(), index, instruction.opcode,
                instruction.registers(), source, target)
        }
        return found
    }

    private fun photoGates(method: Method): List<PhotoGate> {
        val gates = photoDownloadGates(method)
        if (gates.isEmpty()) return emptyList()
        val code = method.implementation!!.instructions.toList()
        return gates.map { PhotoGate(method.definingClass, method.descriptor(), it, (code[it] as OneRegisterInstruction).registerA) }
    }

    private fun photoAction(method: Method): PhotoAction? {
        if (!isSavePhotoAction(method)) return null
        val back = method.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_OBJECT }
        return PhotoAction(method.definingClass, method.descriptor(), back.index, (back.value as OneRegisterInstruction).registerA)
    }

    private fun fullCensus(classes: List<DexBackedClassDef>): Census = Census().also { found ->
        for (classDef in classes) {
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) continue
            for (method in classDef.methods) {
                found.colours += colourSites(method, YOU_COLOUR_CALLS)
                found.gates += photoGates(method)
                photoAction(method)?.let { found.actions += it }
                if (isLoggingBloksColourPair(method)) found.logging += method.descriptor()
            }
        }
    }

    private fun BytecodePatchContext.visitCandidates(
        types: Collection<String> = emptyList(),
        names: Collection<String> = emptyList(),
        strings: Collection<String> = emptyList(),
        visit: (ClassDef) -> Unit,
    ): Int {
        var classes = 0
        classDefForEachReferencing(types, names, strings) {
            classes++
            if (!it.type.startsWith(EXTENSION_PACKAGE)) visit(it)
        }
        return classes
    }

    private fun BytecodePatchContext.colourCandidates(calls: Map<String, String>): Pair<Int, List<ColourSite>> {
        val sites = mutableListOf<ColourSite>()
        val classes = visitCandidates(types = calls.keys.map { it.substringBefore("->") }.toSet()) { owner ->
            owner.methods.forEach { sites += colourSites(it, calls) }
        }
        return classes to sites
    }

    private fun assertColourOutput(context: BytecodePatchContext, sites: List<ColourSite>) {
        for ((methodSites, expected) in sites.groupBy { it.owner to it.method }) {
            val method = context.classDefBy(methodSites.first).methods.single { it.descriptor() == methodSites.second }
            val code = method.implementation!!.instructions.toList()
            for (site in expected) {
                val actual = code[site.index]
                val where = "${site.method} at ${site.index}"
                assertEquals("$where target", site.target, actual.referenceText())
                assertEquals("$where opcode", rewrittenOpcode(site.opcode), actual.opcode)
                assertEquals("$where registers", site.registers, actual.registers())
            }
        }
    }

    private fun rewrittenOpcode(opcode: Opcode) = when (opcode) {
        Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC_RANGE -> Opcode.INVOKE_STATIC_RANGE
        else -> Opcode.INVOKE_STATIC
    }

    private fun counts(calls: Map<String, String>, sites: List<ColourSite>) =
        calls.keys.associateWith { source -> sites.count { it.source == source } }

    private fun assertPhotoOutput(context: BytecodePatchContext, baseline: Census) {
        for ((methodSites, expected) in baseline.gates.groupBy { it.owner to it.method }) {
            val method = context.classDefBy(methodSites.first).methods.single { it.descriptor() == methodSites.second }
            val code = method.implementation!!.instructions.toList()
            val calls = code.withIndex().filter { it.value.referenceText() == OFFERS_PHOTO_SAVE }
            assertEquals("${methodSites.second} gate count", expected.size, calls.size)
            expected.sortedBy { it.index }.zip(calls).forEachIndexed { earlier, (gate, actual) ->
                assertEquals("${gate.method} gate position", gate.index + earlier * 2, actual.index)
                assertEquals("${gate.method} gate register", listOf(gate.flag), actual.value.registers())
                assertEquals(Opcode.MOVE_RESULT, code[actual.index + 1].opcode)
                assertEquals(gate.flag, (code[actual.index + 1] as OneRegisterInstruction).registerA)
                assertEquals(Opcode.IF_EQZ, code[actual.index + 2].opcode)
                assertEquals(gate.flag, (code[actual.index + 2] as OneRegisterInstruction).registerA)
            }
        }
        for (action in baseline.actions) {
            val method = context.classDefBy(action.owner).methods.single { it.descriptor() == action.method }
            val code = method.implementation!!.instructions.toList()
            val wrap = code.withIndex().single { it.value.referenceText() == WRAP_SAVE_ACTION }
            assertEquals("${action.method} wrap position", action.index, wrap.index)
            assertEquals("${action.method} listener register", action.listener, wrap.value.registers().first())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[wrap.index + 1].opcode)
            assertEquals(action.listener, (code[wrap.index + 1] as OneRegisterInstruction).registerA)
            assertEquals(Opcode.RETURN_OBJECT, code[wrap.index + 2].opcode)
            assertEquals(action.listener, (code[wrap.index + 2] as OneRegisterInstruction).registerA)
        }
    }

    @Test
    fun `indexed scans retain every full APK colour photo and Bloks site on the declared build`() {
        val version = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet().single()
        val bundle = Fixtures.files { it.name == "facebook-$version-arm64-v8a.apkm" }.single()
        val classes = mutableListOf<DexBackedClassDef>()
        var dexFiles = 0
        FixtureDex.forEach(bundle) { dex ->
            dexFiles++
            classes.addAll(dex.classes)
        }
        assertTrue("${bundle.name}: all DEX files", dexFiles > 1)
        assertEquals("${bundle.name}: duplicate class definitions", classes.size, classes.map { it.type }.toSet().size)
        val context = PatchContexts.of(classes)
        val started = System.nanoTime()
        val index = checkNotNull(ReferenceIndex.of(context))
        val indexMillis = (System.nanoTime() - started) / 1_000_000
        val baseline = fullCensus(classes)
        assertTrue("${bundle.name}: colour calls", baseline.colours.isNotEmpty())
        assertEquals("${bundle.name}: photo gates", 2, baseline.gates.size)
        assertEquals("${bundle.name}: Save photo action", 1, baseline.actions.size)
        assertEquals("${bundle.name}: Bloks logging anchor", 1, baseline.logging.size)

        val expectedAmoled = baseline.colours.mapNotNull { site -> AMOLED_COLOUR_CALLS[site.source]?.let { site.copy(target = it) } }
        val (amoledClasses, amoledSites) = context.colourCandidates(AMOLED_COLOUR_CALLS)
        assertEquals("${bundle.name}: AMOLED candidate sites", expectedAmoled.toSet(), amoledSites.toSet())
        val (youClasses, youSites) = context.colourCandidates(YOU_COLOUR_CALLS)
        assertEquals("${bundle.name}: Material You candidate sites", baseline.colours.toSet(), youSites.toSet())

        val gates = mutableListOf<PhotoGate>()
        val gateClasses = context.visitCandidates(strings = listOf(VIDEO_TYPE)) { owner ->
            owner.methods.forEach { gates += photoGates(it) }
        }
        assertEquals("${bundle.name}: photo gate candidates", baseline.gates.toSet(), gates.toSet())
        val actions = mutableListOf<PhotoAction>()
        val actionClasses = context.visitCandidates(types = listOf(MENU_LISTENER)) { owner ->
            owner.methods.mapNotNullTo(actions, ::photoAction)
        }
        assertEquals("${bundle.name}: photo action candidates", baseline.actions.toSet(), actions.toSet())
        val oldPhotoClasses = context.visitCandidates(types = listOf(MENU_LISTENER), names = listOf("getBooleanValue")) { }
        val logging = mutableListOf<String>()
        val loggingClasses = context.visitCandidates(strings = listOf(BLOKS_PAIR_LIGHT_KEY)) { owner ->
            owner.methods.filter(::isLoggingBloksColourPair).mapTo(logging) { it.descriptor() }
        }
        assertEquals("${bundle.name}: Bloks logging candidates", baseline.logging.toSet(), logging.toSet())
        assertTrue("${bundle.name}: photo gate visits shrink", gateClasses < oldPhotoClasses)
        assertTrue("${bundle.name}: AMOLED visits shrink", amoledClasses < classes.size)
        assertTrue("${bundle.name}: Material You visits shrink", youClasses < classes.size)
        assertTrue("${bundle.name}: Bloks anchor visits shrink", loggingClasses < classes.size)

        assertEquals("${bundle.name}: AMOLED production counts", counts(AMOLED_COLOUR_CALLS, expectedAmoled),
            context.rerouteColourCalls(AMOLED_COLOUR_CALLS))
        assertColourOutput(context, expectedAmoled)
        val expectedYou = baseline.colours.map { site ->
            val source = AMOLED_COLOUR_CALLS[site.source] ?: site.source
            site.copy(source = source, target = YOU_COLOUR_CALLS.getValue(source),
                opcode = if (site.source in AMOLED_COLOUR_CALLS) rewrittenOpcode(site.opcode) else site.opcode)
        }
        val (afterAmoledClasses, afterAmoledSites) = context.colourCandidates(YOU_COLOUR_CALLS)
        assertEquals("${bundle.name}: Material You candidates after AMOLED", expectedYou.toSet(), afterAmoledSites.toSet())
        assertEquals("${bundle.name}: Material You production counts", counts(YOU_COLOUR_CALLS, expectedYou),
            context.rerouteColourCalls(YOU_COLOUR_CALLS))
        assertColourOutput(context, expectedYou)
        context.unlockPhotoSave()
        assertPhotoOutput(context, baseline)
        // Keep the original index strongly reachable through all measurements and late mutations.
        assertSame("${bundle.name}: one retained index", index, ReferenceIndex.of(context))
        println("${bundle.name}: $dexFiles DEX, ${classes.size} full-scan classes; initial index ${index.size} classes in ${indexMillis}ms")
        println("${bundle.name}: colour candidates AMOLED=$amoledClasses MaterialYou=$youClasses afterAMOLED=$afterAmoledClasses; " +
            "photo old=$oldPhotoClasses gates=$gateClasses actions=$actionClasses; Bloks logging=$loggingClasses")
        println("${bundle.name}: equivalent sites AMOLED=${expectedAmoled.size} MaterialYou=${expectedYou.size} " +
            "photoGates=${gates.size} photoActions=${actions.size} BloksLogging=${logging.size}")
    }
}
