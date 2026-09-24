package app.discord.patches.hermes

/**
 * Minimal HBC98 bundle reader for self-locating patches.
 *
 * Parses raw bundle bytes on-device (no build-time artifacts): header,
 * function headers (LSB-first bit-packed), string table, then decodes
 * functions with the generated [OPCODE_TABLE]. Used to find patch
 * targets by string co-occurrence instead of baked-in byte anchors, so
 * the patches attempt to work on Discord versions they never saw.
 *
 * Every assumption is checked and every failure throws with a message
 * naming what changed and which code to update. A patch must NEVER
 * write bytes unless discovery validated the target.
 */
class HermesBundle(private val data: ByteArray) {
    class Func(val off: Int, val size: Int)

    class Instr(
        val off: Int,
        val op: OpDef,
        val vals: IntArray,
        val len: Int,
    )

    val funcs: List<Func>
    private val entries: IntArray
    private val entryCount: Int
    private val storage: Int
    private val starts: IntArray
    private val ends: IntArray
    private val order: IntArray

    init {
        var p = 0
        val magic = readU64(p); p += 8
        if (magic != MAGIC) {
            fail("not a Hermes bundle (bad magic) - refusing to patch")
        }
        val version = readU32(p); p += 4
        if (version != 98) {
            fail("HBC version $version (opcode table is HBC98-only) - " +
                "re-derive via scripts/gen_opcodes.py and update OPCODE_TABLE")
        }
        p += 20 // sourceHash
        p += 4 // fileLength
        p += 4 // globalCodeIndex
        val funcCount = readU32(p); p += 4
        val kindCount = readU32(p); p += 4
        val idCount = readU32(p); p += 4
        val stringCount = readU32(p); p += 4
        val overflowCount = readU32(p); p += 4
        p += 4 // stringStorageSize
        p += 4 // bigIntCount
        p += 4 // bigIntStorageSize
        p += 4 // regExpCount
        p += 4 // regExpStorageSize
        p += 4 // literalValueBufferSize
        p += 4 // objKeyBufferSize
        p += 4 // objShapeTableCount
        p += 4 // segmentID
        p += 4 // cjsModuleCount
        p += 4 // functionSourceCount
        p += 4 // debugInfoOffset
        p += 1 // option
        p += 19 // padding
        p = align(p)

        val list = ArrayList<Func>(funcCount)
        var bit = p * 8
        repeat(funcCount) {
            val off25 = readBits(bit, 25); bit += 25
            bit += 5 // paramCount
            bit += 2 // loopDepth
            val size14 = readBits(bit, 14); bit += 14
            val fname8 = readBits(bit, 8); bit += 8
            bit += 5 // numberRegCount
            bit += 5 // nonPtrRegCount
            val frame8 = readBits(bit, 8); bit += 8
            bit += 8 // highestReadCacheIndex
            bit += 8 // highestWriteCacheIndex
            p = bit / 8 // 88 bits = 11 bytes exactly
            val flags = data[p].toInt() and 0xFF; p += 1
            bit = p * 8
            var off = off25
            var size = size14
            if ((flags shr 5) and 1 == 1) {
                // Overflowed header: full values live elsewhere.
                val at = (fname8 shl 24) or off25
                off = readU32(at)
                size = readU32(at + 12)
            }
            list.add(Func(off, size))
        }
        funcs = list
        p = align(p)
        p += 4 * kindCount + 4 * idCount
        p = align(p)
        entryCount = stringCount
        entries = IntArray(stringCount) { readU32(p + it * 4) }
        p += 4 * stringCount
        p = align(p)
        p += 8 * overflowCount
        p = align(p)
        storage = p

        val idx = funcs.indices.filter { funcs[it].size > 0 }
            .sortedBy { funcs[it].off }
        starts = idx.map { funcs[it].off }.toIntArray()
        ends = idx.map { funcs[it].off + funcs[it].size }.toIntArray()
        order = idx.toIntArray()
    }

    /** String-table id for an ASCII string, or -1 when absent. */
    fun stringId(s: String): Int {
        val want = s.toByteArray(Charsets.US_ASCII)
        for (sid in 0 until entryCount) {
            val v = entries[sid]
            if (v and 1 == 1) continue // UTF16: never our ASCII targets
            if ((v ushr 24) and 0xFF != want.size) continue
            val at = storage + ((v ushr 1) and 0x7FFFFF)
            var same = true
            for (k in want.indices) {
                if (data[at + k] != want[k]) {
                    same = false
                    break
                }
            }
            if (same) return sid
        }
        return -1
    }

