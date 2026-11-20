package app.aidan.patches.nhl.ads

import app.aidan.patches.nhl.shared.COMPATIBILITY_NHL
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private class WebAdBlockerResourceHolder

val webAdBlockerPatch = compositeFeaturePatch(
    name = "Web Ad Blocker",
    description = "Blocks advertisements, sponsored banners, and analytics tracking in NHL article views and embedded web content using bundled NHL rules and optional downloadable filter list subscriptions (EasyList, EasyPrivacy).",
    default = true,
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_NHL)
    extendWith("extensions/extension.mpe")

    resources {
        document("AndroidManifest.xml").use { doc ->
            val appElement = doc.getElementsByTagName("application").item(0) as? org.w3c.dom.Element
                ?: throw PatchException("Application element not found in AndroidManifest.xml")

            val activity = doc.createElement("activity")
            activity.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "app.aidan.extension.nhl.adblock.AdBlockSettingsActivity")
            activity.setAttributeNS("http://schemas.android.com/apk/res/android", "android:exported", "true")
            activity.setAttributeNS("http://schemas.android.com/apk/res/android", "android:theme", "@style/Theme.Nhlandroid")
            appElement.appendChild(activity)
        }

        runCatching {
            document("res/xml/backup_rules.xml").use { doc ->
                val root = doc.documentElement
                val excludeFile = doc.createElement("exclude")
                excludeFile.setAttribute("domain", "file")
                excludeFile.setAttribute("path", "aidan/nhl/adblock")
                root.appendChild(excludeFile)

                val excludePref1 = doc.createElement("exclude")
                excludePref1.setAttribute("domain", "sharedpref")
                excludePref1.setAttribute("path", "aidan_nhl_adblock.xml")
                root.appendChild(excludePref1)

                val excludePref2 = doc.createElement("exclude")
                excludePref2.setAttribute("domain", "sharedpref")
                excludePref2.setAttribute("path", "aidan_nhl_adblock_rules.xml")
                root.appendChild(excludePref2)
            }
        }

        runCatching {
            document("res/xml/data_extraction_rules.xml").use { doc ->
                val cloudBackup = doc.getElementsByTagName("cloud-backup").item(0) as? org.w3c.dom.Element
                if (cloudBackup != null) {
                    val excludeFile = doc.createElement("exclude")
                    excludeFile.setAttribute("domain", "file")
                    excludeFile.setAttribute("path", "aidan/nhl/adblock")
                    cloudBackup.appendChild(excludeFile)

                    val excludePref1 = doc.createElement("exclude")
                    excludePref1.setAttribute("domain", "sharedpref")
                    excludePref1.setAttribute("path", "aidan_nhl_adblock.xml")
                    cloudBackup.appendChild(excludePref1)

                    val excludePref2 = doc.createElement("exclude")
                    excludePref2.setAttribute("domain", "sharedpref")
                    excludePref2.setAttribute("path", "aidan_nhl_adblock_rules.xml")
                    cloudBackup.appendChild(excludePref2)
                }
            }
        }

        val uiDrawables = listOf(
            "aidan_nhl_adblock_shield_check.xml",
            "aidan_nhl_adblock_shield_off.xml",
            "aidan_nhl_adblock_settings.xml",
            "aidan_nhl_adblock_filter.xml",
            "aidan_nhl_adblock_history.xml",
            "aidan_nhl_adblock_chart_bar.xml"
        )
        for (name in uiDrawables) {
            val destFile = get("res/drawable/$name")
            val stream = WebAdBlockerResourceHolder::class.java.classLoader.getResourceAsStream("nhl/adblock/ui/$name")
                ?: WebAdBlockerResourceHolder::class.java.getResourceAsStream("/nhl/adblock/ui/$name")
                ?: throw PatchException("Bundled vector drawable $name not found in patch resources")
            val bytes = stream.use { it.readBytes() }
            if (destFile.exists()) {
                val existing = destFile.readBytes()
                if (!existing.contentEquals(bytes)) {
                    throw PatchException("Conflicting existing file at destination: res/drawable/$name")
                }
            } else {
                destFile.parentFile?.mkdirs()
                destFile.outputStream().use { it.write(bytes) }
            }
        }

        val backVector = get("res/drawable/ic_arrow_back.xml")
        if (!backVector.exists()) {
            throw PatchException("Required native back vector drawable/ic_arrow_back.xml not found in target resources")
        }
        val chevronVector = get("res/drawable/ic_chevron_right.xml")
        if (!chevronVector.exists()) {
            throw PatchException("Required native chevron vector drawable/ic_chevron_right.xml not found in target resources")
        }
    }
    rawResources {
        copyRawResource(this, "nhl/adblock/libnhladblock.so", "lib/arm64-v8a/libnhladblock.so")
        copyRawResource(this, "nhl/adblock/nhl-default.txt", "assets/aidan/nhl/adblock/nhl-default.txt")
        copyRawResource(this, "nhl/adblock/content.js", "assets/aidan/nhl/adblock/content.js")
        copyRawResource(this, "nhl/adblock/sources.json", "assets/aidan/nhl/adblock/sources.json")
    }

    bytecode {
        patchWebViewFactories()
        patchWebViewClient()
        patchArticleLoadUrl()
        patchSettingsSection()
    }
}

