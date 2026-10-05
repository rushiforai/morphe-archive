package app.morphe.util.injection

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.liveAcrossInjection
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.returnEarlyWhen
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.insertAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.writer.builder.DexBuilder
import com.android.tools.smali.dexlib2.writer.io.FileDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.smali.smaliFlexLexer
import com.android.tools.smali.smali.smaliParser
import com.android.tools.smali.smali.smaliTreeWalker
import org.antlr.runtime.CommonTokenStream
import org.antlr.runtime.tree.CommonTreeNodeStream
import java.io.File
import java.io.StringReader

internal val OPCODES: Opcodes = Opcodes.forApi(26)

/** Assembles smali class text the way the patcher's inline compiler does, keeping try blocks. */
internal fun assemble(text: String): ClassDef {
    val lexer = smaliFlexLexer(StringReader(text), OPCODES.api)
    val tokens = CommonTokenStream(lexer)
    val parser = smaliParser(tokens).apply { setApiLevel(OPCODES.api) }
    val file = parser.smali_file()
    check(parser.numberOfSyntaxErrors == 0 && lexer.numberOfSyntaxErrors == 0) { "smali doesn't parse:\n$text" }
    val nodes = CommonTreeNodeStream(file.tree).apply { tokenStream = tokens }
    val walker = smaliTreeWalker(nodes).apply {
        setApiLevel(OPCODES.api)
        setDexBuilder(DexBuilder(OPCODES))
    }
    val classDef = walker.smali_file()
    check(walker.numberOfSyntaxErrors == 0) { "smali doesn't assemble:\n$text" }
    return classDef
}

internal fun hostClass(type: String, method: String) = ".class public $type\n.super Ljava/lang/Object;\n\n$method\n"

/** A copy of [method] defined on [type], frozen, for writing into a dex. */
internal fun frozen(type: String, method: Method): ClassDef = ImmutableClassDef(
    type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
    listOf(
        ImmutableMethod(
            type, method.name, method.parameters, method.returnType, method.accessFlags, null, null,
            ImmutableMethodImplementation.of(method.implementation),
        ),
    ),
)

/** Writes [classes] to a dex at [file] and reads it back, which fails on anything dex can't encode. */
internal fun writeDex(classes: List<ClassDef>, file: File): Int {
    val pool = DexPool(OPCODES)
    classes.forEach(pool::internClass)
    val store = FileDataStore(file)
    try {
        pool.writeTo(store)
    } finally {
        store.close()
    }
    return DexFileFactory.loadDexFile(file, OPCODES).classes.size
}

/** Picks the register a hook borrows, the way a patch would. Throws [PatchException] when none is free. */
internal enum class Chooser {
    /** freeLocalsAt, what every patch here calls. */
    REAL {
        override fun choose(method: Method, at: Int, targets: List<Int>, highest: Int) =
            method.freeLocalsAt("seeded injection", at, 1, targets, highest).single()
    },

    /** Forgets that the hook's jump lands somewhere else. */
    IGNORES_TARGETS {
        override fun choose(method: Method, at: Int, targets: List<Int>, highest: Int) =
            method.freeLocalsAt("seeded injection", at, 1, emptyList(), highest).single()
    },

    /** Counts a wide operand's low register only. */
    WIDE_BLIND {
        override fun choose(method: Method, at: Int, targets: List<Int>, highest: Int): Int {
            val high = mutableSetOf<Int>()
            method.implementation!!.instructions.forEach { instruction ->
                val registers = instruction.namedRegisters()
                when (instruction.opcode) {
                    Opcode.ADD_LONG -> { high += registers[1] + 1; high += registers[2] + 1 }
                    Opcode.LONG_TO_INT, Opcode.MOVE_WIDE -> high += registers[1] + 1
                    else -> Unit
                }
            }
            val live = method.liveAcrossInjection(at, targets) - high
            return (0 until minOf(method.localRegisterCount(), highest + 1)).firstOrNull { it !in live }
                ?: throw PatchException("no register")
        }
    },

    /** Only stays off what the instruction it goes in front of names. */
    RECKLESS {
        override fun choose(method: Method, at: Int, targets: List<Int>, highest: Int): Int {
            val named = method.implementation!!.instructions.elementAt(at).namedRegisters()
            return (0 until minOf(method.localRegisterCount(), highest + 1)).firstOrNull { it !in named }
                ?: throw PatchException("no register")
        }
    };

