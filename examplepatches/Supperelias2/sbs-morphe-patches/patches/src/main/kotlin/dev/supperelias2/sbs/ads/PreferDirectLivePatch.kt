package dev.supperelias2.sbs.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val LIVE_ITEM = "Lcom/sbs/ondemand/model/playback/PlaybackResponse\$PlaybackItem;"
private const val LIVE_AKAMAI = "Lcom/sbs/ondemand/model/playback/PlaybackStreamProvider\$AkamaiHLSProvider;"

/** Live counterpart; never invents URLs or changes regional access. */
@Suppress("unused")
val preferDirectLivePatch = bytecodePatch(
    name = "Prefer direct live stream",
    description = "Prefers an available Akamai live stream over Google DAI. " +
        "Broadcast ads remain. Keeps original selection when no direct stream is available.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "SBS On Demand",
            packageName = "com.sbs.ondemand.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.3.0"))
        )
    )
    dependsOn(playbackCompatibilityPatch)

    execute {
        val method = ProviderSelectionFingerprint.method
        val fallback = FallbackProviderFingerprint.method
        check(method.implementation?.registerCount == 8) {
            "Unexpected SBS provider-selection register layout"
        }
        check(fallback.definingClass == method.definingClass)

        // Only the verified "live" type qualifies. Unknown types keep their
        // original route. Separate labels allow this patch and VOD together.
        // Match the FIRST Akamai provider, as the existing fallback does.
        method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "live"
                invoke-virtual {p1}, $LIVE_ITEM->getStreamType()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbs_live_original

                invoke-virtual {p1}, $LIVE_ITEM->getStreamProviders()Ljava/util/List;
                move-result-object v0
                if-eqz v0, :sbs_live_original
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :sbs_live_next
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :sbs_live_original
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                instance-of v2, v1, $LIVE_AKAMAI
                if-eqz v2, :sbs_live_next

                check-cast v1, $LIVE_AKAMAI
                invoke-virtual {v1}, $LIVE_AKAMAI->getUrl()Ljava/lang/String;
                move-result-object v1
                invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
                move-result v2
                if-nez v2, :sbs_live_original
                const/4 v2, 0x0
                invoke-direct {p0, p1, v2}, ${fallback.definingClass}->${fallback.name}(${LIVE_ITEM}Z)V
                return-void
                :sbs_live_original
                nop
            """
        )
    }
}
