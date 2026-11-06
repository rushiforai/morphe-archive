package jp.futabanet.gaugau.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private val gaugau146 = Compatibility(
    name = "がうがう",
    packageName = "jp.futabanet.gaugau.app",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "1.46.0")),
)

private val gaugauManifestPatch = resourcePatch(
    name = "GauGau privacy manifest settings",
    description = "Disables Firebase auto-initialization and components and removes advertising attribution permissions.",
    default = false,
) {
    compatibleWith(gaugau146)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val android = "http://schemas.android.com/apk/res/android"
            val removedPermissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
            )
            val permissionNodes = (0 until root.childNodes.length)
                .mapNotNull { root.childNodes.item(it) as? Element }
                .filter { it.tagName == "uses-permission" && it.getAttributeNS(android, "name") in removedPermissions }
            permissionNodes.forEach(root::removeChild)

            val application = (0 until root.childNodes.length)
                .mapNotNull { root.childNodes.item(it) as? Element }
                .single { it.tagName == "application" }
            val appFlyerComponents = listOf("provider", "receiver", "service").flatMap { tag ->
                val nodes = application.getElementsByTagName(tag)
                (0 until nodes.length)
                    .mapNotNull { nodes.item(it) as? Element }
                    .filter { it.getAttributeNS(android, "name").contains("appsflyer", ignoreCase = true) }
            }
            appFlyerComponents.forEach { it.parentNode.removeChild(it) }

            // Opt-out flags alone still let FirebaseInitProvider construct FirebaseApp and run
            // SDK registrars. Remove the initializer and Firebase-owned background components
            // so trackers and FCM do not bootstrap on devices without GMS.
            val firebaseComponents = listOf("provider", "service", "receiver").flatMap { tag ->
                val nodes = application.getElementsByTagName(tag)
                (0 until nodes.length)
                    .mapNotNull { nodes.item(it) as? Element }
                    .filter { element ->
                        val name = element.getAttributeNS(android, "name")
                        name.startsWith("com.google.firebase.") ||
                            name.contains(".firebase.", ignoreCase = true)
                    }
            }
            firebaseComponents.forEach { it.parentNode.removeChild(it) }

            val meta = mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_messaging_auto_init_enabled" to "false",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )
            meta.forEach { (name, value) ->
                val nodes = application.getElementsByTagName("meta-data")
                val existing = (0 until nodes.length)
                    .mapNotNull { nodes.item(it) as? Element }
                    .firstOrNull { it.getAttributeNS(android, "name") == name }
                val element = existing ?: manifest.createElement("meta-data").also(application::appendChild)
                element.setAttributeNS(android, "android:name", name)
                element.setAttributeNS(android, "android:value", value)
            }
        }
    }
}

private fun MutableMethod.returnEarly(value: Any? = null) {
    checkNotNull(implementation) { "Cannot add an early return to abstract method $name." }
    val instructions = when (returnType) {
        "V" -> {
            require(value == null) { "Void method $name cannot return a value." }
            "return-void"
        }
        "Z" -> {
            val booleanValue = value as? Boolean ?: false
            "const/4 v0, ${if (booleanValue) "0x1" else "0x0"}\nreturn v0"
        }
        "Ljava/lang/String;" -> {
            val stringValue = value as? String
            if (stringValue == null) {
                "const/4 v0, 0x0\nreturn-object v0"
            } else {
                val escaped = stringValue
                    .replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                    .replace("\n", "\\n")
                    .replace("\r", "\\r")
                    .replace("\t", "\\t")
                "const-string v0, \"$escaped\"\nreturn-object v0"
            }
        }
        else -> error("Unsupported early return type $returnType in $name.")
    }
    addInstructions(0, instructions)
}

private fun MutableMethod.replaceBody(instructions: String) {
    val mutableImplementation = checkNotNull(implementation) { "Cannot replace abstract method $name." }
    for (index in mutableImplementation.instructions.indices.reversed()) {
        mutableImplementation.removeInstruction(index)
    }
    addInstructions(0, instructions)
}

