package app.morphe.patches.mapsautomotive

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.io.File
import java.util.jar.JarFile
import java.util.logging.Logger

// Ported from fank-morphe-maps-patches (GoogleMapsMicroGPatch.kt) for the AAOS build of Maps.
// Manifest identity and minSdk, GmsCore routing, availability, extension context,
// crash log files (adapted from morphe-patches-library v2.0.0 "Save crash log"),
// API 30 outline redirection (ApiCompatPatch.kt).
// Own app label, Google TTS warm-up (ported from the phone patch).
// Remaining API 30 call sites (CloseGuard, NumberFormatter percent, InstallSourceInfo) and
// Car.createCar without android.car. UI density chosen in Maps' Settings instead of a patch option.
// Report a problem (ReportPatch in the extension): a Settings row and its own screen outside Maps,
// with safe mode and the feature switches (SafeMode).
// Separate patches that depend on this one: BYD battery (BydBatteryPatch.kt), Send to car
// (SendToCarPatch.kt) and the BYD location flicker fix (LocationLockoutPatch.kt).

internal const val ORIGINAL_PACKAGE_NAME = "com.google.android.apps.maps"
internal const val PATCHED_PACKAGE_NAME = "app.morphe.android.apps.maps.automotive"
// Present the phone Maps certificate first; the AAOS certificate
// (SHA-1 58e1c4133f7441ec3d2c270270a14802da47ba0e) is the fallback.
private const val SPOOFED_CERT_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"
private const val AAOS_CERT_SHA256 = "1975b2f17177bc89a5dff31f9e64a6cae281a53dc1d1d59b1d147fe1c82afa00"
private const val AAOS_CERT_SHA256_ANDROID_13_PLUS = "d22cc500299fb22873a01a010de1c82fbe4d061119b94814dd301dab50cb7678"
private const val GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms"
internal const val GMS_CORE_VENDOR_GROUP = "app.revanced"
internal const val C2DM_PACKAGE_NAME = "app.revanced.android.c2dm"
private const val MAIN_CLASS = "Lcom/google/android/maps/MapsActivity;"
private const val MAIN_ACTIVITY_NAME = "com.google.android.maps.MapsActivity"
private const val APPLICATION_NAME = "com.google.android.apps.gmm.car.embedded.app.EmbeddedGoogleMapsApplication"
internal const val APPLICATION_CLASS = "Lcom/google/android/apps/gmm/car/embedded/app/EmbeddedGoogleMapsApplication;"
private const val INPUT_MIN_SDK = "30"
private const val OUTPUT_MIN_SDK = "29"
private const val AUTOMOTIVE_FEATURE = "android.hardware.type.automotive"
private const val GMS_VERSION_METADATA = "com.google.android.gms.version"
private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;"
private const val UTILS_CLASS = "Lapp/morphe/extension/shared/Utils;"
private const val CRASH_LOG_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/CrashLogPatch;"
internal const val UI_DENSITY_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/UiDensityPatch;"
internal const val REPORT_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/ReportPatch;"
internal const val SAFE_MODE_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/SafeMode;"
// The report screen: its own process, where Maps' start is skipped, and a launcher entry.
// The names and the process suffix must match ReportActivity and SafeMode in the extension.
private const val REPORT_ACTIVITY = "app.morphe.extension.mapsautomotive.patches.ReportActivity"
private const val REPORT_LAUNCHER = "app.morphe.extension.mapsautomotive.patches.ReportLauncher"
private const val REPORT_PROCESS = ":morphe_report"
private const val REPORT_LABEL = "Maps Car report"
private const val LOCATION_SERVICE_CLASS =
    "Lapp/morphe/extension/mapsautomotive/patches/LocationServicePatch;"
private const val LOCATION_SERVICE_ACTION =
    "com.google.android.location.internal.GoogleLocationManagerService.START"
