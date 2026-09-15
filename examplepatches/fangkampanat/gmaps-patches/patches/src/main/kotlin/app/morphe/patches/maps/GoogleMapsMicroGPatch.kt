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
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

private const val ORIGINAL_PACKAGE_NAME = "com.google.android.apps.maps"
private const val PATCHED_PACKAGE_NAME = "app.morphe.android.apps.maps"
private const val ORIGINAL_CERT_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"
private const val ORIGINAL_CERT_SHA256 = "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"
private const val ORIGINAL_CERT_SHA256_ANDROID_13_PLUS = "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053"
private const val GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms"
private const val GMS_CORE_VENDOR_GROUP = "app.revanced"
private const val C2DM_PACKAGE_NAME = "app.revanced.android.c2dm"
private const val MAIN_CLASS = "Lcom/google/android/maps/MapsActivity;"
private const val MAPS_APPLICATION_CLASS = "Lcom/google/android/apps/gmm/base/app/GoogleMapsApplication;"
private const val GOOGLE_API_CLIENT_BUILDER = "Lcom/google/android/gms/common/api/GoogleApiClient\$Builder;"
private const val CONNECTION_RESULT_CLASS = "Lcom/google/android/gms/common/ConnectionResult;"
private val logger = Logger.getLogger("app.morphe.patches.maps.GoogleMapsMicroGPatch")
private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;"
private const val UTILS_CLASS = "Lapp/morphe/extension/shared/Utils;"
private const val BYD_AUDIO_CLASS =
    "Lapp/morphe/extension/maps/patches/BydNavigationAudioPatch;"
private const val LOCATION_SERVICE_CLASS =
    "Lapp/morphe/extension/maps/patches/LocationServicePatch;"
private const val LOCATION_SERVICE_ACTION =
    "com.google.android.location.internal.GoogleLocationManagerService.START"

