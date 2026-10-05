package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal const val RN_ASSET = "assets/twitchpatches-runtime.js"

internal val reactNativeAssetsPatch = resourcePatch {
    execute {
        val original = HermesBundle(get("assets/index.android.bundle").readBytes())
        val react = MetroExports(original).reactModule()
        get(RN_ASSET).writeText(assetSource("bootstrap.js").replace("__TWITCH_REACT_MODULE__", react.toString()))
    }
}

internal fun ResourcePatchContext.appendReactAdapter(export: String, properties: Set<String>, policy: Int?) {
    val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
    val target = MetroExports(bundle).resolve(export, properties)
    val source = if (policy == null) assetSource("auto-claim.js") else assetSource("hide-component.js")
    get(RN_ASSET).appendText("\n" + source.replace("__TWITCH_TARGET_MODULE__", target.module.toString())
        .replace("__TWITCH_TARGET_EXPORT__", export).replace("__TWITCH_POLICY_INDEX__", policy.toString())
        .replace("__TWITCH_TARGET_REGISTRATION__", "undefined"))
}

internal fun assetSource(name: String): String = requireNotNull(TwitchTarget::class.java
    .getResourceAsStream("/reactnative/$name")).bufferedReader().use { it.readText() }
