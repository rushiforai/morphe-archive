package app.parchefacemoji.patches.facemoji.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Facemoji AI Emoji Keyboard.
     *
     * En APKMirror / UpToDown la app se publica como BUNDLE, que Morphe gestiona como APKM.
     * Si se declara otro tipo, Morphe Manager no enlazara al usuario a la descarga correcta.
     */
    val COMPATIBILITY_FACEMOJI = Compatibility(
        name = "Facemoji AI Emoji Keyboard",
        packageName = "com.simejikeyboard",
        description = "Teclado con emojis, fuentes y temas de Nexileap.",
        apkFileType = ApkFileType.APKM,
        // Color de fondo del icono de la app en Morphe Manager.
        appIconColor = 0xE0245E,
        targets = listOf(
            // Version objetivo del desarrollo (APKMirror la publica como BUNDLE, ".apkm").
            AppTarget(
                version = "3.7.0",
                // Huellas comprobadas contra la APK 3.7.0 real (2 arquitecturas, APKMirror) y
                // parcheo verificado en CI: el bundle se aplica a esa APK, se genera el APK
                // parcheado y las inyecciones estan en su clase (analisis/96-verificacion-apk.txt).
                isExperimental = false,
                description = "Version objetivo. Huellas y parcheo verificados en CI; " +
                        "el aspecto final no se ha revisado en dispositivo.",
            ),
            // En 3.7.0 los metodos objetivo tienen nombre propio (beans y gestores), pero
            // R8 puede cambiarlos en una version futura: se deja abierta como experimental.
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Cualquier otra version de Facemoji. Experimental: los objetivos " +
                        "pueden haber cambiado. Abre una incidencia si el parche falla.",
            ),
        ),
    )
}
