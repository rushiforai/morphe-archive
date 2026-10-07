package app.twoeno.patches.spotify.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.replaceReturnedObjects
import app.twoeno.patches.spotify.PendragonFetchMessageListRequestFingerprint
import app.twoeno.patches.spotify.PendragonFetchMessageRequestFingerprint

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
