package app.parchefacemoji.patches.facemoji.privacy

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.parchefacemoji.patches.facemoji.shared.Constants.COMPATIBILITY_FACEMOJI

/** Permiso que da acceso al identificador de publicidad del dispositivo (Android 13+). */
private const val AD_ID_PERMISSION = "com.google.android.gms.permission.AD_ID"

/**
 * Quita el permiso `AD_ID` del manifiesto.
 *
 * Sin ese permiso el sistema devuelve un identificador de publicidad puesto a cero, de modo
 * que la app (y las librerias de terceros que van dentro de ella) no puede identificar el
 * dispositivo para publicidad. Es el mismo mecanismo que ofrece Android en los ajustes de
 * privacidad, pero aplicado siempre.
 *
 * Se implementa sobre el manifiesto y no sobre el bytecode porque es un cambio declarativo:
 * no depende del codigo ofuscado de la app y por tanto no se rompe al actualizarla.
 */
@Suppress("unused")
val removeAdIdPermissionPatch = patch(
    name = "Quitar permiso de ID de publicidad",
    description = "Elimina el permiso AD_ID del manifiesto para que la app no pueda leer el " +
            "identificador de publicidad del dispositivo.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FACEMOJI)

    category("Privacidad")

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            // Puede no existir: en ese caso la app ya no usa el permiso y no hay nada que hacer.
            manifest.elementByAttributeOrNull("android:name", AD_ID_PERMISSION)?.remove()
        }
    }
}
