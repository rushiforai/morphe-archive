package app.rimixyz.patches.mytherapy

import app.morphe.patcher.patch.packageMetadata

/**
 * Barreira de segurança para os patches do MyTherapy.
 *
 * O `compatiblePackages` já restringe pacote, versão, código e certificado, mas as fingerprints
 * desta versão são ancoradas em classes dos DEX do base.apk analisado. Uma entrada inesperada
 * poderia produzir um APK quebrado, então a checagem é repetida no início de cada `execute`.
 */
internal fun verifyMyTherapyTarget() {
    val metadata = packageMetadata
    check(
        metadata.packageName == "eu.smartpatient.mytherapy" &&
            metadata.versionName == "4.16.2" &&
            metadata.versionCode == "4016002"
    ) {
        "MyTherapy: alvo inesperado " +
            "(${metadata.packageName} ${metadata.versionName} versionCode=${metadata.versionCode}); " +
            "esperado eu.smartpatient.mytherapy 4.16.2 versionCode=4016002"
    }
}
