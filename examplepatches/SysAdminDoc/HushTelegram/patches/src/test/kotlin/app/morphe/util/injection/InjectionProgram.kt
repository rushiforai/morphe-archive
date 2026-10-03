package app.morphe.util.injection

import kotlin.random.Random

/*
 * Small generated methods for the seeded injection tests: a statement tree, the generator that
 * builds one from a seed, a type model in the shape of the verifier's, the smali the tree renders
 * to, and an evaluator that runs the tree directly. The evaluator never looks at bytecode, so it
 * is an oracle independent of the dex interpreter in DexMachine.kt.
 *
 * Every method is `static run(II)I` in a class of its own, with its two parameters above
 * [Program.locals] locals. Calls go to the probe class, whose behaviour the evaluator, the dex
 * interpreter and the smali probe in InjectionCorpus.kt all implement the same way.
 */

internal const val PROBE = "Lseeded/Probe;"
internal const val ARITHMETIC = "java.lang.ArithmeticException"
internal const val ILLEGAL_STATE = "java.lang.IllegalStateException"

/** The catch types a generated handler can name, by the exceptions each one takes. */
internal val CATCHES: Map<String, Set<String>> = mapOf(
    "Ljava/lang/ArithmeticException;" to setOf(ARITHMETIC),
    "Ljava/lang/IllegalStateException;" to setOf(ILLEGAL_STATE),
    "Ljava/lang/RuntimeException;" to setOf(ARITHMETIC, ILLEGAL_STATE),
    "Ljava/lang/Throwable;" to setOf(ARITHMETIC, ILLEGAL_STATE),
)

/** Whether a handler for [catchType], or a catch-all when null, takes an exception of [type]. */
internal fun catches(catchType: String?, type: String) = catchType == null || type in CATCHES.getValue(catchType)

/**
 * What a register holds as far as the verifier can tell. [ZERO] is the literal zero, which the
 * verifier keeps untyped until a read decides, so it can still be an int or null. Only the exact
 * model makes one.
 */
internal enum class Kind { UNSET, INT, WIDE_LOW, WIDE_HIGH, REF, ZERO }

/** Register kinds at one point, merged where paths join the way the verifier merges them. */
internal class Kinds private constructor(private val kinds: Array<Kind>) {
    constructor(size: Int) : this(Array(size) { Kind.UNSET })

    val size: Int get() = kinds.size

    fun copy() = Kinds(kinds.copyOf())
    fun isInt(register: Int) = kinds[register] == Kind.INT || kinds[register] == Kind.ZERO
    fun isRef(register: Int) = kinds[register] == Kind.REF || kinds[register] == Kind.ZERO
    fun isZero(register: Int) = kinds[register] == Kind.ZERO
    fun isWide(register: Int) =
        register + 1 < size && kinds[register] == Kind.WIDE_LOW && kinds[register + 1] == Kind.WIDE_HIGH

    fun setInt(register: Int) { clear(register); kinds[register] = Kind.INT }
    fun setRef(register: Int) { clear(register); kinds[register] = Kind.REF }
    fun setZero(register: Int) { clear(register); kinds[register] = Kind.ZERO }
    fun setWide(register: Int) {
        clear(register)
        clear(register + 1)
        kinds[register] = Kind.WIDE_LOW
        kinds[register + 1] = Kind.WIDE_HIGH
    }

    // Writing either half of a pair leaves the other half holding nothing usable.
    private fun clear(register: Int) {
        when (kinds[register]) {
            Kind.WIDE_LOW -> kinds[register + 1] = Kind.UNSET
            Kind.WIDE_HIGH -> kinds[register - 1] = Kind.UNSET
            else -> Unit
        }
        kinds[register] = Kind.UNSET
    }

