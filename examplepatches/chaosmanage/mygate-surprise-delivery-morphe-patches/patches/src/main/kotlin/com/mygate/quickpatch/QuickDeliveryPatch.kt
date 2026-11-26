package com.mygate.quickpatch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.patch

private val onlyMygate731 = Compatibility(
    name = "MyGate",
    packageName = "com.mygate.user",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "7.31.0")),
)

@Suppress("unused")
val surpriseDeliveryOneTap = patch(
    name = "One-Tap Surprise Delivery (1 Hour)",
    description = "Turns MyGate Security widget into a one-tap, one-hour Surprise Delivery pre-approval. Uses MyGate's existing login.",
    default = true,
) {
    compatibleWith(onlyMygate731)
    extendWith("mygate_quickapprove_extension.dex")

    execute {
        // Keep MyGate's own secure OkHttp transport. Only when Android DNS fails to resolve
        // ack.mygate.in, use the hostname's current edge IPs; TLS hostname verification remains on.
        // The fallback resolver is installed on ServiceGenerator's client (not a global DNS hook).
        val serviceGenerator = mutableClassDefBy("Lcom/mygate/user/rest/ServiceGenerator;")
        val retrofitFactory = serviceGenerator.methods.single { it.name == "b" && it.parameterTypes.size == 2 }
        val builderCtorIndex = retrofitFactory.implementation!!.instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lokhttp3/OkHttpClient\$Builder;-><init>()V"
        }
        require(builderCtorIndex >= 0) { "MyGate 7.31.0 OkHttp builder constructor not found" }
        retrofitFactory.addInstructions(builderCtorIndex + 1, """
            new-instance v2, Lcom/mygate/user/quickapprove/FallbackDns;
            invoke-direct {v2}, Lcom/mygate/user/quickapprove/FallbackDns;-><init>()V
            iput-object v2, v1, Lokhttp3/OkHttpClient${'$'}Builder;->k:Lokhttp3/Dns;
        """.trimIndent())

        val receiver = mutableClassDefBy("Lcom/mygate/user/common/appwidget/security/SecurityWidgetReceiver;")
        val onReceive = receiver.methods.single { it.name == "onReceive" }
        onReceive.addInstructions(0, """
            invoke-static {p2}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->isQuickApproveAction(Landroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :quickapprove_original_receive
            invoke-static {p1, p2}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->onWidgetClick(Landroid/content/Context;Landroid/content/Intent;)V
            return-void
            :quickapprove_original_receive
            nop
        """.trimIndent())

        val onUpdate = receiver.methods.single { it.name == "onUpdate" }
        onUpdate.addInstructions(0, """
            const-string v0, "APPROVE\nDELIVERY"
            invoke-static {p1, v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
            return-void
        """.trimIndent())

        // Preserve the original HTTP exception type and its first 37 message characters
        // ONLY for the widget's one pending approval, instead of the generic MyGate network error.
        val callback = mutableClassDefBy("Lcom/mygate/user/modules/notifygate/engine/NotifyGateEngine\$6;")
        val onHttpFailure = callback.methods.single { it.name == "h" && it.parameterTypes.size == 2 }
        onHttpFailure.addInstructions(0, """
            invoke-static {p1, p2}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->networkFailureDetails(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """.trimIndent())

        // Updates after launcher resizes should never restore the old Raise Alert Glance UI.
        val onOptions = receiver.methods.single { it.name == "onAppWidgetOptionsChanged" }
        onOptions.addInstructions(0, """
            const-string v0, "APPROVE\nDELIVERY"
            invoke-static {p1, v0}, Lcom/mygate/user/quickapprove/QuickApproveWidget;->updateWidgets(Landroid/content/Context;Ljava/lang/String;)V
            return-void
        """.trimIndent())

        // Add a native Android RemoteViews layout, icon and picker preview. No web views / overlay permissions.
        val resourceLoader = object {}.javaClass.classLoader
        for ((source, target) in listOf(
            "qa_widget_layout.xml" to "res/layout/qa_widget.xml",
            "qa_widget_bg.xml" to "res/drawable/qa_widget_bg.xml",
            "qa_widget_icon.png" to "res/drawable/qa_widget_icon.png",
            "qa_widget_preview.png" to "res/drawable/qa_widget_preview.png",
        )) {
            val bytes = resourceLoader.getResourceAsStream(source)?.use { it.readBytes() }
                ?: error("Bundled widget resource not found: $source")
            resourceFile(target, copy = false).writeBytes(bytes)
        }

        resourceXml("res/values/strings.xml", copy = false).use { strings ->
            strings.root.appendChild("string") {
                setAttribute("name", "qa_widget_description")
                text = "Approve a surprise delivery for the next 1 hour"
            }
        }

        document("AndroidManifest.xml").use { doc ->
            val receivers = doc.getElementsByTagName("receiver")
            val found = (0 until receivers.length)
                .map { receivers.item(it) as org.w3c.dom.Element }
                .single { it.getAttribute("android:name") == "com.mygate.user.common.appwidget.security.SecurityWidgetReceiver" }
            found.setAttributeNS("http://schemas.android.com/apk/res/android", "android:label", "Approve Delivery")
        }

        // Widget provider XML is shipped in two versions on MyGate 7.31.0.
        for (path in listOf("res/xml/app_widget_info.xml", "res/xml-v31/app_widget_info.xml")) {
            document(path).use { doc ->
                val root = doc.documentElement
                val ns = "http://schemas.android.com/apk/res/android"
                root.setAttributeNS(ns, "android:minWidth", "48dp")
                root.setAttributeNS(ns, "android:minHeight", "48dp")
                root.setAttributeNS(ns, "android:updatePeriodMillis", "0")
                root.setAttributeNS(ns, "android:initialLayout", "@layout/qa_widget")
                root.setAttributeNS(ns, "android:previewImage", "@drawable/qa_widget_preview")
                root.setAttributeNS(ns, "android:description", "@string/qa_widget_description")
                if (path.contains("xml-v31")) {
                    root.setAttributeNS(ns, "android:targetCellWidth", "1")
                    root.setAttributeNS(ns, "android:targetCellHeight", "1")
                    root.setAttributeNS(ns, "android:previewLayout", "@layout/qa_widget")
                }
            }
        }
    }
}
