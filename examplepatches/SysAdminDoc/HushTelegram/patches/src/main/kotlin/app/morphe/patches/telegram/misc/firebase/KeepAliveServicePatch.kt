/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.origName
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val KEEP_ALIVE = "$EXTENSION_PACKAGE/misc/KeepAlive;"
internal const val KEEP_ALIVE_START = "$KEEP_ALIVE->start(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;"
internal const val KEEP_ALIVE_STARTED = "$KEEP_ALIVE->started(Landroid/app/Service;Landroid/content/Intent;)V"
internal const val NOTIFICATIONS_SERVICE = "Lorg/telegram/messenger/NotificationsService;"
internal const val START_SERVICE = "Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;"
internal const val REMOTE_MESSAGING_PERMISSION = "android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING"
private const val APPLICATION_LOADER = "Lorg/telegram/messenger/ApplicationLoader;"
private const val NOTIFICATIONS_SERVICE_NAME = "org.telegram.messenger.NotificationsService"
private const val REMOTE_MESSAGING = "remoteMessaging"
private const val REMOTE_MESSAGING_FLAG = 0x200

/**
 * Lets the Keep-Alive Service run in front on Android 14 and newer: its manifest entry gets the
 * remote messaging type next to Telegram's data sync, and the manifest asks for that type's
 * permission when Telegram's own doesn't (the Play build). Data sync alone would stop after six
 * hours a day on Android 15. A manifest without the service is left as it is.
 */
internal val keepAliveManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            keepAliveManifest(document)?.let { patchLog.warning("Repair Firebase push registration: $it.") }
        }
    }
}

/** Adds the type and permission, or says why nothing changed. */
internal fun keepAliveManifest(document: Document): String? {
    val services = document.getElementsByTagName("service")
    val service = (0 until services.length).map { services.item(it) as Element }
        .singleOrNull { it.getAttribute("android:name") == NOTIFICATIONS_SERVICE_NAME }
        ?: return "the manifest has no single Keep-Alive Service"
    val applications = document.getElementsByTagName("application")
    if (applications.length != 1) return "the manifest has no single application element"
    service.setAttribute("android:foregroundServiceType", withRemoteMessaging(service.getAttribute("android:foregroundServiceType")))
    val declared = document.getElementsByTagName("uses-permission")
    if ((0 until declared.length).none { (declared.item(it) as Element).getAttribute("android:name") == REMOTE_MESSAGING_PERMISSION }) {
        val permission = document.createElement("uses-permission").apply { setAttribute("android:name", REMOTE_MESSAGING_PERMISSION) }
        document.documentElement.insertBefore(permission, applications.item(0))
    }
    return null
}

/** The service's types with remote messaging added, written the way they came: by name, or as a number. */
internal fun withRemoteMessaging(types: String): String {
    val parts = types.split('|').map { it.trim() }.filter { it.isNotEmpty() }
    if (parts.isEmpty()) return REMOTE_MESSAGING
    if (REMOTE_MESSAGING in parts) return types
    val numbers = parts.map { if (it.startsWith("0x")) it.substring(2).toIntOrNull(16) else it.toIntOrNull() }
    if (numbers.all { it != null }) {
        val flags = numbers.fold(0) { all, it -> all or it!! }
        return if (flags and REMOTE_MESSAGING_FLAG != 0) types else "0x%08x".format(flags or REMOTE_MESSAGING_FLAG)
    }
    return "$types|$REMOTE_MESSAGING"
}

/**
 * The start that keeps Telegram's own connection alive: startPushService hands its intent to the
 * extension instead of startService, in the same registers and inside the same catch, and the
 * service tells the extension about each start before Telegram's own onStartCommand runs. A build
 * where either is gone keeps Telegram's stock start and loses only this part (#50, #54).
 */
internal val keepAliveServicePatch = bytecodePatch {
    dependsOn(settingsPatch, telegramExtensionPatch, keepAliveManifestPatch)

    execute {
        requireStatusMethod("keepAliveRunning")
        val plan = resolveKeepAlive()
        if (plan.missing != null) {
            patchLog.warning("Repair Firebase push registration: ${plan.missing}. The patch goes on without keeping the Keep-Alive Service running.")
            return@execute
        }
        plan.apply()
        enableCapability("keepAliveRunning")
    }
}

/** startPushService and its one startService call, then the service's onStartCommand. [missing] is why this build can't have them. */
internal class KeepAlivePlan(val start: MutableMethod?, val at: Int, val onStart: MutableMethod?, val missing: String?) {
    fun apply() {
        val call = start!!.implementation!!.instructions[at] as FiveRegisterInstruction
        start.replaceInstruction(at, "invoke-static {v${call.registerC}, v${call.registerD}}, $KEEP_ALIVE_START")
        onStart!!.addInstructionsAtControlFlowLabel(0, "invoke-static {p0, p1}, $KEEP_ALIVE_STARTED")
    }
}

internal fun BytecodePatchContext.resolveKeepAlive(): KeepAlivePlan {
    // The extension ships with the patch, so a hook that changed shape is a broken build, not a new Telegram.
    controlHook(KEEP_ALIVE, "start", listOf("Landroid/content/Context;", "Landroid/content/Intent;"), "Landroid/content/ComponentName;")
    controlHook(KEEP_ALIVE, "started", listOf("Landroid/app/Service;", "Landroid/content/Intent;"), "V")
    fun missing(why: String) = KeepAlivePlan(null, -1, null, why)

    val loader = tgMutableClassDefByOrNull(APPLICATION_LOADER) ?: return missing("ApplicationLoader is missing")
    val start = loader.methods.filter {
        it.origName == "startPushService" && it.parameterTypes.isEmpty() && it.returnType == "V" &&
            AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.singleOrNull() ?: return missing("startPushService is missing or ambiguous")
    val calls = start.controlBody().withIndex().filter { (_, it) -> it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == START_SERVICE }
    val call = calls.singleOrNull() ?: return missing("startPushService has no single startService call")
    if ((call.value as FiveRegisterInstruction).registerCount != 2) return missing("startPushService's startService call changed")

    val service = tgMutableClassDefByOrNull(NOTIFICATIONS_SERVICE) ?: return missing("the Keep-Alive Service is missing")
    if (service.superclass != "Landroid/app/Service;") return missing("the Keep-Alive Service is no longer a plain Service")
    val onStart = service.methods.singleOrNull {
        it.name == "onStartCommand" && it.parameterTypes == listOf("Landroid/content/Intent;", "I", "I") &&
            it.returnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    } ?: return missing("the Keep-Alive Service has no onStartCommand of its own")
    return KeepAlivePlan(start, call.index, onStart, null)
}

/** Throws unless the plan found everything, for the fixture tests. */
internal fun KeepAlivePlan.required(): KeepAlivePlan {
    if (missing != null) throw PatchException("Keep-Alive Service: $missing")
    return this
}
