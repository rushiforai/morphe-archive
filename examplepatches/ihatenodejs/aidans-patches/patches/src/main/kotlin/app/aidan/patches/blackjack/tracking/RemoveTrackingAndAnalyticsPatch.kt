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

        disable(0x3c34240, byteArrayOf(0xfe.toByte(), 0x4f, 0xbf.toByte(), 0xa9.toByte()), "Tripledot Analytics.SendEvent")
        disable(0x3c342e8, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x04, 0xd1.toByte()), "Tripledot Analytics.SendEventInternal")
        disable(0x3c34ec4, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x03, 0xd1.toByte()), "Tripledot Analytics.SendToSinks")
        listOf(
            0x2066dc4 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x2066f04 to byteArrayOf(0xe8.toByte(), 0x0f, 0x1d, 0xfc.toByte()),
            0x2067054 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x2067194 to byteArrayOf(0xfe.toByte(), 0x5f, 0xbd.toByte(), 0xa9.toByte()),
            0x20672d4 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x20673e4 to byteArrayOf(0xfe.toByte(), 0x67, 0xbc.toByte(), 0xa9.toByte())
        ).forEach { (offset, expected) -> disable(offset, expected, "FirebaseAnalytics.LogEvent") }
        listOf(0x2091110, 0x2091258, 0x20912c0).forEach { offset ->
            disable(offset, byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()), "Crashlytics report")
        }
        disable(0x1f87224, byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()), "Adjust.InitSdk")
        listOf(
            0x1f89154 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()),
            0x1f8b774 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x1f8c440 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte()),
            0x1f8c4a8 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()),
            0x1f8cd14 to byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte())
        ).forEach { (offset, expected) -> disable(offset, expected, "Adjust tracking") }
        disable(0x3ca3980, byteArrayOf(0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte()), "AppsFlyerManager.Init")
        disable(0x4085868, byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x02, 0xd1.toByte()), "Unity Analytics.Initialize")
        library.writeBytes(bytes)
    }
}
