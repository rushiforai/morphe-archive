package app.flip.patches.voice

import app.flip.patches.voice.Constants.COMPATIBILITY_GOOGLE_VOICE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

private const val CALL_WAKE = "Lapp/flip/callfix/CallWake;"

@Suppress("unused")
val incomingCallFixPatch = patch(
    name = "Incoming call fix",
    description = "Makes incoming calls ring with MicroG. MicroG can't wake the app for calls like Google Play " +
        "Services does, so the app briefly shows an invisible overlay when a call comes in. Needs \"Appear on top\", " +
        "which the app asks for once.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_VOICE)

    dependsOn(gmsCoreSupportPatch)

    extendWith("extensions/callfix.mpe")

    execute {
        FirebaseMessagingHandleIntentFingerprint.method.apply {
            // p0 = the service (a Context), p1 = the push Intent: the last two registers.
            val first = implementation!!.registerCount - 2
            addInstruction(
                0,
                "invoke-static/range { v$first .. v${first + 1} }, " +
                    "$CALL_WAKE->onPush(Landroid/content/Context;Landroid/content/Intent;)V",
            )
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            val root = manifest.root
            val application = manifest.elements("application").first()
            val packageName = root.attribute("package")!!

            val hasPermission = manifest.elements("uses-permission")
                .any { it.attribute("android:name") == "android.permission.SYSTEM_ALERT_WINDOW" }
            if (!hasPermission) {
                root.insertChild(application.index, "uses-permission") {
                    setAttribute("android:name", "android.permission.SYSTEM_ALERT_WINDOW")
                }
            }

            application.appendChild("provider") {
                setAttribute("android:name", "app.flip.callfix.CallWake")
                setAttribute("android:authorities", "$packageName.callwake")
                setAttribute("android:exported", "false")
            }
        }
    }
}