private const val TTS_WARMUP_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/NavigationTtsWarmup;"
private const val TTS_ENGINE_PACKAGE = "com.google.android.tts"
private const val WINDOW_REFRESH_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/WindowRefreshPatch;"
// Phone Patched Maps on the same head unit is also "Google Maps" (and "Maps" in the open-with
// chooser), so this build gets its own name.
private const val APP_LABEL = "Maps Car"
private const val APP_LABEL_RESOURCE = "@string/EGMM_MAPS_APP_NAME"
private const val CHOOSER_LABEL_RESOURCE = "@string/MAPS_APP_NAME"
private val logger = Logger.getLogger("app.morphe.patches.mapsautomotive.AutomotiveMicroGPatch")

internal val compatibility = Compatibility(
    name = "Google Maps Automotive",
    packageName = ORIGINAL_PACKAGE_NAME,
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0x4285F4,
    signatures = setOf(AAOS_CERT_SHA256, AAOS_CERT_SHA256_ANDROID_13_PLUS),
    targets = listOf(
        AppTarget(
            version = null,
            isExperimental = false,
            minSdk = 29,
        ),
    ),
    // Metadata only: Desktop 1.19.0 does not filter patches by form factor; the manifest
    // input guard below is what rejects phone Maps.
    formFactor = FormFactor.AUTOMOTIVE,
)

internal val manifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            patchManifest(document)
        }
    }
}

// What the separate patches add while the patches execute; the core uses it in its finalize, which
// runs after all of them: their Settings rows and the switchable features this APK contains.
internal object IncludedFeatures {
    val settingsRows = mutableListOf<String>()
    val features = mutableListOf<String>()

    fun reset() {
        settingsRows.clear()
        features.clear()
    }
}

@Suppress("unused")
val automotiveMicroGPatch = bytecodePatch(
    name = "Google Maps Automotive for MicroG-RE",
    description = "Runs Google Maps for Android Automotive on Android 10 as \"$APP_LABEL\" with MicroG-RE 7.2.2. " +
        "Adds a UI density setting, a problem report and a safe mode.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(manifestPatch)
    extendWith("extensions/automotive.mpe")

    execute {
        // The separate patches execute after this one, which they depend on.
        IncludedFeatures.reset()
        IncludedFeatures.settingsRows += UI_DENSITY_CLASS
        rewriteGmsCoreStrings()
        patchLocationServiceAction()
        patchExtensionRuntime()
        patchAvailabilityChecks()
        patchPatchesReleaseVersion()
        injectExtensionContext()
        injectGmsCoreCheck()
        injectNavigationTtsWarmup()
        injectWindowRefresh()
        redirectApiModelOutlines()
        replaceWindowBoundsCalls()
        replaceInstallSourceCalls()
        replaceCloseGuardCalls()
        replacePercentFormatChains()
        guardInsetsAnimationCallbackSetter()
        guardCarCreation()
        applyUiDensity()
    }

    finalize {
        addSettingsRows(IncludedFeatures.settingsRows + REPORT_CLASS)
        startSafeMode()
        writeIncludedFeatures(IncludedFeatures.features)
    }
}

private fun patchManifest(document: Document) {
    val manifest = document.documentElement
    // Phone and AAOS Maps share a package name and the GUI may offer this patch for both.
    // Reject anything but the AAOS build before changing the manifest.
    val usesSdk = requireAutomotiveInput(manifest)
    val appOwnedPermissionRenames = collectAppOwnedPermissionRenames(document)

    manifest.setAttribute("package", PATCHED_PACKAGE_NAME)
    usesSdk.setAttribute("android:minSdkVersion", OUTPUT_MIN_SDK)
    leaveSharedUser(manifest)

    rewriteManifestAttributes(manifest, appOwnedPermissionRenames)
    validateAppOwnedPermissionRenames(document, appOwnedPermissionRenames)
    val movedComponents = moveToRenamedMainProcess(manifest)
    logger.info("Moved $movedComponents components from process $ORIGINAL_PACKAGE_NAME to $PATCHED_PACKAGE_NAME")
    val renamedLabels = renameAppLabels(manifest)
    logger.info("Set $renamedLabels app and chooser labels to \"$APP_LABEL\"")
    ensureQueryPackage(document, manifest)
    ensureSpoofMetadata(document)
    addReportActivity(document, manifest)
}

