package app.ckzorigins.patches.compat

import app.adebisi.patches.shared.hexToBytes
import app.morphe.patcher.patch.PatchException
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

/**
 * `res/raw/properties.dat` is AES/CBC/PKCS5Padding. Key and IV are the 16-byte
 * fill-array payloads in `AJTUtil.GetProperty`.
 */
internal object PropertiesDat {
    private val KEY = "a9cc36b80e9e5c25947d80d676a3f638".hexToBytes()
    private val IV = "fb3104bfc8db4ddbbbce2c38e780d67e".hexToBytes()
    private val OBB_LINE = Regex("(?m)^(OBB_ENABLED\\s*=\\s*).*$")

    fun disableObb(ciphertext: ByteArray): ByteArray {
        val plain = decrypt(ciphertext).decodeToString()
        val updated = OBB_LINE.replace(plain) { match -> match.groupValues[1] + "false" }
        if (updated == plain) {
            throw PatchException("properties.dat has no OBB_ENABLED line")
        }
        return encrypt(updated.encodeToByteArray())
    }

    fun decrypt(ciphertext: ByteArray): ByteArray {
        val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        cipher.init(Cipher.DECRYPT_MODE, SecretKeySpec(KEY, "AES"), IvParameterSpec(IV))
        return cipher.doFinal(ciphertext)
    }

    fun encrypt(plaintext: ByteArray): ByteArray {
        val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
        cipher.init(Cipher.ENCRYPT_MODE, SecretKeySpec(KEY, "AES"), IvParameterSpec(IV))
        return cipher.doFinal(plaintext)
    }
}
