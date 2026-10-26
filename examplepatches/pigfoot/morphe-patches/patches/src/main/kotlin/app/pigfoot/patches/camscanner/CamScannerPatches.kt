package app.pigfoot.patches.camscanner

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import java.security.MessageDigest

internal const val CAM_PACKAGE = "com.intsig.camscanner"
private const val ACCOUNT = "Lcom/intsig/comm/account_data/AccountPreference;"
private const val FABRIC = "Lcom/intsig/crashapm/log/FabricUtils;"
private const val ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val CRASH = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
private const val LOG = "Lcom/intsig/logagent/LogAgent;"
private val target = Compatibility(packageName = CAM_PACKAGE, name = "CamScanner", apkFileType = ApkFileType.APKM,
    targets = camScannerVersions.map { AppTarget(it.name, versionCodes = mapOf(
        SupportedAbi.ARM64_V8A to it.code.toInt(), SupportedAbi.ARMEABI_V7A to it.code.toInt()), isExperimental = false) })

internal fun Method.signature() = "(" + parameterTypes.joinToString("") + ")" + returnType
internal fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

// One dependency validates pristine definitions before shared classes are mutated by any selected feature.
internal val camscannerInputPatch = bytecodePatch {
    execute {
        require(packageMetadata.packageName == CAM_PACKAGE) { "Unsupported CamScanner package" }
        val version = qualifiedCamScannerVersion(packageMetadata.versionName, packageMetadata.versionCode)
        require(classDefByOrNull("Lbin/ghost/yrf;") == null) { "Already modified CamScanner input" }
        for ((type, expected) in version.classPins) {
            val pool = DexPool(Opcodes.forDexVersion(39))
            pool.internClass(classDefBy(type))
            val store = MemoryDataStore()
            pool.writeTo(store)
            require(matchesCamScannerClassPin(expected, sha256(store.data))) { "Unsupported or already modified class: $type" }
        }
    }
}
private fun BytecodePatchContext.stop(type: String, name: String, descriptor: String, code: String = "return-void") {
    val method = mutableClassDefBy(type).methods.single { it.name == name && it.signature() == descriptor }
    requireNotNull(method.implementation)
    method.addInstructions(0, code)
}
private fun noNetwork(installer: InstallerType) = if (installer == InstallerType.MOUNT)
    PatchAvailability.UNAVAILABLE else PatchAvailability.DISABLED

internal val camscannerSideloadStartupPatch = bytecodePatch {
    compatibleWith(target)
    availability { installer, _ -> noNetwork(installer) }
    dependsOn(camscannerInputPatch)
    execute {
        val type = mutableClassDefBy(PIRATE_CONTROL)
        val method = type.methods.single { it.name == "O8" && it.signature() == PIRATE_GATE_DESCRIPTOR }
        val replacement = MutableMethod(startupGateReplacement(method))
        val toast = type.methods.single { it.name == "Oo08" && it.signature() == PIRATE_TOAST_DESCRIPTOR }
        val toastReplacement = MutableMethod(startupToastReplacement(toast))
        // Validate both qualified entries before modifying either one.
        require(type.methods.remove(method))
        require(type.methods.add(replacement))
        require(type.methods.remove(toast))
        require(type.methods.add(toastReplacement))
    }
}

private val signingResources = resourcePatch {
    dependsOn(camscannerInputPatch)
    execute {
        val libs = listApkEntries("lib/").filter { it.endsWith("/libnative-encrypt.so") }
        require(libs.isNotEmpty() && libs.all { it in signingEdits }) { "Unqualified native signing ABI" }
        val replacements = libs.associateWith { editSigning(get(it).readBytes(), signingEdits.getValue(it)) }
        replacements.forEach { (path, bytes) -> get(path).writeBytes(bytes) }
    }
}

internal val camscannerPolicyExtensionPatch = bytecodePatch {
    extendWith("extensions/camscanner-policy.mpe")
}

