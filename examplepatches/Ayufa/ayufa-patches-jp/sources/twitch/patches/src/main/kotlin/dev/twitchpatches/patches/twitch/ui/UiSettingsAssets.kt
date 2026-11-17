package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.RN_ASSET
import dev.twitchpatches.patches.twitch.shared.assetSource
import dev.twitchpatches.patches.twitch.shared.reactNativeAssetsPatch
import dev.twitchpatches.patches.twitch.shared.hermes.MetroExports
import dev.twitchpatches.patches.twitch.shared.hermes.twitchBundle
import dev.twitchpatches.patches.twitch.shared.hermes.dependencyModule
import dev.twitchpatches.patches.twitch.shared.uniqueHook
import dev.twitchpatches.patches.twitch.shared.parseResourceXml
import org.w3c.dom.Element

internal val uiSettingsAssetsPatch = resourcePatch {
    dependsOn(reactNativeAssetsPatch)
    execute {
        val bundle = twitchBundle()
        val exports = MetroExports(bundle)
        val sheet = exports.resolveDeferred("BottomSheet", setOf("children", "onClose", "scrollable", "footer"))
        val row = exports.resolveDeferred("SettingsListItem", setOf("title", "subtitle", "onPress", "disabled", "accessibilityRole"))
        val playback = exports.resolve("PlaybackSettingsSheet", setOf("visible", "onClose", "BottomSheet"))
        val chat = exports.resolve("ChatSettingsSheet", setOf("visible", "onClose", "BottomSheet"))
        exports.requireNestedContract("PlaybackSettingsSheet", setOf("playback-settings-sheet", "BottomSheet"))
        exports.requireNestedContract("ChatSettingsSheet", setOf("chat-settings", "containerSections", "BottomSheet"))
        val native = bundle.dependencyModule("openContentPreferencesOrWeb", "Linking")
        get(RN_ASSET).appendText("\n" + assetSource("ui-settings.js")
            .replace("__TWITCH_UI_SHEET_MODULE__", sheet.module.toString())
            .replace("__TWITCH_UI_ROW_MODULE__", row.module.toString())
            .replace("__TWITCH_UI_PLAYBACK_MODULE__", playback.module.toString())
            .replace("__TWITCH_UI_CHAT_SETTINGS_MODULE__", chat.module.toString())
            .replace("__TWITCH_UI_NATIVE_MODULE__", native.toString()))
        val thumbnailUrl = exports.resolve("getStreamThumbnailUrl",
            setOf("previewImageURL", "previewImageURLVertical"), params = 3)
        val followingThumbnail = exports.resolve("FollowingRowThumbnail",
            setOf("previewImageURL", "verticalPreviewImageURL"), params = 2)
        val skylineBackground = exports.resolve("SkylineThumbnailBackground",
            setOf("previewImageURL"), params = 2)
        val coreImage = exports.resolve("CoreImage", setOf("src", "resizeMode", "fadeDuration"))
        val chatReconnectingLine = exports.resolve("ChatReconnectingLine",
            setOf("StatusLine"), params = 2)
        val chatDisconnectedLine = exports.resolve("ChatDisconnectedLine",
            setOf("StatusLine"), params = 2)
        val chatConnectedLine = exports.resolve("ChatConnectedLine",
            setOf("event", "channelLogin", "StatusLine"), params = 2)
        val statusLine = exports.resolve("StatusLine", setOf("children", "testID"), params = 2)
        val coreText = exports.resolve("CoreText", setOf("color", "children"), params = 2)
        get(RN_ASSET).appendText("\n" + assetSource("ui-fixes.js")
            .replace("__TWITCH_THUMBNAIL_URL_MODULE__", thumbnailUrl.module.toString())
            .replace("__TWITCH_FOLLOWING_THUMBNAIL_MODULE__", followingThumbnail.module.toString())
            .replace("__TWITCH_SKYLINE_BACKGROUND_MODULE__", skylineBackground.module.toString())
            .replace("__TWITCH_CORE_IMAGE_MODULE__", coreImage.module.toString())
            .replace("__TWITCH_CHAT_RECONNECTING_LINE_MODULE__", chatReconnectingLine.module.toString())
            .replace("__TWITCH_CHAT_DISCONNECTED_LINE_MODULE__", chatDisconnectedLine.module.toString())
            .replace("__TWITCH_CHAT_CONNECTED_LINE_MODULE__", chatConnectedLine.module.toString())
            .replace("__TWITCH_STATUS_LINE_MODULE__", statusLine.module.toString())
            .replace("__TWITCH_CORE_TEXT_MODULE__", coreText.module.toString()))
        appendUiControls(bundle)
        prepareUiViewResources()
        validateUiPlayerLayout(get("res/layout/stream_settings_fragment.xml").readText())
    }
}

internal fun validateUiPlayerLayout(source: String) {
    val document = parseResourceXml(source, namespaceAware = true)
    val nodes = document.getElementsByTagName("androidx.core.widget.NestedScrollView")
    val scroll = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
        it.getAttributeNS("http://schemas.android.com/apk/res/android", "id") == "@id/options_scrollview"
    }.uniqueHook("native player settings scroll container")
    val children = (0 until scroll.childNodes.length).map { scroll.childNodes.item(it) }.filterIsInstance<Element>()
    require(children.size == 1 && children.single().tagName == "LinearLayout") {
        "UI settings: native player content layout changed."
    }
    val contents = children.single()
    require((0 until contents.childNodes.length).map { contents.childNodes.item(it) }.filterIsInstance<Element>().count {
        it.tagName == "TextView" && it.getAttributeNS("http://schemas.android.com/apk/res/android", "id") == "@id/profile_header"
    } == 1) { "UI settings: native player header layout changed." }
}
