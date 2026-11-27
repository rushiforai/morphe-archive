package dev.lumi.dcinside

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

internal val compatibility = Compatibility(
    name = "DC Inside",
    packageName = "com.dcinside.app.android",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x495C9E,
    targets = listOf(
        AppTarget(version = null)
    )
)

internal val legacyFeatureCompatibility = Compatibility(
    name = "DC Inside reviewed optional features",
    packageName = "com.dcinside.app.android",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x495C9E,
    targets = listOf(
        AppTarget(version = "5.3.6"),
        AppTarget(version = "5.3.18"),
        AppTarget(version = "5.3.21"),
        AppTarget(version = "5.3.27"),
    ),
)

private const val CONFIG = "Lcom/dcinside/app/util/Rr;"
private const val CERT = "Llocal/privacy/SignerCompat;"
private const val JNI_DIGEST = "java/security/MessageDigest"
private const val LOCAL_DIGEST = "local/privacy/MessageDigest"

private val morpheSettingsResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement.getElementsByTagName("application").item(0) as Element
            val hasActivity = (0 until application.getElementsByTagName("activity").length).any { index ->
                val activity = application.getElementsByTagName("activity").item(index) as Element
                activity.getAttribute("android:name") == "local.privacy.MorpheSettingsActivity"
            }
            if (!hasActivity) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", "local.privacy.MorpheSettingsActivity")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:excludeFromRecents", "true")
                activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.Light")
                application.appendChild(activity)
            }
        }
    }
}