    abstract fun choose(method: Method, at: Int, targets: List<Int>, highest: Int): Int
}

/**
 * Where the hook goes and what it does.
 *
 * SKIP is the hide-a-request shape: ask the guard, and on true jump to [Case.target], borrowing
 * a register for the answer. OBSERVE borrows one to pass the answer to the extension and carries
 * on. RETURN is returnEarlyWhen at the top of the method.
 */
internal enum class Mode { SKIP, OBSERVE, RETURN }

/** One case: a method, a hook and the inputs to run it with. */
internal class Case(
    val name: String,
    val method: String,
    val mode: Mode,
    val anchor: Int,
    val target: Int?,
    val trap: Int,
    val inputs: List<Pair<Int, Int>>,
    /** Whether the jump keeps the method verifiable, so the guard can answer true. */
    val jumpVerifies: Boolean,
    /** The program it came from, when it was generated rather than read from a retained file. */
    val program: Program? = null,
)

internal const val HOST = "Lseeded/Host;"

/** The guard answers each case runs under: never, always, and every other time. */
internal val PATTERNS: List<Pair<String, (Int) -> Boolean>> = listOf(
    "off" to { _ -> false },
    "on" to { _ -> true },
    "alternate" to { call -> call % 2 == 1 },
)

/** What a hook looks like once injected, for the structural check. */
internal class Injected(val method: MutableMethod, val borrowed: Int, val hookSize: Int, val labelMoves: Boolean)

/** Injects [case]'s hook. [checked] false skips the jump check, to build a hook ART should refuse. */
internal fun inject(case: Case, original: Method, chooser: Chooser, checked: Boolean = true): Injected {
    val method = MutableMethod(original)
    return when (case.mode) {
        Mode.SKIP -> {
            val target = case.target!!
            val borrowed = chooser.choose(method, case.anchor, listOf(target), 255)
            val hook = "invoke-static {}, $PROBE->guard()Z\nmove-result v$borrowed\nif-nez v$borrowed, :hush_skip"
            val label = ExternalLabel("hush_skip", method.getInstruction(target))
            if (checked) method.addInstructionsAtControlFlowLabel(case.anchor, hook, label)
            else method.insertAtControlFlowLabel(case.anchor, hook, label)
            Injected(method, borrowed, 3, true)
        }
        Mode.OBSERVE -> {
            val borrowed = chooser.choose(method, case.anchor, emptyList(), 15)
            method.addInstructionsAtControlFlowLabel(
                case.anchor,
                "invoke-static {}, $PROBE->guard()Z\nmove-result v$borrowed\ninvoke-static {v$borrowed}, $PROBE->seen(Z)V",
            )
            Injected(method, borrowed, 3, true)
        }
        Mode.RETURN -> {
            method.returnEarlyWhen("seeded injection", "$PROBE->guard()Z", "const/4 v0, 0x7\nreturn v0")
            Injected(method, 0, 5, false)
        }
    }
}

/**
 * A case that ran, and the first thing found wrong with it. [reached] says some input asked the
 * guard, and [comparedOn] that a guard answer other than off was compared on such an input. A hook
 * no input reaches proves nothing about what it does.
 */
internal class Ran(
    val failure: String?, val refused: Boolean, val comparedOn: Boolean = false, val reached: Boolean = false,
    val refusal: String? = null,
) {
    /** Refused by the jump check, not for want of a register or a place to put the hook. */
    val jumpRefused get() = refusal?.let(JUMP_REFUSAL::containsMatchIn) == true

    private companion object {
        val JUMP_REFUSAL = Regex("the code at instruction \\d+ would")
    }
}

/** The instructions the generator wrote, without the payloads and alignment that follow them. */
private fun code(method: Method): List<Instruction> = method.implementation!!.instructions
    .takeWhile { it.opcode != Opcode.NOP && it !is SwitchPayload }

private fun addresses(method: Method): Map<Int, Int> {
    var address = 0
    return method.implementation!!.instructions.withIndex().associate { (index, instruction) ->
        (address to index).also { address += instruction.codeUnits }
    }
}

