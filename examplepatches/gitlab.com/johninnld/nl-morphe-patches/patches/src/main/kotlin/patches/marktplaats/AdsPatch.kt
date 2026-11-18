package patches.marktplaats

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes explicit display/native advertising slots and advertising startup while preserving genuine seller listings, promoted seller inventory, search metadata and functional services.",
) {
    dependsOn(originalInput, adsResources)
    compatibleWith(marktplaats)
    execute {
        suppressAdSlots()
        suppressAdRequests()
        exact("Lc37;", "c()V", 9, 7, 93).addInstructions(0, "return-void")
        exact("Lc37;", "d()V", 9, 4, 36).addInstructions(0, "return-void")
        exact("Lc1c;", "a(Landroid/content/Context;)V", 17, 4, 31).addInstructions(0, "return-void")
    }
}
