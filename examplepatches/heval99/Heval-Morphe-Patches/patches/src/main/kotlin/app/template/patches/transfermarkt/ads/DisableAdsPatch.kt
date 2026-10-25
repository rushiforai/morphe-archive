package app.template.patches.transfermarkt.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRANSFERMARKT
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import app.template.patches.transfermarkt.shared.interceptWebViewRequests
import app.template.patches.transfermarkt.shared.webViewBlocklistExtensionPatch

internal const val INDEX_HTML = "assets/www/index.html"
internal const val WWW_DIR = "assets/www"

// index.html loads the Angular main bundle by its content hash (4.3.2: main.00ad1d563bd0c4f2.js).
internal val MAIN_BUNDLE_REGEX = Regex("""src="(main\.[0-9a-f]+\.js)"""")

// The ad slot components: every page places <app-adtags>, the match pages <app-odd-banner>.
internal const val AD_SLOT_STYLE = "<style>app-adtags,app-odd-banner{display:none!important}</style>"

// The AdtagService methods every page calls to show ads through Ströer's SDG publisher tag:
// refreshAds / refreshSingleAds (re-register the page's slots), appendAdtags (first slots) and
// loadInterstitial. Only the definitions with a parameter list in main.js match: the gallery
// component's own refreshAds() in a lazy chunk just calls the service and stays as it is.
internal val AD_METHODS = listOf("refreshAds", "refreshSingleAds", "appendAdtags", "loadInterstitial")

/** A method definition `name(a,b){` (at least one parameter) that is not a `.name(` call. */
internal fun adMethodRegex(name: String) =
    Regex("""(?<![\w$.])$name\([A-Za-z_$][\w$]*(?:,[A-Za-z_$][\w$]*)*\)\{""")

// The feature table entry that allows the Outbrain "recommended" widget on transfermarkt.de only.
internal const val OUTBRAIN_FEATURE = """{name:"outbrain",denied:["*"],allow:["de"]}"""
internal const val OUTBRAIN_FEATURE_OFF = """{name:"outbrain",denied:["*"],allow:[]}"""

private fun String.replaceOnce(old: String, new: String, label: String): String {
    val first = indexOf(old)
    if (first < 0 || indexOf(old, first + 1) >= 0) {
        throw PatchException("Disable ads: expected exactly one $label")
    }
    return replaceRange(first, first + old.length, new)
}

/**
 * The web app's own ad code, edited in place in the APK's assets (raw: the resource table is
 * not decoded, see AGENTS.md rule 12).
 */
private val disableWebAdsPatch = rawResourcePatch {
    compatibleWith(COMPATIBILITY_TRANSFERMARKT)

    execute {
        val index = get(INDEX_HTML)
        if (!index.exists()) {
            throw PatchException("$INDEX_HTML not found. The web app lives in the base split: patch a merged APK.")
        }
        val html = index.readText()

        // 1. The ad slot elements are hidden, so no empty ad frame reserves space.
        index.writeText(html.replaceOnce("</head>", "$AD_SLOT_STYLE</head>", "</head> in $INDEX_HTML"))

        // 2. The AdtagService ad methods return at once, so no slot is ever registered with SDG.
        val bundleName = MAIN_BUNDLE_REGEX.findAll(html).map { it.groupValues[1] }.toList().singleOrNull()
            ?: throw PatchException("Disable ads: expected one main.<hash>.js script in $INDEX_HTML")
        val bundle = get("$WWW_DIR/$bundleName")
        if (!bundle.exists()) throw PatchException("Disable ads: $WWW_DIR/$bundleName not found")

        var js = bundle.readText()
        for (name in AD_METHODS) {
            val definitions = adMethodRegex(name).findAll(js).toList()
            val definition = definitions.singleOrNull() ?: throw PatchException(
                "Disable ads: expected one $name(...){ definition in $bundleName, found ${definitions.size}",
            )
            val bodyStart = definition.range.last + 1
            js = js.substring(0, bodyStart) + "return;" + js.substring(bodyStart)
        }

        // 3. The Outbrain widget is allowed on no domain.
        js = js.replaceOnce(OUTBRAIN_FEATURE, OUTBRAIN_FEATURE_OFF, "Outbrain feature entry in $bundleName")
        bundle.writeText(js)
    }
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_TRANSFERMARKT)

    dependsOn(webViewBlocklistExtensionPatch, disableWebAdsPatch)

    execute {
        // 1. The WebView is never registered with Google Mobile Ads (and not reloaded for it).
        WebViewAdIntegrationFingerprint.method.returnEarly()

        // 2. Rule 9 backstop: every MobileAds static void returns at once. The web app never
        // calls admob-plus's start, so nothing waits on initialize's callback.
        neutraliseMobileAdsStatics("initialize", "registerWebView")

        // 3. Requests to the ad servers get an empty script (see the extension), which also
        // covers ad code the web app loads outside the stubbed AdtagService methods.
        interceptWebViewRequests("blockAds", "Disable ads")
    }
}
