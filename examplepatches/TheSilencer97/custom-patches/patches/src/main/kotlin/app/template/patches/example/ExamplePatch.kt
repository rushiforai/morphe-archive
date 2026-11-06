package app.morphe.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("CollapseAdSpace")

private val adTokenRegex = Regex(
    "(?i)(^|[._/\\-])(ad|ads|adview|admob|applovin|banner|dfp|gam|mopub|mrec|native_ad|ad_unit|ad_container|ad_wrapper|ad_slot|ad_holder|ad_frame|ad_space|ad_banner|banner_ad|ad_view|ad_layout|ad_placeholder|ad_card|ad_item|ad_box|ad_strip|ad_bar|sponsored_ad)([._/\\-]|$)" +
        "|(?i)(^|[._/\\-])(ad|ads|banner|dfp|gam|mopub|mrec)(View|Container|Wrapper|Layout|Frame|Holder|Slot|Unit|Banner|Space|Card|Item|Box|Size|Height|Width|Margin|Padding|Placeholder|Header|Footer|Strip|Bar|Loader|Controller|Manager|Helper|Adapter|Module|Section|Zone|Block)s?([._/\\-]|$)" +
        "|((^|[a-z0-9_/$])(Ad|Ads|Banner|Dfp|Gam|Mopub|Mrec|NativeAd)(View|Container|Wrapper|Layout|Frame|Holder|Slot|Unit|Banner|Space|Card|Item|Box|Size|Height|Width|Placeholder|Strip|Bar|Loader|Request|Manager|InstanceManager|Plugin|Widget|Factory|Listener|Callback)s?($|[A-Z0-9_;]))" +
        "|((^|[a-z0-9_/$])(Flutter|GoogleMobile|Max|Banner|Native|Interstitial|Rewarded|AppOpen|Fluid|Publisher|AdManager)(Ad|Ads|BannerAd|NativeAd|AdView|AdSize|AdLoader|AdRequest)s?($|[A-Z0-9_;]))"
)

private val adViewClassRegex = Regex(
    "(?i).*(AdView|BannerView|BannerAdView|AdContainer|AdWrapper|AdLayout|AdSlot|AdFrame|AdHolder|AdPlaceholder|BannerContainer|AdBanner|DfpAd|GamAd|MaxAdView|PublisherAdView|AdManagerAdView|NativeAdView|VungleBanner|MBBannerView|MyTargetView|ATBannerView|InMobiBanner|DTBAdView|PAGBanner)[A-Za-z0-9_\$]*;$"
)

private val adSizeClassRegex = Regex(
    "(?i).*(/AdSize|/FlutterAdSize|/FlutterAdSize\\\$[A-Za-z0-9_]+|/BannerAdSize|/MaxAdFormat|/PAGBannerSize|/BannerSize);$"
)

private val adSdkPackageRegex = Regex(
    "^L(io/flutter/plugins/googlemobileads|com/google/android/gms/ads|com/yandex/mobile/ads|com/facebook/ads|com/applovin/mediation|com/applovin/adview|com/mopub/mobileads|com/unity3d/services/banners|com/ironsource/mediationsdk|com/vungle/ads|com/bytedance/sdk/openadsdk|com/mbridge/msdk|com/my/target|sg/bigo/ads|com/anythink|com/inmobi/ads|com/chartboost/sdk|com/amazon/device/ads)/.*"
)

private val adLoadMethodRegex = Regex(
    "^(load|loadAd|loadAds|loadBanner|loadBannerAd|loadNativeAd|loadInterstitialAd|loadRewardedAd|loadRewardedInterstitialAd|loadAppOpenAd|loadAdManagerBannerAd|loadAdManagerInterstitialAd|loadFluidAd|onAdLoaded|show|showAd|showInterstitial|requestBannerAd|requestInterstitialAd|requestNativeAd)$"
)

private fun isAdRelated(text: String): Boolean {
    if (text.isEmpty()) return false
    val cleaned = text.substringAfterLast('/')
    return adTokenRegex.containsMatchIn(cleaned) ||
        text.contains("com.google.android.gms.ads", true) ||
        text.contains("io.flutter.plugins.googlemobileads", true)
}

private fun collapseElement(el: Element) {
    el.setAttribute("android:visibility", "gone")
    el.setAttribute("android:layout_height", "0.0dip")
    el.setAttribute("android:layout_width", "0.0dip")
    el.setAttribute("android:minHeight", "0.0dip")
    el.setAttribute("android:minWidth", "0.0dip")
}

