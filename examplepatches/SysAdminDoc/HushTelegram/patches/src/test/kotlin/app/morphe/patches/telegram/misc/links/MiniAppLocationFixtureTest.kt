/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** Both pinned builds' bot location manager, web view prompt and its dialog, gated where the switch can answer. */
class MiniAppLocationFixtureTest {
    @Test fun `both builds keep location from Mini Apps and web pages and keep every stock instruction`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveMiniAppLocation()
            assertNull("$name: ${plan.missing}", plan.missing)
            assertEquals(LocationGate.values().toSet(), plan.gates.keys)
            val original = plan.gates.mapValues { ImmutableMethod.of(it.value) }
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { openExternalLinksPatch.execute(context) })

            for ((gate, method) in plan.gates) {
                val where = "$name ${gate.name} ${method.definingClass}->${method.name}"
                val before = original.getValue(gate).instructions()
                val after = method.instructions()
                val size = GATE_SIZES.getValue(gate)
                assertEquals("$where: every stock instruction follows the gate", before.map(::operands), after.drop(size).map(::operands))
                assertEquals("$where: registers are kept", original.getValue(gate).implementation!!.registerCount,
                    method.implementation!!.registerCount)
                val call = after[0]
                assertTrue("$where: the gate asks the switch first", call.ref()?.startsWith("$MINI_APP_LOCATION->") == true)
                val registers = method.implementation!!.registerCount
                assertEquals("$where: the switch gets the method's own arguments", when (gate) {
                    LocationGate.GPS -> emptyList()
                    LocationGate.ANSWER -> listOf(registers - 1)
                    LocationGate.PROMPT -> listOf(registers - 2, registers - 1)
                    LocationGate.DIALOG -> listOf(registers - 1)
                }, call.namedRegisters())

                // Stock branches and handlers land where they did, one gate further on.
                val oldFlow = ControlFlow.of(original.getValue(gate))
                val newFlow = ControlFlow.of(method)
                for (index in before.indices) {
                    assertEquals("$where: stock branch $index", oldFlow.normal[index].toSet(), newFlow.normal[index + size].map { it - size }.toSet())
                    assertEquals("$where: stock handler $index", oldFlow.exceptional[index].toSet(), newFlow.exceptional[index + size].map { it - size }.toSet())
                }
                if (gate.labeled) {
                    assertEquals(Opcode.IF_EQZ, after[2].opcode)
                    assertEquals("$where: a no runs the stock method", setOf(3, size), newFlow.normal[2].toSet())
                    assertTrue("$where: a yes ends the method", after[size - 1].opcode in setOf(Opcode.RETURN, Opcode.RETURN_VOID))
                } else {
                    assertEquals("$where: the answer goes back where the method reads it", call.namedRegisters(), after[1].namedRegisters())
                }
            }
            for (flag in listOf("openExternalLinks", "externalBrowserRouting", "miniAppLocation")) assertFlag(context, flag, true)
        }
    }

    @Test fun `a build whose location paths changed keeps link routing and leaves the switch out`() {
        class Case(val name: String, val reason: String, val hosts: (MutableList<ClassDef>) -> Unit = {},
                   val context: (BytecodePatchContext) -> Unit = {})
        val cases = listOf(
            Case("no manager", "the bot location manager is missing or ambiguous", hosts = { hosts ->
                hosts.removeAll { cls -> cls.methods.any { "botlocation_" in it.strings() } }
            }),
            Case("no dialog", "the geolocation dialog's answer is missing or ambiguous", hosts = { hosts ->
                hosts.removeAll { cls -> cls.methods.any { it.origName == "accept" && it.calls(GEO_INVOKE) } }
            }),
            Case("no listener", "the bot location manager's listener for later fixes is missing", hosts = { hosts ->
                hosts.removeAll { LISTENER in it.origInterfaces }
            }),
            // The answer folded into the listener, as R8 could do: a later fix would go round the gate.
            Case("listener reads coordinates", "reads coordinates outside the bot location manager's answer", context = { context ->
                context.changed().addInstructions(0, "invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D")
            }),
            Case("listener reads longitude", "reads coordinates outside the bot location manager's answer", context = { context ->
                context.changed().addInstructions(0, "invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D")
            }),
            Case("listener builds coordinates", "reads coordinates outside the bot location manager's answer", context = { context ->
                context.changed().addInstructions(0, "const-string v0, \"latitude\"")
            }),
            // A parent class runs on the same fix through a super call, so its reads count as the listener's.
            Case("listener's parent reads coordinates", "reads coordinates outside the bot location manager's answer", hosts = { hosts ->
                val listener = hosts.single { LISTENER in it.origInterfaces }
                hosts[hosts.indexOf(listener)] = listener.reparented(superclass = PARENT)
                hosts += syntheticClass(PARENT, AccessFlags.PUBLIC.value, null,
                    syntheticMethod(PARENT, "peek", "invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D\nreturn-void"))
            }),
            // A later fix handed to something other than the answer goes round the gate.
            Case("listener skips the answer", "hands a later fix on without the bot location manager's answer", context = { context ->
                val changed = context.changed()
                val call = changed.instructions().indexOfFirst { it.ref()?.endsWith("(Landroid/location/Location;)Lorg/json/JSONObject;") == true }
                val registers = changed.instructions()[call].namedRegisters().joinToString { "v$it" }
                changed.replaceInstruction(call, "invoke-static {$registers}, Lhush/Elsewhere;->h(Landroid/location/Location;)Lorg/json/JSONObject;")
            }),
            // move-result-object can't reach the answer's parameter past register 255.
            Case("answer past register 255", "keeps its parameter past register 255", context = { context ->
                val answer = context.resolveMiniAppLocation().gates.getValue(LocationGate.ANSWER)
                val owner = context.tgMutableClassDefBy(answer.definingClass)
                owner.methods.remove(answer)
                owner.methods.add(padded(answer, 256))
            }),
            // A branch back to the GPS check's first instruction would skip the gate, since the label
            // stays on Telegram's first instruction.
            Case("jump to the start", "something jumps back to the start of", context = { context ->
                val gps = context.resolveMiniAppLocation().gates.getValue(LocationGate.GPS)
                gps.addInstructionsWithLabels(gps.instructions().size, "goto :hush_back", ExternalLabel("hush_back", gps.getInstruction(0)))
            }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val reason = case.reason
            val hosts = hostClasses(build).toMutableList()
            val locationTypes = hosts.filter { cls -> cls.methods.any(::isLocationHost) }.map { it.type }.toSet()
            case.hosts(hosts)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            case.context(context)
            val present = locationTypes.filter { type -> hosts.any { it.origType == type } }
            val before = present.associateWith { context.tgMutableClassDefBy(it).state() }
            val warnings = PatchLogCapture.warnings { openExternalLinksPatch.execute(context) }
            assertEquals(where, 1, warnings.size)
            assertTrue("$where: ${warnings.single()}", warnings.single().contains(reason))
            assertEquals("$where: no location host is touched", before, present.associateWith { context.tgMutableClassDefBy(it).state() })
            assertFlag(context, "miniAppLocation", false)
            assertFlag(context, "openExternalLinks", true)
            assertFlag(context, "externalBrowserRouting", true)
        }
    }

    /** smali drops an instruction it can't build and only logs it; the rehearsal counts what went in. */
    @Test fun `a gate that can't reach its register is caught by the rehearsal`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val answer = padded(context.resolveMiniAppLocation().gates.getValue(LocationGate.ANSWER), 256)
            val stock = answer.state()
            val failed = assertThrows(build.name, Exception::class.java) {
                MiniAppLocationPlan(mapOf(LocationGate.ANSWER to answer), null).rehearse()
            }
            // The count catches it, not a register guard or anything else on the way.
            assertTrue("${build.name}: ${failed.message}", failed.message.orEmpty().contains("didn't compile whole"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, answer.state())
        }
    }

    /** Past the last register a range call can name, smali refuses the snippet outright: a reason, not a crash of the patch. */
    @Test fun `a gate smali refuses outright is caught by the rehearsal`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val answer = padded(context.resolveMiniAppLocation().gates.getValue(LocationGate.ANSWER), 70_000)
            val stock = answer.state()
            val failed = assertThrows(build.name, Exception::class.java) {
                MiniAppLocationPlan(mapOf(LocationGate.ANSWER to answer), null).rehearse()
            }
            assertTrue("${build.name}: ${failed.message}", failed.message.orEmpty().startsWith("the location gates don't compile"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, answer.state())
        }
    }

    /** A listener that's a LocationListener through an interface of its own is still found and held to the answer. */
    @Test fun `a listener behind a parent interface is still found`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hostClasses(build).toMutableList()
            val listener = hosts.single { LISTENER in it.origInterfaces }
            hosts[hosts.indexOf(listener)] = listener.reparented(interfaces = listOf(MIDDLE))
            hosts += syntheticClass(MIDDLE, AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
                listOf(LISTENER))
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            assertNull(build.name, context.resolveMiniAppLocation().missing)
            // And with it skipping the answer, the indirection doesn't hide that.
            val changed = context.tgMutableClassDefBy(listener.type).methods.single { it.origName == "onLocationChanged" }
            val call = changed.instructions().indexOfFirst { it.ref()?.endsWith("(Landroid/location/Location;)Lorg/json/JSONObject;") == true }
            val registers = changed.instructions()[call].namedRegisters().joinToString { "v$it" }
            changed.replaceInstruction(call, "invoke-static {$registers}, Lhush/Elsewhere;->h(Landroid/location/Location;)Lorg/json/JSONObject;")
            assertTrue(build.name, context.resolveMiniAppLocation().missing.orEmpty()
                .contains("hands a later fix on without the bot location manager's answer"))
        }
    }

    @Test fun `a missing location runtime or status method refuses before anything is edited`() {
        for (build in Fixtures.declaredBuilds()) for (missing in listOf("refuse", "location", "refusePrompt", "answer", "miniAppLocation")) {
            val where = "${build.name} without $missing"
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveMiniAppLocation()
            val before = plan.gates.mapValues { it.value.state() }
            val owner = if (missing == "miniAppLocation") SETTINGS_STATUS else MINI_APP_LOCATION
            context.tgMutableClassDefBy(owner).methods.removeAll { it.origName == missing }
            assertThrows(where, PatchException::class.java) { openExternalLinksPatch.execute(context) }
            assertEquals("$where: every gate is as it was", before, plan.gates.mapValues { it.value.state() })
            if (missing != "miniAppLocation") {
                for (flag in listOf("openExternalLinks", "externalBrowserRouting", "miniAppLocation")) assertFlag(context, flag, false)
            }
        }
    }

    /** The link patch's own hosts, so it runs whole, and the three classes the location switch gates. */
    private fun hostClasses(build: File): List<ClassDef> {
        val hosts = FixtureDex.classesWhere(build, HOST_CENSUS, { true }) { method ->
            (method.origReturnType == "V" && method.parameterTypes.size in 10..11 &&
                method.parameterTypes.take(2) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") &&
                method.instructions().any { it.ref() == "autologin_token" }) ||
                (method.instructions().any { it.ref() == "Lorg/telegram/messenger/R\$string;->ShareLink:I" } &&
                    method.instructions().any { it.ref() == "android.intent.action.SEND" }) ||
                isLocationHost(method) || isLaterFixListener(method)
        }
        val kept = FixtureDex.classes(build, setOf(MC, UC))
        assertEquals("account protection definitions", setOf(MC, UC), kept.keys)
        assertEquals("${build.name}: the manager, the prompt and its dialog", 3, hosts.count { cls -> cls.methods.any(::isLocationHost) })
        assertEquals("${build.name}: the listener for later fixes", 1, hosts.count { cls -> LISTENER in cls.origInterfaces })
        return hosts + kept.values
    }

    private fun isLocationHost(method: Method) = "botlocation_" in method.strings() || method.origName == SHOW_PROMPT ||
        (method.origName == "accept" && method.calls(GEO_INVOKE))

    /** The bot location manager's listener, which hands a later fix to the Mini App through the manager's answer. */
    private fun isLaterFixListener(method: Method) = method.origName == "onLocationChanged" &&
        method.instructions().any { it.ref()?.endsWith("(Landroid/location/Location;)Lorg/json/JSONObject;") == true }

    private fun operands(instruction: Instruction): List<Any?> = listOf(
        instruction.opcode, instruction.namedRegisters(), instruction.ref(), (instruction as? WideLiteralInstruction)?.wideLiteral,
    )

    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(Opcode.CONST_4, body[0].opcode)
        assertEquals(name, if (enabled) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    /** The listener's onLocationChanged, where a later fix comes in. */
    private fun BytecodePatchContext.changed(): MutableMethod {
        val listeners = mutableListOf<String>()
        classDefForEach { cls -> if (LISTENER in cls.origInterfaces && !cls.origType.startsWith("Lapp/hushtelegram/")) listeners += cls.type }
        return tgMutableClassDefBy(listeners.single()).methods.single { it.origName == "onLocationChanged" }
    }

    /** [method] with [extra] more registers, so its parameters sit that much higher. */
    private fun padded(method: Method, extra: Int): MutableMethod {
        val implementation = method.implementation!!
        return MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
            method.accessFlags, method.annotations, method.hiddenApiRestrictions,
            ImmutableMethodImplementation(implementation.registerCount + extra, implementation.instructions,
                implementation.tryBlocks, implementation.debugItems)))
    }

    /** This class with another parent class or other interfaces, everything else as it was. */
    private fun ClassDef.reparented(superclass: String? = this.superclass, interfaces: List<String> = this.interfaces): ClassDef =
        ImmutableClassDef(type, accessFlags, superclass, interfaces, sourceFile, annotations, fields, methods)

    private fun syntheticClass(type: String, flags: Int, interfaces: List<String>?, vararg methods: Method): ClassDef =
        ImmutableClassDef(type, flags, "Ljava/lang/Object;", interfaces.orEmpty(), null, emptySet(), emptyList(), methods.toList())

    /** A public method taking a Location, with [smali] for its body. */
    private fun syntheticMethod(type: String, name: String, smali: String): Method =
        MutableMethod(ImmutableMethod(type, name, listOf(ImmutableMethodParameter("Landroid/location/Location;", null, null)), "V",
            AccessFlags.PUBLIC.value, null, null, ImmutableMethodImplementation(4, emptyList(), null, null))).apply {
            addInstructions(0, smali)
        }

    private fun Method.state(): List<Any?> = listOf(accessFlags, implementation?.registerCount, instructions().map(::operands))
    private fun ClassDef.state() = methods.associate { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" to it.state() }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    // Opcode.name in Kotlin is dexlib2's smali name field ("const-string"), so compare the opcodes themselves.
    private fun Method.strings() = instructions().filter { it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO }
        .mapNotNull { it.ref() }.toSet()
    private fun Method.calls(reference: String) = instructions().any { it.ref() == reference }
    private fun Instruction.ref() = origRef()

    private companion object {
        val HOST_CENSUS = FixtureDex.ClassCensus()
        const val MC = "Lorg/telegram/messenger/MessagesController;"
        const val UC = "Lorg/telegram/messenger/UserConfig;"
        const val LISTENER = "Landroid/location/LocationListener;"
        const val PARENT = "Lhush/ListenerParent;"
        const val MIDDLE = "Lhush/MiddleListener;"
        val GATE_SIZES = mapOf(LocationGate.GPS to 5, LocationGate.ANSWER to 2, LocationGate.PROMPT to 4, LocationGate.DIALOG to 2)
    }
}
