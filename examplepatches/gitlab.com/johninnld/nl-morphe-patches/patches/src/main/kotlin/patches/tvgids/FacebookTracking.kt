package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

internal val facebookResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val ns = "http://schemas.android.com/apk/res/android"
            val app = doc.getElementsByTagName("application").item(0) as Element
            val flags = setOf("com.facebook.sdk.AutoLogAppEventsEnabled", "com.facebook.sdk.AdvertiserIDCollectionEnabled")
            val metadata = doc.getElementsByTagName("meta-data")
            check((0 until metadata.length).none { (metadata.item(it) as Element).getAttributeNS(ns, "name") in flags }) {
                "TVgids original Facebook policy metadata changed"
            }
            flags.forEach { name -> app.appendChild(doc.createElement("meta-data").apply {
                setAttributeNS(ns, "android:name", name)
                setAttributeNS(ns, "android:value", "false")
            }) }
            val permissions = setOf("com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION", "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE")
            val nodes = doc.getElementsByTagName("uses-permission")
            val removed = (0 until nodes.length).map { nodes.item(it) as Element }
                .filter { it.getAttributeNS(ns, "name") in permissions }
            check(removed.size == 5 && removed.map { it.getAttributeNS(ns, "name") }.toSet() == permissions) {
                "TVgids original advertising permissions changed"
            }
            removed.forEach { doc.documentElement.removeChild(it) }
        }
    }
}

/** Keep Facebook core initialization/auth; stop optional events and attribution. */
internal val facebookTracking = bytecodePatch {
    dependsOn(originalInput, facebookResources)
    execute {
        exact("Lb86;", "b()Z", 25, 3, 16).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lb86;", "c()Z", 25, 3, 15).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lb86;", "a()Z", 17, 6, 59).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Ldt;", "q(Landroid/content/Context;)Ljava/lang/String;", 9, 8, 73)
            .addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
        exact("Lys;", "e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lb34;)V", 17, 17, 232)
            .addInstructions(0, "return-void")
        exact("Leu4;", "H()V", 9, 10, 39).addInstructions(0, "return-void")
        exact("Lns;", "c(I)V", 25, 4, 18).addInstructions(0, "return-void")
        exact("Lns;", "d(I)V", 25, 5, 42).addInstructions(0, "return-void")
        // The real sender has a nullable result; its caller already has a quiet
        // no-result branch. No flush-success event or timestamp is fabricated.
        exact("Lns;", "f(ILot8;)Ltz;", 25, 7, 44)
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        // Both modes are attribution/install processing. Preserve the separate
        // settings fetch/cache runner and its functional core/auth work below.
        exact("Lom1;", "run()V", 17, 14, 117).addInstructions(0, "return-void")
        exact("Lxn1;", "run()V", 17, 15, 261).apply {
            addInstructionsWithLabels(160, "goto/32 :afterDevicePing",
                ExternalLabel("afterDevicePing", getInstruction(168)))
            addInstructionsWithLabels(138, "goto/32 :afterInstallPing",
                ExternalLabel("afterInstallPing", getInstruction(144)))
        }
    }
}
