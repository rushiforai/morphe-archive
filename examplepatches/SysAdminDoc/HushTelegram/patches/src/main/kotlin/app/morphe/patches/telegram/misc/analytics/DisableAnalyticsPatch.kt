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
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionReversed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val PATCH = "Disable analytics"

private const val ANALYTICS = "$EXTENSION_PACKAGE/misc/Analytics;"

/**
 * The messages controller's `logDeviceStats()`: when the server's config sets
 * `collectDeviceStats`, it reads the phone's storage directories once and sends them as a
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
 * Found by reading 12.10.6 (2026-09-30): of the places that build a `help.saveAppLog` event, the
 * device statistics are the one that describes the phone rather than something you did. That
 * method hands the extension its controller first and returns before scanning storage while the
 * switch is on and a report is pending. The extension reads Telegram's two existing report flags
 * so a call that was never going to send anything isn't counted as a skipped report.
 *
 * Read metrics followed on 2026-10-01, when Telegram's own request log on a signed-in phone showed
 * `messages.reportReadMetrics` going out as a channel was scrolled. One method builds it, and it
 * asks the extension just before, with the batch in hand. View counts are a separate request and
 * stay as they are. The two places stand alone, so a build that moved one still has the other
 * covered and the patch log names the one it went without. Each successful hook also sets its
 * own build flag, so settings and diagnostic reports show which targets remain covered.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = PATCH,
    description = "Stops Telegram sending your storage folders to its server as a device statistics report, " +
        "and how long you spent on each channel post. Everything the app needs to work is left alone.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableAnalytics")
        requireStatusMethod("deviceStats")
        requireStatusMethod("readMetrics")

        handleTargets(PATCH, "usage reports", Report.entries) { report ->
            when (report) {
                Report.DEVICE_STATS -> LogDeviceStatsFingerprint.methodOrNull.let { method ->
                    if (method == null) "no method of the messages controller reads collectDeviceStats and sends a help.saveAppLog event"
                    else {
                        method.requireLocals(PATCH, 1)
                        method.requireThisIntact(PATCH, listOf(0))
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
                Report.READ_METRICS -> SendReadMetricsFingerprint.methodOrNull.let { method ->
                    if (method == null) "no method builds $REPORT_READ_METRICS"
                    else method.skipReadMetricsWhen("$ANALYTICS->skipReadMetrics(Ljava/util/List;)Z").also { missing ->
                        if (missing == null) enableCapability("readMetrics")
                    }
                }
            }
        }

        enableStatus("disableAnalytics")
    }
}

/** The reports Telegram sends about how the app is used. */
private enum class Report { DEVICE_STATS, READ_METRICS }

/**
 * Puts [hook] in front of the `new-instance` of `messages.reportReadMetrics`, handing it the batch
 * the method has just found not empty. On true the method returns without building or sending
 * anything; the hook has emptied the batch, as Telegram does after a send.
 *
 * @return why the method couldn't be hooked, or null once it has been
 */
private fun MutableMethod.skipReadMetricsWhen(hook: String): String? {
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
