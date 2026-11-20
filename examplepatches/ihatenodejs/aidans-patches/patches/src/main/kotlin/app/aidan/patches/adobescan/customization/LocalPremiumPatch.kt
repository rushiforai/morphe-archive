/*
 * Reverse-engineering reference:
 * Doom's Morphe Patches — AdobeScanPremiumPatch.kt
 * https://github.com/rushiranpise/morphe-patches/blob/main/patches/src/main/kotlin/app/template/patches/adobescan/premium/AdobeScanPremiumPatch.kt
 *
 * The referenced implementation is licensed under GPL-3.0.
 * This implementation was independently written and substantially
 * redesigned for different entitlement behavior and feature scope.
 */

package app.aidan.patches.adobescan.customization

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import java.io.File
private const val UNAUTHENTICATED_USER_ENTITLEMENTS = "Lcr/d0\$a\$a;"
private const val AUTHENTICATED_USER_ENTITLEMENTS = "Lcr/y0;"
private const val SERVICE_ENTITLEMENTS = "Lwm/s;"
private const val COMPRESSION_LEVEL = "Loe/a;"
private const val SET_PASSWORD_ACTION = "Lzq/qb;"
private const val COMPRESS_ACTIVITY_ACTION = "Lcom/adobe/scan/android/services/CompressActivity\$e;"
internal const val COMPRESS_RESULT_CONSUMER = "Lzq/qa;"
private const val REMOVE_PASSWORD_HOST = "Lcom/adobe/scan/android/m;"
private const val SCAN_APPLICATION = "Lcom/adobe/scan/android/ScanApplication;"
private const val SPLIT_COMPAT_APPLICATION = "Ln20/b;"
internal const val RECENT_CARD_TOOL_ACTION = "Lzq/o3;"
private const val SCAN_FILE = "Lcom/adobe/scan/android/file/m0;"

private val ALL_ENTITLEMENT_METHODS = listOf(
    "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "r", "s", "t", "u"
)
internal var isLocalPdfCompressionActive: Boolean = false
internal var isLocalPdfExportActive: Boolean = false
internal var localPdfCompressionOption: Option<Boolean>? = null
internal var localPdfExportOption: Option<Boolean>? = null
private class AdobeScanPdfResourceHolder

