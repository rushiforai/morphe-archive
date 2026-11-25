package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private object SaveVideo : Fingerprint(
    definingClass = "LX/J4T;",
    name = "LBL",
    returnType = "V",
    strings = listOf("video-download"),
)

private object SaveVideo4782 : Fingerprint(
    definingClass = "LX/Gxa;",
    name = "LBL",
    returnType = "V",
    parameters = listOf(
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;",
        "Ljava/lang/String;", "Ljava/lang/String;", "Z", "LX/POC;", "LX/HOM;",
    ),
)

@Suppress("unused")
val preferPlaybackDownload = bytecodePatch(
    name = "Prefer clean source for video downloads",
    description = "Prefers the playback source for permitted saves when a playback URL is available.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(modSettingsSupport)
    execute {
        enableModSetting("cleanDownloadsAvailable")
        val method = if (packageMetadata.versionName == "47.8.2") SaveVideo4782.method else SaveVideo.method
        check(AccessFlags.STATIC.isSet(method.accessFlags))
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
