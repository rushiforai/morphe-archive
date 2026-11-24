package patches.angrybirdsfriends

import app.morphe.patcher.patch.resourcePatch
import patches.shared.hideRovioPaidShop

@Suppress("unused")
val angryBirdsFriendsHidePaidShop = resourcePatch(
    name = "Hide paid shop tab",
    description = "Hides the paid Bird Coins tab and opens Power-ups instead. Power-ups and Slingshots remain available.",
    default = true,
) {
    compatibleWith(angryBirdsFriends)
    dependsOn(originalInput)
    execute { hideRovioPaidShop(get("lib/arm64-v8a/libil2cpp.so"), "Angry Birds Friends") }
}
