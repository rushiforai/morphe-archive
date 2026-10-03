/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionReversed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Disable analytics"

private const val ANALYTICS = "$EXTENSION_PACKAGE/misc/Analytics;"

/**
 * The messages controller's `logDeviceStats()`: when the server's config sets
 * `collectDeviceStats`, it classifies the selected root as emulated storage and reports that boolean as a
 * `help.saveAppLog` event. Found by that field and that request, both kept names.
 */
internal object LogDeviceStatsFingerprint : Fingerprint(
    definingClass = MESSAGES_CONTROLLER,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = MESSAGES_CONTROLLER, name = "collectDeviceStats", type = "Z"),
        newInstance("Lorg/telegram/tgnet/TLRPC\$TL_help_saveAppLog;"),
    ),
)

/** A channel's batch of read metrics: how long each post stayed on screen as you scrolled. */
internal const val REPORT_READ_METRICS = "Lorg/telegram/tgnet/TLRPC\$TL_messages_reportReadMetrics;"

/**
 * The channel view's send method: takes the read metrics gathered since the last send and sends
 * them as `messages.reportReadMetrics`. Its class is renamed in every build, so it's found by the
 * request it builds.
 */
internal object SendReadMetricsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(newInstance(REPORT_READ_METRICS)),
)

/**
 * Keeps Telegram's usage reports on the phone.
 *
 * The storage event reports whether the selected root contains /storage/emulated/. That
 * method hands the extension its controller first and returns before classification while the
 * switch is on and a report is pending. The extension reads Telegram's two existing report flags
 * so a call that was never going to send anything isn't counted as a skipped report.
 *
 * Read metrics followed on 2026-10-01, when Telegram's own request log on a signed-in phone showed
 * `messages.reportReadMetrics` going out as a channel was scrolled. One method builds it, and it
 * asks the extension just before, with the batch in hand. View counts are a separate request and
 * stay as they are. Premium screen views, item taps, accepts and canceled purchases carry four
 * verified interaction types. Their guards skip only the telemetry send, keeping billing callbacks
 * and all other operations. Each place stands alone, and the patch log names any missing target.
 * Each successful hook also sets its
 * own build flag, so settings and diagnostic reports show which targets remain covered.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = PATCH,
    description = "Stops Telegram sending its storage-type statistic and how long you spent on each channel post to its server. Also stops reports about Premium screen views, feature taps, accepts and purchase failures. Messages and calls work as before.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableAnalytics")
        requireStatusMethod("deviceStats")
        requireStatusMethod("readMetrics")
        PremiumPromoEvent.entries.forEach { requireStatusMethod(it.capability) }

        val device = LogDeviceStatsFingerprint.methodOrNull
        device?.requireLocals(PATCH, 1)
        device?.requireThisIntact(PATCH, listOf(0))
        val metrics = SendReadMetricsFingerprint.methodOrNull
        val metricsMissing = metrics?.skipReadMetricsWhen("$ANALYTICS->skipReadMetrics(Ljava/util/List;)Z", dryRun = true)
        val premium = resolvePremiumPromoHooks()

        handleTargets(PATCH, "usage reports", Report.entries) { report ->
            when (report) {
                Report.DEVICE_STATS -> device.let { method ->
                    if (method == null) "no method of the messages controller reads collectDeviceStats and sends a help.saveAppLog event"
                    else {
                        val first = method.getInstruction(0)
                        method.addInstructionsWithLabels(
                            0,
                            """
                                invoke-static/range {p0 .. p0}, $ANALYTICS->skipDeviceStats(Ljava/lang/Object;)Z
                                move-result v0
                                if-eqz v0, :hush_keep
                                return-void
                            """,
                            ExternalLabel("hush_keep", first),
                        )
                        enableCapability("deviceStats")
                        null
                    }
                }
                Report.READ_METRICS -> metrics.let { method ->
                    if (method == null) "no method builds $REPORT_READ_METRICS"
                    else if (metricsMissing != null) metricsMissing
                    else method.skipReadMetricsWhen("$ANALYTICS->skipReadMetrics(Ljava/util/List;)Z").also { missing ->
                        if (missing == null) enableCapability("readMetrics")
                    }
                }
                else -> {
                    val event = report.premium!!
                    val hook = premium[event]
                    if (hook == null) "no verified ${event.type} interaction builder"
                    else {
                        hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code,
                            ExternalLabel("hush_continue", hook.method.getInstruction(hook.continuation)))
                        when (event) {
                            PremiumPromoEvent.SHOW -> enableCapability("premiumPromoShow")
                            PremiumPromoEvent.TAP -> enableCapability("premiumPromoTap")
                            PremiumPromoEvent.ACCEPT -> enableCapability("premiumPromoAccept")
                            PremiumPromoEvent.FAIL -> enableCapability("premiumPromoFail")
                        }
                        null
                    }
                }
            }
        }

        enableStatus("disableAnalytics")
    }
}

/** The reports Telegram sends about how the app is used. */
private enum class Report(val premium: PremiumPromoEvent? = null) {
    DEVICE_STATS, READ_METRICS, PREMIUM_SHOW(PremiumPromoEvent.SHOW), PREMIUM_TAP(PremiumPromoEvent.TAP),
    PREMIUM_ACCEPT(PremiumPromoEvent.ACCEPT), PREMIUM_FAIL(PremiumPromoEvent.FAIL),
}

