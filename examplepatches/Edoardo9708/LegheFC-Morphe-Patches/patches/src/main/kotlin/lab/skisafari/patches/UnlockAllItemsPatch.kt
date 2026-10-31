package lab.skisafari.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile

private const val PACKAGE_NAME = "com.yodo1.skisafarigp"
private const val IL2CPP_PATH = "lib/arm64-v8a/libil2cpp.so"
private const val METADATA_PATH = "assets/bin/Data/Managed/Metadata/global-metadata.dat"
private const val NATIVE_PATCH_PATH = "lib/arm64-v8a/libskisafariunlock.so"

private object SkiSafariResources {
    fun open(path: String) = SkiSafariResources::class.java.classLoader.getResourceAsStream(path)
}

// SHA-256 values are from the original Ski Safari 2.5 (108) APK set pulled from
// the Galaxy S23+. The patch adds its own helper library and never rewrites
// libil2cpp.so.
private const val EXPECTED_IL2CPP_SHA256 =
    "b24154995803633ab95eeea21836f67d74699b305a2ed631a2600c59dfdd639a"
private const val EXPECTED_METADATA_SHA256 =
    "b8d2786c3be10261c7c666ce8155f4d1d6d98ec994586e16334219a5fc0f5144"
private const val EXPECTED_PAIRIP_SHA256 =
    "b4b4cc04d323507ff577d86fffa809106ff22de033a783cf3d37752e1da19c0b"

// Desktop 1.20.0's full resource writer consumes lazily extracted unchanged
// native files twice. Read identity inputs directly from the source archive.
// Fail closed when this pinned host layout is unavailable (e.g. another patcher).
private fun ResourcePatchContext.readOnlyInputApk(): File = runCatching {
    val configField = ResourcePatchContext::class.java.getDeclaredField("config")
    configField.isAccessible = true
    val config = configField.get(this)
    val apkField = config.javaClass.getDeclaredField("apkFile")
    apkField.isAccessible = true
    (apkField.get(config) as File).also { require(it.isFile) }
}.getOrElse { error("Ski Safari Unlock: accesso APK in sola lettura non supportato da questo patcher.") }

private fun ZipFile.entrySha256(path: String): String {
    val entry = getEntry(path) ?: error("Ski Safari Unlock: file originale mancante: $path")
    val digest = MessageDigest.getInstance("SHA-256")
    getInputStream(entry).use { input ->
        val buffer = ByteArray(65536)
        while (true) {
            val count = input.read(buffer)
            if (count < 0) break
            digest.update(buffer, 0, count)
        }
    }
    return digest.digest().joinToString("") { "%02x".format(it.toInt() and 0xff) }
}

private val skiSafariUnlockNativeResources = rawResourcePatch {
    execute {
        require(packageMetadata.packageName == PACKAGE_NAME && packageMetadata.versionName == "2.5" &&
            packageMetadata.versionCode == "108") { "Ski Safari 2.5 (108) richiesto." }
        ZipFile(readOnlyInputApk()).use { apk ->
            require(apk.entrySha256(IL2CPP_PATH) == EXPECTED_IL2CPP_SHA256) {
                "Ski Safari Unlock: SHA-256 di libil2cpp.so non corrispondente; patch interrotta."
            }
            require(apk.entrySha256(METADATA_PATH) == EXPECTED_METADATA_SHA256) {
                "Ski Safari Unlock: metadata IL2CPP diversi dalla build 2.5 (108); patch interrotta."
            }
            require(apk.entrySha256("lib/arm64-v8a/libpairipcore.so") == EXPECTED_PAIRIP_SHA256) {
                "Ski Safari Unlock: runtime PairIP diverso dalla build analizzata."
            }
        }

        val helper = SkiSafariResources.open("skisafari/libskisafariunlock.so")
            ?: error("Ski Safari Unlock: libreria helper ARM64 assente dal bundle Morphe.")
        val output = get(NATIVE_PATCH_PATH)
        require(output.parentFile?.mkdirs() == true || output.parentFile?.isDirectory == true) {
            "Ski Safari Unlock: impossibile creare la directory ARM64 di destinazione."
        }
        helper.use { input -> output.outputStream().use { stream -> input.copyTo(stream) } }

        val bytes = output.readBytes()
        require(bytes.size > 4096 && bytes[0] == 0x7f.toByte() && bytes[1] == 0x45.toByte() &&
            bytes[2] == 0x4c.toByte() && bytes[3] == 0x46.toByte()) {
            "Ski Safari Unlock: libreria helper ELF incompleta o non valida."
        }
        require(bytes[4] == 2.toByte() && bytes[5] == 1.toByte() &&
            bytes[18] == 0xb7.toByte() && bytes[19] == 0.toByte()) {
            "Ski Safari Unlock: la libreria helper non e' ELF64 little-endian AArch64."
        }
    }
}

