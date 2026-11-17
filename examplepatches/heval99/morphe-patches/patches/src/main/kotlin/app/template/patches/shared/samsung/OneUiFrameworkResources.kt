// Based on bearinmindcat/morphe-patches (GPL-3.0) @ 5f79152, patches/src/main/kotlin/org/ungoogled/patches/samsung/OneUiFrameworkResources.kt.
// Modified for Heval's Morphe Patches on 2026-11-13: package renamed, unused resource-adding helpers removed, comments reworded.

package app.template.patches.shared.samsung

import app.morphe.patcher.patch.BytecodePatchContext

/**
 * Sends the app's Resources.getIdentifier calls through [runtime]'s static getIdentifier(Resources, String, String,
 * String). Samsung apps look up resources that only One UI's framework has (package "android") by name and use the
 * answer unchecked: off One UI the lookup answers 0, and using 0 throws (Resources$NotFoundException). The runtime
 * answers a lookup of such a resource with the app's own "oneui_<name>" stand-in where the app has one; every other
 * lookup answers as Android does. Returns the calls moved.
 */
internal fun BytecodePatchContext.redirectOneUiFrameworkLookups(runtime: String): Int = redirectCalls(
    runtime,
    mapOf("Landroid/content/res/Resources;" to setOf("getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I")),
)
