package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly

private val batchGbitResources = resourcePatch {
    execute {
        val icon = checkNotNull(object {}.javaClass.getResourceAsStream("/curve/batch_gbit.png"))
        icon.use { get("assets/morphe_batch_gbit.png", false).writeBytes(it.readBytes()) }
        for (name in listOf("morphe_batch_gbit", "morphe_batch_row", "morphe_batch_text", "morphe_batch_button")) {
            val source = checkNotNull(object {}.javaClass.getResourceAsStream("/curve/$name.xml"))
            source.use { get("res/layout/$name.xml", false).writeBytes(it.readBytes()) }
        }
        document("AndroidManifest.xml").use { manifest ->
            val app = manifest.getElementsByTagName("application").item(0)
            val android = "http://schemas.android.com/apk/res/android"
            for ((tag, name) in listOf("activity" to "BatchGbitActivity", "service" to "BatchGbitService")) {
                val node = manifest.createElement(tag)
                node.setAttributeNS(android, "android:name", "app.local.extension.curve.$name")
                node.setAttributeNS(android, "android:exported", "false")
                if (tag == "activity") {
                    node.setAttributeNS(android, "android:theme", "@style/Curve.AppTheme.NoActionBar")
                    node.setAttributeNS(android, "android:label", "Batch Go Back in Time")
                } else node.setAttributeNS(android, "android:foregroundServiceType", "dataSync")
                app.appendChild(node)
            }
        }
    }
}

@Suppress("unused")
val batchGbitPatch = bytecodePatch(
    name = "Batch Go Back in Time",
    description = "Adds Batch GBIT to Launchpad. Select purchases, choose one funding card and follow sequential moves in a foreground progress notification. Curve eligibility and fees still apply.",
    default = false
) {
    dependsOn(patchesMenuPatch, batchGbitResources)
    compatibleWith(Compatibility(name = "Curve Pay", packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM, appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))))
    execute {
        Fingerprint(definingClass = "Lapp/local/extension/curve/BatchGbitActivity;", name = "isIncluded",
            parameters = emptyList(), returnType = "Z", isStatic = true).matchSingle().method.returnEarly(true)
    }
}
