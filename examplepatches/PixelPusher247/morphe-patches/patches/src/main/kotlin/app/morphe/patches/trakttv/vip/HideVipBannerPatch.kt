package app.morphe.patches.trakttv.vip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.mapping.ResourceType
import app.morphe.patches.shared.misc.mapping.getResourceElements
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
        val badgeGetVip = getResourceId(ResourceType.STRING, "badge_text_get_vip")
        val upsellStringIds = getResourceElements()
            .filter { it.type == ResourceType.STRING && it.name.startsWith("text_vip_upsell") }
            .map { it.id }
        val neutralizedMethods = HashSet<String>()

        upsellStringIds.forEach { upsellId ->
            forEachLiteralValueInstruction(upsellId) { _ ->
                if (containsLiteralInstruction(badgeGetVip) &&
                    neutralizedMethods.add("$definingClass->$name")
                ) {
                    addInstructions(0, "return-void")
                }
            }
        }
    }
}
