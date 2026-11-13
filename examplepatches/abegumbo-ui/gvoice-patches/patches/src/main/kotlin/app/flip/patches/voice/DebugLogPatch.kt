package app.flip.patches.voice

import app.flip.patches.voice.Constants.COMPATIBILITY_GOOGLE_VOICE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.AccessFlags

private const val VOICE_LOG = "Lapp/flip/voicelog/VoiceLog;"

/** FirebaseMessagingService.handleIntent(Intent), obfuscated name. */
internal object FirebaseMessagingHandleIntentFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/messaging/FirebaseMessagingService;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
)

@Suppress("unused")
val debugLogPatch = patch(
    name = "Debug log",
    description = "Saves the app's own log to Downloads/voice-logcat-<time>.txt each time the app starts, " +
        "including every push message it receives. For troubleshooting only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_VOICE)

    dependsOn(gmsCoreSupportPatch)

    extendWith("extensions/voicelog.mpe")

    execute {
        FirebaseMessagingHandleIntentFingerprint.method.apply {
            // The Intent parameter is the last register (p0 = this, p1 = intent).
            val intentRegister = implementation!!.registerCount - 1
            addInstruction(
                0,
                "invoke-static/range { v$intentRegister .. v$intentRegister }, " +
                    "$VOICE_LOG->onPush(Landroid/content/Intent;)V",
            )
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            val packageName = manifest.root.attribute("package")!!
            manifest.elements("application").first().appendChild("provider") {
                setAttribute("android:name", "app.flip.voicelog.VoiceLog")
                setAttribute("android:authorities", "$packageName.voicelog")
                setAttribute("android:exported", "false")
                setAttribute("android:initOrder", "2147483646")
            }
        }
    }
}
