/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.handleTargets
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstStringInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Disable analytics"

private const val ENDPOINT =
    "Lapp/morphe/extension/hushthreads/misc/Analytics;->endpoint(Ljava/lang/String;)Ljava/lang/String;"

/** Where Meta's apps post their event logs when nothing else says where. */
private const val LOGGING_URL = "https://graph.facebook.com/logging_client_events"

/**
 * The Pigeon logger's address builder: a host in, `https://<host>/logging_client_events` out, or
 * `/pigeon_nest` for a batch. A static (String, boolean) method, its class and name Redex's.
 */
internal object PigeonUrlFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Z"),
    filters = listOf(string("/pigeon_nest"), string("/logging_client_events")),
)

/**
 * The MQTT client's settings, read from a JSON object. One of them is the address its own
 * analytics go to, with the default event log address as the fallback.
 */
internal object MqttSettingsFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Lorg/json/JSONObject;"),
    filters = listOf(string("analytics_endpoint"), string(LOGGING_URL)),
)

/**
 * Sends Threads' analytics uploads nowhere.
 *
 * Each place Threads builds the address it posts event logs to hands that address to the
 * extension, which answers a port on the phone itself that nothing listens on while the switch is
 * on. The upload fails there and then, and nothing else about the request, or any other request,
 * changes. The three kinds of place stand alone: a build that renamed one still has the others
 * covered, and the patch log names the one it went without.
 *
 * Found by reading 449 (2026-09-29): the Pigeon logger builds its address from a host, a provider
 * and Redex's pool of shared strings each answer the default address as it is, and the MQTT
 * client's settings fall back on it.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = PATCH,
    description = "Stops Threads from sending most of its usage reports to Meta. A few may still get through. Good " +
        "if you'd rather share less about how you use the app. On by default. Turn it off in HushThreads " +
        "settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        requireStatusMethod("disableAnalytics")
        val coverage = mutableClassDefBy(SETTINGS_STATUS).methods.singleOrNull { it.name == "analyticsAddressMask" }
        if (coverage == null || coverage.returnType != "I" || coverage.parameterTypes.isNotEmpty() ||
            !AccessFlags.STATIC.isSet(coverage.accessFlags)) {
            throw PatchException("SettingsStatus has no single static int analyticsAddressMask()")
        }

        var matched = 0
        handleTargets(PATCH, "kinds of analytics address", AddressSite.entries) { site ->
            val missing = when (site) {
                // Not `?.let { ...; null } ?: message`: a found method's null would reach the message.
                AddressSite.PIGEON -> PigeonUrlFingerprint.methodOrNull.let { method ->
                    if (method == null) "no static (String, boolean) method builds the Pigeon logger's address"
                    else { method.wrapEveryReturn(); null }
                }
                AddressSite.DEFAULT -> if (wrapDefaultAddressAnswers() > 0) null
                    else "no method answers $LOGGING_URL as it is"
                AddressSite.MQTT -> MqttSettingsFingerprint.methodOrNull.let { method ->
                    if (method == null) "no constructor reads analytics_endpoint from the MQTT client's settings"
                    else method.wrapAnalyticsSetting()
                }
            }
            if (missing == null) matched = matched or site.mask
            missing?.let { "${site.name}: $it" }
        }

        writeStub(SETTINGS_STATUS, "analyticsAddressMask", 1, "const/4 v0, $matched\nreturn v0")
        val found = AddressSite.entries.filter { matched and it.mask != 0 }.joinToString { it.name }
        val missing = AddressSite.entries.filter { matched and it.mask == 0 }.joinToString { it.name }.ifEmpty { "none" }
        patchLog.info("$PATCH: matched $found; missing $missing.")
        enableStatus("disableAnalytics")
    }
}

/** The kinds of place Threads gets an analytics upload address from. */
private enum class AddressSite(val mask: Int) { PIGEON(1), DEFAULT(2), MQTT(4) }

/**
 * Sends [LOGGING_URL] through the extension wherever a method loads it and returns it straight
 * away, and answers how many such returns there were. A provider's `get()` does, and so does one
 * case of the method Redex made of the app's shared strings, which answers the string for a number
 * and is called for this one from wherever the app wants it. Only that case changes.
 */
private fun BytecodePatchContext.wrapDefaultAddressAnswers(): Int {
    val sites = mutableListOf<Pair<Pair<ClassDef, Method>, List<Int>>>()
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val returns = (1 until instructions.size).filter { index ->
                val load = instructions[index - 1]
                val answer = instructions[index]
                answer.opcode == Opcode.RETURN_OBJECT &&
                    (load.opcode == Opcode.CONST_STRING || load.opcode == Opcode.CONST_STRING_JUMBO) &&
                    load.getReference<StringReference>()?.string == LOGGING_URL &&
                    (load as OneRegisterInstruction).registerA == (answer as OneRegisterInstruction).registerA
            }
            if (returns.isNotEmpty()) sites += (classDef to method) to returns
        }
    }
    sites.forEach { (where, returns) ->
        val method = mutableClassDefBy(where.first).findMutableMethodOf(where.second)
        returns.asReversed().forEach { index ->
            val register = (method.getInstruction(index) as OneRegisterInstruction).registerA
            method.addInstructions(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $ENDPOINT
                    move-result-object v$register
                """,
            )
        }
    }
    return sites.sumOf { it.second.size }
}

/**
 * Sends each address this method returns through the extension, last return first, since an insert
 * moves every later index. Each goes in at the return's own label, so a branch to it runs it too.
 */
private fun MutableMethod.wrapEveryReturn() {
    val returns = implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    check(returns.isNotEmpty()) { "$definingClass->$name returns nothing to replace" }
    returns.asReversed().forEach { (index, register) ->
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$register .. v$register }, $ENDPOINT
                move-result-object v$register
            """,
        )
    }
}

/**
 * Sends the analytics address the MQTT settings read to the extension, right after it's read:
 * the first result after the `analytics_endpoint` key. Answers null when that went in, or why not.
 */
private fun MutableMethod.wrapAnalyticsSetting(): String? {
    val instructions = implementation!!.instructions.toList()
    val key = indexOfFirstStringInstruction("analytics_endpoint")
    val read = (key until instructions.size).firstOrNull { instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: return "$definingClass->$name never reads analytics_endpoint's value"
    val register = (instructions[read] as OneRegisterInstruction).registerA
    addInstructions(
        read + 1,
        """
            invoke-static/range { v$register .. v$register }, $ENDPOINT
            move-result-object v$register
        """,
    )
    return null
}
