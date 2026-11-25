package patches.teletekst

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Prevents NOS/NPO analytics initialization, audience events, queued measurement uploads and tracking identifier creation. Uses the app's native empty tracker while preserving content, favourites, sharing and refresh.",
) {
    dependsOn(originalInput)
    compatibleWith(teletekst)
    execute {
        val method = guarded("Lnl/nos/teletekst/modules/AnalyticsModule;", "provideTracker(Landroid/content/Context;)Lnl/nos/analytics/Tracker;", 17, 4, 8)
        val sdk = method.instructions.elementAt(2)
        check(sdk.opcode == Opcode.NEW_INSTANCE && (sdk as ReferenceInstruction).reference.toString() == "Lnl/nos/teletekst/analytics/trackers/sdk/SdkTracker;")
        // Retain native context validation, then use the shipped non-null
        // aggregator with no delegates. No analytics SDK/queue is constructed.
        method.addInstructions(2, """
            const/4 v0, 0x0
            new-array v0, v0, [Lnl/nos/analytics/Tracker;
            new-instance v1, Lnl/nos/analytics/trackers/MultiTracker;
            invoke-direct {v1, v0}, Lnl/nos/analytics/trackers/MultiTracker;-><init>([Lnl/nos/analytics/Tracker;)V
            return-object v1
        """.trimIndent())
    }
}
