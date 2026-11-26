package app.sadmod.client.data.patcher

import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.charset.Charset

/**
 * Pure-Kotlin parser and stripper for compiled binary AndroidManifest.xml (AXML).
 */
object ApkManifestParser {

    private const val CHUNK_AXML_FILE = 0x0003
    private const val CHUNK_STRING_POOL = 0x0001
    private const val CHUNK_START_ELEMENT = 0x0102
    private const val CHUNK_END_ELEMENT = 0x0103
    private const val UTF8_FLAG = 1 shl 8
    private const val ATTR_TYPE_STRING = 3

    fun parsePermissions(axml: ByteArray): List<String> {
        if (axml.size < 8) return emptyList()
        val buf = ByteBuffer.wrap(axml).order(ByteOrder.LITTLE_ENDIAN)
        val magic = buf.getShort(0).toInt() and 0xFFFF
        val headerSize = buf.getShort(2).toInt() and 0xFFFF
        if (magic != CHUNK_AXML_FILE || headerSize < 8 || headerSize > axml.size) {
            return emptyList()
        }

        val result = linkedSetOf<String>()
        var strings: List<String> = emptyList()
        var pos = headerSize

        while (pos + 8 <= axml.size) {
            val ctype = buf.getShort(pos).toInt() and 0xFFFF
            val csize = buf.getInt(pos + 4)
            if (csize < 8 || pos + csize > axml.size) break

            if (ctype == CHUNK_STRING_POOL && strings.isEmpty()) {
                strings = parseStringPool(axml, buf, pos)
            } else if (ctype == CHUNK_START_ELEMENT && strings.isNotEmpty()) {
                val perm = extractPermissionIfUsesPermission(buf, pos, csize, strings)
                if (!perm.isNullOrBlank()) {
                    result.add(perm)
                }
            }
            pos += csize
        }
        return result.toList()
    }

    fun stripPermissionsFromAxml(axml: ByteArray, removeSet: Set<String>): ByteArray {
        if (removeSet.isEmpty() || axml.size < 8) return axml
        val buf = ByteBuffer.wrap(axml).order(ByteOrder.LITTLE_ENDIAN)
        val magic = buf.getShort(0).toInt() and 0xFFFF
        val headerSize = buf.getShort(2).toInt() and 0xFFFF
        if (magic != CHUNK_AXML_FILE || headerSize < 8 || headerSize > axml.size) {
            return axml
        }

        val out = ByteArrayOutputStream(axml.size)
        out.write(axml, 0, headerSize)

        var strings: List<String> = emptyList()
        var pos = headerSize
        var skipDepth = 0

        while (pos + 8 <= axml.size) {
            val ctype = buf.getShort(pos).toInt() and 0xFFFF
            val csize = buf.getInt(pos + 4)
            if (csize < 8 || pos + csize > axml.size) {
                out.write(axml, pos, axml.size - pos)
                break
            }

            if (ctype == CHUNK_STRING_POOL && strings.isEmpty()) {
                strings = parseStringPool(axml, buf, pos)
                out.write(axml, pos, csize)
            } else if (skipDepth > 0) {
                if (ctype == CHUNK_START_ELEMENT) skipDepth++
                else if (ctype == CHUNK_END_ELEMENT) skipDepth--
            } else if (ctype == CHUNK_START_ELEMENT && strings.isNotEmpty()) {
                val perm = extractPermissionIfUsesPermission(buf, pos, csize, strings)
                if (perm != null && perm in removeSet) {
                    skipDepth = 1
                } else {
                    out.write(axml, pos, csize)
                }
            } else {
                out.write(axml, pos, csize)
            }

            pos += csize
        }

        val result = out.toByteArray()
        ByteBuffer.wrap(result).order(ByteOrder.LITTLE_ENDIAN).putInt(4, result.size)
        return result
    }

    private fun extractPermissionIfUsesPermission(
        buf: ByteBuffer,
        pos: Int,
        csize: Int,
        strings: List<String>
    ): String? {
        if (pos + 28 > pos + csize) return null
        val nameIdx = buf.getInt(pos + 20)
        val tag = strings.getOrNull(nameIdx) ?: return null
        if (tag != "uses-permission" && tag != "uses-permission-sdk-23") return null

        val attrStart = buf.getShort(pos + 24).toInt() and 0xFFFF
        val attrSize = (buf.getShort(pos + 26).toInt() and 0xFFFF).coerceAtLeast(20)
        val attrCount = buf.getShort(pos + 28).toInt() and 0xFFFF
        val abase = pos + 16 + attrStart

        for (a in 0 until attrCount) {
            val aoff = abase + a * attrSize
            if (aoff + 20 > pos + csize) break
            val attrNameIdx = buf.getInt(aoff + 4)
            val attrName = strings.getOrNull(attrNameIdx)
            val rawValueIdx = buf.getInt(aoff + 8)
            val typedType = buf.get(aoff + 15).toInt() and 0xFF
            val typedData = buf.getInt(aoff + 16)

            val value = when {
                rawValueIdx in strings.indices -> strings[rawValueIdx]
                typedType == ATTR_TYPE_STRING && typedData in strings.indices -> strings[typedData]
                else -> null
            }
            if (!value.isNullOrBlank() && (attrName == "name" || value.contains(".permission."))) {
                return value
            }
        }
        return null
    }

    private fun parseStringPool(axml: ByteArray, buf: ByteBuffer, pos: Int): List<String> {
        if (pos + 28 > axml.size) return emptyList()
        val stringCount = buf.getInt(pos + 8)
        val flags = buf.getInt(pos + 16)
        val stringsStart = buf.getInt(pos + 20)
        val isUtf8 = (flags and UTF8_FLAG) != 0
        val poolBase = pos + stringsStart
        if (stringCount <= 0 || poolBase >= axml.size) return emptyList()

        val list = ArrayList<String>(stringCount)
        val utf16Le = Charset.forName("UTF-16LE")

        for (i in 0 until stringCount) {
            val offPos = pos + 28 + i * 4
            if (offPos + 4 > axml.size) break
            val strOff = buf.getInt(offPos)
            var p = poolBase + strOff
            if (p < 0 || p >= axml.size) {
                list.add("")
                continue
            }

            if (isUtf8) {
                // Skip UTF-16 char length (1 or 2 bytes)
                p += if ((axml[p].toInt() and 0x80) != 0) 2 else 1
                if (p >= axml.size) {
                    list.add("")
                    continue
                }
                var byteLen = axml[p].toInt() and 0xFF
                if ((byteLen and 0x80) != 0) {
                    if (p + 1 >= axml.size) {
                        list.add("")
                        continue
                    }
                    byteLen = ((byteLen and 0x7F) shl 8) or (axml[p + 1].toInt() and 0xFF)
                    p += 2
                } else {
                    p += 1
                }
                val safeLen = byteLen.coerceAtMost((axml.size - p).coerceAtLeast(0))
                list.add(String(axml, p, safeLen, Charsets.UTF_8))
            } else {
                if (p + 2 > axml.size) {
                    list.add("")
                    continue
                }
                var charLen = buf.getShort(p).toInt() and 0xFFFF
                if ((charLen and 0x8000) != 0) {
                    if (p + 4 > axml.size) {
                        list.add("")
                        continue
                    }
                    charLen = ((charLen and 0x7FFF) shl 16) or (buf.getShort(p + 2).toInt() and 0xFFFF)
                    p += 4
                } else {
                    p += 2
                }
                val byteLen = (charLen * 2).coerceAtMost((axml.size - p).coerceAtLeast(0))
                list.add(String(axml, p, byteLen, utf16Le))
            }
        }
        return list
    }
}