@Suppress("unused")
val localPremiumPatch = compositeFeaturePatch(
    name = "Local Premium",
    description = "Enables locally executable premium OCR, editing, compression, and password protection tools without cloud or GenAI access.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)
    extendWith("extensions/extension.mpe")

    val enableLocalPdfCompression = booleanOption(
        key = "enableLocalPdfCompression",
        default = true,
        title = "Local PDF Compression",
        description = "Replaces Adobe Document Cloud post-save compression with on-device JPEG stream re-compression. Overrides Compress PDF removal when enabled."
    )
    localPdfCompressionOption = enableLocalPdfCompression

    val enableLocalPdfProtection = booleanOption(
        key = "enableLocalPdfProtection",
        default = true,
        title = "Local PDF Password Protection",
        description = "Replaces Adobe Document Cloud password encryption with AES-256 on-device PDF protection and offline removal."
    )

    val enableLocalPdfExport = booleanOption(
        key = "enableLocalPdfExport",
        default = true,
        title = "Local PDF Export",
        description = "Replaces Adobe Document Cloud export with on-device editable Word, Excel, and PowerPoint conversion. Layout reconstruction is best-effort."
    )
    localPdfExportOption = enableLocalPdfExport

    val enableLocalPdfCombine = booleanOption(
        key = "enableLocalPdfCombine",
        default = true,
        title = "Local PDF Combine",
        description = "Combines local Adobe Scan documents into a new PDF on device without changing the originals."
    )

    resources {
        document("AndroidManifest.xml").use { doc ->
            val appElement = doc.getElementsByTagName("application").item(0) as? org.w3c.dom.Element
                ?: throw PatchException("Application element not found in AndroidManifest.xml")

            val service = doc.createElement("service")
            service.setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "app.aidan.extension.adobescan.PdfTransformService")
            service.setAttributeNS("http://schemas.android.com/apk/res/android", "android:process", ":aidan_pdf")
            service.setAttributeNS("http://schemas.android.com/apk/res/android", "android:exported", "false")
            service.setAttributeNS("http://schemas.android.com/apk/res/android", "android:isolatedProcess", "true")
            appElement.appendChild(service)
        }

        val fileProviderDoc = try {
            document("res/xml/file_provider_paths.xml")
        } catch (e: Exception) {
            throw PatchException("Could not open res/xml/file_provider_paths.xml", e)
        }
        fileProviderDoc.use { doc ->
            val root = doc.documentElement
                ?: throw PatchException("res/xml/file_provider_paths.xml has no root element")
            var exists = false
            val children = root.childNodes
            for (i in 0 until children.length) {
                val child = children.item(i) as? org.w3c.dom.Element ?: continue
                if (child.getAttribute("name") == "aidan_scan_pdf") {
                    exists = true
                    break
                }
            }
            if (!exists) {
                val cachePath = doc.createElement("cache-path")
                cachePath.setAttribute("name", "aidan_scan_pdf")
                cachePath.setAttribute("path", "aidan-scan-pdf/")
                root.appendChild(cachePath)
            }
        }

        val stringResourceFiles = listOf(
            "res/values/strings.xml",
            "res/values-en/strings.xml",
            "res/values-en-rUS/strings.xml",
            "res/values-en-rGB/strings.xml",
            "res/values-en-rAU/strings.xml",
            "res/values-en-rCA/strings.xml",
            "res/values-en-rIN/strings.xml",
            "res/values-en-rNZ/strings.xml",
            "res/values-en-rXC/strings.xml"
        )
        for (path in stringResourceFiles) {
            runCatching {
                document(path).use { doc ->
                    val stringNodes = doc.getElementsByTagName("string")
                    for (i in 0 until stringNodes.length) {
                        val element = stringNodes.item(i) as? org.w3c.dom.Element ?: continue
                        if (element.getAttribute("name") == "file_list_export") {
                            element.textContent = "Export to Office"
                        }
                    }
                }
            }
        }
    }
    rawResources {
        val libDir = get("lib")
        if (libDir.exists()) {
            val subdirs = libDir.listFiles()?.filter { it.isDirectory }?.map { it.name } ?: emptyList()
            if (subdirs.isNotEmpty() && !subdirs.contains("arm64-v8a")) {
                throw PatchException("Unsupported target ABI(s): $subdirs. Only arm64-v8a is supported for local PDF engine.")
            }
        }
        copyRawResource(this, "adobescan/pdf/arm64-v8a/libaidanscanpdf.so", "lib/arm64-v8a/libaidanscanpdf.so")
        copyRawResource(this, "adobescan/pdf/ocr/eng.traineddata", "assets/aidan-scan-pdf/ocr/eng.traineddata")
        extractZipResource(this, "adobescan/pdf/assets/pdfbox-assets.zip", "assets/")
    }

    bytecode {
        val unlockCompress = enableLocalPdfCompression.value != false
        val unlockProtect = enableLocalPdfProtection.value != false
        val unlockExport = enableLocalPdfExport.value != false
        val unlockCombine = enableLocalPdfCombine.value != false
        isLocalPdfCompressionActive = unlockCompress
        isLocalPdfExportActive = unlockExport
        unlockEntitlements(UNAUTHENTICATED_USER_ENTITLEMENTS, ALL_ENTITLEMENT_METHODS)
        unlockEntitlements(AUTHENTICATED_USER_ENTITLEMENTS, ALL_ENTITLEMENT_METHODS)
        unlockTier(UNAUTHENTICATED_USER_ENTITLEMENTS)
        unlockTier(AUTHENTICATED_USER_ENTITLEMENTS)
        unlockSubscriptionStatus()
        unlockLocalServices(
            unlockCompress = unlockCompress,
            unlockProtect = unlockProtect,
            unlockExport = unlockExport,
            unlockCombine = unlockCombine
        )

        allowAllCompressionLevels()
        neutralizeCompressUpsell()
        removeFileOptionStarBadges()
        neutralizeFileOptionsUpsell()

        val anyLocalEnabled = unlockCompress || unlockProtect || unlockExport || unlockCombine
        if (anyLocalEnabled) {
            initCoordinator()
            addWorkerProcessGuards()
        }

        if (unlockCompress) {
            interceptCompressSelection()
            interceptCompressResult()
        }

        if (unlockProtect) {
            interceptSetPassword()
            interceptRemovePassword()
            hookScanFileDetectedProtection()
        }

        if (unlockExport || unlockCombine) {
            interceptFileOptionsActions(unlockExport, unlockCombine)
        }

        if (unlockExport) {
            interceptRecentSaveAsWord()
        }
    }
}

