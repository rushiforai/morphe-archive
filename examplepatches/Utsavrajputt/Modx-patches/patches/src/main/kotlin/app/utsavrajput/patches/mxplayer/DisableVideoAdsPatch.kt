package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.patch.rawResourcePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER

@Suppress("unused")
val disableVideoAdsPatch = rawResourcePatch(
    name = "Disable video ads",
    description = "Disables video ads by patching the native library.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        val libFile = get("lib/arm64-v8a/libmx-bh.so")

        require(libFile.exists()) {
            "libmx-bh.so not found."
        }

        val bytes = libFile.readBytes()

        val offset = 0x319B0

        val original = byteArrayOf(
            0xFD.toByte(),
            0x7B.toByte(),
            0xBA.toByte(),
            0xA9.toByte()
        )

        val patched = byteArrayOf(
            0xC0.toByte(),
            0x03.toByte(),
            0x5F.toByte(),
            0xD6.toByte()
        )

        require(
            bytes.copyOfRange(offset, offset + original.size)
                .contentEquals(original)
        ) {
            "Unsupported MX Player version."
        }

        patched.copyInto(bytes, offset)

        libFile.writeBytes(bytes)
    }
}