// The report screen and its launcher entry "Maps Car report", reachable when Maps' Settings or Maps
// itself crashes. The activity runs in its own process (injectExtensionContext skips Maps' start
// there) and its own task; launch mode and configuration changes are copied from MapsActivity, so
// they are encoded as Maps' own are.
private fun addReportActivity(document: Document, manifest: Element) {
    val application = manifest.directChildren("application").single()
    val components = application.directChildren("activity") + application.directChildren("activity-alias")
    val taken = components.map { it.getAttribute("android:name") }.filter { it == REPORT_ACTIVITY || it == REPORT_LAUNCHER }
    if (taken.isNotEmpty()) throw PatchException("Components already declared: ${taken.joinToString()}")
    val mapsActivity = application.directChildren("activity").singleOrNull { it.getAttribute("android:name") == MAIN_ACTIVITY_NAME }
        ?: throw PatchException("Expected one $MAIN_ACTIVITY_NAME")
    val launchMode = mapsActivity.getAttribute("android:launchMode")
    val configChanges = mapsActivity.getAttribute("android:configChanges")
    if (launchMode.isEmpty() || configChanges.isEmpty()) {
        throw PatchException("$MAIN_ACTIVITY_NAME has no launchMode or configChanges to copy")
    }

    application.appendChild(
        document.createElement("activity").apply {
            setAttribute("android:name", REPORT_ACTIVITY)
            setAttribute("android:process", REPORT_PROCESS)
            setAttribute("android:exported", "false")
            setAttribute("android:taskAffinity", "$PATCHED_PACKAGE_NAME.report")
            setAttribute("android:launchMode", launchMode)
            setAttribute("android:configChanges", configChanges)
            setAttribute("android:label", REPORT_LABEL)
        },
    )
    // An alias must follow its target activity.
    application.appendChild(
        document.createElement("activity-alias").apply {
            setAttribute("android:name", REPORT_LAUNCHER)
            setAttribute("android:targetActivity", REPORT_ACTIVITY)
            setAttribute("android:exported", "true")
            setAttribute("android:label", REPORT_LABEL)
            appendChild(
                document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply { setAttribute("android:name", "android.intent.action.MAIN") })
                    appendChild(document.createElement("category").apply { setAttribute("android:name", "android.intent.category.LAUNCHER") })
                },
            )
        },
    )

    val launchers = application.directChildren("activity-alias").count { alias ->
        alias.getAttribute("android:targetActivity") == REPORT_ACTIVITY &&
            alias.getElementsByTagName("category").let { categories ->
                (0 until categories.length).any {
                    (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                }
            }
    }
    if (launchers != 1) throw PatchException("Expected one launcher entry for $REPORT_ACTIVITY, found $launchers")
    logger.info("Added $REPORT_ACTIVITY in $REPORT_PROCESS and the launcher entry \"$REPORT_LABEL\" (launchMode $launchMode)")
}

private fun requireAutomotiveInput(manifest: Element): Element {
    val usesSdk = manifest.directChildren("uses-sdk").singleOrNull()
        ?: throw PatchException("Expected one uses-sdk element in the AAOS Maps manifest")
    val minSdk = usesSdk.getAttribute("android:minSdkVersion")
    if (minSdk != INPUT_MIN_SDK) {
        throw PatchException("Expected the AAOS Maps build with minSdk $INPUT_MIN_SDK, found '$minSdk'")
    }

    val application = manifest.directChildren("application").singleOrNull()
        ?: throw PatchException("Expected one application element")
    val name = application.getAttribute("android:name").let {
        if (it.startsWith('.')) "$ORIGINAL_PACKAGE_NAME$it" else it
    }
    if (name != APPLICATION_NAME) {
        throw PatchException("Expected application $APPLICATION_NAME, found '$name'")
    }

    val features = manifest.directChildren("uses-feature").count {
        it.getAttribute("android:name") == AUTOMOTIVE_FEATURE
    }
    if (features != 1) throw PatchException("Expected one $AUTOMOTIVE_FEATURE declaration, found $features")
    return usesSdk
}

