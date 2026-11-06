package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Disables Google Firebase Analytics collection and removes the Firebase
 * Cloud Messaging (push notification) components from the app.
 *
 * The manifest changes mirror what the original smali pipeline did:
 *  - add `firebase_analytics_collection_deactivated=true`
 *  - add `google_analytics_adid_collection_enabled=false`
 *  - remove FCM receivers/services and Google Analytics measurement components
 */
private val disableFirebaseManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        val manifest = get("AndroidManifest.xml")
        val content = manifest.readText()

        // Self-closing measurement components.
        var patched = content.replace(
            Regex(
                """<receiver[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementReceiver"[^>]*/>"""
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementService"[^>]*/>"""
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementJobService"[^>]*/>"""
            ),
            ""
        )

        // Multi-line FCM components (service / receiver with intent-filter children).
        patched = patched.replace(
            Regex(
                """\s*<service[^>]*android:name="mam\.reader\.ilibrary\.fcm\.MyFirebaseMessagingService"[^>]*>.*?</service>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """\s*<service[^>]*android:name="com\.google\.firebase\.messaging\.FirebaseMessagingService"[^>]*>.*?</service>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """\s*<receiver[^>]*android:name="com\.google\.firebase\.iid\.FirebaseInstanceIdReceiver"[^>]*>.*?</receiver>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )

        // FCM default notification channel meta-data can stay; it is inert.
        manifest.writeText(patched)

        // Add analytics deactivation meta-data to the <application> element.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            fun addMetaData(name: String, value: String) {
                val meta = document.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
            addMetaData("firebase_analytics_collection_deactivated", "true")
            addMetaData("google_analytics_adid_collection_enabled", "false")
        }
    }
}

/**
 * The app registers the FCM token in LandingPageAct (B() in 2.1.4, C() in
 * 2.1.6) right after creating notification channels. With the FCM service
 * removed from the manifest the token registration is pointless and can
 * throw, so we skip only the token block.
 *
 * 2.1.6 C()V layout:
 *   insns 0..55   notification-channel creation      (kept)
 *   insns 56..57  FirebaseApp null checks            (harmless)
 *   insns 58..68  FirebaseMessaging block            (removed)
 *   insn  69      return-void
 *
 * Inserting `return-void` at index 0 would also kill channel creation. The
 * whole Firebase block is deleted instead, so execution falls through to the
 * method's own trailing return-void. Inline smali cannot express numeric
 * branch offsets ("goto +25" fails to lex), and labels only work inside the
 * added snippet, so deletion is the clean approach.
 */
private val neuterLandingPageFcmPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        val method = LandingPageFcmTokenFingerprint.methodOrNull
            ?: LandingPageFcmTokenFingerprintV216.methodOrNull
            ?: throw IllegalStateException("LandingPageAct FCM method not found")

        val instructions = method.instructionsOrNull?.toList() ?: emptyList()

        val firebaseIdx = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_CLASS &&
                (it as? ReferenceInstruction)?.reference.toString().contains("FirebaseMessaging")
        }

        val returnIdx = (firebaseIdx until instructions.size)
            .firstOrNull { instructions[it].opcode == Opcode.RETURN_VOID }
            ?: -1

        if (firebaseIdx > 0 && returnIdx > firebaseIdx) {
            method.removeInstructions(firebaseIdx, returnIdx - firebaseIdx)
        } else {
            // Layout unexpected — fall back to neutering the whole method.
            // Channels get recreated on every activity launch in this app.
            method.addInstruction(0, "return-void")
        }
    }
}

val disableFirebaseTrackingPatch = bytecodePatch(
    name = "Disable Firebase Analytics and FCM",
    description = "Disables Google Firebase Analytics tracking and removes Firebase Cloud Messaging push notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    dependsOn(
        disableFirebaseManifestPatch,
        neuterLandingPageFcmPatch,
    )

    execute { }
}
