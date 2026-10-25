package app.template.patches.firefoxfocus.misc.aboutconfig

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags

internal const val GECKO_RUNTIME = "Lorg/mozilla/geckoview/GeckoRuntime;"
internal const val GECKO_RUNTIME_SETTINGS = "Lorg/mozilla/geckoview/GeckoRuntimeSettings;"

// GeckoView's public API (kept by its consumer rules). Focus's EngineProvider builds the settings
// with aboutConfigEnabled(false) on release builds and hands them to this method, the only place
// Focus creates its runtime; create(Context) delegates here too.
internal object GeckoRuntimeCreateFingerprint : Fingerprint(
    definingClass = GECKO_RUNTIME,
    name = "create",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = GECKO_RUNTIME,
    parameters = listOf("Landroid/content/Context;", GECKO_RUNTIME_SETTINGS),
)

@Suppress("unused")
val enableAboutConfigPatch = bytecodePatch(
    name = "Enable about:config",
    description = "Enables about:config.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    execute {
        // The setter commits the "general.aboutConfig.enable" pref. Before init there is no runtime
        // attached, so it only stores the value, and init sends it to Gecko with the other settings.
        val settings = classDefByOrNull(GECKO_RUNTIME_SETTINGS)
            ?: throw PatchException("$GECKO_RUNTIME_SETTINGS not found")
        if (settings.methods.none {
                it.name == "setAboutConfigEnabled" && it.returnType == GECKO_RUNTIME_SETTINGS &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.implementation != null
            }
        ) {
            throw PatchException("$GECKO_RUNTIME_SETTINGS has no setAboutConfigEnabled(Z)")
        }

        // At the method's entry every local is free; v0 carries the true.
        val create = GeckoRuntimeCreateFingerprint.method
        if (create.implementation!!.registerCount <= create.parameterTypes.size) {
            throw PatchException("$GECKO_RUNTIME->create has no local register")
        }
        create.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x1
                invoke-virtual {p1, v0}, $GECKO_RUNTIME_SETTINGS->setAboutConfigEnabled(Z)$GECKO_RUNTIME_SETTINGS
            """,
        )
    }
}