    fun merge(other: Kinds): Kinds {
        val merged = Array(size) {
            val (a, b) = kinds[it] to other.kinds[it]
            when {
                a == b -> a
                a == Kind.ZERO && (b == Kind.INT || b == Kind.REF) -> b
                b == Kind.ZERO && (a == Kind.INT || a == Kind.REF) -> a
                else -> Kind.UNSET
            }
        }
        for (register in merged.indices) {
            if (merged[register] == Kind.WIDE_LOW && (register + 1 >= size || merged[register + 1] != Kind.WIDE_HIGH)) {
                merged[register] = Kind.UNSET
            }
            if (merged[register] == Kind.WIDE_HIGH && (register == 0 || merged[register - 1] != Kind.WIDE_LOW)) {
                merged[register] = Kind.UNSET
            }
        }
        return Kinds(merged)
    }

    override fun equals(other: Any?) = other is Kinds && kinds.contentEquals(other.kinds)
    override fun hashCode() = kinds.contentHashCode()
}

internal sealed class Stmt {
    abstract val id: Int
}

internal data class Const(override val id: Int, val dst: Int, val value: Int) : Stmt()
internal data class ConstWide(override val id: Int, val dst: Int, val value: Long) : Stmt()

/** add-int, sub-int, mul-int, xor-int, div-int or rem-int. The last two throw on a zero divisor. */
internal data class Arith(override val id: Int, val op: String, val dst: Int, val a: Int, val b: Int) : Stmt()

/** The /lit8 form of add, mul, div or rem. */
internal data class ArithLit(override val id: Int, val op: String, val dst: Int, val a: Int, val literal: Int) : Stmt()
internal data class AddWide(override val id: Int, val dst: Int, val a: Int, val b: Int) : Stmt()
internal data class Widen(override val id: Int, val dst: Int, val src: Int) : Stmt()
internal data class Narrow(override val id: Int, val dst: Int, val src: Int) : Stmt()
internal data class Move(override val id: Int, val dst: Int, val src: Int) : Stmt()
internal data class MoveWide(override val id: Int, val dst: Int, val src: Int) : Stmt()

/** Records an int, and throws IllegalStateException when it equals the program's trap value. */
internal data class Note(override val id: Int, val src: Int) : Stmt()
internal data class NoteWide(override val id: Int, val src: Int) : Stmt()

/** Records the class of a caught exception still held in a register. */
internal data class Describe(override val id: Int, val src: Int) : Stmt()

/** A call with a result: records the int and moves `int * 31 + 7` into [dst]. */
internal data class Mix(override val id: Int, val dst: Int, val src: Int) : Stmt()

/** `if-<test>` jumps to [otherwise] when the test holds and falls through to [then] when it doesn't. */
internal data class Branch(
    override val id: Int, val test: String, val a: Int, val b: Int?,
    val then: List<Stmt>, val otherwise: List<Stmt>,
) : Stmt()

/** Runs [body] [times] times, counting down in [counter], which the body leaves alone. */
internal data class Loop(override val id: Int, val counter: Int, val times: Int, val body: List<Stmt>) : Stmt()

/** A packed switch on [src] with keys from [first]; anything else runs [fallback]. */
internal data class Switch(
    override val id: Int, val src: Int, val first: Int,
    val cases: List<List<Stmt>>, val fallback: List<Stmt>,
) : Stmt()

/**
 * A try block. [catchType] null is a catch-all. With [exception] set the handler starts with
 * move-exception into it and records what it caught; without, the handler is its first statement.
 */
internal data class Guarded(
    override val id: Int, val body: List<Stmt>, val catchType: String?, val exception: Int?,
    val handler: List<Stmt>,
) : Stmt()

internal data class Return(override val id: Int, val src: Int) : Stmt()

internal fun Stmt.children(): List<List<Stmt>> = when (this) {
    is Branch -> listOf(then, otherwise)
    is Loop -> listOf(body)
    is Switch -> cases + listOf(fallback)
    is Guarded -> listOf(body, handler)
    else -> emptyList()
}

internal fun Stmt.ids(): Set<Int> = setOf(id) + children().flatten().flatMap { it.ids() }

internal class Program(val locals: Int, val trap: Int, val body: List<Stmt>) {
    val registers: Int get() = locals + 2
    val first: Int get() = locals
    val second: Int get() = locals + 1

    fun entry() = Kinds(registers).apply { setInt(first); setInt(second) }

