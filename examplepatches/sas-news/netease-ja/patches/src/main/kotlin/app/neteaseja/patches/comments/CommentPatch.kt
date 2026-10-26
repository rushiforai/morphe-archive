package app.neteaseja.patches.comments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.neteaseja.patches.shared.Constants.COMPATIBILITY_NETEASE

private const val EXTENSION_CLASS = "Lapp/neteaseja/extension/CommentTranslator;"

/**
 * Fingerprints for onCreate methods of screens holding long Chinese prose
 * (comments, intros). The relevant screen classes are not obfuscated, so
 * these match by class name regardless of package. Each entry is tried in
 * order; missing ones are skipped.
 */
private object CommentActivityOnCreate : Fingerprint(
    definingClass = "/CommentActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;")
)

private object FoldCommentActivityOnCreate : Fingerprint(
    definingClass = "/FoldCommentActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;")
)

private object ArtistIntroActivityOnCreate : Fingerprint(
    definingClass = "/ArtistIntroActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;")
)

private object RcmdAlbumIntroActivityOnCreate : Fingerprint(
    definingClass = "/RcmdAlbumIntroActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;")
)

private object RcmdPlaylistIntroActivityOnCreate : Fingerprint(
    definingClass = "/RcmdPlaylistIntroActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;")
)

private val translatableScreenFingerprints = listOf(
    CommentActivityOnCreate,
    FoldCommentActivityOnCreate,
    ArtistIntroActivityOnCreate,
    RcmdAlbumIntroActivityOnCreate,
    RcmdPlaylistIntroActivityOnCreate
)

/**
 * Comment screen translator.
 *
 * Appends a call to the CommentTranslator extension at the end of
 * comment screen onCreate methods. The extension adds a floating "訳" button,
 * auto-translates visible Chinese comments once, and toggles between
 * original and translated text on tap.
 *
 * Version tolerance: if the activity is renamed in a future app version the
 * fingerprint simply does not match and the patch is skipped, leaving the
 * UI patch fully working.
 *
 * Note: translation uses a free anonymous MT API, so comment text leaves
 * the device. This patch is OFF by default (opt-in).
 */
@Suppress("unused")
val commentTranslatePatch = bytecodePatch(
    name = "コメント翻訳 (Comment translate)",
    description = "コメント画面や紹介画面に「訳」ボタンを追加し、表示中の中国語テキストを翻訳します。無料の匿名翻訳APIを使用するため文面が外部送信されます。",
    default = false
) {
    compatibleWith(COMPATIBILITY_NETEASE)

    extendWith("extensions/extension.mpe")

    execute {
        // Graceful skip keeps the UI patch usable even if comment
        // internals change in a future app version.
        val hooked = translatableScreenFingerprints.mapNotNull { it.methodOrNull }.onEach { onCreate ->
            // Run after the original onCreate body (just before return).
            // p0 is `this` (the Activity) in a non-static method.
            onCreate.addInstructions(
                onCreate.implementation!!.instructions.size - 1,
                """
                    invoke-static {p0}, $EXTENSION_CLASS->attach(Landroid/app/Activity;)V
                """
            )
        }
        if (hooked.isEmpty()) return@execute
    }
}
