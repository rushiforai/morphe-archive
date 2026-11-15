package app.kmaps.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.util.ReferenceUtil

/*
 * Anchor engine: the smali-text patch (legacy/apply_rate_patch.py) as instruction edits.
 *
 * render() turns an instruction into the canonical text gen_naver_sites.py uses for anchors (baksmali text
 * without labels/comments, branch targets as "L", long literals without the "L" suffix). A site's anchor is
 * searched in every method of the class (cls = "src:Foo.kt": every class whose SourceFile is Foo.kt, for apps whose
 * class names are obfuscated per version; optionally only methods with a given descriptor), so R8 renaming a
 * method does not break it; the number of matches must equal Site.count.
 *   anchor line matching: first line = suffix, last line = prefix, others = whole line, one line = substring;
 *   '*' in a line is a wildcard.
 * Ops (k = instruction index inside the anchor):
 *   R  replace instruction k in place (its location and labels stay), further lines are added after it
 *   I  insert before instruction k (k == anchor size: after the last one)
 *   CF insert at k's control-flow label, so branches to k run the new code as well
 * Labels used by new code: K j = anchor instruction j (j == size: the instruction after the anchor),
 *   T j = target of the anchor's branch instruction j, NEXT p = first instruction after the anchor rendering as p.
 * Snippet placeholder {Ak} = register A of anchor instruction k.
 */

internal data class Op(val type: String, val k: Int, val smali: String)

internal data class Site(
    val cls: String,
    val note: String,
    val desc: String?,
    val count: Int,
    val anchor: List<String>,
    val ops: List<Op>,
    val labels: Map<String, Pair<String, String>>,
    val optional: Boolean = false,    // feature exists only in some app versions: absent class / no match = skip
    val requiredIn: Set<String> = emptySet(),   // ...but these app versions must match
)

private fun paramRegs(m: Method): Int =
    (if (AccessFlags.STATIC.isSet(m.accessFlags)) 0 else 1) +
        m.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

private fun regName(m: Method, r: Int): String {
    val total = m.implementation!!.registerCount
    val base = total - paramRegs(m)
    return if (r >= base) "p${r - base}" else "v$r"
}

private fun hex(v: Long): String = if (v < 0) "-0x" + java.lang.Long.toHexString(-v) else "0x" + java.lang.Long.toHexString(v)

internal fun render(m: Method, ins: Instruction): String {
    val parts = mutableListOf<String>()
    when (ins) {
        is FiveRegisterInstruction -> {
            val rs = listOf(ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG).take(ins.registerCount)
            parts += "{" + rs.joinToString(", ") { regName(m, it) } + "}"
        }
        is RegisterRangeInstruction -> {
            val a = ins.startRegister
            parts += if (ins.registerCount == 0) "{}" else "{${regName(m, a)} .. ${regName(m, a + ins.registerCount - 1)}}"
        }
        else -> {
            if (ins is OneRegisterInstruction) parts += regName(m, ins.registerA)
            if (ins is TwoRegisterInstruction) parts += regName(m, ins.registerB)
            if (ins is ThreeRegisterInstruction) parts += regName(m, ins.registerC)
        }
    }
    when {
        ins is ReferenceInstruction -> parts += ReferenceUtil.getReferenceString(ins.reference) ?: "?"
        ins is WideLiteralInstruction && ins.opcode.name.startsWith("const-wide") -> parts += hex(ins.wideLiteral)
        ins is NarrowLiteralInstruction -> parts += hex(ins.narrowLiteral.toLong())
        ins is WideLiteralInstruction -> parts += hex(ins.wideLiteral)
        ins is OffsetInstruction -> parts += "L"
    }
    return if (parts.isEmpty()) ins.opcode.name else ins.opcode.name + " " + parts.joinToString(", ")
}

private fun lineRegex(p: String): Regex = Regex(p.split('*').joinToString(".*") { Regex.escape(it) })

private fun lineMatches(text: String, pat: String, pos: Int, n: Int): Boolean {
    if (n == 1) return if ('*' in pat) lineRegex(pat).containsMatchIn(text) else pat in text
    val glob = '*' in pat
    return when (pos) {
        0 -> if (glob) Regex(".*" + lineRegex(pat).pattern).matches(text) else text.endsWith(pat)
        n - 1 -> if (glob) Regex(lineRegex(pat).pattern + ".*").matches(text) else text.startsWith(pat)
        else -> if (glob) lineRegex(pat).matches(text) else text == pat
    }
}

private fun registerA(ins: Instruction): Int = when (ins) {
    is OneRegisterInstruction -> ins.registerA
    is FiveRegisterInstruction -> ins.registerC
    is RegisterRangeInstruction -> ins.startRegister
    else -> throw PatchException("no register A in ${ins.opcode.name}")
}

private fun descOf(m: Method): String = "(" + m.parameterTypes.joinToString("") { it.toString() } + ")" + m.returnType

private val srcIndex = java.util.WeakHashMap<BytecodePatchContext, Map<String, List<String>>>()

