package app.drbushytop.patches.relay.media

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val GIF_SOUND_CLASS = "Lapp/drbushytop/extension/relay/GifSound;"
private const val REDDIT_LINK_CLASS = "Lreddit/news/oauth/reddit/model/links/RedditLink;"
private const val MEDIA_URL_FETCHER_CLASS = "Lreddit/news/previews/MediaUrlFetcher;"

/**
 * `RedditLink#fetchMediaPreviews(MediaUrlFetcher, Scheduler)`. For a redgifs.com/watch link it
 * reads Relay's remote config flag `redgifs_api_enabled` (`RemoteConfigManageBase#e`). While the
 * flag is off, Relay plays Reddit's own copy of the clip (`preview.reddit_video_preview`), which
 * has no sound, instead of asking the Redgifs API for the original.
 */
internal object FetchMediaPreviewsFingerprint : Fingerprint(
    definingClass = REDDIT_LINK_CLASS,
    name = "fetchMediaPreviews",
    returnType = "V",
    parameters = listOf(MEDIA_URL_FETCHER_CLASS, "L"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = MEDIA_URL_FETCHER_CLASS,
            type = "Lreddit/news/remoteconfig/RemoteConfigManager;",
        ),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, name = "e", type = "Z"),
    ),
)

/**
 * The error handler of the load `fetchMediaPreviews` starts: it prints the error and falls back
 * to the post's thumbnails.
 */
internal object FetchMediaPreviewsErrorFingerprint : Fingerprint(
    definingClass = REDDIT_LINK_CLASS,
    name = "lambda\$fetchMediaPreviews\$2",
    returnType = "V",
    parameters = listOf(MEDIA_URL_FETCHER_CLASS, "Ljava/lang/Throwable;"),
)

private const val REDGIF_TOKEN_CLASS = "Lreddit/news/oauth/redgif/model/RedGifAccessToken;"

/**
 * `OAuthInterceptor#c(Request)`: adds `Authorization: <tokenType> <accessToken>` to a Redgifs API
 * request, from the token Relay's `RedGifManager` got with Relay's own API client. That token
 * now only gets each clip's embed page, not its video files (`urls.hd` and `urls.sd`).
 */
internal object RedgifsAuthorizationFingerprint : Fingerprint(
    definingClass = "Lreddit/news/oauth/interceptors/OAuthInterceptor;",
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = REDGIF_TOKEN_CLASS, name = "tokenType"),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = REDGIF_TOKEN_CLASS, name = "accessToken"),
    ),
)

/** `MediaUrlFetcher#v(RedGifResponse)`, which turns a Redgifs API response into the post's media. */
internal object RedgifsResponseFingerprint : Fingerprint(
    definingClass = MEDIA_URL_FETCHER_CLASS,
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Lreddit/news/oauth/redgif/model/RedGifResponse;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lreddit/news/oauth/redgif/model/Urls;", name = "hd"),
    ),
)

@Suppress("unused")
val fixGifSoundPatch = bytecodePatch(
    name = "Fix GIF sound",
    description = "Plays GIF videos from the site that hosts them, with sound, instead of Reddit's " +
        "silent copy. When the original can't be loaded, Reddit's copy plays as before.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)

    execute {
        FetchMediaPreviewsFingerprint.method.apply {
            val index = FetchMediaPreviewsFingerprint.instructionMatches.last().index
            // iget-boolean has a 4-bit destination, so the register fits move-result.
            val register = getInstruction<TwoRegisterInstruction>(index).registerA
            replaceInstruction(
                index,
                "invoke-static/range { p0 .. p0 }, $GIF_SOUND_CLASS->loadFromRedgifs(Ljava/lang/Object;)Z",
            )
            addInstruction(index + 1, "move-result v$register")
        }

        RedgifsAuthorizationFingerprint.method.apply {
            // Swap the header value for the temporary token, and send the User-Agent it was
            // issued to. Relay's OkHttp methods are taken from this method's own calls, so this
            // works whether or not Patcheddit has relocated OkHttp yet.
            val start = instructions.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == "Ljava/lang/StringBuilder;"
            }
            val toString = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == "Ljava/lang/StringBuilder;" && ref.name == "toString"
                    }
            }
            val addHeader = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL && (it as FiveRegisterInstruction).registerCount == 3
            }
            val removeHeader = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL && (it as FiveRegisterInstruction).registerCount == 2 &&
                    ((it as ReferenceInstruction).reference as MethodReference).definingClass != "Ljava/lang/StringBuilder;"
            }
            if (start < 0 || toString < start || addHeader < toString || removeHeader < 0 ||
                getInstruction(toString + 1).opcode != Opcode.MOVE_RESULT_OBJECT ||
                getInstruction(addHeader + 1).opcode != Opcode.MOVE_RESULT_OBJECT
            ) {
                throw PatchException("Unexpected code in Relay's Redgifs authorization")
            }
            val addCall = getInstruction<FiveRegisterInstruction>(addHeader)
            val builder = addCall.registerC
            val name = addCall.registerD
            val value = addCall.registerE
            val addRef = getInstruction<ReferenceInstruction>(addHeader).reference
            val removeRef = getInstruction<ReferenceInstruction>(removeHeader).reference

            addInstructions(
                addHeader + 2,
                """
                    const-string v$name, "User-Agent"
                    invoke-virtual { v$builder, v$name }, $removeRef
                    move-result-object v$builder
                    invoke-static { }, $GIF_SOUND_CLASS->redgifsUserAgent()Ljava/lang/String;
                    move-result-object v$value
                    invoke-virtual { v$builder, v$name, v$value }, $addRef
                    move-result-object v$builder
                """,
            )
            // The StringBuilder that read Relay's token goes; its move-result now takes ours.
            if (getInstruction<OneRegisterInstruction>(toString + 1).registerA != value) {
                throw PatchException("Unexpected register in Relay's Redgifs authorization")
            }
            removeInstructions(start, toString - start + 1)
            addInstruction(start, "invoke-static { }, $GIF_SOUND_CLASS->redgifsAuthorization()Ljava/lang/String;")
        }

        RedgifsResponseFingerprint.method.apply {
            val index = RedgifsResponseFingerprint.instructionMatches.last().index
            val register = getInstruction<TwoRegisterInstruction>(index).registerA
            addInstruction(
                index + 1,
                "invoke-static/range { v$register .. v$register }, $GIF_SOUND_CLASS->requireVideoUrl(Ljava/lang/String;)V",
            )
        }

        // p2 (the Throwable) comes back unchanged unless the post should be loaded again, so
        // Relay's own handling still sees it; no scratch register is needed.
        FetchMediaPreviewsErrorFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static { p0, p2 }, $GIF_SOUND_CLASS->retryWithRedditCopy(Ljava/lang/Object;Ljava/lang/Throwable;)Ljava/lang/Throwable;
                move-result-object p2
                if-nez p2, :original
                invoke-virtual { p0, p1 }, $REDDIT_LINK_CLASS->fetchMediaPreviews($MEDIA_URL_FETCHER_CLASS)V
                return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
