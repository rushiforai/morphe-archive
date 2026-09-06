package app.discord.patches.updater

import app.discord.patches.banner.DiscordConstants
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

/**
 * Discord ships its own OTA updater (BundleUpdater): at startup
 * DCDReactNativeHost.getJSBundleFile() returns a downloaded bundle from
 * the app data dir when one exists, and only then do the Hermes patches
 * in the APK silently stop working (banner returns, composer gift
 * returns). Observed on device: both patches died together after an
 * update landed.
 *
 * This patch replaces that method's whole body with `return null`, which
 * is the updater's own documented fallback (existing :cond_0 path):
 * React Native then loads index.android.bundle from the APK assets —
 * the patched one. Verified per version by the CLI run plus smali
 * re-decode of the patched APK.
 *
 * Trade-off: official JS updates stop arriving until the APK itself is
 * updated. That is inherent to Hermes patching; without this pin the
 * other patches cannot survive.
 */
val pinBuiltInBundlePatch = bytecodePatch(
    name = "Pin app to built-in bundle",
    description = "Forces Discord to always run the bundle inside the APK and ignore downloaded (OTA) updates, which would otherwise silently undo the other patches. Turn this off (or update the APK) to receive official updates.",
    default = true,
) {
    compatibleWith(DiscordConstants.COMPATIBILITY_DISCORD)

    execute {
        val clazz = mutableClassDefByOrNull("Lcom/discord/bridge/DCDReactNativeHost;")
            ?: error("DCDReactNativeHost not found - patch needs re-analysis.")
        val method = clazz.methods.singleOrNull {
            it.name == "getJSBundleFile" &&
                it.returnType == "Ljava/lang/String;" &&
                it.parameters.isEmpty()
        } ?: error("DCDReactNativeHost.getJSBundleFile() not found - patch needs re-analysis.")

        val impl = checkNotNull(method.implementation) {
            "DCDReactNativeHost.getJSBundleFile() has no implementation - patch needs re-analysis."
        }
        while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
        impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        impl.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
    }
}
