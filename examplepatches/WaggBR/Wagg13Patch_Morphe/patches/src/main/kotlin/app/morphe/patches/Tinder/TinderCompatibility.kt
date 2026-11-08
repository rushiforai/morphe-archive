package app.morphe.patches.tinder

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object TinderCompatibility {
    // Travado em 17.41.0 de propósito: o R8 renomeia classes/métodos a cada
    // versão do Tinder, então uma fingerprint escrita para esta build não
    // bate com outra. Declarar a versão aqui faz o Manager mostrar "17.41.0"
    // em vez de "qualquer" e evita que alguém aplique numa versão errada e
    // tenha um patch quebrado em silêncio.
    val TINDER = Compatibility(
        name = "Tinder",
        packageName = "com.tinder",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFD267A,
        targets = listOf(
            AppTarget(version = "17.41.0")
        )
    )
}
