package app.morphe.patches.tinder.upsells

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

/**
 * `OfferNotificationPillViewModel.show(Phase)` (17.41.0: `offernotificationpill/internal/f->z`).
 * É o único ponto que marca o pill como visível (`Lm1m.a = true`) e inicia o timer de
 * auto-dismiss. `A()` (showIfEligible), o fluxo de eventos (`e.emit`) e a janela de lembrete
 * (`startObservingReminderWindow`) acabam todos chamando este método.
 */
private object OfferPillShowFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/library/offernotificationpill/internal/f;",
    name = "z",
    returnType = "V",
    parameters = listOf(
        "Lcom/tinder/library/offernotificationpill/internal/OfferNotificationPillPhase;",
    ),
)

@Suppress("unused")
val tinderRemoveOfferPillPatch = bytecodePatch(
    name = "Tinder Remove Offer Pill",
    description = "Removes the discount offer pill shown at the bottom of the swipe screen.",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        // Nunca mostra o pill: o estado fica invisível e nenhum timer é criado.
        OfferPillShowFingerprint.method.addInstructions(
            0,
            """
                return-void
            """.trimIndent(),
        )
    }
}
