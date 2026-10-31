package app.badfella.patches.wanderlog

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import org.w3c.dom.Element

// Adapted from arandomhooman/hoomans-morphe-patches (GPLv3); see NOTICE.
// HBC98 inlines the original tier resolver into six functions in this reviewed build.
@Suppress("unused")
val wanderlogProPatch = resourcePatch(
    name = "Wanderlog Pro features",
    description = "Enables local Pro feature checks, removes subscription prompts and auto-opening paywalls, hides the home Pro star, labels the profile button Pro Activated and brands the billing screen. Keeps the patched bundle in place by disabling Expo OTA updates. Does not grant server-run AI, downloads, flight tracking or a subscription.",
) {
    compatibleWith(Compatibility(
        name = "Wanderlog", packageName = "com.wanderlog.android", apkFileType = ApkFileType.APKM,
        appIconColor = 0xF75940,
        targets = listOf(AppTarget(version = "2.227", versionCode = 2026102307, isExperimental = true)),
    ))
    execute {
        fun digest(algorithm: String, bytes: ByteArray) = MessageDigest.getInstance(algorithm).digest(bytes)
        fun sha256(bytes: ByteArray) = digest("SHA-256", bytes).joinToString("") { "%02x".format(it) }
        // LoadConstUndefined r0; Ret r0 — makes a function return undefined immediately.
        fun returnUndefined() = byteArrayOf(0x93.toByte(), 0x00, 0x76.toByte(), 0x00, 0x00, 0x00)
        val bundle = get("assets/index.android.bundle")
        val bytes = bundle.readBytes()
        check(sha256(bytes) == "0ef63cd5d414584d342751a70dbc7dba08a02e5168d3d061d5438ac3e6f2cbfe") {
            "Unreviewed Wanderlog bundle; use 2.227 build 2026102307. HBC signatures must be re-derived for other versions."
        }
        val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        check(buffer.getInt(8) == 98) { "Wanderlog Hermes bytecode version changed" }
        val footer = bytes.size - 20
        check(digest("SHA-1", bytes.copyOf(footer)).contentEquals(bytes.copyOfRange(footer, bytes.size))) {
            "Wanderlog bytecode footer is invalid"
        }
        // Change only the free return values, leaving comparisons and paid/trial date math intact.
        val freeReturns = intArrayOf(
            // shouldShowSubscribeOrTrialModal
            0x13fd429, 0x13fd4a1,
            // shouldShowUpgradeOrResubscribeModal
            0x13fd56a, 0x13fd5e4,
            // shouldShowProBadge
            0x13fd6a8, 0x13fd722,
            // canUserStartSubscription
            0x13fd7e7, 0x13fd861,
            // isTrialOrProUser
            0x13fd924, 0x13fd99e,
            // getUserTierFromLatestSubscription
            0x13fdaad, 0x13fdb24,
        )
        freeReturns.forEach { offset ->
            check((buffer.getShort(offset).toInt() and 0xffff) == 17510 &&
                (bytes[offset - 4].toInt() and 0xff) == 69 && (bytes[offset + 2].toInt() and 0xff) == 82) {
                "Wanderlog tier operand changed at $offset"
            }
            buffer.putShort(offset, 16080.toShort())
        }
        // The inlined attachment/upgrade prompt also returns true for a grace period.
        // Force its final free/grace operands false without moving any instruction or branch.
        val modal = 0x13fd537
        check(bytes.copyOfRange(modal, modal + 4).contentEquals(byteArrayOf(0x17, 3, 5, 3)))
        byteArrayOf(0x96.toByte(), 3, 0x96.toByte(), 4).copyInto(bytes, modal)
        // Billing screen headline: {{siteName}} Pro is Activated by BadFella for you!
        val headline = 2677060
        check(bytes.copyOfRange(headline, headline + 37).toString(Charsets.US_ASCII) ==
            "Pro guides you from idea to itinerary") { "Wanderlog billing headline changed" }
        "Pro is Activated by BadFella for you!".toByteArray(Charsets.US_ASCII).copyInto(bytes, headline)
        // Home Pro star button: make RoundProButton return undefined without moving code.
        val proButton = 0x158918c
        check(bytes.copyOfRange(proButton, proButton + 6).contentEquals(
            byteArrayOf(0x34, 0x07, 0x00, 0x89.toByte(), 0x03, 0x01))) { "Wanderlog Pro button changed" }
        returnUndefined().copyInto(bytes, proButton)
        // Profile label: repoint the Get Pro translation key at the unused faRedditSquare
        // storage and extend its length, so both profile buttons read Pro Activated.
        val labelStorage = 4931283
        check(bytes.copyOfRange(labelStorage, labelStorage + 14).toString(Charsets.US_ASCII) ==
            "faRedditSquare") { "Wanderlog label storage changed" }
        "Pro Activated".toByteArray(Charsets.US_ASCII).copyInto(bytes, labelStorage)
        val labelEntry = 1127260
        check(bytes.copyOfRange(labelEntry, labelEntry + 4).contentEquals(
            byteArrayOf(0x14, 0x2f, 0x4a, 0x07))) { "Wanderlog label entry changed" }
        byteArrayOf(0xa6.toByte(), 0x2f, 0x4a, 0x0d).copyInto(bytes, labelEntry)
        // Auto-opening paywall gates: canAutoShowSubscribeModal and both store variants
        // return undefined so no subscription modal opens by itself.
        val paywallGates = mapOf(
            0x0146c90b to byteArrayOf(0x34, 0x0b.toByte(), 0x00, 0x89.toByte(), 0x06, 0x01),
            0x01771119 to byteArrayOf(0x34, 0x04, 0x00, 0x04, 0x03, 0x89.toByte()),
            0x01771201 to byteArrayOf(0x34, 0x05, 0x00, 0x34, 0x06, 0x01),
        )
        paywallGates.forEach { (offset, prologue) ->
            check(bytes.copyOfRange(offset, offset + 6).contentEquals(prologue)) {
                "Wanderlog paywall gate changed at $offset"
            }
            returnUndefined().copyInto(bytes, offset)
        }
        digest("SHA-1", bytes.copyOf(footer)).copyInto(bytes, footer)
        check(sha256(bytes) == "9cf2e5738b4ad690ce0cf92351c6b9a478700196a0a2bfdced64a8a9b5c1d36c") { "Wanderlog output checksum failed" }
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("meta-data")
            val metadata = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
            val enabled = metadata.single { it.getAttribute("android:name") == "expo.modules.updates.ENABLED" }
            check(enabled.getAttribute("android:value") == "true") { "Wanderlog Expo configuration changed" }
            enabled.setAttribute("android:value", "false")
            metadata.single { it.getAttribute("android:name") == "expo.modules.updates.EXPO_UPDATE_URL" }
                .setAttribute("android:value", "")
        }
        bundle.writeBytes(bytes)
    }
}