private val nativeCertificatePatch = resourcePatch {
    dependsOn(morpheSettingsResources)
    execute {
        val prefixTable = Class.forName("dev.lumi.dcinside.DcInsidePatchKt")
            .getResourceAsStream("/dcinside/lumi_ip_prefixes.txt")
            ?: error("IP prefix table missing from bundle")
        val prefixTarget = this["res/raw/lumi_ip_prefixes.txt"]
        prefixTarget.parentFile?.mkdirs()
        prefixTable.use { source -> prefixTarget.outputStream().use { source.copyTo(it) } }
        check(JNI_DIGEST.length == LOCAL_DIGEST.length)
        val paths = listApkEntries("lib/").filter { it.endsWith("/libnative-lib.so") }
        check(paths.isNotEmpty()) { "Native identity library missing; app version needs review" }
        paths.forEach { path ->
            val file = get(path)
            val before = file.readBytes().toString(Charsets.ISO_8859_1)
            val count = Regex(JNI_DIGEST).findAll(before).count()
            check(count >= 2) { "JNI fingerprint changed in $path" }
            val updated = before.replace(JNI_DIGEST, LOCAL_DIGEST).toByteArray(Charsets.ISO_8859_1)
            check(updated.size == file.length().toInt())
            file.writeBytes(updated)
        }
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement.getElementsByTagName("application").item(0) as Element
            val providers = document.getElementsByTagName("provider")
            for (index in providers.length - 1 downTo 0) {
                val item = providers.item(index) as Element
                if (item.getAttribute("android:name") in setOf(
                        "com.kakao.adfit.AdFitSdkInitProvider",
                        "com.applovin.sdk.AppLovinInitProvider",
                        "com.google.android.gms.ads.MobileAdsInitProvider"
                    )) item.parentNode.removeChild(item)
            }
            val permissions = document.getElementsByTagName("uses-permission")
            for (index in permissions.length - 1 downTo 0) {
                val item = permissions.item(index) as Element
                val name = item.getAttribute("android:name")
                if (name == "com.google.android.gms.permission.AD_ID" ||
                    name.startsWith("android.permission.ACCESS_ADSERVICES_"))
                    item.parentNode.removeChild(item)
            }
            val flags = mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_analytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
            )
            val metadata = document.getElementsByTagName("meta-data")
            flags.forEach { (name, value) ->
                val existing = (0 until metadata.length).map { metadata.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                val element = existing ?: document.createElement("meta-data").also {
                    document.documentElement.getElementsByTagName("application").item(0).appendChild(it)
                }
                element.setAttribute("android:name", name)
                element.setAttribute("android:value", value)
            }
        }
        document("res/layout/view_read_footer.xml").use { document ->
            val views = document.getElementsByTagName("*")
            var likesCount = 0
            var adCount = 0
            for (index in 0 until views.length) {
                val view = views.item(index) as Element
                when (view.getAttribute("android:id")) {
                    "@id/read_footer_likes" -> {
                        likesCount++
                        view.setAttribute("android:paddingTop", "12.0dp")
                        view.setAttribute("android:paddingBottom", "12.0dp")
                        view.setAttribute("android:layout_marginTop", "12.0dp")
                        view.setAttribute("app:layout_goneMarginTop", "12.0dp")
                    }
                    "@id/read_footer_ad_container" -> {
                        adCount++
                        view.setAttribute("android:visibility", "gone")
                        view.setAttribute("android:layout_height", "0.0dp")
                    }
                }
            }
            check(likesCount == 1 && adCount == 1) { "Read footer layout changed" }
        }
        document("res/layout/view_read_header.xml").use { document ->
            val views = document.getElementsByTagName("*")
            val names = (0 until views.length).map { views.item(it) as Element }
                .filter { it.getAttribute("android:id") == "@id/read_header_name" }
            val memos = (0 until views.length).map { views.item(it) as Element }
                .filter { it.getAttribute("android:id") == "@id/read_header_user_memo" }
            check(names.size == 1 && memos.size == 1) { "Post header layout changed" }
            val expand = document.createElement("TextView")
            mapOf(
                "android:id" to "@+id/lumi_read_ip_expand",
                "android:textAppearance" to "?textTypeSub",
                "android:textColor" to "?colorPrimary",
                "android:visibility" to "gone",
                "android:text" to "펼치기",
                "android:gravity" to "center",
                "android:layout_width" to "wrap_content",
                "android:layout_height" to "40.0dp",
                "android:minWidth" to "48.0dp",
                "android:paddingStart" to "6.0dp",
                "android:layout_marginEnd" to "10.0dp",
                "app:layout_constraintTop_toTopOf" to "@id/read_header_name",
                "app:layout_constraintBottom_toBottomOf" to "@id/read_header_name",
                "app:layout_constraintEnd_toEndOf" to "parent",
            ).forEach { (key, value) -> expand.setAttribute(key, value) }
            names.single().parentNode.insertBefore(expand, memos.single().nextSibling)
            memos.single().setAttribute("app:layout_constraintEnd_toStartOf", "@id/lumi_read_ip_expand")
        }
        document("res/layout/fragment_post_list.xml").use { document ->
            val views = document.getElementsByTagName("*")
            var adWrapCount = 0
            for (index in 0 until views.length) {
                val view = views.item(index) as Element
                if (view.getAttribute("android:id") == "@id/list_quick_ad_wrap") {
                    adWrapCount++
                    val parent = view.parentNode as Element
                    parent.setAttribute("android:visibility", "gone")
                    parent.setAttribute("android:layout_height", "0.0dp")
                }
            }
            check(adWrapCount == 1) { "Gallery ad strip layout changed" }
        }
        document("res/values/dimens.xml").use { document ->
            val adDimensions = setOf(
                "ad_main_small_native", "ad_minimum", "ad_minimum_tall",
                "main_ad_live_best_spacing", "read_ad_minimum", "image_ad"
            )
            val dimensions = document.getElementsByTagName("dimen")
            val matched = mutableSetOf<String>()
            for (index in 0 until dimensions.length) {
                val dimension = dimensions.item(index) as Element
                val name = dimension.getAttribute("name")
                if (name in adDimensions) {
                    check(matched.add(name)) { "Duplicate ad dimension: $name" }
                    // These app views treat 0 as "unset" and restore a 50–250dp fallback.
                    // Keep the resource positive so empty ad slots stay at a single pixel.
                    dimension.textContent = "1px"
                }
            }
            check(matched == adDimensions) { "Ad dimensions changed: missing ${adDimensions - matched}" }
        }
    }
}

