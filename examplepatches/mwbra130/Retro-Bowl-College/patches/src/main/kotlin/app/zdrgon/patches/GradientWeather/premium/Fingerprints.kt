package morningentree.morphe.patches.gradientweather.premium

import app.morphe.patcher.Fingerprint

internal object InitSubscriptionTierFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("is_lifetime", "is_premium"),
    custom = { method, _ ->
        method.name == "<init>" &&
            method.parameterTypes.firstOrNull() == "Landroid/content/Context;"
    },
)

internal object UpdateEntitlementFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("is_lifetime", "is_premium"),
    custom = { method, _ -> method.parameterTypes.size == 3 },
)