/**
 * Puts [hook] in front of the `new-instance` of `messages.reportReadMetrics`, handing it the batch
 * the method has just found not empty. On true the method returns without building or sending
 * anything; the hook has emptied the batch, as Telegram does after a send.
 *
 * @return why the method couldn't be hooked, or null once it has been
 */
private fun MutableMethod.skipReadMetricsWhen(hook: String, dryRun: Boolean = false): String? {
    val request = indexOfFirstInstruction {
        opcode == Opcode.NEW_INSTANCE && (this as ReferenceInstruction).reference.toString() == REPORT_READ_METRICS
    }
    val check = if (request < 0) -1 else indexOfFirstInstructionReversed(request) {
        opcode == Opcode.INVOKE_VIRTUAL && (this as ReferenceInstruction).reference.toString() == "Ljava/util/ArrayList;->isEmpty()Z"
    }
    if (check < 0 || request - check > 3) {
        return "the read metrics sender doesn't check its batch just before building $REPORT_READ_METRICS"
    }
    val pending = (getInstruction(check) as FiveRegisterInstruction).registerC
    val overwritten = (check + 1 until request).any { (getInstruction(it) as? OneRegisterInstruction)?.registerA == pending }
    if (pending > 15 || overwritten) {
        return "the read metrics sender's batch isn't in a register the hook can pass on at $REPORT_READ_METRICS"
    }
    val answer = freeLocalsAt(PATCH, request, 1, highest = 255).single()
    if (dryRun) return null
    addInstructionsAtControlFlowLabel(
        request,
        """
            invoke-static {v$pending}, $hook
            move-result v$answer
            if-eqz v$answer, :hush_send
            return-void
            :hush_send
            nop
        """,
    )
    return null
}

internal const val SAVE_APP_LOG = "Lorg/telegram/tgnet/TLRPC\$TL_help_saveAppLog;"
private const val APP_EVENT = "Lorg/telegram/tgnet/TLRPC\$TL_inputAppEvent;"
internal enum class PremiumPromoEvent(val type: String, val capability: String, val parameters: List<String>) {
    SHOW("premium.promo_screen_show", "premiumPromoShow", listOf("Ljava/lang/String;")),
    TAP("premium.promo_screen_tap", "premiumPromoTap", listOf("I", "I")),
    ACCEPT("premium.promo_screen_accept", "premiumPromoAccept", emptyList()),
    FAIL("premium.promo_screen_fail", "premiumPromoFail", emptyList()),
}
internal data class PremiumPromoHook(val method: MutableMethod, val index: Int, val continuation: Int, val code: String)