val camscannerSigningPatch = bytecodePatch(
    name = "CamScanner restore trust on re-signed builds",
    description = "Required compatibility for supported re-signed standard/Shizuku installs: preserve original request signing and recover exact obsolete/error-only API Center caches. No diagnostic overlays. No forced host, global signature spoofing, authentication-result changes or INTERNET grant. Root mount is not qualified.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.REQUIRED
    }
    dependsOn(camscannerInputPatch, camscannerSideloadStartupPatch,
        camscannerPolicyExtensionPatch, signingResources)
    execute {
        val model = "Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel;"
        val fetch = "Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel\$fetchAndLoadApisByEmail\$2;"
        val version = qualifiedCamScannerVersion(packageMetadata.versionName, packageMetadata.versionCode)
        // Validate both pristine definitions before any cache instrumentation.
        for ((type, expected) in mapOf(model to version.modelPin,
            fetch to "73f649d182b3d4362ad9ded0a180b7a51db055df8a9ef164b566f7ee038e719a")) {
            val pool = DexPool(Opcodes.forDexVersion(39))
            pool.internClass(classDefBy(type))
            val store = MemoryDataStore()
            pool.writeTo(store)
            require(matchesCamScannerClassPin(expected, sha256(store.data))) {
                "Unsupported or already modified login API cache coroutine"
        }
        }
        val sites = listOf(
            Triple(model, "〇O888o0o", listOf(10, version.cacheResultRegister, 8)),
            Triple(fetch, "invokeSuspend", listOf(5, 4, 4))
        ).map { (type, name, registers) ->
            val method = mutableClassDefBy(type).methods.single { it.name == name }
            val impl = requireNotNull(method.implementation)
            val code = impl.instructions.toList()
            require(impl.registerCount == registers[0]) { "Unsupported login API cache registers" }
            val index = code.indices.single {
                (code[it] as? ReferenceInstruction)?.reference.toString() ==
                    "Lcom/intsig/tianshu/utils/UserInfoSettingUtil;->O8(Ljava/lang/String;)Ljava/lang/String;"
            }
            require((code[index] as? FiveRegisterInstruction)?.let {
                it.registerCount == 1 && it.registerC == registers[2]
            } == true && code[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (code[index + 1] as OneRegisterInstruction).registerA == registers[1]) {
                "Unsupported login API cache lookup"
            }
            Triple(method, index + 2, registers[1])
        }
        // Validate both original cache sites before adding the passive policy.
        // A null result follows the existing cache-miss fetch/persist path.
        for ((method, index, result) in sites) method.addInstructions(index, """
            invoke-static {v$result}, Lapp/pigfoot/camscanner/LoginApiPolicy;->refreshLoginApis(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$result
        """.trimIndent())
    }
}

val camscannerLocalFeaturesPatch = bytecodePatch(
    name = "CamScanner local premium features", description = "Experimental local account-status features. Does not unlock server credits or cloud quotas.", default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(camscannerInputPatch, camscannerSigningPatch)
    val folderLimit by intOption(key = "folderLimit", default = 0, title = "Folder limit",
        values = mapOf("Keep original limit" to 0, "5000 folders" to 5000), required = true,
        validator = { it == 0 || it == 5000 })
    execute {
        val status = mutableClassDefBy(ACCOUNT).methods.single { m -> m.returnType == "J" &&
            m.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "qp3sdjd79xhdas02sd" } == true }
        require(status.implementation!!.registerCount >= 2)
        status.addInstructions(0, "const-wide/16 v0, 1\nreturn-wide v0")
        for (name in listOf("Oo8Oo00oo", "〇0000OOO", "o〇0OOo〇0")) stop(ACCOUNT, name, "()Z", "const/4 v0, 1\nreturn v0")
        stop("Lcom/intsig/camscanner/tsapp/sync/SyncUtil;", "o88O8", "()Z", "const/4 v0, 1\nreturn v0")
        if (folderLimit == 5000) stop("Lcom/intsig/camscanner/util/PreferenceHelper;", "o〇00O", "()I", "const/16 v0, 5000\nreturn v0")
    }
}

