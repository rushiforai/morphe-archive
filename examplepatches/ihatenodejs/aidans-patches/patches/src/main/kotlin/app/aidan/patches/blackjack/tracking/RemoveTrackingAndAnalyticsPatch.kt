package app.aidan.patches.blackjack.tracking

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val ARM64_RETURN = byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

@Suppress("unused")
val removeTrackingAndAnalyticsPatch = rawResourcePatch(
    name = "Remove Tracking and Analytics",
    description = "Neutralizes active advertising telemetry, analytics, attribution, and crash reporting.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_BLACKJACK)

    execute {
        val library = get("lib/arm64-v8a/libil2cpp.so")
        if (!library.exists()) throw PatchException("Missing arm64 IL2CPP library")
        val bytes = library.readBytes()

        /**
         * Writes an ARM64 return at byte [offset] in the in-memory library after checking
         * [expected], or does nothing if already patched. [target] identifies errors;
         * this helper does not write the file.
         *
         * @throws PatchException if the return extends past the library or expected bytes differ.
         * @throws IndexOutOfBoundsException if an unchecked negative offset or expected range is invalid.
         */
        fun disable(offset: Int, expected: ByteArray, target: String) {
            if (bytes.size < offset + ARM64_RETURN.size) throw PatchException("$target is outside libil2cpp.so")
            if (ARM64_RETURN.indices.all { bytes[offset + it] == ARM64_RETURN[it] }) return
            if (!expected.indices.all { bytes[offset + it] == expected[it] }) {
                throw PatchException("$target byte sequence mismatch at 0x${offset.toString(16)}")
            }
            System.arraycopy(ARM64_RETURN, 0, bytes, offset, ARM64_RETURN.size)
        }

        disable(0x3bf0808, byteArrayOf(0xfe.toByte(), 0x4f, 0xbf.toByte(), 0xa9.toByte()), "Tripledot Analytics.SendEvent")
        disable(0x3bf08b0, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x04, 0xd1.toByte()), "Tripledot Analytics.SendEventInternal")
        disable(0x3bf1510, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x03, 0xd1.toByte()), "Tripledot Analytics.SendToSinks")
        listOf(
            0x20450b4 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x20451f4 to byteArrayOf(0xe8.toByte(), 0x0f, 0x1d, 0xfc.toByte()),
            0x2045344 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x2045484 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x20455c4 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x20456d4 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1d, 0xf8.toByte()),
            0x2045738 to byteArrayOf(0xff.toByte(), 0x43, 0x01, 0xd1.toByte())
        ).forEach { (offset, expected) -> disable(offset, expected, "FirebaseAnalytics.LogEvent") }
        listOf(0x20701a8, 0x20702f0, 0x2070358).forEach { offset ->
            disable(offset, byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()), "Crashlytics report")
        }
        disable(0x1f6468c, byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()), "Adjust.InitSdk")
        listOf(
            0x1f665bc to byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()),
            0x1f68bdc to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x1f698a8 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()),
            0x1f69910 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x1f6a17c to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte())
        ).forEach { (offset, expected) -> disable(offset, expected, "Adjust tracking") }
        disable(0x3c5f74c, byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()), "AppsFlyerManager.Init")
        disable(0x4040958, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x02, 0xd1.toByte()), "Unity Analytics.Initialize")
        library.writeBytes(bytes)
    }
}
