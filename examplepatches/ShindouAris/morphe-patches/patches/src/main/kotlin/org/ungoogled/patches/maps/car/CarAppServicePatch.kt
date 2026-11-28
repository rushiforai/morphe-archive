package org.ungoogled.patches.maps.car

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotation
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.nio.ByteBuffer
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element

private const val SERVICE = "org.ungoogled.car.MapsCarAppService"

/** Waze Mod's Data API (V14+): its service and its permission screen, and the extension's way to that screen. */
private const val WAZE_MOD_BIND = "com.wazemod.api.action.BIND"
private const val WAZE_MOD_REQUEST_ACCESS = "com.wazemod.api.action.REQUEST_ACCESS"
private const val WAZE_MOD_ACCESS_ACTIVITY = "org.ungoogled.car.WazeModAccessActivity"
/** xADAS' data link: the distance to the vehicle ahead, which the overlay shows. */
private const val XADAS_PACKAGE = "com.kaibatech.drivedeck.xadas"
private const val XADAS_BIND = "com.kaibatech.drivedeck.xadas.action.BIND_LINK"
/** The overlay's icons in the patches file (from WazeHUD), listed in index.txt. */
private const val WAZE_ICONS = "/maps/waze"

/**
 * Maps' own projection service. Android Auto binds to it on a connection and starts Maps' car UI through it; the
 * extension does that itself instead (org.ungoogled.car.ProjectionHost), with the Car App Library's Surface.
 */
private const val PROJECTION_SERVICE = "com.google.android.apps.gmm.car.GmmCarProjectionService"

/**
 * Services Maps' car UI binds to inside the app while it runs (the projection service above, and the navigation
 * provider its UI binds to when it starts). Kept, but closed to every other app.
 */
private val LOCAL_CAR_SERVICES = setOf(
    PROJECTION_SERVICE,
    "com.google.android.apps.gmm.car.projected.service.CarNavigationProviderService",
)

/** Maps' other Android Auto projection services (legacy path), declared in its manifest. */
private val LEGACY_CAR_SERVICES = setOf(
    "com.google.android.apps.gmm.car.LimitedGmmCarProjectionService",
    "com.google.android.apps.gmm.car.WidescreenWidgetLimitedGmmCarProjectionService",
    "com.google.android.apps.gmm.car.projected.auxiliarymap.GmmCarAuxiliaryProjectionService",
)

/** The Car App Library version bundled by the extension (extensions/extension/build.gradle.kts). */
private const val CAL_VERSION = "1.9.0-alpha01"

/** The highest Car App API level the app reports to Android Auto (see the patch's execute block). */
private const val MAX_API_LEVEL = 8

/**
 * Declares the Car App Library service (org.ungoogled.car.MapsCarAppService) so Android Auto lists
 * Maps as a navigation app. Android Auto does not list a re-signed Maps through Maps' own projection
 * service (GmmCarProjectionService), but it does list Car App Library apps of any signature.
 *
 * Maps' descriptor for Android Auto (res/xml/automotive_description) names only `projection` and
 * `notification`; a Car App Library app is announced with `template`.
 */
