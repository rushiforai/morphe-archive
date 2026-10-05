package app.morphe.util.injection

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import java.io.File

/**
 * The cases a phone runs: each original and injected method in a class of its own, the probe
 * in smali printing the same trace the interpreter keeps, and a main that runs every case under
 * each guard answer it was checked with here. scripts/test-injection-corpus-device.ps1 runs it
 * with dalvikvm and compares the output with expected.txt line for line, so ART's verifier and
 * runtime both get a say on code the JVM tests only interpret.
 */
internal object InjectionCorpus {
    private const val MAIN = "Lseeded/Main;"

    /** One run on the phone: the class whose run(II)I it calls, the trap and guard answer it sets, and the inputs. */
    private class Run(val label: String, val type: String, val trap: Int, val pattern: Int, val first: Int, val second: Int)

    private val PATTERN_CODES = mapOf("off" to 0, "on" to 1, "alternate" to 2)

    val probe = """
        .class public $PROBE
        .super Ljava/lang/Object;

        .field static trace:Ljava/lang/StringBuilder;
        .field static trap:I
        .field static pattern:I
        .field static calls:I

        .method public static reset(II)V
            .registers 3
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
            sput-object v0, $PROBE->trace:Ljava/lang/StringBuilder;
            sput p0, $PROBE->trap:I
            sput p1, $PROBE->pattern:I
            const/4 v0, 0x0
            sput v0, $PROBE->calls:I
            return-void
        .end method

        .method static record(Ljava/lang/String;Ljava/lang/String;)V
            .registers 4
            sget-object v0, $PROBE->trace:Ljava/lang/StringBuilder;
            invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v1, ","
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            return-void
        .end method

        .method public static note(I)V
            .registers 3
            const-string v0, "note:"
            invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $PROBE->record(Ljava/lang/String;Ljava/lang/String;)V
            sget v0, $PROBE->trap:I
            if-ne p0, v0, :done
            new-instance v0, Ljava/lang/IllegalStateException;
            invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V
            throw v0
            :done
            return-void
        .end method

        .method public static noteWide(J)V
            .registers 4
            const-string v0, "wide:"
            invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $PROBE->record(Ljava/lang/String;Ljava/lang/String;)V
            return-void
        .end method

        .method public static caught(Ljava/lang/Throwable;)V
            .registers 3
            const-string v0, "caught:"
            invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v1
            invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $PROBE->record(Ljava/lang/String;Ljava/lang/String;)V
            return-void
        .end method

        .method public static mix(I)I
            .registers 3
            const-string v0, "mix:"
            invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $PROBE->record(Ljava/lang/String;Ljava/lang/String;)V
            mul-int/lit8 v0, p0, 0x1f
            add-int/lit8 v0, v0, 0x7
            return v0
        .end method

        .method public static seen(Z)V
            .registers 3
            const-string v0, "seen:"
            invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
            move-result-object v1
            invoke-static {v0, v1}, $PROBE->record(Ljava/lang/String;Ljava/lang/String;)V
            return-void
        .end method

        .method public static guard()Z
            .registers 3
            sget v0, $PROBE->calls:I
            add-int/lit8 v1, v0, 0x1
            sput v1, $PROBE->calls:I
            sget v1, $PROBE->pattern:I
            const/4 v2, 0x1
            if-eq v1, v2, :yes
            const/4 v2, 0x2
            if-ne v1, v2, :no
            and-int/lit8 v0, v0, 0x1
            if-nez v0, :yes
            :no
            const/4 v0, 0x0
            return v0
            :yes
            const/4 v0, 0x1
            return v0
        .end method

        .method public static returned(Ljava/lang/String;I)V
            .registers 5
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
            const-string v1, "=return:"
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
            invoke-static {v0}, $PROBE->print(Ljava/lang/StringBuilder;)V
            return-void
        .end method

        .method public static threw(Ljava/lang/String;Ljava/lang/Throwable;)V
            .registers 5
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
            const-string v1, "=throw:"
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            move-result-object v1
            invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-static {v0}, $PROBE->print(Ljava/lang/StringBuilder;)V
            return-void
        .end method

        .method static print(Ljava/lang/StringBuilder;)V
            .registers 3
            const-string v0, "|"
            invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            sget-object v0, $PROBE->trace:Ljava/lang/StringBuilder;
            invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
            invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v0
            sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
            invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
            return-void
        .end method
    """.trimIndent()

