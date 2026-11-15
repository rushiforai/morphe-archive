package app.drbushytop.patches.relay.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `MediaUrlFetcher#G(HttpUrl)`: Relay's "is this a plain image link" check. It only accepts a
 * last path segment ending in `.jpg` or `.png` (either case). Both link handlers
 * (`UrlLinkClickManager` and `WebAndCommentsFragment`) ask `MediaUrlFetcher#l`, which calls this,
 * before deciding between the image viewer and the browser.
 */
internal object IsPlainImageUrlFingerprint : Fingerprint(
    definingClass = "Lreddit/news/previews/MediaUrlFetcher;",
    returnType = "Z",
    parameters = listOf("L"),
    strings = listOf(".jpg", ".JPG", ".png", ".PNG"),
)

/**
 * `DataComment#g(JSONObject, int, String, RedditAccount)`, which fills a comment from its JSON.
 * It reads `media_metadata` and discards it, then builds the comment's text.
 */
internal object DataCommentFromJsonFingerprint : Fingerprint(
    definingClass = "Lreddit/news/data/DataComment;",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", "I", "Ljava/lang/String;", "L"),
    strings = listOf("media_metadata", "body_html"),
    filters = listOf(
        string("media_metadata"),
        methodCall(definingClass = "Lorg/json/JSONObject;", name = "optJSONObject"),
    ),
)

/**
 * `DataComment#c()`, which turns the comment's HTML into the text the comment list shows,
 * through `RedditUtils#j(String, boolean, String)`, and stores it in a field.
 */
internal object DataCommentBuildTextFingerprint : Fingerprint(
    definingClass = "Lreddit/news/data/DataComment;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lreddit/news/utils/RedditUtils;",
            returnType = "Landroid/text/Spanned;",
            parameters = listOf("Ljava/lang/String;", "Z", "Ljava/lang/String;"),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = "this", type = "Landroid/text/Spanned;"),
    ),
)

/** `CommentsAdapter#getView`, the thread view's comment list. */
internal object CommentsAdapterGetViewFingerprint : Fingerprint(
    definingClass = "Lreddit/news/adapters/CommentsAdapter;",
    name = "getView",
    returnType = "Landroid/view/View;",
    parameters = listOf("I", "Landroid/view/View;", "Landroid/view/ViewGroup;"),
)

/**
 * `MediaUrlFetcher#O(HttpUrl)`: Relay's "is this a video file" check (path ends in .mp4 or
 * .webm). A link it accepts opens in Relay's video player, which has playback controls.
 */
internal object IsVideoFileUrlFingerprint : Fingerprint(
    definingClass = "Lreddit/news/previews/MediaUrlFetcher;",
    returnType = "Z",
    parameters = listOf("L"),
    strings = listOf(".mp4", ".MP4", ".webm", ".WEBM"),
)

/** `DataStory#D(JSONObject, Handler, RedditAccount, SharedPreferences)`, which fills a post from its JSON. */
internal object DataStoryFromJsonFingerprint : Fingerprint(
    definingClass = "Lreddit/news/data/DataStory;",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", "Landroid/os/Handler;", "L", "Landroid/content/SharedPreferences;"),
    strings = listOf("over_18", "domain"),
)

/** `DataStory#G(JSONObject)`, which refreshes a post already shown from the comments' JSON. */
internal object DataStoryUpdateFromJsonFingerprint : Fingerprint(
    definingClass = "Lreddit/news/data/DataStory;",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;"),
    strings = listOf("selftext_html", "selftext"),
)

/**
 * `ActiveTextView2#l(MotionEvent)`, the comment text's "is this touch on a link" check, called
 * when a touch starts. It finds the line under the touch, then the link at that point on it.
 */
internal object CommentTouchOnLinkFingerprint : Fingerprint(
    definingClass = "Lreddit/news/listings/common/views/ActiveTextView2;",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/text/Layout;", name = "getOffsetForHorizontal"),
    ),
)