    /** Every block of the tree, the top level first. */
    fun blocks(): List<List<Stmt>> {
        val blocks = mutableListOf<List<Stmt>>()
        fun visit(block: List<Stmt>) {
            blocks += block
            block.forEach { statement -> statement.children().forEach(::visit) }
        }
        visit(body)
        return blocks
    }
}

/** A hook at the statement [from] that, when its guard answers true, carries on at [to] instead. */
internal data class Jump(val from: Int, val to: Int)

/**
 * The verifier's view of a generated method: each statement's reads checked against the register
 * kinds that reach it, merged at every join, at the loop heads until nothing changes, and at
 * each handler over every point of its try block. The generator builds only what this accepts,
 * so every method it writes loads.
 */
internal object Verify : Verifier(exact = false)

/**
 * ART's own view, for judging a hook's jump. A handler takes only what reaches it from the calls
 * and divisions that can throw, the hook's call among them, and a zero stays an untyped literal.
 * It accepts everything [Verify] does and more. Seed 20261002013 loads on a phone and here: the
 * register its jump carries holds a long before a loop and a zero after, and only the call after
 * the loop can reach the handler.
 */
internal object VerifyExact : Verifier(exact = true)

internal open class Verifier(private val exact: Boolean) {
    fun program(program: Program, jump: Jump? = null): Boolean =
        block(program.body, program.entry(), jump, emptyList()) != null

    /** The kinds after [block], or null when something in it reads a register that doesn't hold its kind. */
    fun block(block: List<Stmt>, start: Kinds, jump: Jump?, handlers: List<MutableList<Kinds>>): Kinds? {
        var state = start
        var atJump: Kinds? = null
        for (statement in block) {
            if (jump != null && statement.id == jump.to) state = state.merge(atJump ?: return null)
            if (jump != null && statement.id == jump.from) atJump = state.copy()
            if (!exact || statement.throws() || jump?.from == statement.id) handlers.forEach { it += state.copy() }
            state = statement(statement, state, jump, handlers) ?: return null
        }
        return state
    }

    fun statement(statement: Stmt, state: Kinds, jump: Jump?, handlers: List<MutableList<Kinds>>): Kinds? {
        val out = state.copy()
        when (statement) {
            is Const -> if (exact && statement.value == 0) out.setZero(statement.dst) else out.setInt(statement.dst)
            is ConstWide -> out.setWide(statement.dst)
            is Arith -> if (state.isInt(statement.a) && state.isInt(statement.b)) out.setInt(statement.dst) else return null
            is ArithLit -> if (state.isInt(statement.a)) out.setInt(statement.dst) else return null
            is AddWide -> if (state.isWide(statement.a) && state.isWide(statement.b)) out.setWide(statement.dst) else return null
            is Widen -> if (state.isInt(statement.src)) out.setWide(statement.dst) else return null
            is Narrow -> if (state.isWide(statement.src)) out.setInt(statement.dst) else return null
            is Move -> when {
                exact && state.isZero(statement.src) -> out.setZero(statement.dst)
                state.isInt(statement.src) -> out.setInt(statement.dst)
                else -> return null
            }
            is MoveWide -> if (state.isWide(statement.src)) out.setWide(statement.dst) else return null
            is Note -> if (!state.isInt(statement.src)) return null
            is NoteWide -> if (!state.isWide(statement.src)) return null
            is Describe -> if (!state.isRef(statement.src)) return null
            is Mix -> if (state.isInt(statement.src)) out.setInt(statement.dst) else return null
            is Return -> if (!state.isInt(statement.src)) return null
            is Branch -> {
                if (!state.isInt(statement.a) || (statement.b != null && !state.isInt(statement.b))) return null
                val then = block(statement.then, state, jump, handlers) ?: return null
                val otherwise = block(statement.otherwise, state, jump, handlers) ?: return null
                return then.merge(otherwise)
            }
            is Loop -> {
                val entry = out.apply { setInt(statement.counter) }
                var head = entry
                repeat(8) {
                    val end = block(statement.body, head, jump, handlers) ?: return null
                    if (!end.isInt(statement.counter)) return null
                    val next = entry.merge(end)
                    if (next == head) return end
                    head = next
                }
                return null
            }
            is Switch -> {
                if (!state.isInt(statement.src)) return null
                return statement.children().map { block(it, state, jump, handlers) ?: return null }.reduce(Kinds::merge)
            }
            is Guarded -> {
                val seen = mutableListOf<Kinds>()
                val end = block(statement.body, state, jump, handlers + listOf(seen)) ?: return null
                // Nothing in the block can throw, so nothing reaches the handler and ART skips it.
                if (seen.isEmpty()) return if (exact) end else null
                val entry = seen.reduce(Kinds::merge)
                statement.exception?.let(entry::setRef)
                val handled = block(statement.handler, entry, jump, handlers) ?: return null
                return end.merge(handled)
            }
        }
        return out
    }

