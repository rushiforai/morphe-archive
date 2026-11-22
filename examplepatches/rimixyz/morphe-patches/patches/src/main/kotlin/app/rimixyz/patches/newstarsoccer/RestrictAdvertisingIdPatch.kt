package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val PERMISSION_NAME = "android:name"
private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Remove do manifesto final apenas as duas permissões de identificador publicitário.
 *
 * Não usa substring e não toca em Attribution, Topics, consentimento ou componentes dos SDKs.
 * A efetividade depende da versão do Android / Play Services e deve ser confirmada no aparelho:
 * em Android 13+ com Play Services a API deve devolver zeros quando a permissão não é concedida.
 */
@Suppress("unused")
val restrictAdvertisingIdPatch = patch(
    name = "Restrict advertising ID",
    description = "Removes GAID and AdServices Ad ID permissions to reduce ad tracking, while keeping Attribution and Topics.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val before = manifest.root.children("uses-permission")
                .filter { it.attribute(PERMISSION_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(before.isNotEmpty()) {
                "Restrict advertising ID: nenhuma permissão publicitária encontrada no manifesto"
            }

            before.forEach { it.remove() }

            val after = manifest.root.children("uses-permission")
                .filter { it.attribute(PERMISSION_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(after.isEmpty()) {
                "Restrict advertising ID: ainda restam ${after.size} permissões publicitárias"
            }

            println("Restrict advertising ID: ${before.size} permissão(ões) removida(s).")
        }
    }
}
