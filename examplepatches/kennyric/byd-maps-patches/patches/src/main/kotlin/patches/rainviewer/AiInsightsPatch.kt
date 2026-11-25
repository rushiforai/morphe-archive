package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAiInsights = bytecodePatch(
    name = "Hide AI insights",
    description = "Removes the forecast AI tab and summary panel, retaining the normal temperature forecast. Stops automatic assistant requests.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility)
    execute {
        // Gone is the shipped summary-toggle state. Applying it at the view-model
        // value constructor also handles cached AI selection and later emissions.
        exact("Lif2;", "<init>", "V", "Lbl7;", "Lri6;", "Ljava/util/TimeZone;", "Ljava/lang/String;",
            "Lf9;", "Lzw4;", "Luw4;", "Lhw4;", "Lsx5;", "Lvv2;", "Lgc2;", "Lic2;", "Ljava/lang/Long;", "Lfc2;",
            "Z", "Z", "Z", "Z", "Z", "Z", "Lf24;", "Lq97;", "Z", "Ly6a;")
            .addInstructions(0, "sget-object p2, Lpi6;->b:Lpi6;")
        exact("Lsh2;", "f", "V", "Z").addInstructions(0, "return-void")
    }
}
