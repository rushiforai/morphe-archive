package app.ahmedyarub.patches.x.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.returnEarly

@Suppress("unused")
val customSharingDomainPatch = bytecodePatch(
    name = "Custom sharing domain",
    description = "Shares and copies links with another domain, such as fxtwitter.com, in place of x.com.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val domain by stringOption(
        key = "domain",
        default = "fxtwitter.com",
        title = "Domain",
        description = "The domain shared links point at, without https://.",
        required = true,
    )

    execute {
        val host = domain!!.trim().removePrefix("https://").removePrefix("http://").trimEnd('/')
        if (host.isEmpty() || host.contains('/') || host.contains('"')) throw PatchException("Invalid domain: $domain")

        SharingDomainExtensionFingerprint.method.returnEarly(host)

        fun transform(register: String) = """
            invoke-static { $register }, $LINKS_CLASS->transformShareText(Ljava/lang/String;)Ljava/lang/String;
            move-result-object $register
        """

        // The intent every text share is built with, and the share sheet's copy, which puts the
        // link on the clipboard without building an intent.
        ShareTextIntentFingerprint.method.addInstructions(0, transform("p0"))
        ShareSheetCopyLinkFingerprint.method.addInstructions(0, transform("p1"))
    }
}