    /** Function ids whose decoded code references string [sid]. */
    fun findersOf(sid: Int): List<Int> {
        val pat = if (sid <= 0xFF) {
            byteArrayOf((sid and 0xFF).toByte())
        } else {
            byteArrayOf(
                (sid and 0xFF).toByte(),
                ((sid ushr 8) and 0xFF).toByte(),
            )
        }
        val out = ArrayList<Int>()
        var from = 0
        while (true) {
            val hit = indexOf(pat, from)
            if (hit < 0) break
            val fid = fidAt(hit)
            if (fid >= 0 && !out.contains(fid)) {
                if (refsString(decode(fid), sid)) out.add(fid)
            }
            from = hit + 1
        }
        return out.sorted()
    }

    fun decode(fid: Int): List<Instr> {
        val f = funcs[fid]
        val out = ArrayList<Instr>(f.size / 4)
        var i = f.off
        val end = f.off + f.size
        while (i < end) {
            val opc = data[i].toInt() and 0xFF
            if (opc >= OPCODE_TABLE.size) {
                fail("opcode 0x${opc.toString(16)} at bundle offset $i - " +
                    "HBC version changed? Re-derive OPCODE_TABLE")
            }
            val def = OPCODE_TABLE[opc]
            val vals = IntArray(def.sizes.size)
            var j = i + 1
            for (k in def.sizes.indices) {
                vals[k] = readN(j, def.sizes[k])
                j += def.sizes[k]
            }
            out.add(Instr(i, def, vals, j - i))
            i = j
        }
        return out
    }

    /** (written reg or null, register reads) for one instruction. */
    fun regsOf(instr: Instr): Pair<Int?, List<Int>> {
        val def = instr.op
        var dst: Int? = null
        val reads = ArrayList<Int>()
        for (k in def.sizes.indices) {
            if (def.regMask and (1 shl k) == 0) continue
            if (k == 0 && def.dstWrites) dst = instr.vals[0]
            else if (instr.vals[k] != dst) reads.add(instr.vals[k])
        }
        return Pair(dst, reads)
    }

    fun refsString(instrs: List<Instr>, sid: Int): Boolean {
        for (ins in instrs) {
            for (k in ins.vals.indices) {
                if (ins.op.strMask and (1 shl k) != 0 && ins.vals[k] == sid) {
                    return true
                }
            }
        }
        return false
    }

    private fun fidAt(pos: Int): Int {
        var lo = 0
        var hi = starts.size - 1
        var ans = -1
        while (lo <= hi) {
            val mid = (lo + hi) ushr 1
            if (starts[mid] <= pos) {
                ans = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        if (ans >= 0 && pos < ends[ans]) return order[ans]
        return -1
    }

    private fun indexOf(pat: ByteArray, from: Int): Int {
        outer@ for (i in from..data.size - pat.size) {
            for (k in pat.indices) {
                if (data[i + k] != pat[k]) continue@outer
            }
            return i
        }
        return -1
    }

    private fun readN(p: Int, n: Int): Int {
        var v = 0
        for (k in 0 until n) v = v or ((data[p + k].toInt() and 0xFF) shl (8 * k))
        return v
    }

    private fun readU32(p: Int): Int = readN(p, 4)

    private fun readU64(p: Int): Long {
        var v = 0L
        for (k in 0 until 8) {
            v = v or ((data[p + k].toLong() and 0xFF) shl (8 * k))
        }
        return v
    }

    private fun readBits(bit: Int, n: Int): Int {
        var v = 0
        for (k in 0 until n) {
            val at = bit + k
            val byte = data[at ushr 3].toInt() and 0xFF
            v = v or ((((byte ushr (at and 7)) and 1)) shl k)
        }
        return v
    }

    private fun align(p: Int): Int = if (p % 4 == 0) p else p + (4 - p % 4)

    companion object {
        private const val MAGIC = 2240826417119764422L
    }
}

internal fun fail(why: String): Nothing =
    throw IllegalStateException(why)
