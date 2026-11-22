package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val BASE_VIDEO_FRAGMENT = "Lcom/ss/android/ugc/aweme/tv/base/BaseVideoFragment;"
private const val AWE_ME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val CALL_SERVER_INTERCEPTOR = "Lcom/bytedance/retrofit2/CallServerInterceptor;"
private const val RAW_RESPONSE = "Lcom/bytedance/retrofit2/b/d;"
private const val RETROFIT_METRICS = "Lcom/bytedance/retrofit2/v;"
private const val IMAGE_POST = "Lapp/template/extension/extension/ImagePost;"
private const val IMAGE_STORE = "Lapp/template/extension/extension/ImageStore;"

/** Renders TikTok Lite image posts instead of a black player. */
@Suppress("unused")
val renderImagePostsPatch = bytecodePatch(
    name = "Render Lite image posts",
    description = "Shows the pictures of a TikTok Lite image post instead of a black player, which the TV app cannot render at all.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val playVideo = mutableClassDefBy(BASE_VIDEO_FRAGMENT).methods.first {
            it.name == "playVideo" && it.parameterTypes == listOf(AWE_ME)
        }

        // Both registers are parameters of an instance method, so no register is claimed.
        playVideo.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $IMAGE_POST->onPlay(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val wrapResponse = mutableClassDefBy(CALL_SERVER_INTERCEPTOR).methods.first {
            it.name == "a" && it.parameterTypes == listOf(RAW_RESPONSE, RETROFIT_METRICS)
        }

        // `p1` is the raw response, whose body is still unread at this point.
        wrapResponse.addInstructions(
            0,
            """
                invoke-static {p1}, $IMAGE_STORE->scan(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