private fun branchTargets(method: Method, index: Int): List<Int> {
    val instructions = method.implementation!!.instructions.toList()
    val atAddress = addresses(method)
    val address = atAddress.entries.first { it.value == index }.key
    val instruction = instructions[index]
    if (instruction !is OffsetInstruction) return emptyList()
    val target = atAddress.getValue(address + instruction.codeOffset)
    if (instruction.opcode != Opcode.PACKED_SWITCH) return listOf(target)
    return (instructions[target] as SwitchPayload).switchElements.map { atAddress.getValue(address + it.offset) }
}

private fun handlersAt(method: Method, index: Int): List<Pair<String?, Int>> {
    val atAddress = addresses(method)
    val address = atAddress.entries.first { it.value == index }.key
    return method.implementation!!.tryBlocks
        .filter { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }
        .flatMap { block -> block.exceptionHandlers.map { it.exceptionType to atAddress.getValue(it.handlerCodeAddress) } }
}

private fun operands(instruction: Instruction): String = buildString {
    append(instruction.opcode)
    append(instruction.namedRegisters())
    (instruction as? NarrowLiteralInstruction)?.let { append(" #").append(it.narrowLiteral) }
    (instruction as? WideLiteralInstruction)?.let { append(" #").append(it.wideLiteral) }
    (instruction as? ReferenceInstruction)?.let { append(" ").append(it.reference) }
}

/**
 * Checks the injected method against the original: every original instruction kept in order
 * and unchanged, every branch, switch arm and handler landing where it did (on the hook when
 * it pointed at the instruction the hook went in front of and the labels moved), the hook in
 * exactly the try blocks its placement puts it in, and the borrowed register a local.
 */
internal fun structure(original: Method, injected: Injected, case: Case): String? {
    val after = injected.method
    val old = code(original)
    val new = code(after)
    val at = case.anchor
    val hook = injected.hookSize
    if (new.size != old.size + hook) return "structure: ${new.size} instructions where ${old.size} plus a $hook-instruction hook belong"
    fun moved(index: Int) = if (index < at) index else index + hook
    fun landing(index: Int) = if (index == at && injected.labelMoves) at else moved(index)
    for (index in old.indices) {
        if (operands(old[index]) != operands(new[moved(index)])) {
            return "structure: instruction $index became ${operands(new[moved(index)])}, was ${operands(old[index])}"
        }
        val targets = branchTargets(original, index).map(::landing)
        if (branchTargets(after, moved(index)) != targets) return "structure: instruction $index branches to ${branchTargets(after, moved(index))}, expected $targets"
        val handlers = handlersAt(original, index).map { it.first to landing(it.second) }
        if (handlersAt(after, moved(index)) != handlers) return "structure: instruction $index is covered by ${handlersAt(after, moved(index))}, expected $handlers"
    }
    // Moving the labels moves a try block's start onto the hook and its end too, so the hook is
    // covered as the instruction it went in front of was. A plain insertion leaves them on that
    // instruction, so the hook is covered as the one before it was.
    val expected = when {
        injected.labelMoves -> handlersAt(original, at)
        at > 0 -> handlersAt(original, at - 1)
        else -> emptyList()
    }.map { it.first to landing(it.second) }
    for (offset in 0 until hook) {
        val covered = handlersAt(after, at + offset)
        if (covered != expected) return "structure: hook instruction $offset is covered by $covered, expected $expected"
    }
    if (case.mode == Mode.SKIP && branchTargets(after, at + 2) != listOf(moved(case.target!!))) {
        return "structure: the hook jumps to ${branchTargets(after, at + 2)}, expected ${moved(case.target)}"
    }
    if (injected.borrowed >= after.localRegisterCount()) return "structure: the hook borrowed parameter v${injected.borrowed}"
    return null
}

