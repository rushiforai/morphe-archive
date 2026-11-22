package app.drbushytop.patches.relay.subreddits

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val REDDIT_API_CLASS = "Lreddit/news/oauth/reddit/RedditApi;"
private const val RANDOM_SUBREDDIT_CLASS = "Lapp/drbushytop/extension/relay/RandomSubreddit;"

/**
 * `LinksFragmentRecyclerView#q1(HashMap)`: builds the request for a subreddit feed, ending in
 * `RedditApi#getListing(path, query)`. For the Random and RandomNSFW menu items the path is
 * `r/random` or `r/randNSFW`.
 */
internal object SubredditFeedRequestFingerprint : Fingerprint(
    definingClass = "Lreddit/news/listings/links/LinksFragmentRecyclerView;",
    returnType = "Lrx/Observable;",
    parameters = listOf("Ljava/util/HashMap;"),
    filters = listOf(
        methodCall(definingClass = REDDIT_API_CLASS, name = "getListing"),
    ),
)

@Suppress("unused")
val restoreRandomSubredditsPatch = bytecodePatch(
    name = "Restore random subreddits",
    description = "Makes the Random Subreddit and RandomNSFW Subreddit menu items work again. " +
        "Reddit removed r/random and r/randnsfw, so Relay now picks one itself: Random from " +
        "Reddit's popular subreddits, RandomNSFW from a list of NSFW subreddits bundled with the " +
        "patch. Refresh picks another one, as before.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)

    execute {
        SubredditFeedRequestFingerprint.method.apply {
            val index = SubredditFeedRequestFingerprint.instructionMatches.last().index
            // getListing's receiver, path and query, passed on unchanged. move-result-object
            // after it keeps taking the returned Observable.
            val call = getInstruction(index)
            val registers = when (call) {
                is FiveRegisterInstruction -> "v${call.registerC}, v${call.registerD}, v${call.registerE}"
                is RegisterRangeInstruction -> "v${call.startRegister} .. v${call.startRegister + 2}"
                else -> throw PatchException("Unexpected getListing call: ${call.opcode}")
            }
            val invoke = if (call is RegisterRangeInstruction) "invoke-static/range" else "invoke-static"
            replaceInstruction(
                index,
                "$invoke { $registers }, $RANDOM_SUBREDDIT_CLASS->getListing(" +
                    "${REDDIT_API_CLASS}Ljava/lang/String;Ljava/util/Map;)Lrx/Observable;",
            )
        }
    }
}
