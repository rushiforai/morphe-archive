package app.aapam.patches.monect.premium

import app.aapam.patches.monect.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks full Premium VIP status across Monect PC Link TV, enabling 4K/2K/1080p remote desktop streaming, up to 10 hosts, unlimited file transfers, custom screen casting ratios, and removing all ads.",
) {
    compatibleWith(Constants.COMPATIBILITY_MONECT_TV)

    execute {
        // 1. Force Config.isPremium() -> true (0x1)
        mutableClassDefByOrNull("Lcom/monect/core/Config;")?.let { configClass ->
            configClass.methods.forEach { method ->
                if (method.name == "isPremium" && method.returnType == "Z") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """,
                    )
                }
            }
        }

        // 2. Force LoggedInUser.isPremium() -> true (0x1)
        mutableClassDefByOrNull("Lcom/monect/core/data/model/LoggedInUser;")?.let { userClass ->
            userClass.methods.forEach { method ->
                if (method.name == "isPremium" && method.returnType == "Z") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """,
                    )
                }
            }
        }
    }
}
