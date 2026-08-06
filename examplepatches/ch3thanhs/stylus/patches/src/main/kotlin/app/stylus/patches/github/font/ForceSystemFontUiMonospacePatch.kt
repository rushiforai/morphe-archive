package app.stylus.patches.github.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.stylus.patches.github.shared.Constants.COMPATIBILITY_GITHUB

private const val EXTENSION_CLASS =
    "Lapp/stylus/extension/github/patches/ForceSystemFontPatch;"

private val forceSystemFontGithubUiMonospaceCssPatch = resourcePatch(
    name = "Force system font ui monospace web content (GitHub)",
    description = "Internal dependency patch for webview CSS override used by Force system font (UI monospace).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)

    execute {
        val fontCssFile = get("assets").resolve("webview").resolve("font.css")
        fontCssFile.writeText(
            """@font-face {
    font-family: inter;
    src: local("sans-serif");
}

.markdown-body {
    font-family: sans-serif;
}

pre,
code,
tt,
kbd,
samp {
    font-family: sans-serif;
}
""".trimIndent() + "\n"
        )
    }
}

@Suppress("unused")
val forceSystemFontGithubUiMonospacePatch = bytecodePatch(
    name = "Force system font (including monospace) (GitHub)",
    description = "Renders GitHub UI and monospace text using the device system UI font.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    dependsOn(forceSystemFontGithubUiMonospaceCssPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ResourcesCompatGetFontFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1, p3 }, $EXTENSION_CLASS->getSystemTypefaceWithUiMonospace(Landroid/content/Context;II)Landroid/graphics/Typeface;
                move-result-object v0
                if-eqz v0, :original
                return-object v0
                :original
                nop
            """
        )
    }
}
