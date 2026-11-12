package app.template.patches.easylauncher.misc.promo

import app.morphe.patcher.Fingerprint

// Remote-config data classes for the GetJar and SportsPass partner promos (kept: they are
// deserialized by name). Their enabled getters decide whether the workspace banners, the app
// drawer tile/icon/folder, the search action cards and the search suggestions are shown.
internal val PROMO_CONFIG_CLASSES = listOf(
    "Lcom/eet/promos/getjar/config/GetJarRemoteConfig\$BannerConfig;",
    "Lcom/eet/promos/getjar/config/GetJarRemoteConfig\$SearchConfig;",
    // 1.10.31 merged the SportsPass banner, icon, tile (and new folder) configs into one entry config.
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$SportsPassEntryConfig;",
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$SearchConfig;",
)
internal val PROMO_ENABLED_GETTERS = setOf("getEnabled", "getActionCardEnabled", "getSuggestEnabled")

// The CPA (cost-per-action) "Discover - Find Apps & Games" offers card in search.
internal object CpaOffersIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/eet/feature/cpa/action/CpaOffersActionCardProvider;",
    name = "isEnabled",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, _ -> method.implementation != null },
)

// Posts the notification that promotes the bundled keyboard when an "ime-promo" FCM topic message
// arrives. Only this method is changed; the handler's topic subscription and FCM stay as they are.
internal object ImePromoPitchFingerprint : Fingerprint(
    definingClass = "Leasy/launcher/ime/promo/ImePromoHandler;",
    name = "pitchIme",
    returnType = "V",
)
