package patches.rollerbank

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

internal val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val permissionNames = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION", "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")
            val nodes = manifest.getElementsByTagName("uses-permission")
            val permissions = (0 until nodes.length).map { nodes.item(it) as Element }
                .filter { it.getAttribute("android:name") in permissionNames }
            check(permissions.map { it.getAttribute("android:name") }.toSet() == permissionNames)
            permissions.forEach { it.parentNode.removeChild(it) }
            val metadataNodes = manifest.getElementsByTagName("meta-data")
            val metadata = (0 until metadataNodes.length).map { metadataNodes.item(it) as Element }
            val sessions = metadata.filter { it.getAttribute("android:name") ==
                "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar" }
            check(sessions.size == 1) { "Rollerbank Firebase Sessions registrar changed" }
            sessions.single().parentNode.removeChild(sessions.single())
            mapOf("firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false", "firebase_sessions_enabled" to "false",
                "delivery_metrics_exported_to_big_query_enabled" to "false").forEach { (name, value) ->
                check(metadata.none { it.getAttribute("android:name") == name })
                val node = manifest.createElement("meta-data")
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", name)
                node.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", value)
                application.appendChild(node)
            }
        }
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Includes ad removal. Disables optional Analytics, Crashlytics identifiers and reports, queued Google SDK diagnostics and Firebase Sessions. Retains functional push, authentication and report submission.",
) {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(rollerbank)
    execute {
        // Acknowledge optional CCT telemetry so persisted batches drain without retry.
        // Incoming FCM and installation registration use separate transports.
        guarded("Lo50;", "a(Luq;)Lvq;", 17, 39, 398).addInstructions(0, """
            new-instance v0, Lvq;
            sget-object v1, Lqu${'$'}a;->a:Lqu${'$'}a;
            const-wide/16 v2, 0x0
            invoke-direct {v0, v1, v2, v3}, Lvq;-><init>(Lqu${'$'}a;J)V
            return-object v0
        """.trimIndent())
        guarded("Lcom/google/firebase/analytics/FirebaseAnalytics;", "a(Ljava/lang/String;Landroid/os/Bundle;)V", 17, 11, 12)
            .addInstructions(0, "return-void")
        guarded("Ls91;", "b(Ljava/lang/String;)V", 17, 6, 11).addInstructions(0, "return-void")
        guarded("Ls91;", "c(Ljava/lang/Throwable;)V", 17, 4, 14).addInstructions(0, "return-void")
        guarded("Ls91;", "d(Ljava/lang/String;Ljava/lang/String;)V", 17, 5, 7).addInstructions(0, "return-void")
        val auth = guarded("Lcom/dennisk/rollerbank/url/CallbackHandler\$a;", "onSuccess(Ljava/lang/Object;)V", 17, 11, 67)
        listOf(23, 44).forEach { index ->
            val call = auth.getInstruction<ReferenceInstruction>(index)
            check(call.opcode == Opcode.INVOKE_STATIC && call.reference.toString() ==
                "Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I")
            auth.replaceInstruction(index, "nop")
        }
        // TRUE explicitly sends cached reports even with automatic collection off.
        listOf(Triple("${APP}ActivityMain;", 10, 212), Triple("Lon2;", 6, 46), Triple("Lqn2;", 5, 32))
            .forEach { (owner, registers, count) ->
                val main = owner.endsWith("ActivityMain;")
                val method = guarded(owner, if (main) "onCreate(Landroid/os/Bundle;)V" else "a(Ljg1;)V", 17, registers, count)
                val index = if (main) 70 else if (owner == "Lon2;") 39 else 21
                val gate = method.getInstruction<ReferenceInstruction>(index - 1)
                val decision = method.getInstruction<ReferenceInstruction>(index)
                check(gate.opcode == Opcode.IGET_OBJECT && gate.reference.toString() == "Lim0;->p:Lei4;")
                check(decision.opcode == Opcode.SGET_OBJECT && decision.reference.toString() == "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")
                val register = (decision as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "sget-object v$register, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
            }
    }
}
