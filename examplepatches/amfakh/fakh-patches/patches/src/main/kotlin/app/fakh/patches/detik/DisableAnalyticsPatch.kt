package app.fakh.patches.detik

import app.fakh.patches.detik.shared.Constants.COMPATIBILITY_DETIK
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Detik Analytics' screen view recorder; ending a screen and scheduling the upload both follow from it. */
private object DetikScreenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/detikcom/detik_analytics/api/model/Screen;"),
    strings = listOf("START SCREEN"),
)

/** Detik Analytics' event recorder. */
private object DetikEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/detikcom/detik_analytics/api/model/DetikAnalyticsEvent;"),
    strings = listOf("event"),
)

/** The article page builder, which passes the Android ID to the live reader counter script. */
private object ArticlePageFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("android_id", "background-color:transparent;"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops Detik Analytics from recording screens and events, keeps the Android ID out of article pages, " +
        "and turns off Firebase Analytics, Crashlytics, Performance and Sessions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DETIK)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        DetikScreenFingerprint.method.addInstruction(0, "return-void")
        DetikEventFingerprint.method.addInstruction(0, "return-void")

        val page = ArticlePageFingerprint.method
        val androidId = page.instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/provider/Settings\$Secure;" && reference.name == "getString"
        }
        if (androidId < 0) throw PatchException("detikcom: the Android ID read was not found in the article page builder.")
        val result = page.instructions.elementAt(androidId + 1) as OneRegisterInstruction
        page.addInstruction(androidId + 2, "const-string v${result.registerA}, \"\"")
    }
}
