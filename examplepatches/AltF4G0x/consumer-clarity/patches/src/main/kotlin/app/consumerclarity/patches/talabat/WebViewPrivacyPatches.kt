package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private const val WEBVIEW_SETTINGS = "Lcom/pichillilorenzo/flutter_inappwebview_android/webview/in_app_webview/InAppWebViewSettings;"
private const val WEBVIEW_HOOKS = "Lapp/consumerclarity/ConsumerClarityWebView;"

private fun webViewControl(name: String, description: String, key: String, hook: String) = consumerBytecodePatch(
    name = name,
    description = description,
    category = "WebView",
    key = key,
) {
    execute {
        mutableClassDefBy(WEBVIEW_SETTINGS).methods.single {
            it.name == "getRealSettings" &&
                it.parameterTypes == listOf("Lcom/pichillilorenzo/flutter_inappwebview_android/webview/InAppWebViewInterface;")
        }.addInstructions(
            0,
            "invoke-static {p0}, $WEBVIEW_HOOKS->$hook(Ljava/lang/Object;)V",
        )
    }
}

@Suppress("unused")
val webViewMediaGesturePatch = webViewControl(
    "Require WebView media gesture",
    "Prevents in-app WebView media from starting without a user gesture. Manual playback remains available.",
    "webview_media_gesture",
    "requireMediaGesture",
)

@Suppress("unused")
val webViewThirdPartyCookiesPatch = webViewControl(
    "Block third-party WebView cookies",
    "Blocks cross-site cookies inside Talabat's in-app WebView pages.",
    "webview_third_party_cookies",
    "blockThirdPartyCookies",
)

@Suppress("unused")
val webViewGeolocationPatch = webViewControl(
    "Disable WebView geolocation",
    "Prevents in-app WebView pages from requesting device location through the browser API.",
    "webview_geolocation",
    "disableGeolocation",
)

@Suppress("unused")
val webViewSafeBrowsingPatch = webViewControl(
    "Enable WebView safe browsing",
    "Requests Android Safe Browsing checks for in-app WebView pages.",
    "webview_safe_browsing",
    "enableSafeBrowsing",
)

@Suppress("unused")
val webViewFileAccessPatch = webViewControl(
    "Block WebView file access",
    "Prevents in-app WebView pages from reading arbitrary file URLs.",
    "webview_file_access",
    "blockFileAccess",
)

@Suppress("unused")
val webViewContentAccessPatch = webViewControl(
    "Block WebView content access",
    "Prevents in-app WebView pages from opening Android content URLs.",
    "webview_content_access",
    "blockContentAccess",
)

@Suppress("unused")
val webViewIncognitoPatch = webViewControl(
    "Use incognito WebView pages",
    "Requests private browsing behavior for in-app WebView pages. Signed-in pages may stop working.",
    "webview_incognito",
    "useIncognito",
)

@Suppress("unused")
val webViewDataSaverPatch = webViewControl(
    "Block WebView network images",
    "Reduces WebView data usage by blocking network-loaded images.",
    "webview_data_saver",
    "blockNetworkImages",
)

@Suppress("unused")
val webViewBackgroundAudioPatch = webViewControl(
    "Disable WebView background audio",
    "Prevents in-app WebView pages from continuing audio in the background.",
    "webview_background_audio",
    "disableBackgroundAudio",
)

@Suppress("unused")
val webViewDarkModePatch = webViewControl(
    "Force dark WebView content",
    "Requests dark rendering for supported in-app WebView pages. Flutter screens are unchanged.",
    "webview_dark_mode",
    "forceDark",
)

@Suppress("unused")
val webViewFormDataPatch = webViewControl(
    "Disable WebView form saving",
    "Prevents in-app WebView pages from saving form data.",
    "webview_form_data",
    "disableFormData",
)

@Suppress("unused")
val webViewPopupWindowsPatch = webViewControl(
    "Block WebView popup windows",
    "Prevents WebView JavaScript from opening additional windows automatically.",
    "webview_popup_windows",
    "blockPopupWindows",
)

@Suppress("unused")
val webViewDomStoragePatch = webViewControl(
    "Disable WebView DOM storage",
    "Disables WebView DOM storage. Some signed-in WebView pages may lose local state.",
    "webview_dom_storage",
    "disableDomStorage",
)

@Suppress("unused")
val webViewDatabasePatch = webViewControl(
    "Disable WebView database storage",
    "Disables the legacy WebView database API and its stored data.",
    "webview_database",
    "disableDatabase",
)

@Suppress("unused")
val webViewCachePatch = webViewControl(
    "Disable WebView cache",
    "Disables WebView caching to reduce retained browsing data. Network usage may increase.",
    "webview_cache",
    "disableCache",
)

@Suppress("unused")
val webViewMixedContentPatch = webViewControl(
    "Block WebView mixed content",
    "Blocks insecure HTTP content from loading inside HTTPS WebView pages.",
    "webview_mixed_content",
    "blockMixedContent",
)

@Suppress("unused")
val webViewFileUrlsPatch = webViewControl(
    "Block cross-origin WebView file URLs",
    "Blocks file URLs from reading other files or making cross-origin requests in WebView pages.",
    "webview_file_urls",
    "blockFileUrls",
)
