package app.template.patches.digisport.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT_EXPERIMENTAL

// Live channels with an enabled IMA DAI balancer play as an ssai:// IMA DAI item, with the ads
// inserted into the stream by Google's server. Turning DAI off makes the app build the plain live
// item from the channel's own stream balancer instead. That plain stream is fetched only when the
// channel config carries a livestream URL, independently of DAI, so a DAI-only channel would have
// no stream to play; kept separate from "Disable ads" so users can turn it off then.
// The issue's other idea, swapping setMediaSourceForDai for setMediaSourceForPreRoll in
// initExoPlayerForDAI, is not used: a plain DefaultMediaSourceFactory cannot resolve ssai:// URIs.
@Suppress("unused")
val disableLiveStreamAdsPatch = bytecodePatch(
    name = "Disable live stream ads",
    description = "Removes ads from live channels. Turn off if a channel stops playing."
) {
    compatibleWith(COMPATIBILITY_DIGISPORT_EXPERIMENTAL)

    execute {
        // 1. DAI is never enabled: GetLiveStream skips the DAI balancer request and
        // createPlayerInput builds the stream from UiLiveStream.getMUrl() (getStream) instead of
        // the DAI item (getDAI).
        UiLiveDaiGetEnableFingerprint.method.returnEarly(false)

        // 2. The player never rebuilds a DAI ads loader / media source for the current item.
        UpdateAdViewForDaiFingerprint.method.returnEarly()
    }
}
