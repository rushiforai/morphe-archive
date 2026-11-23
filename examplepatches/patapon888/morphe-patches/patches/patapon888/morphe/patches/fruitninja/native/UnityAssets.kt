package patapon888.morphe.patches.fruitninja.native

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val UNITY_DATA = "assets/bin/Data"

/**
 * Makes every GameObject with one of [names] start inactive, in all scenes and prefabs, so it
 * and its children never show. The objects are found by name, not by file or position, so the
 * same patch keeps working when the game's assets are rebuilt.
 *
 * A serialized GameObject ends with m_Layer (u32), m_Name (u32 length + bytes, padded to 4),
 * m_Tag (u16) and m_IsActive (u8). The layer and padding are checked so that the name inside
 * another kind of object (an animation path, a text) is not taken for a GameObject.
 */
internal fun ResourcePatchContext.deactivateGameObjects(names: List<String>) {
    val data = get(UNITY_DATA)
    if (!data.isDirectory) throw PatchException("$UNITY_DATA not found. Patch the full app (base and splits).")

    val patterns = names.associateWith { name ->
        val bytes = name.toByteArray(Charsets.UTF_8)
        ByteBuffer.allocate(4 + bytes.size).order(ByteOrder.LITTLE_ENDIAN).putInt(bytes.size).put(bytes).array()
    }
    val found = names.associateWith { 0 }.toMutableMap()

    data.listFiles()!!.filter { it.isFile && !it.name.endsWith(".resource") && !it.name.endsWith(".resS") }
        .forEach { file ->
            val bytes = file.readBytes()
            var changed = false
            patterns.forEach { (name, pattern) ->
                var start = bytes.indexOf(pattern, 0)
                while (start >= 0) {
                    val end = start + pattern.size
                    val tag = (end + 3) and 3.inv()
                    val active = tag + 2
                    val layer = if (start >= 4) ByteBuffer.wrap(bytes, start - 4, 4).order(ByteOrder.LITTLE_ENDIAN).int else -1
                    if (layer in 0..31 && active < bytes.size && (end until tag).all { bytes[it] == 0.toByte() } &&
                        (bytes[active] == 0.toByte() || bytes[active] == 1.toByte())
                    ) {
                        bytes[active] = 0
                        changed = true
                        found[name] = found.getValue(name) + 1
                    }
                    start = bytes.indexOf(pattern, end)
                }
            }
            if (changed) file.writeBytes(bytes)
        }

    found.filterValues { it == 0 }.keys.takeIf { it.isNotEmpty() }?.let {
        throw PatchException("GameObjects not found in $UNITY_DATA: ${it.joinToString()}. Unsupported app version?")
    }
}

private fun ByteArray.indexOf(pattern: ByteArray, from: Int): Int {
    val first = pattern[0]
    var i = from
    val last = size - pattern.size
    while (i <= last) {
        if (this[i] == first) {
            var j = 1
            while (j < pattern.size && this[i + j] == pattern[j]) j++
            if (j == pattern.size) return i
        }
        i++
    }
    return -1
}
