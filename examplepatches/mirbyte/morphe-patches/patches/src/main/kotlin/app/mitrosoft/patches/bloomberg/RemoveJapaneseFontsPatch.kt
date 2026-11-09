package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG

@Suppress("unused")
val removeJapaneseFontsPatch = resourcePatch(
    name = "Remove Japanese fonts",
    description = "Removes the NotoSansJP font files from assets/fonts to save space.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        listApkEntries("assets/fonts/")
            .filter {
                it.removePrefix("assets/fonts/").let { name ->
                    name.startsWith("NotoSansJP") && name.endsWith(".ttf") && '/' !in name
                }
            }
            .forEach(::delete)
    }
}
