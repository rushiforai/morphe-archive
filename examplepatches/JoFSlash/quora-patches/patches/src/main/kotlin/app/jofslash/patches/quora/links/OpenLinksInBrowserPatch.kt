package app.jofslash.patches.quora.links

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/OpenLinksInBrowserPatch;"

internal object StartCustomTabFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/callbacks/OpenUrlMessage\$OpenUrlMessageSync;",
    name = "startCustomTab",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

@Suppress("unused")
val openLinksInBrowserPatch = bytecodePatch(
    name = "Open links in browser",
    description = "Opens links to other websites in your default browser instead of an in-app browser tab.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        registerSetting("openLinksInBrowser", "Open links in browser")
        StartCustomTabFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1, p2 }, $EXTENSION_CLASS->openInBrowser(Landroid/content/Context;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :custom_tab
                return-void
                :custom_tab
                nop
            """
        )
    }
}
