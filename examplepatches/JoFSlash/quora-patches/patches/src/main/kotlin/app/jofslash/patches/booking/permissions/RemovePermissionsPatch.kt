package app.jofslash.patches.booking.permissions

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Takes [permissions] out of the manifest. The app asks for each of them while it runs and copes
 * with a no, so without them it acts as if you had said no.
 */
private fun ResourcePatchContext.removePermissions(permissions: Set<String>) {
    document("AndroidManifest.xml").use { document ->
        val found = mutableSetOf<String>()
        val elements = document.getElementsByTagName("uses-permission")
        for (i in elements.length - 1 downTo 0) {
            val element = elements.item(i) as Element
            val name = element.getAttribute("android:name")
            if (name in permissions) {
                element.parentNode.removeChild(element)
                found += name
            }
        }
        if (found.isEmpty()) throw PatchException("Couldn't find any of $permissions in the manifest")
    }
}

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the screen recording detection permission (used only by an anti-fraud " +
            "fingerprinting library) and calendar access (used only to add a flight to your calendar).",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        removePermissions(
            setOf(
                // FingerprintJS only: it registers a screen recording callback as one more signal
                // about your phone, and does without it when the permission is missing.
                "android.permission.DETECT_SCREEN_RECORDING",
                // "Add to calendar" after a flight booking. Attractions add events through the
                // calendar app instead, which needs no permission.
                "android.permission.READ_CALENDAR",
                "android.permission.WRITE_CALENDAR",
            )
        )
    }
}

@Suppress("unused")
val removeMicrophoneAccessPatch = resourcePatch(
    name = "Remove microphone access",
    description = "Removes the microphone permission. Voice input in messages (the microphone button when " +
            "you write to a property) stops working.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        removePermissions(setOf("android.permission.RECORD_AUDIO"))
    }
}
