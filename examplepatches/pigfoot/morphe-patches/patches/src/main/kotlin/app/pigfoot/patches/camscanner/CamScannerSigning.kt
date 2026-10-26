package app.pigfoot.patches.camscanner

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool

internal data class SigningEdit(val hash: String, val offset: Int, val before: ByteArray, val after: ByteArray)
internal val signingEdits = mapOf(
    "lib/arm64-v8a/libnative-encrypt.so" to SigningEdit(
        "d53a40d72454dd0e663943a2cf5f209c5d1e8c68bbfc2ff0783d4d5cd58e42c9", 0x2b9d4,
        byteArrayOf(0xb7.toByte(), 0x07, 0x00, 0x36), byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())),
    "lib/armeabi/libnative-encrypt.so" to SigningEdit(
        "2756ca6897741891c047b84099333a2fd3d79fff2251f55983dd7e1c6c0497f8", 0x10ac6,
        byteArrayOf(0x4b, 0xd0.toByte()), byteArrayOf(0x00, 0xbf.toByte()))
)

internal fun editSigning(bytes: ByteArray, spec: SigningEdit): ByteArray {
    require(sha256(bytes) == spec.hash) { "Unsupported or already modified native signing library" }
    require(spec.before.isNotEmpty() && spec.before.size == spec.after.size &&
        spec.offset >= 0 && spec.offset <= bytes.size - spec.before.size) { "Invalid signing edit bounds" }
    require(bytes.copyOfRange(spec.offset, spec.offset + spec.before.size).contentEquals(spec.before)) {
        "Unsupported native signing gate"
    }
    return bytes.copyOf().also { spec.after.copyInto(it, spec.offset) }
}
