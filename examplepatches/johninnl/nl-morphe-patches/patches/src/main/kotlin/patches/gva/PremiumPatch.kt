package patches.gva

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Hides publisher paywall cards and subscription buttons without changing server article access, account entitlements or billing.") {
    dependsOn(originalInput)
    compatibleWith(gva)
    execute {
        change("Lbe/mediahuis/core/data/repositories/remoteconfig/RemoteConfigRepository;", "isPaywallEnabled()Z", FALSE)
        change("Lbe/mediahuis/core/data/repositories/remoteconfig/RemoteConfigRepository;", "isSubscribeButtonEnabled()Z", FALSE)
        change("Lcom/mediahuis/oneapps/cueappsdk/domain/external/remoteconfig/services/RemoteConfigServiceKt;", "isSubscribeButtonEnabled(Lcom/mediahuis/oneapps/cueappsdk/domain/external/remoteconfig/services/RemoteConfigService;)Z", FALSE)
    }
}
