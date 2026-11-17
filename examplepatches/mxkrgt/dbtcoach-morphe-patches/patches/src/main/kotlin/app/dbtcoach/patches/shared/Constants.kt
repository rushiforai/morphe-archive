package app.dbtcoach.patches.shared

/**
 * Constantes de compatibilité pour DBT Coach.
 *
 * Version testée : 6.5.0 (versionCode 552)
 * Package        : co.swasth.dbtcoach
 *
 * Seule la version vérifiée est déclarée : le patch dépend de l'API Nitro IAP
 * (`HybridRnIap.getAvailablePurchases` + `PurchaseAndroid`), qui a changé entre
 * 6.4.x et 6.5.0. Ajouter une version seulement après avoir vérifié ses smali.
 */
internal object Constants {
    const val PACKAGE_DBTCOACH = "co.swasth.dbtcoach"

    val VERSIONS_DBTCOACH = setOf(
        "6.5.0",
    )
}
