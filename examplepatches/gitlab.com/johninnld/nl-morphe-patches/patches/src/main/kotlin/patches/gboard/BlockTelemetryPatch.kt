package patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.isMethodReference

@Suppress("unused")
val gboardBlockTelemetryPatch = bytecodePatch(
    name = "Block Gboard telemetry",
    description = "Stops the identified Clearcut, Play services client metrics and Tenor share-report submissions " +
        "and disables stock Translate. Local AI Translate, GIF search, downloads and user-initiated feedback remain available.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val completedTask = "Lzej;->c(Ljava/lang/Object;)Lzdv;"
        GboardMethodTarget("Lzej;", "c", listOf("Ljava/lang/Object;"), "Lzdv;").resolve(this)
        val submissions = listOf(
            GboardMethodTarget("Lxkh;", "a", listOf("Lxii;", "Lxjt;"), "Lzdv;").resolve(this)
                .expectCall("Lxkg;-><init>(Lxkh;Lxii;Lxnq;Lxjt;)V"),
            GboardMethodTarget("Lxkh;", "b", listOf("Lxii;"), "Lzdv;").resolve(this)
                .expectCall("Lxke;-><init>(Lxkh;)V"),
            GboardMethodTarget("Lxvl;", "a", listOf("Lxuo;"), "Lzdv;").resolve(this),
        )
        val queuedClearcut = GboardMethodTarget("Lxkg;", "b", listOf("Lxmr;"), "V").resolve(this)
        val pending = "Lcom/google/android/gms/common/api/internal/BasePendingResult;->j(Lxny;)V"
        queuedClearcut.expectCall(pending)

        val sendsWithoutResult = listOf(
            // Play services request builders for notification and throttling telemetry.
            GboardMethodTarget("Lxvf;", "a", listOf("Lxrw;"), "V").resolve(this),
            GboardMethodTarget("Lxvi;", "a", listOf("Lxsg;"), "V").resolve(this),
            // Clearcut's batch flush owns both log-batch and log-error sends.
            GboardMethodTarget("Lxlc;", "c", listOf("Lxki;", "Ljava/lang/String;"), "V").resolve(this),
        )

        val translateAccessPoint = GboardMethodTarget("Lvsy;", "gg", emptyList(), "V").resolve(this)
            .expectCall("Laaew;-><init>(Lauaz;Laaev;Z)V")
        val autoTranslateBanner = GboardMethodTarget("Llcd;", "t", emptyList(), "V").resolve(this)
            .expectCall("Laefj;->a(Laegc;)V")
        val autoTranslateOpen = GboardMethodTarget("Llcd;", "u", emptyList(), "V").resolve(this)
            .expectCall("Ladbz;->T(Ladan;)V")
        val cloudTranslate = GboardMethodTarget("Lvrc;", "a", listOf("Lvtm;"), "Lavvx;").resolve(this)
            .expectCall("Ladre;->l(Ljava/lang/Object;)Ladre;")
        GboardMethodTarget("Lvtn;", "<init>", listOf("I"), "V").resolve(this)
        check(cloudTranslate.implementation!!.registerCount >= 4) {
            "Cloud translator has no scratch registers"
        }

        val tenor = GboardMethodTarget("Lajbe;", "a", listOf("Lajar;"), "Ladre;").resolve(this)
        tenor.expectCall("Lajar;->gZ(Landroid/content/Context;)Lahbp;")
        GboardMethodTarget("Lahbv;", "a", emptyList(), "Lahbu;").resolve(this)
        GboardMethodTarget("Lahbu;", "c", listOf("I"), "V").resolve(this)
        GboardMethodTarget("Lahbu;", "f", listOf("Z"), "V").resolve(this)
        GboardMethodTarget("Lahbu;", "a", emptyList(), "Lahbv;").resolve(this)
        GboardMethodTarget("Ladre;", "l", listOf("Ljava/lang/Object;"), "Ladre;").resolve(this)
        check(tenor.implementation!!.registerCount == 3) { "Tenor request register layout changed" }

        for (method in submissions) {
            check(method.implementation!!.registerCount > method.parameterTypes.size + 1) {
                "Telemetry submission has no scratch register"
            }
            method.addInstructions(0, """
                const/4 v0, 0x0
                invoke-static {v0}, $completedTask
                move-result-object v0
                return-object v0
            """.trimIndent())
        }
        queuedClearcut.addInstructions(0, """
            sget-object v0, Lcom/google/android/gms/common/api/Status;->a:Lcom/google/android/gms/common/api/Status;
            move-object/from16 v1, p0
            invoke-virtual {v1, v0}, $pending
            return-void
        """.trimIndent())
        for (method in sendsWithoutResult) method.addInstructions(0, "return-void")

        // Suppress native Translate before it can register a tile or open from an automatic prompt.
        for (method in listOf(translateAccessPoint, autoTranslateBanner, autoTranslateOpen)) {
            method.addInstructions(0, "return-void")
        }
        // Any other stock entry point receives the translator's existing service-failure result.
        cloudTranslate.addInstructions(0, """
            new-instance v0, Lvtn;
            const/4 v1, 0x4
            invoke-direct {v0, v1}, Lvtn;-><init>(I)V
            invoke-static {v0}, Ladre;->l(Ljava/lang/Object;)Ladre;
            move-result-object v0
            return-object v0
        """.trimIndent())

        // ajao is the dedicated register-share request. Search, trends and image fetching share
        // this transport and still go through its original code. The share branch can reuse
        // the receiver register after the type check because it returns locally.
        tenor.addInstructionsWithLabels(0, """
            instance-of v0, p1, Lajao;
            if-eqz v0, :original
            invoke-static {}, Lahbv;->a()Lahbu;
            move-result-object v0
            const/16 p0, 0xcc
            invoke-virtual {v0, p0}, Lahbu;->c(I)V
            const/4 p0, 0x1
            invoke-virtual {v0, p0}, Lahbu;->f(Z)V
            invoke-virtual {v0}, Lahbu;->a()Lahbv;
            move-result-object v0
            invoke-static {v0}, Ladre;->l(Ljava/lang/Object;)Ladre;
            move-result-object v0
            return-object v0
        """.trimIndent(), ExternalLabel("original", tenor.getInstruction(0)))
    }
}

private fun MutableMethod.expectCall(target: String): MutableMethod = apply {
    check(implementation!!.instructions.any { it.isMethodReference(target) }) {
        "Telemetry submission binding changed: $target"
    }
}
