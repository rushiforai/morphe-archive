package app.anghami.patches.lyrics

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceNull
import app.anghami.patches.core.forceTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Opens the synced lyrics screen to accounts that the app does not consider
 * entitled to it.
 *
 * Four guards are neutralised: the account capability check that gates the
 * lyrics entry points, the account-state getter that fills in the free-lyrics
 * flag, the API response error check that rejects restricted lyrics payloads,
 * and the lyrics controller getter that supplies the bottom paywall button
 * (which is made to yield nothing). A fifth hook is installed on OkHttp URL
 * resolution so that lyrics requests are rewritten by the bundled extension
 * before they leave the app.
 */
@Suppress("unused")
val syncedLyricsUnlockPatch = bytecodePatch(
    name = "Unlock Full Lyrics",
    description = "Enables full synced lyrics display and removes paywall banners on song lyrics.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        LyricsEnabledSignature.method.forceTrue()

        GetLyricsFreeEnabledSignature.method.forceTrue()

        LyricsResponseIsErrorSignature.method.forceFalse()

        LyricsUnlockButtonSignature.method.forceNull()

        OkHttpRequestUrlSignature.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/anghamiplus/extension/LyricsUrlHook;->getUrl(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lokhttp3/HttpUrl;
                return-object v0
            """
        )
    }
}

/** Account getter that decides whether the lyrics entry point is available. */
object LyricsEnabledSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "lyricsEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** Proto-backed getter that populates the local free-lyrics account flag. */
object GetLyricsFreeEnabledSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getLyricsfreeenabled",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** Error flag of the lyrics API response wrapper. */
object LyricsResponseIsErrorSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/api/response/LyricsResponse;",
    name = "isError",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

/** Accessor for the upsell button model shown under the lyrics list. */
object LyricsUnlockButtonSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/lyrics/LyricsEpoxyController;",
    name = "getLyricsUnlockButton",
    parameters = listOf(),
)

/**
 * OkHttp URL accessor hooked so the bundled extension can rewrite the session
 * token carried by lyrics requests and obtain untruncated synced lyrics.
 */
object OkHttpRequestUrlSignature : Fingerprint(
    definingClass = "Lokhttp3/Request;",
    name = "url",
    returnType = "Lokhttp3/HttpUrl;",
    parameters = listOf(),
)
