/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/protonmail/account/RemoveFreeAccountsLimitPatch.kt
 */
package app.morphe.patches.protonmail.account

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.findElementByAttributeValueOrThrow

@Suppress("unused")
val removeFreeAccountsLimitPatch = resourcePatch(
    name = "Remove free accounts limit",
    description = "Removes the limit for maximum free accounts logged in.",
) {
    compatibleWith(AppCompatibilities.PROTON_MAIL)

    execute {
        document("res/values/integers.xml").use { document ->
            document.documentElement.childNodes.findElementByAttributeValueOrThrow(
                "name",
                "core_feature_auth_user_check_max_free_user_count",
            ).textContent = Int.MAX_VALUE.toString()
        }
    }
}

