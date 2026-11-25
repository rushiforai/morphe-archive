package patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.addHelperMethodIfMissing
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.mutableClass
import patches.gboard.shared.isOpcode
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardAdvancedVoice1803ZhTwPatch = bytecodePatch(
    description = "Exact 18.5.4 Chinese punctuation, MDD and real native payload checks.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        val readiness = GboardMethodTarget("Lsmi;", "a", emptyList(), "Z").resolve(this)
        val eligibility = GboardMethodTarget("Lsmz;", "<init>", listOf(
            "Landroid/content/Context;", "Ltqb;", "Lusl;", "Lsdy;", "Ltqb;", "Ltqb;", "Lswr;",
            "Ltqb;", "Lswy;", "Lssi;", "Lkye;", "Lsrp;", "Lsrx;", "Luya;", "Lsth;", "Lsxc;",
            "Lsyz;", "Lihu;", "Lsno;", "Lsmm;", "Ltqb;", "Lpsw;", "Ljava/util/Set;"), "V").resolve(this)
        val mdd = GboardMethodTarget("Lsdy;", "<init>",
            listOf("Landroid/content/Context;", "Lsvb;", "Lsdr;", "Lpsw;"), "V").resolve(this)
        val formatter = GboardMethodTarget("Lsgm;", "<init>", listOf("Ljava/util/Locale;", "Leqn;",
            "Lsta;", "I", "Z", "Lsgp;", "Lsyp;", "Luya;", "Ljava/util/concurrent/Executor;"), "V").resolve(this)
        listOf(GboardFieldTarget("Lsmi;", "b", "Lgsn;"), GboardFieldTarget("Lsdy;", "d", "Lpsw;"),
            GboardFieldTarget("Leqn;", "c", "Leqh;"), GboardFieldTarget("Leqh;", "a", "Leqh;"),
            GboardFieldTarget("Leqh;", "H", "Z")).forEach { it.resolve(this) }
        listOf(GboardMethodTarget("Lgsn;", "get", emptyList(), "Ljava/lang/Object;"),
            GboardMethodTarget("Lsdw;", "<init>", listOf("Lsdy;", "Ljava/util/Locale;", "Labxm;"), "V"),
            GboardMethodTarget("Labue;", "ak", listOf("Lpsw;", "I", "Labzl;", "I"), "Lxkb;")
        ).forEach { it.resolve(this) }
        check("Labzl;" in mutableClass("Lsdw;").interfaces)
        mutableClass("Lsmi;").addHelperMethodIfMissing("morpheNativeSplitReady", listOf("Z"), "Z", 0x1a, 3,
            advancedVoice1853NativeBody())
        mutableClass("Lsdy;").addHelperMethodIfMissing("morpheRequestZhTwMdd", emptyList(), "V", 0x12, 6,
            advancedVoice1853MddBody())
        mutableClass("Lsgm;").addHelperMethodIfMissing("morpheZhTwFormatter", listOf("Ljava/util/Locale;", "Leqn;", "Z"),
            "Z", 0x1a, 5, advancedVoice1853FormatterBody())
        val normalReadinessReturns = readiness.implementation!!.instructions.indices.filter {
            readiness.implementation!!.instructions[it].isOpcode("RETURN")
        }
        check(normalReadinessReturns.size == 2)
        normalReadinessReturns.asReversed().forEach { i ->
            val r = (readiness.implementation!!.instructions[i] as OneRegisterInstruction).registerA
            readiness.addInstructions(i, """
                invoke-static {v$r}, Ltdn;->morpheNativeSplitReady(Z)Z
                move-result v$r
            """)
        }
        eligibility.addInstructions(0, """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT, "p1 .. p1")}
            ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_INCLUDE_EXACT_ZH_TW_SUPPORTED_LOCALE, "p23 .. p23")}
            move-result-object p23
            check-cast p23, Ljava/util/Set;
        """)
        val mddReturns = mdd.implementation!!.instructions.indices.filter {
            mdd.implementation!!.instructions[it].isOpcode("RETURN_VOID")
        }
        mddReturns.asReversed().forEach { mdd.addInstructions(it, "invoke-direct {p0}, Lsva;->morpheRequestZhTwMdd()V") }
        mdd.addInstructions(0, RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_SEED_APPLICATION_CONTEXT, "p1 .. p1"))
        formatter.addInstructions(0, """
            invoke-static {p1, p2, p5}, Lsxu;->morpheZhTwFormatter(Ljava/util/Locale;Leqn;Z)Z
            move-result p5
        """)
    }
}

internal fun advancedVoice1853NativeBody() = """
    :start
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_SHOULD_CHECK_NATIVE, "p0")}
    move-result v0
    if-eqz v0, :done
    sget-object v0, Ltor;->b:Lltr;
    invoke-interface {v0}, Lhrn;->a()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    if-eqz v0, :done
    const/4 p0, 0x1
    :done
    return p0
    :end
    .catch Ljava/lang/Throwable; {:start .. :end} :failed
    :failed
    move-exception v0
    return p0
""".trimIndent()

internal fun advancedVoice1853MddBody() = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_CLAIM_MDD, "")}
    move-result v0
    if-eqz v0, :done
    :start
    iget-object v0, p0, Lwdm;->d:Ladic;
    if-eqz v0, :reset
    const-string v1, "zh-TW"
    invoke-static {v1}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;
    move-result-object v1
    new-instance v2, Lsuz;
    const/4 v3, 0x0
    invoke-direct {v2, p0, v1, v3}, Lsuz;-><init>(Lsdy;Ljava/util/Locale;Labxm;)V
    const/4 v4, 0x3
    invoke-static {v0, v3, v2, v4}, Lacna;->ak(Lpsw;ILachc;I)Lxkb;
    move-result-object v0
    if-eqz v0, :reset
    :done
    return-void
    :end
    .catch Ljava/lang/Throwable; {:start .. :end} :failed
    :failed
    move-exception v0
    :reset
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_RESET_MDD, "")}
    return-void
""".trimIndent()

internal fun advancedVoice1853FormatterBody() = """
    if-eqz p1, :stock
    iget-object v0, p1, Letg;->c:Leta;
    if-nez v0, :config
    sget-object v0, Leta;->a:Leta;
    :config
    if-eqz v0, :stock
    iget-boolean v0, v0, Leta;->H:Z
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADVANCED_VOICE_RUNTIME_FORMATTER_GATE, "p0, v0, p2")}
    move-result p2
    :stock
    return p2
""".trimIndent()