private val skiSafariAlternativeSdkEntry = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val ns = "http://schemas.android.com/apk/res/android"
            val root = document.documentElement
            require(root.getAttribute("package") == PACKAGE_NAME) { "Package inatteso nel manifest." }
            val app = root.getElementsByTagName("application").item(0) as Element
            require(app.getAttributeNS(ns, "name") == "com.pairip.application.Application") {
                "Application differente dalla build analizzata."
            }
            val nodes = app.getElementsByTagName("activity")
            val activities = (0 until nodes.length).map { nodes.item(it) as Element }
            val splash = activities.single {
                it.getAttributeNS(ns, "name") == "com.yodo1.android.sdk.view.SplashActivity"
            }
            val unity = activities.single {
                it.getAttributeNS(ns, "name") == "com.yodo1.plugin.u3d.Yodo1UnityActivity"
            }
            splash.setAttributeNS(ns, "android:name", "com.yodo1.android.sdk.view.SplashActivity1")
            unity.setAttributeNS(ns, "android:name", "com.yodo1.plugin.u3d.Yodo1LagacyUnityActivity")
            val metaNodes = app.getElementsByTagName("meta-data")
            val metadata = (0 until metaNodes.length).map { metaNodes.item(it) as Element }
                .filter { it.parentNode == app && it.getAttributeNS(ns, "name") == "YODO1_MAIN_CLASS" }
            require(metadata.size <= 1) { "YODO1_MAIN_CLASS duplicato." }
            val meta = metadata.singleOrNull() ?: document.createElement("meta-data").also {
                it.setAttributeNS(ns, "android:name", "YODO1_MAIN_CLASS")
                app.appendChild(it)
            }
            meta.setAttributeNS(ns, "android:value", "com.yodo1.plugin.u3d.Yodo1LagacyUnityActivity")
        }
    }
}

