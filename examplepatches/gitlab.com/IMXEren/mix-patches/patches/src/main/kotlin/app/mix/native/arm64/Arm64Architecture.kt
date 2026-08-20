package app.mix.native.arm64

import app.mix.native.NativeArchitecture
import app.mix.native.NativeOpcode

/** AArch64 backend metadata and semantic instruction encoder. */
object Arm64Architecture : NativeArchitecture {
    override val abi = "arm64-v8a"
    override val elfMachine = 183

    override fun encode(opcode: NativeOpcode, address: Long): ByteArray = when (opcode) {
        NativeOpcode.RETURN -> byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    }
}
