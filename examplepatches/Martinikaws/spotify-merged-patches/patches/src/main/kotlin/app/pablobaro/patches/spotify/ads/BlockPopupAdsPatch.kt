package app.pablobaro.patches.spotify.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.EXTENSION
import app.pablobaro.patches.shared.EXTENSION_PACKAGE
import app.pablobaro.patches.shared.replaceReturnedObjects
import app.pablobaro.patches.spotify.PendragonFetchMessageListRequestFingerprint
import app.pablobaro.patches.spotify.PendragonFetchMessageRequestFingerprint

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/BlockPopupAdsPatch;"

@Suppress("unused")
val blockPopupAdsPatch = bytecodePatch(
    name = "Block popup ads",
    description = "Blocks fullscreen promotions (\"Pendragon\" messages) shown when opening the app.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    finalize {
        // Runs in finalize, after every Spicetify patch has executed: those verify Spotify's
        // classes against pinned hashes, which must see the classes before this patch edits them.
        val requests = listOf(PendragonFetchMessageRequestFingerprint, PendragonFetchMessageListRequestFingerprint)
            .flatMap { it.matchAllOrNull().orEmpty() }
            .filter { it.method.returnType.startsWith("L") }
        if (requests.isEmpty()) throw PatchException("Could not find the Pendragon message requests")

        requests.forEach {
            it.method.replaceReturnedObjects("$EXTENSION_CLASS->replaceRequest(Ljava/lang/Object;)Ljava/lang/Object;")
        }
    }
}