private val compatibility = Compatibility(
    name = "Google Maps Morphe",
    packageName = ORIGINAL_PACKAGE_NAME,
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x4285F4,
    signatures = setOf(ORIGINAL_CERT_SHA256, ORIGINAL_CERT_SHA256_ANDROID_13_PLUS),
    targets = listOf(
        AppTarget(
            version = null,
            isExperimental = false,
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
    name = "Google Maps for MicroG-RE-BYD",
    description = "Connects supported Google Maps builds to MicroG-RE-BYD, with BYD navigation audio and compatibility with devices that also have official Google Play services.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(manifestPatch)
    extendWith("extensions/maps.mpe")

    execute {
        rewriteGmsCoreStrings()
        patchLocationServiceAction()
        patchExtensionRuntime()
        patchAvailabilityChecks()
        suppressMisleadingPlayServicesUpdateNotification()
        patchBydNavigationAudio()
        injectExtensionContext()
        injectGmsCoreCheck()
    }
}

private fun patchManifest(document: Document) {
    val manifest = document.documentElement
    val appOwnedPermissionRenames = collectAppOwnedPermissionRenames(document)

    manifest.setAttribute("package", PATCHED_PACKAGE_NAME)

    rewriteManifestAttributes(manifest, appOwnedPermissionRenames)
    validateAppOwnedPermissionRenames(document, appOwnedPermissionRenames)
    ensureQueryPackage(document, manifest)
    ensureSpoofMetadata(document)
}

private fun collectAppOwnedPermissionRenames(document: Document): Map<String, String> {
    val renames = linkedMapOf<String, String>()

    manifestPermissionDeclarationTags.forEach { tagName ->
        val declarations = document.getElementsByTagName(tagName)
        for (index in 0 until declarations.length) {
            val declaration = declarations.item(index) as? Element ?: continue
            val name = declaration.getAttribute("android:name")
            if (name.isBlank()) continue

            renames[name] = when {
                name.startsWith("$ORIGINAL_PACKAGE_NAME.") ->
                    name.replaceFirst(ORIGINAL_PACKAGE_NAME, PATCHED_PACKAGE_NAME)

                name.startsWith('.') -> "$PATCHED_PACKAGE_NAME$name"
                else -> "${PATCHED_PACKAGE_NAME}_$name"
            }
        }
    }

    return renames
}

private fun rewriteManifestAttributes(
    node: Node,
    appOwnedPermissionRenames: Map<String, String>,
) {
    if (node is Element) {
        val attributes = node.attributes
        for (index in 0 until attributes.length) {
            val attribute = attributes.item(index)
            val name = attribute.nodeName
            val value = attribute.nodeValue

            attribute.nodeValue = when {
                name == "android:authorities" -> value.replaceOriginalPackage()
                name == "android:name" && node.tagName in manifestPermissionTags ->
                    appOwnedPermissionRenames[value] ?: value.rewriteManifestRoute()

                name in manifestPermissionAttributes ->
                    appOwnedPermissionRenames[value] ?: value.rewriteManifestRoute()

                else -> value
            }
        }
    }

    val children = node.childNodes
    for (index in 0 until children.length) {
        rewriteManifestAttributes(children.item(index), appOwnedPermissionRenames)
    }
}

private fun validateAppOwnedPermissionRenames(
    document: Document,
    appOwnedPermissionRenames: Map<String, String>,
) {
    if (appOwnedPermissionRenames.isEmpty()) return

    val oldNames = appOwnedPermissionRenames.keys
    val staleNames = linkedSetOf<String>()

    fun collectStaleNames(node: Node) {
        if (node is Element) {
            val attributes = node.attributes
            for (index in 0 until attributes.length) {
                val attribute = attributes.item(index)
                val isPermissionName =
                    attribute.nodeName == "android:name" && node.tagName in manifestPermissionTags
                val isPermissionReference = attribute.nodeName in manifestPermissionAttributes

                if ((isPermissionName || isPermissionReference) && attribute.nodeValue in oldNames) {
                    staleNames += attribute.nodeValue
                }
            }
        }

        val children = node.childNodes
        for (index in 0 until children.length) {
            collectStaleNames(children.item(index))
        }
    }

    collectStaleNames(document.documentElement)
    if (staleNames.isNotEmpty()) {
        throw PatchException("Failed to rename app-owned permissions: ${staleNames.joinToString()}")
    }

    val declaredNames = manifestPermissionDeclarationTags.flatMap { tagName ->
        val declarations = document.getElementsByTagName(tagName)
        buildList {
            for (index in 0 until declarations.length) {
                val declaration = declarations.item(index) as? Element ?: continue
                add(declaration.getAttribute("android:name"))
            }
        }
    }.toSet()
    val missingDeclarations = appOwnedPermissionRenames.values - declaredNames

    if (missingDeclarations.isNotEmpty()) {
        throw PatchException(
            "Missing renamed app-owned permission declarations: ${missingDeclarations.joinToString()}",
        )
    }
}

private fun String.replaceOriginalPackage() =
    replace(ORIGINAL_PACKAGE_NAME, PATCHED_PACKAGE_NAME)

private val manifestPermissionDeclarationTags = setOf(
    "permission",
    "permission-group",
    "permission-tree",
)

private val manifestPermissionTags = manifestPermissionDeclarationTags + setOf(
    "uses-permission",
    "uses-permission-sdk-23",
)

private val manifestPermissionAttributes = setOf(
    "android:permission",
    "android:permissionGroup",
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
    val transformed = exactStringReplacements[value]
        ?: exactGmsRouteReplacements[value]
        ?: value.toRevancedContentUriRoute()

    return transformed.takeIf { it != value }
}

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

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLocationServiceAction() {
    // Both inspected targets have two action getters with exactly const-string/return-object.
    // Match the protocol literal and method shape rather than a version-specific class name.
    val methods = getAllClassesWithStrings()
        .filterNot { it.type.startsWith("Lapp/morphe/extension/") }
        .flatMap { mutableClassDefBy(it).methods }
        .filter { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    stringReferenceOf(it)?.string == LOCATION_SERVICE_ACTION
                } == true
        }.toList()
    if (methods.size != 2) {
        throw PatchException("Expected two Maps location action getters, found ${methods.size}")
    }
    methods.forEach { method ->
        val instructions = method.implementation!!.instructions.toList()
        val register = when (val first = instructions.first()) {
            is Instruction21c -> first.registerA
            is Instruction31c -> first.registerA
            else -> throw PatchException("Unexpected Maps location action instruction")
        }
        if (instructions.size != 2 ||
            stringReferenceOf(instructions.first())?.string != LOCATION_SERVICE_ACTION ||
            instructions.last().opcode != Opcode.RETURN_OBJECT ||
            (instructions.last() as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction)
                ?.registerA != register
        ) {
            throw PatchException("Unexpected Maps location action getter shape")
        }
        method.replaceInstruction(
            0, "invoke-static {}, $LOCATION_SERVICE_CLASS->getServiceAction()Ljava/lang/String;",
        )
        method.addInstruction(1, "move-result-object v$register")
    }
}

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

private val playServicesAvailabilityNotificationFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/common/ConnectionResult;",
    ),
    strings = listOf("com.google.android.gms.availability"),
)

