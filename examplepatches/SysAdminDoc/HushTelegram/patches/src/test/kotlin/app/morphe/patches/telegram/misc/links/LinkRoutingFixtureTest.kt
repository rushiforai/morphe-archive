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
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.paste.NORMAL_PASTE
import app.morphe.patches.telegram.misc.paste.useNormalPastePatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableArrayPayload
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

/** Real pinned host methods prove sink scope, both patch orders and untouched stock control flow. */
class LinkRoutingFixtureTest {
    private val trackingFlags = listOf("stripLinkTracking", "openedLinkTracking", "sharedLinkTracking", "skipAutologin")
    private val externalFlags = listOf("openExternalLinks", "externalBrowserRouting")

    @Test fun `both selectable patches work in either order and retain all stock operands branches and handlers`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hostClasses(build)
            for (externalFirst in listOf(true, false)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val plan = context.resolveLinkHooks()
                assertEquals("${build.name}: the three verified Share Link chooser sinks", 3, plan.shares.size)
                assertTrue("${build.name}: the kept custom-tab share receiver is covered", plan.shares.any {
                    it.method.origDefiningClass == "Lorg/telegram/messenger/ShareBroadcastReceiver;" && it.method.origName == "onReceive"
                })
                val methods = (listOf(plan.browser) + plan.shares.map { it.method }).distinct()
                val original = methods.associate { key(it) to ImmutableMethod.of(it) }
                if (externalFirst) {
                    openExternalLinksPatch.execute(context)
                    stripLinkTrackingPatch.execute(context)
                } else {
                    stripLinkTrackingPatch.execute(context)
                    openExternalLinksPatch.execute(context)
                }
                for (method in methods) assertStock(build.name, original.getValue(key(method)), method)
                for (flag in trackingFlags + externalFlags) assertFlag(context, flag, true)
                val protection = context.tgMutableClassDefBy(LINKS).methods.single { it.origName == "protectedByTelegram" }
                val calls = protection.instructions().mapNotNull { it.ref() }
                assertTrue("the exact discovered native classifier is called", plan.classifier.toString() in calls)
                assertTrue("auth domains keep stock routing", "$MC->authDomains:Ljava/util/Set;" in calls)
                assertTrue("autologin domains keep stock routing", "$MC->autologinDomains:Ljava/util/Set;" in calls)
                assertTrue("the selected account is used", "$UC->selectedAccount:I" in calls)
                assertEquals("one route guard", 1, plan.browser.instructions().count { it.ref()?.startsWith("$LINKS->tryOpenExternal(") == true })
                assertEquals("one opened-URI cleaner", 1, plan.browser.instructions().count { it.ref()?.startsWith("$LINKS->cleanOpenedUri(") == true })
                assertAutologinGated(build.name, plan.browser)
                for (share in plan.shares) assertEquals("only the chooser target is passed to cleaning", 1,
                    share.method.instructions().count { it.ref()?.startsWith("$LINKS->cleanShareIntent(") == true })
            }
        }
    }

    @Test fun `Use normal paste still applies after Strip link tracking, and both reach the paste editors`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + (hostClasses(build) + copyPasteHosts(build)).distinctBy { it.type })
            val editors = context.resolveCopyPaste().pastes
            assertEquals("${build.name}: the message box and caption editors", 2, editors.size)
            val stock = editors.map { editor -> editor.controlBody().filter { it.opcode != Opcode.NOP }.map { it.opcode to it.ref() } }
            // The patcher's order: Strip link tracking runs, then Use normal paste, then the patches' finalize blocks.
            stripLinkTrackingPatch.execute(context)
            useNormalPastePatch.execute(context)
            stripLinkTrackingPatch.finalize(context)
            assertFlag(context, "pastedLinkTracking", true)
            editors.forEachIndexed { at, editor ->
                val after = editor.controlBody().filter { it.opcode != Opcode.NOP }.map { it.opcode to it.ref() }
                assertEquals("${build.name}: editor $at watches the paste first", Opcode.INVOKE_STATIC to WATCH_PASTE, after[0])
                assertEquals("${build.name}: editor $at then asks Use normal paste", Opcode.INVOKE_STATIC to
                    "$NORMAL_PASTE->contextMenuAction(Landroid/view/View;I)I", after[1])
                assertEquals(Opcode.MOVE_RESULT, after[2].first)
                assertEquals("${build.name}: editor $at keeps its stock body", stock[at], after.drop(3))
            }
        }
    }

    @Test fun `each patch is selectable independently and makes only its own capabilities true`() {
        for (build in Fixtures.declaredBuilds()) for (external in listOf(true, false)) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveLinkHooks()
            val beforeShares = plan.shares.associate { key(it.method) to it.method.instructions().map(::operands) }
            if (external) openExternalLinksPatch.execute(context) else stripLinkTrackingPatch.execute(context)
            externalFlags.forEach { assertFlag(context, it, external) }
            trackingFlags.forEach { assertFlag(context, it, !external) }
            if (external) for (share in plan.shares) assertEquals("routing doesn't touch sharing", beforeShares.getValue(key(share.method)), share.method.instructions().map(::operands))
            assertEquals(if (external) 0 else 1, plan.browser.instructions().count { it.ref()?.startsWith("$LINKS->cleanOpenedUri(") == true })
            assertEquals(if (external) 1 else 0, plan.browser.instructions().count { it.ref()?.startsWith("$LINKS->tryOpenExternal(") == true })
            assertEquals(if (external) 0 else 1, plan.browser.instructions().count { it.ref() == AUTOLOGIN_GATE })
        }
    }

    @Test fun `a changed sign-in token branch refuses before any insertion`() {
        val cases = listOf<Triple<String, String, (MutableMethod) -> Unit>>(
            // The domain check's answer lands somewhere the branch doesn't test.
            Triple("answer moved", "autologin domain answer no longer decides the token") { browser ->
                val code = browser.instructions()
                val answer = code.indexOfFirst { it.ref() == "$MC->autologinDomains:Ljava/util/Set;" } + 2
                val other = (0..15).first { it != code[answer].namedRegisters().single() }
                browser.replaceInstruction(answer, "move-result v$other")
            },
            // The token is read again before the domain check, where the switch can't see it.
            Triple("token read elsewhere", "autologin token is read outside its branch") { browser ->
                val code = browser.instructions()
                val domains = code.indexOfFirst { it.ref() == "$MC->autologinDomains:Ljava/util/Set;" }
                val (set, controller) = code[domains].namedRegisters()
                browser.addInstructions(domains, "iget-object v$set, v$controller, $MC->autologinToken:Ljava/lang/String;")
            },
        )
        for (build in Fixtures.declaredBuilds()) for ((name, reason, mutate) in cases) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveLinkHooks()
            mutate(plan.browser)
            val methods = listOf(plan.browser) + plan.shares.map { it.method }
            val before = methods.map { it.instructions().map(::operands) }
            val stub = context.tgMutableClassDefBy(LINKS).methods.single { it.origName == "protectedByTelegram" }.instructions().map(::operands)
            val refused = assertThrows("${build.name}: $name", PatchException::class.java) { stripLinkTrackingPatch.execute(context) }
            assertTrue("${build.name}: $name refused for its own reason: ${refused.message}", refused.message.orEmpty().contains(reason))
            assertEquals("${build.name}: $name leaves every host as it was", before, methods.map { it.instructions().map(::operands) })
            assertEquals(stub, context.tgMutableClassDefBy(LINKS).methods.single { it.origName == "protectedByTelegram" }.instructions().map(::operands))
            (trackingFlags + externalFlags).forEach { assertFlag(context, it, false) }
        }
    }

    @Test fun `missing status methods refuse before host or native-protection stub edits`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hostClasses(build)
            for (missing in trackingFlags + externalFlags) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val plan = context.resolveLinkHooks()
                val methods = listOf(plan.browser) + plan.shares.map { it.method }
                val before = methods.map { it.instructions().map(::operands) }
                val stub = context.tgMutableClassDefBy(LINKS).methods.single { it.origName == "protectedByTelegram" }
                val stubBefore = stub.instructions().map(::operands)
                context.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == missing }
                assertThrows(PatchException::class.java) {
                    if (missing in externalFlags) openExternalLinksPatch.execute(context) else stripLinkTrackingPatch.execute(context)
                }
                assertEquals(before, methods.map { it.instructions().map(::operands) })
                assertEquals(stubBefore, context.tgMutableClassDefBy(LINKS).methods.single { it.origName == "protectedByTelegram" }.instructions().map(::operands))
            }
        }
    }

    @Test fun `a wrong native flag-array shape or altered Share Link action refuses before any insertion`() {
        for (build in Fixtures.declaredBuilds()) for (badFlags in listOf(true, false)) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveLinkHooks()
            if (badFlags) {
                val instructions = plan.browser.instructions()
                val classifier = instructions.indexOfFirst { it.ref() == plan.classifier.toString() }
                val arrayRegister = instructions[classifier].namedRegisters()[2]
                val array = (0 until classifier).last { instructions[it].opcode == Opcode.NEW_ARRAY && instructions[it].namedRegisters()[0] == arrayRegister }
                val countRegister = instructions[array].namedRegisters()[1]
                val count = (0 until array).last { instructions[it].opcode == Opcode.CONST_4 && instructions[it].namedRegisters()[0] == countRegister }
                plan.browser.replaceInstruction(count, "const/4 v$countRegister, 0x2")
            } else {
                val receiver = plan.shares.single { it.method.origDefiningClass == "Lorg/telegram/messenger/ShareBroadcastReceiver;" }.method
                val action = receiver.instructions().indexOfFirst { it.ref() == "android.intent.action.SEND" }
                val register = receiver.instructions()[action].namedRegisters().single()
                receiver.replaceInstruction(action, "const-string v$register, \"android.intent.action.VIEW\"")
                // It no longer matches a share candidate. The required kept receiver must refuse.
            }
            val methods = listOf(plan.browser) + plan.shares.map { it.method }
            val before = methods.map { it.instructions().map(::operands) }
            assertThrows(PatchException::class.java) { stripLinkTrackingPatch.execute(context) }
            assertEquals("no host is half-patched", before, methods.map { it.instructions().map(::operands) })
            (trackingFlags + externalFlags).forEach { assertFlag(context, it, false) }
        }
    }

    @Test fun `inaccessible or nonconcrete link runtime refuses before host scope or status changes`() {
        for (build in Fixtures.declaredBuilds()) for (name in listOf("tryOpenExternal", "cleanOpenedUri", "cleanShareIntent", "addAutologinToken")) {
            for (mutation in 0..4) {
                val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
                val plan = context.resolveLinkHooks()
                val owner = context.tgMutableClassDefBy(LINKS)
                val method = owner.methods.single { it.origName == name }
                when (mutation) {
                    0 -> owner.accessFlags = owner.accessFlags and AccessFlags.PUBLIC.value.inv()
                    1 -> method.accessFlags = method.accessFlags and AccessFlags.PUBLIC.value.inv()
                    2 -> method.accessFlags = method.accessFlags and AccessFlags.STATIC.value.inv()
                    3 -> method.accessFlags = method.accessFlags or AccessFlags.NATIVE.value
                    4 -> method.accessFlags = method.accessFlags or AccessFlags.ABSTRACT.value
                }
                val methods = listOf(plan.browser) + plan.shares.map { it.method } + owner.methods
                val before = methods.map { it.instructions().map(::operands) }
                assertThrows(PatchException::class.java) {
                    if (name == "tryOpenExternal") openExternalLinksPatch.execute(context) else stripLinkTrackingPatch.execute(context)
                }
                assertEquals("all host and runtime bodies remain unchanged", before, methods.map { it.instructions().map(::operands) })
                (trackingFlags + externalFlags).forEach { assertFlag(context, it, false) }
            }
        }
    }

    @Test fun `empty external-open runtime refuses before host capability or status changes`() =
        runtimeRefusal("tryOpenExternal", body = emptyList())

    @Test fun `empty opened-link cleaner refuses before host capability or status changes`() =
        runtimeRefusal("cleanOpenedUri", body = emptyList())

    @Test fun `empty share-intent cleaner refuses before host capability or status changes`() =
        runtimeRefusal("cleanShareIntent", body = emptyList())

    @Test fun `undersized external-open parameters refuse before host capability or status changes`() =
        runtimeRefusal("tryOpenExternal", registers = RUNTIME_WORDS.getValue("tryOpenExternal") - 1)

    @Test fun `undersized opened-link cleaner parameters refuse before host capability or status changes`() =
        runtimeRefusal("cleanOpenedUri", registers = RUNTIME_WORDS.getValue("cleanOpenedUri") - 1)

    @Test fun `undersized share-intent cleaner parameters refuse before host capability or status changes`() =
        runtimeRefusal("cleanShareIntent", registers = RUNTIME_WORDS.getValue("cleanShareIntent") - 1)

    @Test fun `data payloads cannot substitute for executable link runtime instructions`() {
        for (name in RUNTIME_WORDS.keys) runtimeRefusal(name, body = listOf(ImmutableArrayPayload(4, listOf(1L))))
    }

    /** Replaces one runtime body, then holds every host, runtime and status method to its full prior state. */
    private fun runtimeRefusal(name: String, registers: Int? = null, body: List<Instruction>? = null) {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hostClasses(build))
            val plan = context.resolveLinkHooks()
            val owner = context.tgMutableClassDefBy(LINKS)
            val method = owner.methods.single { it.origName == name }
            val implementation = method.implementation!!
            assertEquals("$name: one register per parameter", RUNTIME_WORDS.getValue(name), method.parameterTypes.size)
            assertTrue("$name: the stock body is executable within its parameter budget",
                implementation.registerCount >= RUNTIME_WORDS.getValue(name) &&
                    implementation.instructions.any { !it.opcode.format.isPayloadFormat })
            owner.methods.remove(method)
            owner.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                ImmutableMethodImplementation(registers ?: implementation.registerCount, body ?: implementation.instructions,
                    if (body == null) implementation.tryBlocks else emptyList(),
                    if (body == null) implementation.debugItems else emptyList())).toMutable())
            val hosts = listOf(plan.browser) + plan.shares.map { it.method }
            val hostsBefore = hosts.map { key(it) to it.state() }
            val classesBefore = listOf(LINKS, SETTINGS_STATUS).associateWith { context.tgMutableClassDefBy(it).state() }
            assertThrows("${build.name}: $name", PatchException::class.java) {
                (if (name == "tryOpenExternal") openExternalLinksPatch else stripLinkTrackingPatch).execute(context)
            }
            assertEquals("${build.name}: $name leaves every host method as it was", hostsBefore, hosts.map { key(it) to it.state() })
            assertEquals("${build.name}: $name leaves the runtime and status classes as they were", classesBefore,
                listOf(LINKS, SETTINGS_STATUS).associateWith { context.tgMutableClassDefBy(it).state() })
            (trackingFlags + externalFlags).forEach { assertFlag(context, it, false) }
        }
    }

    private fun hostClasses(build: File): List<ClassDef> {
        val sinks = FixtureDex.classesWhere(build, HOST_CENSUS, { true }) { method ->
            (method.origReturnType == "V" && method.parameterTypes.size in 10..11 &&
                method.parameterTypes.take(2) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") &&
                method.instructions().any { it.ref() == "autologin_token" }) ||
                (method.instructions().any { it.ref() == "Lorg/telegram/messenger/R\$string;->ShareLink:I" } &&
                    method.instructions().any { it.ref() == "android.intent.action.SEND" })
        }
        val kept = FixtureDex.classes(build, setOf(MC, UC))
        assertEquals("account protection definitions", setOf(MC, UC), kept.keys)
        return sinks + kept.values
    }

    private fun assertStock(where: String, original: Method, patched: Method) {
        val before = original.instructions()
        val after = patched.instructions()
        val injected = mutableListOf<IntRange>()
        // 13.2 keeps the classification's answer above v15, so a hook first copies it into a local.
        fun carried(at: Int, call: Int, operand: Int) = after.getOrNull(at)?.let {
            it.opcode == Opcode.MOVE_FROM16 && it.namedRegisters()[0] == after[call].namedRegisters()[operand]
        } == true
        for (index in after.indices) {
            when {
                after[index].ref()?.startsWith("$LINKS->tryOpenExternal(") == true ->
                    injected += (if (carried(index - 2, index, 2)) index - 2 else index - 1)..index + 4
                after[index].ref()?.startsWith("$LINKS->cleanOpenedUri(") == true ->
                    injected += (if (carried(index - 1, index, 1)) index - 1 else index)..index + 3
                after[index].ref()?.startsWith("$LINKS->cleanShareIntent(") == true -> injected += index..index + 1
                after[index].ref() == AUTOLOGIN_GATE -> injected += index..index + 1
            }
        }
        val stock = after.indices.filter { index -> injected.none { index in it } }
        assertEquals("$where: every stock instruction is retained", before.map(::operands), stock.map { operands(after[it]) })
        assertEquals("$where: registers are retained", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        val toOld = stock.withIndex().associate { it.value to it.index }
        fun oldTarget(target: Int): Int {
            val site = injected.singleOrNull { target in it }
            return toOld.getValue(site?.let { it.last + 1 } ?: target)
        }
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(patched)
        for (index in before.indices) {
            assertEquals("$where: stock normal branch $index", oldFlow.normal[index].toSet(), newFlow.normal[stock[index]].map(::oldTarget).toSet())
            assertEquals("$where: stock exception handler $index", oldFlow.exceptional[index].toSet(), newFlow.exceptional[stock[index]].map(::oldTarget).toSet())
        }
        for (site in injected) {
            val call = site.firstOrNull { after[it].ref()?.startsWith("$LINKS->tryOpenExternal(") == true } ?: continue
            assertEquals(Opcode.IF_EQZ, after[call + 2].opcode)
            assertEquals(Opcode.RETURN_VOID, after[call + 3].opcode)
            assertEquals("success returns; false resumes stock", setOf(call + 3, site.last), newFlow.normal[call + 2].toSet())
        }
    }

    /**
     * The domain check's answer goes through the switch, which hands back the register the stock branch
     * tests, and only then decides whether the token is added. Both ways rejoin where they did.
     */
    private fun assertAutologinGated(where: String, browser: Method) {
        val code = browser.instructions()
        val gate = code.indices.single { code[it].ref() == AUTOLOGIN_GATE }
        val domains = code.indices.single { code[it].ref() == "$MC->autologinDomains:Ljava/util/Set;" }
        assertEquals("$where: the gate follows the domain check's answer", domains + 3, gate)
        val answer = code[domains + 2].namedRegisters().single()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[gate].opcode)
        assertEquals(listOf(answer), code[gate].namedRegisters())
        assertEquals(Opcode.MOVE_RESULT, code[gate + 1].opcode)
        assertEquals(listOf(answer), code[gate + 1].namedRegisters())
        assertEquals(Opcode.IF_EQZ, code[gate + 2].opcode)
        assertEquals("$where: the stock branch tests what the switch said", listOf(answer), code[gate + 2].namedRegisters())
        val flow = ControlFlow.of(browser)
        assertEquals(setOf(gate + 1), flow.normal[gate].toSet())
        val append = code.indices.single { code[it].ref()?.endsWith("->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri\$Builder;") == true &&
            code.subList(it - 2, it).any { instruction -> instruction.ref() == "autologin_token" } }
        val skip = flow.normal[gate + 2].single { it != gate + 3 }
        // 13.2 copies the signed-in link back first, and web 13.2.0 then jumps to the merge.
        val copied = code[append + 4].opcode == Opcode.MOVE_OBJECT || code[append + 4].opcode == Opcode.MOVE_OBJECT_FROM16
        val after = flow.normal[append + 4].single()
        val rejoin = if (copied && code[after].opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) flow.normal[after] else listOf(after)
        assertEquals("$where: with the token or without, routing picks up in one place", listOf(skip), if (copied) rejoin else flow.normal[append + 4])
    }

    private fun operands(instruction: Instruction): List<Any?> = listOf(
        instruction.opcode, instruction.namedRegisters(), instruction.ref(),
        (instruction as? WideLiteralInstruction)?.wideLiteral,
        (instruction as? SwitchPayload)?.switchElements?.map { it.key },
        (instruction as? ArrayPayload)?.arrayElements,
    )

    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(Opcode.CONST_4, body[0].opcode)
        assertEquals(name, if (enabled) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    /** Access, frame, instructions with their encoded widths and offsets, both edge sets and the try table. */
    private fun Method.state(): List<Any?> {
        val flow = implementation?.takeIf { instructions().isNotEmpty() }?.let { ControlFlow.of(this) }
        return listOf(accessFlags, implementation?.registerCount, instructions().map(::operands),
            instructions().map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset,
                (it as? SwitchPayload)?.switchElements?.map { element -> element.offset }, (it as? ArrayPayload)?.elementWidth) },
            flow?.normal?.toList(), flow?.exceptional?.toList(),
            implementation?.tryBlocks?.map { listOf(it.startCodeAddress, it.codeUnitCount,
                it.exceptionHandlers.map { handler -> handler.exceptionType to handler.handlerCodeAddress }) })
    }
    private fun ClassDef.state() = listOf(accessFlags, fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) },
        methods.map { key(it) to it.state() })

    private fun key(method: Method) ="${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.ref() = origRef()
    private companion object {
        val HOST_CENSUS = FixtureDex.ClassCensus()
        const val MC = "Lorg/telegram/messenger/MessagesController;"
        const val UC = "Lorg/telegram/messenger/UserConfig;"
        val RUNTIME_WORDS = mapOf("tryOpenExternal" to 5, "cleanOpenedUri" to 3, "cleanShareIntent" to 1, "addAutologinToken" to 1)
        const val AUTOLOGIN_GATE = "$LINKS->addAutologinToken(Z)Z"
    }
}
