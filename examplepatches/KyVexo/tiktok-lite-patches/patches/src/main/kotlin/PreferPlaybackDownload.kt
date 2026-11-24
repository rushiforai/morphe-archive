package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private object SaveVideo : Fingerprint(
    definingClass = "LX/J4T;",
    name = "LBL",
    returnType = "V",
    strings = listOf("video-download"),
)

@Suppress("unused")
val preferPlaybackDownload = bytecodePatch(
    name = "Prefer clean source for video downloads",
    description = "Prefers the playback source for permitted saves when a playback URL is available.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "TikTok Lite",
        packageName = "com.zhiliaoapp.musically.go",
        targets = listOf(AppTarget(version = "47.8.15", minSdk = 21)),
    ))
    execute {
        val method = SaveVideo.method
        check(method.parameterTypes.map { it.toString() }.take(4) == listOf(
            "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
            "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;",
        ))
        check(method.implementation!!.registerCount - method.parameterTypes.size >= 3)
        method.addInstructions(0, """
            invoke-static {}, Lapp/tiktoklitepatches/extension/ModSettings;->cleanDownloads()Z
            move-result v0
            if-eqz v0, :original_source
            move-object/from16 v0, p0
            if-eqz v0, :original_source
            iget-object v0, v0, Lcom/ss/android/ugc/aweme/feed/model/Aweme;->video:Lcom/ss/android/ugc/aweme/feed/model/Video;
            if-eqz v0, :original_source
            invoke-virtual {v0}, Lcom/ss/android/ugc/aweme/feed/model/Video;->getPlayAddr()Lcom/ss/android/ugc/aweme/feed/model/VideoUrlModel;
            move-result-object v0
            if-eqz v0, :original_source
            invoke-virtual {v0}, Lcom/ss/android/ugc/aweme/feed/model/VideoUrlModel;->getUrlList()Ljava/util/List;
            move-result-object v1
            if-eqz v1, :original_source
            invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
            move-result v2
            if-nez v2, :original_source
            const/4 v2, 0
            invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Ljava/lang/String;
            if-eqz v2, :original_source
            invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
            move-result v0
            if-nez v0, :original_source
            move-object/16 p2, v2
            move-object/16 p3, v1
            :original_source
            nop
        """)
    }
}