    /**
     * Writes corpus.dex and expected.txt into [directory] for [cases], each with the method its
     * hook was injected into, and returns the expected lines. Every class is read back from the
     * written dex and run again here, so what the phone gets is what was checked.
     *
     * A skip whose jump leaves a register undefined can't go in [cases]: ART verifies the whole
     * method when the class loads and throws VerifyError on every run, whatever the guard answers.
     * Those go in [rejected], hooked without the check, each run once to show ART refuses it.
     */
    fun write(cases: List<Pair<Case, Method>>, directory: File, rejected: List<Pair<Case, Method>> = emptyList()): List<String> {
        directory.mkdirs()
        val classes = mutableListOf<ClassDef>(assemble(probe))
        val methods = mutableMapOf<String, Method>()
        val runs = mutableListOf<Run>()
        val refusals = mutableListOf<String>()
        rejected.forEachIndexed { number, (case, injected) ->
            require(case.mode == Mode.SKIP && !case.jumpVerifies) { "${case.name}: only a skip whose jump doesn't verify is run to be rejected" }
            val type = "Lcase/R$number;"
            classes += frozen(type, injected)
            val (first, second) = case.inputs.first()
            runs += Run("${case.name}/rejected", type, case.trap, PATTERN_CODES.getValue("on"), first, second)
            refusals += "${case.name}/rejected=throw:java.lang.VerifyError|"
        }
        cases.forEachIndexed { number, (case, injected) ->
            require(case.mode != Mode.SKIP || case.jumpVerifies) { "${case.name}: its jump doesn't verify, so ART rejects the class" }
            val original = assemble(hostClass(HOST, case.method)).methods.single()
            val originalType = "Lcase/O$number;"
            val injectedType = "Lcase/I$number;"
            classes += frozen(originalType, original)
            classes += frozen(injectedType, injected)
            methods[originalType] = original
            methods[injectedType] = injected
            case.inputs.forEachIndexed { input, (first, second) ->
                runs += Run("${case.name}/original/$input", originalType, case.trap, 0, first, second)
                for ((name, code) in PATTERN_CODES) {
                    runs += Run("${case.name}/injected/$input/$name", injectedType, case.trap, code, first, second)
                }
            }
        }
        classes += assemble(main(runs))
        val dex = File(directory, "corpus.dex")
        writeDex(classes, dex)

        val written = DexFileFactory.loadDexFile(dex, OPCODES).classes.associateBy { it.type }
        val expected = refusals + runs.drop(refusals.size).map { run ->
            val answer = PATTERNS.first { PATTERN_CODES[it.first] == run.pattern }.second
            val outcome = DexMachine(methods.getValue(run.type), run.trap, answer).run(run.first, run.second)
            val reread = DexMachine(written.getValue(run.type).methods.single(), run.trap, answer).run(run.first, run.second)
            check(outcome == reread) { "${run.label} runs to $reread from the written dex, $outcome before writing" }
            "${run.label}=$outcome"
        }
        File(directory, "expected.txt").writeText(expected.joinToString("\n", postfix = "\n"))
        return expected
    }

    private fun main(runs: List<Run>): String {
        val chunks = runs.chunked(40)
        return buildString {
            appendLine(".class public $MAIN")
            appendLine(".super Ljava/lang/Object;")
            appendLine(".method public static main([Ljava/lang/String;)V")
            appendLine("    .registers 1")
            chunks.indices.forEach { appendLine("    invoke-static {}, $MAIN->part$it()V") }
            appendLine("    return-void")
            appendLine(".end method")
            chunks.forEachIndexed { part, chunk ->
                appendLine(".method static part$part()V")
                appendLine("    .registers 4")
                chunk.forEachIndexed { n, run ->
                    val label = "r${part}_$n"
                    appendLine("    const v0, ${run.trap}")
                    appendLine("    const/4 v1, ${run.pattern}")
                    appendLine("    invoke-static {v0, v1}, $PROBE->reset(II)V")
                    appendLine("    const v0, ${run.first}")
                    appendLine("    const v1, ${run.second}")
                    appendLine("    :${label}_start")
                    appendLine("    invoke-static {v0, v1}, ${run.type}->run(II)I")
                    appendLine("    :${label}_end")
                    appendLine("    .catch Ljava/lang/Throwable; {:${label}_start .. :${label}_end} :${label}_catch")
                    appendLine("    move-result v2")
                    appendLine("    const-string v3, \"${run.label}\"")
                    appendLine("    invoke-static {v3, v2}, $PROBE->returned(Ljava/lang/String;I)V")
                    appendLine("    goto :${label}_done")
                    appendLine("    :${label}_catch")
                    appendLine("    move-exception v2")
                    appendLine("    const-string v3, \"${run.label}\"")
                    appendLine("    invoke-static {v3, v2}, $PROBE->threw(Ljava/lang/String;Ljava/lang/Throwable;)V")
                    appendLine("    :${label}_done")
                }
                appendLine("    return-void")
                appendLine(".end method")
            }
        }
    }
}
