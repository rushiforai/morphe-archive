package patches.detijd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.shared.uniqueMatch

internal val nativePromotions = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val statuses = Fingerprint(
            definingClass = "Lau/i3;", name = "<clinit>", strings = listOf("SKIP", "NOT_READY", "READY"),
        ).uniqueMatch().classDef
        check(statuses.fields.single { it.name == "SKIP" }.type == "Lau/i3;") {
            "De Tijd in-app schedule completion type changed"
        }
        // Message-only readiness: action schedules, notification delivery and
        // manual message-center/preferences are separate paths and stay intact.
        // SKIP runs the SDK's disposition and preparer/asset cleanup; NOT_READY
        // would keep the campaign waiting instead of finishing it.
        nativeMethod("Lsu/n;", "k(Lsu/x;Lau/b3;)Lau/i3;", 12, 55,
            listOf("data", "preparedScheduleInfo")).addInstructions(0, """
            sget-object v0, Lau/i3;->SKIP:Lau/i3;
            return-object v0
        """.trimIndent())
    }
}
