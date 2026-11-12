package app.template.patches.wemuslim.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch

private const val INFO_STREAM_UNIT = "Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;"
private const val LOCATION_CONF = "Lcom/fyxtech/muslim/protobuf/LocationResourceProto\$LocationConf;"

// The home and prayer feeds' server-driven banner units (ActivityBannerViewHolder): event and
// promotion banners such as the "Lucky Egg Smash" carousel and the "Official Statement on In-App
// Advertising" banner (#135). The stream builder checks hasActivityBanner in its chain of has*
// branches and drops a unit that matches none, so answering false removes the banner and its slot
// (the same mechanism as Hide feed clutter). Kept separate because it also hides event banners.
//
// 2026-11-11 (#135, 3.5.5): also the home pop-up ("SMASH & WIN! - Participate Now") and the floating
// sticky icon at the bottom right (Smash / GIFTS). Both are server-placed LocationResources; small
// Function1 filters pick the ones for each placement by LocationConf.hasHomePopupConf /
// hasNewHomePopupConf / hasHomeStickyConf / hasNewHomeStickyConf, so answering false leaves those
// placements empty. Only LocResourceTrack (analytics) reads the same accessors otherwise. This hides
// every server-pushed home pop-up and corner icon, not just one campaign.
@Suppress("unused")
val hideActivityBannersPatch = bytecodePatch(
    name = "Hide activity banners",
    description = "Hides event banners, the home pop-up and the floating event icon.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    execute {
        val streamUnit = mutableClassDefByOrNull(INFO_STREAM_UNIT)
            ?: throw PatchException("Hide activity banners: $INFO_STREAM_UNIT not found")
        streamUnit.methods.singleOrNull {
            it.name == "hasActivityBanner" && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.implementation != null
        }?.returnEarly(false)
            ?: throw PatchException("Hide activity banners: no $INFO_STREAM_UNIT->hasActivityBanner()Z")

        val locationConf = mutableClassDefByOrNull(LOCATION_CONF)
            ?: throw PatchException("Hide activity banners: $LOCATION_CONF not found")
        for (name in listOf("hasHomePopupConf", "hasNewHomePopupConf", "hasHomeStickyConf", "hasNewHomeStickyConf")) {
            locationConf.methods.singleOrNull {
                it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }?.returnEarly(false)
                ?: throw PatchException("Hide activity banners: no $LOCATION_CONF->$name()Z")
        }
    }
}
