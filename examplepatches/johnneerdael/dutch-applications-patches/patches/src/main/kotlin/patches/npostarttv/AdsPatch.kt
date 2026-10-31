package patches.npostarttv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Suppresses nullable preroll inputs and the optional IMA ad loader. Uses the player's existing content-only path while retaining real content, DRM, subtitles and player state.",
    default = true,
) {
    compatibleWith(npoTv, npoPhone)
    dependsOn(originalInput, startupCompatibility)
    execute {
        if (packageMetadata.isNpoPhone) {
            hidePhoneAds()
            return@execute
        }
        // The shipped media-source factory explicitly returns the content source when this
        // optional loader is null. Avoid instantiating IMA/OMID for an ad-free source.
        exact("Lnl/npo/player/library/sterads/presentation/ads/ImaAdManager;",
            "getAdsLoader(Landroid/content/Context;Z)Lnl/npo/player/library/kw/e;",
            12, 22).addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        // fetched
        exact("Lnl/npo/player/library/bw/a;",
            "getPreRollAdUrl()Ljava/lang/String;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
        // assets
        exact("Lnl/npo/player/library/domain/streamLink/model/StreamLinkAssets;",
            "getPreRollAdUrl()Ljava/lang/String;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
        // cached
        exact("Lnl/npo/player/library/data/offline/model/OnDiskSourceConfig;",
            "getPreRollAdUrl()Ljava/lang/String;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
        // copied
        exact("Lnl/npo/player/library/data/extensions/NPOSourceConfigKt\$copyInternal\$newSourceConfig\$1;",
            "getPreRollAdUrl()Ljava/lang/String;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
        // wrapper
        exact("Lnl/npo/player/library/cv/a;",
            "getPreRollAdUrl()Ljava/lang/String;",
            1, 2).addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
    }
}
