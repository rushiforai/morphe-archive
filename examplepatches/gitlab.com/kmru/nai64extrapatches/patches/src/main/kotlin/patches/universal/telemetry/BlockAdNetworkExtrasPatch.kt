package patches.universal.telemetry

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

private val adNetworkStaticEntries = setOf(
    "init", "initialize", "configure", "start", "register", "setup",
)

private val adNetworkInstanceEntries = setOf(
    "init", "initialize", "start", "loadAd", "showAd",
)

@Suppress("unused")
val blockAdNetworkExtrasPatch = bytecodePatch(
    name = "Block Ad Network Extras",
    description = "Stops smaller ad networks missed by Disable Ad SDK Init so their SDKs never initialize or serve ads",
    default = false,
) {
    category("Telemetry")
    val blockAmazonAds by booleanOption(
        title = "Block Amazon Ads",
        default = true,
        key = "blockAmazonAds",
        description = "Amazon mobile ads SDK.",
    )
    val blockAppodeal by booleanOption(
        title = "Block Appodeal",
        default = true,
        key = "blockAppodeal",
        description = "Appodeal mediation SDK.",
    )
    val blockBidMachine by booleanOption(
        title = "Block BidMachine",
        default = true,
        key = "blockBidMachine",
        description = "BidMachine header bidding SDK.",
    )
    val blockFyber by booleanOption(
        title = "Block Fyber",
        default = true,
        key = "blockFyber",
        description = "Fyber (Digital Turbine) mediation SDK.",
    )
    val blockHelpShift by booleanOption(
        title = "Block HelpShift",
        default = true,
        key = "blockHelpShift",
        description = "HelpShift support and messaging SDK.",
    )
    val blockHyprMx by booleanOption(
        title = "Block HyprMX",
        default = true,
        key = "blockHyprMx",
        description = "HyprMX rewarded ads SDK.",
    )
    val blockIabOm by booleanOption(
        title = "Block IAB Open Measurement",
        default = true,
        key = "blockIabOm",
        description = "IAB OM SDK viewability measurement.",
    )
    val blockSuperAwesome by booleanOption(
        title = "Block SuperAwesome",
        default = true,
        key = "blockSuperAwesome",
        description = "SuperAwesome kid-safe ads SDK.",
    )
    val blockTapjoy by booleanOption(
        title = "Block Tapjoy",
        default = true,
        key = "blockTapjoy",
        description = "Tapjoy offerwall ads SDK.",
    )
    val blockAdColony by booleanOption(
        title = "Block AdColony",
        default = true,
        key = "blockAdColony",
        description = "AdColony video ads SDK.",
    )
    val blockSmaato by booleanOption(
        title = "Block Smaato",
        default = true,
        key = "blockSmaato",
        description = "Smaato ads SDK.",
    )
    val blockOgury by booleanOption(
        title = "Block Ogury",
        default = true,
        key = "blockOgury",
        description = "Ogury consent-driven ads SDK.",
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val prefixes = buildMap {
            if (blockAmazonAds == true) put("Lcom/amazon/device/ads", "Amazon Ads")
            if (blockAppodeal == true) put("Lcom/appodeal", "Appodeal")
            if (blockBidMachine == true) put("Lio/bidmachine", "BidMachine")
            if (blockFyber == true) put("Lcom/fyber", "Fyber")
            if (blockHelpShift == true) put("Lcom/helpshift", "HelpShift")
            if (blockHyprMx == true) put("Lcom/hyprmx", "HyprMX")
            if (blockIabOm == true) put("Lcom/iab/omid", "IAB OM")
            if (blockSuperAwesome == true) put("Ltv/superawesome", "SuperAwesome")
            if (blockTapjoy == true) put("Lcom/tapjoy", "Tapjoy")
            if (blockAdColony == true) put("Lcom/adcolony", "AdColony")
            if (blockSmaato == true) put("Lcom/smaato", "Smaato")
            if (blockOgury == true) put("Lcom/ogury", "Ogury")
        }
        if (prefixes.isEmpty()) {
            logger.warning("All vendors disabled. No changes applied.")
            return@execute
        }
        val hit = blockSdkMethods(prefixes, adNetworkStaticEntries, adNetworkInstanceEntries)
        if (hit.isEmpty()) logger.warning("No ad network SDKs found. No changes applied.")
        else hit.forEach { (sdk, count) -> logger.info("Blocked $sdk ($count method(s))") }
    }
}
