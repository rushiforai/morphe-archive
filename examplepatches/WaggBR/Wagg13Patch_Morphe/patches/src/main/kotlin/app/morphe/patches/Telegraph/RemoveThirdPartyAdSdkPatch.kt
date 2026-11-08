/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/misc/ads/{RemoveAdsPatch,Fingerprints}.kt — só a parte de SDK
 * de anúncio de terceiros e licença; a parte de sponsoredPeers/sponsoredMessages/
 * promoData já está no nosso RemoveAdsPatch.kt existente):
 * https://github.com/hxreborn/morphe-patches
 *
 * O banner/anúncio em tela cheia (interstitial) que ainda aparece NÃO vem do
 * Telegram/Graph em si — vem de SDKs de anúncio de terceiros embutidos no
 * app (AppLovin, confirmado pela string "com/applovin/sdk/AppLovinPrivacySettings"
 * no bytecode; a pasta lib/ também tem libpglarmor.so, da Pangle/ByteDance).
 * Bloquear só as mensagens/peers patrocinados do Telegram (readParams) não
 * afeta esses SDKs — eles rodam por conta própria.
 *
 * Dois mecanismos, os dois necessários:
 *  1) AdSdkInitFingerprint: o Graph tem um único método "wrapper" que
 *     configura e inicializa os SDKs de anúncio (identificado pela chamada a
 *     AppLovinPrivacySettings.setHasUserConsent dentro dele). Fazendo esse
 *     método não fazer nada, nenhum SDK chega a ser configurado.
 *  2) removeAdSdkProvidersPatch: vários desses SDKs TAMBÉM se auto-iniciam
 *     via um ContentProvider no manifest, que roda antes de qualquer código
 *     do app — por isso remover os <provider> é necessário mesmo com (1).
 *
 * E, como os anúncios também dependem do sistema de licença próprio do app
 * (ver NativeLicense.kt): LicenseCheckFingerprint força native_checkLicense a
 * sempre "passar" (retornar sucesso).
 */
package app.morphe.patches.telegraph.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.telegraph.TelegraphCompatibility
import app.morphe.patches.telegraph.shared.LICENSE_CHECK_METHOD
import app.morphe.patches.telegraph.shared.overrideNativeLicenseCallResults
import app.morphe.patches.telegraph.signature.spoofSignaturePatch

private const val CONNECTIONS_MANAGER_CLASS = "Lorg/telegram/tgnet/ConnectionsManager;"

// Método "wrapper" do Graph que configura/inicializa os SDKs de anúncio;
// identificado pela chamada a AppLovinPrivacySettings.setHasUserConsent nele.
private val adSdkInitFingerprint = Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/applovin/sdk/AppLovinPrivacySettings;",
            name = "setHasUserConsent",
        ),
    ),
)

private val licenseCheckFingerprint = Fingerprint(
    filters = listOf(methodCall(definingClass = CONNECTIONS_MANAGER_CLASS, name = LICENSE_CHECK_METHOD)),
)

@Suppress("unused")
val removeThirdPartyAdSdkPatch = bytecodePatch(
    name = "Remove third-party ad SDKs",
    description = "Blocks third-party ad networks bundled inside the app.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)
    dependsOn(spoofSignaturePatch, removeAdSdkProvidersPatch)

    execute {
        adSdkInitFingerprint.method.addInstructions(0, "return-void")

        licenseCheckFingerprint.matchAll().forEach {
            it.method.overrideNativeLicenseCallResults(LICENSE_CHECK_METHOD, 1)
        }
    }
}
