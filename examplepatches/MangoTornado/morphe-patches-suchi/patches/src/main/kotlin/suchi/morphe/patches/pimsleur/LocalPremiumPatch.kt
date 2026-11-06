package suchi.morphe.patches.pimsleur

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

private const val bundleSha256 =
    "00de65410c84a4907be54bfe11d211b8a7f5e868264f7e924af9398131fec0c5"

@Suppress("unused")
val localPremiumPatch = rawResourcePatch(
    name = "Enable local Premium controls",
    description = "Overrides Pimsleur's local Premium selectors for research. " +
        "Does not alter server-side account entitlement.",
    default = false,
) {
    compatibleWith(pimsleurCompatibility)

    execute {
        val bundle = get("assets/index.android.bundle", true)
        if (!bundle.isFile) {
            throw PatchException("Pimsleur's Hermes bundle is missing.")
        }
        val bytes = bundle.readBytes()
        val actualSha256 = MessageDigest.getInstance("SHA-256")
            .digest(bytes)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        if (actualSha256 != bundleSha256) {
            throw PatchException("Pimsleur's Hermes bundle differs from the inspected 8.1 revision.")
        }

        // HBC v96: LoadConstTrue r0; Ret r0. Remaining body bytes are Unreachable.
        val returnTrue = byteArrayOf(0x78, 0x00, 0x5c, 0x00)
        for ((offset, size) in listOf(
            3521571 to 41, // isPU
            3522424 to 84, // getPremiumStatus
        )) {
            bytes.fill(0, offset, offset + size)
            returnTrue.copyInto(bytes, offset)
        }

        val footerOffset = bytes.size - 20
        val sha1 = MessageDigest.getInstance("SHA-1").apply {
            update(bytes, 0, footerOffset)
        }.digest()
        sha1.copyInto(bytes, footerOffset)
        bundle.writeBytes(bytes)
    }
}
