package io.github.electroheavenvn.patches.zalo.xposed

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import io.github.electroheavenvn.patches.shared.npatch.integrateNPatch
import io.github.electroheavenvn.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

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

private val useMicroGOption = booleanOption(
    key = "useMicroG",
    default = false,
    title = "Use MicroG",
    description = "Redirects GMS calls to MicroG.",
)

@Suppress("unused")
val integrateXposedPatch = resourcePatch(
    name = "Integrate ZaloXposed",
    description = "Integrates ZaloXposed using NPatch. Must be enabled for other patches to work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    val provider by providerOption()
    val cleartext by cleartextOption()
    val useMicroG by useMicroGOption()

    finalize {
        integrateNPatch(
            injectProvider = provider ?: false,
            usesCleartextTraffic = cleartext ?: false,
            useMicroG = useMicroG ?: false,
        )
    }
}