private fun copyRawResource(context: ResourcePatchContext, resourcePath: String, destPath: String) {
    val destFile = context.get(destPath)
    if (destPath.endsWith(".so")) {
        markUncompressed(destFile, destPath)
    }
    val stream = AdobeScanPdfResourceHolder::class.java.classLoader.getResourceAsStream(resourcePath)
        ?: AdobeScanPdfResourceHolder::class.java.getResourceAsStream("/$resourcePath")
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

private fun extractZipResource(context: ResourcePatchContext, resourcePath: String, destPrefix: String) {
    val stream = AdobeScanPdfResourceHolder::class.java.classLoader.getResourceAsStream(resourcePath)
        ?: AdobeScanPdfResourceHolder::class.java.getResourceAsStream("/$resourcePath")
        ?: throw PatchException("Bundled resource $resourcePath not found in patch resources")

    java.util.zip.ZipInputStream(stream).use { zip ->
        while (true) {
            val entry = zip.nextEntry ?: break
            if (entry.isDirectory) continue
            val destFile = context.get(destPrefix + entry.name)
            if (destFile.exists()) {
                continue
            }
            destFile.parentFile?.mkdirs()
            destFile.outputStream().use { out ->
                zip.copyTo(out)
            }
            zip.closeEntry()
        }
    }
}

private fun markUncompressed(destFile: File, destPath: String) {
    var cur: File? = destFile.parentFile
    val targets = mutableListOf<File>()
    while (cur != null) {
        val candidate = File(cur, "uncompressed-files.json")
        if (candidate.exists()) {
            targets.add(candidate)
            break
        }
        if (cur.name == "apk" || File(cur, "root").isDirectory) {
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

/**
 * Injects early return guards in ScanApplication and SplitCompat application base methods so that
 * the isolated worker process (:aidan_pdf) exits immediately before any Hilt, Adobe SDK, or SplitCompat
 * initialization can run.
 */
private fun BytecodePatchContext.addWorkerProcessGuards() {
    val scanAppClass = mutableClassDefByOrNull(SCAN_APPLICATION)
        ?: throw PatchException("Missing required application class $SCAN_APPLICATION")

    // 1. ScanApplication.<init>()V right after invoke-direct super constructor
    val initMethod = scanAppClass.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Missing <init>()V in $SCAN_APPLICATION")
    val initInstructions = initMethod.implementation?.instructions
        ?: throw PatchException("No implementation in $SCAN_APPLICATION.<init>")
    val superInitIdx = initInstructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_DIRECT
    }
    if (superInitIdx < 0) {
        throw PatchException("Could not find super <init> invocation in $SCAN_APPLICATION.<init>")
    }
    val targetInit = initInstructions[superInitIdx + 1]
    initMethod.addInstructionsWithLabels(
        superInitIdx + 1,
        """
        invoke-static {}, Lapp/aidan/extension/adobescan/PdfProcess;->isWorkerProcess()Z
        move-result v0
        if-eqz v0, :cond_not_worker_init
        return-void
        """.trimIndent(),
        ExternalLabel("cond_not_worker_init", targetInit)
    )
    // 2. ScanApplication.onCreate()V at entry
    val onCreateMethod = scanAppClass.methods.singleOrNull {
        it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Missing onCreate()V in $SCAN_APPLICATION")
    val onCreateInstructions = onCreateMethod.implementation?.instructions
        ?: throw PatchException("No implementation in $SCAN_APPLICATION.onCreate")
    val targetCreate = onCreateInstructions[0]
    onCreateMethod.addInstructionsWithLabels(
        0,
        """
        invoke-static {}, Lapp/aidan/extension/adobescan/PdfProcess;->isWorkerProcess()Z
        move-result v0
        if-eqz v0, :cond_not_worker_create
        return-void
        """.trimIndent(),
        ExternalLabel("cond_not_worker_create", targetCreate)
    )
    // 3. ScanApplication.attachBaseContext(Context)V right after super call
    val attachMethod = scanAppClass.methods.singleOrNull {
        it.name == "attachBaseContext" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Missing attachBaseContext(Context)V in $SCAN_APPLICATION")
    val attachInstructions = attachMethod.implementation?.instructions
        ?: throw PatchException("No implementation in $SCAN_APPLICATION.attachBaseContext")
    val superAttachIdx = attachInstructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER
    }
    if (superAttachIdx < 0) {
        throw PatchException("Could not find invoke-super in $SCAN_APPLICATION.attachBaseContext")
    }
    val targetAttach = attachInstructions[superAttachIdx + 1]
    attachMethod.addInstructionsWithLabels(
        superAttachIdx + 1,
        """
        invoke-static {}, Lapp/aidan/extension/adobescan/PdfProcess;->isWorkerProcess()Z
        move-result p1
        if-eqz p1, :cond_not_worker_attach
        return-void
        """.trimIndent(),
        ExternalLabel("cond_not_worker_attach", targetAttach)
    )
    // 4. SplitCompat n20/b.attachBaseContext(Context)V right after super call
    val splitCompatClass = mutableClassDefByOrNull(SPLIT_COMPAT_APPLICATION)
        ?: throw PatchException("Missing SplitCompat class $SPLIT_COMPAT_APPLICATION")
    val splitAttachMethod = splitCompatClass.methods.singleOrNull {
        it.name == "attachBaseContext" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Missing attachBaseContext(Context)V in $SPLIT_COMPAT_APPLICATION")
    val splitInstructions = splitAttachMethod.implementation?.instructions
        ?: throw PatchException("No implementation in $SPLIT_COMPAT_APPLICATION.attachBaseContext")
    val splitSuperIdx = splitInstructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER
    }
    if (splitSuperIdx < 0) {
        throw PatchException("Could not find invoke-super in $SPLIT_COMPAT_APPLICATION.attachBaseContext")
    }
    val targetSplit = splitInstructions[splitSuperIdx + 1]
    splitAttachMethod.addInstructionsWithLabels(
        splitSuperIdx + 1,
        """
        invoke-static {}, Lapp/aidan/extension/adobescan/PdfProcess;->isWorkerProcess()Z
        move-result p1
        if-eqz p1, :cond_not_worker_attach_b
        return-void
        """.trimIndent(),
        ExternalLabel("cond_not_worker_attach_b", targetSplit)
    )

    // 5. ScanApplication.onTrimMemory(int)V
    val onTrimMethod = scanAppClass.methods.singleOrNull {
        it.name == "onTrimMemory" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            it.returnType == "V" &&
            it.implementation != null
    }
    if (onTrimMethod != null) {
        val targetTrim = onTrimMethod.implementation?.instructions?.firstOrNull()
        if (targetTrim != null) {
            onTrimMethod.addInstructionsWithLabels(
                0,
                """
                invoke-static {}, Lapp/aidan/extension/adobescan/PdfProcess;->isWorkerProcess()Z
                move-result v0
                if-eqz v0, :cond_not_worker_trim
                return-void
                """.trimIndent(),
                ExternalLabel("cond_not_worker_trim", targetTrim)
            )
        }
    }
}

/**
 * Initializes the PdfOperationCoordinator in ScanApplication.onCreate() off-main recovery.
 */
private fun BytecodePatchContext.initCoordinator() {
    val scanAppClass = mutableClassDefByOrNull(SCAN_APPLICATION)
        ?: throw PatchException("Missing required application class $SCAN_APPLICATION")
    val onCreateMethod = scanAppClass.methods.singleOrNull {
        it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Missing onCreate()V in $SCAN_APPLICATION")

    // Insert after worker check (at end of worker guard block or line index)
    onCreateMethod.addInstructions(
        0,
        """
        move-object/from16 v0, p0
        invoke-static {v0}, Lapp/aidan/extension/adobescan/PdfOperationCoordinator;->initialize(Landroid/app/Application;)V
        """.trimIndent()
    )
}

/**
 * Enables the app's local premium predicates at both entitlement implementations.
 */
private fun BytecodePatchContext.unlockEntitlements(
    classDescriptor: String,
    methodNames: List<String>
) {
    val entitlements = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required Premium entitlement class $classDescriptor")
    methodNames.forEach { methodName ->
        val method = entitlements.methods.singleOrNull {
            it.name == methodName &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Z" &&
                it.implementation != null
        } ?: throw PatchException("Missing required Premium entitlement $classDescriptor->$methodName()Z")
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

/**
 * Forces the user's membership tier to SCAN_PREMIUM at both entitlement implementations so
 * profile cards, account headers, and tier gates recognize the active session as premium.
 */
private fun BytecodePatchContext.unlockTier(classDescriptor: String) {
    val entitlements = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required Premium entitlement class $classDescriptor")
    val pMethod = entitlements.methods.singleOrNull {
        it.name == "p" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Lcr/d\$h;" &&
            it.implementation != null
    } ?: throw PatchException("Missing required tier method $classDescriptor->p()Lcr/d\$h;")
    pMethod.addInstructions(0, "sget-object p0, Lcr/d\$h;->SCAN_PREMIUM:Lcr/d\$h;\nreturn-object p0")
}

/**
 * Neutralizes subscription status checks in SVService (Lwm/s;->B) to return true for Scan Premium,
 * Adobe Scan Plus, and Acrobat Premium subscriptions.
 */
private fun BytecodePatchContext.unlockSubscriptionStatus() {
    val serviceEntitlements = mutableClassDefByOrNull(SERVICE_ENTITLEMENTS)
        ?: throw PatchException("Missing required Premium service class $SERVICE_ENTITLEMENTS")
    val subMethods = serviceEntitlements.methods.filter {
        (it.name == "A" || it.name == "B") &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lln/e\$e;") &&
            it.returnType == "Z" &&
            it.implementation != null
    }
    if (subMethods.isEmpty()) {
        throw PatchException("Missing required Premium subscription check in $SERVICE_ENTITLEMENTS")
    }

    subMethods.forEach { method ->
        method.addInstructions(
            0,
            """
            sget-object v0, Lln/e${'$'}e;->SCAN_PREMIUM_SUBSCRIPTION:Lln/e${'$'}e;
            if-eq p0, v0, :local_premium_sub
            sget-object v0, Lln/e${'$'}e;->ADOBE_SCAN_PLUS:Lln/e${'$'}e;
            if-eq p0, v0, :local_premium_sub
            sget-object v0, Lln/e${'$'}e;->ACROBAT_PREMIUM_SUBSCRIPTION:Lln/e${'$'}e;
            if-ne p0, v0, :continue_sub_check
            :local_premium_sub
            const/4 v0, 0x1
            return v0
            :continue_sub_check
            """.trimIndent()
        )
    }
}

/**
 * Allows direct service checks for the local compression, editing, and Scan Premium gates without
 * enabling Document Cloud-only services.
 */
private fun BytecodePatchContext.unlockLocalServices(
    unlockCompress: Boolean,
    unlockProtect: Boolean,
    unlockExport: Boolean,
    unlockCombine: Boolean
) {
    val serviceEntitlements = mutableClassDefByOrNull(SERVICE_ENTITLEMENTS)
        ?: throw PatchException("Missing required Premium service class $SERVICE_ENTITLEMENTS")
    val serviceCheck = serviceEntitlements.methods.singleOrNull {
        it.name == "y" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lln/e\$g;") &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Missing required Premium service entitlement check")

    val compressCheck = if (unlockCompress) {
        """
        sget-object v0, Lln/e${'$'}g;->COMPRESSPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        """.trimIndent()
    } else {
        ""
    }

    val protectCheck = if (unlockProtect) {
        """
        sget-object v0, Lln/e${'$'}g;->PROTECTPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        """.trimIndent()
    } else {
        ""
    }

    val exportCheck = if (unlockExport) {
        """
        sget-object v0, Lln/e${'$'}g;->EXPORTPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        """.trimIndent()
    } else {
        ""
    }

    val combineCheck = if (unlockCombine) {
        """
        sget-object v0, Lln/e${'$'}g;->COMBINEPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        """.trimIndent()
    } else {
        ""
    }

    serviceCheck.addInstructions(
        0,
        """
        $compressCheck
        $protectCheck
        $exportCheck
        $combineCheck
        sget-object v0, Lln/e${'$'}g;->EDITPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        sget-object v0, Lln/e${'$'}g;->SCAN_PREMIUM_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        sget-object v0, Lln/e${'$'}g;->ADOBE_SCAN_PLUS:Lln/e${'$'}g;
        if-ne p0, v0, :continue_service_check
        :local_premium_service
        const/4 v0, 0x1
        return v0
        :continue_service_check
        """.trimIndent()
    )
}

/**
 * CompressionLevel.isPremiumLocked has exactly two direct callers, both in the local Save options
 * composable. Unlike the service-level checks, it has no cloud, account, billing, or GenAI callers.
 */
private fun BytecodePatchContext.allowAllCompressionLevels() {
    val compressionLevel = mutableClassDefByOrNull(COMPRESSION_LEVEL)
        ?: throw PatchException("Missing required local Premium class $COMPRESSION_LEVEL")
    val isPremiumLocked = compressionLevel.methods.singleOrNull {
        it.name == "isPremiumLocked" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Missing required local compression lock predicate")
    isPremiumLocked.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Neutralizes the compression upsell gate in util.a.n() so CompressActivity allows
 * compression execution without displaying the "Subscribe to compress files" banner.
 */
private fun BytecodePatchContext.neutralizeCompressUpsell() {
    val utilAClass = mutableClassDefByOrNull(SCAN_UTIL_A)
        ?: throw PatchException("Util class $SCAN_UTIL_A not found")
    val nMethod = utilAClass.methods.singleOrNull {
        it.name == "n" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Util method n not found in $SCAN_UTIL_A")

    nMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Intercepts the Set Password action in zq/qb to execute local AES-256 PDF protection
 * via PdfProtectionBridge instead of dispatching to Adobe Document Cloud.
 */
private fun BytecodePatchContext.interceptSetPassword() {
    val qbClass = mutableClassDefByOrNull(SET_PASSWORD_ACTION)
        ?: throw PatchException("Set password action class $SET_PASSWORD_ACTION not found")
    val invokeMethod = qbClass.methods.singleOrNull {
        it.name == "invoke" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    } ?: throw PatchException("Set password action invoke method not found in $SET_PASSWORD_ACTION")

    invokeMethod.addInstructions(
        0,
        """
        iget-object v0, p0, Lzq/qb;->a:Lcom/adobe/scan/android/m;
        iget-object v1, p0, Lzq/qb;->b:Lcom/adobe/scan/android/file/m0;
        check-cast p1, Ljava/lang/String;
        invoke-static {v0, v1, p1}, Lapp/aidan/extension/adobescan/PdfProtectionBridge;->protectFile(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V
        sget-object v0, Lk90/b0;->a:Lk90/b0;
        return-object v0
        """.trimIndent()
    )
}

/**
 * Intercepts the Remove Password action in com/adobe/scan/android/m.q1 to execute local
 * PDF decryption via PdfProtectionBridge instead of dispatching to Adobe Document Cloud.
 */
private fun BytecodePatchContext.interceptRemovePassword() {
    val mClass = mutableClassDefByOrNull(REMOVE_PASSWORD_HOST)
        ?: throw PatchException("Host class $REMOVE_PASSWORD_HOST not found")
    val q1Method = mClass.methods.singleOrNull {
        it.name == "q1" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(
                "Lcom/adobe/scan/android/file/m0;",
                "Ljava/lang/String;",
                "Ljava/util/HashMap;",
                "Lbr/j\$e;"
            ) &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Remove password method q1 not found in $REMOVE_PASSWORD_HOST")

    q1Method.addInstructions(
        0,
        """
        invoke-static {p0, p1, p2}, Lapp/aidan/extension/adobescan/PdfProtectionBridge;->unprotectFile(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V
        return-void
        """.trimIndent()
    )
}

/**
 * Hooks ScanFile.j() to ensure protected documents (status == 2) immediately reflect
 * forOpen = true in DetectedProtection, ensuring lock icons, labels, and menu items
 * appear without requiring a manual re-probe or action invocation.
 */
private fun BytecodePatchContext.hookScanFileDetectedProtection() {
    val m0Class = mutableClassDefByOrNull(SCAN_FILE)
        ?: throw PatchException("ScanFile class $SCAN_FILE not found")
    val jMethod = m0Class.methods.singleOrNull {
        it.name == "j" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Lcom/adobe/scan/android/file/m0\$b;" &&
            it.implementation != null
    } ?: throw PatchException("Method j() not found in $SCAN_FILE")

    jMethod.addInstructions(
        0,
        """
        invoke-static {p0}, Lapp/aidan/extension/adobescan/ScanFileAdapter;->getDetectedProtection(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Lcom/adobe/scan/android/file/m0${'$'}b;
        return-object v0
        """.trimIndent()
    )
}

/**
 * Intercepts the Compress button action in CompressActivity to return selection RESULT_OK
 * via selectCompression(Activity) without dispatching a cloud job from CompressActivity.
 */
private fun BytecodePatchContext.interceptCompressSelection() {
    val compressActionClass = mutableClassDefByOrNull(COMPRESS_ACTIVITY_ACTION)
        ?: throw PatchException("CompressActivity action class $COMPRESS_ACTIVITY_ACTION not found")
    val invokeMethod = compressActionClass.methods.singleOrNull {
        it.name == "invoke" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    } ?: throw PatchException("CompressActivity action invoke method not found in $COMPRESS_ACTIVITY_ACTION")

    invokeMethod.addInstructions(
        0,
        """
        iget-object v0, p0, Lkotlin/jvm/internal/d;->receiver:Ljava/lang/Object;
        check-cast v0, Landroid/app/Activity;
        invoke-static {v0}, Lapp/aidan/extension/adobescan/PdfCompressionBridge;->selectCompression(Landroid/app/Activity;)V
        sget-object v0, Lk90/b0;->a:Lk90/b0;
        return-object v0
        """.trimIndent()
    )
}

/**
 * Intercepts the compression selection result consumer in zq/qa to start the local
 * compression transform via onCompressionResult and prevents cloud dispatch.
 */
private fun BytecodePatchContext.interceptCompressResult() {
    val qaClass = mutableClassDefByOrNull(COMPRESS_RESULT_CONSUMER)
        ?: throw PatchException("Compress result consumer class $COMPRESS_RESULT_CONSUMER not found")
    val invokeMethod = qaClass.methods.singleOrNull {
        it.name == "invoke" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    } ?: throw PatchException("Compress result consumer invoke method not found in $COMPRESS_RESULT_CONSUMER")

    val qaInstructions = invokeMethod.implementation?.instructions
        ?: throw PatchException("No implementation in $COMPRESS_RESULT_CONSUMER.invoke")
    val targetQa = qaInstructions[0]
    invokeMethod.addInstructionsWithLabels(
        0,
        """
        move-object/from16 v0, p0
        move-object/from16 v1, p1
        iget-object v0, v0, Lzq/qa;->a:Lcom/adobe/scan/android/m;
        check-cast v1, Ll/a;
        iget v2, v1, Ll/a;->a:I
        iget-object v1, v1, Ll/a;->b:Landroid/content/Intent;
        invoke-static {v0, v2, v1}, Lapp/aidan/extension/adobescan/PdfCompressionBridge;->onCompressionResult(Landroid/app/Activity;ILandroid/content/Intent;)Z
        move-result v0
        if-eqz v0, :cond_native_compress_result
        sget-object v0, Lk90/b0;->a:Lk90/b0;
        return-object v0
        """.trimIndent(),
        ExternalLabel("cond_native_compress_result", targetQa)
    )
}

/**
 * Intercepts the Export PDF and Combine Files menu actions in qt/u to invoke their respective
 * local bridges directly without dispatching to Adobe Document Cloud or showing upsell banners.
 */
private fun BytecodePatchContext.interceptFileOptionsActions(
    unlockExport: Boolean,
    unlockCombine: Boolean
) {
    val helperClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("File options helper class $FILE_OPTIONS_MENU_HELPER not found")
    val cMethod = helperClass.methods.singleOrNull {
        it.name == "c" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(
                "Lcom/adobe/scan/android/m;",
                "Lqt/a;",
                "I",
                "Lz90/a;",
                "Lz90/a;",
                "Lz90/l;"
            ) &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("File options dispatch method c not found in $FILE_OPTIONS_MENU_HELPER")

    val exportBlock = if (unlockExport) {
        """
        move/from16 v0, p2
        const v1, 0x7f142395
        if-ne v0, v1, :cond_check_combine
        move-object/from16 v2, p4
        if-eqz v2, :skip_dismiss_export
        invoke-interface {v2}, Lz90/a;->invoke()Ljava/lang/Object;
        move-result-object v2
        :skip_dismiss_export
        move-object/from16 v0, p0
        move-object/from16 v1, p1
        if-eqz v1, :cond_export_null
        iget-object v1, v1, Lqt/a;->a:Ljava/util/List;
        if-eqz v1, :cond_export_null
        invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
        move-result v2
        if-nez v2, :cond_export_null
        const/4 v2, 0x0
        invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
        move-result-object v1
        goto :cond_export_call
        :cond_export_null
        const/4 v1, 0x0
        :cond_export_call
        invoke-static {v0, v1}, Lapp/aidan/extension/adobescan/PdfExportBridge;->show(Landroid/app/Activity;Ljava/lang/Object;)V
        return-void
        """.trimIndent()
    } else {
        ""
    }

    val combineBlock = if (unlockCombine) {
        """
        :cond_check_combine
        move/from16 v0, p2
        const v1, 0x7f142387
        if-ne v0, v1, :cond_after_local_actions
        move-object/from16 v2, p4
        if-eqz v2, :skip_dismiss_combine
        invoke-interface {v2}, Lz90/a;->invoke()Ljava/lang/Object;
        move-result-object v2
        :skip_dismiss_combine
        move-object/from16 v0, p0
        move-object/from16 v1, p1
        if-eqz v1, :cond_combine_null
        iget-object v1, v1, Lqt/a;->a:Ljava/util/List;
        goto :cond_combine_call
        :cond_combine_null
        const/4 v1, 0x0
        :cond_combine_call
        invoke-static {v0, v1}, Lapp/aidan/extension/adobescan/PdfCombineBridge;->show(Landroid/app/Activity;Ljava/util/List;)V
        return-void
        """.trimIndent()
    } else {
        ""
    }

    val afterLabel = if (unlockExport || unlockCombine) {
        """
        :cond_after_local_actions
        """.trimIndent()
    } else {
        ""
    }

    val fallbackCombineLabel = if (!unlockCombine && unlockExport) {
        """
        :cond_check_combine
        """.trimIndent()
    } else {
        ""
    }

    cMethod.addInstructions(
        0,
        """
        $exportBlock
        $fallbackCombineLabel
        $combineBlock
        $afterLabel
        """.trimIndent()
    )
}

/**
 * Intercepts the Save as Word Doc action on Recent scan cards in zq/o3 to invoke
 * PdfExportBridge.exportDocxDirect(Activity, Object) without cloud dispatch.
 */
private fun BytecodePatchContext.interceptRecentSaveAsWord() {
    val actionClass = mutableClassDefByOrNull(RECENT_CARD_TOOL_ACTION)
        ?: throw PatchException("Recent card action class $RECENT_CARD_TOOL_ACTION not found")
    val invokeMethod = actionClass.methods.singleOrNull {
        it.name == "invoke" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
                "Ljava/lang/Object;"
            ) &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    } ?: throw PatchException("Recent card action invoke method not found in $RECENT_CARD_TOOL_ACTION")

    invokeMethod.addInstructions(
        0,
        """
        move-object/from16 v0, p1
        sget-object v1, $FILE_LIST_TOOLS->r:Lod/ll;
        if-nez v1, :cond_check_word
        goto :cond_not_save_word
        :cond_check_word
        invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :cond_not_save_word
        move-object/from16 v0, p0
        iget-object v0, v0, $RECENT_CARD_TOOL_ACTION->a:Lcom/adobe/scan/android/FileBrowserActivity;
        move-object/from16 v1, p2
        invoke-static {v0, v1}, Lapp/aidan/extension/adobescan/PdfExportBridge;->exportDocxDirect(Landroid/app/Activity;Ljava/lang/Object;)V
        sget-object v0, Lk90/b0;->a:Lk90/b0;
        return-object v0
        :cond_not_save_word
        """.trimIndent()
    )
}

/**
 * Removes the blue star badge from File Options menu items by forcing
 * FileOptionsMenuBottomSheet.f(Boolean) to always return 0 (no badge).
 */
private fun BytecodePatchContext.removeFileOptionStarBadges() {
    val helperClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("File options helper class $FILE_OPTIONS_MENU_HELPER not found")
    val fMethod = helperClass.methods.singleOrNull {
        it.name == "f" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Boolean;") &&
            it.returnType == "I" &&
            it.implementation != null
    } ?: throw PatchException("File options badge method f not found in $FILE_OPTIONS_MENU_HELPER")

    fMethod.addInstructions(0, "const/4 p0, 0x0\nreturn p0")
}

/**
 * Neutralizes the File Options bottom sheet subscription upsell in qt/u.e so that
 * clicking any item never opens the subscription upsell dialog.
 */
private fun BytecodePatchContext.neutralizeFileOptionsUpsell() {
    val helperClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("File options helper class $FILE_OPTIONS_MENU_HELPER not found")
    val eMethod = helperClass.methods.singleOrNull {
        it.name == "e" &&
            it.parameterTypes.size == 6 &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("File options upsell method e not found in $FILE_OPTIONS_MENU_HELPER")

    eMethod.addInstructions(
        0,
        """
        move-object/from16 v0, p2
        if-eqz v0, :cond_skip_upsell_cb
        const/4 v1, 0x0
        invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v1
        invoke-interface {v0, v1}, Lz90/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
        :cond_skip_upsell_cb
        return-void
        """.trimIndent()
    )
}
