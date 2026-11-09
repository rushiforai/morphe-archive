package mightymich.morphe.patches.com.adobe.premiere

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Adobe Premiere (com.adobe.premiere) — local entitlement / premium flags.
 *
 * Core multi-track editing and watermark-free 4K export are already free on
 * Android. This patch forces client-side entitlement helpers used for Creative
 * Cloud storage, NGL fulfillable items, and any isPremium-style gates that
 * surface paywalls or block optional features (e.g. local premium badges).
 *
 * Firefly generative AI still spends server-side credits; those calls cannot be
 * fully unlocked offline.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premiere Premium",
    description = "Forces local Adobe Premiere entitlement checks (CC services / " +
        "isPremium gates). Core editing is already free; cloud AI credits remain server-side.",
    default = true,
) {
    compatibleWith(PremiereCompatibility.PREMIERE)

    execute {
        var hits = 0

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

        val fiHelper =
            "Lcom/adobe/creativesdk/foundation/internal/ngl/Util/AdobeFIEntitlementHelper;"
        for (m in listOf(
            "isEntitledToCCStorageService",
            "isEntitledToCoreServicesCC",
            "isEntitledToLightroomService",
        )) {
            if (forceTrue(fiHelper, m)) hits++
        }

        // Broad: any ()Z named isEntitled* / isPremium / getIsPremium in the APK
        for (methodName in listOf(
            "isPremium",
            "getIsPremium",
            "isEntitled",
            "hasPremium",
            "isEntitledToCCStorageService",
            "isEntitledToCoreServicesCC",
            "isEntitledToLightroomService",
        )) {
            try {
                for (def in classDefByStrings(methodName)) {
                    val clazz = try {
                        mutableClassDefBy(def)
                    } catch (_: Exception) {
                        continue
                    }
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

        // Data-class style gates referenced by toString "isPremium=" / "Resolved(isPremium="
        for (marker in listOf("Resolved(isPremium=", ", isPremium=")) {
            try {
                for (def in classDefByStrings(marker)) {
                    val clazz = try {
                        mutableClassDefBy(def)
                    } catch (_: Exception) {
                        continue
                    }
                    for (method in clazz.methods) {
                        if (method.returnType != "Z") continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        // Prefer methods that look like isPremium / componentN boolean getters
                        val n = method.name
                        if (n != "isPremium" && n != "getIsPremium" &&
                            !n.startsWith("component") && n.length > 3
                        ) {
                            continue
                        }
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

        // Shared Adobe growth / NGL patterns (same family as Photoshop mobile)
        val userEntitlement =
            "Lcom/adobe/photoshop/common/authorization/UserEntitlement;"
        // Premiere may not ship Photoshop packages; ignore failures.
        try {
            val status =
                "Lcom/adobe/marketing/mobile/growthsdk/internal/EntitlementUtils\$AppEntitlementStatus;"
            val utils =
                "Lcom/adobe/marketing/mobile/growthsdk/internal/EntitlementUtils;"
            for (name in listOf("a", "b")) {
                try {
                    val fp = Fingerprint(
                        definingClass = utils,
                        name = name,
                        returnType = status,
                    )
                    fp.method.addInstructions(
                        0,
                        """
                            sget-object v0, $status->SUBSCRIPTION:$status
                            return-object v0
                        """,
                    )
                    hits++
                } catch (_: Exception) {
                }
            }
        } catch (_: Exception) {
        }

        if (hits == 0) {
            throw PatchException(
                "Premiere: no entitlement methods patched. " +
                    "AdobeFIEntitlementHelper / isPremium gates may have moved; re-derive for this build.",
            )
        }
    }
}
