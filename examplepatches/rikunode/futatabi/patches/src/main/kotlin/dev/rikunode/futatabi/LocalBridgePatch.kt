package dev.rikunode.futatabi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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
    dependsOn(arm64TargetGuard)
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
            val recovery = document.createElement("activity")
            recovery.setAttribute("android:name", "dev.rikunode.futatabi.bridge.BoardRecoveryActivity")
            recovery.setAttribute("android:exported", "false")
            recovery.setAttribute("android:theme", "@android:style/Theme.Material.Dialog.NoActionBar")
            application.appendChild(recovery)
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
        // Repair legacy board lists after the stock decoder, before Dart
        // caches them. Do not add another Java deserializer.
        val prefsClass = mutableClassDefByOrNull("Lg6/a;")
            ?: throw PatchException("futatabi: shared preferences plugin missing")
        if (prefsClass.fields.none { it.name == "a" && it.type == "Landroid/content/SharedPreferences;" })
            throw PatchException("futatabi: shared preferences field mismatch")
        val getAll = prefsClass.methods.singleOrNull {
            it.name == "b" && it.parameterTypes.map { p -> p.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/util/List;") && it.returnType == "Ljava/util/Map;"
        } ?: throw PatchException("futatabi: shared preferences getAll missing")
        val getAllImpl = getAll.implementation ?: throw PatchException("futatabi: getAll has no code")
        val getAllCode = getAllImpl.instructions.toList()
        val ret = getAllCode.lastIndex
        val call = getAllCode.getOrNull(ret - 2) as? Instruction35c
        val ref = call?.reference as? MethodReference
        if (getAllImpl.registerCount != 4 || call?.opcode != Opcode.INVOKE_VIRTUAL ||
            call.registerCount != 3 || call.registerC != 1 || call.registerD != 2 || call.registerE != 3 ||
            ref?.definingClass != "Lg6/a;" || ref.name != "j" ||
            ref.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;", "Ljava/util/Set;") ||
            ref.returnType != "Ljava/util/Map;" ||
            getAllCode[ret - 1].opcode != Opcode.MOVE_RESULT_OBJECT ||
            (getAllCode[ret - 1] as? OneRegisterInstruction)?.registerA != 2 ||
            getAllCode[ret].opcode != Opcode.RETURN_OBJECT ||
            (getAllCode[ret] as? OneRegisterInstruction)?.registerA != 2)
            throw PatchException("futatabi: shared preferences getAll instruction mismatch")
        getAll.addInstructions(ret, """
            iget-object v0, v1, Lg6/a;->a:Landroid/content/SharedPreferences;
            invoke-static {v0, v2}, Ldev/rikunode/futatabi/bridge/FutatabiProvider;->repairDecodedPreferences(Landroid/content/SharedPreferences;Ljava/util/Map;)V
        """)

        // Stock ItaListNotifier._save uses setEncodedStringList.
        // Observe only this exact key at its native commit boundary.
        val setter = prefsClass.methods.singleOrNull {
            it.name == "f" && it.parameterTypes.map { p -> p.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/lang/String;") && it.returnType == "Ljava/lang/Boolean;"
        } ?: throw PatchException("futatabi: encoded-list setter missing")
        val setterImpl = setter.implementation ?: throw PatchException("futatabi: encoded-list setter has no code")
        val setterCode = setterImpl.instructions.toList()
        val first = setterCode.firstOrNull() as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
        val firstRef = (setterCode.firstOrNull() as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
            as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
        if (setterImpl.registerCount != 4 || setterCode.size != 10 ||
            setterCode.firstOrNull()?.opcode != Opcode.IGET_OBJECT || first?.registerA != 0 || first.registerB != 1 ||
            firstRef?.definingClass != "Lg6/a;" || firstRef.name != "a" ||
            (setterCode[5] as? Instruction35c)?.reference.let { it !is MethodReference || it.name != "commit" } ||
            setterCode.last().opcode != Opcode.RETURN_OBJECT)
            throw PatchException("futatabi: encoded-list setter instruction mismatch")
        setter.addInstructionsWithLabels(0, """
            iget-object v0, v1, Lg6/a;->a:Landroid/content/SharedPreferences;
            invoke-static {v0, v2, v3}, Ldev/rikunode/futatabi/bridge/FutatabiProvider;->persistBoardList(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
            move-result-object v0
            if-eqz v0, :originalSetter
            return-object v0
        """, ExternalLabel("originalSetter", setterCode[0]))

        // Intercept the exact empty-OK marker after stock showToast dispatch.
        val toastClass = mutableClassDefByOrNull("Ln6/e;")
            ?: throw PatchException("futatabi: toast plugin missing")
        if (toastClass.fields.none { it.name == "a" && it.type == "Landroid/content/Context;" })
            throw PatchException("futatabi: toast context mismatch")
        val toast = toastClass.methods.singleOrNull {
            it.name == "onMethodCall" && it.parameterTypes.map { p -> p.toString() } ==
                listOf("LR5/j;", "LR5/k\$d;") && it.returnType == "V"
        } ?: throw PatchException("futatabi: toast handler missing")
        val toastImpl = toast.implementation ?: throw PatchException("futatabi: toast code missing")
        val toastCode = toastImpl.instructions.toList()
        val msg = toastCode.indices.singleOrNull { n ->
            toastCode[n].opcode == Opcode.CONST_STRING &&
                (toastCode[n] as? OneRegisterInstruction)?.registerA == 3 &&
                ((toastCode[n] as? ReferenceInstruction)?.reference as? StringReference)?.string == "msg"
        } ?: throw PatchException("futatabi: toast message site missing")
        val read = toastCode.getOrNull(msg + 1) as? Instruction35c
        val value = toastCode.getOrNull(msg + 3) as? Instruction35c
        val rr = read?.reference as? MethodReference
        val vr = value?.reference as? MethodReference
        if (toastImpl.registerCount != 19 || read?.opcode != Opcode.INVOKE_VIRTUAL ||
            read.registerCount != 2 || read.registerC != 1 || read.registerD != 3 ||
            rr?.definingClass != "LR5/j;" || rr.name != "a" ||
            toastCode[msg + 2].opcode != Opcode.MOVE_RESULT_OBJECT ||
            (toastCode[msg + 2] as? OneRegisterInstruction)?.registerA != 3 ||
            value?.opcode != Opcode.INVOKE_STATIC || value.registerCount != 1 || value.registerC != 3 ||
            vr?.definingClass != "Ljava/lang/String;" || vr.name != "valueOf" ||
            toastCode[msg + 4].opcode != Opcode.MOVE_RESULT_OBJECT ||
            (toastCode[msg + 4] as? OneRegisterInstruction)?.registerA != 3 ||
            toastCode[msg + 5].opcode != Opcode.CONST_STRING ||
            (toastCode[msg + 5] as? OneRegisterInstruction)?.registerA != 4 ||
            ((toastCode[msg + 5] as? ReferenceInstruction)?.reference as? StringReference)?.string != "length")
            throw PatchException("futatabi: toast message instructions mismatch")
        toast.addInstructionsWithLabels(msg + 5, """
            iget-object v4, v0, Ln6/e;->a:Landroid/content/Context;
            invoke-static {v4, v3}, Ldev/rikunode/futatabi/bridge/BoardRecoveryActivity;->tryLaunch(Landroid/content/Context;Ljava/lang/String;)Z
            move-result v4
            if-eqz v4, :originalToast
            sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-interface {v2, v4}, LR5/k${'$'}d;->a(Ljava/lang/Object;)V
            return-void
        """, ExternalLabel("originalToast", toastCode[msg + 5]))

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
