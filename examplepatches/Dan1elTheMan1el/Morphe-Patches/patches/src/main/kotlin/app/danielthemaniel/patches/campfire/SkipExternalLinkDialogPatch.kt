package app.danielthemaniel.patches.campfire

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val LOCAL_SERVER = "Lcom/getcapacitor/WebViewLocalServer;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val EXT = "Lapp/danielthemaniel/patches/campfire/extension/ExternalLinks;"

/**
 * Campfire asks for confirmation before opening any external link (links in posts, chats,
 * Discord buttons, ...). The confirm provider's onClickUrl is rewritten as the JS is served so it
 * opens the link exactly as the dialog's CONTINUE button would, without showing the dialog.
 * Works for OTA web bundles too, since the hook is in Capacitor rather than the app's JS.
 */
@Suppress("unused")
val skipExternalLinkDialogPatch = bytecodePatch(
    name = "Skip external link dialog",
    description = "Opens external links right away instead of asking for confirmation first.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    dependsOn(sharedPermissionFixPatch, campfireExtensionPatch)

    execute {
        mutableClassDefBy(LOCAL_SERVER).methods.firstOrNull {
            it.name == "handleLocalRequest" && it.returnType == RESPONSE
        }?.filterReturns("$EXT->filterResponse($RESPONSE)$RESPONSE")
            ?: throw PatchException("WebViewLocalServer.handleLocalRequest() not found")
    }
}