private val mediaAlertFileFingerprint = Fingerprint(
    strings = listOf(
        "MediaAlert file doesn't exist",
        "Exception creating MediaAlert from file",
    ),
    custom = { method, _ -> method.hasAudioStreamCall() },
)

private val mediaAlertResourceFingerprint = Fingerprint(
    strings = listOf("Error loading sound file from resource"),
    custom = { method, _ -> method.hasAudioStreamCall() },
)

private val mediaAlertAudioAttributesFingerprint = Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Landroid/media/MediaPlayer;",
        "L",
        "Ljava/util/concurrent/Executor;",
        "L",
    ),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.methodReferenceOrNull() }
            ?: emptyList()
        references.any {
            it.matches(
                "Landroid/media/AudioAttributes\u0024Builder;",
                "setUsage",
                listOf("I"),
                "Landroid/media/AudioAttributes\u0024Builder;",
            )
        } && references.any {
            it.matches(
                "Landroid/media/AudioAttributes\u0024Builder;",
                "setContentType",
                listOf("I"),
                "Landroid/media/AudioAttributes\u0024Builder;",
            )
        } && references.any {
            it.matches(
                "Landroid/media/MediaPlayer;",
                "setAudioAttributes",
                listOf("Landroid/media/AudioAttributes;"),
                "V",
            )
        }
    },
)

private fun Any.methodReferenceOrNull() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.hasAudioStreamCall() = implementation?.instructions?.any {
    it.methodReferenceOrNull()?.matches(
        "Landroid/media/MediaPlayer;", "setAudioStreamType", listOf("I"), "V",
    ) == true
} == true

// Fingerprint.methodOrNull returns the first match. Scan individual methods so
// duplicated strings or method shapes cannot silently select a different hook.
private fun app.morphe.patcher.patch.BytecodePatchContext.uniqueMapsHook(
    fingerprint: Fingerprint,
    label: String,
    required: Boolean = true,
): MutableMethod? {
    var found: Method? = null
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Lapp/morphe/extension/")) {
            classDef.methods.forEach { method ->
                fingerprint.clearMatch()
                if (fingerprint.matchOrNull(method, classDef) != null) {
                    if (found != null) {
                        throw PatchException("Ambiguous $label: $found and $method")
                    }
                    if (method.implementation == null) {
                        throw PatchException("Missing implementation for $label: $method")
                    }
                    found = method
                }
            }
        }
    }
    fingerprint.clearMatch()
    val method = found ?: run {
        if (required) throw PatchException("Failed to match $label")
        logger.info("Optional $label not found; skipping this hook")
        return null
    }
    logger.info("Resolved $label: $method")
    return mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes == method.parameterTypes
    }
}

