package app.aapam.patches.indwealth.privacy

import app.aapam.patches.indwealth.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAppTrackingPatch = bytecodePatch(
    name = "Disable App Inventory Tracking",
    description = "Prevents INDmoney from querying installed applications, competitor apps, and UPI handlers.",
) {
    compatibleWith(Constants.COMPATIBILITY_INDWEALTH)

    execute {
        // 1. Stub low-level package checkers in q8
        mutableClassDefByOrNull("Lcom/indwealth/common/utils/q8;")?.let { q8Class ->
            q8Class.methods.forEach { method ->
                // y(PackageManager, String) -> boolean
                if (method.name == "y" && method.returnType == "Z") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x0
                            return v0
                        """,
                    )
                }
                // z(PackageManager, String, String) -> boolean
                if (method.name == "z" && method.returnType == "Z") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x0
                            return v0
                        """,
                    )
                }
            }
        }

        // 2. Stub CommonRepository.R to return empty AppPackageRequest
        mutableClassDefByOrNull("Lcom/indwealth/common/data/r;")?.let { rClass ->
            rClass.methods.forEach { method ->
                if (method.name == "R" && method.returnType == "Lcom/indwealth/common/model/AppPackageRequest;") {
                    method.addInstructions(
                        0,
                        """
                            new-instance v0, Lcom/indwealth/common/model/AppPackageRequest;
                            invoke-direct {v0}, Lcom/indwealth/common/model/AppPackageRequest;-><init>()V
                            return-object v0
                        """,
                    )
                }
            }
        }
    }
}
