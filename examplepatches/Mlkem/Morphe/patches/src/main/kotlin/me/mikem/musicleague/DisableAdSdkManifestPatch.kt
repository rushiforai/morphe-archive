package me.mikem.musicleague

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private fun Element.androidAttribute(name: String): String {
    return getAttributeNS(ANDROID_NAMESPACE, name).ifBlank { getAttribute("android:$name") }
}

private fun Element.setAndroidAttribute(name: String, value: String) {
    if (hasAttributeNS(ANDROID_NAMESPACE, name)) {
        setAttributeNS(ANDROID_NAMESPACE, "android:$name", value)
    } else {
        setAttribute("android:$name", value)
    }
}

private fun Document.elements(tagName: String): List<Element> {
    val nodes = getElementsByTagName(tagName)
    return buildList {
        for (i in 0 until nodes.length) {
            val node = nodes.item(i)
            if (node is Element) add(node)
        }
    }
}

@Suppress("unused")
val disableAdSdkManifestPatch = resourcePatch(
    name = "Disable ad SDK manifest components",
    description = "Disables bundled ad mediation components and removes ad identifier/ad services permissions.",
    default = true,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        val adClassPrefixes = listOf(
            "com.google.android.gms.ads.",
            "com.inmobi.ads.",
            "com.ironsource.",
            "com.unity3d.services.ads.",
            "com.unity3d.ads.",
            "com.moloco.sdk.",
            "com.vungle.ads.",
            "com.bytedance.sdk.openadsdk.",
            "com.facebook.ads.",
            "com.mbridge.msdk.",
        )

        val adPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
        )

        val adMetaValuesToSet = mapOf(
            "com.google.android.gms.ads.DELAY_APP_MEASUREMENT_INIT" to "true",
        )

        val adMetaNamesToRemove = setOf(
            "com.google.android.gms.ads.flag.OPTIMIZE_INITIALIZATION",
            "com.google.android.gms.ads.flag.OPTIMIZE_AD_LOADING",
            "com.bytedance.sdk.pangle.version",
            "com.unity3d.services.core.configuration.AdsSdkInitializer",
        )

        val adConsentMetaNamesToFalse = setOf(
            "google_analytics_adid_collection_enabled",
            "google_analytics_default_allow_ad_storage",
            "google_analytics_default_allow_ad_user_data",
            "google_analytics_default_allow_ad_personalization_signals",
        )

        document("AndroidManifest.xml").use { document ->
            for (permission in document.elements("uses-permission")) {
                if (permission.androidAttribute("name") in adPermissions) {
                    permission.parentNode.removeChild(permission)
                }
            }

            for (library in document.elements("uses-library")) {
                if (library.androidAttribute("name") == "android.ext.adservices") {
                    library.parentNode.removeChild(library)
                }
            }

            for (tagName in listOf("activity", "service", "provider", "receiver")) {
                for (component in document.elements(tagName)) {
                    val name = component.androidAttribute("name")
                    if (adClassPrefixes.any { name.startsWith(it) }) {
                        component.parentNode.removeChild(component)
                    }
                }
            }

            for (metaData in document.elements("meta-data")) {
                val name = metaData.androidAttribute("name")
                when {
                    name in adMetaValuesToSet -> {
                        metaData.setAndroidAttribute("value", adMetaValuesToSet.getValue(name))
                    }

                    name in adMetaNamesToRemove -> {
                        metaData.parentNode.removeChild(metaData)
                    }

                    name in adConsentMetaNamesToFalse -> {
                        metaData.setAndroidAttribute("value", "false")
                    }
                }
            }
        }

        // Do not fail if the target APK is already modified or uses a different ad stack.
    }
}
