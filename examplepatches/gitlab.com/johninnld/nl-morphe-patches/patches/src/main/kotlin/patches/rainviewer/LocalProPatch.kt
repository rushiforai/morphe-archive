package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val localPro = bytecodePatch(
    name = "Enable local Pro features",
    description = "Uses Pro client controls while keeping map and forecast requests within Free limits. Includes Disable tracking and Hide AI insights. Purchases and server entitlements remain unchanged; paid data may be unavailable.",
    default = true,
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility, disableTracking, hideAiInsights)
    execute {
        // V2 is the shipped enum whose wire name is "pro". Let the original
        // capability factory update its flows, including coroutine resumptions.
        // Keep the publisher purchase repository and billing workers intact.
        exact("Leh5;", "j", "Ljava/lang/Object;", "Lft0;", "Lhw7;", "Z")
            .addInstructions(0, "sget-object p2, Lhw7;->e:Lhw7;")

        // The same flows also feed request builders. Bound the request model before
        // its cache identity is computed, preserving the observed Free wire shape.
        // The final boolean parameter is safe scratch until it is forced false.
        exact("Lcom/lucky_apps/data/radarsmap/entity/request/MapsRequest;", "<init>", "V", "I", "I", "I", "I", "I", "Z")
            .addInstructions(0, """
                const/16 p6, 0x5460
                if-le p1, p6, :pastWithinFree
                move p1, p6
                :pastWithinFree
                const/16 p6, 0x1c20
                if-le p2, p6, :nowcastWithinFree
                move p2, p6
                :nowcastWithinFree
                const/16 p6, 0x12c
                if-ge p3, p6, :stepWithinFree
                move p3, p6
                :stepWithinFree
                const p6, 0x15180
                if-le p5, p6, :modelWithinFree
                move p5, p6
                :modelWithinFree
                const/4 p6, 0x0
            """.trimIndent())
        exact("Lcom/lucky_apps/common/data/forecasts/entity/ForecastRequest;", "<init>", "V", "I", "D", "D", "Z", "Z", "Z")
            .addInstructions(0, "const/4 p6, 0x0\nconst/4 p7, 0x0\nconst/4 p8, 0x0")
        // Keep the client's expected frame cadence aligned with the Free request
        // step, even when the exposed Pro setting offers two-minute frames.
        exact("Lm04;", "k", "I").addInstructions(0, "const/16 v0, 0x12c\nreturn v0")
    }
}
