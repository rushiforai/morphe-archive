package app.ahmedyarub.patches.x.ads

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.timeline.TIMELINE_FILTER_CLASS
import app.ahmedyarub.patches.x.timeline.timelineFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

/** The metadata a promoted timeline item carries. */
private object TimelinePromotedMetadataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("TimelinePromotedMetadata(impressionId="),
)

private object PromotedMetadataClassExtensionFingerprint : Fingerprint(
    definingClass = "$EXTENSION_PACKAGE/Ads;",
    name = "promotedMetadataClass",
)

private object HidePromotedExtensionFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "hidePromoted",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes promoted posts, accounts and trends from timelines.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(timelineFilterPatch)

    execute {
        PromotedMetadataClassExtensionFingerprint.method.returnEarly(
            TimelinePromotedMetadataToStringFingerprint.classDef.type.removePrefix("L").removeSuffix(";").replace('/', '.'),
        )
        HidePromotedExtensionFingerprint.method.returnEarly(true)
    }
}