    /** Whether the statement's first instruction can throw, so its handlers see what it starts with. */
    private fun Stmt.throws() = when (this) {
        is Note, is NoteWide, is Describe, is Mix -> true
        is Arith -> op.startsWith("div") || op.startsWith("rem")
        is ArithLit -> op.startsWith("div") || op.startsWith("rem")
        else -> false
    }
}

/**
 * Builds a [Program] from a seed: 3 to 10 locals, blocks nested up to three deep, and only
 * statements whose reads [Verify] accepts, so every program would load on a device.
 */
internal class Generator(seed: Long) {
    private val random = Random(seed)
    private var next = 0
    private var locals = 0
    private var trap = 0
    private var tries = 0

    fun program(): Program {
        locals = random.nextInt(3, 11)
        trap = random.nextInt(-2, 6)
        val entry = Kinds(locals + 2).apply { setInt(locals); setInt(locals + 1) }
        val (body, end) = block(entry, depth = 0, budget = random.nextInt(4, 11), reserved = emptySet())
        val ints = (0 until locals + 2).filter(end::isInt)
        return Program(locals, trap, body + Return(next++, ints[random.nextInt(ints.size)]))
    }

    private fun block(start: Kinds, depth: Int, budget: Int, reserved: Set<Int>): Pair<List<Stmt>, Kinds> {
        val block = mutableListOf<Stmt>()
        var state = start
        repeat(budget) {
            for (attempt in 0 until 8) {
                val statement = statement(state, depth, reserved) ?: continue
                val after = Verify.statement(statement, state, null, emptyList()) ?: continue
                block += statement
                state = after
                break
            }
        }
        return block to state
    }

    private fun <T> List<T>.pick(): T? = if (isEmpty()) null else this[random.nextInt(size)]

    private fun constant(): Int = when (random.nextInt(6)) {
        0 -> 0
        1 -> trap
        2 -> random.nextInt(-8, 8)
        3 -> random.nextInt(-200, 200)
        4 -> random.nextInt()
        else -> random.nextInt(-1, 2)
    }