/** Keeps the update-notice preference independently patchable across app class-name changes. */
@Suppress("unused")
val updateNoticePatch = bytecodePatch(
    name = "디시 앱 업데이트 안내 설정",
    description = "디시 앱 자체 업데이트 안내를 Morphe 설정에서 끄거나 켭니다.",
    default = true
) {
    compatibleWith(compatibility)
    dependsOn(morpheSettingsResources)
    extendWith("extensions/extension.mpe")
    execute {
        val appCreate = Fingerprint(
            definingClass = "Lcom/dcinside/app/Application;",
            name = "onCreate",
            returnType = "V"
        ).method
        if (appCreate.implementation!!.instructions.none { instruction ->
                (instruction as? ReferenceInstruction)?.reference.toString() ==
                    "Llocal/privacy/SettingsState;->init(Landroid/content/Context;)V"
            }) {
            appCreate.addInstructions(0,
                "invoke-static {p0}, Llocal/privacy/SettingsState;->init(Landroid/content/Context;)V")
        }
        appCreate.addInstructions(0, """
            const/16 v0, 0x20
            invoke-static {v0}, Llocal/privacy/SettingsState;->addSupportedFeatures(I)V
        """.trimIndent())

        val isRepackagedUpdateFlow = classDefByOrNull("Lpm5;") != null
        val updateProfile = if (isRepackagedUpdateFlow) null else dcTarget()
        val updateOwner = if (isRepackagedUpdateFlow) "Lpm5;"
            else updateProfile!!.type("Lcom/dcinside/app/main/A0;")
        val updateName = if (isRepackagedUpdateFlow) "O"
            else updateProfile!!.name("Lcom/dcinside/app/main/A0;", "n2")
        val updateGate = Fingerprint(
            definingClass = updateOwner,
            name = updateName,
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Z",
            custom = if (isRepackagedUpdateFlow) ({ method, _ ->
                val strings = method.implementation?.instructions?.mapNotNull { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
                }?.toSet().orEmpty()
                "updateIgnoreCase" in strings && "popup_interval_update" in strings
            }) else null
        ).method
        val isStatic = updateGate.accessFlags and 0x8 != 0
        val implementation = updateGate.implementation ?: error("Update notice decision method has no body")
        val parameterRegisters = updateGate.parameterTypes.size + if (isStatic) 0 else 1
        val localRegisters = implementation.registerCount - parameterRegisters
        check(localRegisters > 0) { "Update notice decision method has no scratch register" }
        val scratch = localRegisters - 1
        updateGate.addInstructionsWithLabels(0, """
            const-string v$scratch, "disable_update_notice"
            invoke-static {v$scratch}, Llocal/privacy/SettingsState;->get(Ljava/lang/String;)Z
            move-result v$scratch
            if-eqz v$scratch, :keep_update_notice_check
            const/4 v$scratch, 0x0
            return v$scratch
            :keep_update_notice_check
            nop
        """.trimIndent())

        // 5.3.27 moved the settings overview fragment into the default package.
        // Earlier app versions add this link in the main clean-up patch instead.
        if (classDefByOrNull("Llda;") != null) {
            val settingsView = Fingerprint(
                definingClass = "Llda;",
                name = "onViewCreated",
                parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
                returnType = "V"
            ).method
            settingsView.addInstructions(0,
                "invoke-static {p1}, Llocal/privacy/MorpheSettingsActivity;->bindSettingsShortcut(Landroid/view/View;)V")
        }
    }
}

