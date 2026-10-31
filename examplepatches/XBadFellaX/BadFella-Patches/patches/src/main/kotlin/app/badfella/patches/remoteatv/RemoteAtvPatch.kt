package app.badfella.patches.remoteatv

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.InlineSmaliCompiler
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import org.w3c.dom.Element
import java.security.MessageDigest
import java.io.BufferedInputStream

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val ADS = "Lcom/google/android/gms/ads/"
private const val STATUS = "Lcom/google/android/gms/internal/ads/zzbqp;"

private fun replacement(method: Method, body: String): Method {
    val static = method.accessFlags and AccessFlags.STATIC.value != 0
    val registers = 8 + (if (static) 0 else 1) + method.parameterTypes.sumOf {
        if (it.toString() in setOf("J", "D")) 2 else 1
    }
    val instructions = InlineSmaliCompiler.compile(body, method.parameterTypes.joinToString(""), registers, static)
    return ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
        ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList()))
}

private val initializationStatus = """
    new-instance v0, Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    new-instance v1, $STATUS
    invoke-direct {v1, v0}, $STATUS-><init>(Ljava/util/HashMap;)V
"""

private val adError = """
    new-instance v0, ${ADS}LoadAdError;
    const/4 v1, 0x3
    const-string v2, "Ad requests disabled"
    const-string v3, "app.badfella"
    const/4 v4, 0x0
    const/4 v5, 0x0
    invoke-direct/range {v0 .. v5}, ${ADS}LoadAdError;-><init>(ILjava/lang/String;Ljava/lang/String;${ADS}AdError;${ADS}ResponseInfo;)V
"""

private fun restoredFramework(method: Method): String? = when (method.definingClass) {
    "Landroidx/work/impl/workers/CombineContinuationsWorker;",
    "Lcom/google/android/gms/ads/internal/offline/buffering/OfflineNotificationPoster;",
    "Lcom/google/android/gms/ads/internal/offline/buffering/OfflinePingSender;" -> """
        invoke-static {}, Lb2/o;->a()Lb2/n;
        move-result-object v0
        return-object v0
    """
    // ConstraintProxy: request the same constraints-changed command through SystemAlarmService.
    "Le2/c;" -> """
        new-instance v0, Landroid/content/Intent;
        const-class v1, Landroidx/work/impl/background/systemalarm/SystemAlarmService;
        invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
        const-string v1, "ACTION_CONSTRAINTS_CHANGED"
        invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
        invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
        return-void
    """
    // Media3's noisy-audio receiver posts its existing Runnable; it retains the enabled check.
    "Lt0/a;" -> """
        invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
        move-result-object v0
        const-string v1, "android.media.AUDIO_BECOMING_NOISY"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :done
        iget-object v0, p0, Lt0/a;->c:Landroid/os/Handler;
        invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
        :done
        return-void
    """
    else -> null
}

