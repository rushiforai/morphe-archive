package app.template.patches.fst7

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.FST7_COMPATIBILITY
import java.security.MessageDigest

private const val FST7_HERMES_BUNDLE_PATH = "assets/index.android.bundle"

private val fst7SuppressPaywallResourcePatch = rawResourcePatch {
    execute {
        val bundle = get(FST7_HERMES_BUNDLE_PATH)
        if (!bundle.exists()) {
            throw PatchException("$FST7_HERMES_BUNDLE_PATH not found in the APK.")
        }

        val bytes = bundle.readBytes()
        bytes.requireHermesBundle(FST7_HERMES_BUNDLE_PATH)

        // checkSubscription reads config.home.noPaywall, then jumps to the built-in
        // setShouldShowPaywall(false) return path when the value is true.
        val signature = bytesOf(
            0x36, 0x02, 0x02, 0x02, 0x8a,
            0x37, 0x02, 0x02, 0x03, 0x3b, 0x97,
            0x91, 0xed, 0x01, 0x00, 0x00, 0x02,
            0x77, 0x0b, 0x77
        )
        val match = bytes.findUnique(signature, "FST-7 checkSubscription noPaywall branch")

        // Replace only `GetById r2, r2, ..., "noPaywall"` with repeated
        // `LoadConstTrue r2` instructions to preserve the original 6-byte size.
        val getNoPaywallOffset = match + 5
        bytesOf(0x78, 0x02, 0x78, 0x02, 0x78, 0x02)
            .copyInto(bytes, getNoPaywallOffset)

        bundle.writeBytes(bytes.withRecalculatedHermesSha1())
    }
}

@Suppress("unused")
val fst7UnlockSubscriptionPatch = bytecodePatch(
    name = "Unlock FST-7 Subscription",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(FST7_COMPATIBILITY)
    dependsOn(fst7SuppressPaywallResourcePatch)

    execute {
        Fst7HybridHasActiveSubscriptionsFingerprint
            .match(classDefBy(Fst7HybridHasActiveSubscriptionsFingerprint.definingClass!!))
            .method
            .apply {
                if (implementation == null) return@apply
                addInstructions(
                    0,
                    """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                    """.trimIndent()
                )
            }

        Fst7HybridGetActiveSubscriptionsFingerprint
            .match(classDefBy(Fst7HybridGetActiveSubscriptionsFingerprint.definingClass!!))
            .method
            .apply {
                if (implementation == null) return@apply
                addInstructions(
                    0,
                    """
                    const/4 v0, 0x1
                    new-array v0, v0, [Lcom/margelo/nitro/iap/NitroActiveSubscription;

                    new-instance v1, Lcom/margelo/nitro/iap/NitroActiveSubscription;
                    const-string v2, "plankk.fst7.subscription"
                    const/4 v3, 0x1
                    const-string v4, "xhehab-fst7-test"
                    const-string v5, "xhehab-fst7-token"
                    const-wide/16 v6, 0x0
                    const/4 v8, 0x0
                    const/4 v9, 0x0
                    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    const/4 v11, 0x0
                    const/4 v12, 0x0
                    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    const-string v14, "monthly"
                    const-string v15, "monthly"
                    const-string v16, "xhehab-fst7-token"
                    invoke-direct/range {v1 .. v16}, Lcom/margelo/nitro/iap/NitroActiveSubscription;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;DLjava/lang/Double;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Double;Lcom/margelo/nitro/iap/NitroRenewalInfoIOS;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

                    const/4 v2, 0x0
                    aput-object v1, v0, v2
                    return-object v0
                    """.trimIndent()
                )
            }
    }
}

private fun bytesOf(vararg bytes: Int) = ByteArray(bytes.size) { bytes[it].toByte() }

private fun ByteArray.requireHermesBundle(path: String) {
    val magic = bytesOf(0xc6, 0x1f, 0xbc, 0x03, 0xc1, 0x03, 0x19, 0x1f)
    if (size < magic.size + 4 || !copyOfRange(0, magic.size).contentEquals(magic)) {
        throw PatchException("$path is not a Hermes bytecode bundle.")
    }
}

private fun ByteArray.withRecalculatedHermesSha1(): ByteArray {
    val version = copyOfRange(8, 12).toLittleEndianInt()
    if (version <= 74) return this

    val content = dropLast(20).toByteArray()
    val sha1 = MessageDigest.getInstance("SHA-1").digest(content)
    return content + sha1
}

private fun ByteArray.toLittleEndianInt(): Int =
    (this[0].toInt() and 0xff) or
        ((this[1].toInt() and 0xff) shl 8) or
        ((this[2].toInt() and 0xff) shl 16) or
        ((this[3].toInt() and 0xff) shl 24)

private fun ByteArray.findUnique(pattern: ByteArray, name: String): Int {
    var found: Int? = null
    val last = size - pattern.size

    outer@ for (index in 0..last) {
        for (patternIndex in pattern.indices) {
            if (this[index + patternIndex] != pattern[patternIndex]) continue@outer
        }

        if (found != null) {
            throw PatchException("$name matched more than once in $FST7_HERMES_BUNDLE_PATH.")
        }
        found = index
    }

    return found ?: throw PatchException("$name not found in $FST7_HERMES_BUNDLE_PATH.")
}
