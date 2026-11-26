package app.rimixyz.patches.notisave

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de segurança para os patches do Notisave.
 *
 * As fingerprints foram ancoradas no base.apk de com.tenqube.notisave 274.1.3.2
 * (versionCode 316, SHA-256 AD585A8DC99B42D6CAD3C4F1F6A9BACA8CEBC8CBC1ACD44E517400F38A338C10).
 * A compatibilidade já restringe pacote, versão, código e certificado; a checagem é repetida
 * no início de cada execute para evitar um APK quebrado caso a entrada seja trocada.
 */
internal fun verifyNotisaveTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "com.tenqube.notisave" &&
            metadata.versionName == "274.1.3.2" &&
            metadata.versionCode == "316"
    ) {
        "Notisave: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado com.tenqube.notisave 274.1.3.2 versionCode=316"
    }
}
