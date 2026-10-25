package app.template.patches.easylauncher.misc.promo

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYLAUNCHER

@Suppress("unused")
val disablePromotionsPatch = bytecodePatch(
    name = "Disable promotions",
    description = "Hides partner promotions and app offers.",
) {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    execute {
        // 1. GetJar / SportsPass: every enabled flag of every promo config reads false, whatever
        // Remote Config sends.
        for (type in PROMO_CONFIG_CLASSES) {
            val getters = mutableClassDefBy(type).methods.filter { method ->
                method.name in PROMO_ENABLED_GETTERS && method.returnType == "Z" &&
                    method.parameterTypes.isEmpty() && method.implementation != null
            }
            if (getters.isEmpty()) throw PatchException("$type has no enabled getter")
            getters.forEach { it.returnEarly(false) }
        }

        // 2. The CPA offers card in search.
        CpaOffersIsEnabledFingerprint.method.returnEarly(false)

        // 3. The keyboard promotion notification.
        ImePromoPitchFingerprint.method.returnEarly()
    }
}
