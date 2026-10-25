package app.template.patches.firefox.misc.aboutconfig

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionChecked

internal const val GECKO_RUNTIME_SETTINGS_BUILDER = "Lorg/mozilla/geckoview/GeckoRuntimeSettings\$Builder;"

@Suppress("unused")
val enableAboutConfigPatch = bytecodePatch(
    name = "Enable about:config",
    description = "Enables about:config.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // GeckoProvider passes "is this Nightly/Beta/debug" to the GeckoView builder, which stores
        // it in general.aboutConfig.enable. The builder takes true whatever it is passed; the
        // release channel itself is not changed. Its return type (the Builder) is not pinned.
        concreteMethod(GECKO_RUNTIME_SETTINGS_BUILDER, "aboutConfigEnabled", listOf("Z"))
            .addInstructionChecked(0, "const/4 p1, 0x1")
    }
}
