package dev.rikunode.futatabi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * The initial ContentProvider runs before FlutterActivity and starts the
 * read-only loopback server. Clone app can execute in either order: the
 * provider authority is derived from the current manifest package, and the
 * runtime never relies on a hardcoded provider authority.
 */
private val bridgeManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw IllegalStateException("futatabi: application manifest element missing")
            // The extension is injected as dex, so set this on the actual target manifest too.
            application.setAttribute("android:allowBackup", "false")
            val providerName = "dev.rikunode.futatabi.bridge.FutatabiProvider"
            val providers = manifest.getElementsByTagName("provider")
            if ((0 until providers.length).none {
                    (providers.item(it) as? Element)?.getAttribute("android:name") == providerName
                }
            ) {
                val provider = document.createElement("provider")
                provider.setAttribute("android:name", providerName)
                provider.setAttribute("android:authorities",
                    manifest.getAttribute("package") + ".futatabi.init")
                provider.setAttribute("android:exported", "false")
                provider.setAttribute("android:initOrder", "100")
                application.appendChild(provider)
            }
            val activityName = "dev.rikunode.futatabi.bridge.FutatabiHomeActivity"
            val activities = manifest.getElementsByTagName("activity")
            if ((0 until activities.length).none {
                    (activities.item(it) as? Element)?.getAttribute("android:name") == activityName
                }
            ) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", activityName)
                // Internal catalog login button opens this Activity explicitly.
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label", "futatabi")
                application.appendChild(activity)
            }
            val replyName = "dev.rikunode.futatabi.bridge.ThreadReplyActivity"
            if ((0 until activities.length).none {
                    (activities.item(it) as? Element)?.getAttribute("android:name") == replyName
                }
            ) {
                val reply = document.createElement("activity")
                reply.setAttribute("android:name", replyName)
                reply.setAttribute("android:exported", "false")
                reply.setAttribute("android:label", "futatabi")
                application.appendChild(reply)
            }
            val aimogeLogin = "dev.rikunode.futatabi.bridge.AimogeLoginActivity"
            if ((0 until activities.length).none {
                    (activities.item(it) as? Element)?.getAttribute("android:name") == aimogeLogin
                }
            ) {
                val login = document.createElement("activity")
                login.setAttribute("android:name", aimogeLogin)
                login.setAttribute("android:exported", "false")
                login.setAttribute("android:label", "Aimoge login")
                application.appendChild(login)
            }
            val readerName = "dev.rikunode.futatabi.bridge.MebukiReaderActivity"
            if ((0 until activities.length).none {
                    (activities.item(it) as? Element)?.getAttribute("android:name") == readerName
                }
            ) {
                val reader = document.createElement("activity")
                reader.setAttribute("android:name", readerName)
                reader.setAttribute("android:exported", "false")
                reader.setAttribute("android:label", "Mebuki")
                application.appendChild(reader)
            }
            val mebukiLogin = "dev.rikunode.futatabi.bridge.MebukiLoginActivity"
            val matching = manifest.getElementsByTagName("activity")
            if ((0 until matching.length).none {
                    (matching.item(it) as? Element)?.getAttribute("android:name") == mebukiLogin
                }
            ) {
                val login = document.createElement("activity")
                login.setAttribute("android:name", mebukiLogin)
                login.setAttribute("android:exported", "false")
                login.setAttribute("android:label", "Mebuki login")
                application.appendChild(login)
            }
            val newThread = "dev.rikunode.futatabi.bridge.MebukiNewThreadActivity"
            if ((0 until matching.length).none {
                    (matching.item(it) as? Element)?.getAttribute("android:name") == newThread
                }
            ) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", newThread)
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label", "Mebuki")
                activity.setAttribute("android:configChanges", "orientation|screenSize|keyboardHidden")
                application.appendChild(activity)
            }
            val animanchPicker = "dev.rikunode.futatabi.bridge.AnimanchNewThreadActivity"
            if ((0 until matching.length).none {
                    (matching.item(it) as? Element)?.getAttribute("android:name") == animanchPicker
                }
            ) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", animanchPicker)
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label", "あにまん")
                activity.setAttribute("android:configChanges", "orientation|screenSize|keyboardHidden")
                application.appendChild(activity)
            }
        }
    }
}

@Suppress("unused")
val bridgePatch = bytecodePatch(
    name = "Local board bridge",
    description = "Auto-register boards and run the local bridge with protected stock reading, replies and new threads (ARM64).",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "futatter",
            packageName = "com.Nanasaki.ftutter",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
        )
    )
    dependsOn(bridgeManifestPatch, threadReplyResources)
    extendWith("extensions/futatter.mpe")
    execute {
        // Only the reserved relative asset-path signal is consumed; normal URLs
        // keep the original URL-launcher implementation.
        val clazz = mutableClassDefByOrNull("Lh6/i;")
            ?: throw PatchException("futatabi: URL launcher class missing")
        if (clazz.fields.none { it.name == "c" && it.type == "Landroid/app/Activity;" })
            throw PatchException("futatabi: URL launcher Activity field mismatch")
        val method = clazz.methods.singleOrNull {
            it.name == "e" && it.parameterTypes.map { type -> type.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/util/Map;") && it.returnType == "Ljava/lang/Boolean;"
        } ?: throw PatchException("futatabi: URL launcher method missing")
        val impl = method.implementation ?: throw PatchException("futatabi: URL launcher has no code")
        if (impl.registerCount != 5 || impl.instructions.take(4).map { it.opcode } !=
            listOf(Opcode.INVOKE_VIRTUAL, Opcode.NEW_INSTANCE, Opcode.CONST_STRING, Opcode.INVOKE_DIRECT))
            throw PatchException("futatabi: URL launcher signature mismatch")
        method.addInstructionsWithLabels(0, """
            iget-object v0, p0, Lh6/i;->c:Landroid/app/Activity;
            invoke-static {v0, p1}, Ldev/rikunode/futatabi/bridge/BoardLoginLaunch;->tryLaunch(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/Boolean;
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """, ExternalLabel("original", impl.instructions.first()))

        // The stock myLaunchUrl uses flutter_custom_tabs for HTTPS links.
        // Consume only the reserved private reader URL.
        val tabs = mutableClassDefByOrNull("Lx2/k;")
            ?: throw PatchException("futatabi: Flutter custom tabs implementation missing")
        if (tabs.fields.none { it.name == "g" && it.type == "Landroid/app/Activity;" })
            throw PatchException("futatabi: Flutter custom tabs Activity mismatch")
        val tab = tabs.methods.singleOrNull {
            it.name == "c" && it.parameterTypes.map { type -> type.toString() } ==
                listOf("Ljava/lang/String;", "Z", "Ljava/util/Map;") && it.returnType == "V"
        } ?: throw PatchException("futatabi: Flutter custom tabs launch missing")
        val tabImpl = tab.implementation ?: throw PatchException("futatabi: custom tabs has no code")
        if (tabImpl.registerCount != 8 || tabImpl.instructions.take(3).map { it.opcode } !=
            listOf(Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.IGET_OBJECT))
            throw PatchException("futatabi: Flutter custom tabs signature mismatch")
        tab.addInstructionsWithLabels(0, """
            iget-object v0, p0, Lx2/k;->g:Landroid/app/Activity;
            invoke-static {v0, p1}, Ldev/rikunode/futatabi/bridge/BoardLoginLaunch;->tryReaderLaunchOrThrow(Landroid/app/Activity;Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :originalTab
            return-void
        """, ExternalLabel("originalTab", tabImpl.instructions.first()))

    }
}
