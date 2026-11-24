package patches.abrp

import app.morphe.patcher.patch.resourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val BUNDLE_SIZE = 19748912
private const val FUNCTION_OFFSET = 0x010af8ad
private const val FUNCTION_SIZE = 0x3f7
private const val EDIT_OFFSET = FUNCTION_OFFSET + 0x284
private const val TELEMETRY_OFFSET = 0xec170b
private const val TELEMETRY_SIZE = 0x128
private const val TELEMETRY_HOOK_OFFSET = 0xc04bc3
private const val TELEMETRY_HOOK_SIZE = 1327
private const val TELEMETRY_REQUIRED_PERMISSIONS_OFFSET = TELEMETRY_HOOK_OFFSET + 0xb5
private const val FOOTER_SIZE = 20

private fun ByteArray.digest(algorithm: String): String =
    MessageDigest.getInstance(algorithm).digest(this).joinToString("") { "%02x".format(it.toInt() and 0xff) }

internal fun restorePhoneGps(input: ByteArray): ByteArray {
    check(input.size == BUNDLE_SIZE) { "Unsupported ABRP Hermes bundle size" }
    val header = ByteBuffer.wrap(input).order(ByteOrder.LITTLE_ENDIAN)
    check(header.getLong(0) == 0x1f1903c103bc1fc6L && header.getInt(8) == 98 &&
        header.getInt(32) == input.size && header.getInt(40) == 67183) { "Unsupported ABRP Hermes header" }
    val footer = MessageDigest.getInstance("SHA-1").digest(input.copyOfRange(0, input.size - FOOTER_SIZE))
    check(footer.contentEquals(input.copyOfRange(input.size - FOOTER_SIZE, input.size))) { "Invalid ABRP Hermes footer" }
    check(input.digest("SHA-256") == "4b53471ad25eb01522bb009bb3cce7dcf186886f1761451296aeb11edff7174b") {
        "Unsupported ABRP Hermes bundle"
    }
    val entry = 128 + 66741 * 12
    val first = header.getInt(entry)
    val second = header.getInt(entry + 4)
    val largeHeader = (((second ushr 14) and 0xff) shl 24) or (first and 0x1ffffff)
    check((input[entry + 11].toInt() and 0x20) != 0 && largeHeader >= 0 && largeHeader <= input.size - 36 &&
        header.getInt(largeHeader) == FUNCTION_OFFSET && header.getInt(largeHeader + 4) == 1 &&
        header.getInt(largeHeader + 12) == FUNCTION_SIZE && header.getInt(largeHeader + 28) == 40) {
        "ABRP location bootstrap header changed"
    }
    check(input.copyOfRange(FUNCTION_OFFSET, FUNCTION_OFFSET + FUNCTION_SIZE).digest("SHA-256") ==
        "5da4bc7bf249b8bfe39dc70332e0669eb988c79f88bece6970973217509cda07") { "ABRP location bootstrap changed" }
    check(input.copyOfRange(EDIT_OFFSET, EDIT_OFFSET + 6).contentEquals(byteArrayOf(0xb1.toByte(), 0x88.toByte(), 0, 0, 0, 0x18))) {
        "ABRP location branch changed"
    }
    check(input.copyOfRange(TELEMETRY_OFFSET, TELEMETRY_OFFSET + TELEMETRY_SIZE).digest("SHA-256") ==
        "23f7fe596b2ab54adbf86844d5061f0403a49d501d3405372fe4cca0495a133e") { "ABRP telemetry permissions changed" }
    val telemetryWrites = mapOf(
        0x97 to byteArrayOf(0x6e, 3, 5, 0, 3),
        0x11f to byteArrayOf(0x6e, 3, 4, 0, 3),
    )
    telemetryWrites.forEach { (offset, expected) ->
        check(input.copyOfRange(TELEMETRY_OFFSET + offset, TELEMETRY_OFFSET + offset + expected.size).contentEquals(expected)) {
            "ABRP telemetry permission dispatch changed"
        }
    }
    check(input.copyOfRange(TELEMETRY_HOOK_OFFSET, TELEMETRY_HOOK_OFFSET + TELEMETRY_HOOK_SIZE).digest("SHA-256") ==
        "0d321ec941770bb32123b818cd36509bd625504ded3fdff27fd48803be021509") { "ABRP telemetry hook changed" }
    check(input.copyOfRange(TELEMETRY_REQUIRED_PERMISSIONS_OFFSET, TELEMETRY_REQUIRED_PERMISSIONS_OFFSET + 6)
        .contentEquals(byteArrayOf(0x45, 10, 10, 5, 0x95.toByte(), 0xc6.toByte()))) {
        "ABRP telemetry permission list changed"
    }
    // The phone and car-mirror instances share these location paths. Keep mocked fixes
    // marked as mocked, but identify ordinary fixes as car locations in this patch.
    val phoneSourceLabels = mapOf(
        0xe867f9 to 10,
        0xec7f29 to 5,
        0x105f7f5 to 4,
        0x108ab5c to 4,
    )
    phoneSourceLabels.forEach { (offset, register) ->
        val expected = byteArrayOf(0x91.toByte(), register.toByte(), 0xc9.toByte(), 1, 1, 0)
        check(input.copyOfRange(offset, offset + expected.size).contentEquals(expected)) {
            "ABRP GPS source label changed"
        }
    }
    val coarseSourceOffset = 0x108f654
    check(input.copyOfRange(coarseSourceOffset, coarseSourceOffset + 6)
        .contentEquals(byteArrayOf(0x91.toByte(), 4, 0xca.toByte(), 1, 1, 0))) {
        "ABRP coarse GPS source label changed"
    }
    val output = input.copyOf()
    byteArrayOf(0x10, 0, 0, 0x10, 0, 0).copyInto(output, EDIT_OFFSET)
    // Keep vehicle permission reporting intact while leaving GPS permission to the phone bootstrap.
    telemetryWrites.keys.forEach { offset ->
        byteArrayOf(0x10, 3, 3, 0xae.toByte(), 2).copyInto(output, TELEMETRY_OFFSET + offset)
    }
    // No vehicle telemetry permissions are available to the phone build. An empty
    // requirement list lets the car screen open; the real phone GPS grant is separate.
    byteArrayOf(0x08, 10, 0, 0, 0xae.toByte(), 2).copyInto(output, TELEMETRY_REQUIRED_PERMISSIONS_OFFSET)
    phoneSourceLabels.forEach { (offset, register) ->
        byteArrayOf(0x91.toByte(), register.toByte(), 0xf8.toByte(), 0x91.toByte(), 0, 0).copyInto(output, offset)
    }
    byteArrayOf(0x91.toByte(), 4, 0x7d, 0x69, 1, 0).copyInto(output, coarseSourceOffset)
    check(output.copyOfRange(FUNCTION_OFFSET, FUNCTION_OFFSET + FUNCTION_SIZE).digest("SHA-256") ==
        "899303b574e62eee40ea5eb93e3995876a1fb1f2229668bba3c7710851fc2bec") { "ABRP location edit failed" }
    check(output.copyOfRange(TELEMETRY_OFFSET, TELEMETRY_OFFSET + TELEMETRY_SIZE).digest("SHA-256") ==
        "6e85f1b4cf578ef3154c2a1e7172c38f6f71df1854c7d10041ddf8b30fe3fa3c") { "ABRP telemetry edit failed" }
    check(output.copyOfRange(TELEMETRY_HOOK_OFFSET, TELEMETRY_HOOK_OFFSET + TELEMETRY_HOOK_SIZE).digest("SHA-256") ==
        "5b5a01bd39a07af9ddbbda0cdb4e6696667b2e69019da5985375bfaffbffdc50") { "ABRP telemetry hook edit failed" }
    MessageDigest.getInstance("SHA-1").digest(output.copyOfRange(0, output.size - FOOTER_SIZE))
        .copyInto(output, output.size - FOOTER_SIZE)
    check(output.digest("SHA-256") == "0436ff4d032d30d5813f4968e1d6116e2fcfcee06d0e85b6dff14a8abe191d60") {
        "ABRP patched bundle verification failed"
    }
    return output
}

internal fun keepPatchedLocationBundle(manifest: Document) {
    val applications = manifest.getElementsByTagName("application")
    check(applications.length == 1) { "ABRP application declaration changed" }
    val application = applications.item(0) as Element
    val metadata = application.getElementsByTagName("meta-data")
    val updates = (0 until metadata.length).map { metadata.item(it) as Element }.single {
        it.parentNode == application && it.getAttributeNS("http://schemas.android.com/apk/res/android", "name") ==
            "expo.modules.updates.ENABLED"
    }
    check(updates.getAttributeNS("http://schemas.android.com/apk/res/android", "value") == "true") {
        "ABRP JavaScript update configuration changed"
    }
    // Expo can otherwise select a cached publisher bundle on a later launch,
    // bypassing every location edit in the APK, even after an in-place upgrade.
    updates.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", "false")
}

internal val phoneGps = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { keepPatchedLocationBundle(it) }
        val bundle = get("assets/index.android.bundle")
        bundle.writeBytes(restorePhoneGps(bundle.readBytes()))
    }
}
