package app.template.patches.onedm

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val INITIALIZATION_PROVIDER = "androidx.startup.InitializationProvider"
private const val UNITY_ADS_INITIALIZER = "com.unity3d.services.core.configuration.AdsSdkInitializer"

private val REMOVABLE_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.google.android.c2dm.permission.RECEIVE",
    "com.amazon.privacypass.ATTEST",
)

/**
 * Strictly preserved functional ContentProviders (all 17 ad/mediation/Sentry/Firebase/AppMetrica
 * ContentProviders outside these prefixes are stripped so zero ad/telemetry code runs before
 * `BrowserApp.onCreate()` in the UI, `:DownloadService`, or `:CheckAppVersion` processes):
 * - `androidx.core.content.FileProvider`
 * - `acr.browser.lightning.constant.StartPageClipboardImageProvider`
 * - `net.grandcentrix.tray.provider.TrayContentProvider`
 * - `androidx.startup.InitializationProvider` (kept, with only UnityAds `AdsSdkInitializer` removed)
 */
private val PRESERVED_PROVIDER_PREFIXES = listOf(
    "idm.internet.download.manager.",
    "acr.browser.lightning.",
    "androidx.",
    "net.grandcentrix.tray.",
)

/**
 * Strictly preserved functional `<service>` and `<receiver>` prefixes (`idm.*` except
 * `IDMFirebaseMessagingService`, `acr.*`, and `androidx.*` WorkManager/Room/ProfileInstaller).
 */
private val PRESERVED_SERVICE_RECEIVER_PREFIXES = listOf(
    "idm.internet.download.manager.",
    "acr.browser.lightning.",
    "androidx.",
)

private const val IDM_FCM_SERVICE = "idm.internet.download.manager.IDMFirebaseMessagingService"

/**
 * Strictly preserved legitimate `<activity>` entries:
 * - `idm.internet.download.manager.*`
 * - `acr.browser.lightning.*`
 * - `androidx.*` (App lock biometric `FingerprintDialogActivity`)
 * - `com.dropbox.core.android.AuthActivity` (Dropbox cloud sync)
 * - `com.google.android.gms.common.api.GoogleApiActivity` (Google Play Services auth/API)
 * - `com.android.billingclient.api.ProxyBillingActivity` & `ProxyBillingActivityV2`
 * - `com.google.android.play.core.hsdp.service.HsdpShimActivity`
 */
private val PRESERVED_ACTIVITY_PREFIXES = listOf(
    "idm.internet.download.manager.",
    "acr.browser.lightning.",
    "androidx.",
)

private val PRESERVED_ACTIVITIES = setOf(
    "com.dropbox.core.android.AuthActivity",
    "com.google.android.gms.common.api.GoogleApiActivity",
    "com.android.billingclient.api.ProxyBillingActivity",
    "com.android.billingclient.api.ProxyBillingActivityV2",
    "com.google.android.play.core.hsdp.service.HsdpShimActivity",
)

private val REMOVABLE_META_DATA = setOf(
    "com.google.android.gms.ads.APPLICATION_ID",
    "com.google.android.gms.ads.flag.OPTIMIZE_INITIALIZATION",
    "com.google.android.gms.ads.flag.OPTIMIZE_AD_LOADING",
    "com.google.android.gms.ads.DELAY_APP_MEASUREMENT_INIT",
    "com.google.android.gms.ads.AD_MANAGER_APP",
    "applovin.sdk.key",
    "com.bytedance.sdk.pangle.version",
    "com.mobilefuse.sdk.disable_auto_init",
    "com.startapp.sdk.APPLICATION_ID",
    "com.startapp.sdk.RETURN_ADS_ENABLED",
    "com.startapp.sdk.SPLASH_ENABLED",
    "com.yandex.mobile.ads.AUTOMATIC_SDK_INITIALIZATION",
    "com.google.firebase.messaging.default_notification_icon",
    "com.google.firebase.messaging.default_notification_color",
    "com.google.firebase.messaging.default_notification_channel_id",
)

/**
 * Pure ad/mediation/crash-telemetry `.so` files verified to have zero references from
 * `idm.*` or `acr.*` functional code. All 14 functional native libraries (`libarchSupport.so`,
 * `libjlibtorrent.so`, `libc++_shared.so`, FFmpeg `libav*`/`libsw*`/`libffmpegkit*`, and
 * `libandroidx.graphics.path.so` / `libdatastore_shared_counter.so`) are preserved untouched.
 */
private val REMOVABLE_NATIVE_LIB_SUFFIXES = listOf(
    "/libapminsighta.so",
    "/libapminsightb.so",
    "/libapplovin-native-crash-reporter.so",
    "/libbuffer_pgl.so",
    "/libfile_lock_pgl.so",
    "/libnms.so",
    "/libpglarmor.so",
    "/libsentry-android.so",
    "/libsentry.so",
    "/libtt_ugen_layout.so",
    "/libunitycoherencenative.so",
)

/**
 * Pure third-party ad-SDK asset directories and standalone MRAID/VAST/OMSDK/APS bundles.
 * Built-in browser adblocker (`assets/adblocker/`), userscript helpers (`assets/userscript/`),
 * baseline profiles (`assets/dexopt/`), `assets/ad.html`, and `assets/idm_*` stay untouched.
 */
