package app.pigfoot.patches.camscanner

/** Independently reviewed pristine targets, not a version-range or auto-learned allowlist. */
internal data class CamScannerVersion(val name: String, val code: String, val modelPin: String,
    val cacheResultRegister: Int, val pinOverrides: Map<String, String> = emptyMap()) {
    val classPins: Map<String, String> get() = originalClassPins + pinOverrides
}

private val overrides72701 = mapOf(
    "Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobAppOpenAdImpl;" to "95d92b889dd24e3f2cadcbaceb682141cc65f74dbfa292463e9fb6e4374c71b6",
    "Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/NativeBaseAd;" to "c800c8ec442c426d5ce01ca5008997aac4a70f91f61e49cfd10ed55816f0ebaf",
    "Lcom/intsig/camscanner/ads/csAd/CsAdUtil;" to "880d2d28e8474f61857a187f34b0f965beec520821c362279eeb0b2b8e00df55",
    "Lcom/intsig/camscanner/tsapp/sync/SyncUtil;" to "f746af546d5156206733463104a4986ed680a6f912cf119f6e1b8890c95952ad",
    "Lcom/intsig/camscanner/util/PreferenceHelper;" to "43d37dfdb7bbbce18b7d998e295a0d285308c9f011b5a5700b56672f42925f15",
    "Lcom/intsig/comm/account_data/AccountPreference;" to "72eff0c4a0c914664415914eba6e08d6b048bdaee8c2f6c8d78103270c27a007",
    "Lcom/intsig/crashapm/log/FabricUtils;" to "17339d9f7e313156cece65855d21c8033635e72ee7666463b8db9235e5b5c014"
)
internal val camScannerVersions = listOf(
    CamScannerVersion("7.26.5.2609160000", "72651",
        "e2d0db1e14ccd538a167cf5db55ec360b6379d8f4fd37d3f8942048679cf8121", 2),
    CamScannerVersion("7.27.0.2609220000", "72701",
        "b73d99e71b95f75eaf8aa51182bbcc3497c703feac78424e1ad81ddd04a79162", 3, overrides72701)
)
internal fun qualifiedCamScannerVersion(name: String, code: String): CamScannerVersion =
    requireNotNull(camScannerVersions.singleOrNull { it.name == name && it.code == code }) {
        "Unsupported CamScanner input version/code"
    }
