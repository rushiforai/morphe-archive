package fr.josselinonduty.snapchat.core

import app.morphe.patcher.patch.resourceXml
import fr.josselinonduty.snapchat.snapResourcePatch

// The extension (registered by the signature-spoof component factory, so it runs before any
// Snapchat code and needs no obfuscated anchor) shows the dialog on the first visible activity,
// login or main. It only acts when this meta-data flag is present, so disabling the patch disables it.
private const val FLAG = "fr.josselinonduty.snapchat.disclaimer"

val disclaimerPatch = snapResourcePatch(
    name = "Show disclaimer",
    description = "Shows a one-time warning before the login screen: Snapchat has historically been " +
        "unfriendly to modified apps, so only use accounts you do not care about.",
) {
    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.elements("application").first()
            app.appendChild("meta-data") {
                setAttribute("android:name", FLAG)
                setAttribute("android:value", "true")
            }
        }
    }
}
