// Ported from xob0t/morphe-patches (GPLv3), app/avito/patches/updates/DisableUpdatePromptsPatch.kt.
package app.ru_apps.avito.updates

import app.ru_apps.avito.settings.MorpheSettingsRegistry
import app.ru_apps.avito.settings.morpheSettingsPatch
import app.ru_apps.avito.Constants.COMPATIBILITY_AVITO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val MORPHE_SETTINGS_CLASS = "Lapp/avito/morphe/MorpheSettings;"
private const val SETTING_KEY = "avito_disable_updates"

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Prevents Avito's force-update screen opener from launching update screens. " +
        "Toggleable in Настройки Morphe.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AVITO)
    dependsOn(morpheSettingsPatch)

    execute {
        MorpheSettingsRegistry.addSwitch(
            key = SETTING_KEY,
            title = "Отключить обновления",
            summary = "Не показывать экраны принудительного обновления",
            default = true,
            section = MorpheSettingsRegistry.Section.APP,
            order = 20,
        )

        // Gate the opener: return early (suppress the update screen) only while the
        // toggle is on; otherwise fall through to Avito's stock behaviour, so the
        // user can flip it off at runtime without rebuilding.
        val method = ForceUpdateOpenFingerprint.method
        method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "$SETTING_KEY"
                const/4 v1, 0x1
                invoke-static {v0, v1}, $MORPHE_SETTINGS_CLASS->isEnabled(Ljava/lang/String;Z)Z
                move-result v0
                if-eqz v0, :stock
                return-void
            """,
            ExternalLabel("stock", method.getInstruction(0)),
        )
    }
}
