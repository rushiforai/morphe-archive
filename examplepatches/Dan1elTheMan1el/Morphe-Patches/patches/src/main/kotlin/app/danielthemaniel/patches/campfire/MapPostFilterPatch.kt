package app.danielthemaniel.patches.campfire

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val LOCAL_SERVER = "Lcom/getcapacitor/WebViewLocalServer;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val EXT = "Lapp/danielthemaniel/patches/campfire/extension/MapPostFilter;"

/**
 * Adds a filter button above the map's locate-me button to show only posts from the past
 * 24 h / 12 h / 1 h / 10 min.
 *
 *  - JSInjector.getScriptString(): page script with the button/menu, and a network hook that
 *    adds the post timestamp to the map's GraphQL requests and records it per map object.
 *  - WebViewLocalServer.handleLocalRequest(): the map's getAllRenderableMapObjects() (fresh
 *    results + the app's own map-object cache) is rewritten as the JS is served so older posts
 *    are hidden at render time, cached ones included.
 *
 * Works for OTA web bundles too, since both hooks are in Capacitor rather than the app's JS.
 */
@Suppress("unused")
val mapPostFilterPatch = bytecodePatch(
    name = "Map post age filter",
    description = "Adds a filter button on the map to only show posts from the past 24 hours, " +
        "12 hours, hour or 10 minutes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    dependsOn(sharedPermissionFixPatch, campfireExtensionPatch)

    execute {
        mutableClassDefBy(JS_INJECTOR).methods.firstOrNull {
            it.name == "getScriptString" && it.parameterTypes.isEmpty() && it.returnType == STRING
        }.orScriptStringNotFound()
            .filterReturns("$EXT->appendScript($STRING)$STRING")

        mutableClassDefBy(LOCAL_SERVER).methods.firstOrNull {
            it.name == "handleLocalRequest" && it.returnType == RESPONSE
        }?.filterReturns("$EXT->filterResponse($RESPONSE)$RESPONSE")
            ?: throw PatchException("WebViewLocalServer.handleLocalRequest() not found")
    }
}