/** class types a site addresses: one class by descriptor, or "src:Name.kt" = every class with that SourceFile */
private fun BytecodePatchContext.siteTypes(spec: String): List<String> {
    if (!spec.startsWith("src:")) return if (classDefByOrNull(spec) != null) listOf(spec) else emptyList()
    val idx = srcIndex.getOrPut(this) {
        val m = HashMap<String, MutableList<String>>()
        classDefForEach { c -> c.sourceFile?.let { m.getOrPut(it) { mutableListOf() } += c.type } }
        m
    }
    return idx[spec.removePrefix("src:")].orEmpty().sorted()
}

/** apply every site; returns a log line per site */
internal fun BytecodePatchContext.applySites(sites: List<Site>, log: (String) -> Unit) {
    for (site in sites) {
        val types = siteTypes(site.cls)
        if (types.isEmpty()) {
            if (site.optional && packageMetadata.versionName !in site.requiredIn) { log("skip (class absent): ${site.cls} ${site.note}"); continue }
            throw PatchException("class not found: ${site.cls} (${site.note})")
        }
        val n = site.anchor.size
        // search the read-only classes; only classes with a hit become mutable (= rewritten)
        val hits = mutableListOf<Triple<String, Method, Int>>()
        for (type in types) for (m in classDefBy(type).methods) {
            val impl = m.implementation ?: continue
            if (site.desc != null && descOf(m) != site.desc) continue
            val txt = impl.instructions.map { render(m, it) }
            for (i in 0..txt.size - n) {
                if ((0 until n).all { k -> lineMatches(txt[i + k], site.anchor[k], k, n) }) hits += Triple(type, m, i)
            }
        }
        if (hits.isEmpty() && site.optional && packageMetadata.versionName !in site.requiredIn) {
            log("skip (not in this version): ${site.cls} ${site.note}"); continue
        }
        if (hits.size != site.count) {
            throw PatchException("anchor ${site.cls} ${site.note}: expected ${site.count} match(es), found ${hits.size}: ${site.anchor.first()}")
        }
        // later windows first, so earlier start indices stay valid
        for ((type, m, i0) in hits.sortedByDescending { it.third }) {
            val mm = mutableClassDefBy(type).methods.first { it.name == m.name && descOf(it) == descOf(m) }
            applyOps(mm, i0, site)
        }
        val where = hits.map { (t, m, _) -> if (site.cls.startsWith("src:")) "${t.removePrefix("L").removeSuffix(";")}.${m.name}" else m.name }
        log("ok ${site.cls.substringAfterLast('/')} ${site.note} x${hits.size} in ${where.distinct()}")
    }
}

private fun applyOps(m: MutableMethod, i0: Int, site: Site) {
    val n = site.anchor.size
    val all = m.instructions
    val w = (0 until n).map { all[i0 + it] }.toMutableList()
    val after = all.getOrNull(i0 + n)
    val regs = (0 until n).associateWith { k -> runCatching { regName(m, registerA(w[k])) }.getOrNull() }

    fun target(spec: Pair<String, String>): Instruction = when (spec.first) {
        "K" -> spec.second.toInt().let { j -> if (j < n) w[j] else after ?: throw PatchException("no instruction after anchor") }
        "T" -> ((w[spec.second.toInt()] as BuilderOffsetInstruction).target.location.instruction
            ?: throw PatchException("branch target without instruction"))
        "NEXT" -> all.drop(i0 + n).firstOrNull { render(m, it).startsWith(spec.second) }
            ?: throw PatchException("NEXT ${spec.second} not found after anchor")
        else -> throw PatchException("bad label spec $spec")
    }

    val labelTargets = site.labels.mapValues { target(it.value) }
    fun idx(x: Instruction) = m.instructions.indexOfFirst { it === x }.also { if (it < 0) throw PatchException("lost anchor instruction") }
    fun fill(s: String): String {
        var t = s
        for ((k, r) in regs) if (r != null) t = t.replace("{A$k}", r)
        // a snippet ending in a label needs an instruction to carry it
        if (t.trimEnd().lines().last().trim().startsWith(":")) t += "\nnop"
        return t
    }
    fun ext(s: String) = labelTargets.filterKeys { Regex(":$it\\b").containsMatchIn(s) }.map { ExternalLabel(it.key, it.value) }

    for (op in site.ops) {
        val code = fill(op.smali)
        when (op.type) {
            "R" -> {
                val lines = code.lines().filter { it.isNotBlank() }
                if (':' in lines.first().substringAfter(' ', "")) throw PatchException("label in replaced line: ${lines.first()}")
                val at = idx(w[op.k])
                m.replaceInstruction(at, lines.first())
                w[op.k] = m.instructions[at]
                if (lines.size > 1) {
                    val rest = lines.drop(1).joinToString("\n")
                    val e = ext(rest)
                    if (e.isEmpty()) m.addInstructions(at + 1, rest) else m.addInstructionsWithLabels(at + 1, rest, *e.toTypedArray())
                }
            }
            "I", "CF" -> {
                val at = if (op.k < n) idx(w[op.k]) else idx(w[n - 1]) + 1
                val e = ext(code)
                when {
                    op.type == "CF" -> m.addInstructionsAtControlFlowLabel(at, code, *e.toTypedArray())
                    e.isEmpty() -> m.addInstructions(at, code)
                    else -> m.addInstructionsWithLabels(at, code, *e.toTypedArray())
                }
            }
            else -> throw PatchException("bad op ${op.type}")
        }
    }
}
