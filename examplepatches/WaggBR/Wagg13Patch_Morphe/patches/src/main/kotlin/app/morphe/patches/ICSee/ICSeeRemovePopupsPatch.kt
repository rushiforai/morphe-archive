package app.morphe.patches.icsee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// Só insere "return-void" no índice 0 (nunca apaga instruções), mesma regra usada no
// patch do BuzzCast para não gerar VerifyError por blocos try/catch órfãos.
@Suppress("unused")
val iCSeeRemovePopupsPatch = bytecodePatch(
    name = "iCSee Remove Pop-ups",
    description = "Hides the promotion window that pops up on the main screens.",
) {
    compatibleWith(ICSEE_COMPATIBILITY)

    execute {
        // Não pede a promoção ao servidor...
        HomePopRequestFingerprint.method.addInstructions(0, "return-void")
        // ...e, se ela chegar por outro caminho (telas de monitor), não desenha a janela.
        HomePopShowFingerprint.method.addInstructions(0, "return-void")
    }
}
