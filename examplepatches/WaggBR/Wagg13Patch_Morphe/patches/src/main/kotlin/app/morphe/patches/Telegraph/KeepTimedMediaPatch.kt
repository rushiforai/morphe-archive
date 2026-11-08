package app.morphe.patches.telegraph

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// Os métodos de MessageObject mantêm o nome original (só a classe é ofuscada: sl na 13.0.2.0) e
// cada nome abaixo existe em uma única classe, então o casamento é por nome + assinatura.
// Na 13.0.2.0 há dois overloads de isSecretMedia e de shouldEncryptPhotoOrVideo; o overload
// sem parâmetros de shouldEncryptPhotoOrVideo só delega para o (I, Message), que é o patchado.
@Suppress("unused")
val keepTimedMediaPatch = bytecodePatch(
    name = "Keep timed media",
    description = "Stops photos, videos and voice messages with a timer from being treated as self-destructing media.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)

    val messageParam = "Lorg/telegram/tgnet/TLRPC\$Message;"

    val fingerprints = listOf(
        Fingerprint(name = "isSecretMedia", returnType = "Z", parameters = listOf()),
        Fingerprint(name = "isSecretMedia", returnType = "Z", parameters = listOf(messageParam)),
        Fingerprint(name = "isSecretPhotoOrVideo", returnType = "Z", parameters = listOf(messageParam)),
        Fingerprint(name = "shouldEncryptPhotoOrVideo", returnType = "Z", parameters = listOf("I", messageParam)),
        Fingerprint(name = "isVoiceOnce", returnType = "Z", parameters = listOf()),
        Fingerprint(name = "isRoundOnce", returnType = "Z", parameters = listOf()),
        Fingerprint(name = "needDrawBluredPreview", returnType = "Z", parameters = listOf()),
    )

    execute {
        fingerprints.forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}
