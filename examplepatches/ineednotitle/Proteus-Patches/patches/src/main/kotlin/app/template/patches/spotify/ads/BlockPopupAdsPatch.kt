package app.template.patches.spotify.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.spotify.shared.PendragonFetchMessageListRequestFingerprint
import app.template.patches.spotify.shared.PendragonFetchMessageRequestFingerprint
import app.template.patches.spotify.shared.replaceReturnedObjects

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyPopupAdFilter;"

// Blocks the fullscreen promotions ("Pendragon" messages) shown when opening
// the app.
//
// The popup is requested through RxJava Singles that end in
// onErrorReturn(fallback). The patch wraps the returned request object with the
// extension, which replaces it with Single.just(fallback): the fallback is
// emitted directly and no message is ever fetched. Requests that do not carry
// a fallback (different chain shapes) are returned unchanged.
//
// Fail-safe: only `apply` methods constructing FetchMessage(Request|ListRequest)
// are touched, and the extension passes every unrecognized chain through.

@Suppress("unused")
val spotifyBlockPopupAdsPatch = bytecodePatch(
    name = "Block popup ads",
    description = "Blocks fullscreen promotions (\"Pendragon\" messages) shown when opening the app.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val requests = listOf(
            PendragonFetchMessageRequestFingerprint,
            PendragonFetchMessageListRequestFingerprint,
        ).flatMap { it.matchAllOrNull().orEmpty() }
            .filter { it.method.returnType.startsWith("L") }

        if (requests.isEmpty()) {
            throw PatchException("Could not find the Pendragon message requests")
        }

        requests.forEach { match ->
            match.method.replaceReturnedObjects(
                "$EXTENSION_CLASS->replaceRequest(Ljava/lang/Object;)Ljava/lang/Object;",
            )
        }
    }
}
