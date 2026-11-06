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

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.tumblr.ads.LIVERAMP_STARTUP_GUARDS
import app.morphe.patches.tumblr.ads.guardStartups
import app.morphe.patches.tumblr.flags.featureSwitchHookPatch
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
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

/** Checks the status flags first, so a broken extension refuses before the manifest is changed. */
internal val analyticsPreflightPatch = bytecodePatch {
    dependsOn(settingsPatch, tumblrExtensionPatch)
    execute {
        requireStatusMethod("disableAnalytics")
        requireStatusMethod("analyticsFlags")
        requireStatusMethod("liveRampStartup")
        LIVERAMP_STARTUP_GUARDS.forEach { requireExtensionHook(PATCH, it.hook) }
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
 * feature switch table, so they answer off once Tumblr restarts, and keeps LiveRamp's own
 * manifest provider from starting its identity SDK at launch ([LIVERAMP_STARTUP_GUARDS]).
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = PATCH,
    description = "Turns off Firebase crash reports and Google's analytics collection, and Tumblr's own tracking" +
        " and ad measurement once it restarts. LiveRamp's identity tracker doesn't start when Tumblr launches." +
        " The Firebase and Google part stays until you patch again without it. On by default. Turn it off in" +
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
        enableStatus("disableAnalytics")
    }
}