    private fun statement(state: Kinds, depth: Int, reserved: Set<Int>): Stmt? {
        val ints = (0 until state.size).filter(state::isInt)
        val wides = (0 until locals - 1).filter(state::isWide)
        val refs = (0 until locals).filter(state::isRef)
        val writable = (0 until locals).filter { it !in reserved }
        val writableWide = (0 until locals - 1).filter { it !in reserved && it + 1 !in reserved }
        val id = next++
        return when (random.nextInt(if (depth < 3) 22 else 15)) {
            0, 1 -> Const(id, writable.pick() ?: return null, constant())
            2 -> ConstWide(id, writableWide.pick() ?: return null, random.nextLong(-(1L shl 40), 1L shl 40))
            3, 4 -> Arith(
                id, listOf("add-int", "sub-int", "mul-int", "xor-int", "div-int", "rem-int").pick()!!,
                writable.pick() ?: return null, ints.pick() ?: return null, ints.pick()!!,
            )
            5 -> ArithLit(
                id, listOf("add-int/lit8", "mul-int/lit8", "div-int/lit8", "rem-int/lit8").pick()!!,
                writable.pick() ?: return null, ints.pick() ?: return null, random.nextInt(-3, 4),
            )
            6 -> AddWide(id, writableWide.pick() ?: return null, wides.pick() ?: return null, wides.pick()!!)
            7 -> Widen(id, writableWide.pick() ?: return null, ints.pick() ?: return null)
            8 -> Narrow(id, writable.pick() ?: return null, wides.pick() ?: return null)
            9 -> if (random.nextBoolean()) {
                Move(id, writable.pick() ?: return null, ints.pick() ?: return null)
            } else {
                MoveWide(id, writableWide.pick() ?: return null, wides.pick() ?: return null)
            }
            10, 11 -> Note(id, ints.pick() ?: return null)
            12 -> wides.pick()?.let { NoteWide(id, it) } ?: refs.pick()?.let { Describe(id, it) }
            13, 14 -> Mix(id, writable.pick() ?: return null, ints.pick() ?: return null)
            15, 16 -> {
                val a = ints.pick() ?: return null
                val two = random.nextBoolean()
                val test = listOf("eq", "ne", "lt", "ge", "gt", "le").pick()!!
                Branch(
                    id, if (two) test else test + "z", a, if (two) ints.pick() else null,
                    block(state, depth + 1, random.nextInt(0, 4), reserved).first,
                    block(state, depth + 1, random.nextInt(0, 3), reserved).first,
                )
            }
            17 -> {
                val counter = writable.pick() ?: return null
                val head = state.copy().apply { setInt(counter) }
                Loop(id, counter, random.nextInt(1, 4), block(head, depth + 1, random.nextInt(1, 4), reserved + counter).first)
            }
            18 -> Switch(
                id, ints.pick() ?: return null, random.nextInt(-1, 2),
                List(random.nextInt(1, 4)) { block(state, depth + 1, random.nextInt(0, 3), reserved).first },
                block(state, depth + 1, random.nextInt(0, 3), reserved).first,
            )
            else -> guarded(id, state, depth, reserved, writable)
        }
    }

    private fun guarded(id: Int, state: Kinds, depth: Int, reserved: Set<Int>, writable: List<Int>): Stmt? {
        // Dex checks a catch-all after every typed handler covering the same instruction, and
        // can't hold two overlapping catch-alls, so one inside another try reads differently from
        // the tree. Only a try outside every other try body gets one.
        val outermost = tries == 0
        tries++
        var (body, end) = try {
            block(state, depth + 1, random.nextInt(1, 4), reserved)
        } finally {
            tries--
        }
        // A try block needs something in it that can throw.
        if (body.none { it is Note || it is Mix || it is NoteWide || (it is Arith && it.op.startsWith("d")) }) {
            body = body + Note(next++, (0 until end.size).filter(end::isInt).pick() ?: return null)
        }
        val seen = mutableListOf<Kinds>()
        Verify.block(body, state, null, listOf(seen)) ?: return null
        val entry = seen.reduce(Kinds::merge)
        val exception = if (random.nextBoolean()) writable.pick() else null
        exception?.let(entry::setRef)
        val catchType = (CATCHES.keys.toList<String?>() + if (outermost) listOf(null) else emptyList()).pick()
        return Guarded(id, body, catchType, exception, block(entry, depth + 1, random.nextInt(0, 3), reserved).first)
    }
}

/** A program's smali, and the index of each statement's first instruction once assembled. */
internal class Rendered(val method: String, val anchors: Map<Int, Int>)

