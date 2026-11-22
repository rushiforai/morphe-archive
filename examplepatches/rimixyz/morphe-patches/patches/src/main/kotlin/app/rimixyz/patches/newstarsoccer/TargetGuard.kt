package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de segurança para os patches do New Star Soccer.
 *
 * O `compatiblePackages` já restringe pacote, versão e versionCode (142), mas as fingerprints
 * desta versão são ancoradas em classes do jogo e uma entrada inesperada poderia produzir um
 * APK quebrado. A checagem é repetida no execute para falhar com diagnóstico claro antes de
 * qualquer modificação.
 */
internal fun verifyNewStarSoccerTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "com.newstargames.newstarsoccer" &&
            metadata.versionName == "4.34" &&
            metadata.versionCode == "142"
    ) {
        "New Star Soccer: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado com.newstargames.newstarsoccer 4.34 versionCode=142"
    }
}
