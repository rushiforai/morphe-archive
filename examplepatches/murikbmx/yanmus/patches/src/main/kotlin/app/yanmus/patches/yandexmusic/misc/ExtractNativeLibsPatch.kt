package app.yanmus.patches.yandexmusic.misc

import app.morphe.patcher.patch.resourcePatch
import app.yanmus.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import org.w3c.dom.Element

/**
 * The app is built with android:extractNativeLibs="false": native libs must then be stored uncompressed
 * and page aligned in the apk. An apk rebuilt on the phone (Morphe Manager) may not keep that layout, and the
 * install fails with INSTALL_FAILED_NO_MATCHING_ABIS ("Failed to extract native libraries, res=-113").
 * With extractNativeLibs="true" the installer extracts the libs itself, whatever their layout.
 */
@Suppress("unused")
val extractNativeLibsPatch = resourcePatch(
    name = "Extract native libraries",
    description = "Исправляет ошибку установки INSTALL_FAILED_NO_MATCHING_ABIS после патчинга на телефоне: " +
        "библиотеки извлекаются при установке (приложение займёт на пару МБ больше).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
