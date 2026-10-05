package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.*
import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports

internal val reactNativeReloadPatch = resourcePatch {
    dependsOn(reactNativeBridgePatch)
    execute {
        val bundle = HermesBundle(get("assets/index.android.bundle").readBytes())
        val exports = MetroExports(bundle)
        val screen = exports.resolve("TheatreScreen", setOf("TheatreStoreProvider", "PictureInPictureProvider"), 1)
        val data = exports.resolve("useTheatreData", setOf("useState", "useVideoAccessToken", "refetchVideoToken"), 3)
        val controls = exports.resolve("PlayerControlsOverlay", setOf("onMuteToggle", "visible", "IconButton", "Tooltip"))
        val icon = exports.resolve("RawIconRefresh", setOf("Path", "default"))
        val toast = exports.resolveObjectExport("default", setOf("SHORT", "LONG", "show", "showWithGravity", "showWithGravityAndOffset"),
            mapOf("show" to 3, "showWithGravity" to 4, "showWithGravityAndOffset" to 6))
        exports.requireFunctionContract("TheatreContent", 1, setOf("useTheatreData", "refreshVideoToken", "TheatreVideoComposition"))
        requireReloadCounter(bundle)
        listOf("reload-owner.js", "reload-control.js", "reload-adapters.js").forEach { file ->
            get(RN_ASSET).appendText("\n" + assetSource(file)
                .replace("__TWITCH_THEATRE_SCREEN_MODULE__", screen.module.toString())
                .replace("__TWITCH_THEATRE_DATA_MODULE__", data.module.toString())
                .replace("__TWITCH_PLAYER_CONTROLS_MODULE__", controls.module.toString())
                .replace("__TWITCH_REFRESH_ICON_MODULE__", icon.module.toString())
                .replace("__TWITCH_TOAST_MODULE__", toast.module.toString()))
        }
    }
}
