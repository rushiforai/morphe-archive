package app.template.patches.all

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.template.patches.shared.hookApplicationOnCreate

private const val EXTENSION_CLASS = "Lapp/template/extension/darkmode/ForceDarkModePatch;"

/** Name of the style the extension applies to every activity to allow auto-darkening. */
private const val FORCE_DARK_STYLE = "morphe_force_dark"

@Suppress("unused")
val forceDarkModeUniversalPatch = patch(
    name = "Force dark mode (any app)",
    description = "Shows the app in dark mode, whatever the system theme is. " +
        "Uses the app's own dark theme, and can auto-darken apps that don't have one.",
    // Universal patches must be off by default; turn it on per app in Morphe.
    default = false,
) {
    // No compatibleWith(): this patch can be applied to any app.

    extendWith("extensions/extension.mpe")

    val autoDarken by booleanOption(
        key = "autoDarken",
        default = true,
        title = "Auto-darken apps without a dark theme",
        description = "Lets Android invert the colours of light-only screens (Android 10+). " +
            "Turn off if an app's colours look wrong.",
    )

    execute {
        if (autoDarken == true) {
            // A style the extension applies on top of each activity's theme. Opened with
            // copy = false, so it only adds this style and leaves the app's own styles as they are.
            // (It must go in styles.xml: the resource encoder reads styles only from that file.)
            resourceXml("res/values/styles.xml", copy = false).use { styles ->
                styles.root.appendChild("style") {
                    setAttribute("name", FORCE_DARK_STYLE)
                    appendChild("item") {
                        setAttribute("name", "android:forceDarkAllowed")
                        text = "true"
                    }
                }
            }
        }

        hookApplicationOnCreate(
            extensionMethod = "$EXTENSION_CLASS->apply(Landroid/content/Context;)V",
            fallbackApplication = "app.template.extension.darkmode.ForceDarkApplication",
        )
    }
}
