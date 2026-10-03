package app.morphe.util.injection

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Generated methods with a hook injected the way the patches inject theirs, run against oracles
 * that never look at the injected code: the statement tree evaluated directly, and the original
 * method run with the hook's effect played out at its instruction. The borrowed register is
 * poisoned once the hook is done with it, so a later read fails even where the value it held
 * happens to match.
 *
 * A failing seed is printed, shrunk, and written to build/injection-regressions. Copy the file
 * into src/test/resources/injection-regressions to keep it. HUSHTELEGRAM_INJECTION_SEED replays
 * one seed, and HUSHTELEGRAM_INJECTION_SEEDS runs more than the default batch.
 */
class SeededInjectionTest {
    private val scratch = File("build/tmp/seeded-injection").apply { mkdirs() }.resolve("check.dex")

    private fun seeds(): List<Long> {
        System.getenv("HUSHTELEGRAM_INJECTION_SEED")?.let { return listOf(it.trim().toLong()) }
        val count = System.getenv("HUSHTELEGRAM_INJECTION_SEEDS")?.trim()?.toInt() ?: 1000
        return (0 until count).map { BASE + it }
    }

    @Test
    fun `generated hooks keep every path the method had`() {
        val seeds = seeds()
        val failures = mutableListOf<String>()
        val reachedCases = mutableListOf<Generated>()
        var injected = 0
        var comparedOn = 0
        var jumpsRefused = 0
        for (seed in seeds) {
            val generated = Generated.of(seed)
            val case = generated.case()
            val ran = runCase(case, Chooser.REAL, scratch)
            ran.failure?.let { failures += report(generated, it, Chooser.REAL) }
            // The jump check has to refuse exactly the skips ART would: any other jump it refuses
            // costs a patch a hook it could have had.
            if (case.mode == Mode.SKIP && !case.jumpVerifies && !ran.refused) {
                failures += "seed $seed: its jump doesn't verify, yet the hook went in. Replay it with HUSHTELEGRAM_INJECTION_SEED=$seed:\n${case.method}"
            }
            if (case.mode == Mode.SKIP && case.jumpVerifies && ran.jumpRefused) {
                failures += "seed $seed: the jump verifies, yet ${ran.refusal}. Replay it with HUSHTELEGRAM_INJECTION_SEED=$seed:\n${case.method}"
            }
            if (failures.size >= 3) break
            if (ran.jumpRefused) jumpsRefused++
            if (!ran.refused) injected++
            if (ran.reached) reachedCases += generated
            if (ran.comparedOn) comparedOn++
        }
        assertTrue(failures.joinToString("\n\n"), failures.isEmpty())
        if (seeds.size < 400) return

        // The batch has to keep reaching every shape it exists for, counted only where some input
        // reached the hook. A shape counts wherever it sits in the method, since register choice
        // reads the whole method's flow, not just the path one input takes.
        fun count(what: (Stmt) -> Boolean) = reachedCases.count { generated -> generated.program.body.any { it.has(what) } }
        val reached = mapOf(
            "loops" to count { it is Loop },
            "switches" to count { it is Switch },
            "try blocks" to count { it is Guarded },
            "handlers reading the exception" to count { it is Guarded && it.exception != null },
            "wide registers" to count { it is ConstWide || it is Widen },
            "two-register branches" to count { it is Branch && it.b != null },
            "jumps" to reachedCases.count { it.mode == Mode.SKIP },
            "observed answers" to reachedCases.count { it.mode == Mode.OBSERVE },
            "early returns" to reachedCases.count { it.mode == Mode.RETURN },
            "guard answers compared" to comparedOn,
        )
        println("$injected of ${seeds.size} seeded cases injected, $jumpsRefused skips refused for their jump, " +
            "${reachedCases.size} reached by some input: $reached")
        assertTrue("only $jumpsRefused skips refused for their jump", jumpsRefused >= 20)
        val thin = reached.filterValues { it < 20 }
        assertTrue("too few reached cases with $thin of ${reachedCases.size}: $reached", thin.isEmpty())
    }

