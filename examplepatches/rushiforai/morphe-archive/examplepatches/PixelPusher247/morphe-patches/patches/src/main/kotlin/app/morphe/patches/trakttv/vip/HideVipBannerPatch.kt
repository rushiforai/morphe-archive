package app.morphe.patches.trakttv.vip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.mapping.ResourceType
import app.morphe.patches.shared.misc.mapping.getResourceId
import app.morphe.patches.shared.misc.mapping.resourceMappingPatch
import app.morphe.util.containsLiteralInstruction
import app.morphe.util.forEachLiteralValueInstruction

@Suppress("unused")
val hideVipBannerPatch = bytecodePatch(
    name = "Hide VIP banner",
    description = "Removes the Upgrade to VIP upsell banner from the home screen.",
) {
    dependsOn(resourceMappingPatch)

    compatibleWith("tv.trakt.trakt")

    execute {
        val upsellDefault = getResourceId(ResourceType.STRING, "text_vip_upsell_default")
        val upsellDefault2 = getResourceId(ResourceType.STRING, "text_vip_upsell_default_2")
        val badgeGetVip = getResourceId(ResourceType.STRING, "badge_text_get_vip")

        forEachLiteralValueInstruction(upsellDefault) { _ ->
            if (containsLiteralInstruction(badgeGetVip)) {
                addInstructions(0, "return-void")
            }
        }

        forEachLiteralValueInstruction(upsellDefault2) { _ ->
            if (containsLiteralInstruction(badgeGetVip)) {
                addInstructions(0, "return-void")
            }
        }
    }
}
