package io.github.electroheavenvn.patches.shared.npatch

import io.github.electroheavenvn.patches.shared.loader.XposedLoader
import io.github.electroheavenvn.patches.shared.loader.integrateXposedLoader

@Deprecated(
    message = "Use integrateXposedLoader instead",
    replaceWith = ReplaceWith(
        "integrateXposedLoader(loader = XposedLoader.NPATCH, injectProvider = injectProvider, usesCleartextTraffic = usesCleartextTraffic)",
        "io.github.electroheavenvn.patches.shared.loader.integrateXposedLoader",
        "io.github.electroheavenvn.patches.shared.loader.XposedLoader",
    ),
)
fun integrateNPatch(
    injectProvider: Boolean,
    usesCleartextTraffic: Boolean,
) {
    integrateXposedLoader(
        loader = XposedLoader.NPATCH,
        injectProvider = injectProvider,
        usesCleartextTraffic = usesCleartextTraffic,
    )
}