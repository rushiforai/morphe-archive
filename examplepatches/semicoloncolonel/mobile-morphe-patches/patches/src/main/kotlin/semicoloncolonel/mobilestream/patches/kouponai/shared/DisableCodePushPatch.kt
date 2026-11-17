package semicoloncolonel.mobilestream.patches.kouponai.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 receives new JavaScript over the air through its own CodePush
// server (codepush-koupon.azurewebsites.net), several times a week. A
// downloaded bundle would replace the patched one in the APK, so every patch
// that edits the bundle depends on this one.
//
//   1. CodePushServerUrl points at a closed local port, so update checks fail
//      the way an offline check does and nothing is downloaded.
//   2. CodePushUpdateManager.getCurrentPackageBundlePath answers null, so
//      CodePush always loads the bundle that shipped in the APK, even when an
//      update was downloaded before the app was patched.
//
// The app then always runs the JavaScript of the APK it was patched from.
// ─────────────────────────────────────────────────────────────────────────────

private const val CLOSED_PORT = "http://127.0.0.1:9"

internal object CurrentPackageBundlePathFingerprint : Fingerprint(
    definingClass = "Lcom/microsoft/codepush/react/CodePushUpdateManager;",
    name = "getCurrentPackageBundlePath",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
)

private val codePushServerPatch = resourcePatch {
    execute {
        var changed = 0
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val string = strings.item(i) as Element
                if (string.getAttribute("name") == "CodePushServerUrl") {
                    string.textContent = CLOSED_PORT
                    changed++
                }
            }
        }
        if (changed == 0) throw PatchException("Koupon: CodePushServerUrl not found")
    }
}

internal val disableCodePushPatch = bytecodePatch {
    dependsOn(codePushServerPatch)

    execute {
        CurrentPackageBundlePathFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )
    }
}