private fun copyRawResource(context: ResourcePatchContext, resourcePath: String, destPath: String) {
    val destFile = context.get(destPath)
    if (destPath.endsWith(".so")) {
        markUncompressed(destFile, destPath)
    }
    val stream = WebAdBlockerResourceHolder::class.java.classLoader.getResourceAsStream(resourcePath)
        ?: WebAdBlockerResourceHolder::class.java.getResourceAsStream("/$resourcePath")
        ?: throw PatchException("Bundled resource $resourcePath not found in patch resources")

    val bytes = stream.use { it.readBytes() }
    if (destFile.exists()) {
        val existing = destFile.readBytes()
        if (!existing.contentEquals(bytes)) {
            throw PatchException("Conflicting existing file at destination: $destPath")
        }
        return
    }
    destFile.parentFile?.mkdirs()
    destFile.outputStream().use { it.write(bytes) }
}

private fun markUncompressed(destFile: java.io.File, destPath: String) {
    var cur: java.io.File? = destFile.parentFile
    val targets = mutableListOf<java.io.File>()
    while (cur != null) {
        val candidate = java.io.File(cur, "uncompressed-files.json")
        if (candidate.exists()) {
            targets.add(candidate)
            break
        }
        if (cur.name == "apk" || java.io.File(cur, "root").isDirectory) {
            targets.add(candidate)
            break
        }
        cur = cur.parentFile
    }

    for (target in targets) {
        val content = if (target.exists()) target.readText() else "{}"
        val extRegex = Regex("\"extensions\"\\s*:\\s*\\[(.*?)\\]", RegexOption.DOT_MATCHES_ALL)
        val pathRegex = Regex("\"paths\"\\s*:\\s*\\[(.*?)\\]", RegexOption.DOT_MATCHES_ALL)
        val itemRegex = Regex("\"([^\"]+)\"")

        val extensions = mutableSetOf(".so")
        extRegex.find(content)?.let { match ->
            itemRegex.findAll(match.groupValues[1]).forEach { extensions.add(it.groupValues[1]) }
        }

        val paths = mutableSetOf(destPath)
        pathRegex.find(content)?.let { match ->
            itemRegex.findAll(match.groupValues[1]).forEach { paths.add(it.groupValues[1]) }
        }

        val extJson = extensions.sorted().joinToString(",\n    ") { "\"$it\"" }
        val pathJson = paths.sorted().joinToString(",\n    ") { "\"$it\"" }
        val newContent = "{\n  \"extensions\": [\n    $extJson\n  ],\n  \"paths\": [\n    $pathJson\n  ]\n}\n"

        target.parentFile?.mkdirs()
        target.writeText(newContent)
    }
}

