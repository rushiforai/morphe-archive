package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val firebaseResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val ns = "http://schemas.android.com/apk/res/android"
            val name = "delivery_metrics_exported_to_big_query_enabled"
            val metadata = doc.getElementsByTagName("meta-data")
            check((0 until metadata.length).none {
                (metadata.item(it) as Element).getAttributeNS(ns, "name") == name
            }) { "TVgids original FCM export metadata changed" }
            (doc.getElementsByTagName("application").item(0) as Element).appendChild(
                doc.createElement("meta-data").apply {
                    setAttributeNS(ns, "android:name", name)
                    setAttributeNS(ns, "android:value", "false")
                })
        }
    }
}

/** Optional FCM measurement only; keep tokens, topics, auto-init and delivery. */
internal val firebaseTracking = bytecodePatch {
    dependsOn(originalInput, firebaseResources)
    execute {
        exact("Lqs;", "O()Z", 9, 6, 40).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lqs;", "k0(Landroid/content/Intent;)Z", 9, 4, 21)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lqs;", "c0(Landroid/content/Intent;)V", 9, 23, 296).addInstructions(0, "return-void")
        exact("Lqs;", "d0(Ljava/lang/String;Landroid/os/Bundle;)V", 9, 7, 122)
            .addInstructions(0, "return-void")
        // This listener contains only notification analytics/deduplication.
        // Flutter's functional notification-open handling is a separate path.
        exact("Lnn1;", "onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V", 17, 6, 79)
            .addInstructions(0, "return-void")
        // Clamp only the exported-metrics preference write. Keep the real
        // apply(), proxy-retention update and Task completion; other merged
        // cases still implement topic subscriptions, auto-init and messaging.
        exact("Lpu1;", "run()V", 17, 7, 123).addInstructions(85, "const/4 p0, 0x0")
    }
}
