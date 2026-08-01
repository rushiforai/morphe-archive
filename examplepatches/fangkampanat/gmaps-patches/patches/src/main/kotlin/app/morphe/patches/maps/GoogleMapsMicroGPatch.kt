package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val ORIGINAL_PACKAGE_NAME = "com.google.android.apps.maps"
private const val PATCHED_PACKAGE_NAME = "app.morphe.android.apps.maps"
private const val ORIGINAL_CERT_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"
private const val ORIGINAL_CERT_SHA256 = "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
private const val ORIGINAL_CERT_SHA256_ANDROID_13_PLUS = "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053"
private const val GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms"
private const val GMS_CORE_VENDOR_GROUP = "app.revanced"
private const val C2DM_PACKAGE_NAME = "app.revanced.android.c2dm"
private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;"
private const val UTILS_CLASS = "Lapp/morphe/extension/shared/Utils;"

private val compatibility = Compatibility(
    name = "Google Maps",
    packageName = ORIGINAL_PACKAGE_NAME,
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x4285F4,
    signatures = setOf(ORIGINAL_CERT_SHA256, ORIGINAL_CERT_SHA256_ANDROID_13_PLUS),
    targets = listOf(
        AppTarget(
            version = "26.26.04.935742811",
            minSdk = 28,
        ),
        AppTarget(
            version = "26.27.05.941319029",
            minSdk = 28,
        ),
        AppTarget(
            version = "26.28.03.942936911",
            minSdk = 28,
        ),
        AppTarget(
            version = "26.29.02.946673643",
            minSdk = 28,
        ),
        AppTarget(
            version = "26.30.09.950492155",
            minSdk = 28,
        ),
    ),
)

private val manifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            patchManifest(document)
        }
    }
}

@Suppress("unused")
val googleMapsMicroGPatch = bytecodePatch(
    name = "Google Maps for ReVanced GmsCore",
    description = "Routes supported Google Maps builds through ReVanced GmsCore using the patched Maps package and known Google Maps certificate spoof metadata.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(manifestPatch)
    extendWith("extensions/maps.mpe")

    execute {
        rewriteGmsCoreStrings()
        patchExtensionRuntime()
        patchAvailabilityChecks()
        injectExtensionContext()
        injectGmsCoreCheck()
    }
}

private fun patchManifest(document: Document) {
    val manifest = document.documentElement
    manifest.setAttribute("package", PATCHED_PACKAGE_NAME)

    rewriteManifestAttributes(manifest)
    ensureQueryPackage(document, manifest)
    ensureSpoofMetadata(document)
}

private fun rewriteManifestAttributes(node: Node) {
    if (node is Element) {
        val attributes = node.attributes
        for (index in 0 until attributes.length) {
            val attribute = attributes.item(index)
            val name = attribute.nodeName
            val value = attribute.nodeValue

            attribute.nodeValue = when {
                name == "android:authorities" -> value.replaceOriginalPackage()
                name == "android:name" && value == "$ORIGINAL_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" -> value.replaceOriginalPackage()
                name == "android:name" && node.tagName in manifestPermissionTags -> value.rewriteManifestRoute()
                name in manifestPermissionAttributes -> value.replaceOriginalPackage().rewriteManifestRoute()
                else -> value
            }
        }
    }

    val children = node.childNodes
    for (index in 0 until children.length) {
        rewriteManifestAttributes(children.item(index))
    }
}

private fun String.replaceOriginalPackage() =
    replace(ORIGINAL_PACKAGE_NAME, PATCHED_PACKAGE_NAME)

private val manifestPermissionTags = setOf(
    "permission",
    "permission-group",
    "permission-tree",
    "uses-permission",
    "uses-permission-sdk-23",
)

private val manifestPermissionAttributes = setOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
)

private val manifestRouteReplacements = mapOf(
    "com.google.android.c2dm.permission.RECEIVE" to "$C2DM_PACKAGE_NAME.permission.RECEIVE",
    "com.google.android.c2dm.permission.SEND" to "$C2DM_PACKAGE_NAME.permission.SEND",
    "com.google.android.providers.gsf.permission.READ_GSERVICES" to "$GMS_CORE_VENDOR_GROUP.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.android.gms.permission.CAR_SPEED" to "$GMS_CORE_PACKAGE_NAME.permission.CAR_SPEED",
)