private fun MutableMethod.replaceStringFieldRead(
    fieldOwner: String,
    fieldName: String,
    value: String,
) {
    val matches = implementation!!.instructions.indices.filter { index ->
        val reference = (implementation!!.instructions[index] as? ReferenceInstruction)
            ?.reference as? FieldReference
        reference?.definingClass == fieldOwner &&
            reference.name == fieldName &&
            reference.type == "Ljava/lang/String;"
    }
    check(matches.size == 1) {
        "Expected one read of $fieldOwner->$fieldName in $definingClass->$name, found ${matches.size}."
    }
    val index = matches.single()
    val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
    val escaped = value
        .replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("\t", "\\t")
    replaceInstruction(index, "const-string v$register, \"$escaped\"")
}

@Suppress("unused")
val gaugauPrivacyPatch = bytecodePatch(
    name = "GauGau privacy controls and favorites transfer",
    description = "Adds privacy controls and favorites transfer, disables tracker startup and Play Billing, and supports devices without Google services.",
    default = true,
) {
    compatibleWith(gaugau146)
    dependsOn(gaugauManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Avoid the protected startup VM payload; it reaches libpairipcore and crashes on this GMS-free repatched build.
        mutableClassDefBy("Lcom/pairip/StartupLauncher;")
            .methods.single { it.name == "launch" && it.returnType == "V" && it.parameterTypes.isEmpty() }
            .returnEarly()

        // PairIP's startup payload normally initializes this obfuscated Firebase resource key.
        // Restore the known key so FirebaseInitProvider can read its optional API key without a null lookup.
        val firebaseOptions = mutableClassDefBy("Lrc/i;").methods.single {
            it.name == "a" &&
                it.parameterTypes == listOf("Landroid/content/Context;") &&
                it.returnType == "Lrc/i;"
        }
        val firebaseApiKeyName = firebaseOptions.implementation!!.instructions.indices.single { index ->
            val reference = (firebaseOptions.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? FieldReference
            reference?.definingClass == "Lln/ip/HKffFhtDyOyD;" && reference.name == "COew"
        }
        val firebaseApiKeyRegister =
            (firebaseOptions.implementation!!.instructions[firebaseApiKeyName] as OneRegisterInstruction).registerA
        firebaseOptions.replaceInstruction(
            firebaseApiKeyName,
            "const-string v$firebaseApiKeyRegister, \"google_api_key\"",
        )

        // Skip the Java-side PairIP integrity and Play licensing checks too.
        mutableClassDefBy("Lcom/pairip/SignatureCheck;")
            .methods.single { it.name == "verifyIntegrity" && it.parameterTypes == listOf("Landroid/content/Context;") }
            .returnEarly()
        mutableClassDefBy("Lcom/pairip/licensecheck/LicenseClient;")
            .methods.single { it.name == "checkLicense" && it.parameterTypes == listOf("Landroid/content/Context;") }
            .returnEarly()

        // PairIP normally supplies this obfuscated WorkManager log string. With its startup VM
        // bypassed, Log.d(tag, null) crashes before WorkManager initialization completes. Skip
        // only the diagnostic log call and let WorkManager initialize normally.
        val workManagerInitializer = mutableClassDefBy("Landroidx/work/WorkManagerInitializer;")
            .methods.single {
                it.name == "b" &&
                    it.parameterTypes == listOf("Landroid/content/Context;") &&
                    it.returnType == "Ljava/lang/Object;"
            }
        val workManagerLogCalls = workManagerInitializer.implementation!!.instructions.indices.filter { index ->
            val reference = (workManagerInitializer.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Lr7/u;" &&
                reference.name == "a" &&
                reference.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
                reference.returnType == "V"
        }
        check(workManagerLogCalls.size == 1) {
            "Expected one WorkManager startup log call in GauGau 1.46.0, found ${workManagerLogCalls.size}."
        }
        workManagerInitializer.replaceInstruction(workManagerLogCalls.single(), "nop\nnop\nnop")

        // PairIP's VM also initializes strings embedded in WorkManager's obfuscated DAO and
        // migration classes. WorkManager is used by GauGau's image/prefetch workers, so keep it
        // enabled and restore the schema names it needs instead of disabling its initializer.
        mutableClassDefBy("Lbn/g;")
            .methods.single {
                it.name == "x" &&
                    it.parameterTypes == listOf("Landroid/content/Context;") &&
                    it.returnType == "V"
            }
            .replaceStringFieldRead("Lo7/KaI/DYgH;", "iJy", "androidx.work.workdb")

        val workSpecDao = mutableClassDefBy("La8/q;")
        listOf(
            Triple("Lh5/rt/KUPWpjZJXYt;", "xQoqeiRw", "flex_duration"),
            Triple("Li8/CxQs/pFoulfSZB;", "oBclGk", "backoff_policy"),
            Triple("Lsk/cq/TvBbzgUfwcz;", "AaYxtwIpEG", "next_schedule_time_override"),
            Triple("Lf8/pIU/AMYUGJ;", "svfyTfIgThtod", "required_network_request"),
            Triple("Lh5/rt/KUPWpjZJXYt;", "tsNHkLMhu", "output"),
            Triple(
                "Lcom/android/installreferrer/commons/eIyE/EKNMKDQiw;",
                "ziRegHNQQJdztj",
                "required_network_type",
            ),
            Triple("Lsd/UmC/JOLRcJLmWuVk;", "IsZCCexFUvTrDDF", "out_of_quota_policy"),
            Triple("Luf/AIwk/KTnCvPZFijTVfj;", "ljZDDq", "required_network_type"),
            Triple("Lln/ip/HKffFhtDyOyD;", "EmQGW", "state"),
        ).forEach { (owner, field, column) ->
            val matches = workSpecDao.methods.flatMap { method ->
                method.implementation?.instructions?.indices
                    ?.filter { index ->
                        val reference = (method.implementation!!.instructions[index] as? ReferenceInstruction)
                            ?.reference as? FieldReference
                        reference?.definingClass == owner &&
                            reference.name == field &&
                            reference.type == "Ljava/lang/String;"
                    }
                    ?.map { method to it }
                    .orEmpty()
            }
            check(matches.size == 1) {
                "Expected one WorkSpec column read of $owner->$field, found ${matches.size}."
            }
            matches.single().first.replaceStringFieldRead(owner, field, column)
        }

        // Existing WorkManager databases can pass through this migration even when a new install
        // avoids it. The VM-provided SQL fills nullable content-trigger blobs before the schema
        // makes them non-null; use WorkManager's published migration statement directly.
        mutableClassDefBy("Ls7/c;")
            .methods.single {
                it.name == "a" &&
                    it.parameterTypes == listOf("Lc7/c;") &&
                    it.returnType == "V"
            }
            .replaceStringFieldRead(
                "Lo7/KaI/DYgH;",
                "Xrnp",
                "UPDATE workspec SET content_uri_triggers = x'' WHERE content_uri_triggers is NULL",
            )

        // Room's WorkManager invalidation tracker creates a temporary SQLite table with this
        // standard pragma. PairIP leaves the obfuscated field null, which otherwise aborts the
        // worker database's onOpen callback on GMS-free builds.
        mutableClassDefBy("Lcom/google/android/gms/internal/play_billing/v;")
            .methods.single {
                it.name == "m" &&
                    it.parameterTypes == listOf("Lc7/c;") &&
                    it.returnType == "V"
            }
            .replaceStringFieldRead(
                "Lsk/cq/TvBbzgUfwcz;",
                "ySCjjwfUhD",
                "PRAGMA temp_store = MEMORY;",
            )

        // PairIP also initializes strings used while App.onCreate constructs its OkHttp cache.
        // Restore the Okio path-normalization dot constant so the HTTP cache's FileSystem can load.
        mutableClassDefBy("Lin/c;")
            .methods.single { it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .replaceStringFieldRead("Ldb/kYY/QDlwx;", "rOVUSySE", ".")

        // OkHttp builds its default TLS ConnectionSpecs from this registry during client startup.
        // These are CipherSuite.javaName values from OkHttp 4.12.0; the obfuscated VM fields are
        // otherwise null after StartupLauncher is skipped.
        val cipherSuiteRegistry = mutableClassDefBy("Lqm/m;").methods.single {
            it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        listOf(
            Triple("Led/vKO/xJHeWZwVYA;", "YgUTrP", "SSL_RSA_WITH_NULL_SHA"),
            Triple("Lh5/rt/KUPWpjZJXYt;", "TRr", "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256"),
            Triple("Lsk/cq/TvBbzgUfwcz;", "PaiBIAvJIjErJ", "TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA"),
            Triple("Led/vKO/xJHeWZwVYA;", "LNKzsVHQZOlYw", "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA"),
            Triple("Lu4/Wwa/TGAOWLtGZGbW;", "xTxjWXIgHsLx", "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384"),
        ).forEach { (owner, field, value) ->
            cipherSuiteRegistry.replaceStringFieldRead(owner, field, value)
        }

        // HTTP/2's static header table has one VM-provided entry between content-encoding and
        // content-length. Restore its standard name to avoid a null table key on first request.
        mutableClassDefBy("Lxm/f;")
            .methods.single { it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .replaceStringFieldRead("Ldb/kYY/QDlwx;", "DqxgFcSQwrnykN", "content-language")

        // Okio's quoted-text source scans for delimiters, comments and nested braces using this
        // byte set. Restore the scan set proactively so the same missing VM value cannot break
        // response-body processing after the app's HTTP client starts.
        mutableClassDefBy("Ljf/y;")
            .methods.single { it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .replaceStringFieldRead("Ldb/kYY/QDlwx;", "HfCAl", "\"#'/[]{}")

        // PairIP normally fills this obfuscated service-name field during startup. Without that
        // payload, SystemJobScheduler passes null to Context.getSystemService and WorkManager
        // crashes while constructing its scheduler. Use Android's stable JobScheduler service key.
        val systemJobScheduler = mutableClassDefBy("Lv7/a;").methods.single {
            it.name == "b" &&
                it.parameterTypes == listOf("Landroid/content/Context;") &&
                it.returnType == "Landroid/app/job/JobScheduler;"
        }
        val jobSchedulerServiceName = systemJobScheduler.implementation!!.instructions.indices.single { index ->
            val reference = (systemJobScheduler.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? FieldReference
            reference?.definingClass == "Landroidx/constraintlayout/widget/edLM/WYlnqT;" &&
                reference.name == "CdScXhr" &&
                reference.type == "Ljava/lang/String;"
        }
        val jobSchedulerServiceRegister =
            (systemJobScheduler.implementation!!.instructions[jobSchedulerServiceName] as OneRegisterInstruction).registerA
        systemJobScheduler.replaceInstruction(
            jobSchedulerServiceName,
            "const-string v$jobSchedulerServiceRegister, \"jobscheduler\"",
        )

        // GauGau runs an asynchronous Google Play Services gate during Application startup.
        // Report its success so the app does not open a Play Services recovery screen.
        mutableClassDefBy("Lbb/b;")
            .methods.single {
                it.name == "doInBackground" &&
                    it.parameterTypes == listOf("[Ljava/lang/Object;") &&
                    it.returnType == "Ljava/lang/Object;"
            }
            .addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v0
                    return-object v0
                """,
            )

        // The app hashes this value before using it as its server-side device token.
        val appOnCreate = mutableClassDefBy("Ljp/co/link_u/gaugau/App;")
            .methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
        val androidIdCalls = appOnCreate.implementation!!.instructions.indices.filter { index ->
            val reference = (appOnCreate.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Landroid/provider/Settings\$Secure;" &&
                reference.name == "getString" &&
                reference.parameterTypes == listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;")
        }
        check(androidIdCalls.size == 1) { "Expected one Android ID read in GauGau 1.46.0, found ${androidIdCalls.size}." }
        appOnCreate.replaceInstruction(
            androidIdCalls.single(),
            "invoke-static/range { p0 .. p0 }, Ljp/futabanet/gaugau/patch/DeviceId;->getId(Landroid/content/Context;)Ljava/lang/String;",
        )

        // AppsFlyer's init() schedules SDK work immediately, before start() is called. Its
        // executor thread factory reads a PairIP-initialized thread-name prefix, so merely
        // blocking start() still leaves a crash and lets tracker initialization run. Keep the
        // SDK inert from init onward; the app's later AppsFlyer calls are also blocked below.
        val appsFlyer = mutableClassDefBy("Lcom/appsflyer/internal/AFa1tSDK;")
        val blockedInitializers = appsFlyer.methods.filter { method ->
            method.name == "init" && method.returnType == "Lcom/appsflyer/AppsFlyerLib;"
        }
        check(blockedInitializers.isNotEmpty()) { "AppsFlyer init entry point was not found." }
        blockedInitializers.forEach { method ->
            check(method.parameterTypes.contains("Landroid/content/Context;")) {
                "Unexpected AppsFlyer init overload without a Context parameter."
            }
            method.addInstructions(0, "return-object p0")
        }

        // Stop AppsFlyer collection at its concrete SDK implementation.
        val blockedStarts = appsFlyer.methods.filter { method ->
            method.name == "start" && method.returnType == "V" &&
                method.parameterTypes.firstOrNull() == "Landroid/content/Context;"
        }
        check(blockedStarts.isNotEmpty()) { "AppsFlyer start entry point was not found." }
        blockedStarts.forEach { it.returnEarly() }
        appsFlyer.methods.filter { method ->
            method.name == "logEvent" && method.returnType == "V"
        }.forEach { it.returnEarly() }
        appsFlyer.methods.single { it.name == "setCustomerUserId" && it.returnType == "V" }
            .returnEarly()
        appsFlyer.methods.single { method ->
            method.name == "getAppsFlyerUID" && method.returnType == "Ljava/lang/String;"
        }.returnEarly("")
        appsFlyer.methods.filter { method ->
            method.name == "updateServerUninstallToken" && method.returnType == "V"
        }.forEach { it.returnEarly() }

        // Disable crash identity enrichment while preserving Firebase objects expected by app code.
        mutableClassDefBy("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
            .methods.single { it.name == "setUserId" && it.parameterTypes == listOf("Ljava/lang/String;") }
            .returnEarly()
        val crashlyticsGetInstance = appOnCreate.implementation!!.instructions.indices.single { index ->
            val reference = (appOnCreate.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;" &&
                reference.name == "getInstance" &&
                reference.parameterTypes.isEmpty()
        }
        val crashlyticsSetUserId = appOnCreate.implementation!!.instructions.indices.single { index ->
            val reference = (appOnCreate.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;" &&
                reference.name == "setUserId" &&
                reference.parameterTypes == listOf("Ljava/lang/String;")
        }
        check(crashlyticsSetUserId > crashlyticsGetInstance) {
            "Unexpected Firebase Crashlytics call order in GauGau Application.onCreate."
        }
        for (index in crashlyticsSetUserId downTo crashlyticsGetInstance) {
            appOnCreate.implementation!!.removeInstruction(index)
        }

        // Tapjoy is an optional offerwall/reward SDK. Refuse its network bootstrap.
        val tapjoy = mutableClassDefBy("Lcom/tapjoy/Tapjoy;")
        tapjoy.methods.filter { it.name == "connect" && it.returnType == "Z" }
            .forEach { it.returnEarly(false) }

        // MainActivity's startup coroutine only gathers advertising, FCM, and AppsFlyer IDs.
        // Skipping it also avoids the Google Play Services calls on GMS-free devices.
        mutableClassDefBy("Ljp/co/link_u/gaugau/feature/MainActivity;")
            .methods.single { it.name == "z" && it.returnType == "Ljava/lang/Object;" }
            .addInstructions(
                0,
                """
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                """,
            )

        // Block app-side analytics requests while leaving manga, account, and purchase APIs intact.
        val analyticsMethods = setOf(
            "C", "F", "G", "H", "K", "M", "N", "V", "W", "d0", "f0", "j0",
            "l", "m", "m0", "n", "q0", "u0", "w", "w0", "x", "y", "y0", "z",
        )
        val analyticsWrappers = mutableClassDefBy("Lkg/z1;").methods.filter { method ->
            method.returnType == "Ljava/lang/Object;" &&
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Lkg/c;" && reference.name in analyticsMethods
                } == true
        }
        check(analyticsWrappers.isNotEmpty()) { "GauGau analytics API wrappers were not found." }
        analyticsWrappers.forEach { method ->
            method.addInstructions(
                0,
                """
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                """,
            )
        }

        // PairIP normally fills several obfuscated property names used by Piano Analytics.
        // Restore inert, valid keys so the registry can initialize without those protected
        // startup values; Piano's event worker below remains disabled.
        val pianoPropertyRegistry = mutableClassDefBy("Lzf/l;")
        val pianoRegistryInitializer = pianoPropertyRegistry.methods.single {
            it.name == "<clinit>" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        listOf(
            Triple("Llf/Qr/PLahGyhZoqxkRi;", "jOvxefeOKlfp", "app_custom"),
            Triple("Llf/Qr/PLahGyhZoqxkRi;", "ZSpTcLCCl", "event_custom"),
            Triple("Lsi/Rh/qQgvybX;", "qcXKwUHGPnODO", "site_custom"),
            Triple("Llf/Qr/PLahGyhZoqxkRi;", "oOnrFFW", "source_custom"),
            Triple("Lkotlin/coroutines/Rsof/AoHRK;", "brmkEfaB", "portal_custom"),
        ).forEach { (owner, field, value) ->
            pianoRegistryInitializer.replaceStringFieldRead(owner, field, value)
        }
        pianoPropertyRegistry.methods.single {
            it.name == "a" &&
                it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == "V"
        }.replaceStringFieldRead("Lo9/nppy/EaBcErut;", "WMFkNCRXiFwJPu", "*")

        // GauGau constructs Piano Analytics even though collection is disabled. Its constructor
        // reads additional PairIP-only values and installs an analytics exception handler, so
        // leave the SDK object inert after its Object constructor has run.
        val pianoClientConstructor = mutableClassDefBy("Lwf/e;").methods.single {
            it.name == "<init>" && it.parameterTypes == listOf(
                "Landroid/content/Context;",
                "Lhc/d;",
                "Lwf/g;",
                "Lwf/g;",
            )
        }
        val pianoSuperCallIndex = pianoClientConstructor.implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Ljava/lang/Object;" &&
                reference.name == "<init>" &&
                reference.parameterTypes.isEmpty()
        }
        check(pianoSuperCallIndex >= 0) {
            "Unexpected Piano Analytics constructor shape; could not locate its Object constructor call."
        }
        pianoClientConstructor.addInstructions(pianoSuperCallIndex + 1, "return-void")
        mutableClassDefBy("Li7/a;")
            .methods.single { it.name == "t" && it.parameterTypes.isEmpty() && it.returnType == "Lkd/c;" }
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // Billing is unavailable without Play Store services. Keep the app's optional billing
        // objects inert so their PairIP-dependent initialization cannot prevent manga browsing.
        val billingClient = mutableClassDefBy("Lf8/a;")
        val billingConstructors = billingClient.methods.filter { method ->
            method.name == "<init>" && (
                method.parameterTypes == listOf("Lab/v;", "Ljp/co/link_u/gaugau/App;", "Lwf/j;", "Lad/b;") ||
                    method.parameterTypes == listOf("Lab/v;", "Ljp/co/link_u/gaugau/App;", "Lad/b;")
                )
        }
        check(billingConstructors.size == 2) { "Expected both GauGau BillingClient constructors." }
        billingConstructors.forEach { constructor ->
            val superCallIndex = constructor.implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Ljava/lang/Object;" &&
                    reference.name == "<init>" &&
                    reference.parameterTypes.isEmpty()
            }
            check(superCallIndex >= 0) { "Unexpected BillingClient constructor shape." }
            constructor.addInstructions(superCallIndex + 1, "return-void")
        }
        billingClient.methods.single { it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .returnEarly()

        mutableClassDefBy("Lwf/q;")
            .methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
            .returnEarly()
        mutableClassDefBy("Ljp/co/link_u/gaugau/feature/MainActivity;")
            .methods.single { it.name == "A" && it.returnType == "V" }
            .returnEarly()
        mutableClassDefBy("Loh/n;")
            .methods.single { it.name == "c" && it.returnType == "V" && it.parameterTypes.isEmpty() }
            .returnEarly()

        // ProfileInstaller is optional and its embedded baseline-profile asset is PairIP-backed.
        // Skip this optimization task when the asset name is unavailable.
        mutableClassDefBy("Lo6/d;")
            .methods.single {
                it.name == "t" &&
                    it.parameterTypes == listOf(
                        "Landroid/content/Context;",
                        "Ljava/util/concurrent/Executor;",
                        "Lo6/c;",
                        "Z",
                    ) &&
                    it.returnType == "V"
            }
            .returnEarly()

        // PairIP normally populates reflected superclass methods used by MainActivity's
        // lifecycle overrides. With its startup payload disabled those Method fields are null;
        // call the actual superclass methods directly so the Activity and settings UI can open.
        val mainActivity = mutableClassDefBy("Ljp/co/link_u/gaugau/feature/MainActivity;")
        mainActivity.methods.single {
            it.name == "onCreate" &&
                it.parameterTypes == listOf("Landroid/os/Bundle;") &&
                it.returnType == "V"
        }.replaceBody(
            "invoke-super { p0, p1 }, Llg/d;->onCreate(Landroid/os/Bundle;)V\nreturn-void",
        )
        mainActivity.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() }
            .replaceBody(
                """
                    invoke-super { p0 }, Lk/j;->onResume()V
                    invoke-static/range { p0 .. p0 }, Ljp/futabanet/gaugau/patch/GaugauActivityBridge;->setCurrentActivity(Landroid/app/Activity;)V
                    return-void
                """.trimIndent(),
            )
        mainActivity.methods.single { it.name == "onStart" && it.parameterTypes.isEmpty() }
            .replaceBody("invoke-super { p0 }, Lk/j;->onStart()V\nreturn-void")
        mainActivity.methods.single { it.name == "onStop" && it.parameterTypes.isEmpty() }
            .replaceBody("invoke-super { p0 }, Lk/j;->onStop()V\nreturn-void")

        // Add app-local ID and favorites transfer rows to GauGau's existing Compose settings page.
        val settings = mutableClassDefBy("Lej/a;")
            .methods.single {
                it.name == "d" &&
                    it.parameterTypes == listOf("Lkotlin/jvm/functions/Function1;", "Lf1/g0;", "I")
            }
        val settingsSectionClose = settings.implementation!!.instructions.indices.single { index ->
            val reference = (settings.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Lf1/g0;" &&
                reference.name == "q" &&
                reference.parameterTypes == listOf("Z")
        }
        settings.addInstructions(
            settingsSectionClose,
            "invoke-static/range { p1 .. p1 }, Ljp/futabanet/gaugau/patch/GaugauSettingsRows;->addRows(Ljava/lang/Object;)V",
        )

        // Hook after GauGau's parent callback has dispatched the SAF result.
        val activityResult = mutableClassDefBy("Lk/j;")
            .methods.single {
                it.name == "onActivityResult" &&
                    it.parameterTypes == listOf("I", "I", "Landroid/content/Intent;")
            }
        val parentResultCallbacks = activityResult.implementation!!.instructions.indices.filter { index ->
            val reference = (activityResult.implementation!!.instructions[index] as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == "Ld/m;" &&
                reference.name == "onActivityResult" &&
                reference.parameterTypes == listOf("I", "I", "Landroid/content/Intent;")
        }
        check(parentResultCallbacks.size == 1) {
            "Expected one parent onActivityResult call in GauGau 1.46.0, found ${parentResultCallbacks.size}."
        }
        activityResult.addInstructions(
            parentResultCallbacks.single() + 1,
            "invoke-static/range { p0 .. p3 }, Ljp/futabanet/gaugau/patch/FavoritesTransfer;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V",
        )

    }
}