/** Runs [case] with [chooser]: inject, check the structure and the dex, and compare every run with its oracle. */
internal fun runCase(case: Case, chooser: Chooser, scratch: File): Ran {
    val original = assemble(hostClass(HOST, case.method)).methods.single()
    val reference = DexMachine(original, case.trap)
    for ((first, second) in case.inputs) {
        val dex = try {
            reference.run(first, second)
        } catch (broken: Broken) {
            return Ran("generator: the original method breaks on ($first, $second): ${broken.message}", false)
        }
        val source = case.program?.let { Evaluate.run(it, first, second) }
        if (source != null && source != dex) return Ran("generator: ($first, $second) runs to $dex, the source says $source", false)
    }

    val injected = try {
        inject(case, original, chooser)
    } catch (refusal: PatchException) {
        return Ran(null, true, refusal = refusal.message)
    }
    structure(original, injected, case)?.let { return Ran(it, false) }
    try {
        writeDex(listOf(frozen(HOST, original), frozen("Lseeded/Injected;", injected.method)), scratch)
    } catch (failure: Exception) {
        return Ran("encode: ${failure.message}", false)
    } finally {
        scratch.delete()
    }

    val poisonAfter = if (case.mode == Mode.RETURN) 2 else case.anchor + 2
    var comparedOn = false
    var reached = false
    for ((first, second) in case.inputs) {
        for ((name, answer) in PATTERNS) {
            if (name != "off" && case.mode == Mode.SKIP && !case.jumpVerifies) continue
            val oracle = DexMachine(original, case.trap, arrive = { index, count ->
                when {
                    index != case.anchor -> Arrival.Go
                    case.mode == Mode.SKIP -> if (answer(count)) Arrival.Jump(case.target!!) else Arrival.Go
                    case.mode == Mode.OBSERVE -> Arrival.Observe(answer(count))
                    else -> Arrival.Go
                }
            })
            val expected = if (case.mode == Mode.RETURN && answer(0)) {
                Outcome("return:7", emptyList())
            } else {
                try {
                    oracle.run(first, second)
                } catch (broken: Broken) {
                    return Ran("oracle: guard $name on ($first, $second) breaks the original: ${broken.message}", false)
                }
            }
            val machine = DexMachine(injected.method, case.trap, answer, injected.borrowed, poisonAfter)
            val actual = try {
                machine.run(first, second)
            } catch (broken: Broken) {
                return Ran("guard $name: ($first, $second) ${broken.message}", false)
            }
            if (actual != expected) return Ran("guard $name: ($first, $second) ran to $actual, expected $expected", false)
            val asked = if (case.mode == Mode.RETURN) 1 else oracle.arrivals[case.anchor]
            if (machine.guardCalls != asked) {
                return Ran("guard $name: ($first, $second) asked the guard ${machine.guardCalls} times, expected $asked", false)
            }
            if (asked > 0) {
                reached = true
                if (name != "off") comparedOn = true
            }
        }
    }
    return Ran(null, false, comparedOn, reached)
}

/** A generated case: the program, and where in it the hook goes by statement. */
internal class Generated(val seed: Long, val program: Program, val mode: Mode, val anchor: Int, val target: Int?, val inputs: List<Pair<Int, Int>>) {
    fun case(): Case {
        val rendered = program.render()
        val anchorIndex = if (mode == Mode.RETURN) 0 else rendered.anchors.getValue(anchor)
        val targetIndex = target?.let(rendered.anchors::getValue)
        val jumpVerifies = mode != Mode.SKIP || VerifyExact.program(program, Jump(anchor, target!!))
        return Case("seed-$seed", rendered.method, mode, anchorIndex, targetIndex, program.trap, inputs, jumpVerifies, program)
    }

    fun with(program: Program = this.program, inputs: List<Pair<Int, Int>> = this.inputs) =
        Generated(seed, program, mode, anchor, target, inputs)

    companion object {
        fun of(seed: Long): Generated {
            val program = Generator(seed).program()
            val random = kotlin.random.Random(seed xor 0x5EED)
            val blocks = program.blocks().filter { it.isNotEmpty() }
            val mode = Mode.entries[random.nextInt(10).let { if (it < 6) 0 else if (it < 9) 1 else 2 }]
            var anchor = program.body.first().id
            var target: Int? = null
            when (mode) {
                Mode.SKIP -> {
                    val pairs = blocks.filter { it.size >= 2 }
                    val block = pairs[random.nextInt(pairs.size)]
                    val from = random.nextInt(block.size - 1)
                    anchor = block[from].id
                    target = block[random.nextInt(from + 1, block.size)].id
                }
                Mode.OBSERVE -> blocks[random.nextInt(blocks.size)].let { anchor = it[random.nextInt(it.size)].id }
                Mode.RETURN -> Unit
            }
            val small = { random.nextInt(-4, 5) }
            val inputs = listOf(0 to 0, 1 to -1, small() to small(), random.nextInt() to random.nextInt(-3, 4), program.trap to small())
            return Generated(seed, program, mode, anchor, target, inputs)
        }
    }
}

