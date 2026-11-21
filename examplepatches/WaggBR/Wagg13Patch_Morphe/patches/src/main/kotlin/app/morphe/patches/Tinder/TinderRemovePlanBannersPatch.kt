package app.morphe.patches.tinder.upsells

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

/**
 * Banner dourado "TINDER Gold – Veja quem curtiu você" na tela de perfil.
 * Composable estático do subsistema "Controlla" (tags `controlla_banner` / `controlla_tier_banner`),
 * 17.41.0: `bk10->c`. Retornar no índice 0 acontece antes de qualquer startRestartGroup,
 * então o composer não fica desbalanceado e nada é desenhado.
 */
private object ProfileGoldBannerFingerprint : Fingerprint(
    definingClass = "Lbk10;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Lyl2;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljhk;",
        "Lvy5;",
        "I",
    ),
)

/**
 * Cards Platinum / Gold / Plus na tela de Configurações.
 * `RevenueSettingsPurchaseView.a(aqt)` recebe o estado da view; aqt.a/b/c são as visibilidades
 * dos três cards. Substituímos o estado por uma cópia com os três em `false`, mantendo
 * d/e/f (Super Likes, Boosts, etc.). Os itens abaixo sobem sozinhos (views GONE).
 */
private object SettingsTierCardsFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/feature/revenuesettingspurchase/internal/RevenueSettingsPurchaseView;",
    name = "a",
    returnType = "V",
    parameters = listOf("Laqt;"),
)

/**
 * Banner "TINDER GOLD – Use as preferências premium…" [Desbloquear] nas preferências de descoberta.
 * Composable `hp10->l`, chamado pelo fragment de PremiumDiscoveryPreferences (clique =
 * paywall PREFERENCES_BANNER).
 */
private object DiscoveryPrefsBannerFingerprint : Fingerprint(
    definingClass = "Lhp10;",
    name = "l",
    returnType = "V",
    parameters = listOf(
        "I",
        "Lvy5;",
        "Ljhk;",
        "Lkotlin/jvm/functions/Function0;",
    ),
)

/**
 * Botão branco "Conferir todas as curtidas" no rodapé da aba Curtidas (FastMatch / Gold Home).
 * Composable do CTA de upsell (`fh10->a`): variante botão (`Lamb`, tag UPSELL_CTA_BUTTON) ou
 * pill de tier (`Lbmb`, tag UPSELL_CTA_PILL). Retornar no índice 0 antes do startRestartGroup
 * não desenha nenhuma das duas.
 */
private object LikesUpsellCtaFingerprint : Fingerprint(
    definingClass = "Lfh10;",
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Lcmb;",
        "Lkotlin/jvm/functions/Function0;",
        "Ljhk;",
        "Lvy5;",
        "I",
    ),
)

@Suppress("unused")
val tinderRemovePlanBannersPatch = bytecodePatch(
    name = "Tinder Remove Plan Banners",
    description = "Removes the Gold/Platinum/Plus self-promotion banners and cards (profile, settings, discovery preferences) and the See All Likes button on the Likes tab.",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        ProfileGoldBannerFingerprint.method.addInstructions(0, "return-void")

        DiscoveryPrefsBannerFingerprint.method.addInstructions(0, "return-void")

        LikesUpsellCtaFingerprint.method.addInstructions(0, "return-void")

        // p1 = Laqt; (registradores locais v0..v4 estão livres no índice 0)
        SettingsTierCardsFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Laqt;
                const/4 v1, 0x0
                iget-object v2, p1, Laqt;->d:Low00;
                iget-object v3, p1, Laqt;->e:Lmw00;
                iget-boolean v4, p1, Laqt;->f:Z
                invoke-direct {v0, v1, v1, v1, v2, v3, v4}, Laqt;-><init>(ZZZLow00;Lmw00;Z)V
                move-object p1, v0
            """.trimIndent(),
        )
    }
}