private fun MethodReference.matches(
    definingClass: String,
    name: String,
    parameterTypes: List<String>,
    returnType: String,
) = this.definingClass == definingClass &&
    this.name == name &&
    this.parameterTypes.map { it.toString() } == parameterTypes &&
    this.returnType == returnType

private fun audioStreamWrapperInvoke(instruction: Any): String = when (instruction) {
    is FiveRegisterInstruction -> {
        if (instruction.registerCount != 2) {
            throw PatchException("Unexpected MediaPlayer.setAudioStreamType register count")
        }
        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
            "$BYD_AUDIO_CLASS->setAudioStreamType(Landroid/media/MediaPlayer;I)V"
    }

    is RegisterRangeInstruction -> {
        if (instruction.registerCount != 2) {
            throw PatchException("Unexpected MediaPlayer.setAudioStreamType range count")
        }
        val endRegister = instruction.startRegister + 1
        "invoke-static/range { v${instruction.startRegister} .. v$endRegister }, " +
            "$BYD_AUDIO_CLASS->setAudioStreamType(Landroid/media/MediaPlayer;I)V"
    }

    else -> throw PatchException("Unsupported MediaPlayer.setAudioStreamType instruction format")
}

private fun audioAttributesWrapperInvoke(instruction: Any): String = when (instruction) {
    is FiveRegisterInstruction -> {
        if (instruction.registerCount != 2) {
            throw PatchException("Unexpected MediaPlayer.setAudioAttributes register count")
        }
        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
            "$BYD_AUDIO_CLASS->setAudioAttributes" +
            "(Landroid/media/MediaPlayer;Landroid/media/AudioAttributes;)V"
    }

    is RegisterRangeInstruction -> {
        if (instruction.registerCount != 2) {
            throw PatchException("Unexpected MediaPlayer.setAudioAttributes range count")
        }
        val endRegister = instruction.startRegister + 1
        "invoke-static/range { v${instruction.startRegister} .. v$endRegister }, " +
            "$BYD_AUDIO_CLASS->setAudioAttributes" +
            "(Landroid/media/MediaPlayer;Landroid/media/AudioAttributes;)V"
    }

    else -> throw PatchException("Unsupported MediaPlayer.setAudioAttributes instruction format")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchBydNavigationAudio() {
    listOf(
        "file MediaAlert" to mediaAlertFileFingerprint,
        "resource MediaAlert" to mediaAlertResourceFingerprint,
    ).forEach { (label, fingerprint) ->
        val method = uniqueMapsHook(fingerprint, "$label audio stream hook")!!
        val matches = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            instruction.methodReferenceOrNull()?.matches(
                "Landroid/media/MediaPlayer;",
                "setAudioStreamType",
                listOf("I"),
                "V",
            ) == true
        }

        if (matches.size != 1) {
            throw PatchException("Expected exactly one $label audio stream call, found ${matches.size}")
        }

        val (index, instruction) = matches.single()
        method.replaceInstruction(index, audioStreamWrapperInvoke(instruction))
    }

    val attributesMethod = uniqueMapsHook(
        mediaAlertAudioAttributesFingerprint, "MediaAlert AudioAttributes hook",
    )!!
    val attributeMatches = attributesMethod.implementation!!.instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.methodReferenceOrNull()?.matches(
                "Landroid/media/MediaPlayer;",
                "setAudioAttributes",
                listOf("Landroid/media/AudioAttributes;"),
                "V",
            ) == true
        }
    if (attributeMatches.size != 1) {
        throw PatchException(
            "Expected exactly one MediaAlert AudioAttributes call, found ${attributeMatches.size}",
        )
    }

    val (attributeIndex, attributeInstruction) = attributeMatches.single()
    attributesMethod.replaceInstruction(
        attributeIndex,
        audioAttributesWrapperInvoke(attributeInstruction),
    )
}

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