/** The categories of failure a shrunk case has to keep, so it can't slide into a different bug. */
internal fun category(failure: String) = failure.substringBefore(':').substringBefore(" (")

/**
 * Shrinks a failing generated case: fewer inputs, statements dropped, compound statements
 * replaced by one of their blocks, until nothing smaller fails the same way.
 */
internal fun minimize(start: Generated, fails: (Generated) -> String?): Generated {
    val wanted = category(fails(start) ?: return start)
    fun stillFails(candidate: Generated): Boolean {
        if (!Verify.program(candidate.program)) return false
        return fails(candidate)?.let { category(it) == wanted } == true
    }
    var current = start
    current.inputs.forEach { input -> current.with(inputs = listOf(input)).takeIf(::stillFails)?.let { current = it; return@forEach } }
    var changed = true
    while (changed) {
        changed = false
        val keep = setOfNotNull(current.anchor, current.target)
        for (body in shrink(current.program.body, keep)) {
            val candidate = current.with(program = Program(current.program.locals, current.program.trap, body))
            if (stillFails(candidate)) {
                current = candidate
                changed = true
                break
            }
        }
    }
    return current
}

/** Every tree one step smaller than [block] that still holds the statements in [keep]. */
private fun shrink(block: List<Stmt>, keep: Set<Int>): Sequence<List<Stmt>> = sequence {
    for (index in block.indices) {
        val statement = block[index]
        val holds = statement.ids().any { it in keep }
        if (!holds && statement !is Return) yield(block.take(index) + block.drop(index + 1))
        if (!holds) statement.children().forEach { yield(block.take(index) + it + block.drop(index + 1)) }
        if (statement is Loop && statement.times > 1) yield(block.take(index) + statement.copy(times = 1) + block.drop(index + 1))
        for ((child, smaller) in statement.children().withIndex().flatMap { (child, body) -> shrink(body, keep).map { child to it } }) {
            val replaced = when (statement) {
                is Branch -> if (child == 0) statement.copy(then = smaller) else statement.copy(otherwise = smaller)
                is Loop -> statement.copy(body = smaller)
                is Switch -> if (child < statement.cases.size) {
                    statement.copy(cases = statement.cases.toMutableList().also { it[child] = smaller })
                } else {
                    statement.copy(fallback = smaller)
                }
                is Guarded -> if (child == 0) statement.copy(body = smaller) else statement.copy(handler = smaller)
                else -> continue
            }
            yield(block.take(index) + replaced + block.drop(index + 1))
        }
    }
}

/** A retained case as text: a header of key=value lines, `---`, then the method's smali. */
internal fun Case.retained(comment: String, control: Chooser?): String = buildString {
    comment.lines().forEach { appendLine("# $it") }
    appendLine("mode=${mode.name.lowercase()}")
    appendLine("anchor=$anchor")
    target?.let { appendLine("target=$it") }
    appendLine("trap=$trap")
    appendLine("inputs=" + inputs.joinToString(" ") { "${it.first},${it.second}" })
    appendLine("jump=${if (jumpVerifies) "verifies" else "unchecked"}")
    control?.let { appendLine("control=${it.name.lowercase().replace('_', '-')}") }
    appendLine("---")
    appendLine(method)
}

/** Reads a retained case, and the broken chooser it has to keep catching, if it names one. */
internal fun readRetained(name: String, text: String): Pair<Case, Chooser?> {
    val header = text.substringBefore("\n---").lines().filter { it.isNotBlank() && !it.startsWith("#") }
        .associate { it.substringBefore('=').trim() to it.substringAfter('=').trim() }
    val case = Case(
        name, text.substringAfter("---\n").trim(),
        Mode.valueOf(header.getValue("mode").uppercase()),
        header.getValue("anchor").toInt(),
        header["target"]?.toInt(),
        header.getValue("trap").toInt(),
        header.getValue("inputs").split(' ').map { it.substringBefore(',').toInt() to it.substringAfter(',').toInt() },
        header["jump"] == "verifies",
    )
    return case to header["control"]?.let { Chooser.valueOf(it.uppercase().replace('-', '_')) }
}
