package io.github.forsigh.waze

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.resourcePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.charset.StandardCharsets

/**
 * Waze draws its realtime alert pins with Godot. The pin's own size is not a resource Waze reads per
 * frame; it is the scale the scene's AnimationPlayer gives the root's children, baked into three
 * packed scenes: `OverviewAlertsAnimation/SmallScene` (zoomed-out dot), `MediumScene` (bubble) and
 * `LargeScene` (the large pin). Waze only sets each scene root's scale as the map zooms.
 *
 * So the lever is the pack itself: `assets/res/godot/waze_map_scenes.pck` carries the three scenes,
 * and every shown `node:scale` key is a pair of floats. Multiplying those in place changes the size
 * Waze animates the pin to, on every surface that draws the map - the phone and the car screen -
 * because both render through the same pack.
 *
 * The edit is done here, at patch time, rather than by a runtime extension: same byte count, so the
 * pack's offsets stay valid and nothing else in it moves.
 */
private const val SCENES_PACK = "assets/res/godot/waze_map_scenes.pck"

/** Keys below this are the shrunk-to-nothing states (0, 1e-5); they stay as they are. */
private const val SHOWN = 0.05f

/** A Vector2 key: where its two floats sit in the pack, and their values there. */
private class PinKey(val at: Int, val x: Float, val y: Float)

private class PackEntry(val offset: Int, val size: Int)

/**
 * The pack's exported files whose path ends with one of [suffixes]: the scenes, wherever Waze
 * numbered them. Offsets are absolute within the file.
 */
private fun packEntries(data: ByteArray, suffixes: List<String>): Map<String, PackEntry> {
    val b = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
    if (data.size < 100 || data[0] != 'G'.code.toByte() || data[1] != 'D'.code.toByte() ||
        data[2] != 'P'.code.toByte() || data[3] != 'C'.code.toByte()
    ) {
        throw PatchException("$SCENES_PACK is not a Godot pack")
    }
    val version = b.getInt(4)
    // Header: magic, pack version, major, minor, patch, flags, file base (u64), 16 reserved ints.
    val base = b.getLong(24)
    var p = 96
    val count = b.getInt(p)
    p += 4
    val out = HashMap<String, PackEntry>()
    repeat(count) {
        val pathLength = b.getInt(p)
        p += 4
        if (pathLength <= 0 || p + pathLength > data.size) throw PatchException("$SCENES_PACK: bad path length")
        val path = String(data, p, pathLength, StandardCharsets.UTF_8).trimEnd('\u0000')
        p += pathLength
        val offset = b.getLong(p)
        val size = b.getLong(p + 8)
        p += 16
        p += 16 // md5
        if (version >= 2) p += 4 // per-file flags
        suffixes.firstOrNull { path.endsWith(it) }?.let {
            out[it] = PackEntry((base + offset).toInt(), size.toInt())
        }
    }
    return out
}

/** The shown scale keys of one packed scene (a Godot binary PackedScene with RSRC resources). */
private fun sceneKeys(scene: ByteArray): List<PinKey> = RsrcReader(scene).shownScaleKeys()

/**
 * Just enough of Godot's binary RSRC format to walk an Animation's properties. Resource offsets in
 * the header are absolute within the scene file.
 */
private class RsrcReader(private val data: ByteArray) {
    private val b = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
    private var p = 0
    private lateinit var strings: List<String>
    private val resources = ArrayList<Long>()

    private fun i32(): Int {
        val v = b.getInt(p); p += 4; return v
    }

    private fun i64(): Long {
        val v = b.getLong(p); p += 8; return v
    }

    private fun f32(): Float {
        val v = b.getFloat(p); p += 4; return v
    }

    private fun str(): String {
        val n = i32() and 0x7FFFFFFF
        var s = String(data, p, n, StandardCharsets.UTF_8)
        p += n
        val z = s.indexOf('\u0000')
        if (z >= 0) s = s.substring(0, z)
        return s
    }

    private fun header() {
        if (data.size < 4 || data[0] != 'R'.code.toByte() || data[1] != 'S'.code.toByte() ||
            data[2] != 'R'.code.toByte() || data[3] != 'C'.code.toByte()
        ) {
            throw PatchException("a packed scene is not an RSRC resource")
        }
        p = 4
        if (i32() != 0 || i32() != 0) throw PatchException("unsupported RSRC header")
        i32(); i32(); i32() // version major, minor, format
        str() // type
        p += 8 // import metadata offset
        val flags = i32()
        if (flags and 2 != 0) p += 8 // uid
        if (flags and 4 != 0) str() // script class
        p += 11 * 4
        val n = i32()
        strings = List(n) { str() }
        val external = i32()
        repeat(external) {
            str(); str()
            if (flags and 2 != 0) p += 8
        }
        val internal = i32()
        resources.clear()
        repeat(internal) {
            str()
            resources.add(i64())
        }
    }

