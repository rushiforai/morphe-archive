package app.twoeno.patches.kleinanzeigen.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.twoeno.patches.shared.Constants.COMPATIBILITY_KLEINANZEIGEN
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.replaceReturnedObjects

private const val SOCIAL_SHARE_UTILS_CLASS = "Lebk/util/SocialShareUtils;"
private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/kleinanzeigen/SanitizeSharingLinksPatch;"

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Removes the tracking parameters (utm_*) from shared listing and profile links.",
) {
    compatibleWith(COMPATIBILITY_KLEINANZEIGEN)

    extendWith(EXTENSION)

    execute {
        val shareUtils = mutableClassDefByOrNull(SOCIAL_SHARE_UTILS_CLASS)
            ?: throw PatchException("Could not find $SOCIAL_SHARE_UTILS_CLASS")

        val urlBuilders = shareUtils.methods.filter { method ->
            method.name in setOf("buildSharingUrl", "buildSharingProfileUrl") &&
                method.returnType == "Ljava/lang/String;" &&
                method.implementation != null
        }
        if (urlBuilders.isEmpty()) throw PatchException("Could not find the sharing url builders")

        urlBuilders.forEach {
            it.replaceReturnedObjects("$EXTENSION_CLASS->sanitize(Ljava/lang/String;)Ljava/lang/String;")
        }
    }
}