/** Exact payload literals select these builders; operational and unknown app-log events aren't selected. */
internal fun BytecodePatchContext.resolvePremiumPromoHooks(): Map<PremiumPromoEvent, PremiumPromoHook> {
    val candidates = PremiumPromoEvent.entries.associateWith { mutableListOf<Method>() }
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        for (method in classDef.methods) {
            val instructions = method.appLogInstructions()
            if (instructions.none { it.opcode == Opcode.NEW_INSTANCE && it.appLogReference() == SAVE_APP_LOG }) continue
            for (event in PremiumPromoEvent.entries) if (instructions.any { it.appLogString() == event.type }) candidates.getValue(event) += method
        }
    }
    val hooks = mutableMapOf<PremiumPromoEvent, PremiumPromoHook>()
    for ((event, matches) in candidates) {
        promoShape(matches.size <= 1, "ambiguous ${event.type} builder")
        val found = matches.singleOrNull() ?: continue
        val method = mutableClassDefBy(found.definingClass).methods.single { it.name == found.name && it.returnType == found.returnType &&
            it.parameterTypes.map { type -> type.toString() } == found.parameterTypes.map { type -> type.toString() } }
        val instructions = method.appLogInstructions()
        val types = instructions.indices.filter { instructions[it].opcode == Opcode.IPUT_OBJECT && instructions[it].appLogField()?.let { field ->
            field.definingClass == APP_EVENT && field.name == "type" && field.type == "Ljava/lang/String;"
        } == true }
        promoShape(types.size == 1, "${event.type} includes other or unverified event types")
        val type = types.single()
        promoShape(type > 0 && instructions[type - 1].appLogString() == event.type &&
            instructions[type - 1].namedRegisters().single() == instructions[type].namedRegisters()[0], "${event.type} payload type assignment changed")
        val requests = instructions.indices.filter { instructions[it].opcode == Opcode.NEW_INSTANCE && instructions[it].appLogReference() == SAVE_APP_LOG }
        val events = instructions.indices.filter { instructions[it].opcode == Opcode.NEW_INSTANCE && instructions[it].appLogReference() == APP_EVENT }
        promoShape(requests.size == 1 && events.size == 1 &&
            instructions[events.single()].namedRegisters().single() == instructions[type].namedRegisters()[1], "${event.type} event/request batch changed")
        val sends = instructions.indices.filter { instructions[it].appLogCall()?.let { call ->
            call.definingClass == "Lorg/telegram/tgnet/ConnectionsManager;" && call.name == "sendRequest" &&
                call.parameterTypes.map { it.toString() } == listOf("Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/RequestDelegate;") && call.returnType == "I"
        } == true }
        promoShape(sends.size == 1, "${event.type} telemetry send is ambiguous")
        val send = sends.single()
        val requestRegister = instructions[requests.single()].namedRegisters().single()
        val eventRegister = instructions[events.single()].namedRegisters().single()
        promoShape(send > type && instructions[send].namedRegisters().size == 3 &&
            instructions[send].namedRegisters()[1] == requestRegister, "${event.type} request is not the object sent")
        val batch = instructions.indices.filter { instructions[it].opcode == Opcode.IGET_OBJECT && instructions[it].appLogField()?.let { field ->
            field.definingClass == SAVE_APP_LOG && field.name == "events" && field.type == "Ljava/util/ArrayList;"
        } == true }
        promoShape(batch.size == 1 && instructions[batch.single()].namedRegisters()[1] == requestRegister &&
            instructions.getOrNull(batch.single() + 1)?.appLogCall()?.toString() == "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" &&
            instructions[batch.single() + 1].namedRegisters() == listOf(instructions[batch.single()].namedRegisters()[0], eventRegister),
            "${event.type} no longer sends exactly the verified event")
        val data = instructions.indices.filter { instructions[it].opcode == Opcode.IPUT_OBJECT && instructions[it].appLogField()?.let { field ->
            field.definingClass == APP_EVENT && field.name == "data" && field.type == "Lorg/telegram/tgnet/TLRPC\$JSONValue;"
        } == true }
        promoShape(data.size == 1 && instructions[data.single()].namedRegisters()[1] == eventRegister,
            "${event.type} data assignment changed")
        val dataRegister = instructions[data.single()].namedRegisters()[0]
        val dataObject = (type + 1 until data.single()).lastOrNull { instructions[it].opcode.setsRegister() &&
            instructions[it].namedRegisters().firstOrNull() == dataRegister }
        val expectedData = if (event == PremiumPromoEvent.SHOW || event == PremiumPromoEvent.TAP) "TL_jsonObject" else "TL_jsonNull"
        promoShape(dataObject != null && instructions[dataObject].opcode == Opcode.NEW_INSTANCE &&
            instructions[dataObject].appLogReference() == "Lorg/telegram/tgnet/TLRPC\$$expectedData;" &&
            (event != PremiumPromoEvent.SHOW || instructions.any { it.appLogString() == "source" }) &&
            (event != PremiumPromoEvent.TAP || instructions.any { it.appLogString() == "item" }), "${event.type} verified payload changed")
        val flow = ControlFlow.of(method)
        promoShape(flow.promoDefinitionReaches(type - 1, type, instructions[type].namedRegisters()[0]),
            "${event.type} payload type can bypass its verified literal")
        promoShape(listOf(type, data.single(), batch.single() + 1).all {
            flow.promoDefinitionReaches(events.single(), it, eventRegister)
        }, "${event.type} event identity changed before its payload or batch use")
        promoShape(flow.promoDefinitionReaches(requests.single(), batch.single(), requestRegister) &&
            flow.promoDefinitionReaches(requests.single(), send, requestRegister), "${event.type} request identity changed before sending")
        promoShape(flow.promoDefinitionReaches(dataObject!!, data.single(), dataRegister),
            "${event.type} data can bypass its verified allocation")
        promoShape(flow.promoDefinitionReaches(batch.single(), batch.single() + 1, instructions[batch.single()].namedRegisters()[0]),
            "${event.type} batch can bypass its verified read")
        promoShape(listOf(type, data.single(), batch.single() + 1).all { flow.promoDefinitionReaches(it, send) },
            "${event.type} telemetry send can bypass its verified payload or batch append")
        promoShape(flow.normal[send].size == 1, "${event.type} send continuation changed")
        val continuation = flow.normal[send].single()
        if (event != PremiumPromoEvent.FAIL) {
            promoShape(AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == event.parameters && instructions[continuation].opcode == Opcode.RETURN_VOID &&
                instructions.count { it.appLogCall()?.name == "sendRequest" } == 1, "${event.type} is no longer a standalone interaction report")
        } else {
            val request = requests.single()
            val cancellation = request - 1
            val cleanup = instructions[continuation]
            promoShape(method.definingClass == "Lorg/telegram/messenger/BillingController;" && method.returnType == "V" &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3 && method.parameterTypes.map { it.toString() }.takeLast(2) ==
                listOf("Ljava/util/List;", "Ljava/lang/Runnable;") && instructions.getOrNull(cancellation)?.opcode == Opcode.IF_NE &&
                continuation in flow.normal[cancellation] && cleanup.opcode == Opcode.IGET_OBJECT && cleanup.appLogField()?.let { field ->
                    field.definingClass == method.definingClass && field.name == "onCanceled" && field.type == "Ljava/lang/Runnable;"
                } == true, "Premium cancellation report no longer joins billing cleanup")
            val response = instructions[cancellation].namedRegisters()[0]
            promoShape(instructions.getOrNull(cancellation - 1)?.opcode == Opcode.IF_EQZ &&
                instructions[cancellation - 1].namedRegisters() == listOf(response) &&
                flow.normal[cancellation - 1].single { it != cancellation } > continuation, "Premium success path no longer bypasses cancellation telemetry")
            val responseRead = (0 until cancellation).lastOrNull { instructions[it].opcode.setsRegister() &&
                instructions[it].namedRegisters().firstOrNull() == response }
            promoShape(responseRead != null && instructions[responseRead].opcode == Opcode.IGET && instructions[responseRead].appLogField()?.let { field ->
                field.type == "I" && field.definingClass == method.parameterTypes.first().toString()
            } == true, "Premium fail event no longer reads the billing result")
            val responseIndex = responseRead!!
            val result = instructions[responseIndex].namedRegisters()[1]
            val resultMove = (0 until responseIndex).lastOrNull { instructions[it].opcode.setsRegister() && instructions[it].namedRegisters().firstOrNull() == result }
            promoShape(result == method.parameterRegisterNumber(0) || resultMove != null &&
                instructions[resultMove].opcode in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
                instructions[resultMove].namedRegisters()[1] == method.parameterRegisterNumber(0), "Premium billing result receiver changed")
            val responseCode = instructions[cancellation].namedRegisters()[1]
            val code = (0 until cancellation).lastOrNull { instructions[it].opcode.setsRegister() &&
                instructions[it].namedRegisters().firstOrNull() == responseCode }
            promoShape(code != null && (instructions[code] as? NarrowLiteralInstruction)?.narrowLiteral == 1,
                "Premium fail event is no longer the cancellation response")
        }
        val answer = method.freeLocalsAt(PATCH, send, 1, targets = listOf(continuation), highest = 255).single()
        hooks[event] = PremiumPromoHook(method, send, continuation, """
            const-string v$answer, "${event.type}"
            invoke-static/range {v$answer .. v$answer}, $ANALYTICS->skipPremiumAppLog(Ljava/lang/String;)Z
            move-result v$answer
            if-nez v$answer, :hush_continue
        """)
    }
    return hooks
}

/** A throwing definition leaves the old value, and later backedges can revisit an earlier use. */
private fun ControlFlow.promoDefinitionReaches(source: Int, use: Int, register: Int? = null): Boolean {
    val seen = mutableSetOf<Pair<Int, Boolean>>()
    val pending = ArrayDeque<Pair<Int, Boolean>>()
    pending += 0 to false
    var reached = false
    while (pending.isNotEmpty()) {
        val state = pending.removeFirst()
        if (!seen.add(state)) continue
        val (at, known) = state
        if (at == use) {
            if (!known) return false
            reached = true
        }
        val instruction = instructions[at]
        val destination = instruction.namedRegisters().firstOrNull()
        val overwritten = register != null && instruction.opcode.setsRegister() &&
            (destination == register || instruction.opcode.setsWideRegister() && destination?.plus(1) == register)
        val next = if (at == source) true else known && !overwritten
        normal[at].forEach { pending += it to next }
        exceptional[at].forEach { pending += it to known }
    }
    return reached
}

private fun promoShape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed app-log geometry before editing")
}
private fun Method.appLogInstructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.appLogReference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.appLogString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.appLogField() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.appLogCall() = (this as? ReferenceInstruction)?.reference as? MethodReference
