package app.belkart.patches.nfc

import app.belkart.patches.shared.Constants.COMPATIBILITY_BELKART_PAY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

@Suppress("unused")
val autoEnableNfcPatch = bytecodePatch(
    name = "Автоматическое включение NFC",
    description = "Пытается включить NFC при запуске Белкарт Pay через root-доступ.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BELKART_PAY)
    extendWith("extensions/extension.mpe")

    execute {
        // Hook MainActivity.onCreate instead of Application.onCreate:
        // this guarantees the hook runs when the UI is shown and has a direct Activity reference.
        classDefBy("Lcom/belkartpay/belkartpay/MainActivity;")
            .methods
            .first { it.name == "onCreate" && it.parameters.size == 1 }
            .toMutable()
            .addInstructions(
                0,
                """
                    invoke-static/range {p0 .. p0}, Lapp/belkart/extension/nfc/RootNfcEnableHook;->onMainActivityCreate(Landroid/app/Activity;)V
                """
            )
    }
}
