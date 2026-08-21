package anxyis.morphe.patches.shared

object HexPatchBuilder {
    fun bytesFromHex(hex: String): ByteArray {
        val clean = hex.replace(" ", "").replace("\n", "")
        val result = ByteArray(clean.length / 2)
        for (i in 0 until clean.length step 2) {
            result[i / 2] = clean.substring(i, i + 2).toInt(16).toByte()
        }
        return result
    }

    fun findPattern(data: ByteArray, pattern: ByteArray): Int {
        if (pattern.isEmpty() || data.size < pattern.size) return -1
        for (i in 0..data.size - pattern.size) {
            var match = true
            for (j in pattern.indices) {
                if (data[i + j] != pattern[j]) {
                    match = false
                    break
                }
            }
            if (match) return i
        }
        return -1
    }
}
