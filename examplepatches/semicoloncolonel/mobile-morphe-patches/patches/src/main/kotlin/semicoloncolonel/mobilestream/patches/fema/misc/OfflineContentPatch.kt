package semicoloncolonel.mobilestream.patches.fema.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.fema.shared.Constants

// FEMA 3.2.1 is a Capacitor web app. Its Prepare guides, featured
// categories, disaster declarations, and FAQ arrive as JSON through
// Capacitor's native HTTP plugin on every visit, and none of it is kept, so
// those pages are empty without a connection. The plugin's request runs in
// CapacitorHttp$1.run(); its call to HttpRequestHandler.request() now goes
// through OfflineCache, which saves each successful GET from FEMA's content
// hosts and returns the saved copy when the request fails.
//
// The guides' images load in the web view, not through the plugin.
// BridgeWebViewClient.shouldInterceptRequest() answers only for the app's
// own files, so for every other request its null result now goes through
// ImageCache, which saves FEMA's images and serves the saved copies.
//
// The resource patch adds two shortcuts to the app icon's long-press menu,
// "Save everything" and "Refresh saved content", which run OfflineSaveService
// in the foreground with a progress notification.

private const val HTTP_REQUEST_HANDLER = "Lcom/getcapacitor/plugin/util/HttpRequestHandler;"
private const val EXTENSION = "Lsemicoloncolonel/mobilestream/extension/fema"
private const val OFFLINE_CACHE = "$EXTENSION/OfflineCache;"
private const val IMAGE_CACHE = "$EXTENSION/ImageCache;"
private const val EXTENSION_CLASSES = "semicoloncolonel.mobilestream.extension.fema"
private const val SHORTCUTS = "msp_offline_shortcuts"
private const val FEMA_PACKAGE = "gov.fema.mobile.android"

internal object CapacitorHttpRunFingerprint : Fingerprint(
    definingClass = "Lcom/getcapacitor/plugin/CapacitorHttp\$1;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
)

internal object WebViewInterceptFingerprint : Fingerprint(
    definingClass = "Lcom/getcapacitor/BridgeWebViewClient;",
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
)

private val offlineShortcutsPatch = resourcePatch {
    execute {
        val shortcuts = get("res/xml/$SHORTCUTS.xml")
        shortcuts.parentFile.mkdirs()
        // The XML declaration must be the first characters of the file.
        shortcuts.writeText(
            listOf(
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>",
                "<shortcuts xmlns:android=\"http://schemas.android.com/apk/res/android\">",
                shortcut("msp_save_all", "msp_save_all", "SAVE_ALL"),
                shortcut("msp_refresh", "msp_refresh", "REFRESH"),
                "</shortcuts>",
            ).joinToString("\n"),
        )

        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            mapOf(
                "msp_save_all_short" to "Save all",
                "msp_save_all_long" to "Save everything for offline use",
                "msp_refresh_short" to "Refresh",
                "msp_refresh_long" to "Refresh saved content",
            ).forEach { (name, text) ->
                val string = document.createElement("string")
                string.setAttribute("name", name)
                string.textContent = text
                resources.appendChild(string)
            }
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element

            val declared = (0 until manifest.childNodes.length).mapNotNull {
                (manifest.childNodes.item(it) as? Element)?.getAttribute("android:name")
            }.toSet()
            listOf(
                "android.permission.FOREGROUND_SERVICE",
                "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
            ).filter { it !in declared }.forEach { name ->
                val permission = document.createElement("uses-permission")
                permission.setAttribute("android:name", name)
                manifest.insertBefore(permission, application)
            }

            val activity = document.createElement("activity")
            activity.setAttribute("android:name", "$EXTENSION_CLASSES.OfflineShortcutActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:excludeFromRecents", "true")
            activity.setAttribute("android:noHistory", "true")
            activity.setAttribute("android:taskAffinity", "")
            activity.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            application.appendChild(activity)

            val service = document.createElement("service")
            service.setAttribute("android:name", "$EXTENSION_CLASSES.OfflineSaveService")
            service.setAttribute("android:exported", "false")
            service.setAttribute("android:foregroundServiceType", "dataSync")
            application.appendChild(service)

            // The shortcuts belong to the launcher activity.
            val activities = application.getElementsByTagName("activity")
            val launcher = (0 until activities.length).map { activities.item(it) as Element }.firstOrNull { entry ->
                val categories = entry.getElementsByTagName("category")
                (0 until categories.length).any {
                    (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                }
            } ?: throw PatchException("Launcher activity not found")
            val metaData = document.createElement("meta-data")
            metaData.setAttribute("android:name", "android.app.shortcuts")
            metaData.setAttribute("android:resource", "@xml/$SHORTCUTS")
            launcher.appendChild(metaData)
        }
    }
}

private fun shortcut(id: String, label: String, action: String) = """
    <shortcut android:shortcutId="$id" android:enabled="true" android:icon="@mipmap/ic_launcher"
        android:shortcutShortLabel="@string/${label}_short" android:shortcutLongLabel="@string/${label}_long">
        <intent android:action="semicoloncolonel.mobilestream.fema.$action"
            android:targetPackage="$FEMA_PACKAGE"
            android:targetClass="$EXTENSION_CLASSES.OfflineShortcutActivity" />
    </shortcut>
""".trimIndent()

@Suppress("unused")
val offlineContentPatch = bytecodePatch(
    name = "Save content for offline use",
    description = "Keeps the Prepare guides, disaster declarations, and FAQ readable without a connection.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(offlineShortcutsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val method = CapacitorHttpRunFingerprint.method
        val index = method.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == HTTP_REQUEST_HANDLER && it.name == "request"
                } == true
        }
        if (index < 0) throw PatchException("HttpRequestHandler.request() call not found")

        val call = method.getInstruction<FiveRegisterInstruction>(index)
        method.replaceInstruction(
            index,
            "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE} }, " +
                "$OFFLINE_CACHE->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;",
        )
        val result = method.getInstruction<OneRegisterInstruction>(index + 1).registerA
        method.addInstruction(index + 2, "check-cast v$result, Lcom/getcapacitor/JSObject;")

        // Every return passes Capacitor's answer through ImageCache. The method
        // is three registers (this, a local that reuses the WebView's, and the
        // request), so all of them fit a 4-bit invoke.
        WebViewInterceptFingerprint.method.apply {
            if (implementation!!.registerCount > 16) throw PatchException("shouldInterceptRequest grew too large")
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            if (returns.isEmpty()) throw PatchException("shouldInterceptRequest return not found")
            returns.reversed().forEach { (returnIndex, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                addInstructions(
                    returnIndex,
                    """
                        invoke-static { p0, v$register, p2 }, $IMAGE_CACHE->intercept(Ljava/lang/Object;Landroid/webkit/WebResourceResponse;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}