private val collapseAdResourcesPatch = resourcePatch {
    execute {
        // Trigger on-demand extraction of common dimension files if present
        listOf(
            "res/values/dimens.xml",
            "res/values-sw600dp/dimens.xml",
            "res/values-land/dimens.xml"
        ).forEach { path -> runCatching { get(path) } }

        val rootDir = get(".")
        rootDir.walkTopDown().filter { it.isFile && it.extension.equals("xml", true) }.forEach { file ->
            val relPath = file.relativeTo(rootDir).invariantSeparatorsPath
            val parentName = file.parentFile?.name?.lowercase() ?: ""
            if (parentName.startsWith("values") && file.name.startsWith("dimens")) {
                runCatching {
                    document(relPath).use { doc ->
                        val dimens = doc.getElementsByTagName("dimen")
                        for (i in 0 until dimens.length) {
                            val item = dimens.item(i) as? Element ?: continue
                            if (isAdRelated(item.getAttribute("name"))) item.textContent = "0.0dip"
                        }
                    }
                }
            } else if (parentName.startsWith("layout")) {
                runCatching {
                    document(relPath).use { doc ->
                        val rootEl = doc.documentElement ?: return@use
                        if (isAdRelated(file.nameWithoutExtension)) {
                            collapseElement(rootEl)
                        } else {
                            val all = doc.getElementsByTagName("*")
                            for (i in 0 until all.length) {
                                val el = all.item(i) as? Element ?: continue
                                if (isAdRelated(el.tagName ?: "") || isAdRelated(el.getAttribute("android:id"))) {
                                    collapseElement(el)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val examplePatch = bytecodePatch(
    name = "Collapse Ad Space",
    description = "Universal patch to collapse empty ad banners, containers, AdSize dimensions, and Flutter ad slots to 0x0.",
    default = false,
) {
    dependsOn(collapseAdResourcesPatch)

    execute {
        val targetClasses = mutableSetOf<String>()
        val discoveredAdSizeClasses = mutableSetOf("Lcom/google/android/gms/ads/AdSize;")
        val discoveredAdMobPackages = mutableSetOf<String>()
        val discoveredFlutterAdsPackages = mutableSetOf<String>()
        val discoveredFlutterAdSizeClasses = mutableSetOf<String>()

        var flutterAdBaseType: String? = null
        var flutterAdIdFieldName: String? = null
        var flutterLoadAdErrorType: String? = null
        var adInstanceManagerType: String? = null
        var onAdFailedMethodName: String? = null
        var onAdLoadedMethodName: String? = null
        var onAdLoadedParamType: String? = null

        // Pass 1: Discover R8-obfuscated AdMob & Flutter GoogleMobileAds packages
        classDefForEach { classDef ->
            val type = classDef.type
            if (type == "Lcom/google/ads/mediation/AbstractAdViewAdapter;") {
                for (m in classDef.methods) {
                    if (m.name == "requestBannerAd" && m.parameterTypes.size >= 4) {
                        val adSizeType = m.parameterTypes[3].toString()
                        discoveredAdSizeClasses.add(adSizeType)
                        discoveredAdMobPackages.add(adSizeType.substringBeforeLast('/') + "/")
                    }
                }
            }
            if (classDef.methods.any { it.returnType == "Lcom/google/android/gms/ads/nativead/NativeAdView;" } &&
                !type.startsWith("Lcom/google/")
            ) {
                for (iface in classDef.interfaces) {
                    val pkg = iface.substringBeforeLast('/') + "/"
                    if (!pkg.startsWith("Ljava/") && !pkg.startsWith("Landroid/")) {
                        discoveredFlutterAdsPackages.add(pkg)
                    }
                }
            }
        }

        // Pass 2: Collect target classes & Flutter ad metadata
        classDefForEach { classDef ->
            val type = classDef.type
            val isInUnmaskedAdMob = discoveredAdMobPackages.any { type.startsWith(it) }
            val isInUnmaskedFlutterAds = discoveredFlutterAdsPackages.any { type.startsWith(it) }

            if (isInUnmaskedFlutterAds) {
                val fourArgInit = classDef.methods.firstOrNull {
                    it.name == "<init>" && it.parameterTypes.size == 4 &&
                        it.parameterTypes[0] == "I" &&
                        it.parameterTypes[1] == "Ljava/lang/String;" &&
                        it.parameterTypes[2] == "Ljava/lang/String;"
                }
                if (fourArgInit != null) {
                    flutterLoadAdErrorType = type
                }
                if (classDef.superclass == "Ljava/lang/Object;" &&
                    classDef.methods.any { it.name == "<init>" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "I" } &&
                    classDef.methods.any { it.returnType.startsWith("Lio/flutter/plugin/platform/") }
                ) {
                    flutterAdBaseType = type
                    flutterAdIdFieldName = classDef.fields.firstOrNull { it.type == "I" }?.name
                }
                if (classDef.methods.any { m ->
                        m.name == "<init>" && m.parameterTypes.any { p -> discoveredAdSizeClasses.contains(p.toString()) }
                    }
                ) {
                    discoveredFlutterAdSizeClasses.add(type)
                }
            }

            if (isInUnmaskedAdMob || isInUnmaskedFlutterAds ||
                discoveredAdSizeClasses.contains(type) ||
                adSizeClassRegex.matches(type) ||
                adViewClassRegex.matches(type) ||
                adSdkPackageRegex.matches(type) ||
                type == "Lcom/google/ads/mediation/AbstractAdViewAdapter;"
            ) {
                targetClasses.add(type)
            }
        }

        // Include subclasses of FlutterAdSize & locate AdInstanceManager callbacks
        if (discoveredFlutterAdsPackages.isNotEmpty()) {
            classDefForEach { classDef ->
                if (discoveredFlutterAdSizeClasses.contains(classDef.superclass)) {
                    discoveredFlutterAdSizeClasses.add(classDef.type)
                    targetClasses.add(classDef.type)
                }
                if (flutterAdBaseType != null && flutterLoadAdErrorType != null &&
                    discoveredFlutterAdsPackages.any { classDef.type.startsWith(it) }
                ) {
                    val failMethod = classDef.methods.firstOrNull {
                        it.parameterTypes.size == 2 &&
                            it.parameterTypes[0] == "I" &&
                            it.parameterTypes[1].toString() == flutterLoadAdErrorType &&
                            it.returnType == "V"
                    }
                    if (failMethod != null) {
                        adInstanceManagerType = classDef.type
                        onAdFailedMethodName = failMethod.name
                        for (m in classDef.methods) {
                            val hasOnAdLoadedStr = runCatching {
                                m.instructions.any { insn ->
                                    (insn as? ReferenceInstruction)?.reference?.toString() == "onAdLoaded"
                                }
                            }.getOrDefault(false)
                            if (hasOnAdLoadedStr && m.parameterTypes.isNotEmpty() && m.parameterTypes[0] == "I" && m.returnType == "V") {
                                onAdLoadedMethodName = m.name
                                onAdLoadedParamType = if (m.parameterTypes.size >= 2) m.parameterTypes[1].toString() else null
                            }
                        }
                    }
                }
            }
        }

        // Apply bytecode hooks to all target classes
        for (type in targetClasses) {
            runCatching {
                val mutableClass = mutableClassDefBy(type)
                val isInUnmaskedAdMob = discoveredAdMobPackages.any { type.startsWith(it) }
                val isInUnmaskedFlutterAds = discoveredFlutterAdsPackages.any { type.startsWith(it) }

                // 1. Redirect Flutter AdInstanceManager.onAdFailedToLoad -> onAdLoaded(adId, null)
                if (type == adInstanceManagerType && onAdFailedMethodName != null && onAdLoadedMethodName != null) {
                    for (method in mutableClass.methods) {
                        val regCount = method.implementation?.registerCount ?: 0
                        if (method.name == onAdFailedMethodName &&
                            method.parameterTypes.size == 2 &&
                            method.parameterTypes[0] == "I" &&
                            regCount in 4..15
                        ) {
                            runCatching {
                                if (onAdLoadedParamType != null) {
                                    method.addInstructions(
                                        0,
                                        """
                                            const/4 v0, 0x0
                                            invoke-virtual {p0, p1, v0}, $adInstanceManagerType->$onAdLoadedMethodName(I$onAdLoadedParamType)V
                                            return-void
                                        """
                                    )
                                } else {
                                    method.addInstructions(
                                        0,
                                        """
                                            invoke-virtual {p0, p1}, $adInstanceManagerType->$onAdLoadedMethodName(I)V
                                            return-void
                                        """
                                    )
                                }
                            }
                        }
                    }
                }

                // 2. Zero out FlutterAdSize constructors (width = 0, height = 0)
                if (discoveredFlutterAdSizeClasses.contains(type)) {
                    for (method in mutableClass.methods) {
                        val regCount = method.implementation?.registerCount ?: 0
                        if (method.name == "<init>" && regCount in 2..15) {
                            val sb = StringBuilder()
                            var paramRegIndex = 1
                            for (paramType in method.parameterTypes) {
                                val pStr = paramType.toString()
                                if (pStr == "I") {
                                    sb.appendLine("const/4 p$paramRegIndex, 0x0")
                                }
                                paramRegIndex += if (pStr == "J" || pStr == "D") 2 else 1
                            }
                            if (sb.isNotEmpty()) {
                                runCatching { method.addInstructions(0, sb.toString()) }
                            }
                        }
                    }
                }

                // 3. Fire onAdLoaded at the end (RETURN_VOID) of FlutterBannerAd.load() so adView is initialized at 0x0
                if (isInUnmaskedFlutterAds && flutterAdBaseType != null && flutterAdIdFieldName != null &&
                    adInstanceManagerType != null && onAdLoadedMethodName != null
                ) {
                    val superCls = mutableClass.superclass ?: ""
                    val mgrField = mutableClass.fields.firstOrNull { it.type == adInstanceManagerType }?.name
                    if ((superCls == flutterAdBaseType || superCls.startsWith(flutterAdBaseType.removeSuffix(";") + "$")) &&
                        mgrField != null
                    ) {
                        for (method in mutableClass.methods) {
                            val regCount = method.implementation?.registerCount ?: 0
                            if ((method.name == "e" || method.name == "h") &&
                                method.parameterTypes.isEmpty() &&
                                method.returnType == "V" &&
                                regCount in 4..15
                            ) {
                                val retIdx = runCatching {
                                    method.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
                                }.getOrDefault(-1)
                                if (retIdx > 0) {
                                    runCatching {
                                        if (onAdLoadedParamType != null) {
                                            method.addInstructions(
                                                retIdx,
                                                """
                                                    iget-object v0, p0, $type->$mgrField:$adInstanceManagerType
                                                    iget v1, p0, $flutterAdBaseType->$flutterAdIdFieldName:I
                                                    const/4 v2, 0x0
                                                    invoke-virtual {v0, v1, v2}, $adInstanceManagerType->$onAdLoadedMethodName(I$onAdLoadedParamType)V
                                                """
                                            )
                                        } else {
                                            method.addInstructions(
                                                retIdx,
                                                """
                                                    iget-object v0, p0, $type->$mgrField:$adInstanceManagerType
                                                    iget v1, p0, $flutterAdBaseType->$flutterAdIdFieldName:I
                                                    invoke-virtual {v0, v1}, $adInstanceManagerType->$onAdLoadedMethodName(I)V
                                                """
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // 4. Zero out AdSize getters & pixel dimension calculators
                if (discoveredAdSizeClasses.contains(type) || adSizeClassRegex.matches(type)) {
                    for (method in mutableClass.methods) {
                        val regCount = method.implementation?.registerCount ?: 0
                        if (method.returnType == "I" && method.name != "hashCode" &&
                            (method.parameterTypes.isEmpty() ||
                                (method.parameterTypes.size == 1 && method.parameterTypes[0] == "Landroid/content/Context;")) &&
                            regCount >= 1
                        ) {
                            runCatching { method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
                        }
                    }
                }

                if (isInUnmaskedAdMob) {
                    for (method in mutableClass.methods) {
                        val regCount = method.implementation?.registerCount ?: 0
                        if (method.parameterTypes.size == 1 &&
                            discoveredAdSizeClasses.contains(method.parameterTypes[0].toString()) &&
                            method.returnType == "I" && regCount >= 1
                        ) {
                            runCatching { method.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
                        }
                    }
                }

                // 5. Block ad load methods & force AdView / BaseAdView onMeasure to 0x0 + View.GONE
                if (isInUnmaskedAdMob || adSdkPackageRegex.matches(type) || adViewClassRegex.matches(type) ||
                    type == "Lcom/google/ads/mediation/AbstractAdViewAdapter;"
                ) {
                    for (method in mutableClass.methods) {
                        val regCount = method.implementation?.registerCount ?: 0
                        if (adLoadMethodRegex.matches(method.name) && method.returnType == "V" && regCount >= 1) {
                            runCatching { method.addInstructions(0, "return-void") }
                        } else if (method.name == "onMeasure" && method.parameterTypes.size == 2 &&
                            method.parameterTypes[0] == "I" && method.parameterTypes[1] == "I" &&
                            method.returnType == "V" && regCount in 3..15
                        ) {
                            runCatching {
                                method.addInstructions(
                                    0,
                                    """
                                        const/16 v0, 0x8
                                        invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                                        const/4 v0, 0x0
                                        invoke-virtual {p0, v0, v0}, Landroid/view/View;->setMeasuredDimension(II)V
                                        return-void
                                    """
                                )
                            }
                        }
                    }
                }
            }
        }
        logger.info("Collapse Ad Space finished patching ${targetClasses.size} ad classes.")
    }
}