// Phone and AAOS Maps both declare sharedUserId "com.google.android.apps.maps", honored up to
// API 32. Patched phone Maps keeps it and uses the same signing key, so on DiLink 3 this app
// would join its UID, and a later update cannot leave the shared user. Android 13+ already
// ignores it for this app (sharedUserMaxSdkVersion 32), so drop it here.
private fun leaveSharedUser(manifest: Element) {
    val sharedUser = manifest.getAttribute("android:sharedUserId")
    if (sharedUser.isEmpty()) return
    if (sharedUser != ORIGINAL_PACKAGE_NAME) {
        throw PatchException("Unexpected sharedUserId '$sharedUser'")
    }
    manifest.removeAttribute("android:sharedUserId")
    manifest.removeAttribute("android:sharedUserMaxSdkVersion")
    manifest.removeAttribute("android:sharedUserLabel")
}

// Some components (CarEmbeddedService, the navigation and EV services) are pinned to
// android:process="com.google.android.apps.maps", the original main process, which is named after
// the package. After the rename the main process is the new package name, so they would run in a
// separate process whose application delegate is not the main one, and crash.
// Point them, and any "<original>:suffix" process, at the renamed package.
private fun moveToRenamedMainProcess(node: Node): Int {
    var moved = 0
    if (node is Element) {
        val process = node.getAttribute("android:process")
        if (process == ORIGINAL_PACKAGE_NAME || process.startsWith("$ORIGINAL_PACKAGE_NAME:")) {
            node.setAttribute("android:process", PATCHED_PACKAGE_NAME + process.removePrefix(ORIGINAL_PACKAGE_NAME))
            moved++
        }
    }
    val children = node.childNodes
    for (index in 0 until children.length) {
        moved += moveToRenamedMainProcess(children.item(index))
    }
    return moved
}

