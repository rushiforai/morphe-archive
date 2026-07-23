package app.dbtcoach.patches.premium

import app.dbtcoach.patches.shared.Constants.PACKAGE_DBTCOACH
import app.dbtcoach.patches.shared.Constants.VERSIONS_DBTCOACH
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

/**
 * Patch : Unlock Premium
 *
 * DBT Coach utilise RevenueCat (com.revenuecat.purchases) pour gérer les abonnements.
 * Ce patch cible EntitlementInfo.isActive() pour qu'elle retourne toujours true,
 * ce qui fait croire à l'app que l'abonnement est actif.
 *
 * Architecture : React Native + RevenueCat SDK natif Android
 *
 * ─── Comment vérifier avec JADX ───────────────────────────────────────────────
 * 1. Décompile l'APK :
 *    jadx co.swasth.dbtcoach.apk -d jadx_output --deobf
 *
 * 2. Cherche la classe EntitlementInfo de RevenueCat :
 *    grep -rn "isActive\|EntitlementInfo" jadx_output/ | grep "revenu"
 *
 * 3. Vérifie que le nom de classe Dalvik est bien :
 *    Lcom/revenuecat/purchases/EntitlementInfo;
 *    Si le nom est différent (obfuscation), adapte REVENUECAT_ENTITLEMENT_CLASS ci-dessous.
 *
 * 4. Vérifie le nom de la méthode getter isActive :
 *    Cherche "isActive" ou "getActive" dans la classe.
 * ──────────────────────────────────────────────────────────────────────────────
 */

// Nom Dalvik de la classe RevenueCat (non obfusquée en général car bibliothèque tierce)
private const val REVENUECAT_ENTITLEMENT_CLASS = "Lcom/revenuecat/purchases/EntitlementInfo;"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Déverrouille toutes les fonctionnalités premium de DBT Coach en " +
        "court-circuitant la vérification d'abonnement RevenueCat.",
) {
    compatibleWith(PACKAGE_DBTCOACH to VERSIONS_DBTCOACH)

    execute {
        // ── Patch 1 : EntitlementInfo.isActive() ─────────────────────────────
        // Fait croire à l'app que chaque entitlement est actif.
        classDefBy(REVENUECAT_ENTITLEMENT_CLASS)
            .methods.first { it.name == "isActive" }
            .toMutable()
            .addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
    }
}
