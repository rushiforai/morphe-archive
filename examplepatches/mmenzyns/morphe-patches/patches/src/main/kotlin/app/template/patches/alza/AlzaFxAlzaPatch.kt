package app.template.patches.alza

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ALZA

@Suppress("unused")
val alzaFxAlzaPatch = bytecodePatch(
    name = "Alza Smart Link Sharing (FxAlza & Clean) (CZ / SK)",
    description = "Enhances shared and copied Alza product links: enables fxalza.cz (or sk.fxalza.cz) domain for rich embeds on Discord and social media, and removes the 'Odesláno z aplikace Alza' promotional text. Configurable in Menu settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ALZA)

    extendWith("extensions/extension.mpe")

    execute {
        with(AlzaHookManager) {
            // 1. Enable patch at app startup and fragment create
            injectApplicationInit(
                """
                    const/4 v0, 1
                    invoke-static {v0}, ${AlzaHookManager.EXTENSION_CLASS}->setFxAlzaPatchEnabled(Z)V
                """
            )
            injectGodFragmentInit(
                """
                    const/4 v0, 1
                    invoke-static {v0}, ${AlzaHookManager.EXTENSION_CLASS}->setFxAlzaPatchEnabled(Z)V
                """
            )

            // 2. Hook native ShareCommand.Companion.share
            try {
                val shareMethod = ShareCommandShareFingerprint.method
                shareMethod.addInstructions(
                    0,
                    """
                        invoke-static {p1}, ${AlzaHookManager.EXTENSION_CLASS}->processSharedText(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object p1
                    """
                )
            } catch (ignored: Throwable) {}

            // 3. Ensure settings hook
            ensureSettingsHooked()
        }
    }
}
