package app.onlynazril.patches.tiktok.commentcopy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Anchors for the copy-comment patch.
 *
 * Nothing here is matched by name: the classes that carry these shapes are obfuscated and rename
 * with every build (`X.0jPl`/`X.0lTB`/`X.0mPJ` on 47.0.3, `X.19oe`/`X.1Gn0`/`X.1Pvb` on 47.1.4).
 * What does not move is the shape:
 *
 *  - the **builder** the comment sheet's Copy goes through: a static method taking the name prefix,
 *    the text and the text's emoji spans, and returning a `ClipData` it builds with
 *    `ClipData.newPlainText`. It carries the `"copy_label"` label and nothing else in the bundle
 *    has that triple with that label.
 *  - the **plain-text clipboard helper** every other copy route calls: `void (String tag, String
 *    text, Context, Cert)` wrapping `ClipData.newPlainText`. Its signature is the framework's plus
 *    ByteDance's own cert type, and the label arrives as an argument, so the shape is the anchor.
 *
 * The helper's callers that also read `Comment#getText` and `Comment#getUser` are the comment-copy
 * menus; the patch finds them by the pair of calls rather than by name.
 */
internal const val COMMENT = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
internal const val CLIP_DATA = "Landroid/content/ClipData;"

internal fun MethodReference.isCommentGetText(): Boolean =
    definingClass == COMMENT &&
        name == "getText" &&
        parameterTypes.isEmpty() &&
        returnType == "Ljava/lang/String;"

internal fun MethodReference.isCommentGetUser(): Boolean =
    definingClass == COMMENT && name == "getUser" && parameterTypes.isEmpty()

/**
 * The one builder the comment sheet's Copy flows through: static, `(String, String, List) ->
 * ClipData`, carrying `"copy_label"`, and building with `ClipData.newPlainText`.
 */
internal object CommentClipDataBuilderFingerprint : Fingerprint(
    returnType = CLIP_DATA,
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;"),
    strings = listOf("copy_label"),
    filters = listOf(
        methodCall(
            definingClass = CLIP_DATA,
            name = "newPlainText",
            parameters = listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;"),
            returnType = CLIP_DATA,
        ),
    ),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * The plain-text clipboard helper: `void (String, String, Context, Cert)` wrapping
 * `ClipData.newPlainText`. The label is the first argument, so the shape is what is matched.
 */
internal object ClipboardTextHelperFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/content/Context;",
        "Lcom/bytedance/bpea/basics/Cert;",
    ),
    filters = listOf(
        methodCall(
            definingClass = CLIP_DATA,
            name = "newPlainText",
            parameters = listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;"),
            returnType = CLIP_DATA,
        ),
    ),
)