private val carAppManifestPatch = resourcePatch(
    description = "Declares the Car App Library service and its permissions.",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as Element

            for (permission in listOf("androidx.car.app.NAVIGATION_TEMPLATES", "androidx.car.app.ACCESS_SURFACE")) {
                val uses = manifest.createElement("uses-permission")
                uses.setAttribute("android:name", permission)
                root.insertBefore(uses, application)
            }

            val service = manifest.createElement("service")
            service.setAttribute("android:name", SERVICE)
            service.setAttribute("android:exported", "true")

            val filter = manifest.createElement("intent-filter")
            val action = manifest.createElement("action")
            action.setAttribute("android:name", "androidx.car.app.CarAppService")
            val category = manifest.createElement("category")
            category.setAttribute("android:name", "androidx.car.app.category.NAVIGATION")
            filter.appendChild(action)
            filter.appendChild(category)
            service.appendChild(filter)


            // The host reads the minimum Car App API level from the application, not the service.
            val minLevel = manifest.createElement("meta-data")
            minLevel.setAttribute("android:name", "androidx.car.app.minCarApiLevel")
            minLevel.setAttribute("android:value", "1")
            application.appendChild(minLevel)

            application.appendChild(service)

            // Waze Mod's Data API (speed, limit and alerts over the car UI): Maps must see the service and the
            // permission screen (Android 11+ package visibility), and opens that screen from the phone.
            val queries = manifest.createElement("queries")
            for (name in listOf(WAZE_MOD_BIND, WAZE_MOD_REQUEST_ACCESS)) {
                val intent = manifest.createElement("intent")
                val intentAction = manifest.createElement("action")
                intentAction.setAttribute("android:name", name)
                intent.appendChild(intentAction)
                queries.appendChild(intent)
            }
            // Waze Mod itself, so Maps can tell "not installed" from "installed without the Data API".
            for (name in listOf("com.waze", "com.chisadin.wazemod", "com.chisadin.linhtinh")) {
                val wazePackage = manifest.createElement("package")
                wazePackage.setAttribute("android:name", name)
                queries.appendChild(wazePackage)
            }
            // xADAS (Pro) shares the distance to the vehicle ahead the same way (https://github.com/drivedeck/link).
            val xadasPackage = manifest.createElement("package")
            xadasPackage.setAttribute("android:name", XADAS_PACKAGE)
            queries.appendChild(xadasPackage)
            val xadasIntent = manifest.createElement("intent")
            val xadasAction = manifest.createElement("action")
            xadasAction.setAttribute("android:name", XADAS_BIND)
            xadasIntent.appendChild(xadasAction)
            queries.appendChild(xadasIntent)
            root.insertBefore(queries, application)

            val access = manifest.createElement("activity")
            access.setAttribute("android:name", WAZE_MOD_ACCESS_ACTIVITY)
            access.setAttribute("android:exported", "false")
            access.setAttribute("android:excludeFromRecents", "true")
            access.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            application.appendChild(access)
        }

        // Waze Mod's alert icons and speed limit signs, for the overlay: copied into Maps' assets
        // (assets/ungoogled/waze/...), which the extension reads with the AssetManager.
        val index = ExtensionResource::class.java.getResourceAsStream("$WAZE_ICONS/index.txt")
            ?.bufferedReader()?.use { it.readLines() }?.filter { it.isNotBlank() }
            ?: throw PatchException("the Waze Mod icons are not in the patches file")
        for (path in index) {
            val bytes = ExtensionResource::class.java.getResourceAsStream("$WAZE_ICONS/$path")?.use { it.readBytes() }
                ?: throw PatchException("Waze Mod icon $path is not in the patches file")
            get("assets/ungoogled/waze/$path").apply { parentFile.mkdirs() }.writeBytes(bytes)
        }

        document("res/xml/automotive_description.xml").use { description ->
            val app = description.documentElement
            val names =(0 until app.childNodes.length).map { app.childNodes.item(it) }
                .filterIsInstance<Element>().filter { it.tagName == "uses" }.map { it.getAttribute("name") }
            if ("projection" !in names) throw PatchException("automotive_description no longer names projection: $names")
            if ("template" !in names) {
                val uses = description.createElement("uses")
                uses.setAttribute("name", "template")
                app.appendChild(uses)
            }
        }
    }

    // In finalize, after the package rename, which counts these services' process names.
    finalize {
        // Maps' own projection services, which Android Auto binds to on a connection: a re-signed Maps
        // is refused by Android Auto's signature check (go/gearhead-retail-device) once it runs them,
        // and the SecurityException kills the process -- and with it the Car App Library service.
        document("AndroidManifest.xml").use { manifest ->
            val services = manifest.getElementsByTagName("service")
            for (i in services.length - 1 downTo 0) {
                val element = services.item(i) as Element
                val name = element.getAttribute("android:name")
                if (name in LEGACY_CAR_SERVICES) element.parentNode.removeChild(element)
                if (name in LOCAL_CAR_SERVICES) {
                    // Kept, for the extension (it plays Android Auto's part, in this process) and Maps' car UI
                    // to bind to, but closed to everyone else: no Android Auto bind, and no launcher entry.
                    element.setAttribute("android:exported", "false")
                    val filters = (0 until element.childNodes.length).map { element.childNodes.item(it) }
                        .filterIsInstance<Element>().filter { it.tagName == "intent-filter" }
                    filters.forEach { element.removeChild(it) }
                }
            }
        }
        // Only the Car App Library is announced: no `projection` (the legacy path above).
        document("res/xml/automotive_description.xml").use { description ->
            val app = description.documentElement
            val projection = (0 until app.childNodes.length).map { app.childNodes.item(it) }
                .filterIsInstance<Element>().filter { it.tagName == "uses" && it.getAttribute("name") == "projection" }
            projection.forEach { app.removeChild(it) }
        }
    }
}

