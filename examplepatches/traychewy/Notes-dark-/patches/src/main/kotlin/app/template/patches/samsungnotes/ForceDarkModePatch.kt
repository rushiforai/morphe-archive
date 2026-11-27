package app.template.patches.samsungnotes

import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_SAMSUNG_NOTES
import app.template.patches.shared.hookApplicationOnCreate

@Suppress("unused")
val forceDarkModePatch = patch(
    name = "Force dark mode",
    description = "Always shows Samsung Notes in dark mode, whatever the system theme is.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_NOTES)

    extendWith("extensions/extension.mpe")

    execute {
        hookApplicationOnCreate(
            extensionMethod = "Lapp/template/extension/samsungnotes/ForceDarkModePatch;" +
                "->apply(Landroid/content/Context;)V",
            fallbackApplication = null,
        )
    }
}
