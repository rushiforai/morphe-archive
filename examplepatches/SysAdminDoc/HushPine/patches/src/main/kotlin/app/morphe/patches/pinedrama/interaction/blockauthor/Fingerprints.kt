/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.pinedrama.interaction.blockauthor

import app.morphe.patcher.Fingerprint

/**
 * Fires whenever a video becomes the current item in the feed, carrying the
 * `VideoItemParams` that holds the Aweme and therefore the author.
 *
 * This is the same anchor the "Always show publish date" patch uses, so it is known to
 * resolve on TikTok 46.2.3.
 */
internal object VideoAuthorInfoParamsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/videoauthorinfo/VideoAuthorInfoVM;",
    custom = { method, _ ->
        method.name == "paramSync2StateAccept" &&
            "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;" in method.parameterTypes
    },
)

/**
 * Reports playback progress for the video that is actually on screen, carrying its id in
 * the first parameter. The bind callback above fires for items the feed has prefetched, so
 * this is what decides which of them is current.
 *
 * The same method is hooked by "Stay paused after a scroll", which searches the instructions
 * for its own site, so a prepend at zero moves it rather than displacing it.
 */
internal object PlayerProgressAidFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/controller/PlayerController;",
    name = "onPlayProgressChange",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J", "J"),
)
