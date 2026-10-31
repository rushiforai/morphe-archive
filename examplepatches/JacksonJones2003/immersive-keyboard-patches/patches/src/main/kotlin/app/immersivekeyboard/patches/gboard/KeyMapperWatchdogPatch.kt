package app.immersivekeyboard.patches.gboard

import app.immersivekeyboard.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SHIZUKU_PERMISSION = "moe.shizuku.manager.permission.API_V23"
private const val WATCHDOG_CLASS = "app.immersivekeyboard.extension.KeyMapperWatchdog"
private const val AUTHORITY_RESOURCE = "immersive_keyboard_shizuku_authority"

// Shizuku looks for a provider at "<package>.shizuku". Both names are declared since this patch
// can't tell whether Package Rename will apply. They're kept in a string because Package Rename
// refuses to run if the manifest has a value it doesn't know that contains the package name.
private const val AUTHORITIES =
    "dev.jason.com.google.android.inputmethod.latin.shizuku;" +
        "com.google.android.inputmethod.latin.shizuku"

/**
 * Declares the Shizuku permission and the provider Shizuku sends its binder to. The provider
 * also starts the watchdog when Gboard's process starts.
 */
private val keyMapperWatchdogManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        document("res/values/strings.xml").use { document ->
            document.documentElement.appendChild(document.createElement("string").apply {
                setAttribute("name", AUTHORITY_RESOURCE)
                setAttribute("translatable", "false")
                textContent = AUTHORITIES
            })
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as Element

            manifest.insertBefore(
                document.createElement("uses-permission").apply {
                    setAttributeNS(ANDROID_NS, "android:name", SHIZUKU_PERMISSION)
                },
                application
            )

            application.appendChild(document.createElement("provider").apply {
                setAttributeNS(ANDROID_NS, "android:name", WATCHDOG_CLASS)
                setAttributeNS(ANDROID_NS, "android:authorities", "@string/$AUTHORITY_RESOURCE")
                setAttributeNS(ANDROID_NS, "android:enabled", "true")
                setAttributeNS(ANDROID_NS, "android:exported", "true")
                setAttributeNS(ANDROID_NS, "android:multiprocess", "false")
                setAttributeNS(
                    ANDROID_NS,
                    "android:permission",
                    "android.permission.INTERACT_ACROSS_USERS_FULL"
                )
            })
        }
    }
}

@Suppress("unused")
val keyMapperWatchdogPatch = bytecodePatch(
    name = "Key Mapper Watchdog",
    description = "Uses Shizuku to restart Key Mapper's Expert Mode system bridge when it " +
        "stops, or holds no input device, which shows up in Key Mapper as \"Trigger device " +
        "not connected!\". Expert Mode stopped on purpose comes back too. Gboard asks for Shizuku access the first time it runs. Lets Gboard " +
        "run shell commands, so only use it if you want this.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(keyMapperWatchdogManifestPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Everything happens in the provider added by the manifest patch.
    }
}
