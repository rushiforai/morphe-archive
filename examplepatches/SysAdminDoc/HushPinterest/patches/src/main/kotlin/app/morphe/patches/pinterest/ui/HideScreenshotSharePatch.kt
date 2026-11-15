/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.returnEarlyWhen
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "No screenshot share menu"
internal const val SCREENSHOT_HOOK = "$UI_HOOKS->hideScreenshotShare()Z"
internal const val SCREEN_CAPTURE_CALLBACK = "Landroid/app/Activity\$ScreenCaptureCallback;"
internal const val CONTENT_OBSERVER = "Landroid/database/ContentObserver;"

/**
 * Pinterest hears about a screenshot three ways, and each one ends in its "Save or share Pin" sheet:
 * Home's screenshot manager, which signs up for one of the other two; Android 14's screen capture
 * callback, which a pin closeup also signs up for by itself under its own experiment; and watchers
 * on the phone's photos that pick out a new file named like a screenshot and post an event about
 * it. The manager stays out of both, and the callback and every receiver of that event do nothing
 * while the switch is on. Everything stays registered, so Pinterest's own unregister calls still
 * find what they registered.
 */
@Suppress("unused")
val hideScreenshotSharePatch = bytecodePatch(
    name = PATCH,
    description = "Stops Pinterest from popping up sharing suggestions after you take a screenshot. Screenshots " +
        "still work as usual. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideScreenshotShare")
        requireStatusMethod("screenshotShare")
        val listeners = listOf<BytecodePatchContext.() -> String?>(
            { screenshotManager() }, { screenCaptureCallbacks() }, { screenshotEventReceivers() },
        )
        handleTargets(PATCH, "screenshot listeners", listeners) { it() }
        enableCapability("screenshotShare")
        enableStatus("hideScreenshotShare")
    }
}

/** Home's manager method that signs up for a screenshot, through the callback or the watcher. */
private fun BytecodePatchContext.screenshotManager(): String? {
    val found = methodsWithString("sg_android_new_screenshot_api_14").filter {
        it.returnType == "V" && it.parameterTypes.size == 2 &&
            it.parameterTypes.last().toString() == "Landroidx/fragment/app/FragmentActivity;" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    if (found.size != 1) return "Home's screenshot manager (${found.size} candidates, expected one)"
    val manager = mutable(found.single())
    if (manager.localRegisterCount() < 1) return leftAlone("Home's screenshot manager", listOf("${manager.definingClass}->${manager.name}"))
    manager.returnEarlyWhen("Screenshot manager", SCREENSHOT_HOOK, "return-void")
    return null
}

/**
 * Every `onScreenCaptured()` in Pinterest's own code. In 14.44.0 one lambda class serves Home's
 * manager and both pin closeups, picking its owner by a number it was built with.
 */
private fun BytecodePatchContext.screenCaptureCallbacks(): String? {
    val owners = mutableListOf<String>()
    classDefForEach { owner ->
        if (!owner.type.startsWith(EXTENSION_ROOT) && SCREEN_CAPTURE_CALLBACK in owner.interfaces &&
            owner.methods.any { it.isScreenCaptured() }
        ) owners += owner.type
    }
    if (owners.isEmpty()) return "the screen capture callback (no class implements Activity.ScreenCaptureCallback)"
    val tight = mutableListOf<String>()
    for (type in owners) {
        mutableClassDefBy(type).methods.filter { it.isScreenCaptured() }.forEach {
            if (it.localRegisterCount() < 1) tight += "$type->${it.name}"
            else it.returnEarlyWhen("Screen capture callback", SCREENSHOT_HOOK, "return-void")
        }
    }
    return leftAlone("the screen capture callback", tight)
}

private fun Method.isScreenCaptured() =
    name == "onScreenCaptured" && returnType == "V" && parameterTypes.isEmpty() && implementation != null

/**
 * Everything that hears the photos watchers' screenshot event. In 14.44.0 two watchers read the
 * newest image's path and age, one of them a case of a class R8 merged with unrelated observers, and
 * both post the same event to Pinterest's bus. Home, both pin closeups, boards and two Pear screens
 * each receive it, so the receivers are guarded and the watchers themselves are left alone.
 */
private fun BytecodePatchContext.screenshotEventReceivers(): String? {
    val watchers = methodsWithString("date_added").filter {
        it.name == "onChange" && it.returnType == "V" && it.parameters() == listOf("Z", "Landroid/net/Uri;") &&
            "_data" in it.strings() && classDefByOrNull(it.definingClass)?.superclass == CONTENT_OBSERVER
    }
    if (watchers.isEmpty()) return "the screenshot event (no photos watcher reads date_added)"
    val events = watchers.flatMap { watcher ->
        watcher.implementation?.instructions?.filter { it.opcode == Opcode.NEW_INSTANCE }
            ?.map { ((it as ReferenceInstruction).reference as TypeReference).type }.orEmpty()
    }.filter { type -> PLATFORM.none { type.startsWith(it) } && classDefByOrNull(type) != null }.toSet()
    if (events.size != 1) return "the screenshot event (the photos watchers post ${events.size} types, expected one)"
    val event = events.single()
    val receivers = mutableListOf<Pair<String, Method>>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filter { it.receives(event) }.forEach { receivers += owner.type to it }
    }
    if (receivers.isEmpty()) return "the screenshot event's receivers (nothing takes $event)"
    val tight = mutableListOf<String>()
    for ((type, receiver) in receivers) {
        val method = mutableClassDefBy(type).methods.single { it.name == receiver.name && it.receives(event) }
        if (method.localRegisterCount() < 1) tight += "$type->${method.name}"
        else method.returnEarlyWhen("Screenshot event receiver", SCREENSHOT_HOOK, "return-void")
    }
    return leftAlone("the screenshot event's receivers", tight)
}

/**
 * The guard needs one local for the hook's answer. A method R8 squeezed down to its parameters has
 * none, so it is left as Pinterest wrote it and named in the patch log, while the rest are guarded.
 */
private fun leftAlone(what: String, tight: List<String>) =
    if (tight.isEmpty()) null else "$what (${tight.joinToString()} left as is, with no free register for the guard)"

private val PLATFORM = listOf("Ljava/", "Ljavax/", "Lkotlin/", "Landroid/", "Landroidx/")

private fun Method.receives(event: String) = returnType == "V" && implementation != null && !name.startsWith("<") &&
    parameterTypes.size == 1 && parameterTypes.single().toString() == event