// PR #7 (Harvey843): resolve obfuscated classes through stable entry points.
// Search the nearest declaring superclass, reject ambiguous or non-instance hooks,
// and never continue into Android framework classes.
private fun app.morphe.patcher.patch.BytecodePatchContext.findSuperclassHook(
    childClass: String,
    label: String,
    predicate: (Method) -> Boolean,
): MutableMethod {
    var className = classDefByOrNull(childClass)?.superclass
        ?: throw PatchException("Missing $label superclass: $childClass")
    val visited = mutableSetOf(childClass)
    while (!className.startsWith("Landroid/") && !className.startsWith("Ljava/")) {
        if (!visited.add(className)) {
            throw PatchException("Cycle in $label hierarchy: $className")
        }
        val classDef = classDefByOrNull(className) ?: break
        val matches = classDef.methods.filter(predicate)
        if (matches.isNotEmpty()) {
            if (matches.size != 1) {
                throw PatchException("Ambiguous $label in $className: ${matches.joinToString()}")
            }
            val match = matches.single()
            if (AccessFlags.STATIC.isSet(match.accessFlags) ||
                AccessFlags.PRIVATE.isSet(match.accessFlags) || match.implementation == null
            ) {
                throw PatchException("Expected a concrete instance $label: $match")
            }
            return mutableClassDefBy(className).methods.single {
                it.name == match.name && it.returnType == match.returnType &&
                    it.parameterTypes == match.parameterTypes
            }
        }
        className = classDef.superclass ?: break
    }
    throw PatchException("Failed to find $label above $childClass; inspected ${visited.joinToString()}")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchAvailabilityChecks() {
    uniqueMapsHook(serviceCheckFingerprint, "legacy Play services check", required = false)
        ?.addInstruction(0, "return-void")

    val builder = classDefByOrNull(GOOGLE_API_CLIENT_BUILDER)
        ?: throw PatchException("Failed to find Google API Client builder")
    val testingMethods = builder.methods.filter {
        it.name == "setApiAvailabilityForTesting" && it.returnType == GOOGLE_API_CLIENT_BUILDER
    }
    if (testingMethods.size != 1) {
        throw PatchException("Expected one setApiAvailabilityForTesting method, found ${testingMethods.size}")
    }
    val testingMethod = testingMethods.single()
    val availabilityClass = testingMethod.parameterTypes.singleOrNull()?.toString()
        ?: throw PatchException("Unexpected availability testing parameters: $testingMethod")
    val parameters = listOf("Landroid/content/Context;", "I")
    val method = findSuperclassHook(availabilityClass, "Google Play services availability") {
        it.returnType == "I" && it.parameterTypes.map { type -> type.toString() } == parameters
    }
    // The inspected availability wrapper delegates its Context/version check to
    // an integer-returning utility. Do not replace a signature-only match.
    val delegates = method.implementation!!.instructions.filter {
        it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE
    }.mapNotNull { it.methodReferenceOrNull() }.filter {
        it.returnType == "I" && it.parameterTypes.map { type -> type.toString() } == parameters
    }
    if (delegates.size != 1 || method.implementation!!.registerCount < 1) {
        throw PatchException("Unexpected availability wrapper: $method; integer delegates=${delegates.size}")
    }

    method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
}

private fun Any.invokeRegisters(): List<Int>? = when (this) {
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> null
}

private fun app.morphe.patcher.patch.BytecodePatchContext.connectionResultErrorField(): FieldReference {
    val classDef = classDefByOrNull(CONNECTION_RESULT_CLASS)
        ?: throw PatchException("Missing ConnectionResult")
    val method = classDef.methods.singleOrNull {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("Expected one ConnectionResult.toString")
    val implementation = method.implementation
        ?: throw PatchException("Missing ConnectionResult.toString implementation")
    if (AccessFlags.STATIC.isSet(method.accessFlags)) {
        throw PatchException("Expected instance ConnectionResult.toString")
    }
    val instructions = implementation.instructions.filter { it.opcode != Opcode.NOP }
    val anchors = instructions.indices.filter { stringReferenceOf(instructions[it])?.string == "statusCode" }
    val index = anchors.singleOrNull()
        ?: throw PatchException("Expected one ConnectionResult statusCode label, found ${anchors.size}")
    if (index < 1 || index + 3 >= instructions.size) {
        throw PatchException("Unexpected ConnectionResult statusCode layout")
    }
    val read = instructions[index - 1]
    val label = instructions[index]
    val format = instructions[index + 1]
    val result = instructions[index + 2]
    val append = instructions[index + 3]
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference
    val readRegisters = read as? TwoRegisterInstruction
    val labelRegister = (label as? OneRegisterInstruction)?.registerA
    val resultRegister = (result as? OneRegisterInstruction)?.registerA
    val staticInvokes = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
    // Follow the value into statusCode's formatter and labelled output, instead
    // of assuming that the obfuscated integer field is always named "c".
    if (read.opcode != Opcode.IGET || field?.definingClass != CONNECTION_RESULT_CLASS ||
        field.type != "I" || readRegisters?.registerB != implementation.registerCount - 1 ||
        format.opcode !in staticInvokes || format.invokeRegisters() != listOf(readRegisters.registerA) ||
        format.methodReferenceOrNull()?.let {
            it.definingClass == CONNECTION_RESULT_CLASS && it.parameterTypes.map { type -> type.toString() } == listOf("I") &&
                it.returnType == "Ljava/lang/String;"
        } != true || result.opcode != Opcode.MOVE_RESULT_OBJECT ||
        append.opcode !in staticInvokes || append.invokeRegisters()?.take(2) != listOf(labelRegister, resultRegister) ||
        append.methodReferenceOrNull()?.let {
            it.parameterTypes.map { type -> type.toString() } ==
                listOf("Ljava/lang/String;", "Ljava/lang/Object;", "Ljava/util/List;") && it.returnType == "V"
        } != true
    ) {
        throw PatchException("Cannot prove ConnectionResult statusCode field from its value flow")
    }
    val declaration = classDef.fields.singleOrNull { it.name == field.name && it.type == field.type }
        ?: throw PatchException("Missing declared ConnectionResult error field: $field")
    if (!AccessFlags.PUBLIC.isSet(declaration.accessFlags) || AccessFlags.STATIC.isSet(declaration.accessFlags)) {
        throw PatchException("ConnectionResult error field is not publicly readable: $field")
    }
    logger.info("Resolved ConnectionResult error field: $field")
    return field
}

private fun app.morphe.patcher.patch.BytecodePatchContext.suppressMisleadingPlayServicesUpdateNotification() {
    val method = uniqueMapsHook(
        playServicesAvailabilityNotificationFingerprint, "Google Play services availability notification",
    )!!
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation!!.registerCount < 5) {
        throw PatchException("Unexpected notification hook registers or access: $method")
    }
    val errorField = connectionResultErrorField()

    method.addInstructions(
        0,
        """
            iget v0, p2, $errorField
            const/4 v1, 0x2
            if-ne v0, v1, :show_notification
            return-void
            :show_notification
            nop
        """.trimIndent(),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.injectExtensionContext() {
    val method = findSuperclassHook(MAPS_APPLICATION_CLASS, "Maps application onCreate") {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
    }

    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $UTILS_CLASS->setContext(Landroid/content/Context;)V",
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.injectGmsCoreCheck() {
    val method = findSuperclassHook(MAIN_CLASS, "Maps activity onCreate") {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    }

    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
    )
}