private fun String.rewriteManifestRoute() =
    manifestRouteReplacements[this] ?: this

private fun ensureQueryPackage(document: Document, manifest: Element) {
    val queries = manifest.directChildren("queries").firstOrNull()
        ?: document.createElement("queries").also { queriesNode ->
            val firstChild = manifest.firstChild
            if (firstChild == null) {
                manifest.appendChild(queriesNode)
            } else {
                manifest.insertBefore(queriesNode, firstChild)
            }
        }

    val exists = queries.directChildren("package").any {
        it.getAttribute("android:name") == GMS_CORE_PACKAGE_NAME
    }

    if (!exists) {
        val packageNode = document.createElement("package")
        packageNode.setAttribute("android:name", GMS_CORE_PACKAGE_NAME)
        queries.appendChild(packageNode)
    }
}

private fun ensureSpoofMetadata(document: Document) {
    val application = document.getElementsByTagName("application").item(0) as Element

    application.setMetadata(
        document,
        "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_NAME",
        ORIGINAL_PACKAGE_NAME,
    )
    application.setMetadata(
        document,
        "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_SIGNATURE",
        ORIGINAL_CERT_SHA1,
    )
    application.setMetadata(
        document,
        "$GMS_CORE_VENDOR_GROUP.MICROG_PACKAGE_NAME",
        GMS_CORE_PACKAGE_NAME,
    )
    application.setMetadata(
        document,
        "$GMS_CORE_PACKAGE_NAME.MICROG_PACKAGE_NAME",
        GMS_CORE_PACKAGE_NAME,
    )
}

private fun Element.setMetadata(document: Document, name: String, value: String) {
    val existing = directChildren("meta-data").firstOrNull {
        it.getAttribute("android:name") == name
    }

    val metadata = existing ?: document.createElement("meta-data").also(::appendChild)
    metadata.setAttribute("android:name", name)
    metadata.setAttribute("android:value", value)
}

private fun Element.directChildren(tagName: String): List<Element> {
    val result = mutableListOf<Element>()
    val children = childNodes

    for (index in 0 until children.length) {
        val child = children.item(index)
        if (child is Element && child.tagName == tagName) {
            result += child
        }
    }

    return result
}

private val exactGmsRoutes = """
com.google.android.c2dm.intent.RECEIVE
com.google.android.c2dm.intent.REGISTER
com.google.android.c2dm.intent.REGISTRATION
com.google.android.c2dm.permission.RECEIVE
com.google.android.c2dm.permission.SEND
com.google.android.contextmanager.service.ContextManagerService.START
com.google.android.gms
com.google.android.gms.audit.service.START
com.google.android.gms.auth.GOOGLE_SIGN_IN
com.google.android.gms.auth.accounts
com.google.android.gms.auth.api.credentials.service.START
com.google.android.gms.auth.api.signin.service.START
com.google.android.gms.auth.service.START
com.google.android.gms.chimera
com.google.android.gms.clearcut.service.START
com.google.android.gms.common.service.START
com.google.android.gms.common.telemetry.service.START
com.google.android.gms.droidguard.service.START
com.google.android.gms.facs.cache.service.START
com.google.android.gms.feedback.internal.IFeedbackService
com.google.android.gms.fonts
com.google.android.gms.gmscompliance.service.START
com.google.android.gms.googlehelp.HELP
com.google.android.gms.googlehelp.service.GoogleHelpService.START
com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE
com.google.android.gms.inappreach.service.START
com.google.android.gms.location.reporting.service.START
com.google.android.gms.location.settings.LOCATION_HISTORY
com.google.android.gms.locationsharingreporter.service.START
com.google.android.gms.people.service.START
com.google.android.gms.permission.CAR_SPEED
com.google.android.gms.phenotype
com.google.android.gms.phenotype.service.START
com.google.android.gms.pseudonymous.service.START
com.google.android.gms.semanticlocation.service.START_ODLH
com.google.android.gms.signin.service.START
com.google.android.gms.social.location.activity.service.START
com.google.android.gms.udc.service.START
com.google.android.gms.usagereporting.service.START
com.google.android.gms.wearable.BIND
com.google.android.gms.wearable.BIND_LISTENER
com.google.android.gms.wearable.DATA_CHANGED
com.google.android.gms.wearable.MESSAGE_RECEIVED
com.google.android.gms.wearable.NODE_CHANGED
com.google.android.gsf.action.GET_GLS
com.google.android.mobstore.service.START
com.google.android.providers.gsf.permission.READ_GSERVICES
com.google.firebase.dynamiclinks.service.START
com.google.iid.TOKEN_REQUEST
""".trimIndent().lines().toSet()

