package app.ryley.patches.cbc.ads

import app.morphe.patcher.Fingerprint

/**
 * `ca.cbc.android.player.utils.PlayerManager.prepareAndPlayContent(String, String, Boolean): void`
 *
 * The funnel every video playback path goes through (`prepareAndPlayContent(MediaItem)` calls it,
 * and it is the only place the ad decision is taken). Its third parameter is the `hasOnDemandAds`
 * flag, which the method logs and feeds into:
 *
 *  - `PlayerComponentManager.createMediaSource(Uri, policy, hasOnDemandAds, ...)`
 *  - the `if-eqz hasOnDemandAds` branch that reads `MediaItem.getAdUrl()`, builds an ad `DataSpec`
 *    and installs the IMA-backed ads media source factory, then calls `ImaAdsLoader.setPlayer(...)`.
 *
 * Register layout of this method is v0..v12 with params at v9 (this), v10 (content url),
 * v11 (captions url) and v12 (`hasOnDemandAds`) — v12 is later reused as a scratch register once
 * the ad branch has been passed, so clearing it at entry only disables the ad path.
 */
internal val ImaOnDemandAdsFingerprint = Fingerprint(
    definingClass = "Lca/cbc/android/player/utils/PlayerManager;",
    name = "prepareAndPlayContent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"),
)
