package io.github.electroheavenvn.patches.zalo.xposed

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import io.github.electroheavenvn.patches.shared.loader.XposedLoader
import io.github.electroheavenvn.patches.shared.loader.integrateXposedLoader
import io.github.electroheavenvn.patches.zalo.misc.writeMicroGManifestPatch
import io.github.electroheavenvn.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

private val loaderOption = stringOption(
    key = "loader",
    default = "NPatch",
    values = mapOf(
        "NPatch (x64 only)" to "NPatch",
        "LSPatch (all ABIs)" to "LSPatch",
    ),
    title = "Xposed framework",
    description = "Select the rootless Xposed framework to integrate into the APK.",
) { it in values!!.values }

private val providerOption = booleanOption(
    key = "provider",
    default = false,
    title = "Inject file provider",
    description = "Injects a file provider to manage internal app data files. Useful for backup/restore Zalo data.",
)

private val cleartextOption = booleanOption(
    key = "cleartext",
    default = false,
    title = "Allow cleartext traffic",
    description = "Forces android:usesCleartextTraffic=\"true\" in manifest to allow plain HTTP traffic.",
)

@Suppress("unused")
val integrateZaloXposedPatch = patch(
    name = "Integrate ZaloXposed",
    description = "Integrates ZaloXposed using a rootless Xposed framework (NPatch or LSPatch). Must be enabled for other Zalo patches from EHVN patches to work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(writeMicroGManifestPatch)

    val loader by loaderOption()
    val provider by providerOption()
    val cleartext by cleartextOption()

    finalize {
        integrateXposedLoader(
            loader = XposedLoader.fromString(loader),
            injectProvider = provider ?: false,
            usesCleartextTraffic = cleartext ?: false,
        )
    }
}