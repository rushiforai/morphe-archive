package app.rimixyz.patches.notisave

import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NOTISAVE

/**
 * Concede o estado premium local lido pelo Notisave 274.1.3.2.
 *
 * O árbitro é único: `com.zipoapps.premiumhelper.c.hasActivePurchase()` devolve
 * `SharedPreferences.getBoolean("has_active_purchase", false)`. A partir dele vêm:
 *
 * - o paywall "START LIKE A PRO / Unlock All Features" exibido no splash;
 * - o texto de VIP Customer Support em SettingsFragment;
 * - a visibilidade do item "Remove Ads" em BottomNavigationFragment;
 * - os cadeados de preferências via T9.b.isUnlocked();
 * - a remoção do banner na activity principal;
 * - a recusa de intersticiais e recompensados nos managers do premiumhelper.
 *
 * Confirmado em execução no LDPlayer: com `has_active_purchase=true` o paywall desaparece;
 * sem a flag, o paywall aparece. O patch apenas devolve `true` no getter: não escreve a
 * preferência, não fabrica token/recibo, não chama o Play Billing e não altera o fluxo real
 * de compra em G9.c/G9.g.
 *
 * Limite: recursos cuja autorização final viva fora do APK (API da Tenqube/Firehawk) não
 * são alterados. Nada nesse sentido foi encontrado no caminho do gate analisado.
 */
@Suppress("unused")
val unlockPremiumInNotisavePatch = patch(
    name = "Unlock premium",
    description = "Grants the local premium state the app reads for its paywall, VIP support, settings locks and ad-free UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTISAVE)

    execute {
        verifyNotisaveTarget()

        // Árbitro único. Equivale a: const/4 v0, 0x1 ; return v0
        HasActivePurchaseFingerprint.method.returnEarly(true)
    }
}
