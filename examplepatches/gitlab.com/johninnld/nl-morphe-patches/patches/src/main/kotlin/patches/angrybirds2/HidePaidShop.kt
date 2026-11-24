package patches.angrybirds2

import app.morphe.patcher.patch.resourcePatch
import patches.shared.hideRovioPaidShop

@Suppress("unused")
val angryBirds2HidePaidShop = resourcePatch(
    name = "Hide paid shop tab",
    description = "Hides the paid Shop tab and content, Treasure Pass purchase button and paid reward row. Keeps Bonus, Daily Deals, free rewards and quests.",
    default = true,
) {
    compatibleWith(angryBirds2)
    dependsOn(originalInput)
    execute { hideRovioPaidShop(get("lib/arm64-v8a/libil2cpp.so"), "Angry Birds 2") }
}
