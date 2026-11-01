package semicoloncolonel.mobilestream.patches.amc.ads

import app.morphe.patcher.Fingerprint

// AMC+ phone build 1.8.62.1 (versionCode 179216108).
//
// VideoPlayerComponent.setVideoToPlayer(model, video, isOffline) decides how a
// Brightcove Video reaches the player. Live and offline videos go straight to
// BaseVideoView.add(). Everything else is wrapped in a new Brightcove
// SSAIComponent (obfuscated to com.brightcove.ssai.q), whose processVideo
// (q.W) fetches the VMAP and plays the ad-stitched stream. AMC+'s own classes
// keep their names in this build.
object SetVideoToPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/amcn/microapp/video_player/player/VideoPlayerComponent;",
    name = "setVideoToPlayer",
    parameters = listOf(
        "Lcom/amcn/microapp/video_player/model/VideoPlayerModel;",
        "Lcom/brightcove/player/model/Video;",
        "Z",
    ),
    returnType = "V",
)
