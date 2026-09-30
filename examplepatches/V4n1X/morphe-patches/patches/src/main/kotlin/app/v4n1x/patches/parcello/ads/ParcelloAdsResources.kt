package app.v4n1x.patches.parcello.ads

import org.w3c.dom.Element

internal object ParcelloAdsResources {
    const val MAIN_SCRIPT = "assets/public/main.cc733f880f9d5201.js"
    const val INDEX_HTML = "assets/public/index.html"
    val SPONSORED_SCRIPTS = listOf(
        "assets/public/347.a8a18d21f27b5a2d.js",
        "assets/public/3589.f7f862dd6fc46c66.js",
    )

    const val EMPTY_IMAGE = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"

    private val adPermissions = setOf(
        "com.google.android.gms.permission.AD_ID",
        "android.permission.ACCESS_ADSERVICES_AD_ID",
        "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
        "android.permission.ACCESS_ADSERVICES_TOPICS",
        "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    )

    private val noAdsStyle = """
        <style id="morphe-parcello-no-ads">
          .ad-space, .horizontal-ad-space, .horizontal-ad-space-dash,
          .inline-ad, .inline-par, .sidebar-ad-space, .hidden-without-ads,
          .ad-link, .OUTBRAIN, .ob-smartfeed-wrapper, #anchorSymplr,
          [id^="parcello.org_"], app-promo-slides, .buyPremium:not(.activateNotify) {
            display: none !important;
          }
          ion-app { margin-bottom: 0 !important; }
        </style>
    """.trimIndent()

    fun patchMainScript(source: String): String {
        // Do not change premium entitlements. Preserve the notification setup that
        // originally followed advertising consent, including its delayed startup.
        val withoutAdCalls = replaceSection(
            source,
            "showAdMobAd(){",
            "getAdId(){",
            """
                showAdMobAd(){
                  this.consentMode=false;
                  const app=document.querySelector("ion-app");
                  if(app&&"style"in app)app.style.marginBottom="0px";
                  if(this.pushNotificationsDelayed&&this.own_shipments_tracked>=1)
                    setTimeout(()=>this.initPushNotification(),5000);
                  return Promise.resolve();
                }
                showInterstitial(){return Promise.resolve();}
            """.trimIndent(),
        )
        return replaceSection(
            withoutAdCalls,
            "interstitialAllowed(){",
            "presentAlert(",
            "interstitialAllowed(){return Promise.resolve(false);}",
        )
    }

    fun patchSponsoredScript(source: String): String {
        // Hiding a <picture> alone still downloads its images. Replace all sources
        // with an in-memory pixel and neutralize the sponsor link as well.
        val images = Regex("https://www\\.parcello\\.org/business/blog/wp-content/uploads/2025/03/A[124]a-final\\.webp")
        val links = Regex("https://drinkcheck\\.de/[^\"']+")
        check(images.findAll(source).count() == 4 && links.findAll(source).count() == 1) {
            "Unsupported Parcello sponsor banner layout; expected the 2.2.20 assets."
        }
        return links.replace(images.replace(source, EMPTY_IMAGE), "#")
    }

    fun patchIndexHtml(source: String): String {
        check("morphe-parcello-no-ads" !in source) { "Parcello ads patch is already applied." }
        val scripts = Regex("<script\\b[^>]*>.*?</script>", setOf(RegexOption.DOT_MATCHES_ALL, RegexOption.IGNORE_CASE))
        val cookieScripts = scripts.findAll(source).filter { "createCookieSymplr" in it.value }.toList()
        val loaderScripts = scripts.findAll(source).filter { "https://cdns.symplr.de/parcello.org/parcello.js" in it.value }.toList()
        check(cookieScripts.size == 1 && loaderScripts.size == 1 && cookieScripts.single().range != loaderScripts.single().range) {
            "Unsupported Parcello advertising bootstrap; expected the 2.2.20 HTML."
        }
        val withoutAds = source.replace(cookieScripts.single().value, "").replace(
            loaderScripts.single().value,
            """
                <script>
                  const ritToken = localStorage.getItem('CapacitorStorage.rit');
                  window.symplrScriptLoaded = false;
                </script>
            """.trimIndent(),
        )
        check(Regex("</head>", RegexOption.IGNORE_CASE).findAll(withoutAds).count() == 1) {
            "Parcello HTML head not found."
        }
        return withoutAds.replace(Regex("</head>", RegexOption.IGNORE_CASE), "$noAdsStyle\n</head>")
    }

    fun patchManifest(manifest: Element) {
        manifest.childElements().filter {
            it.tagName == "uses-permission" && it.getAttribute("android:name") in adPermissions
        }.forEach(manifest::removeChild)

        val application = manifest.childElements().single { it.tagName == "application" }
        application.childElements().filter {
            val name = it.getAttribute("android:name")
            name.startsWith("com.google.android.gms.ads.") || name == "android.ext.adservices"
        }.forEach(application::removeChild)
    }

    private fun Element.childElements(): List<Element> =
        (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }

    private fun replaceSection(source: String, start: String, end: String, replacement: String): String {
        val startIndex = source.indexOf(start)
        val endIndex = source.indexOf(end, startIndex.coerceAtLeast(0) + start.length)
        check(startIndex >= 0 && endIndex > startIndex && source.indexOf(start, startIndex + start.length) < 0) {
            "Unsupported Parcello JavaScript structure: $start"
        }
        check(source.indexOf(end, endIndex + end.length) < 0) {
            "Ambiguous Parcello JavaScript structure: $end"
        }
        return source.replaceRange(startIndex, endIndex, replacement)
    }
}