private fun BytecodePatchContext.patchWebViewFactories() {
    // 1. In Li9l.invoke (Article WebView factory)
    val i9lClass = mutableClassDefByOrNull("Li9l;")
        ?: throw PatchException("Missing required class Li9l; (Article WebView Factory)")
    val i9lInvoke = i9lClass.methods.singleOrNull { it.name == "invoke" && it.returnType == "Ljava/lang/Object;" }
        ?: throw PatchException("Missing required method Li9l.invoke")

    // 1. Neutralize MobileAds.b(WebView) in Li9l first (before any instruction shifts)
    val i9lInsts = i9lInvoke.implementation?.instructions?.toList()
        ?: throw PatchException("Li9l.invoke has no implementation")
    for ((idx, inst) in i9lInsts.withIndex()) {
        val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        if (ref?.definingClass == "Lcom/google/android/gms/ads/MobileAds;" && ref.name == "b") {
            i9lInvoke.replaceInstruction(idx, "nop")
        }
    }

    // 2. Attach AdBlockBridge after setWebViewClient
    val setClientIdx = i9lInsts.indexOfFirst { inst ->
        val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == "Landroid/webkit/WebView;" &&
            ref.name == "setWebViewClient"
    }
    if (setClientIdx != -1) {
        i9lInvoke.addInstructions(
            setClientIdx + 1,
            "invoke-static {v2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->attach(Landroid/webkit/WebView;)V"
        )
    }

    // 2. In Ltv7.invoke (GameZone WebView factory)
    val tv7Class = mutableClassDefByOrNull("Ltv7;")
        ?: throw PatchException("Missing required class Ltv7; (GameZone WebView Factory)")
    val tv7Invoke = tv7Class.methods.singleOrNull { it.name == "invoke" && it.returnType == "Ljava/lang/Object;" }
        ?: throw PatchException("Missing required method Ltv7.invoke")

    val tv7Insts = tv7Invoke.implementation?.instructions?.toList()
        ?: throw PatchException("Ltv7.invoke has no implementation")
    // Neutralize MobileAds.b(WebView) in Ltv7
    for ((idx, inst) in tv7Insts.withIndex()) {
        val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        if (ref?.definingClass == "Lcom/google/android/gms/ads/MobileAds;" && ref.name == "b") {
            tv7Invoke.replaceInstruction(idx, "nop")
        }
    }

    val tv7SetClientIdx = tv7Insts.indexOfFirst { inst ->
        val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == "Landroid/webkit/WebView;" &&
            ref.name == "setWebViewClient"
    }
    if (tv7SetClientIdx != -1) {
        tv7Invoke.addInstructions(
            tv7SetClientIdx + 1,
            "invoke-static {v2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->attach(Landroid/webkit/WebView;)V"
        )
    }
}

private fun BytecodePatchContext.patchWebViewClient() {
    val khdClass = mutableClassDefByOrNull("Lkhd;")
        ?: throw PatchException("Missing required class Lkhd; (WebViewClient)")

    // 1. Add shouldInterceptRequest(WebView, WebResourceRequest)
    val interceptMethod1 = MutableMethod(
        ImmutableMethod(
            "Lkhd;",
            "shouldInterceptRequest",
            listOf(
                ImmutableMethodParameter("Landroid/webkit/WebView;", emptySet(), null),
                ImmutableMethodParameter("Landroid/webkit/WebResourceRequest;", emptySet(), null)
            ),
            "Landroid/webkit/WebResourceResponse;",
            AccessFlags.PUBLIC.value,
            emptySet(),
            null,
            MutableMethodImplementation(3)
        )
    )
    interceptMethod1.addInstructions(
        0,
        """
        invoke-static {p1, p2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->intercept(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
        move-result-object v0
        return-object v0
        """.trimIndent()
    )
    khdClass.methods.add(interceptMethod1)

    // 2. Add shouldInterceptRequest(WebView, String)
    val interceptMethod2 = MutableMethod(
        ImmutableMethod(
            "Lkhd;",
            "shouldInterceptRequest",
            listOf(
                ImmutableMethodParameter("Landroid/webkit/WebView;", emptySet(), null),
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)
            ),
            "Landroid/webkit/WebResourceResponse;",
            AccessFlags.PUBLIC.value,
            emptySet(),
            null,
            MutableMethodImplementation(3)
        )
    )
    interceptMethod2.addInstructions(
        0,
        """
        invoke-static {p1, p2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->interceptLegacy(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
        move-result-object v0
        return-object v0
        """.trimIndent()
    )
    khdClass.methods.add(interceptMethod2)

    // 3. Hook onPageStarted
    val onPageStarted = khdClass.methods.singleOrNull { it.name == "onPageStarted" }
    if (onPageStarted != null) {
        onPageStarted.addInstructions(
            0,
            "invoke-static {p1, p2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;)V"
        )
    }

    // 4. Hook onPageFinished
    val onPageFinished = khdClass.methods.singleOrNull { it.name == "onPageFinished" }
    if (onPageFinished != null) {
        onPageFinished.addInstructions(
            0,
            "invoke-static {p1, p2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V"
        )
    }
}

