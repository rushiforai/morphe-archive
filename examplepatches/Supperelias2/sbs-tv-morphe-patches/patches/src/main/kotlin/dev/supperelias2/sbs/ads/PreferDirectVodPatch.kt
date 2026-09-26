package dev.supperelias2.sbstv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val ITEM = "Lcom/sbs/ondemand/model/playback/PlaybackResponse\$PlaybackItem;"
private const val AKAMAI = "Lcom/sbs/ondemand/model/playback/PlaybackStreamProvider\$AkamaiHLSProvider;"

/** Uses only an alternative already supplied by the app's playback service. */
@Suppress("unused")
val preferDirectVodPatch = bytecodePatch(
    name = "Prefer direct VOD stream",
    description = "Prefers an available Akamai VOD stream over Google DAI. " +
        "Keeps original selection for live or missing alternatives. Ad removal is not guaranteed.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "SBS On Demand for Android TV",
            packageName = "com.sbs.ondemand.tv",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.3.1"))
        )
    )
    dependsOn(playbackCompatibilityPatch)

    execute {
        val method = ProviderSelectionFingerprint.method
        val fallback = FallbackProviderFingerprint.method
        // Verified against versionCode 16435's disassembly: five locals, three
        // parameter registers. Fail on a different layout instead of overwriting p0.
        check(method.implementation?.registerCount == 8) {
            "Unexpected SBS provider-selection register layout"
        }
        check(fallback.definingClass == method.definingClass)

        method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "vod"
                invoke-virtual {p1}, $ITEM->getStreamType()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbs_original

                invoke-virtual {p1}, $ITEM->getStreamProviders()Ljava/util/List;
                move-result-object v0
                if-eqz v0, :sbs_original
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :sbs_next
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :sbs_original
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                instance-of v2, v1, $AKAMAI
                if-eqz v2, :sbs_next

                check-cast v1, $AKAMAI
                invoke-virtual {v1}, $AKAMAI->getUrl()Ljava/lang/String;
                move-result-object v1
                invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :sbs_original
                const/4 v2, 0x0
                invoke-direct {p0, p1, v2}, ${fallback.definingClass}->${fallback.name}(${ITEM}Z)V
                return-void
                :sbs_original
                nop
            """
        )
    }
}
