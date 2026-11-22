package app.rimixyz.patches.mytherapy

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

private const val PERMISSION_NAME = "android:name"
private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Remove do manifesto final apenas as duas permissões de identificador publicitário.
 *
 * A amostra tem exatamente uma ocorrência de cada uma (dump 251 e 277) e não declara consumidor
 * direto de GAID pelo app. Attribution, Topics, Billing, FCM, Health Connect, consentimento UMP
 * e componentes dos SDKs não são alterados.
 *
 * A efetividade depende da versão do Android, da disponibilidade do Play Services/AdServices e da
 * configuração do usuário; App Set ID, Android ID e identificadores próprios ficam fora deste
 * mecanismo. Deve ser confirmada no aparelho conforme T6.
 */
@Suppress("unused")
val restrictAdvertisingIdInMyTherapyPatch = patch(
    name = "Restrict advertising ID in MyTherapy",
    description = "Removes GAID and AdServices Ad ID permissions to reduce ad tracking, keeping attribution, topics and consent untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val before = manifest.root.children("uses-permission")
                .filter { it.attribute(PERMISSION_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(before.size == ADVERTISING_ID_PERMISSIONS.size) {
                "Restrict advertising ID in MyTherapy: esperadas ${ADVERTISING_ID_PERMISSIONS.size} permissões, encontradas ${before.size}"
            }

            before.forEach { it.remove() }

            val after = manifest.root.children("uses-permission")
                .filter { it.attribute(PERMISSION_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(after.isEmpty()) {
                "Restrict advertising ID in MyTherapy: ainda restam ${after.size} permissões publicitárias"
            }

            println("Restrict advertising ID in MyTherapy: ${before.size} permissão(ões) removida(s).")
        }
    }
}
