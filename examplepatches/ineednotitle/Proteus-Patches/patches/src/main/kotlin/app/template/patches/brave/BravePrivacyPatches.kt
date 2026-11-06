// SPDX-License-Identifier: GPL-3.0-only
package app.template.patches.brave

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.BRAVE_COMPATIBILITY

// Target ideas adapted from kveld9/kveld-morphe-patches, GPL-3.0,
// revision 8afd78f0b57964b9ae9a0a387bdd4ae157345707 (Brave 1.98.63).
// These patches are opt-in pending testing on the actual Brave APK and device.

internal fun MutableMethod.braveReturnBoolean(value: Boolean) {
    if (returnType != "Z") throw PatchException("Brave: expected boolean return in $definingClass->$name")
    val body = implementation ?: throw PatchException("Brave: $definingClass->$name has no bytecode")
    if (body.registerCount < 1) throw PatchException("Brave: $definingClass->$name has no usable register")
    addInstructions(0, "const/4 v0, ${if (value) "0x1" else "0x0"}\nreturn v0")
}

internal fun MutableMethod.braveReturnNull() {
    if (!(returnType.startsWith("L") || returnType.startsWith("[")))
        throw PatchException("Brave: expected reference return in $definingClass->$name")
    val body = implementation ?: throw PatchException("Brave: $definingClass->$name has no bytecode")
    if (body.registerCount < 1) throw PatchException("Brave: $definingClass->$name has no usable register")
    addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
}

internal fun MutableMethod.braveReturnVoid() {
    if (returnType != "V" || implementation == null)
        throw PatchException("Brave: expected implemented void method in $definingClass->$name")
    addInstructions(0, "return-void")
}

@Suppress("unused")
val braveBlockMotionSensorsPatch = bytecodePatch(
    name = "Block Motion Sensors",
    description = "Attempts to disable Chromium's Android sensor provider; may also block ambient sensors. Requires device validation.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        val availability = Fingerprint(
            definingClass = "Lorg/chromium/device/sensors/PlatformSensorProvider;",
            name = "hasSensorType", returnType = "Z", parameters = listOf("I"),
        ).methodOrNull
        val create = Fingerprint(
            definingClass = "Lorg/chromium/device/sensors/PlatformSensor;",
            name = "create", returnType = "Lorg/chromium/device/sensors/PlatformSensor;",
            parameters = listOf("Lorg/chromium/device/sensors/PlatformSensorProvider;", "I", "J"),
        ).methodOrNull
        if (availability == null && create == null) throw PatchException("Brave: no known sensor hooks found")
        availability?.braveReturnBoolean(false)
        create?.braveReturnNull()
    }
}

@Suppress("unused")
val braveStopContentCapturePatch = bytecodePatch(
    name = "Stop Text Sharing with System",
    description = "Disables Chromium's OnscreenContentProvider content-capture gate, not every possible text-sharing mechanism.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        Fingerprint(
            definingClass = "Lorg/chromium/components/content_capture/OnscreenContentProvider;",
            name = "shouldCapture", returnType = "Z", parameters = listOf("Ljava/lang/String;"),
        ).method.braveReturnBoolean(false)
    }
}

@Suppress("unused")
val braveBlockRatingsPatch = bytecodePatch(
    name = "Block Popups & Ratings",
    description = "Disables the identified rating and Brave Ads signup eligibility checks; other dialogs can still appear.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        val rating = Fingerprint(returnType = "Z", strings = listOf("brave_rate_dont_show_again", "qa_force_rate_dialog")).methodOrNull
        val ads = Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/dialogs/BraveAdsSignupDialog;",
            name = "a", returnType = "Z", parameters = emptyList(),
        ).methodOrNull
        if (rating == null && ads == null) throw PatchException("Brave: no known rating or Ads signup gates found")
        rating?.braveReturnBoolean(false)
        ads?.braveReturnBoolean(false)
    }
}

@Suppress("unused")
val braveStopPromoNotificationsPatch = bytecodePatch(
    name = "Stop Promo Notifications",
    description = "Disables identified Chromium tips and retention notification entry points; other notifications may remain.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        val tips = Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/notifications/scheduler/NotificationSchedulerTask;",
            name = "schedule", returnType = "V", parameters = listOf("J", "J"),
        ).methodOrNull?.takeIf { it.implementation != null }
        val retention = Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/notifications/retention/RetentionNotificationPublisher;",
            name = "onReceive", returnType = "V", parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
        ).methodOrNull?.takeIf { it.implementation != null }
        if (tips == null && retention == null) throw PatchException("Brave: no known promo notification entry points found")
        tips?.braveReturnVoid()
        retention?.braveReturnVoid()
    }
}

@Suppress("unused")
val braveSkipWelcomePatch = bytecodePatch(
    name = "Skip Welcome Screens",
    description = "Reports the first-run flow complete; may skip essential consent, search or setup screens.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        Fingerprint(returnType = "Z", parameters = emptyList(), strings = listOf("first_run_flow"))
            .method.braveReturnBoolean(true)
    }
}

@Suppress("unused")
val braveStopBackgroundSyncPatch = bytecodePatch(
    name = "Stop Background Wakeups",
    description = "Disables the identified Chromium background-sync scheduler gate; other wakeups remain and site background sync can break.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        Fingerprint(returnType = "Z", parameters = emptyList(), strings = listOf("BackgroundSync.LaunchTask.PlayServicesAvailable"))
            .method.braveReturnBoolean(true)
    }
}

@Suppress("unused")
val bravePreserveLastTabPatch = bytecodePatch(
    name = "Preserve last active tab",
    description = "Disables the identified new-tab opening-screen override after inactivity. Does not prevent tab unloading under memory pressure.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    execute {
        Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/ChromeTabbedActivity;", returnType = "Z",
            parameters = emptyList(), strings = listOf("brave_new_tab_page_opening_screen", "brave_show_recent_tabs_snackbar"),
        ).method.braveReturnBoolean(false)
    }
}
