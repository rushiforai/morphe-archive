package mightymich.morphe.patches.com.adobe.photoshop.retail

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Photoshop Premium",
    description = "Forces local Adobe Photoshop entitlement checks to paid/ENTITLED. " +
        "Cloud-only features may still require a server-side Adobe subscription.",
    default = true,
) {
    compatibleWith(PhotoshopCompatibility.PHOTOSHOP)

    execute {
        val helper = "Lcom/adobe/photoshop/common/authorization/AccessPlatformStatusHelper;"
        val userEntitlement =
            "Lcom/adobe/photoshop/common/authorization/UserEntitlement;"
        val appStatus =
            "Lcom/adobe/marketing/mobile/growthsdk/internal/EntitlementUtils\$AppEntitlementStatus;"
        val entitlementUtils =
            "Lcom/adobe/marketing/mobile/growthsdk/internal/EntitlementUtils;"

        fun forceTrue(definingClass: String, name: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceEntitled(definingClass: String, name: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = userEntitlement,
                    parameters = emptyList(),
                )
                fp.method.addInstructions(
                    0,
                    """
                        sget-object v0, $userEntitlement->ENTITLED:$userEntitlement
                        return-object v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        fun forceAppStatus(name: String, enumConst: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = entitlementUtils,
                    name = name,
                    returnType = appStatus,
                )
                fp.method.addInstructions(
                    0,
                    """
                        sget-object v0, $appStatus->$enumConst:$appStatus
                        return-object v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        var hits = 0

        for (m in listOf("b", "d", "k", "l", "m", "n")) {
            if (forceTrue(helper, m)) hits++
        }
        for (m in listOf("e", "f")) {
            if (forceEntitled(helper, m)) hits++
        }

        if (forceAppStatus("a", "SUBSCRIPTION")) hits++
        if (forceAppStatus("b", "SUBSCRIPTION")) hits++

        try {
            val fp = Fingerprint(
                definingClass =
                    "Lcom/adobe/marketing/mobile/growthsdk/internal/EntitlementUtils\$EntitlementInfo;",
                name = "f",
                returnType = "Z",
                parameters = emptyList(),
            )
            fp.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
            hits++
        } catch (_: Exception) {
        }

        if (forceTrue(
                "Lcom/adobe/photoshop/feature/typequest/utils/TypeQuestFont;",
                "isEntitled",
            )
        ) {
            hits++
        }
        if (forceTrue(
                "Lcom/adobe/photoshop/feature/typequest/utils/TypeQuestAuthenticationInfo;",
                "getAppEntitlementProfilePaid",
            )
        ) {
            hits++
        }

        for (methodName in listOf("isEntitled", "getAppEntitlementProfilePaid")) {
            try {
                for (def in classDefByStrings(methodName)) {
                    val clazz = mutableClassDefBy(def)
                    for (method in clazz.methods) {
                        if (method.name != methodName) continue
                        if (method.returnType != "Z") continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        try {
                            method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x1
                                    return v0
                                """,
                            )
                            hits++
                        } catch (_: Exception) {
                        }
                    }
                }
            } catch (_: Exception) {
            }
        }

        if (hits == 0) {
            throw PatchException(
                "Photoshop: no entitlement methods patched. " +
                    "AccessPlatformStatusHelper may have changed; re-derive for this version.",
            )
        }
    }
}