private fun BytecodePatchContext.patchArticleLoadUrl() {
    // 1. In Lowk.invoke (Article loadUrl lambda)
    val owkClass = mutableClassDefByOrNull("Lowk;")
    if (owkClass != null) {
        for (method in owkClass.methods) {
            if (method.name == "invoke" && method.implementation != null) {
                val insts = method.implementation!!.instructions.toList()
                for ((idx, inst) in insts.withIndex()) {
                    val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                    if (inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
                        ref?.definingClass == "Landroid/webkit/WebView;" &&
                        ref.name == "loadUrl" &&
                        ref.parameterTypes.size == 2
                    ) {
                        method.replaceInstruction(
                            idx,
                            "invoke-static {v1, v0, v2}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/Map;)V"
                        )
                    }
                }
            }
        }
    }

    // 2. In Ltv7.invoke (GameZone loadUrl)
    val tv7Class = mutableClassDefByOrNull("Ltv7;")
    if (tv7Class != null) {
        for (method in tv7Class.methods) {
            if (method.name == "invoke" && method.implementation != null) {
                val insts = method.implementation!!.instructions.toList()
                for ((idx, inst) in insts.withIndex()) {
                    val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                    if (inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
                        ref?.definingClass == "Landroid/webkit/WebView;" &&
                        ref.name == "loadUrl" &&
                        ref.parameterTypes.size == 2
                    ) {
                        method.replaceInstruction(
                            idx,
                            "invoke-static {v2, v0, v1}, Lapp/aidan/extension/nhl/adblock/AdBlockBridge;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/Map;)V"
                        )
                    }
                }
            }
        }
    }
}

private fun BytecodePatchContext.patchSettingsSection() {
    val dq8Class = mutableClassDefByOrNull("Ldq8;")
        ?: throw PatchException("Missing required class Ldq8; (Settings Composable)")
    val kMethod = dq8Class.methods.singleOrNull { it.name == "k" }
        ?: throw PatchException("Missing required method Ldq8.k")

    val insts = kMethod.implementation?.instructions?.toList()
        ?: throw PatchException("Ldq8.k has no implementation")

    // Find Lbg8;->d invocation
    val bg8DIndex = insts.indexOfFirst { inst ->
        val ref = (inst as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
        inst.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC &&
            ref?.definingClass == "Lbg8;" &&
            ref.name == "d"
    }
    if (bg8DIndex == -1) {
        throw PatchException("Could not find Lbg8.d anchor in Ldq8.k")
    }

    // Inject Aidan's Patches settings row right before Preferences in Ldq8.k
    // v9 is Context, v3 is Composer, v4 is changed
    kMethod.addInstructions(
        bg8DIndex,
        "invoke-static {v9, v3, v4}, Lapp/aidan/extension/nhl/adblock/SettingsBridge;->renderSection(Landroid/content/Context;Ljava/lang/Object;I)V"
    )
}
