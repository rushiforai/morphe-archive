package app.badfella.patches.wanderlog

import app.badfella.patches.util.Hermes98Bundle
import app.badfella.patches.util.Hermes98Edit
import app.badfella.patches.util.Hermes98Role
import app.badfella.patches.util.Hermes98Variant
import app.badfella.patches.util.hexBytes
import app.badfella.patches.util.writeIntLe

/*
 * Reviewed Wanderlog HBC98 contracts. Every entry binds a whole-function SHA-256 fingerprint
 * (2.227 and 2.228) to edit offsets relative to the function start. Builds that move code or
 * change these bodies fail closed instead of writing at a guessed absolute offset.
 */
private val roles = listOf(
    Hermes98Role("shouldShowSubscribeOrTrialModal", "shouldShowSubscribeOrTrialModal", listOf(
        Hermes98Variant(339, "675bc660a1b162adad8218c79fbf47d78a28895adff17cd13ea90aaab37ae68f", listOf(
            Hermes98Edit(57, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(177, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(327, hexBytes("17030503"), hexBytes("96039604")),
        )),
        Hermes98Variant(339, "f6334a5544bf687fdd5c9dd20b5d13fbb7130d50628ea4533762691940ad95d0", listOf(
            Hermes98Edit(57, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(177, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(327, hexBytes("17030503"), hexBytes("96039604")),
        )),
    )),
    Hermes98Role("shouldShowUpgradeOrResubscribeModal", "shouldShowUpgradeOrResubscribeModal", listOf(
        Hermes98Variant(311, "4b09b04dec4ef2ee2ec94c1e69d3c5d9329ed207c49d426e143aae80f9dd2639", listOf(
            Hermes98Edit(39, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(161, hexBytes("6644"), hexBytes("d03e")),
        )),
        Hermes98Variant(311, "d92da194edcee05092770782bba14c2f9583f1dfd632be15dc43ed7426f74b3f", listOf(
            Hermes98Edit(39, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(161, hexBytes("5d44"), hexBytes("cd3e")),
        )),
    )),
    Hermes98Role("shouldShowProBadge", "shouldShowProBadge", listOf(
        Hermes98Variant(318, "3664f06f95a5c148b5fdbffcf7bcc26f3149d4355fe02b7167a5be8074736e18", listOf(
            Hermes98Edit(46, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(168, hexBytes("6644"), hexBytes("d03e")),
        )),
        Hermes98Variant(318, "472d8678d6c290517fa2ba0aa93beec109cd28b8c10450abd96ef15851de82d2", listOf(
            Hermes98Edit(46, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(168, hexBytes("5d44"), hexBytes("cd3e")),
        )),
    )),
    Hermes98Role("canUserStartSubscription", "canUserStartSubscription", listOf(
        Hermes98Variant(317, "80f020f35bf5a9280dcbd742d767f8eda0c10cdd81995e333d2930eb0ec11fe5", listOf(
            Hermes98Edit(33, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(155, hexBytes("6644"), hexBytes("d03e")),
        )),
        Hermes98Variant(317, "908d413423430074a88764318542200d8e7ea2cf71c37467017c6b39205ae3c3", listOf(
            Hermes98Edit(33, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(155, hexBytes("5d44"), hexBytes("cd3e")),
        )),
    )),
    Hermes98Role("isTrialOrProUser", "isTrialOrProUser", listOf(
        Hermes98Variant(305, "e789ec94ea032c8c7775137151b25ec71faa9c161533310c89e5964dbb98aa48", listOf(
            Hermes98Edit(33, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(155, hexBytes("6644"), hexBytes("d03e")),
        )),
        Hermes98Variant(305, "b6c9e65e373ac2abc07acf3e08f0d2173da67aeb62a47edbaf1c5860fe9c229e", listOf(
            Hermes98Edit(33, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(155, hexBytes("5d44"), hexBytes("cd3e")),
        )),
    )),
    Hermes98Role("getUserTierFromLatestSubscription", "getUserTierFromLatestSubscription", listOf(
        Hermes98Variant(256, "1e7cfae8215431f4324ad9a830ca094c6d76e03e4b0f27ca38aba45fc811cb8a", listOf(
            Hermes98Edit(33, hexBytes("6644"), hexBytes("d03e")),
            Hermes98Edit(152, hexBytes("6644"), hexBytes("d03e")),
        )),
        Hermes98Variant(256, "b758cb10b1238843aa51d3b1af4d12712b92d6e63551eff6273c3523e642761f", listOf(
            Hermes98Edit(33, hexBytes("5d44"), hexBytes("cd3e")),
            Hermes98Edit(152, hexBytes("5d44"), hexBytes("cd3e")),
        )),
    )),
    Hermes98Role("RoundProButton", "RoundProButton", listOf(
        Hermes98Variant(549, "9177a98a0a239013429138728f08a0f6ea86f7a78c4ec68195de000d6466a880", listOf(
            Hermes98Edit(0, hexBytes("340700890301"), hexBytes("930076000000")),
        )),
        Hermes98Variant(549, "b2afb7a9948e9534b416a344c66630f3eb527d114b56515629ee310e686664b7", listOf(
            Hermes98Edit(0, hexBytes("340700890301"), hexBytes("930076000000")),
        )),
    )),
    Hermes98Role("canAutoShowSubscribeModal", "canAutoShowSubscribeModal", listOf(
        Hermes98Variant(259, "839db30872df4ee0890423f00ff9902b16b0042de8b203f7dca20d16fe0a1f4f", listOf(
            Hermes98Edit(0, hexBytes("340b00890601"), hexBytes("930076000000")),
        )),
        Hermes98Variant(259, "2ac22edbe28c2858dc5b60e5c211806db9389200c9c12fa3f900ef518f7a9a61", listOf(
            Hermes98Edit(0, hexBytes("340b00890601"), hexBytes("930076000000")),
        )),
    )),
    Hermes98Role("paywallGateA", "getCanAutoShowSubscribeModal_", listOf(
        Hermes98Variant(189, "f6f6deea8dfea57c88d7d79e565c8b6982e468d32522368da27333820fdf402f", listOf(
            Hermes98Edit(0, hexBytes("340400040389"), hexBytes("930076000000")),
        )),
        Hermes98Variant(189, "1cfb1c727104c6095c2cd3e22092533a4454121c717ec0895b08913d82af8e0d", listOf(
            Hermes98Edit(0, hexBytes("340400040389"), hexBytes("930076000000")),
        )),
    )),
    Hermes98Role("paywallGateB", "getCanAutoShowSubscribeModal_", listOf(
        Hermes98Variant(257, "a06e48f1758f81b9b552e24fc34be8a3fa8f06383b0bd02ec4db30cb5e2c7346", listOf(
            Hermes98Edit(0, hexBytes("340500340601"), hexBytes("930076000000")),
        )),
        Hermes98Variant(257, "0c7b1888fadf823a8341f1288bf976154edc1edb72fd2802c768b42e78015a6f", listOf(
            Hermes98Edit(0, hexBytes("340500340601"), hexBytes("930076000000")),
        )),
    )),
    Hermes98Role("DarkModeContextProvider", "DarkModeContextProvider", listOf(
        Hermes98Variant(297, "739b05e3096869916c618baf0fab4e0c6ec583b2d9c1087ed6b0d984adb62bb6", listOf(
            Hermes98Edit(190, hexBytes("b2510a"), hexBytes("b2030a")),
            Hermes98Edit(229, hexBytes("d32a0809"), hexBytes("d3040809")),
        )),
        Hermes98Variant(297, "f0793d00d9421da5e815edb9033cdc5ba7b3374002cd6d5afeb8cdf6e56e25a8", listOf(
            Hermes98Edit(190, hexBytes("b2510a"), hexBytes("b2030a")),
            Hermes98Edit(229, hexBytes("d32a0809"), hexBytes("d3040809")),
        )),
    )),
)

private const val BILLING_HEADLINE = "Pro guides you from idea to itinerary"
private const val BILLING_REPLACEMENT = "Pro is Activated by BadFella for you!"
private const val PROFILE_KEY = "Get Pro"
private const val PROFILE_LABEL = "Pro Activated"
private const val PROFILE_STORAGE = "faRedditSquare"

internal fun patchWanderlogBundle(stock: ByteArray): ByteArray {
    val bundle = Hermes98Bundle.parse(stock)
    val result = bundle.patchRoles(roles)

    // The billing screen headline lives in a longer "{{siteName}} ..." translation string.
    val headline = bundle.findContainingEntry(BILLING_HEADLINE)
    val headlineText = bundle.string(headline)
    check(headlineText.indexOf(BILLING_HEADLINE) == headlineText.lastIndexOf(BILLING_HEADLINE)) {
        "Wanderlog billing headline is ambiguous"
    }
    check(BILLING_HEADLINE.length == BILLING_REPLACEMENT.length) { "Wanderlog billing headline length changed" }
    BILLING_REPLACEMENT.toByteArray(Charsets.ISO_8859_1).copyInto(
        result, bundle.rawOffset(headline) + headlineText.indexOf(BILLING_HEADLINE),
    )

    // Repoint the profile "Get Pro" label at the unused faRedditSquare storage.
    val keyEntry = bundle.findExactEntry(PROFILE_KEY)
    val labelEntry = bundle.findExactEntry(PROFILE_STORAGE)
    val labelOffset = bundle.rawOffset(labelEntry) - bundle.storageOffset
    check(labelOffset >= 0 && labelOffset < (1 shl 23)) { "Wanderlog profile label storage is invalid" }
    PROFILE_LABEL.toByteArray(Charsets.ISO_8859_1).copyInto(result, bundle.rawOffset(labelEntry))
    writeIntLe(result, bundle.entryOffset(keyEntry), (PROFILE_LABEL.length shl 24) or (labelOffset shl 1))

    bundle.seal(result)
    return result
}