/**
 * The projection service's caller check: a caller other than the Android Auto that registered must hold
 * CAPTURE_VIDEO_OUTPUT. The extension calls the service in-process, as the app, which does not hold that
 * (signature) permission.
 */
private object ProjectionCallerCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("projection client manager does not have permission:android.permission.CAPTURE_VIDEO_OUTPUT pid:")),
)

private object ExtensionResource

/**
 * Maps carries its own copy of the Car App Library: most of it renamed by R8, but 217 classes of the
 * `androidx.car.app` package keep their names (the ones the host's binder interfaces and parcelables need).
 * The extension bundles the library too, and where a class exists in both the merge keeps Maps' copy, whose
 * constructors and methods name Maps' renamed classes (CarAppBinder(bla, SessionInfo), ...). The bundled
 * CarAppService then fails with NoSuchMethodError. So each `androidx.car.app` class of the extension is
 * written over the program's: its superclass, interfaces, annotations, fields and methods become the
 * extension's.
 * A class only the extension has is left as it is.
 */
private fun BytecodePatchContext.useBundledCarAppLibrary() {
    val bytes = ExtensionResource::class.java.getResourceAsStream("/extensions/extension.mpe")
        ?.use { it.readBytes() } ?: throw PatchException("extensions/extension.mpe is not in the patches file")
    val extension = DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes))

    var replaced = 0
    for (ours in extension.classes) {
        if (!ours.type.startsWith("Landroidx/car/app/")) continue
        val program = mutableClassDefByOrNull(ours.type) ?: continue
        program.setAccessFlags(ours.accessFlags)
        program.setSuperClass(ours.superclass)
        (program.interfaces as MutableList<String>).apply { clear(); addAll(ours.interfaces) }
        // The host's Bundler refuses a class that lacks the @CarProtocol annotation, which R8 drops in Maps.
        program.annotations.clear()
        ours.annotations.forEach { program.annotations.add(MutableAnnotation(it)) }
        program.fields.clear()
        ours.fields.forEach { program.fields.add(MutableField(it)) }
        program.methods.clear()
        ours.methods.forEach { program.methods.add(MutableMethod(it)) }
        replaced++
    }
    if (replaced == 0) throw PatchException("no androidx.car.app class of the extension was found in the program")
}

@Suppress("unused")
val carAppServicePatch = bytecodePatch(
    name = "Android Auto Car App Library",
    description = "Adds a Car App Library service so Android Auto lists Maps as a navigation app and shows " +
        "Maps' own car UI on it, with Waze Mod and xADAS overlays. Off by default.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(sharedExtensionPatch, carAppManifestPatch)

    execute {
        useBundledCarAppLibrary()

        // AppInfo.create reads the library version from a string resource of the Car App Library's AAR.
        // The extension carries code only, so that resource id does not exist in Maps and the host's
        // GET_APP_VERSION call fails (Resources$NotFoundException). Answer with the constant instead.
        val create = mutableClassDefBy("Landroidx/car/app/AppInfo;").methods.single {
            it.name == "create" && it.parameterTypes.size == 1
        }
        val instructions = create.implementation!!.instructions.toList()
        val call = instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == "Landroid/content/res/Resources;" &&
                ref.name == "getString" && ref.parameterTypes.size == 1
        }
        if (call < 0 || instructions[call + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("AppInfo.create no longer reads the library version from a resource")
        }
        val register = (instructions[call + 1] as OneRegisterInstruction).registerA
        create.replaceInstruction(call, "const-string v$register, \"$CAL_VERSION\"")
        create.replaceInstruction(call + 1, "nop")

        // Android Auto asks an app that negotiated API level 9 for a "car" manager (getManager("car"),
        // its GET_APP_THEME_STYLE call), which this library version does not have, so the call is never
        // answered and Android Auto shows "not responding". Level 8 does not ask for it.
        val latest = mutableClassDefBy("Landroidx/car/app/versioning/CarAppApiLevels;").methods.single {
            it.name == "getLatest" && it.parameterTypes.isEmpty()
        }
        latest.addInstructions(0, "const/16 v0, $MAX_API_LEVEL\nreturn v0")

        ProjectionCallerCheckFingerprint.method.addInstructions(0, "return-void")
    }
}
