package app.morphe.patches.xiaomi.earbuds

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.replaceWithReturnBoolean

@Suppress("unused")
val xiaomiEarbudsModelCatalogUnlockPatch = bytecodePatch(
    name = "Show All Models",
    description = "Shows every earbud model for pairing.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_XIAOMI_EARBUDS)

    execute {
        Fingerprint(
            definingClass = "Lcom/mi/earphone/device/manager/cache/DeviceInfoListCache;",
            name = "isShowProduct",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Z",
        ).method.apply {
            replaceWithReturnBoolean(true)
        }

        println("[Show All Models] Unlocked full device model catalog (isShowProduct -> true).")
    }
}
