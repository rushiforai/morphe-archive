package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val root = "Lcom/horizon/android/"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressCoreMeasurement() {
    // Include property/command admission: stopping only event senders would
    // otherwise leave per-event parameter keys accumulating in three maps.
    val sinks = listOf(
        Triple("b(Ljava/util/LinkedHashMap;)V", 10, 214),
        Triple("g(${root}core/tracking/analytics/SendEventCommand;)V", 12, 36),
        Triple("i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;)V", 12, 113),
        Triple("j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", 12, 138),
        Triple("k(${root}core/tracking/analytics/SendPageViewCommand;)V", 5, 15),
        Triple("m(Ljava/lang/String;${root}core/tracking/analytics/AnalyticsPageType;Ljava/util/Map;)V", 8, 105),
        Triple("n(Ljava/lang/String;Ljava/lang/String;)V", 4, 7),
        Triple("o(Ljava/lang/String;Ljava/lang/String;)V", 3, 5),
        Triple("p(${root}core/tracking/analytics/SetParametersCommand;)V", 4, 21),
    )
    for ((signature, registers, count) in sinks) {
        exact("Lcz9;", signature, 17, registers, count).addInstructions(0, "return-void")
    }
    // Reuse the app's real denied-consent wrapper for all grant combinations.
    // Consent persistence/UI and the enabled wrapper's privacy APIs stay intact.
    exact("Lei;", "d(ZZLkm6;)Lwq;", 9, 6, 40).addInstructions(0, """
        new-instance v0, Luq;
        invoke-direct {v0}, Ljava/lang/Object;-><init>()V
        return-object v0
    """.trimIndent())
    exact("${root}core/tracking/config/a;", "m()Z", 17, 2, 7)
        .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

    val gaid = "${root}core/tracking/gaid/a;"
    val unavailable = "const/4 v0, 0x0\niput-object v0, p0, $gaid->a:Ljava/lang/String;\nreturn-void"
    exact(gaid, "a($gaid)V", 25, 2, 14).addInstructions(0, unavailable)
    exact(gaid, "b()V", 17, 5, 11).addInstructions(0, unavailable)

    exact("Lc8h;", "a(Landroidx/fragment/app/w;Ljava/lang/String;)V", 9, 3, 5)
        .addInstructions(0, "return-void")
    val resume = exact("Lwg;", "onActivityResumed(Landroid/app/Activity;)V", 17, 13, 308)
    val first = resume.getInstruction(146)
    val successor = resume.getInstruction(182)
    check(first.opcode == Opcode.SGET_OBJECT && (first as? ReferenceInstruction)?.reference.toString() == "Lc8h;->a:Lkotlin/Lazy;")
    check(successor.opcode == Opcode.INVOKE_INTERFACE &&
        (successor as? ReferenceInstruction)?.reference.toString() == "Lz68;->getKoin()Lv68;") {
        "Marktplaats UserZoom lifecycle slice changed"
    }
    resume.addInstructionsWithLabels(146, "goto/16 :functional_resume", ExternalLabel("functional_resume", successor))
}
