/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.externalbrowser

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

// 451 has two more methods with the first and one more with the second. Only the factory has both and makes an Intent.
private const val FACTORY_NOTE = "BrowserLiteIntent.OPEN_WITH_URL"
private const val FACTORY_MODULE_NOTE = "TrackingInfo.ARG_MODULE_NAME"
private const val AD_NOTE = "AdClickHandler.openWebLink missing webUri for AD_DESTINATION_WEB"
private const val IMMERSIVE_NOTE = "com.instagram.barcelona.inappbrowser.compose.ImmersiveBrowserScreen (ImmersiveBrowserScreen.kt:97)"
/** What the stock builds this test reads name the parts it needs, per version code. */
private data class BuildNames(
    val web: String,
    val parser: String,
)

private val builds = mapOf(
    "512308671" to BuildNames(
        web = "LX/1t8;->A0G:LX/1t8;",
        parser = "LX/14R;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308673" to BuildNames(
        web = "LX/1t8;->A0G:LX/1t8;",
        parser = "LX/14R;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308675" to BuildNames(
        web = "LX/1t8;->A0G:LX/1t8;",
        parser = "LX/14R;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308676" to BuildNames(
        web = "LX/01rU;->A0G:LX/01rU;",
        parser = "LX/0135;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308685" to BuildNames(
        web = "LX/01q4;->A0G:LX/01q4;",
        parser = "LX/013w;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308686" to BuildNames(
        web = "LX/1t0;->A0G:LX/1t0;",
        parser = "LX/148;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308688" to BuildNames(
        web = "LX/1t0;->A0G:LX/1t0;",
        parser = "LX/148;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308695" to BuildNames(
        web = "LX/01s7;->A0G:LX/01s7;",
        parser = "LX/012X;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308696" to BuildNames(
        web = "LX/1t8;->A0G:LX/1t8;",
        parser = "LX/14R;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308697" to BuildNames(
        web = "LX/01rU;->A0G:LX/01rU;",
        parser = "LX/0135;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
    "512308698" to BuildNames(
        web = "LX/1t8;->A0G:LX/1t8;",
        parser = "LX/14R;->A04(Ljava/lang/String;)Landroid/net/Uri;",
    ),
)

private fun buildNames(build: File): BuildNames =
    builds.entries.single { build.name.contains("-${it.key}.") }.value

/**
 * The browser Intent factory, every method that calls it, and the ad click handler, read from the
 * build by their strings and calls alone. Nothing of the patch's own finder or flow helpers is used.
 */
internal class BrowserFixture(
    val classes: List<ClassDef>,
    val factory: Method,
    val callers: List<Method>,
    val request: Method,
    val launcher: Method,
    val launcherHelper: Method,
) {
    val immersive get() = callers.single { it.note(IMMERSIVE_NOTE) }
    val lead get() = direct.single { it.name == "invoke" && it.returnType == "Ljava/lang/Object;" }
    val ad get() = direct.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Landroid/content/Intent;" }
    val media get() = direct.single { it.name == "invokeSuspend" }
    private val direct get() = callers.filterNot { it === launcherHelper || it.note(IMMERSIVE_NOTE) }
}

internal fun browserFixture(build: File): BrowserFixture {
    fun Method.isFactory() = returnType == "Landroid/content/Intent;" && note(FACTORY_NOTE) && note(FACTORY_MODULE_NOTE)
    val factoryClasses = FixtureDex.classesWhere(build, { FACTORY_NOTE in it.stringSection }) { it.isFactory() }
    val factory = factoryClasses.flatMap { it.methods }.single { it.isFactory() }
    val reference = factory.toString()
    val callerClasses = FixtureDex.classesWhere(build, { dex -> dex.methodSection.any { it.toString() == reference } }) { m ->
        m.code().any { it.ref() == reference }
    }
    val requests = FixtureDex.classesWhere(build, { AD_NOTE in it.stringSection }) { it.note(AD_NOTE) }
    val request = requests.flatMap { it.methods }.single { it.note(AD_NOTE) }
    // The enum constants the callers compare with, the AD_DESTINATION_WEB one among them.
    val enums = callerClasses.flatMap { it.methods }.flatMap { it.code() }.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { f -> f.type == f.definingClass }?.type
    }.toSet()
    val classes = (factoryClasses + callerClasses + requests + FixtureDex.classes(build, enums).values).distinctBy { it.type }
    val callers = callerClasses.flatMap { it.methods }.filter { m -> m.code().any { it.ref() == reference } }
    val launcher = callerClasses.flatMap { it.methods }.single { it.note(LAUNCHER_MESSAGE) }
    val launcherHelper = callers.single { it.definingClass == launcher.definingClass }
    return BrowserFixture(classes, factory, callers, request, launcher, launcherHelper)
}

/**
 * Open links in browser on the three places that make Threads' browser Intent without the
 * launcher: the lead form and privacy policy helper, the ad browser and the media viewer's swipe
 * up. Each asks the extension once and, when the link went out, skips only its own browser work.
 */
class DirectBrowserCallersFixtureTest {
    @Test
    fun `each declared build makes the browser Intent in five places and the lead form helper has its callers`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = browserFixture(build)
            val reference = fixture.factory.toString()
            assertEquals(build.name, 5, fixture.callers.size)
            assertEquals(5, fixture.callers.sumOf { m -> m.code().count { it.ref() == reference } })
            assertEquals(6, setOf(fixture.launcher, fixture.launcherHelper, fixture.immersive, fixture.lead, fixture.ad, fixture.media).size)

            // The lead form helper serves the lead form's privacy policy and disclaimer links from one
            // lambda. The arm64 build also calls it once from a lambda merged with unrelated ones.
            val lead = fixture.lead.toString()
            assertTrue("${build.name}: lead form helper calls", FixtureDex.methodsWhere(build, { dex ->
                dex.methodSection.any { it.toString() == lead }
            }) { m -> m.code().any { it.ref() == lead } }.isNotEmpty())
        }
    }

    @Test
    fun `each declared build hooks the launcher and the three direct sites once`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = browserFixture(build)
            val reference = fixture.factory.toString()
            val context = PatchContexts.of(ExtensionDex.classes() + fixture.classes)
            BrowserLauncherFingerprint.clearMatch()
            openLinksExternallyPatch.execute(context)

            fun after(stock: Method) = context.mutable(stock).code()

            // 453's launcher keeps its context and link in fields and reads them through `this`.
            val launcherStock = fixture.launcher.code()
            val launcher = after(fixture.launcher)
            assertEquals("${build.name}: launcher added", launcherStock.size + 7, launcher.size)
            assertEquals(
                "${build.name}: launcher hook",
                listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                launcher.take(7).map { it.opcode },
            )
            assertEquals(OPEN_LINK, launcher[3].ref())
            assertEquals("${build.name}: launcher stays", 7, launcher.destination(5))
            val self = launcher[0] as TwoRegisterInstruction
            val contextRead = launcher[1] as TwoRegisterInstruction
            val linkRead = launcher[2] as TwoRegisterInstruction
            assertEquals(fixture.launcher.implementation!!.registerCount - 1, self.registerB)
            assertEquals(self.registerA, contextRead.registerB)
            assertEquals(self.registerA, linkRead.registerB)
            assertEquals("Landroid/content/Context;", (contextRead as ReferenceInstruction).reference.let { (it as FieldReference).type.toString() })
            assertEquals("Ljava/lang/String;", (linkRead as ReferenceInstruction).reference.let { (it as FieldReference).type.toString() })
            assertEquals("${build.name}: launcher stock", launcherStock.map { it.key() }, launcher.drop(7).map { it.key() })

            // The lead form helper and the media viewer keep their browser call; the hook goes in front of it.
            for ((label, stock) in listOf("lead" to fixture.lead, "media" to fixture.media)) {
                val code = after(stock)
                val factoryAt = code.indexOfFirst { it.ref() == reference }
                val at = factoryAt - 6
                assertTrue("$label: hook", at >= 0)
                assertEquals("$label: added", stock.code().size + 6, code.size)
                assertEquals(
                    "$label: hook shape",
                    listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
                        Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.GOTO_16),
                    code.subList(at, at + 6).map { it.opcode },
                )
                assertEquals(OPEN_LINK, code[at + 2].ref())
                assertEquals("$label: stays", at + 6, code.destination(at + 4))
                val args = stock.code()[at].args()
                val copied = code.subList(at, at + 2).map { it as TwoRegisterInstruction }
                assertEquals("$label: link", args[5], copied[0].registerB)
                assertEquals("$label: context", args[0], copied[1].registerB)
                assertEquals("$label: stock", stock.code().map { it.key() },
                    (code.take(at) + code.drop(at + 6)).map { it.key() })
            }

            // The ad browser builds its Intent in IJr.A00 but opens it from IJr.A02, which keeps the
            // link in a field. The hook goes at the opener's start and answers true when it sent it.
            val opener = fixture.classes.flatMap { it.methods }.single {
                it.definingClass == fixture.ad.definingClass && it !== fixture.ad && it.returnType == "Z"
            }
            val openerStock = opener.code()
            val openerCode = after(opener)
            assertEquals("${build.name}: ad opener added", openerStock.size + 8, openerCode.size)
            assertEquals(
                "${build.name}: ad opener hook",
                listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                openerCode.take(8).map { it.opcode },
            )
            assertEquals(OPEN_LINK, openerCode[3].ref())
            assertEquals("${build.name}: ad opener stays", 8, openerCode.destination(5))
            assertEquals("${build.name}: ad link", fixture.ad.definingClass + "->A05:Ljava/lang/String;", openerCode[1].ref())
            assertEquals(1, (openerCode[6] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("${build.name}: ad opener stock", openerStock.map { it.key() }, openerCode.drop(8).map { it.key() })

            // The helper, the immersive screen, the factory and the ad click handler are untouched.
            for (unchanged in listOf(fixture.launcherHelper, fixture.immersive, fixture.factory, fixture.request)) {
                val actual = context.mutable(unchanged)
                assertEquals(unchanged.toString(), unchanged.code().map { it.key() to (it as? OffsetInstruction)?.codeOffset },
                    actual.code().map { it.key() to (it as? OffsetInstruction)?.codeOffset })
            }
            val hosts = fixture.classes.flatMap { context.mutableClassDefBy(it.type).methods.toList() }
            assertEquals("${build.name}: the launcher and the three", 4, hosts.sumOf { m -> m.code().count { it.ref() == OPEN_LINK } })
        }
    }


    /** A changed build the patch can't prove is refused before anything changes, saying what it found. */
    @Test
    fun `wrong sources guards completions and callers are refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val names = buildNames(build)
            val fixture = browserFixture(build)
            val reference = fixture.factory.toString()
            val cases = linkedMapOf(
                "factory URL" to "parses something other than its link",
                "ad URL" to "the ad browser's browser gets a link other than one of its own String fields",
                "lead URL" to "the lead form helper's browser gets a link other than one of its own String fields",
                "duplicate" to "makes Threads' browser Intent 2 time(s), not 1",
                "media false" to "the media viewer's ending for an ad with no web link no longer sets its state to false",
                "media context" to "the media viewer's browser gets a context other than the one it captured",
                "media half" to "a browser value with half a long written over it",
                "unknown caller" to "Threads' browser Intent has 6 callers, not five",
            )
            for ((fault, expected) in cases) {
                val context = PatchContexts.of(ExtensionDex.classes() + fixture.classes)
                BrowserLauncherFingerprint.clearMatch()
                val target = when (fault) {
                    "factory URL" -> fixture.factory
                    "lead URL" -> fixture.lead
                    "unknown caller" -> fixture.request
                    "media false", "media context", "media half" -> fixture.media
                    else -> fixture.ad
                }
                val method = context.mutable(target)
                val body = target.code()
                val registers = target.implementation!!.registerCount
                val call = body.indexOfFirst { it.ref() == reference }
                when (fault) {
                    "factory URL" -> {
                        val parser = body.indexOfFirst { it.ref() == names.parser }
                        val widths = fixture.factory.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
                        val sixth = registers - widths.sum() + widths.take(6).sum()
                        method.replaceInstruction(parser, "invoke-static/range { v$sixth .. v$sixth }, ${body[parser].ref()}")
                    }
                    "ad URL" -> {
                        val (load, _) = body.source(call, body[call].args()[5])
                        val read = body[load] as TwoRegisterInstruction
                        method.replaceInstruction(load, "const-string v${read.registerA}, \"https://example.org/\"")
                    }
                    "lead URL" -> body.indices.filter { n ->
                        val field = (body[n] as? ReferenceInstruction)?.reference as? FieldReference
                        n < call && body[n].opcode == Opcode.IGET_OBJECT &&
                            field?.type == "Ljava/lang/String;" && field.definingClass == target.definingClass
                    }.forEach { n ->
                        method.replaceInstruction(n, "const-string v${(body[n] as OneRegisterInstruction).registerA}, \"https://example.org/\"")
                    }
                    "duplicate" -> {
                        val args = body[call].args()
                        method.addInstructions(call, "invoke-static/range { v${args.first()} .. v${args.last()} }, $reference")
                    }
                    "media false" -> {
                        val guard = body.indices.single {
                            it > 0 && body[it].opcode == Opcode.IF_NE && body[it - 1].ref() == names.web
                        }
                        val failed = body.destination(guard)
                        method.replaceInstruction(failed, "const/4 v${(body[failed] as OneRegisterInstruction).registerA}, 0x1")
                    }
                    "media context" -> {
                        val contextRegister = body[call].args()[0]
                        val copy = (call - 1 downTo 0).first { (body[it] as? TwoRegisterInstruction)?.registerA == contextRegister }
                        method.replaceInstruction(copy, "move-object/from16 v$contextRegister, v${registers - 2}")
                    }
                    "media half" -> method.addInstructions(call, "const-wide/16 v${body[call].args()[0] - 1}, 0x0")
                    "unknown caller" -> method.addInstructions(0, "invoke-static/range { v0 .. v9 }, $reference")
                }
                val error = assertThrows("${build.name}: $fault", PatchException::class.java) { openLinksExternallyPatch.execute(context) }
                    .message.orEmpty()
                assertTrue("$fault: $error", error.contains(expected))
                for (hooked in listOf(fixture.launcher, fixture.lead, fixture.ad, fixture.media)) {
                    assertTrue("$fault: nothing changed before the refusal", context.mutable(hooked).code().none { it.ref() == OPEN_LINK })
                }
            }
        }
    }
}

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

private fun Method.code() = implementation?.instructions?.toList().orEmpty()
private fun Method.note(text: String) = code().any { it.string() == text }
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString().orEmpty()

/**
 * What an instruction does, without where its branch lands, which moves when code goes in above.
 * A goto counts as one whatever its width, since code put in between may need a wider one.
 */
private fun Instruction.key(): List<Any?> = listOf(
    if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode, ref(), args(),
    (this as? OneRegisterInstruction)?.registerA, (this as? TwoRegisterInstruction)?.registerB,
    (this as? ThreeRegisterInstruction)?.registerC, (this as? NarrowLiteralInstruction)?.narrowLiteral,
)

private fun Instruction.args(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> emptyList()
}

private fun List<Instruction>.addresses(): IntArray {
    val at = IntArray(size + 1)
    for (n in indices) at[n + 1] = at[n] + this[n].codeUnits
    return at
}

/** The index the branch at [n] lands on. */
private fun List<Instruction>.destination(n: Int): Int {
    val at = addresses()
    return at.indexOfFirst { it == at[n] + (this[n] as OffsetInstruction).codeOffset }
}

/** Straight back from [at] through object moves: where [register]'s value was made, or -1 and the register it arrived in. */
private fun List<Instruction>.source(at: Int, register: Int): Pair<Int, Int> {
    var wanted = register
    for (n in at - 1 downTo 0) {
        val instruction = this[n]
        if (!instruction.opcode.setsRegister() || (instruction as OneRegisterInstruction).registerA != wanted) continue
        if (instruction.opcode == Opcode.CHECK_CAST) continue
        if (instruction.opcode in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
            wanted = (instruction as TwoRegisterInstruction).registerB
        } else {
            return n to wanted
        }
    }
    return -1 to wanted
}

/** Where each instruction goes next without throwing: on, a branch or a switch arm. */
private fun Method.flow(): List<List<Int>> {
    val code = code()
    val at = code.addresses()
    val index = at.withIndex().associate { (n, address) -> address to n }
    val payloads = setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    return code.indices.map { n ->
        val instruction = code[n]
        val out = mutableListOf<Int>()
        if (instruction.opcode !in payloads) {
            if (instruction.opcode.canContinue()) out += n + 1
            if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
                val target = index.getValue(at[n] + instruction.codeOffset)
                if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                    (code[target] as SwitchPayload).switchElements.forEach { out += index.getValue(at[n] + it.offset) }
                } else {
                    out += target
                }
            }
        }
        out.filter { it < code.size }.distinct()
    }
}

/** The handlers of each try block an instruction sits in. */
private fun Method.handlers(): List<List<Int>> {
    val code = code()
    val at = code.addresses()
    val index = at.withIndex().associate { (n, address) -> address to n }
    return code.indices.map { n ->
        implementation!!.tryBlocks.filter { at[n] >= it.startCodeAddress && at[n] < it.startCodeAddress + it.codeUnitCount }
            .flatMap { block -> block.exceptionHandlers.map { index.getValue(it.handlerCodeAddress) } }.distinct()
    }
}

private fun Method.reachable(start: Int): Set<Int> {
    val flow = flow()
    val handlers = handlers()
    val seen = mutableSetOf(start)
    val pending = ArrayDeque(listOf(start))
    while (pending.isNotEmpty()) {
        val n = pending.removeFirst()
        (flow[n] + handlers[n]).forEach { if (seen.add(it)) pending += it }
    }
    return seen
}

/**
 * Whether a path from [start], that instruction included, can read [register] before writing it.
 * Every named register counts as read unless it's a plain destination, the upper half of a wide
 * one included, and a try handler is reached with the register as it was before the instruction.
 */
private fun Method.readsBeforeWrite(start: Int, register: Int): Boolean {
    val code = code()
    val flow = flow()
    val handlers = handlers()
    val seen = mutableSetOf(start)
    val pending = ArrayDeque(listOf(start))
    while (pending.isNotEmpty()) {
        val n = pending.removeFirst()
        val instruction = code[n]
        // Opcode's own name field, the smali spelling: add-int/2addr, const-wide/16.
        val name = instruction.opcode.name
        val wide = listOf("wide", "long", "double").any { it in name }
        val named = when (instruction) {
            is RegisterRangeInstruction, is FiveRegisterInstruction -> instruction.args()
            is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
            is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
            is OneRegisterInstruction -> listOf(instruction.registerA)
            else -> emptyList()
        }
        val plainWrite = instruction.opcode.setsRegister() && !name.endsWith("/2addr") && instruction.opcode != Opcode.CHECK_CAST
        val reads = if (plainWrite) named.drop(1) else named
        if (reads.any { it == register || wide && it + 1 == register }) return true
        handlers[n].forEach { if (seen.add(it)) pending += it }
        val writes = instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA.let {
            it == register || instruction.opcode.setsWideRegister() && it + 1 == register
        }
        if (!writes) flow[n].forEach { if (seen.add(it)) pending += it }
    }
    return false
}