private val firebaseManifestPatch = resourcePatch {
    dependsOn(camscannerInputPatch)
    execute {
        document("AndroidManifest.xml").use { doc ->
            metadata(doc, "firebase_analytics_collection_deactivated", "true")
            metadata(doc, "firebase_analytics_collection_enabled", "false")
            run {
                metadata(doc, "firebase_crashlytics_collection_enabled", "false")
                metadata(doc, "firebase_performance_collection_deactivated", "true")
                metadata(doc, "firebase_sessions_enabled", "false")
            }
        }
    }
}
internal val camscannerFirebasePatch = bytecodePatch {
    compatibleWith(target)
    availability { installer, _ -> noNetwork(installer) }
    dependsOn(camscannerInputPatch, camscannerSideloadStartupPatch, firebaseManifestPatch)
    execute {
        stop(ANALYTICS, "〇o〇", "(Z)V")
        stop(ANALYTICS, "〇o00〇〇Oo", "(Ljava/lang/String;Landroid/os/Bundle;)V")
        val all = true
        val candidates = mutableClassDefBy(FABRIC).methods.filter { it.name != "<init>" && it.name != "<clinit>" &&
            it.name in setOf("O8", "OO0o〇〇〇〇0", "Oo08", "oO80", "o〇0", "〇080", "〇80〇808〇O", "〇o00〇〇Oo", "〇o〇", "〇〇888") }
        require(candidates.size == 10)
        for (m in candidates) {
            if (!all && m.name in setOf("〇o〇", "〇80〇808〇O")) continue
            m.addInstructions(0, if (m.returnType == "Z") "const/4 v0, 0\nreturn v0" else "return-void")
        }
        if (all) {
            // Persisted SDK overrides can win over manifest defaults. Enforce the arbiter too.
            val gates = mutableClassDefBy("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;")
                .methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
            require(gates.size == 2)
            gates.forEach { it.addInstructions(0, "const/4 v0, 0\nreturn v0") }
            for (m in mutableClassDefBy(CRASH).methods.filter { it.name in setOf("log", "recordException", "setUserId") && it.returnType == "V" }) m.addInstructions(0, "return-void")
            stop(CRASH, "setCrashlyticsCollectionEnabled", "(Z)V", "const/4 p1, 0")
            stop(CRASH, "setCrashlyticsCollectionEnabled", "(Ljava/lang/Boolean;)V", "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
            stop(CRASH, "sendUnsentReports", "()V")
            // Permanent deactivation is manifest-controlled; prevent later public API overrides too.
            val perf = mutableClassDefBy("Lcom/google/firebase/perf/FirebasePerformance;").methods
                .filter { it.name in setOf("o〇0", "〇〇888") && it.returnType == "V" }
            require(perf.size == 2)
            perf.forEach { it.addInstructions(0, "return-void") }
        }
    }
}

internal val camscannerLoggingPatch = bytecodePatch {
    compatibleWith(target)
    availability { installer, _ -> noNetwork(installer) }
    dependsOn(camscannerInputPatch, camscannerSideloadStartupPatch)
    execute {
        stop("Lcom/intsig/log/LogAgentHelper;", "oO", "()Z", "const/4 v0, 1\nreturn v0")
        for (m in mutableClassDefBy(LOG).methods.filter { it.returnType == "V" && it.name in setOf("record", "dispatchLogData", "readLogDataFromCache", "onConnected", "run", "action", "pageView", "trace") }) m.addInstructions(0, "return-void")
        stop(LOG, "setEnableConnect", "(Z)V", "const/4 p0, 0")
        stop(LOG, "setEnableConnectImpl", "(Z)V", "const/4 p1, 0")
        run {
            for (m in mutableClassDefBy("Lcom/intsig/log/LogUtils;").methods.filter { it.returnType == "V" && !it.name.startsWith("<") }) m.addInstructions(0, "return-void")
            stop("Lcom/intsig/log4a/Logger;", "〇〇888", "(Lcom/intsig/log4a/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V")
        }
    }
}

private val adsManifestPatch = resourcePatch {
    dependsOn(camscannerInputPatch)
    execute { document("AndroidManifest.xml").use { removeAdComponents(it) } }
}
val camscannerAdsPatch = bytecodePatch(
    name = "CamScanner disable ads", description = "Suppress qualified ad entry points with reviewed manifest cleanup. Rewarded videos are blocked by default; an explicit 7.27.0-only lottery skip experiment can forward the original task/code flow without video. Server grants are not guaranteed or overridden.", default = false
) {
    compatibleWith(target)
    availability { installer, _ -> noNetwork(installer) }
    dependsOn(camscannerInputPatch, camscannerSigningPatch, adsManifestPatch)
    val rewardedVideos by stringOption(key = "rewardedVideos", default = "block", title = "Rewarded videos",
        description = "Block by default. The lottery-only skip experiment requires online 7.27.0; it preserves actual server results, not guaranteed rewards. Includes scoped initialization recovery without diagnostics or extra quota queries.",
        values = mapOf("Block videos (no reward flow)" to "block",
            "Skip lottery video (experimental, 7.27.0 only)" to "skip-lottery"), required = true,
        validator = { it in setOf("block", "skip-lottery") })
    execute {
        if (rewardedVideos == "skip-lottery") {
            requireRewardSkipVersion(packageMetadata.versionName, packageMetadata.versionCode)
            for ((type, pin) in rewardSkipPins72701) {
                val pool = DexPool(Opcodes.forDexVersion(39)); pool.internClass(classDefBy(type))
                val store = MemoryDataStore(); pool.writeTo(store)
                require(matchesCamScannerClassPin(pin, sha256(store.data))) { "Unsupported or modified lottery callback path: $type" }
            }
            run {
                val pool = DexPool(Opcodes.forDexVersion(39)); pool.internClass(classDefBy(LOTTERY_WEB_CLIENT))
                val store = MemoryDataStore(); pool.writeTo(store)
                require(matchesCamScannerClassPin(LOTTERY_WEB_CLIENT_PIN, sha256(store.data))) {
                    "Unsupported or modified lottery initialization client"
                }
                val pageFinished = mutableClassDefBy(LOTTERY_WEB_CLIENT).methods.single {
                    it.name == "onPageFinished" && it.signature() == "(Landroid/webkit/WebView;Ljava/lang/String;)V"
                }
                installLotteryInitGuard(pageFinished)
            }
            val control = mutableClassDefBy(WATCH_CONTROL)
            val sites = RewardSkipSite.entries.map { site ->
                val method = control.methods.single { it.name == site.methodName }
                rewardSkipIndex(method, site) // Qualify both original shapes before mutating either method.
                method to site
            }
            for ((method, site) in sites) installRewardSkip(method, site)
        }
        for (t in adTargets) {
            val ret = t.descriptor.substringAfter(')')
            val code = when (ret) { "V" -> "return-void"; "Z", "I" -> "const/4 v0, 0\nreturn v0"; else -> error("Unqualified ad return type: $ret") }
            stop(t.type, t.name, t.descriptor, code)
        }
        stop("Lcom/intsig/camscanner/ads/csAd/CsAdUtil;", "O8", "(Ljava/lang/String;Lcom/intsig/camscanner/ads/csAd/bean/CsAdCommonBean;)Z", "const/4 v0, 0\nreturn v0")
    }
}
val camscannerOfflinePatch = resourcePatch(
    name = "CamScanner offline mode", description = "Revoke all app INTERNET declarations. Includes ad suppression; preserves real platform connectivity. External apps/services and offline error flows require device testing.", default = false
) {
    compatibleWith(target)
    availability { installer, _ -> noNetwork(installer) }
    dependsOn(camscannerInputPatch, camscannerSigningPatch, camscannerAdsPatch)
    execute {
        require(camscannerAdsPatch.options["rewardedVideos"].value == "block") {
            "Lottery video skipping requires online mode; do not combine it with offline mode"
        }
        document("AndroidManifest.xml").use { removeInternet(it) }
    }
}

val camscannerPrivacyPatch = bytecodePatch(
    name = "CamScanner reduce telemetry and app logging",
    description = "Suppress qualified Firebase Analytics/Crashlytics/Performance/Sessions and app network/cache/local logging. Preserve unrelated Firebase services. Not a guarantee of zero telemetry.",
    default = true
) {
    compatibleWith(target)
    availability { installer, _ -> if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED }
    dependsOn(camscannerInputPatch, camscannerSigningPatch, camscannerFirebasePatch, camscannerLoggingPatch)
}