// The application label (launcher, Settings, recents) and the open-with chooser labels of the
// intent filters. A literal is used, so the name is the same in every locale.
private fun renameAppLabels(manifest: Element): Int {
    val application = manifest.directChildren("application").single()
    val applicationLabel = application.getAttribute("android:label")
    if (applicationLabel != APP_LABEL_RESOURCE) {
        throw PatchException("Expected application label $APP_LABEL_RESOURCE, found '$applicationLabel'")
    }

    fun rename(node: Node): Int {
        var renamed = 0
        if (node is Element &&
            node.getAttribute("android:label").let { it == APP_LABEL_RESOURCE || it == CHOOSER_LABEL_RESOURCE }
        ) {
            node.setAttribute("android:label", APP_LABEL)
            renamed++
        }
        val children = node.childNodes
        for (index in 0 until children.length) {
            renamed += rename(children.item(index))
        }
        return renamed
    }
    return rename(application)
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
        SPOOFED_CERT_SHA1,
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

internal fun Element.directChildren(tagName: String): List<Element> {
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

// The phone-only SuggestionProvider/fileprovider literals do not exist in the AAOS build. Its own
// provider authorities are built from getPackageName(), and its bare "com.google.android.apps.maps"
// literals are Maps' internal account type, which must stay.
private val exactStringReplacements = mapOf(
    "com.google" to GMS_CORE_VENDOR_GROUP,
    "subscribedfeeds" to "$GMS_CORE_VENDOR_GROUP.subscribedfeeds",
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

internal fun stringReferenceOf(instruction: Any): StringReference? = when (instruction) {
    is Instruction21c -> instruction.getReference<StringReference>()
    is Instruction31c -> instruction.getReference<StringReference>()
    else -> null
}

internal fun replacementFor(instruction: Any, transformed: String): BuilderInstruction? = when (instruction) {
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

// Replaces each string literal [transform] maps to another value; returns how often each was replaced.
internal fun BytecodePatchContext.replaceStringLiterals(transform: (String) -> String?): Map<String, Int> {
    val replaced = mutableMapOf<String, Int>()
    getAllClassesWithStrings().forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef)

        mutableClass.methods.forEach { method ->
            val implementation = method.implementation ?: return@forEach

            implementation.instructions.forEachIndexed { index, instruction ->
                val original = stringReferenceOf(instruction)?.string ?: return@forEachIndexed
                val transformed = transform(original) ?: return@forEachIndexed
                val replacement = replacementFor(instruction, transformed) ?: return@forEachIndexed

                method.replaceInstruction(index, replacement)
                replaced.merge(original, 1, Int::plus)
            }
        }
    }
    return replaced
}

private fun BytecodePatchContext.rewriteGmsCoreStrings() {
    replaceStringLiterals(::transformString)
}

private fun BytecodePatchContext.patchLocationServiceAction() {
    // 120003.E has the same two const-string/return-object action getters as phone Maps.
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
            (instructions.last() as? OneRegisterInstruction)?.registerA != register
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

private fun Instruction.methodReferenceOrNull() = getReference<MethodReference>()

// Fingerprint.methodOrNull returns the first match. Scan individual methods so
// duplicated strings or method shapes cannot silently select a different hook.
private fun BytecodePatchContext.uniqueMapsHook(
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

private fun BytecodePatchContext.patchExtensionRuntime() {
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

// Search from a stable entry class upwards, including the class itself. Reject ambiguous
// or non-instance hooks and never continue into Android framework classes.
internal fun BytecodePatchContext.findHierarchyHook(
    startClass: String,
    label: String,
    predicate: (Method) -> Boolean,
): MutableMethod {
    var className: String = startClass
    val visited = mutableSetOf<String>()
    while (!className.startsWith("Landroid/") && !className.startsWith("Ljava/")) {
        if (!visited.add(className)) {
            throw PatchException("Cycle in $label hierarchy: $className")
        }
        val classDef = classDefByOrNull(className)
            ?: throw PatchException("Missing $label class: $className")
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
            logger.info("Resolved $label: $match")
            return mutableClassDefBy(className).methods.single {
                it.name == match.name && it.returnType == match.returnType &&
                    it.parameterTypes == match.parameterTypes
            }
        }
        className = classDef.superclass ?: break
    }
    throw PatchException("Failed to find $label from $startClass; inspected ${visited.joinToString()}")
}

private fun BytecodePatchContext.patchAvailabilityChecks() {
    uniqueMapsHook(serviceCheckFingerprint, "legacy Play services check", required = false)
        ?.addInstruction(0, "return-void")

    // AAOS has no GoogleApiClient. The class that posts the availability notification
    // (GoogleApiAvailability) owns or inherits the (Context, int) availability check.
    val notification = uniqueMapsHook(
        playServicesAvailabilityNotificationFingerprint, "Google Play services availability notification",
    )!!
    val parameters = listOf("Landroid/content/Context;", "I")
    val method = findHierarchyHook(notification.definingClass, "Google Play services availability") {
        it.returnType == "I" && it.parameterTypes.map { type -> type.toString() } == parameters
    }
    // R8 inlined GooglePlayServicesUtilLight into this method on 120003.E, so there is no
    // integer delegate to prove it. Require the provider manifest-version read and the
    // provider package lookup instead of accepting a signature-only match.
    val instructions = method.implementation!!.instructions
    val versionReads = instructions.count { stringReferenceOf(it)?.string == GMS_VERSION_METADATA }
    val packageLookups = instructions.count {
        it.methodReferenceOrNull()?.let { reference ->
            reference.definingClass == "Landroid/content/pm/PackageManager;" &&
                reference.name == "getPackageInfo" &&
                reference.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/String;", "I")
        } == true
    }
    if (versionReads != 1 || packageLookups < 1 || method.implementation!!.registerCount < 1) {
        throw PatchException(
            "Unexpected availability check: $method; version reads=$versionReads, package lookups=$packageLookups",
        )
    }

    method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
}

private val patchesReleaseVersionFingerprint = Fingerprint(
    definingClass = UTILS_CLASS,
    name = "getPatchesReleaseVersion",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

// Desktop loads the .mpp as a JAR; its manifest carries the bundle version.
private val bundleVersion: String by lazy {
    runCatching {
        val location = object {}.javaClass.protectionDomain?.codeSource?.location
            ?: return@runCatching null
        JarFile(File(location.toURI())).use { it.manifest?.mainAttributes?.getValue("Version") }
    }.getOrNull()?.takeIf { it.matches(Regex("[0-9A-Za-z.+-]+")) } ?: "unknown"
}

// Shown as "Patches:" in crash logs, so each log names the bundle that produced the APK.
private fun BytecodePatchContext.patchPatchesReleaseVersion() {
    val method = patchesReleaseVersionFingerprint.methodOrNull
        ?: throw PatchException("Failed to match extension patches version hook")
    logger.info("Bundle version for crash logs: $bundleVersion")
    method.addInstructions(
        0,
        """
            const-string v0, "$bundleVersion"
            return-object v0
        """.trimIndent(),
    )
}

// The crash handler follows setContext and runs in every process of the app,
// before Maps installs its own handler. In the report screen's process Maps' own start is skipped:
// Maps gives any process it does not know its background start, and the report screen needs none of it.
private fun BytecodePatchContext.injectExtensionContext() {
    val method = findHierarchyHook(APPLICATION_CLASS, "Maps application onCreate") {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty()
    }
    val code = method.implementation!!.instructions
    val self = method.implementation!!.registerCount - 1
    val flag = method.getFreeRegisterProvider(0, 1, self).getFreeRegister4Bit()

    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $UTILS_CLASS->setContext(Landroid/content/Context;)V
            invoke-static/range { p0 .. p0 }, $CRASH_LOG_CLASS->setUncaughtExceptionHandler(Landroid/content/Context;)V
            invoke-static {}, $SAFE_MODE_CLASS->isReportProcess()Z
            move-result v$flag
            if-eqz v$flag, :morphe_maps_start
            return-void
        """.trimIndent(),
        ExternalLabel("morphe_maps_start", code[0]),
    )
    logger.info("Report process: Maps' start skipped in $method (flag v$flag)")
}

// Safe mode and the feature switches are read first, at the start of the Application's
// attachBaseContext, before BYD battery and the UI density (added at the same point by execute, so
// this runs in finalize). It also installs the crash handler there, so crashes in Maps' content
// providers count too.
private fun BytecodePatchContext.startSafeMode() {
    requireExtensionMethod(SAFE_MODE_CLASS, "attachBaseContext", listOf("Landroid/content/Context;"), "V")
    requireExtensionMethod(SAFE_MODE_CLASS, "isReportProcess", listOf(), "Z")
    requireExtensionMethod(SAFE_MODE_CLASS, "settingsRows", listOf("Landroid/content/Context;"), "Z")
    findHierarchyHook(APPLICATION_CLASS, "Maps application attachBaseContext") {
        it.name == "attachBaseContext" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
    }.addInstruction(
        0,
        "invoke-static/range { p1 .. p1 }, $SAFE_MODE_CLASS->attachBaseContext(Landroid/content/Context;)V",
    )
}

// Which separate patches' features this APK contains, for the report screen, the report and crash logs.
private fun BytecodePatchContext.writeIncludedFeatures(features: List<String>) {
    val method = mutableClassDefBy(SAFE_MODE_CLASS).methods.singleOrNull {
        it.name == "includedFeatures" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PRIVATE.isSet(it.accessFlags)
    } ?: throw PatchException("SafeMode lacks includedFeatures")
    val value = features.joinToString(",")
    if (!value.matches(Regex("[a-z_,]*"))) throw PatchException("Unexpected feature names: $value")
    method.addInstructions(
        0,
        """
            const-string v0, "$value"
            return-object v0
        """.trimIndent(),
    )
    logger.info("Features of the separate patches in this APK: ${value.ifEmpty { "none" }}")
}

internal fun BytecodePatchContext.requireExtensionMethod(
    className: String,
    name: String,
    parameters: List<String>,
    returnType: String,
) {
    val extension = classDefByOrNull(className) ?: throw PatchException("Missing extension class $className")
    if (extension.methods.none {
            it.name == name && it.returnType == returnType &&
                it.parameterTypes.map { type -> type.toString() } == parameters &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }
    ) {
        throw PatchException("$className lacks public static $name")
    }
}

private fun BytecodePatchContext.injectGmsCoreCheck() {
    val method = findHierarchyHook(MAIN_CLASS, "Maps activity onCreate") {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    }

    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
    )
}

private fun Method.createsTtsClientFor(enginePackage: String): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { stringReferenceOf(it)?.string == enginePackage } && instructions.any {
        (it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            it.methodReferenceOrNull()?.let { reference ->
                reference.definingClass == "Landroid/speech/tts/TextToSpeech;" && reference.name == "<init>" &&
                    reference.parameterTypes.map { type -> type.toString() } == listOf(
                        "Landroid/content/Context;",
                        "Landroid/speech/tts/TextToSpeech\$OnInitListener;",
                        "Ljava/lang/String;",
                    )
            } == true
    }
}

// Ported from the phone patch (its issue #10). Maps creates its Google TTS client when guidance
// starts and shuts it down when guidance ends, so a cold engine can miss the first prompts and Maps
// plays canned audio. The extension binds the same engine once when Maps opens. Optional by design:
// if Maps no longer creates a client for that engine, warming it would not help.
private fun BytecodePatchContext.injectNavigationTtsWarmup() {
    val clients = getAllClassesWithStrings()
        .filterNot { it.type.startsWith("Lapp/morphe/extension/") }
        .flatMap { classDef -> classDef.methods.filter { it.createsTtsClientFor(TTS_ENGINE_PACKAGE) } }
        .toList()
    if (clients.isEmpty()) {
        logger.info("Optional navigation TTS warm-up skipped: Maps creates no TextToSpeech client for $TTS_ENGINE_PACKAGE")
        return
    }
    logger.info("Maps TextToSpeech clients for $TTS_ENGINE_PACKAGE: ${clients.joinToString()}")

    val method = findHierarchyHook(MAIN_CLASS, "Maps activity onCreate") {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    }
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $TTS_WARMUP_CLASS->warmUp(Landroid/app/Activity;)V",
    )
}

// Maps measures its window when its viewport is created and when insets are applied, so
// a resize with unchanged insets (split screen) leaves the layout for the old width. The extension
// asks for the insets again after each decor size change; it installs itself after onCreate.
private fun BytecodePatchContext.injectWindowRefresh() {
    val method = findHierarchyHook(MAIN_CLASS, "Maps activity onCreate") {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    }
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $WINDOW_REFRESH_CLASS->install(Landroid/app/Activity;)V",
    )
}

// UI density. The Application and AppCompatActivity (the first attachBaseContext in
// MapsActivity's hierarchy, shared by the app's activities) receive a density-only configuration
// context for the density chosen in Settings (200 dpi until one is chosen; the system density keeps
// the context unchanged).
private fun BytecodePatchContext.applyUiDensity() {
    listOf(
        APPLICATION_CLASS to "Maps application attachBaseContext",
        MAIN_CLASS to "Maps activity attachBaseContext",
    ).forEach { (startClass, label) ->
        findHierarchyHook(startClass, label) {
            it.name == "attachBaseContext" && it.returnType == "V" &&
                it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
        }.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $UI_DENSITY_CLASS->wrap(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
