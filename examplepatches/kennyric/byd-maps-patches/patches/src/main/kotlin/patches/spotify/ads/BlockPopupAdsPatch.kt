package patches.spotify.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import patches.spotify.COMPATIBILITY_SPOTIFY
import patches.spotify.shared.EXTENSION
import patches.spotify.shared.EXTENSION_PACKAGE
import patches.spotify.shared.replaceReturnedObjects
import patches.spotify.PendragonFetchMessageListRequestFingerprint
import patches.spotify.PendragonFetchMessageRequestFingerprint

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/BlockPopupAdsPatch;"

@Suppress("unused")
val blockPopupAdsPatch = bytecodePatch(
    name = "Block popup ads",
    description = "Blocks fullscreen promotions (\"Pendragon\" messages) shown when opening the app.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        val requests = listOf(PendragonFetchMessageRequestFingerprint, PendragonFetchMessageListRequestFingerprint)
            .flatMap { it.matchAllOrNull().orEmpty() }
            .filter { it.method.returnType.startsWith("L") }
        if (requests.isEmpty()) throw PatchException("Could not find the Pendragon message requests")

        requests.forEach {
            it.method.replaceReturnedObjects("$EXTENSION_CLASS->replaceRequest(Ljava/lang/Object;)Ljava/lang/Object;")
        }
    }
}
