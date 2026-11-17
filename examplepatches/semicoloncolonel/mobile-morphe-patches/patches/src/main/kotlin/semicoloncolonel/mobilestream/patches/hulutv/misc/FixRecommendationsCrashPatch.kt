package semicoloncolonel.mobilestream.patches.hulutv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// WKFrecommendationsService is the receiver that clears Hulu's home-screen
// recommendations. It queries the TV provider for its preview programs and
// loops over the cursor without checking it. Where the TV provider is missing,
// as on a phone, the query returns null and the app crashes at launch with a
// NullPointerException on Cursor.moveToNext() (reported in tv-morphe-patches#1).
// This returns early when the cursor is null. On a TV the cursor is never null,
// so nothing changes there.
internal object RecommendationsReceiveFingerprint : Fingerprint(
    definingClass = "Lcom/hulu/livingroomplus/WKFrecommendationsService;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
)

// A dependency of every Hulu (Android TV) patch.
val fixRecommendationsCrashPatch = bytecodePatch {
    execute {
        val method = RecommendationsReceiveFingerprint.method
        val query = method.implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/content/ContentResolver;" && reference.name == "query"
        }
        if (query < 0) throw PatchException("The preview program query was not found.")
        val cursor = method.getInstruction<OneRegisterInstruction>(query + 1).registerA
        method.addInstructionsWithLabels(
            query + 2,
            """
                if-nez v$cursor, :cursor_ok
                return-void
                :cursor_ok
                nop
            """,
        )
    }
}
