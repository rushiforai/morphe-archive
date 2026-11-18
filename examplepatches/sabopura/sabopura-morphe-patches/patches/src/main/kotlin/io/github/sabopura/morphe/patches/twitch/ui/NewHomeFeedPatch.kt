package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.enableTwitchFeature
import io.github.sabopura.morphe.patches.twitch.support.softHook
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val BLOB_MODULE = "Lcom/facebook/react/modules/blob/BlobModule;"
private const val WRITABLE_MAP = "Lcom/facebook/react/bridge/WritableMap;"
private const val NEW_HOME_FEED = "Lio/github/sabopura/morphe/extension/twitch/app/NewHomeFeed;"

/**
 * The type of the handler that hands a whole response body to the React Native screens: React
 * Native keeps the field's name, R8 renames its type.
 */
internal fun blobResponseHandlerType(blobModule: ClassDef): String =
    blobModule.fields.filter { it.name == "networkingResponseHandler" }
        .uniqueContract("New home feed: BlobModule.networkingResponseHandler").type

/** The handler's one method that takes the body's bytes and wraps them for JavaScript. */
internal fun blobResponseMethod(handler: ClassDef): Method = handler.methods.filter {
    it.implementation != null && it.returnType == WRITABLE_MAP && it.parameterTypes.map { p -> p.toString() } == listOf("[B")
}.uniqueContract("New home feed: blob response method in ${handler.type}")

private fun BytecodePatchContext.hookNewHomeResponses(): Boolean {
    if (classDefByOrNull(RN_HOME_RESOLVER) == null) {
        Logger.getLogger("SabopuraTwitch.NewHomeFeed").info("No React Native home in this version")
        return false
    }
    val handler = classDefBy(blobResponseHandlerType(classDefBy(BLOB_MODULE)))
    val target = blobResponseMethod(handler)
    mutableClassDefBy(handler).methods.single { it.name == target.name && it.parameterTypes == target.parameterTypes && it.returnType == target.returnType }
        .addInstructions(0, """
            invoke-static {p1}, $NEW_HOME_FEED->rewrite([B)[B
            move-result-object p1
        """)
    Logger.getLogger("SabopuraTwitch.NewHomeFeed").info("New home feed: hooked ${handler.type}->${target.name}")
    return true
}

/**
 * Lets the settings that hide parts of Following reach the React Native home that Twitch 31.9.0 and
 * later show signed-in phones. That home draws itself from data its JavaScript fetches, so a hidden
 * part is emptied in the responses on their way to it. Twitch 30.7.2 has no such home.
 */
internal val newHomeFeedHook = bytecodePatch(
    description = "Lets the settings hide parts of Following on the React Native home.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    extendWith(TWITCH_EXTENSION)
    var hooked = false
    execute {
        hooked = false
        // Without the hook the settings still work on the classic home.
        softHook("New home feed") { hooked = hookNewHomeResponses() }
    }
    finalize { if (hooked) enableTwitchFeature("NEW_HOME_FEED") }
}
