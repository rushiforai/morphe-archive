package app.belkart.patches.wallet

import app.belkart.patches.shared.Constants.COMPATIBILITY_BELKART_PAY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

@Suppress("unused")
val quickAccessWalletPatch = bytecodePatch(
    name = "Поддержка кошелька Android",
    description = "Добавляет Белкарт Pay в системный кошелёк Android с реальной основной картой и " +
        "переходом из Wallet в штатный экран оплаты приложения.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BELKART_PAY)
    dependsOn(quickAccessWalletResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        classDefBy("Lcom/belkartpay/belkartpay/MainActivity;")
            .methods
            .first { it.name == "onCreate" && it.parameters.size == 1 }
            .toMutable()
            .addInstructions(
                0,
                """
                    invoke-static/range {p0 .. p0}, Lapp/belkart/extension/wallet/BelkartWalletPaymentHook;->onMainActivityCreate(Landroid/app/Activity;)V
                """
            )
    }
}
