package app.danielthemaniel.patches.campfire

import app.morphe.patcher.patch.bytecodePatch

private const val EXT = "Lapp/danielthemaniel/patches/campfire/extension/LiveChat;"

/**
 * Live chat messages come over Niantic's push gateway WebSocket. The app retries a dropped
 * connection at most twice, and Android routinely kills sockets of backgrounded or sleeping apps,
 * so an open chat ends up on a dead socket and only shows new messages after re-entering it.
 * The extension wraps WebSocket (push gateway only) to reconnect and re-subscribe transparently.
 * Works for OTA web bundles too, since it hooks Capacitor rather than the app's JS.
 */
@Suppress("unused")
val liveChatPatch = bytecodePatch(
    name = "Live chat reconnect",
    description = "Keeps chats updating live: reconnects the real-time message connection when it " +
        "drops (e.g. after the app was in the background) and restores the chat's subscriptions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    dependsOn(sharedPermissionFixPatch, campfireExtensionPatch)

    execute {
        mutableClassDefBy(JS_INJECTOR).methods.firstOrNull {
            it.name == "getScriptString" && it.parameterTypes.isEmpty() && it.returnType == STRING
        }.orScriptStringNotFound()
            .filterReturns("$EXT->appendScript($STRING)$STRING")
    }
}