@Suppress("unused")
val skiSafariUnlockAllItemsPatch = bytecodePatch(
    name = "Ski Safari – Unlock All Items",
    description = "Experimental: invokes ShopItemHelper.UnlockAllItems once through UnityPlayer's verified game-thread queue after the profile is ready. Includes local APK startup compatibility; native VM callbacks and save persistence require device verification.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Ski Safari",
            packageName = PACKAGE_NAME,
            targets = listOf(AppTarget(version = "2.5"))
        )
    )
    dependsOn(skiSafariUnlockNativeResources, skiSafariAlternativeSdkEntry)
    extendWith("extensions/extension.mpe")

    execute {
        // Tested as an app-specific adaptation of the startup strategy documented
        // by Kirby1997/morphe-patches (BypassPairipPatch.kt, GPL-3.0).
        // Keep VMRunner and libpairipcore: SDK callbacks still depend on them.
        val startup = Fingerprint(
            definingClass = "Lcom/pairip/StartupLauncher;", name = "launch",
            returnType = "V", parameters = emptyList()
        ).method
        require(startup.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/pairip/VMRunner;" && ref.name == "invoke"
        } == true) { "Ski Safari Unlock: startup VM non corrispondente." }
        startup.addInstructions(0, "return-void")

        val attach = Fingerprint(
            definingClass = "Lcom/pairip/application/Application;", name = "attachBaseContext",
            returnType = "V", parameters = listOf("Landroid/content/Context;")
        ).method
        val attachBody = attach.implementation ?: error("Application priva di attachBaseContext.")
        val attachRefs = attachBody.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }
        val superCalls = attachBody.instructions.filter { it.opcode == Opcode.INVOKE_SUPER }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        require(attachBody.registerCount == 2 && attachBody.instructions.size == 4 && superCalls.size == 1 &&
            superCalls.single().definingClass == "Lcom/pairip/application/Application;" &&
            superCalls.single().name == "attachBaseContext" && attachRefs.any {
                it.definingClass == "Lcom/pairip/VMRunner;" && it.name == "setContext"
            } && attachRefs.any {
                it.definingClass == "Lcom/pairip/SignatureCheck;" && it.name == "verifyIntegrity"
            }) { "Ski Safari Unlock: catena Application non corrispondente." }
        attach.addInstructions(0, """
            invoke-super {p0, p1}, ${superCalls.single()}
            const-string v0, "SkiSafari-Unlock"
            const-string v1, "Avvio locale: inizializzazione Application completata."
            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            return-void
        """.trimIndent())

        val integrity = Fingerprint(
            definingClass = "Lcom/pairip/SignatureCheck;", name = "verifyIntegrity",
            returnType = "V", parameters = listOf("Landroid/content/Context;")
        ).method
        require(integrity.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/pairip/SignatureCheck;" && ref.name == "verifySignatureMatches"
        } == true) { "Ski Safari Unlock: controllo firma non corrispondente." }
        integrity.addInstructions(0, "return-void")

        val provider = Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;", name = "onCreate",
            returnType = "Z", parameters = emptyList()
        ).method
        require(provider.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/pairip/licensecheck/LicenseClient;" &&
                ref.name == "initializeLicenseCheck"
        } == true) { "Ski Safari Unlock: provider licenza non corrispondente." }
        // Omit the local startup gate; do not fabricate a license response or IAP receipt.
        provider.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        val directApp = Fingerprint(
            definingClass = "Lcom/yodo1/android/sdk/Yodo1Application1;", name = "onCreate",
            returnType = "V", parameters = emptyList()
        ).method
        val directCalls = directApp.implementation?.instructions?.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        } ?: error("Application1 priva di implementazione diretta.")
        val sdkCall = directCalls.single {
            it.definingClass == "Lcom/yodo1/bridge/api/Yodo1BridgeUtils;" && it.name == "gamesdk"
        }
        val sdkCreated = directCalls.single {
            it.definingClass == "Lcom/yodo1/bridge/interfaces/Yodo1SDKInterface;" && it.name == "onApplicationOnCreate"
        }
        val bridgeCreated = directCalls.single {
            it.definingClass == "Lcom/yodo1/bridge/api/Yodo1BridgeUtils;" && it.name == "onApplicationOnCreate"
        }
        require(directApp.implementation!!.instructions.size == 6) { "Application1 differente dalla versione analizzata." }
        val appCreated = Fingerprint(
            definingClass = "Lcom/yodo1/android/sdk/Yodo1Application;", name = "onCreate",
            returnType = "V", parameters = emptyList()
        ).method
        require(appCreated.implementation!!.registerCount >= 2 && appCreated.implementation!!.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/reflect/Method;" && ref.name == "invoke"
        }) { "Yodo1Application.onCreate non corrispondente." }
        // Reuse the actual unprotected lifecycle sequence shipped as Application1.
        appCreated.addInstructions(0, """
            invoke-super {p0}, Lcom/yodo1/android/sdk/base/Yodo1BaseApplication;->onCreate()V
            invoke-static {}, $sdkCall
            move-result-object v0
            invoke-interface {v0, p0}, $sdkCreated
            invoke-static {p0}, $bridgeCreated
            return-void
        """.trimIndent())

        // The SDK's bundled legacy activity predates Unity's Context constructor.
        // Widen its existing ContextWrapper argument to Context; preserve the object.
        Fingerprint(
            definingClass = "Lcom/unity3d/player/UnityPlayer;", name = "<init>",
            returnType = "V", parameters = listOf("Landroid/content/Context;")
        ).method
        val legacyPlayerInit = Fingerprint(
            definingClass = "Lcom/yodo1/plugin/u3d/Yodo1LagacyUnityActivity\$Yodo1UnityPlayer;",
            name = "<init>", returnType = "V", parameters = listOf(
                "Lcom/yodo1/plugin/u3d/Yodo1LagacyUnityActivity;", "Landroid/content/ContextWrapper;"
            )
        ).method
        val legacyInitBody = legacyPlayerInit.implementation ?: error("Costruttore legacy mancante.")
        val oldCalls = legacyInitBody.instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                ref?.definingClass == "Lcom/unity3d/player/UnityPlayer;" && ref.name == "<init>" &&
                ref.parameterTypes.toList() == listOf("Landroid/content/ContextWrapper;")
        }
        require(oldCalls.size == 1 && legacyInitBody.instructions.size == 3) { "Costruttore legacy inatteso." }
        val oldCall = oldCalls.single().value as FiveRegisterInstruction
        require(oldCall.registerCount == 2) { "Argomenti legacy inattesi." }
        legacyPlayerInit.replaceInstruction(oldCalls.single().index,
            "invoke-direct {v${oldCall.registerC}, v${oldCall.registerD}}, " +
                "Lcom/unity3d/player/UnityPlayer;-><init>(Landroid/content/Context;)V")

        // This constructor only validates a thread label and forwards it to HandlerThread.
        val sdkThread = Fingerprint(
            definingClass = "Lcom/ironsource/gk;", name = "<init>",
            returnType = "V", parameters = listOf("Ljava/lang/String;")
        ).method
        val threadBody = sdkThread.implementation ?: error("Thread SDK assente.")
        require(threadBody.registerCount == 3 && threadBody.instructions.size == 4 &&
            threadBody.instructions.any {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Landroid/os/HandlerThread;" && ref.name == "<init>"
            }) { "Costruttore thread SDK differente dalla build verificata." }
        sdkThread.addInstructions(0, """
            if-nez p1, :skisafari_thread_named
            const-string p1, "SkiSafari-SDK-Worker"
            :skisafari_thread_named
            nop
        """.trimIndent())

        // Recover the Binder descriptor from the same shipped client's interface
        // factory. Its obfuscated static holder is unset without VM startup.
        val shortcutsClass = "Lcom/google/android/gms/games/internal/v2/appshortcuts/zzu;"
        val shortcutsFactory = Fingerprint(
            definingClass = shortcutsClass, name = "createServiceInterface",
            returnType = "Landroid/os/IInterface;", parameters = listOf("Landroid/os/IBinder;")
        ).method
        val descriptor = shortcutsFactory.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }.single { it == "com.google.android.gms.games.internal.v2.appshortcuts.IAppShortcutsService" }
        val shortcutsDescriptor = Fingerprint(
            definingClass = shortcutsClass, name = "getServiceDescriptor",
            returnType = "Ljava/lang/String;", parameters = emptyList()
        ).method
        val descriptorBody = shortcutsDescriptor.implementation!!
        val descriptorField = descriptorBody.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.singleOrNull()
        require(descriptorBody.instructions.map { it.opcode } ==
            listOf(Opcode.CONST_4, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT) && descriptorField?.name == "srpkQlDaUO" &&
            descriptorField.definingClass == "Landroidx/compose/runtime/internal/NM/sYzcj;") {
            "Descrittore Binder diverso dalla build analizzata."
        }
        shortcutsDescriptor.addInstructions(0, "const-string v0, \"$descriptor\"\nreturn-object v0")

        val sdkConfig = Fingerprint(
            definingClass = "Lcom/yodo1/android/sdk/helper/b;", name = "a",
            returnType = "V", parameters = listOf("Landroid/content/Context;")
        ).method
        val prefixLoads = sdkConfig.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.SGET_OBJECT &&
                ref?.definingClass == "Lio/ktor/utils/io/cS/dZBISIzhBw;" && ref.name == "wjM"
        }
        require(prefixLoads.size == 1) { "Prefisso diagnostico SDK non corrispondente." }
        val prefixLoad = prefixLoads.single()
        sdkConfig.replaceInstruction(prefixLoad.index,
            "const-string v${(prefixLoad.value as OneRegisterInstruction).registerA}, \"Online configuration: \"")

        // Restore only the two SQL literals whose full schema is independently
        // described by the generated validation code in this exact database.
        val workClass = "Landroidx/work/impl/WorkDatabase_Impl\$1;"
        val sqlFixes = listOf(
            Triple("createAllTables", "Landroidx/compose/runtime/internal/NM/sYzcj;->llZhxNKPlkqUPdM:Ljava/lang/String;",
                "CREATE TABLE IF NOT EXISTS `WorkName` (`name` TEXT NOT NULL, `work_spec_id` TEXT NOT NULL, PRIMARY KEY(`name`, `work_spec_id`), FOREIGN KEY(`work_spec_id`) REFERENCES `WorkSpec`(`id`) ON UPDATE CASCADE ON DELETE CASCADE )"),
            Triple("onOpen", "Lcom/google/android/gms/common/internal/service/OAI/wKMUtYbMnXWqE;->nDMPQ:Ljava/lang/String;",
                "PRAGMA foreign_keys = ON")
        )
        for ((methodName, field, sql) in sqlFixes) {
            val method = Fingerprint(
                definingClass = workClass, name = methodName, returnType = "V",
                parameters = listOf("Landroidx/sqlite/db/SupportSQLiteDatabase;")
            ).method
            val loads = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString() == field
            }
            require(loads.size == 1) { "SQL WorkManager non corrispondente: $methodName" }
            val load = loads.single()
            method.replaceInstruction(load.index,
                "const-string v${(load.value as OneRegisterInstruction).registerA}, \"$sql\"")
        }

        val onlineFailure = Fingerprint(
            definingClass = "Lcom/yodo1/android/sdk/onlineconfig/Yodo1OnlineConfig\$2;",
            name = "onFailure", returnType = "V", parameters = listOf("I", "Ljava/lang/String;")
        ).method
        val headerInit = Fingerprint(
            definingClass = "Lokhttp3/internal/http2/Header;", name = "<clinit>",
            returnType = "V", parameters = emptyList()
        ).method
        val appLovinThreadFactory = Fingerprint(
            definingClass = "Lcom/applovin/impl/r5\$c;", name = "newThread",
            returnType = "Ljava/lang/Thread;", parameters = listOf("Ljava/lang/Runnable;")
        ).method
        val literalFixes = listOf(
            Triple(onlineFailure, "Lcn/thinkinganalyticsclone/android/utils/Re/fgtmeC;->TxdD:Ljava/lang/String;", "Online configuration failed: "),
            Triple(headerInit, "Lcom/moloco/sdk/xenoss/sdkdevkit/android/adrenderer/internal/templates/renderer/events/handlers/TGH/xgQksA;->WFP:Ljava/lang/String;", ":method"),
            Triple(appLovinThreadFactory, "Lcom/moloco/sdk/xenoss/sdkdevkit/android/adrenderer/internal/templates/renderer/events/handlers/TGH/xgQksA;->OrpOHqdJUUizXd:Ljava/lang/String;", "AppLovinSdk:")
        )
        for ((method, field, value) in literalFixes) {
            val loads = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString() == field
            }
            require(loads.size == 1) { "Costante SDK non corrispondente: $field" }
            val load = loads.single()
            method.replaceInstruction(load.index,
                "const-string v${(load.value as OneRegisterInstruction).registerA}, \"$value\"")
        }

        val workColumnFixes = listOf(
            Triple("getEligibleWorkForScheduling", "Lcom/digitalturbine/ignite/encryption/ukv/EAldoOOXMJJCV;->kemBJuJQe:Ljava/lang/String;", "minimum_retention_duration"),
            Triple("getScheduledWork", "Lcom/fyber/inneractive/sdk/network/timeouts/request/iu/SJWUDaHZc;->uucW:Ljava/lang/String;", "id"),
            Triple("getWorkSpec", "L_COROUTINE/RXQF/FUkJVOLOssol;->lVKBgJcTQZ:Ljava/lang/String;", "input")
        )
        for ((methodName, field, column) in workColumnFixes) {
            val method = Fingerprint(
                definingClass = "Landroidx/work/impl/model/WorkSpecDao_Impl;", name = methodName
            ).method
            val loads = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString() == field
            }
            require(loads.size == 1) { "Colonna WorkManager non corrispondente: $methodName" }
            val load = loads.single()
            method.replaceInstruction(load.index,
                "const-string v${(load.value as OneRegisterInstruction).registerA}, \"$column\"")
        }

        // Keys recovered from the matching official AppLovin 13.3.1 AAR,
        // SHA-256 ce34810afff4e1f9ccc5686b52daf21fa48c80772ff610763be90dacc5484a03.
        // Restore literals at their use sites, retaining every original default.
        val adSettings = Fingerprint(
            definingClass = "Lcom/applovin/impl/l4;", name = "<clinit>",
            returnType = "V", parameters = emptyList()
        ).method
        val adKeyFixes = listOf(
            Triple("Lcom/bytedance/adsdk/mTK/Hk/Vs/cYQuUaEdRNe;->yBloQnRPW:Ljava/lang/String;", "g", "rss"),
            Triple("Lcom/applovin/impl/privacy/cmp/kPb/cahijjeQHDGVHJ;->XivtyV:Ljava/lang/String;", "h", "rssoitf"),
            Triple("Lcom/unity3d/services/ads/operation/fd/nBSvEzkkf;->xvbYiYcnEcjqOMx:Ljava/lang/String;", "r", "logcat_max_line_size"),
            Triple("Lcom/bytedance/sdk/openadsdk/core/sm/mTK/phM/LgrO/JsLakKGcj;->oygfRtkyFvlvmF:Ljava/lang/String;", "j0", "ttc_acrsnv"),
            Triple("Lcom/apm/insight/g/fJR/rxjeIjJoNJOcQ;->zmbCXxjYhkwa:Ljava/lang/String;", "P0", "mdafra"),
            Triple("Lcom/mbridge/msdk/video/dynview/constant/WyVn/KcJixRj;->zkryZlKE:Ljava/lang/String;", "v2", "postitial_progress_bar_vertical_padding"),
            Triple("Landroidx/compose/runtime/internal/NM/sYzcj;->chDIfTr:Ljava/lang/String;", "E2", "submit_web_tracker_timeout"),
            Triple("Lcom/google/android/gms/common/internal/service/OAI/wKMUtYbMnXWqE;->awjR:Ljava/lang/String;", "M2", "http_socket_timeout"),
            Triple("Lcn/thinkingdata/analytics/utils/Sw/nowPMAJe;->gBpfLw:Ljava/lang/String;", "k4", "tmas")
        )
        for ((field, setting, key) in adKeyFixes) {
            val instructions = adSettings.implementation!!.instructions
            val loads = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString() == field
            }
            require(loads.size == 1) { "Chiave AppLovin non corrispondente: $setting" }
            val load = loads.single()
            val destination = instructions.drop(load.index + 1).take(14).firstOrNull {
                it.opcode == Opcode.SPUT_OBJECT &&
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == "Lcom/applovin/impl/l4;"
            }
            require(((destination as? ReferenceInstruction)?.reference as? FieldReference)?.name == setting) {
                "Destinazione impostazione AppLovin inattesa: $setting"
            }
            adSettings.replaceInstruction(load.index,
                "const-string v${(load.value as OneRegisterInstruction).registerA}, \"$key\"")
        }

        val legacyActivity = Fingerprint(
            definingClass = "Lcom/yodo1/plugin/u3d/Yodo1LagacyUnityActivity;", name = "onCreate",
            returnType = "V", parameters = listOf("Landroid/os/Bundle;")
        ).method
        val legacyBody = legacyActivity.implementation ?: error("Legacy Unity onCreate assente.")
        require(legacyBody.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/yodo1/plugin/u3d/Yodo1LagacyUnityActivity\$Yodo1UnityPlayer;" &&
                ref.name == "<init>"
        }) { "Legacy Unity differente dalla build analizzata." }
        val legacyReturn = legacyBody.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        require(legacyReturn >= 0) { "Legacy Unity onCreate senza return." }
        legacyActivity.addInstructions(legacyReturn,
            "invoke-static {p0}, Llab/skisafari/SkiSafariUnlock;->start(Landroid/app/Activity;)V")
        legacyActivity.addInstructions(0,
            "invoke-static {}, Llab/skisafari/SkiSafariUnlock;->prepareUnity()V")

        val unityQueue = Fingerprint(
            definingClass = "Lcom/unity3d/player/UnityPlayer;",
            name = "queueGLThreadEvent",
            returnType = "V",
            parameters = listOf("Ljava/lang/Runnable;")
        ).method
        val queueCalls = unityQueue.implementation?.instructions?.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        } ?: error("Ski Safari Unlock: dispatcher Unity assente.")
        require(queueCalls.any {
            it.definingClass == "Ljava/util/concurrent/ConcurrentLinkedQueue;" && it.name == "add"
        } && queueCalls.any {
            it.definingClass == "Ljava/lang/Runnable;" && it.name == "run"
        }) { "Ski Safari Unlock: dispatcher Unity differente dalla build verificata." }

        val unityActivity = Fingerprint(
            definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;")
        ).method
        val implementation = unityActivity.implementation
            ?: error("Ski Safari Unlock: UnityPlayerActivity.onCreate senza bytecode.")
        val references = implementation.instructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        }
        require(references.any {
            it.definingClass == "Lcom/unity3d/player/UnityPlayer;" && it.name == "<init>"
        } && references.any {
            it.definingClass == "Lcom/unity3d/player/UnityPlayerActivity;" &&
                it.name == "setContentView" && it.parameterTypes == listOf("Landroid/view/View;")
        } && references.any {
            it.definingClass == "Lcom/unity3d/player/UnityPlayer;" && it.name == "requestFocus"
        }) {
            "Ski Safari Unlock: UnityPlayerActivity non corrisponde alla build verificata; patch interrotta."
        }

        val returnIndex = implementation.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        require(returnIndex >= 0) { "Ski Safari Unlock: return di onCreate non trovato." }
        unityActivity.addInstructions(
            returnIndex,
            "invoke-static {p0}, Llab/skisafari/SkiSafariUnlock;->start(Landroid/app/Activity;)V"
        )
    }
}
