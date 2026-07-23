package app.dbtcoach.patches.shared

/**
 * Constantes de compatibilité pour DBT Coach.
 *
 * Version testée : 6.4.2
 * Package        : co.swasth.dbtcoach
 *
 * Pour ajouter une version, ajoute son numéro de build dans la liste.
 * Laisse la liste vide pour accepter toutes les versions (non recommandé).
 */
internal object Constants {
    const val PACKAGE_DBTCOACH = "co.swasth.dbtcoach"

    val VERSIONS_DBTCOACH = setOf(
        "6.4.2",
        "6.4.1",
        "6.4.0",
        "6.1.3",
    )
}
