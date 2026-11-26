package app.rimixyz.patches.xrecorder

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de seguranca para os patches experimentais do XRecorder.
 *
 * As fingerprints foram ancoradas no base.apk de
 * videoeditor.videorecorder.screenrecorder 2.5.6.1 (versionCode 2561002,
 * SHA-256 bbbefb52804ba7a16d8c5508ef5b99dc2130cfd899f374867eed8ff5e3eef1b7).
 * A compatibilidade ja restringe pacote, versao, codigo e certificado; esta
 * checagem evita aplicar um patch quebrado caso another bundle seja selecionado.
 */
internal fun verifyXRecorderTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "videoeditor.videorecorder.screenrecorder" &&
            metadata.versionName == "2.5.6.1" &&
            metadata.versionCode == "2561002"
    ) {
        "XRecorder: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado videoeditor.videorecorder.screenrecorder 2.5.6.1 versionCode=2561002"
    }
}