internal fun Program.render(): Rendered {
    val lines = mutableListOf<String>()
    val payloads = mutableListOf<String>()
    val anchors = mutableMapOf<Int, Int>()
    var index = 0
    fun emit(instruction: String) { lines += "    $instruction"; index++ }
    fun label(name: String) { lines += "    :$name" }

    fun block(block: List<Stmt>) {
        for (statement in block) {
            anchors[statement.id] = index
            val n = statement.id
            when (statement) {
                is Const -> emit(
                    when (statement.value) {
                        in -8..7 -> "const/4 v${statement.dst}, ${statement.value}"
                        in Short.MIN_VALUE..Short.MAX_VALUE -> "const/16 v${statement.dst}, ${statement.value}"
                        else -> "const v${statement.dst}, ${statement.value}"
                    },
                )
                is ConstWide -> emit("const-wide v${statement.dst}, ${statement.value}L")
                is Arith -> emit("${statement.op} v${statement.dst}, v${statement.a}, v${statement.b}")
                is ArithLit -> emit("${statement.op} v${statement.dst}, v${statement.a}, ${statement.literal}")
                is AddWide -> emit("add-long v${statement.dst}, v${statement.a}, v${statement.b}")
                is Widen -> emit("int-to-long v${statement.dst}, v${statement.src}")
                is Narrow -> emit("long-to-int v${statement.dst}, v${statement.src}")
                is Move -> emit("move v${statement.dst}, v${statement.src}")
                is MoveWide -> emit("move-wide v${statement.dst}, v${statement.src}")
                is Note -> emit("invoke-static {v${statement.src}}, $PROBE->note(I)V")
                is NoteWide -> emit("invoke-static {v${statement.src}, v${statement.src + 1}}, $PROBE->noteWide(J)V")
                is Describe -> emit("invoke-static {v${statement.src}}, $PROBE->caught(Ljava/lang/Throwable;)V")
                is Mix -> {
                    emit("invoke-static {v${statement.src}}, $PROBE->mix(I)I")
                    emit("move-result v${statement.dst}")
                }
                is Branch -> {
                    val operands = if (statement.b == null) "v${statement.a}" else "v${statement.a}, v${statement.b}"
                    emit("if-${statement.test} $operands, :else_$n")
                    block(statement.then)
                    emit("goto :end_$n")
                    label("else_$n")
                    block(statement.otherwise)
                    label("end_$n")
                }
                is Loop -> {
                    emit("const/4 v${statement.counter}, ${statement.times}")
                    label("loop_$n")
                    block(statement.body)
                    emit("add-int/lit8 v${statement.counter}, v${statement.counter}, -1")
                    emit("if-gtz v${statement.counter}, :loop_$n")
                }
                is Switch -> {
                    emit("packed-switch v${statement.src}, :switch_$n")
                    block(statement.fallback)
                    emit("goto :end_$n")
                    statement.cases.forEachIndexed { case, body ->
                        label("case_${n}_$case")
                        block(body)
                        emit("goto :end_$n")
                    }
                    label("end_$n")
                    payloads += "    :switch_$n\n    .packed-switch ${statement.first}\n" +
                        statement.cases.indices.joinToString("") { "        :case_${n}_$it\n" } +
                        "    .end packed-switch"
                }
                is Guarded -> {
                    label("try_start_$n")
                    block(statement.body)
                    label("try_end_$n")
                    lines += "    " + (statement.catchType?.let { ".catch $it" } ?: ".catchall") +
                        " {:try_start_$n .. :try_end_$n} :handler_$n"
                    emit("goto :after_$n")
                    label("handler_$n")
                    statement.exception?.let {
                        emit("move-exception v$it")
                        emit("invoke-static {v$it}, $PROBE->caught(Ljava/lang/Throwable;)V")
                    }
                    block(statement.handler)
                    label("after_$n")
                }
                is Return -> emit("return v${statement.src}")
            }
        }
    }

    block(body)
    val method = (listOf(".method public static run(II)I", "    .registers $registers") + lines + payloads +
        listOf(".end method")).joinToString("\n")
    return Rendered(method, anchors)
}

/** How a run ended, and what it recorded on the way. */
internal data class Outcome(val ending: String, val trace: List<String>) {
    override fun toString() = "$ending|" + trace.joinToString("") { "$it," }
}

internal class Thrown(val type: String) : RuntimeException(type, null, false, false)

/** Runs the statement tree itself, with no bytecode involved. */
internal object Evaluate {
    private object High
    private class Returned(val value: Int) : RuntimeException(null, null, false, false)