private val exactStringReplacements = mapOf(
    "com.google" to GMS_CORE_VENDOR_GROUP,
    "subscribedfeeds" to "$GMS_CORE_VENDOR_GROUP.subscribedfeeds",
    "$ORIGINAL_PACKAGE_NAME.SuggestionProvider" to "$PATCHED_PACKAGE_NAME.SuggestionProvider",
    "$ORIGINAL_PACKAGE_NAME.fileprovider" to "$PATCHED_PACKAGE_NAME.fileprovider",
)

private val exactGmsRouteReplacements = mapOf(
    "com.google.android.c2dm.permission.RECEIVE" to "$C2DM_PACKAGE_NAME.permission.RECEIVE",
    "com.google.android.c2dm.permission.SEND" to "$C2DM_PACKAGE_NAME.permission.SEND",
    "com.google.android.gms" to GMS_CORE_PACKAGE_NAME,
    "com.google.android.gms.auth.accounts" to "$GMS_CORE_PACKAGE_NAME.auth.accounts",
    "com.google.android.gms.chimera" to "$GMS_CORE_PACKAGE_NAME.chimera",
    "com.google.android.gms.fonts" to "$GMS_CORE_PACKAGE_NAME.fonts",
    "com.google.android.gms.permission.CAR_SPEED" to "$GMS_CORE_PACKAGE_NAME.permission.CAR_SPEED",
    "com.google.android.gms.phenotype" to "$GMS_CORE_PACKAGE_NAME.phenotype",
    "com.google.android.providers.gsf.permission.READ_GSERVICES" to "$GMS_CORE_VENDOR_GROUP.android.providers.gsf.permission.READ_GSERVICES",
)

private fun transformString(value: String): String? {
    val transformed = exactStringReplacements[value] ?: when (value) {
        in exactGmsRoutes -> value.toRevancedRoute()
        else -> value.toRevancedContentUriRoute()
    }

    return transformed.takeIf { it != value }
}

private fun String.toRevancedRoute() =
    exactGmsRouteReplacements[this] ?: this

private fun String.toRevancedContentUriRoute(): String = when {
    startsWith("content://com.google.android.gms.phenotype") ->
        replace("content://com.google.android.gms.phenotype", "content://$GMS_CORE_PACKAGE_NAME.phenotype")

    startsWith("content://com.google.android.gsf.gservices") ->
        replace("content://com.google.android.gsf.gservices", "content://$GMS_CORE_VENDOR_GROUP.android.gsf.gservices")

    startsWith("content://com.google.settings") ->
        replace("content://com.google.settings", "content://$GMS_CORE_VENDOR_GROUP.settings")

    startsWith("content://subscribedfeeds") ->
        replace("content://subscribedfeeds", "content://$GMS_CORE_VENDOR_GROUP.subscribedfeeds")

    else -> this
}

private fun stringReferenceOf(instruction: Any): StringReference? = when (instruction) {
    is Instruction21c -> instruction.reference as? StringReference
    is Instruction31c -> instruction.reference as? StringReference
    else -> null
}

private fun replacementFor(instruction: Any, transformed: String): BuilderInstruction? = when (instruction) {
    is Instruction21c -> BuilderInstruction21c(
        Opcode.CONST_STRING,
        instruction.registerA,
        ImmutableStringReference(transformed),
    )

    is Instruction31c -> BuilderInstruction31c(
        Opcode.CONST_STRING_JUMBO,
        instruction.registerA,
        ImmutableStringReference(transformed),
    )

    else -> null
}