private val REMOVABLE_ASSET_PREFIXES = listOf(
    "assets/iads/",
    "assets/mobilefuse/",
    "assets/zmaticoo/",
    "assets/bm_networks/",
    "assets/ad-viewer/",
    "assets/template/",
)

private val REMOVABLE_ASSET_FILES = setOf(
    "assets/PubMatic_Logo.svg",
    "assets/aps-mraid.js",
    "assets/aps_mobile_client_config.json",
    "assets/aps_mraid.js",
    "assets/aps_omsdk.js",
    "assets/apstag.js",
    "assets/close_button.png",
    "assets/com.moloco.sdk.xenoss.sdkdevkit.mraid.js",
    "assets/dtb-m.js",
    "assets/dtb-mraid.js",
    "assets/fyb_iframe_endcard_tmpl.html",
    "assets/fyb_static_endcard_tmpl.html",
    "assets/ia_js_load_monitor.txt",
    "assets/ia_mraid_bridge.txt",
    "assets/ia_send_log_data.html",
    "assets/inmobi_omsdk_v1_3_37.js",
    "assets/mb_omsdk_v1.js",
    "assets/mbridge_download_dialog_view.xml",
    "assets/moloco_Skip_Button.png",
    "assets/mraid-bridge.js",
    "assets/mraid.js",
    "assets/mraid3.js",
    "assets/mute_button.png",
    "assets/omsdk-v1.js",
    "assets/omsdk_v1_4_12.js",
    "assets/omsdk_v1_5_2.js",
    "assets/openwrapsdk.js",
    "assets/POBMRAID.js",
    "assets/pob_info_button.svg",
    "assets/pob_mraid.js",
    "assets/pob_person_button.svg",
    "assets/progress_bar_circle.png",
    "assets/pumbmatic_omsdk.js",
    "assets/RichMedia.json",
    "assets/rv_binddatas.xml",
    "assets/skip_button.png",
    "assets/smaato_omsdk_v1.js",
    "assets/taurusx_mraid.js",
    "assets/taurusx_omsdk_v1.js",
    "assets/unmute_button.png",
)

internal val manifestAndBloatPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.removeByPredicate("uses-permission") { name ->
                name in REMOVABLE_PERMISSIONS
            }

            manifest.removeByPredicate("provider") { name ->
                name.isNotEmpty() && PRESERVED_PROVIDER_PREFIXES.none(name::startsWith)
            }

            // Keep androidx.startup.InitializationProvider, removing only UnityAds AdsSdkInitializer.
            val providers = manifest.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as? Element ?: continue
                if (provider.androidName() != INITIALIZATION_PROVIDER) continue
                val metaNodes = provider.getElementsByTagName("meta-data")
                val toRemove = ArrayList<Element>()
                for (j in 0 until metaNodes.length) {
                    val meta = metaNodes.item(j) as? Element ?: continue
                    if (meta.androidName() == UNITY_ADS_INITIALIZER) {
                        toRemove.add(meta)
                    }
                }
                toRemove.forEach { it.parentNode?.removeChild(it) }
            }

            manifest.removeByPredicate("service") { name ->
                name.isNotEmpty() &&
                    (name == IDM_FCM_SERVICE || PRESERVED_SERVICE_RECEIVER_PREFIXES.none(name::startsWith))
            }

            manifest.removeByPredicate("receiver") { name ->
                name.isNotEmpty() && PRESERVED_SERVICE_RECEIVER_PREFIXES.none(name::startsWith)
            }

            manifest.removeByPredicate("activity") { name ->
                name.isNotEmpty() &&
                    name !in PRESERVED_ACTIVITIES &&
                    PRESERVED_ACTIVITY_PREFIXES.none(name::startsWith)
            }

            manifest.removeByPredicate("meta-data") { name ->
                name in REMOVABLE_META_DATA || name.startsWith("io.sentry.")
            }

            manifest.removeByPredicate("property") { name ->
                name == "android.adservices.AD_SERVICES_CONFIG"
            }

            manifest.removeByPredicate("uses-library") { name ->
                name == "android.ext.adservices"
            }
        }

        for (entry in listApkEntries("lib/")) {
            if (REMOVABLE_NATIVE_LIB_SUFFIXES.any(entry::endsWith)) {
                delete(entry)
            }
        }

        for (entry in listApkEntries("assets/")) {
            if (entry in REMOVABLE_ASSET_FILES || REMOVABLE_ASSET_PREFIXES.any(entry::startsWith)) {
                delete(entry)
            }
        }
    }
}

private fun Element.androidName(): String =
    getAttributeNS(ANDROID_NS, "name").ifEmpty { getAttribute("android:name") }

private fun Document.removeByPredicate(tagName: String, predicate: (String) -> Boolean) {
    val nodes = getElementsByTagName(tagName)
    val toRemove = ArrayList<Element>()
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as? Element ?: continue
        if (predicate(el.androidName())) {
            toRemove.add(el)
        }
    }
    for (el in toRemove) {
        el.parentNode?.removeChild(el)
    }
}
