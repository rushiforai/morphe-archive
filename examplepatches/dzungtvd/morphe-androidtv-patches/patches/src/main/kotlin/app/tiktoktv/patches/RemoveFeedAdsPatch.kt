package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.iface.Method

private const val FEED_ITEM_LIST = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
private const val AWE_ME_LIST = "Ljava/util/List;"
private const val ADS = "Lapp/template/extension/extension/Ads;"

/** Each view that turns a response into something on screen, paired with the parameter that carries it. */
private val RESPONSE_SINKS = listOf(
    "Lcom/ss/android/ugc/aweme/tv/feed/fragment/g;" to FEED_ITEM_LIST,           // FeedModel
    "Lcom/ss/android/ugc/aweme/tv/feed/fragment/m;" to FEED_ITEM_LIST,           // SearchFeedViewModel
    "Lcom/ss/android/ugc/aweme/tv/feed/fragment/d;" to FEED_ITEM_LIST,           // DetailFeedViewModel
    "Lcom/ss/android/ugc/aweme/tv/feed/c/d;" to FEED_ITEM_LIST,                  // CategoryAwemeSource
    "Lcom/ss/android/ugc/aweme/tv/feed/c/a/d;" to AWE_ME_LIST,                   // FYP dedupe
    "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/videogrid/b;" to FEED_ITEM_LIST,  // ProfileVideoGridViewModelV2
    "Lcom/ss/android/ugc/aweme/tv/profile/a/d;" to FEED_ITEM_LIST,               // ProfileVideoGridViewModel
)

private fun Method.parameterRegister(index: Int): Int {
    val registerCount = implementation?.registerCount
        ?: throw IllegalStateException("$name has no implementation")
    var offset = 0
    for (i in 0 until index) {
        offset += if (parameterTypes[i] == "J" || parameterTypes[i] == "D") 2 else 1
    }
    val parameterRegisters = parameterTypes.sumOf {
        if (it == "J" || it == "D") 2 else 1
    }
    return registerCount - parameterRegisters + offset
}

/** Removes TikTok Lite ads from feed, search and profile responses. */
@Suppress("unused")
val removeFeedAdsPatch = bytecodePatch(
    name = "Remove feed ads",
    description = "Drops the ad posts TikTok Lite puts in the feed, search, category and profile responses, which the TV app otherwise plays as ordinary videos.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        RESPONSE_SINKS.forEach { (owner, parameter) ->
            mutableClassDefBy(owner).methods.forEach { method ->
                method.parameterTypes.forEachIndexed { index, type ->
                    if (type != parameter) return@forEachIndexed
                    val register = method.parameterRegister(index)
                    // The inline smali compiler refuses a register above v15 instead of picking the
                    // range format itself, and one search sink has its response at v23.
                    val format = if (register > 15) "/range" else ""
                    method.addInstruction(
                        0,
                        "invoke-static$format {v$register}, $ADS->strip(Ljava/lang/Object;)V",
                    )
                }
            }
        }
    }
}