    fun run(program: Program, first: Int, second: Int): Outcome {
        val values = arrayOfNulls<Any>(program.registers)
        val trace = mutableListOf<String>()
        var steps = 0
        values[program.first] = first
        values[program.second] = second

        fun int(register: Int) = values[register] as? Int ?: error("v$register holds ${values[register]}, not an int")
        fun wide(register: Int): Long {
            check(values[register + 1] === High) { "v$register isn't the low half of a pair" }
            return values[register] as Long
        }
        fun clear(register: Int) {
            if (values[register] is Long) values[register + 1] = null
            if (values[register] === High) values[register - 1] = null
            values[register] = null
        }
        fun setInt(register: Int, value: Int) { clear(register); values[register] = value }
        fun setWide(register: Int, value: Long) {
            clear(register)
            clear(register + 1)
            values[register] = value
            values[register + 1] = High
        }
        fun divide(op: String, a: Int, b: Int): Int {
            if ((op.startsWith("div") || op.startsWith("rem")) && b == 0) throw Thrown(ARITHMETIC)
            return when (op.substringBefore('/')) {
                "add-int" -> a + b
                "sub-int" -> a - b
                "mul-int" -> a * b
                "xor-int" -> a xor b
                "div-int" -> a / b
                "rem-int" -> a % b
                else -> error(op)
            }
        }
        fun holds(test: String, a: Int, b: Int) = when (test.removeSuffix("z")) {
            "eq" -> a == b
            "ne" -> a != b
            "lt" -> a < b
            "ge" -> a >= b
            "gt" -> a > b
            "le" -> a <= b
            else -> error(test)
        }

        fun execute(block: List<Stmt>) {
            for (statement in block) {
                check(++steps < 20_000) { "ran past 20000 statements" }
                when (statement) {
                    is Const -> setInt(statement.dst, statement.value)
                    is ConstWide -> setWide(statement.dst, statement.value)
                    is Arith -> setInt(statement.dst, divide(statement.op, int(statement.a), int(statement.b)))
                    is ArithLit -> setInt(statement.dst, divide(statement.op, int(statement.a), statement.literal))
                    is AddWide -> setWide(statement.dst, wide(statement.a) + wide(statement.b))
                    is Widen -> setWide(statement.dst, int(statement.src).toLong())
                    is Narrow -> setInt(statement.dst, wide(statement.src).toInt())
                    is Move -> setInt(statement.dst, int(statement.src))
                    is MoveWide -> setWide(statement.dst, wide(statement.src))
                    is Note -> {
                        val value = int(statement.src)
                        trace += "note:$value"
                        if (value == program.trap) throw Thrown(ILLEGAL_STATE)
                    }
                    is NoteWide -> trace += "wide:${wide(statement.src)}"
                    is Describe -> trace += "caught:${values[statement.src] as String}"
                    is Mix -> {
                        val value = int(statement.src)
                        trace += "mix:$value"
                        setInt(statement.dst, value * 31 + 7)
                    }
                    is Branch -> {
                        val a = int(statement.a)
                        val b = statement.b?.let(::int) ?: 0
                        execute(if (holds(statement.test, a, b)) statement.otherwise else statement.then)
                    }
                    is Loop -> {
                        setInt(statement.counter, statement.times)
                        do {
                            execute(statement.body)
                            setInt(statement.counter, int(statement.counter) - 1)
                        } while (int(statement.counter) > 0)
                    }
                    is Switch -> {
                        val case = int(statement.src).toLong() - statement.first
                        execute(if (case in statement.cases.indices.map(Int::toLong)) statement.cases[case.toInt()] else statement.fallback)
                    }
                    is Guarded -> try {
                        execute(statement.body)
                    } catch (thrown: Thrown) {
                        if (!catches(statement.catchType, thrown.type)) throw thrown
                        statement.exception?.let {
                            clear(it)
                            values[it] = thrown.type
                            trace += "caught:${thrown.type}"
                        }
                        execute(statement.handler)
                    }
                    is Return -> throw Returned(int(statement.src))
                }
            }
        }

        return try {
            execute(program.body)
            error("ran off the end of the method")
        } catch (returned: Returned) {
            Outcome("return:${returned.value}", trace)
        } catch (thrown: Thrown) {
            Outcome("throw:${thrown.type}", trace)
        }
    }
}
