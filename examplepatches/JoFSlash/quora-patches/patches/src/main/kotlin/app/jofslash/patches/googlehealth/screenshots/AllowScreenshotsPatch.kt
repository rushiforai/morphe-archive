package app.jofslash.patches.googlehealth.screenshots

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.jofslash.patches.googlehealth.shared.Redirect
import app.jofslash.patches.googlehealth.shared.redirectCalls
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/googlehealth/AllowScreenshotsPatch;"

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Lets you take screenshots and record the screen on every screen of the app. Some " +
            "screens, such as sharing a health summary, block them.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    extendWith("extensions/googlehealth.mpe")

    execute {
        val changed = redirectCalls(
            listOf(
                Redirect(
                    "Landroid/view/Window;", "addFlags", listOf("I"), "V",
                    EXTENSION_CLASS, "addFlags",
                ),
                Redirect(
                    "Landroid/view/Window;", "setFlags", listOf("I", "I"), "V",
                    EXTENSION_CLASS, "setFlags",
                ),
            )
        )
        if (changed == 0) throw PatchException("Found no window flag calls to change")
        Logger.getLogger("AllowScreenshots").info("Changed $changed window flag calls")
    }
}