private fun app.morphe.patcher.patch.BytecodePatchContext.rewriteGmsCoreStrings() {
    getAllClassesWithStrings().forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef)

        mutableClass.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach

            implementation.instructions.forEachIndexed { index, instruction ->
                val original = stringReferenceOf(instruction)?.string ?: return@forEachIndexed
                val transformed = transformString(original) ?: return@forEachIndexed
                val replacement = replacementFor(instruction, transformed) ?: return@forEachIndexed

                method.replaceInstruction(index, replacement)
            }
        }
    }
}

private fun mapsActivityOnCreateFingerprint(definingClass: String) = Fingerprint(
    definingClass = definingClass,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val mapsActivityOnCreateFingerprints = listOf(
    mapsActivityOnCreateFingerprint("Lmyl;"),
    mapsActivityOnCreateFingerprint("Lnai;"),
    mapsActivityOnCreateFingerprint("Lmzk;"),
    mapsActivityOnCreateFingerprint("Lnaa;"),
    mapsActivityOnCreateFingerprint("Lnap;"),
)

private fun mapsApplicationOnCreateFingerprint(definingClass: String) = Fingerprint(
    definingClass = definingClass,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

private val mapsApplicationOnCreateFingerprints = listOf(
    mapsApplicationOnCreateFingerprint("Lnwc;"),
    mapsApplicationOnCreateFingerprint("Lnya;"),
    mapsApplicationOnCreateFingerprint("Lnxe;"),
    mapsApplicationOnCreateFingerprint("Lnxw;"),
    mapsApplicationOnCreateFingerprint("Lnzo;"),
)

private val extensionVendorFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getGmsCoreVendorGroupId",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

private val extensionOriginalPackageFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getOriginalPackageName",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

private val serviceCheckFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

private fun googlePlayUtilityFingerprint(definingClass: String, name: String = "b") = Fingerprint(
    definingClass = definingClass,
    name = name,
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

private val googlePlayUtilityFingerprints = listOf(
    googlePlayUtilityFingerprint("Lbjgu;", "n"),
    googlePlayUtilityFingerprint("Lbjgy;", "n"),
    googlePlayUtilityFingerprint("Lbjhc;", "n"),
    googlePlayUtilityFingerprint("Lbjkw;", "n"),
    googlePlayUtilityFingerprint("Lbjqa;", "o"),
)

private fun app.morphe.patcher.patch.BytecodePatchContext.patchExtensionRuntime() {
    val vendorMethod = extensionVendorFingerprint.methodOrNull
        ?: throw PatchException("Failed to match GmsCore extension vendor hook")
    vendorMethod.addInstructions(
        0,
        """
            const-string v0, "$GMS_CORE_VENDOR_GROUP"
            return-object v0
        """.trimIndent(),
    )

    val originalPackageMethod = extensionOriginalPackageFingerprint.methodOrNull
        ?: throw PatchException("Failed to match GmsCore extension original package hook")
    originalPackageMethod.addInstructions(
        0,
        """
            const-string v0, "$ORIGINAL_PACKAGE_NAME"
            return-object v0
        """.trimIndent(),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchAvailabilityChecks() {
    serviceCheckFingerprint.methodOrNull?.addInstruction(0, "return-void")

    val method = googlePlayUtilityFingerprints.firstNotNullOfOrNull { it.methodOrNull }
        ?: throw PatchException("Failed to match Google Play services availability")

    method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.injectExtensionContext() {
    val method = mapsApplicationOnCreateFingerprints.firstNotNullOfOrNull { it.methodOrNull }
        ?: throw PatchException("Failed to match Maps application onCreate")

    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $UTILS_CLASS->setContext(Landroid/content/Context;)V",
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.injectGmsCoreCheck() {
    val method = mapsActivityOnCreateFingerprints.firstNotNullOfOrNull { it.methodOrNull }
        ?: throw PatchException("Failed to match Maps activity onCreate")

    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
    )
}