    @Test
    fun `a register choice that forgets a read is caught`() {
        val retain = System.getenv("HUSHTELEGRAM_INJECTION_RETAIN")?.let(::File)
        for ((chooser, budget) in listOf(Chooser.RECKLESS to 200, Chooser.IGNORES_TARGETS to 600, Chooser.WIDE_BLIND to 1500)) {
            val caught = (0 until budget).asSequence().map { CONTROL_BASE + it }.firstNotNullOfOrNull { seed ->
                val generated = Generated.of(seed)
                runCase(generated.case(), chooser, scratch).failure?.let { generated to it }
            }
            assertNotNull("$chooser got through $budget seeded cases", caught)
            val (generated, failure) = caught!!
            // Only a failure the real choice doesn't share is the control's own.
            val real = runCase(generated.case(), Chooser.REAL, scratch)
            assertNull("seed ${generated.seed} fails with the real choice too, so $chooser wasn't what failed it: ${real.failure}", real.failure)
            assertFalse("seed ${generated.seed} is refused with the real choice", real.refused)
            if (retain != null) {
                val small = minimize(generated) { runCase(it.case(), chooser, scratch).failure }
                val name = "${chooser.name.lowercase().replace('_', '-')}-seed-${generated.seed}"
                val shrunk = runCase(small.case(), chooser, scratch).failure ?: failure
                retain.mkdirs()
                File(retain, "$name.case").writeText(
                    small.case().retained("Shrunk from seed ${generated.seed}, which $chooser got wrong:\n$shrunk", chooser),
                )
            }
        }
    }

    @Test
    fun `retained cases pass and still catch the choice they were kept for`() {
        val retained = retainedCases()
        assertTrue("no retained cases under $REGRESSIONS", retained.size >= 3)
        for ((case, control) in retained) {
            val ran = runCase(case, Chooser.REAL, scratch)
            assertNull(case.name, ran.failure)
            assertFalse("${case.name}: freeLocalsAt found no register", ran.refused)
            // The register check refuses some bad choices before the method changes, a wide pair
            // split by a skip's borrowed register among them. That catches the choice too.
            control?.let {
                val caught = runCase(case, it, scratch)
                assertTrue("${case.name} no longer catches $it", caught.failure != null || caught.jumpRefused)
            }
        }
    }

    @Test
    fun `the device corpus runs the same here after a round trip through dex`() {
        val generated = seeds().map(Generated::of)
        fun Generated.injects() = case().let { (it.mode != Mode.SKIP || it.jumpVerifies) && !runCase(it, Chooser.REAL, scratch).refused }
        // Skips only ART's own rules let in: the generator's stricter model refuses their jump.
        val boundary = generated.filter { it.mode == Mode.SKIP && !Verify.program(it.program, Jump(it.anchor, it.target!!)) && it.injects() }
        val cases = retainedCases().map { it.first } + (generated.asSequence().filter { it.injects() }.take(CORPUS_GENERATED) + boundary)
            .distinctBy { it.seed }.map { it.case() }
        fun hooked(case: Case, checked: Boolean = true) =
            inject(case, assemble(hostClass(HOST, case.method)).methods.single(), Chooser.REAL, checked).method
        // Every jump the check refuses goes to the phone hooked anyway, to show ART refuses it too.
        val rejected = generated.asSequence().map { it.case() }
            .filter { it.mode == Mode.SKIP && runCase(it, Chooser.REAL, scratch).jumpRefused }
            .take(CORPUS_REJECTED).map { it to hooked(it, checked = false) }.toList()
        val expected = InjectionCorpus.write(cases.map { it to hooked(it) }, File("build/injection-corpus"), rejected)
        assertEquals(expected.size, expected.map { it.substringBefore('=') }.toSet().size)
        assertTrue("the corpus has only ${expected.size} runs", expected.size >= 100)
        assertTrue("only ${boundary.size} skips past the generator's model", boundary.size >= 2)
        assertTrue("only ${rejected.size} skips ART should reject", rejected.size >= 20)
    }

    /** Shrinks a failure, writes it where it can be kept, and says how to replay it. */
    private fun report(generated: Generated, failure: String, chooser: Chooser): String {
        val small = minimize(generated) { runCase(it.case(), chooser, scratch).failure }
        val file = File("build/injection-regressions/seed-${generated.seed}.case").absoluteFile
        file.parentFile.mkdirs()
        val case = small.case()
        val shrunk = runCase(case, chooser, scratch).failure ?: failure
        file.writeText(case.retained("Shrunk from seed ${generated.seed}:\n$shrunk", null))
        return "seed ${generated.seed} (${generated.mode.name.lowercase()}): $failure\n" +
            "Replay it with HUSHTELEGRAM_INJECTION_SEED=${generated.seed}. Shrunk to $file:\n${case.method}"
    }

    private fun retainedCases(): List<Pair<Case, Chooser?>> {
        val directory = javaClass.getResource("/$REGRESSIONS")?.toURI()?.let(::File) ?: return emptyList()
        return directory.listFiles { file -> file.name.endsWith(".case") }!!.sortedBy { it.name }
            .map { readRetained(it.nameWithoutExtension, it.readText()) }
    }

    private fun Stmt.has(what: (Stmt) -> Boolean): Boolean = what(this) || children().flatten().any { it.has(what) }

    private companion object {
        const val BASE = 20_261_002_000L
        const val CONTROL_BASE = 20_261_002_900_000L
        const val CORPUS_GENERATED = 24
        const val CORPUS_REJECTED = 60
        const val REGRESSIONS = "injection-regressions"
    }
}