    private fun variant(): Any? {
        return when (val t = i32()) {
            1, 42, 43 -> null // nil, callable, signal
            2, 3, 23 -> i32() // bool, int, rid
            40 -> i64()
            4 -> f32()
            41 -> { p += 8; null }
            5, 44 -> str() // string, string name
            10 -> { // vector2 - the scale keys
                val at = p
                PinKey(at, f32(), f32())
            }
            45 -> { p += 8; null }
            12, 47 -> { p += 12; null }
            11, 13, 14, 20, 50, 46, 51 -> { p += 16; null }
            15, 18 -> { p += 24; null }
            16 -> { p += 36; null }
            17 -> { p += 48; null }
            52 -> { p += 64; null }
            22 -> { // node path
                val nodeCount = b.getShort(p).toInt() and 0x7FFF
                val subCount = b.getShort(p + 2).toInt() and 0x7FFF
                p += 4
                val out = StringBuilder()
                repeat(nodeCount) { i ->
                    if (i > 0) out.append('/')
                    out.append(strings[i32()])
                }
                repeat(subCount) { out.append(':').append(strings[i32()]) }
                out.toString()
            }
            24 -> { // object
                when (i32()) {
                    0 -> null
                    1 -> { str(); str(); null }
                    else -> { i32(); null }
                }
            }
            26 -> { // dictionary
                val n = i32() and 0x7FFFFFFF
                val out = HashMap<String, Any?>()
                repeat(n) {
                    val k = variant()
                    out[k.toString()] = variant()
                }
                out
            }
            30 -> { // array
                val n = i32() and 0x7FFFFFFF
                List(n) { variant() }
            }
            31 -> { val n = i32(); p += n + ((4 - n % 4) % 4); null }
            32, 33 -> { val n = i32(); p += 4 * n; null }
            48, 49 -> { val n = i32(); p += 8 * n; null }
            34 -> { val n = i32(); repeat(n) { str() }; null }
            35 -> { val n = i32(); p += 12 * n; null }
            37 -> { val n = i32(); p += 8 * n; null }
            36, 53 -> { val n = i32(); p += 16 * n; null }
            else -> throw PatchException("packed scene: unsupported value type $t at ${p - 4}")
        }
    }

    fun shownScaleKeys(): List<PinKey> {
        header()
        val out = ArrayList<PinKey>()
        for (offset in resources) {
            p = offset.toInt()
            if (str() != "Animation") continue
            val properties = i32()
            val paths = HashMap<String, String>()
            val keySets = HashMap<String, Any?>()
            repeat(properties) {
                val name = strings[i32()]
                val value = variant()
                if (name.startsWith("tracks/") && name.endsWith("/path")) {
                    paths[name.substring(7, name.length - 5)] = value.toString()
                } else if (name.startsWith("tracks/") && name.endsWith("/keys")) {
                    keySets[name.substring(7, name.length - 5)] = value
                }
            }
            for ((track, path) in paths) {
                // Only a direct child of the scene root: a grandchild already grows with its parent.
                if (!path.endsWith(":scale") || path.contains('/')) continue
                val keys = keySets[track] as? Map<*, *> ?: continue
                val values = keys["values"] as? List<*> ?: continue
                for (v in values) {
                    if (v !is PinKey) continue
                    if (kotlin.math.abs(v.x) >= SHOWN && kotlin.math.abs(v.y) >= SHOWN) out.add(v)
                }
            }
        }
        return out
    }
}

/** Multiplies every shown scale key of the pack [data] by [factor], in place. */
private fun scalePins(data: ByteArray, factor: Float): Int {
    val entries = packEntries(data, listOf("-SmallScene.scn", "-MediumScene.scn", "-LargeScene.scn"))
    if (entries.isEmpty()) throw PatchException("$SCENES_PACK has no alert scenes")
    val b = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
    var scaled = 0
    for ((suffix, entry) in entries) {
        val scene = data.copyOfRange(entry.offset, entry.offset + entry.size)
        val keys = sceneKeys(scene)
        if (keys.isEmpty()) throw PatchException("$SCENES_PACK: $suffix has no scale keys")
        for (key in keys) {
            b.putFloat(entry.offset + key.at, key.x * factor)
            b.putFloat(entry.offset + key.at + 4, key.y * factor)
            scaled++
        }
    }
    return scaled
}

private val biggerPinsResourcePatch: Patch<*> = resourcePatch {
    execute {
        val chosen = (biggerAlertPinsPatch.options["size"]!!.value as String).trim()
        if (chosen.equals("stock", ignoreCase = true)) {
            println("biggerAlertPinsPatch: stock size kept, the pack is untouched")
            return@execute
        }
        val factor = chosen.removeSuffix("x").removeSuffix("X").toFloatOrNull()
            ?: throw PatchException("pin size '$chosen' is not one of Stock, 1.25x, 1.5x, 2x, 3x")
        val pack = get(SCENES_PACK)
        if (!pack.isFile) throw PatchException("$SCENES_PACK not found")
        val before = pack.length()
        val data = pack.readBytes()
        val scaled = scalePins(data, factor)
        pack.writeBytes(data)
        if (pack.length() != before) throw PatchException("$SCENES_PACK changed size")
        println("biggerAlertPinsPatch: $scaled pin scale key(s) x$factor in ${SCENES_PACK.substringAfterLast('/')}")
    }
}

@Suppress("unused")
val biggerAlertPinsPatch: Patch<*> = bytecodePatch(
    name = "Bigger alert pins",
    description = "Grows the alert pins on the map, phone and car screen alike.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Map & Alerts")
    dependsOn(biggerPinsResourcePatch)

    val size by stringOption(
        key = "size",
        default = "1.5",
        values = linkedMapOf(
            "stock" to "Stock",
            "1.25" to "1.25x",
            "1.5" to "1.5x",
            "2" to "2x",
            "3" to "3x",
        ),
        title = "Pin size",
        description = "Stock keeps Waze's own size.",
        required = true,
    )

    execute {
        // The manager hands back the visible label ("2x"), the CLI can hand back either, so accept both.
        val value = size!!.trim().lowercase().removeSuffix("x")
        if (value !in setOf("stock", "1.25", "1.5", "2", "3")) {
            throw PatchException("the pin size must be one of: Stock, 1.25x, 1.5x, 2x, 3x")
        }
    }
}
