package app.rimixyz.patches.autoclicker

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de segurança para os patches do Auto Clicker.
 *
 * As fingerprints foram ancoradas no `Auto-Clicker-Automatic-tap_2.3.0_apkcube.apk`
 * (SHA-256 2A48AF68982BFF95588B740AAED2DE2994DD1A26A419CD66DB929B13CEBB3975).
 * A compatibilidade já restringe pacote, versão, código e certificado; a checagem
 * é repetida no início de cada `execute` para evitar um APK quebrado caso o
 * patch seja aplicado a outra entrada.
 */
internal fun verifyAutoClickerTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "com.truedevelopersstudio.automatictap.autoclicker" &&
            metadata.versionName == "2.3.0" &&
            metadata.versionCode == "93"
    ) {
        "Auto Clicker: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado com.truedevelopersstudio.automatictap.autoclicker 2.3.0 versionCode=93"
    }
}