@Suppress("unused")
val remoteAtvAdFreePatch = resourcePatch(
    name = "Remote ATV ad-free",
    description = "Disables advertising, restores startup and replaces premium activation with a local ad-free status. Removes the home banner and its spacing. Does not create a server subscription.",
) {
    compatibleWith(Compatibility(
        name = "Remote for Android TV", packageName = "tech.simha.androidtvremote",
        apkFileType = ApkFileType.APKM, appIconColor = 0x127AFF,
        targets = listOf(AppTarget(
            version = "6.1.0", versionCode = 45,
            description = "Version 6.1.0, build 45.",
        )),
    ))
    execute {
        val hashes = mapOf(
            "classes.dex" to "a90f6968c6613b041d538a355fe7d2ed761a49c9b0963dc28cf82390a1841d38",
            "classes2.dex" to "9abd6c245a0c80d8515db2a44d087d6ae852c10d3a03451c813d695d0e286736",
            "classes3.dex" to "55602cddd9b0c9b15271fc287148d31d4d679210cdb9be408c4bc19e15ef6079",
        )
        check(listApkEntries().filter { Regex("classes\\d*\\.dex").matches(it) }.toSet() == hashes.keys)
        val dexFiles = hashes.map { (name, expected) ->
            get(name).also { file ->
                val actual = MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString("") { "%02x".format(it) }
                check(actual == expected) { "Unreviewed Remote ATV DEX: $name" }
            }
        }
        val vmAssets = mutableSetOf<String>()
        val edits = mutableMapOf<String, Int>()
        fun count(key: String) { edits[key] = (edits[key] ?: 0) + 1 }
        val fullscreen = setOf("interstitial/InterstitialAd;", "rewarded/RewardedAd;",
            "rewardedinterstitial/RewardedInterstitialAd;", "appopen/AppOpenAd;").map { ADS + it }.toSet()
        for (file in dexFiles) {
            val dex = DexFileFactory.loadDexFile(file, null)
            val retained = dex.classes.filterNot { it.type.startsWith("Lcom/pairip/") }.map { cls ->
                val methods = cls.methods.map { method ->
                    if (cls.type == "LE8/b;" && method.name == "d" &&
                        method.parameterTypes.map { it.toString() } == listOf("Ljava/util/HashMap;")) {
                        count("bannerUi")
                        val original = checkNotNull(method.implementation)
                        val implementation = MutableMethodImplementation(original)
                        val last = implementation.instructions.lastIndex
                        check(implementation.instructions[last].opcode == Opcode.RETURN_OBJECT &&
                            (implementation.instructions[last] as BuilderInstruction11x).registerA == 0)
                        // Replace at the return's location so branches also execute the override.
                        implementation.replaceInstruction(last, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                            0, 1, ImmutableMethodReference("Lapp/badfella/extension/remoteatv/AdFreeStatus;",
                                "hideBanner", listOf("Ljava/util/HashMap;"), "V")))
                        implementation.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
                        return@map ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                            method.accessFlags, method.annotations, method.hiddenApiRestrictions, implementation)
                    }
                    if (cls.type == "Lm8/c;" && method.name == "onPostResume" && method.parameterTypes.isEmpty()) {
                        count("statusUi")
                        val original = checkNotNull(method.implementation)
                        val implementation = MutableMethodImplementation(original)
                        implementation.addInstruction(0, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                            original.registerCount - 1, 1, ImmutableMethodReference(
                                "Lapp/badfella/extension/remoteatv/AdFreeStatus;", "install", listOf("Landroid/app/Activity;"), "V")))
                        return@map ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                            method.accessFlags, method.annotations, method.hiddenApiRestrictions, implementation)
                    }
                    val refs = method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>().orEmpty()
                    val vm = refs.any { (it.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Lcom/pairip/VMRunner;" && ref.name == "invoke"
                    } == true }
                    val params = method.parameterTypes.map { it.toString() }
                    val body: String? = when {
                        method.name == "<clinit>" && cls.type in setOf(
                            "Landroid/app/AppComponentFactory;", "Landroidx/core/app/CoreComponentFactory;"
                        ) -> {
                            check(refs.count { (it.reference as? MethodReference)?.let {
                                it.definingClass == "Lcom/pairip/StartupLauncher;" && it.name == "launch"
                            } == true } == 1) { "Unexpected component factory initializer" }
                            count("startup")
                            if (cls.type.startsWith("Landroid/")) """
                                new-instance v0, Ljava/lang/NoClassDefFoundError;
                                invoke-direct {v0}, Ljava/lang/NoClassDefFoundError;-><init>()V
                                throw v0
                            """ else "return-void"
                        }
                        vm -> {
                            refs.mapNotNull { (it.reference as? StringReference)?.string }.forEach { name ->
                                if (listApkEntries().contains("assets/$name")) vmAssets += "assets/$name"
                            }
                            count("vm")
                            restoredFramework(method) ?: when (method.returnType) {
                                "V" -> "return-void"
                                "Ljava/lang/Object;" -> "const/4 v0, 0x0\nreturn-object v0"
                                else -> error("Unreviewed virtualized return type: ${cls.type} ${method.name}")
                            }
                        }
                        cls.type == ADS + "MobileAds;" && method.name == "initialize" -> {
                            count("initialize")
                            if (params.size == 1) "return-void" else """
                                if-eqz p1, :done
                                $initializationStatus
                                invoke-interface {p1, v1}, ${ADS}initialization/OnInitializationCompleteListener;->onInitializationComplete(${ADS}initialization/InitializationStatus;)V
                                :done
                                return-void
                            """
                        }
                        cls.type == ADS + "MobileAds;" && method.name == "getInitializationStatus" -> {
                            count("status"); initializationStatus + "\nreturn-object v1"
                        }
                        cls.type in fullscreen && params.size == 4 && params.last().endsWith("LoadCallback;") -> {
                            check(method.returnType == "V" && method.accessFlags and AccessFlags.STATIC.value != 0)
                            count("fullscreen")
                            """
                                if-eqz p3, :done
                                $adError
                                invoke-virtual {p3, v0}, ${ADS}AdLoadCallback;->onAdFailedToLoad(${ADS}LoadAdError;)V
                                :done
                                return-void
                            """
                        }
                        cls.type == ADS + "BaseAdView;" && params == listOf(ADS + "AdRequest;") -> {
                            count("banner")
                            """
                                invoke-virtual {p0}, ${ADS}BaseAdView;->getAdListener()${ADS}AdListener;
                                move-result-object v6
                                if-eqz v6, :hide
                                $adError
                                invoke-virtual {v6, v0}, ${ADS}AdListener;->onAdFailedToLoad(${ADS}LoadAdError;)V
                                :hide
                                const/16 v0, 0x8
                                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                                return-void
                            """
                        }
                        cls.type == ADS + "AdLoader;" && params == listOf(ADS + "internal/client/zzek;") -> {
                            check(method.returnType == "V"); count("native"); "return-void"
                        }
                        cls.type == ADS + "AdLoader${'$'}Builder;" && params == listOf(ADS + "AdListener;") -> {
                            check(method.returnType == "V"); count("nativeListener")
                            """
                                if-eqz p1, :done
                                $adError
                                invoke-virtual {p1, v0}, ${ADS}AdListener;->onAdFailedToLoad(${ADS}LoadAdError;)V
                                :done
                                return-void
                            """
                        }
                        cls.type == "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;" && method.name == "getAdvertisingIdInfo" -> {
                            count("advertisingId")
                            """
                                new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                                const-string v1, ""
                                const/4 v2, 0x1
                                invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                                return-object v0
                            """
                        }
                        else -> null
                    }
                    if (body == null) method else replacement(method, body)
                }
                val fields = if (cls.type in remoteAtvStrings) {
                    check(cls.methods.none() && cls.fields.map { it.name }.toSet() == remoteAtvStrings.getValue(cls.type).keys)
                    count("strings")
                    cls.fields.map { field ->
                        check(field.type == "Ljava/lang/String;" && field.accessFlags and AccessFlags.STATIC.value != 0)
                        ImmutableField(field.definingClass, field.name, field.type, field.accessFlags,
                            ImmutableStringEncodedValue(remoteAtvStrings.getValue(cls.type).getValue(field.name)), field.annotations,
                            field.hiddenApiRestrictions)
                    }
                } else cls.fields
                ImmutableClassDef(cls.type, cls.accessFlags, cls.superclass, cls.interfaces, cls.sourceFile,
                    cls.annotations, fields, methods)
            }
            retained.forEach { cls ->
                cls.methods.forEach { method ->
                    method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.forEach { instruction ->
                        check(instruction.reference is StringReference || !instruction.reference.toString().contains("Lcom/pairip/")) {
                            "Removed PairIP code still referenced by ${cls.type} ${method.name}"
                        }
                    }
                }
            }
            val output = file.resolveSibling(file.name + ".tmp")
            try {
                DexPool.writeTo(output.absolutePath, ImmutableDexFile(dex.opcodes, retained))
                output.copyTo(file, overwrite = true)
            } finally { output.delete() }
        }
        check(edits == mapOf("strings" to 32, "startup" to 2, "vm" to 20, "initialize" to 2, "status" to 1, "fullscreen" to 4,
            "banner" to 1, "native" to 1, "nativeListener" to 1, "advertisingId" to 1, "statusUi" to 1, "bannerUi" to 1)) { "Remote ATV target inventory changed: $edits" }
        val extension = checkNotNull(object {}.javaClass.getResourceAsStream("/extensions/extension.mpe"))
        val helpers = extension.use { DexBackedDexFile.fromInputStream(null, BufferedInputStream(it)).classes
            .filter { cls -> cls.type.startsWith("Lapp/badfella/extension/remoteatv/") }.toList() }
        check(helpers.size in 1..5 && helpers.any { it.type == "Lapp/badfella/extension/remoteatv/AdFreeStatus;" }) {
            "Remote ATV status extension missing"
        }
        DexPool.writeTo(get("classes4.dex").absolutePath, ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(), helpers))
        vmAssets.forEach { delete(it) }
        // Reviewed startup program and native Flutter VM programs; other unclassified assets stay intact.
        listOf("UTELg0zg2FZVchNx", "NmBEKNcyk8bjBxrm", "QGtCuzjOaLducezY", "VUnTetccCRGWChJe")
            .forEach { name ->
                check("assets/$name" in listApkEntries()) { "Remote ATV VM asset missing: $name" }
                delete("assets/$name")
            }
        delete("assets/audience_network/")
        // Manager can discard unused ABI splits before patches run.
        val supportedAbis = setOf("arm64-v8a", "armeabi-v7a", "x86_64")
        val flutterLibraries = listApkEntries("lib/").filter { it.endsWith("/libflutter.so") }
        check(flutterLibraries.isNotEmpty()) { "Remote ATV has no Flutter library; select the original 6.1.0 APKM" }
        flutterLibraries.forEach { path ->
            val abi = path.removePrefix("lib/").substringBefore('/')
            check(abi in supportedAbis) { "Unreviewed Remote ATV architecture: $abi" }
            restoreRemoteAtvFlutter(abi, get("lib/$abi/libflutter.so"))
            patchRemoteAtvStatusLabels(abi, get("lib/$abi/libapp.so"))
        }
        listApkEntries("lib/").filter { it.endsWith("/libpairipcore.so") }.forEach { delete(it) }
        document("AndroidManifest.xml").use { manifest ->
            val app = manifest.getElementsByTagName("application").item(0) as Element
            check(app.getAttributeNS(ANDROID, "name") == "com.pairip.application.Application")
            app.setAttributeNS(ANDROID, "android:name", "android.app.Application")
            app.setAttributeNS(ANDROID, "android:extractNativeLibs", "true")
            val prefixes = listOf("com.pairip.", "com.google.android.gms.ads.", "com.facebook.ads.",
                "com.unity3d.", "com.fyber.", "com.inmobi.", "com.yandex.", "io.appmetrica.",
                "com.google.android.gms.measurement.", "com.google.android.datatransport.")
            val permissions = setOf("com.google.android.gms.permission.AD_ID", "com.android.vending.CHECK_LICENSE",
                "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE")
            val settings = mapOf("firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true", "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false", "google_analytics_adid_collection_enabled" to "false")
            val nodes = manifest.getElementsByTagName("*")
            for (i in nodes.length - 1 downTo 0) {
                val node = nodes.item(i) as Element
                val name = node.getAttributeNS(ANDROID, "name")
                if ((node.tagName in setOf("activity", "service", "receiver", "provider") && prefixes.any { name.startsWith(it) }) ||
                    (node.tagName == "uses-permission" && name in permissions) ||
                    (node.tagName == "meta-data" && name in settings)) node.parentNode.removeChild(node)
            }
            settings.forEach { (name, value) ->
                val node = manifest.createElement("meta-data")
                node.setAttributeNS(ANDROID, "android:name", name)
                node.setAttributeNS(ANDROID, "android:value", value)
                app.appendChild(node)
            }
        }
    }
}
