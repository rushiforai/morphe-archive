/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * shared/misc/ads/RemoveMobileAdsInitProviderPatch.kt e
 * graphmessenger/misc/ads/RemoveAdNetworkProvidersPatch.kt, combinados num só
 * arquivo):
 * https://github.com/hxreborn/morphe-patches
 *
 * Vários SDKs de anúncio se auto-inicializam através de um ContentProvider
 * declarado no próprio AndroidManifest.xml do SDK (mesclado no manifest do
 * app): o Android chama o onCreate() desse provider automaticamente na
 * abertura do app, ANTES de qualquer código do app rodar — inclusive antes
 * do método que o AdSdkInitFingerprint neutraliza. Remover os <provider> do
 * manifest impede esse bootstrap automático.
 *
 * Reescrito sem depender de app.morphe.util.asSequence/removeFromParent
 * (privados ao build do hxreborn, não resolvem no build): mesma lógica, com
 * DOM puro.
 */
package app.morphe.patches.telegraph.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val AD_SDK_INIT_PROVIDERS = listOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.facebook.ads.AudienceNetworkContentProvider",
)

internal val removeAdSdkProvidersPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            val elements = (0 until providers.length).mapNotNull { providers.item(it) as? Element }

            AD_SDK_INIT_PROVIDERS.forEach { name ->
                val provider = elements.singleOrNull { it.getAttribute("android:name") == name }
                    ?: throw PatchException("Expected exactly one $name in the manifest")
                provider.parentNode?.removeChild(provider)
            }
        }
    }
}