/** Does not contain the APK, keys, or proprietary source. */
@Suppress("unused")
val dcInsidePersonalPatch = bytecodePatch(
    name = "DC Inside personal clean-up",
    description = "Disable app ad loaders and keep the locally signed build usable.",
    default = true
) {
    compatibleWith(compatibility)
    dependsOn(nativeCertificatePatch)
    extendWith("extensions/extension.mpe")
    execute {
        if (classDefByOrNull("Lvi9;") != null && classDefByOrNull("Lc22;") != null &&
            classDefByOrNull("Lfwa;") != null) {
            applyRepackagedCleanup()
        } else {
        val target = dcTarget()
        val postIdGetter = classDefBy("Lcom/dcinside/app/response/PostItem;").stringGetters("user_id").sorted().first()
        val commentIdGetter = classDefBy("Lcom/dcinside/app/response/m;").stringGetters("user_id").sorted().first()
        val headerIdGetter = classDefBy("Lcom/dcinside/app/model/PostInfo;").stringGetters("user_id").sorted().first()
        val headerIpGetter = classDefBy("Lcom/dcinside/app/model/PostInfo;").stringGetters("ip").sorted().first()
        // Initialize the certificate adapter before native app-identity calls.
        val appCreate = target.fingerprint(definingClass = "Lcom/dcinside/app/Application;", name = "onCreate", returnType = "V").method
        appCreate.addInstructions(0, "invoke-static {p0}, $CERT->init(Landroid/content/Context;)V")
        appCreate.addInstructions(0, "invoke-static {p0}, Llocal/privacy/SettingsState;->init(Landroid/content/Context;)V")
        appCreate.addInstructions(0, """
            const/16 v0, 0x18
            invoke-static {v0}, Llocal/privacy/SettingsState;->addSupportedFeatures(I)V
        """.trimIndent())
        val configValueSource = classDefBy("Lcom/google/firebase/remoteconfig/internal/y;").methods.single {
            it.parameterTypes.isEmpty() && it.returnType == "I" &&
                it.implementation?.instructions?.toList()?.let { code ->
                    code.size == 2 && code[0].opcode == Opcode.IGET && code[1].opcode == Opcode.RETURN &&
                        (code[0] as? ReferenceInstruction)?.reference.toString() ==
                        "Lcom/google/firebase/remoteconfig/internal/y;->b:I"
                } == true
        }.name
        val forceConfig = Fingerprint(parameters = emptyList(), returnType = "Z",
            strings = listOf("forceRemoteConfig"), custom = { method, _ ->
                method.definingClass.startsWith("Lcom/dcinside/app/util/") &&
                    method.implementation?.instructions?.any {
                        (it as? ReferenceInstruction)?.reference.toString() ==
                            "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"
                    } == true
            }).method
        val forceOwner = forceConfig.definingClass
        check(classDefBy(forceOwner).fields.any {
            it.name == "a" && it.type == forceOwner && it.accessFlags and 0x9 == 0x9
        }) { "Remote config preferences singleton changed" }
        val forceClass = forceOwner.removePrefix("L").removeSuffix(";").replace('/', '.')
        check(appCreate.implementation!!.registerCount >= 5) { "Application initialization registers changed" }
        appCreate.addInstructions(0, """
            const-string v0, "$postIdGetter"
            const-string v1, "$commentIdGetter"
            const-string v2, "$headerIdGetter"
            const-string v3, "$headerIpGetter"
            invoke-static {v0, v1, v2, v3}, Llocal/privacy/AuthorInfo;->configure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            const-string v0, "$configValueSource"
            invoke-static {v0}, Llocal/privacy/RemoteConfigFallback;->configure(Ljava/lang/String;)V
            const-string v0, "$forceClass"
            const-string v1, "${forceConfig.name}"
            invoke-static {v0, v1}, Llocal/privacy/RemoteConfigRefreshGate;->configure(Ljava/lang/String;Ljava/lang/String;)V
        """.trimIndent())
        val settingsView = target.fingerprint(definingClass = "Lcom/dcinside/app/settings/K1;", name = "onViewCreated",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"), returnType = "V").method
        val settingsSuper = settingsView.implementation!!.instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_SUPER && ref?.name == "onViewCreated"
        }
        check(settingsSuper >= 0) { "Settings screen lifecycle changed" }
        settingsView.addInstructions(settingsSuper + 1,
            "invoke-static {p1}, Llocal/privacy/MorpheSettingsActivity;->bindSettingsShortcut(Landroid/view/View;)V")
        val postHtml = target.fingerprint(definingClass = "Lcom/dcinside/app/read/V;", name = "b",
            parameters = emptyList(), returnType = "Ljava/lang/String;").method
        val htmlReturn = postHtml.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        check(htmlReturn >= 0) { "Post HTML getter changed" }
        val htmlRegister = (postHtml.implementation!!.instructions[htmlReturn] as OneRegisterInstruction).registerA
        postHtml.addInstructions(htmlReturn, """
            invoke-static {v$htmlRegister}, Llocal/privacy/AutoImageFilter;->filter(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$htmlRegister
        """.trimIndent())
        target.fingerprint(definingClass = "Lcom/dcinside/app/wv/a;", name = "shouldInterceptRequest",
            parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
            returnType = "Landroid/webkit/WebResourceResponse;").method.addInstructionsWithLabels(0, """
                invoke-static/range {p2 .. p2}, Llocal/privacy/WebResourceBlocker;->intercept(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                if-eqz v0, :continue_web_request
                return-object v0
                :continue_web_request
                nop
            """.trimIndent())
        // The post WebView builder itself adds Naver analytics scripts. Suppress
        // those script tags before the WebView can request either script or beacon.
        val webBuilder = target.fingerprint(definingClass = "Lcom/dcinside/app/wv/l;", name = "<init>",
            parameters = listOf("Landroid/content/Context;", "Lorg/jsoup/nodes/f;", "Z", "Z", "Z", "I",
                "Lcom/dcinside/app/wv/r;", "Z", "Ljava/lang/Float;", "Z", "Z", "Z"),
            returnType = "V").method
        val scriptAnchor = webBuilder.implementation!!.instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference.toString()
                .contains("https://wcs.naver.net/wcslog.js")
        }
        check(scriptAnchor >= 0) { "Naver analytics script anchor changed" }
        val scriptGuard = (0 until scriptAnchor).lastOrNull { index ->
            webBuilder.implementation!!.instructions[index].opcode == Opcode.IF_EQZ
        }
        check(scriptGuard != null && scriptAnchor - scriptGuard < 10) { "Naver analytics guard changed" }
        check((webBuilder.implementation!!.instructions[scriptGuard] as OneRegisterInstruction).registerA ==
            webBuilder.implementation!!.registerCount - 13 + 10) { "Analytics parameter moved" }
        webBuilder.addInstructions(scriptGuard, """
            invoke-static/range {p10 .. p10}, Llocal/privacy/WebResourceBlocker;->allowNaverAnalytics(Z)Z
            move-result p10
        """.trimIndent())
        val crashSwitch = appCreate.implementation!!.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.let { ref ->
                (ref as? MethodReference)?.let { m ->
                    m.definingClass == "Lcom/google/firebase/crashlytics/j;" &&
                        m.name == "l" && m.parameterTypes.toString() == "[Z]"
                } == true
            }
        }
        check(crashSwitch >= 0) { "Crashlytics switch changed" }
        // The boolean register is reused much later for Realm's UI-thread write setting.
        // Changing its value here makes post navigation fail with a Realm exception.
        // Manifest metadata deactivates Crashlytics; omit this explicit enable call.
        appCreate.replaceInstruction(crashSwitch, "nop")

        // Preserve the vendor allowlist; add only the certificate installed by Morphe.
        val allowed = target.fingerprint(
            definingClass = "Lcom/dcinside/app/auth/b;", name = "f",
            parameters = listOf("Lcom/dcinside/app/auth/i0;"), returnType = "Ljava/util/Set;"
        ).method
        val returns = allowed.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returns.size == 2) { "Certificate allowlist changed" }
        returns.asReversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            allowed.addInstructions(index, """
                invoke-static {v$register}, $CERT->withInstalledSigner(Ljava/util/Set;)Ljava/util/Set;
                move-result-object v$register
            """.trimIndent())
        }

        // Fixed-value ad configuration; validate every method before changing it.
        target.fingerprint(definingClass = CONFIG, name = "d", parameters = listOf("Ljava/lang/String;"),
            returnType = "Ljava/util/List;").method.addInstructions(0, """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p0
                return-object p0
            """.trimIndent())
        listOf("r", "C0", "v0", "I0", "J0", "K0", "L0").forEach { name ->
            target.fingerprint(definingClass = CONFIG, name = name, returnType = "Z")
                .method.addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        }
        listOf("t", "t0").forEach { name ->
            target.fingerprint(definingClass = CONFIG, name = name, returnType = "I")
                .method.addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        }
        listOf("x", "y", "s0").forEach { name ->
            target.fingerprint(definingClass = CONFIG, name = name, returnType = "Ljava/lang/String;")
                .method.addInstructions(0, "const-string p0, \"\"\nreturn-object p0")
        }
        target.fingerprint(definingClass = "Lcom/dcinside/app/ad/support/J;", name = "a",
            parameters = listOf("Landroidx/appcompat/app/AppCompatActivity;"), returnType = "V")
            .method.addInstructions(0, "return-void")
        target.fingerprint(definingClass = "LF/a\$a;", name = "a",
            parameters = listOf("Ljava/util/List;"), returnType = "I")
            .method.addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        target.fingerprint(definingClass = "Lcom/dcinside/app/ad/support/a;", name = "b",
            parameters = listOf("Lkotlin/jvm/functions/Function1;"), returnType = "V")
            .method.addInstructions(0, """
                const/4 v0, 0x0
                invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                return-void
            """.trimIndent())
        target.fingerprint(definingClass = "Lcom/dcinside/app/util/b;", name = "b",
            parameters = listOf("Landroid/content/Context;", "Lcom/dcinside/app/util/b\$a;"),
            returnType = "V").method.addInstructions(0, "return-void")
        target.fingerprint(definingClass = "Lcom/dcinside/app/post/h;", name = "h",
            parameters = listOf("Landroidx/appcompat/app/AppCompatActivity;"), returnType = "V")
            .method.addInstructions(0, "return-void")
        listOf("A2" to emptyList<String>(), "F2" to listOf("Ljava/lang/String;"),
            "x0" to emptyList()).forEach { (name, parameters) ->
            target.fingerprint(definingClass = "Lcom/dcinside/app/post/fragments/z3;", name = name,
                parameters = parameters, returnType = "V")
                .method.addInstructions(0, "return-void")
        }
        target.fingerprint(definingClass = "Lcom/dcinside/app/view/f0;", name = "x0", returnType = "V")
            .method.addInstructions(0, "return-void")
        // These ad views remain in RecyclerView/footer layouts even when ad requests are disabled.
        // Collapse their own bounds without touching post rows or user controls.
        listOf("t1" to "g", "v1" to "d").forEach { (name, field) ->
            target.fingerprint(definingClass = "Lcom/dcinside/app/view/f0;", name = name,
                parameters = listOf("Landroidx/lifecycle/LifecycleOwner;", "Lcom/dcinside/app/read/V\$a;"),
                returnType = "V").method.addInstructions(0, target.smali("""
                    iget-object v0, p0, Lcom/dcinside/app/view/f0;->I:LO/N7;
                    iget-object v1, v0, LO/N7;->$field:Landroid/widget/LinearLayout;
                    const/4 v2, 0x0
                    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumHeight(I)V
                    const/16 v2, 0x8
                    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
                    iget-object v1, v0, LO/N7;->h:Landroid/view/View;
                    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """.trimIndent()))
        }
        target.fingerprint(definingClass = "Lcom/dcinside/app/post/fragments/E2;", name = "k",
            parameters = listOf("Landroidx/lifecycle/LifecycleOwner;", "Ljava/lang/String;", "I", "Z", "LF/d;"),
            returnType = "V").method.addInstructions(0, target.smali("""
                const/16 v1, 0x8
                iget-object v0, p0, Lcom/dcinside/app/post/fragments/E2;->g:Landroid/widget/FrameLayout;
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                iget-object v0, p0, Lcom/dcinside/app/post/fragments/E2;->h:Landroid/view/View;
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent()))
        listOf("c" to "k", "e" to "i").forEach { (owner, name) ->
            target.fingerprint(definingClass = "Lcom/dcinside/app/ad/naver/$owner;", name = name,
                parameters = listOf("Landroidx/lifecycle/LifecycleOwner;", "Ljava/lang/String;",
                    "Ljava/lang/String;", "Lcom/dcinside/app/ad/naver/a;"), returnType = "V")
                .method.addInstructions(0, target.smali("""
                    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
                    const/16 v1, 0x8
                    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                    const/4 v1, 0x0
                    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumHeight(I)V
                    return-void
                """.trimIndent()))
        }
        target.fingerprint(definingClass = "Lcom/dcinside/app/post/X2;", name = "a0",
            parameters = listOf("Lcom/dcinside/app/response/j;", "Z"), returnType = "Z")
            .method.addInstructions(0, "const/4 p0, 0x0\nreturn p0")
        // Preserve the bottom navigation; override only the ad strip's later visibility toggle.
        val quickBar = target.fingerprint(definingClass = "Lcom/dcinside/app/post/fragments/w2;", name = "f5",
            parameters = listOf("Z"), returnType = "V").method
        val visibilityCalls = quickBar.implementation!!.instructions.withIndex().filter { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/view/View;" && ref.name == "setVisibility" &&
                ref.parameterTypes.toString() == "[I]"
        }
        check(visibilityCalls.size == 2) { "Quick bar visibility layout changed" }
        val (adVisibilityIndex, adVisibilityInsn) = visibilityCalls.last()
        val adVisibilityCall = adVisibilityInsn as FiveRegisterInstruction
        quickBar.replaceInstruction(adVisibilityIndex,
            "invoke-static {v${adVisibilityCall.registerC}, v${adVisibilityCall.registerD}}, " +
                "Llocal/privacy/AdSpace;->keepGone(Landroid/view/View;I)V")

        // Reuse activated values on transient configuration failure; throttle only redundant home-stop refreshes.
        val configCallback = target.fingerprint(definingClass = CONFIG, name = "c",
            parameters = listOf("LW3/o;", "Lcom/google/android/gms/tasks/Task;"), returnType = "V").method
        val taskResultIndex = configCallback.implementation!!.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/google/android/gms/tasks/Task;" && ref.name == "isSuccessful"
        }
        check(taskResultIndex >= 0 && configCallback.implementation!!.instructions[taskResultIndex + 1].opcode == Opcode.MOVE_RESULT)
        val resultRegister = (configCallback.implementation!!.instructions[taskResultIndex + 1] as OneRegisterInstruction).registerA
        configCallback.addInstructions(taskResultIndex + 2, """
            invoke-static {v$resultRegister}, Llocal/privacy/RemoteConfigFallback;->successOrActivated(Z)Z
            move-result v$resultRegister
        """.trimIndent())
        val startupTimeout = target.fingerprint(definingClass = "Lcom/dcinside/app/main/A0;", name = "F2",
            parameters = listOf("Lcom/dcinside/app/main/A0;", "Landroidx/fragment/app/FragmentActivity;",
                "Ljava/lang/Throwable;"), returnType = "V").method
        val startupCheck = startupTimeout.implementation!!.instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == target.type("Lcom/dcinside/app/util/ms;") && ref.name == "y"
        }
        check(startupCheck >= 0 && startupTimeout.implementation!!.instructions[startupCheck + 1].opcode == Opcode.MOVE_RESULT)
        startupTimeout.addInstructions(startupCheck + 2, """
            invoke-static {p1}, Llocal/privacy/RemoteConfigFallback;->successOrActivated(Z)Z
            move-result p1
        """.trimIndent())
        val homeStop = target.fingerprint(definingClass = "Lcom/dcinside/app/main/E1;", name = "onStop", returnType = "V").method
        val superStop = homeStop.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
        check(superStop >= 0) { "Home lifecycle changed" }
        homeStop.addInstructionsWithLabels(superStop + 1, """
            invoke-static {}, Llocal/privacy/RemoteConfigRefreshGate;->shouldRefreshOnHomeStop()Z
            move-result v0
            if-nez v0, :continue_refresh
            return-void
            :continue_refresh
            nop
        """.trimIndent())
        target.fingerprint(definingClass = "Lcom/dcinside/app/Application;", name = "p", returnType = "V")
            .method.addInstructions(0, "return-void")
        }
    }
}

/** Reviewed path for the 5.3.27+ default-package app layout. */
private fun app.morphe.patcher.patch.BytecodePatchContext.applyRepackagedCleanup() {
    val appCreate = Fingerprint(
        definingClass = "Lcom/dcinside/app/Application;",
        name = "onCreate",
        returnType = "V",
    ).method
    val appInstructions = appCreate.implementation?.instructions
        ?: error("Application initialization method has no body")
    if (appInstructions.none { instruction ->
            (instruction as? ReferenceInstruction)?.reference.toString() ==
                "Llocal/privacy/SignerCompat;->init(Landroid/content/Context;)V"
        }) {
        appCreate.addInstructions(0,
            "invoke-static {p0}, Llocal/privacy/SignerCompat;->init(Landroid/content/Context;)V")
    }
    if (appInstructions.none { instruction ->
            (instruction as? ReferenceInstruction)?.reference.toString() ==
                "Llocal/privacy/SettingsState;->init(Landroid/content/Context;)V"
        }) {
        appCreate.addInstructions(0,
            "invoke-static {p0}, Llocal/privacy/SettingsState;->init(Landroid/content/Context;)V")
    }
    appCreate.addInstructions(0, """
        const/16 v0, 0x8
        invoke-static {v0}, Llocal/privacy/SettingsState;->addSupportedFeatures(I)V
    """.trimIndent())

    val settingsView = Fingerprint(
        definingClass = "Llda;",
        name = "onViewCreated",
        parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
        returnType = "V",
    ).method
    settingsView.addInstructions(0,
        "invoke-static {p1}, Llocal/privacy/MorpheSettingsActivity;->bindSettingsShortcut(Landroid/view/View;)V")

    // Remote-config ad placements are selected through vi9.b(key). Keep the
    // original path when the in-app switch is off; otherwise return no slots.
    val adPlacements = Fingerprint(
        definingClass = "Lvi9;",
        name = "b",
        parameters = listOf("Ljava/lang/String;"),
        returnType = "Ljava/util/List;",
    ).method
    adPlacements.addInstructionsWithLabels(0, """
        const-string v0, "block_app_ad_loaders"
        invoke-static {v0}, Llocal/privacy/SettingsState;->get(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :keep_remote_ad_placements
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object p0
        return-object p0
        :keep_remote_ad_placements
        nop
    """.trimIndent())

    // The empty remote slot still creates native placeholder rows in 5.3.27.
    // Remove only those verified home-ad rows when the in-app switch is on.
    Fingerprint(
        definingClass = "La66;",
        name = "n",
        parameters = listOf("Ljava/util/List;"),
        returnType = "V",
    ).method.addInstructions(0, """
        invoke-static/range {p1 .. p1}, Llocal/privacy/HomeFilter;->filterAds(Ljava/util/List;)Ljava/util/List;
        move-result-object p1
    """.trimIndent())

    // These native containers reserve layout height after their ad list is empty.
    Fingerprint(
        definingClass = "Lx98;",
        name = "A",
        parameters = listOf("Ldw5;", "Ls22;"),
        returnType = "V",
    ).method.collapseBeforeReturn("""
        invoke-static/range {p0 .. p0}, Llocal/privacy/AdSlotCollapser;->collapseReadFooterAds(Landroid/view/View;)V
    """.trimIndent())
    Fingerprint(
        definingClass = "Lx98;",
        name = "B",
        parameters = listOf("Ldw5;", "Ls22;"),
        returnType = "V",
    ).method.collapseBeforeReturn("""
        invoke-static/range {p0 .. p0}, Llocal/privacy/AdSlotCollapser;->collapseReadFooterAds(Landroid/view/View;)V
    """.trimIndent())
    Fingerprint(
        definingClass = "Lg78;",
        name = "f0",
        parameters = emptyList(),
        returnType = "V",
    ).method.collapseBeforeReturn("""
        invoke-static/range {p0 .. p0}, Llocal/privacy/AdSlotCollapser;->collapseGalleryAds(Ljava/lang/Object;)V
    """.trimIndent())
    Fingerprint(
        definingClass = "Lg78;",
        name = "g0",
        parameters = listOf("Ljava/lang/String;"),
        returnType = "V",
    ).method.collapseBeforeReturn("""
        invoke-static/range {p0 .. p0}, Llocal/privacy/AdSlotCollapser;->collapseGalleryAds(Ljava/lang/Object;)V
    """.trimIndent())
    Fingerprint(
        definingClass = "Lq58;",
        name = "h",
        parameters = listOf("Ldw5;", "Ljava/lang/String;", "I", "Z", "Lqc;"),
        returnType = "V",
    ).method.collapseBeforeReturn("""
        invoke-static/range {p0 .. p0}, Llocal/privacy/AdSlotCollapser;->collapsePageAd(Ljava/lang/Object;)V
    """.trimIndent())

    val intercept = Fingerprint(
        definingClass = "Lc22;",
        name = "shouldInterceptRequest",
        parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
        returnType = "Landroid/webkit/WebResourceResponse;",
    ).method
    intercept.addInstructionsWithLabels(0, """
        invoke-static/range {p2 .. p2}, Llocal/privacy/WebResourceBlocker;->intercept(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
        move-result-object v0
        if-eqz v0, :continue_web_request
        return-object v0
        :continue_web_request
        nop
    """.trimIndent())

    // fwa's tenth constructor parameter controls whether Naver analytics tags
    // are appended to the post HTML. Preserve its requested value unless blocked.
    val webBuilder = Fingerprint(
        definingClass = "Lfwa;",
        name = "<init>",
        parameters = listOf(
            "Landroid/content/Context;", "Lorg/jsoup/nodes/j;", "Z", "Z", "Z", "I",
            "Laec;", "Z", "Ljava/lang/Float;", "Z", "Z", "Z",
        ),
        returnType = "V",
    ).method
    webBuilder.addInstructions(0, """
        invoke-static/range {p10 .. p10}, Llocal/privacy/WebResourceBlocker;->allowNaverAnalytics(Z)Z
        move-result p10
    """.trimIndent())
}

private fun MutableMethod.collapseBeforeReturn(code: String) {
    val instructions = implementation?.instructions ?: error("Ad container callback has no code")
    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
    check(returns.isNotEmpty()) { "Ad container callback return path changed: $name" }
    returns.asReversed().forEach { index -> addInstructions(index, code) }
}
