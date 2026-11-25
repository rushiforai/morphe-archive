package app.rimixyz.patches.habitnow

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de segurança para os patches do HabitNow.
 *
 * As fingerprints foram ancoradas no `base.apk` de `com.habitnow` 2.5.5
 * (versionCode 229, SHA-256 do bundle
 * 0FD4E0BC0E6A00331FEE7AE1DAC188A46F07935EE46CEB9A2F7CD43E6B57DE6E).
 * A compatibilidade já restringe pacote, versão, código e certificado, mas a
 * checagem é repetida no início de cada `execute` para evitar um APK quebrado
 * caso o patch seja aplicado a outra entrada.
 */
internal fun verifyHabitNowTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "com.habitnow" &&
            metadata.versionName == "2.5.5" &&
            metadata.versionCode == "229"
    ) {
        "HabitNow: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado com.habitnow 2.5.5 versionCode=229"
    }
}
