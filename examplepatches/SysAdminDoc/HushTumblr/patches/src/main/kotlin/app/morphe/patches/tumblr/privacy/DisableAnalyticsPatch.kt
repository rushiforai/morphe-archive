/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.tumblr.ads.LIVERAMP_STARTUP_GUARDS
import app.morphe.patches.tumblr.ads.SDK_STARTUP
import app.morphe.patches.tumblr.ads.guardStartups
import app.morphe.patches.tumblr.flags.featureSwitchHookPatch
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.patchLog
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.readsAfter
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PATCH = "Disable analytics"
internal const val FIREBASE_DEACTIVATED = "firebase_analytics_collection_deactivated"

/**
 * The documented application metadata switches the manifest edit writes, with the value each gets.
 * Firebase reads them before application.onCreate, so they also cover initialization. Firebase
 * Messaging, Installations and sign-in metadata are never in this list.
 */
internal val ANALYTICS_MANIFEST_FLAGS: Map<String, String> = linkedMapOf(
    FIREBASE_DEACTIVATED to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_analytics_storage" to "false",
    "google_analytics_default_allow_ad_storage" to "false",
    "google_analytics_default_allow_ad_user_data" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

/**
 * Adds each flag in [ANALYTICS_MANIFEST_FLAGS], or sets an existing one in place: it keeps its other
 * attributes and children, loses android:resource and gets the value. A repeated flag refuses
 * before anything is changed.
 */
internal fun deactivateFirebaseAnalytics(document: Document) {
    val application = document.getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("AndroidManifest.xml has no application element")
    val metadata = application.childNodes.let { nodes -> (0 until nodes.length).mapNotNull { nodes.item(it) as? Element } }
        .filter { it.tagName == "meta-data" }
    val existing = ANALYTICS_MANIFEST_FLAGS.keys.associateWith { name -> metadata.filter { it.getAttribute("android:name") == name } }
    existing.entries.firstOrNull { it.value.size > 1 }?.let {
        throw PatchException("AndroidManifest.xml has repeated ${it.key} metadata")
    }
    for ((name, value) in ANALYTICS_MANIFEST_FLAGS) {
        val entry = existing.getValue(name).singleOrNull() ?: document.createElement("meta-data").also { application.appendChild(it) }
        entry.setAttribute("android:name", name)
        entry.removeAttribute("android:resource")
        entry.setAttribute("android:value", value)
    }
}

internal const val CRASH_REPORTS_HOOK = "$SDK_STARTUP->crashReports(Landroid/content/Context;Z)Z"
private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

/** The key Tumblr's launch setup tags crash reports with, a few steps after it turns collection on. */
internal const val CRASHLYTICS_SETUP_KEY = "Device_Year_Class"

private fun Instruction.setsCrashlyticsCollection(): Boolean = opcode == Opcode.INVOKE_VIRTUAL &&
    methodRef()?.let {
        it.definingClass == CRASHLYTICS && it.name == "setCrashlyticsCollectionEnabled" && it.hasShape(listOf("Z"), "V")
    } == true

/**
 * Whether the application parameter still holds what Tumblr passed when the instruction at [at]
 * runs. Tumblr reuses that register later in the method, so only the code that can run first counts.
 */
private fun Method.holdsApplicationAt(at: Int): Boolean = try {
    requireParameterIntact(PATCH, 0, listOf(at))
    true
} catch (overwritten: PatchException) {
    patchLog.warning(overwritten.message.orEmpty())
    false
}

/**
 * Tumblr's launch setup, a static method taking the application, turns Crashlytics collection on
 * every launch, and that call outranks the manifest flag. This hands the value it passes to
 * [CRASH_REPORTS_HOOK] first. A build without Crashlytics has nothing to keep off. The answer goes
 * back into the value's own register, so nothing after the call may read that register again. A
 * setup the hook doesn't fit is left alone and answers false, so the capability stays off and the
 * rest of the patch still works. Throws only when the extension lacks the hook.
 */
internal fun BytecodePatchContext.hookCrashReports(): Boolean {
    requireExtensionHook(PATCH, CRASH_REPORTS_HOOK)
    if (classDefByOrNull(CRASHLYTICS) == null) {
        patchLog.info("$PATCH: this build has no Crashlytics, so it has nothing to keep off")
        return true
    }
    val setups = appClassesWithString(CRASHLYTICS_SETUP_KEY).flatMap { it.methods }.filter { method ->
        method.isStatic() && method.hasShape(listOf("Landroid/app/Application;"), "V") &&
            CRASHLYTICS_SETUP_KEY in method.strings() &&
            method.instructionList().count { it.setsCrashlyticsCollection() } == 1
    }
    val setup = setups.singleOrNull()
    val body = setup?.instructionList().orEmpty()
    val at = body.indexOfFirst { it.setsCrashlyticsCollection() }
    val call = body.getOrNull(at) as? FiveRegisterInstruction
    val application = setup?.parameterRegisterNumber(0) ?: -1
    val value = call?.registerD ?: -1
    val fits = call != null && call.registerCount == 2 && application < 16 && value < 16 && value != application &&
        (mutableOf(setup!!).implementation!!.instructions[at] as BuilderInstruction).location.labels.isEmpty() &&
        setup.holdsApplicationAt(at) && setup.readsAfter(at, value).isEmpty()
    if (!fits) {
        patchLog.warning(
            "$PATCH: Tumblr's Crashlytics launch setup has ${setups.size} matches or a shape the hook doesn't fit," +
                " so Crashlytics keeps the value Tumblr gives it",
        )
        return false
    }
    mutableOf(setup).addInstructions(at, """
        invoke-static { v$application, v$value }, $CRASH_REPORTS_HOOK
        move-result v$value
    """)
    return true
}

/** Checks the status flags first, so a broken extension refuses before the manifest is changed. */
internal val analyticsPreflightPatch = bytecodePatch {
    dependsOn(settingsPatch, tumblrExtensionPatch)
    execute {
        requireStatusMethod("disableAnalytics")
        requireStatusMethod("analyticsFlags")
        requireStatusMethod("liveRampStartup")
        requireStatusMethod("crashReports")
        LIVERAMP_STARTUP_GUARDS.forEach { requireExtensionHook(PATCH, it.hook) }
        requireExtensionHook(PATCH, CRASH_REPORTS_HOOK)
    }
}

internal val disableFirebaseAnalyticsManifestPatch = resourcePatch {
    dependsOn(analyticsPreflightPatch)
    execute { document("AndroidManifest.xml").use(::deactivateFirebaseAnalytics) }
}

/**
 * Tumblr 46.5.0.109 carries Firebase Crashlytics and the analytics connector, and declares none of
 * these switches itself, so the edit adds them all. That half is a manifest change with no switch
 * in the app. The other half is the switch: it claims Tumblr's own tracking flags (LiveRamp, Open
 * Measurement, Moat, its exposure, network, performance and supply logging) in the extension's
 * feature switch table, so they answer off once Tumblr restarts, keeps LiveRamp's own manifest
 * provider from starting its identity SDK at launch ([LIVERAMP_STARTUP_GUARDS]), and keeps
 * Tumblr's launch setup from turning Crashlytics collection back on over the manifest flag
 * ([hookCrashReports]).
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = PATCH,
    description = "Turns off Firebase and Google's analytics collection, and Tumblr's own tracking" +
        " and ad measurement once it restarts. LiveRamp's identity tracker doesn't start when Tumblr launches," +
        " and Crashlytics crash reports stay off while the switch is on." +
        " The Firebase and Google analytics part stays until you patch again without it. On by default. Turn it off in" +
        " Tumblr settings > HushTumblr > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, tumblrExtensionPatch, disableFirebaseAnalyticsManifestPatch, featureSwitchHookPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("analyticsFlags")
        enableCapability("analyticsFlags")
        if (guardStartups(PATCH, LIVERAMP_STARTUP_GUARDS)) enableCapability("liveRampStartup")
        if (hookCrashReports()) enableCapability("crashReports")
        enableStatus("disableAnalytics")
    }
}
