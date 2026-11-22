package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val BASE_VIDEO_FRAGMENT = "Lcom/ss/android/ugc/aweme/tv/base/BaseVideoFragment;"
private const val AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val COMMENT = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val COMMENT_HOLDER = "Lcom/ss/android/ugc/aweme/tv/comment/fragment/b\$a;"
private const val TRANSLATE = "Lapp/template/extension/extension/TranslateComments;"
private const val TRANSLATE_MENU = "Lapp/template/extension/extension/TranslateCommentsMenu;"
private const val CALL_SERVER_INTERCEPTOR = "Lcom/bytedance/retrofit2/CallServerInterceptor;"
private const val RAW_RESPONSE = "Lcom/bytedance/retrofit2/b/d;"
private const val RETROFIT_METRICS = "Lcom/bytedance/retrofit2/v;"

private const val MORE = "Lcom/ss/android/ugc/aweme/tv/feed/fragment/moremenu/"
private const val MENU_ITEM = "${MORE}a;"
private const val MENU_HOLDER = "${MORE}b\$a;"
private const val MORE_FRAGMENT = "${MORE}MoreMenuFragmentV2;"
private const val MENU_OBSERVERS = "${MORE}MoreMenuFragmentV2\$b;"
private const val MENU_LIST = "Ljava/util/List;"

/** Adds comment and caption translation to the TV client. */
@Suppress("unused")
val translateCommentsPatch = bytecodePatch(
    name = "Translate comments and captions",
    description = "Adds TikTok's Aa translation panel to More — always translate comments, a do-not-translate list, the target language and also-translate-caption — and renders a dimmed \"Translated from …\" line under translated comments and above translated captions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val observers = mutableClassDefBy(MENU_OBSERVERS).methods
        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_LIST)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $TRANSLATE_MENU->addToMenu(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        mutableClassDefBy(MENU_HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $TRANSLATE_MENU->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $TRANSLATE_MENU->clicked(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // After the stock holder has written the original comment text, paint a cached translation
        // or queue this comment for the next batch.
        val bind = mutableClassDefBy(COMMENT_HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(COMMENT)
        }
        bind.addInstructions(
            bind.instructions.lastIndex,
            """
                invoke-static {p0, p1}, $TRANSLATE->bindComment(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // The comment model has no language field, so the source language for the attribution
        // line is read off the raw comment/reply body the app already intercepts.
        mutableClassDefBy(CALL_SERVER_INTERCEPTOR).methods.first {
            it.name == "a" && it.parameterTypes == listOf(RAW_RESPONSE, RETROFIT_METRICS)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $TRANSLATE->scan(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Every full-screen play funnels through this method; it is where the caption and its
        // author line are bound, and it gives the translation code the post's desc and language.
        mutableClassDefBy(BASE_VIDEO_FRAGMENT).methods.first {
            it.name == "playVideo" && it.parameterTypes == listOf(AWEME)
        }.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $TRANSLATE->onPlay(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
