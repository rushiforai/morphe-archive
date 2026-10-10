/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.betalogs

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val BETA_LOGS = "$EXTENSION_PACKAGE/misc/BetaLogs;"
internal const val LOG_SWITCHES = "Lorg/telegram/messenger/BuildVars;"
internal const val DEBUG_VERSION = "$LOG_SWITCHES->DEBUG_VERSION:Z"
internal const val LOGS_ENABLED = "$LOG_SWITCHES->LOGS_ENABLED:Z"
internal const val SAVED_BOOLEAN = "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"

@Suppress("unused")
val turnOffBetaLogsPatch = bytecodePatch(
    name = "Turn off beta debug logs",
    description = "Telegram Beta always writes debug logs to your phone, its connection log included, and its own debug " +
        "menu can't stop that. This stops them, so the beta only logs when you turn logs on in its debug menu. The " +
        "regular telegram.org build doesn't force them, so nothing changes there. Starts off. Turn it on in " +
        "HushTelegram settings > Chats, then restart Telegram.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveBetaLogs()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertBetaLogsGate(MutableMethod(ImmutableMethod.of(plan.initializer)), plan)
        insertBetaLogsGate(plan.initializer, plan)
        enableStatus("betaLogsOff")
    }
}

/** Where BuildVars' static initializer reads DEBUG_VERSION to decide its logs, and the register it reads into. */
internal class BetaLogsPlan(val initializer: MutableMethod, val read: Int, val register: Int)

/** The value read goes through the extension, and its answer is what Telegram decides the logs with. */
internal fun insertBetaLogsGate(target: MutableMethod, plan: BetaLogsPlan) {
    target.addInstructionsAtControlFlowLabel(plan.read + 1, """
        invoke-static/range {v${plan.register} .. v${plan.register}}, $BETA_LOGS->forceLogs(Z)Z
        move-result v${plan.register}
    """)
}

/**
 * BuildVars' static initializer opens Telegram's "systemConfig" preferences and decides
 * LOGS_ENABLED as DEBUG_VERSION or the saved "logsEnabled" choice, read with DEBUG_VERSION as its
 * default. The one DEBUG_VERSION read there is followed by an if-nez that jumps straight to the one
 * LOGS_ENABLED write, and the same register is the getBoolean default. Telegram Beta has
 * DEBUG_VERSION on, so the jump always runs.
 */
internal fun BytecodePatchContext.resolveBetaLogs(): BetaLogsPlan {
    requireStatusMethod("betaLogsOff")
    controlHook(BETA_LOGS, "forceLogs", listOf("Z"), "Z")
    val owner = mutableClassDefByOrNull(LOG_SWITCHES)
    controlShape(owner != null, "Telegram's build switches are missing")
    for (name in listOf("DEBUG_VERSION", "LOGS_ENABLED")) {
        val field = owner!!.fields.filter { it.name == name }.controlSingle("BuildVars.$name")
        controlShape(field.type == "Z" && AccessFlags.STATIC.isSet(field.accessFlags) && AccessFlags.PUBLIC.isSet(field.accessFlags) &&
            !AccessFlags.FINAL.isSet(field.accessFlags), "BuildVars.$name is no longer a public static switch")
    }
    val initializer = owner!!.methods.filter { it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.implementation != null }
        .controlSingle("BuildVars' static initializer")
    val body = initializer.controlBody()
    val read = body.indices.filter { body[it].opcode == Opcode.SGET_BOOLEAN && body[it].controlRef() == DEBUG_VERSION }
        .controlSingle("the DEBUG_VERSION read that decides the logs")
    val writes = body.indices.filter { body[it].opcode == Opcode.SPUT_BOOLEAN && body[it].controlRef() == LOGS_ENABLED }
    val write = writes.controlSingle("the LOGS_ENABLED write")
    val register = (body[read] as OneRegisterInstruction).registerA
    val branch = body.getOrNull(read + 1)
    controlShape(branch?.opcode == Opcode.IF_NEZ && branch.namedRegisters() == listOf(register),
        "DEBUG_VERSION no longer turns the logs on by itself")
    val flow = ControlFlow.of(initializer)
    controlShape(flow.normal[read + 1].toSet() == setOf(read + 2, write),
        "DEBUG_VERSION no longer jumps straight to the LOGS_ENABLED write")
    controlShape(flow.normal.indices.none { it != read && (read + 1) in flow.normal[it] },
        "something else jumps to the DEBUG_VERSION check")
    val key = body.indices.filter { body[it].controlString() == "logsEnabled" }.controlSingle("the saved logsEnabled choice")
    val saved = body.indices.filter { it > key && body[it].controlRef() == SAVED_BOOLEAN }.firstOrNull()
    controlShape(saved != null && saved < write && body[saved].namedRegisters().last() == register,
        "the saved logsEnabled choice no longer defaults to DEBUG_VERSION")
    controlShape(body.subList(read + 2, saved!!).none { it.namedRegisters().firstOrNull() == register && it.opcode.setsRegister() },
        "DEBUG_VERSION's register is reused before the saved choice is read")
    controlShape(body.subList(0, read).any { it.controlField()?.name == "applicationContext" } &&
        body.subList(0, read).any { it.controlString() == "systemConfig" }, "the logs are no longer decided from Telegram's saved settings")
    return BetaLogsPlan(initializer, read, register)
}
