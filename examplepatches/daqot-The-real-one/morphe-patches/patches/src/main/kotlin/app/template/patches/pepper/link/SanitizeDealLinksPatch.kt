package app.template.patches.pepper.link

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER

private const val EXTENSION_CLASS = "Lapp/template/extension/pepper/SanitizeDealLinksPatch;"

@Suppress("unused")
val sanitizeDealLinksPatch = bytecodePatch(
    name = "Sanitize deal links",
    description = "Opens the store page of a deal directly, instead of through " +
        "redirects that track the click and add affiliate links.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PEPPER)

    extendWith("extensions/extension.mpe")

    execute {
        // "Get deal" opens https://www.pepper.nl/visit/thread/1372472 with the user id,
        // device id and analytics parameters added. It redirects to Pepper's affiliate redirect,
        // which then adds affiliate parameters. The API does not include the link to the store,
        // so the extension looks it up in the first redirect, and opens it instead.
        mapOf(
            OpenLinkInCustomTabFingerprint to "InCustomTab",
            OpenLinkInBrowserFingerprint to "InBrowser",
        ).forEach { (fingerprint, target) ->
            val opener = fingerprint.method
            val openerReference = "${opener.definingClass}->${opener.name}(" +
                "${opener.parameterTypes.joinToString("")})${opener.returnType}"
            val returnHandled = if (opener.returnType == "V") "return-void" else "return v0"

            opener.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->openLink$target(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :open
                    $returnHandled
                    :open
                    nop
                """
            )

            // Let the extension open the link it looked up with the same method.
            Fingerprint(
                definingClass = EXTENSION_CLASS,
                name = "open$target",
            ).method.addInstructions(
                0,
                "invoke-static { p0, p1 }, $openerReference"
            )
        }
    }
}
