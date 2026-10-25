// Based on SysAdminDoc/HushMessenger (GPL-3.0), patches/src/main/kotlin/app/hushmessenger/patches/controls/MessengerControlsPatch.kt:
// a settings host patch whose resource part adds a non-exported init provider and settings activity, with
// controls registered by their own patches only after every edit applied; modified 2026-10-14: rewritten for
// morphe-patcher 1.8.0, registry written into the extension at finalize instead of <meta-data>, no launcher
// alias or shortcuts, generic (not Messenger-specific).

package app.template.patches.shared.hevalcontrols

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.jar.Manifest
import java.util.logging.Logger

/** The engine; hooks call `isEnabled(Ljava/lang/String;)Z` on it (see [addHevalGate]). */
const val HEVAL_SETTINGS_CLASS = "Lapp/template/extension/hevalcontrols/HevalSettings;"

/** The settings screen; in-app entry hooks call `open(Landroid/content/Context;)V` on it. */
const val HEVAL_CONTROLS_ACTIVITY_CLASS = "Lapp/template/extension/hevalcontrols/ui/HevalControlsActivity;"

internal const val HEVAL_REGISTRY_CLASS = "Lapp/template/extension/hevalcontrols/Registry;"
internal const val HEVAL_INIT_PROVIDER = "app.template.extension.hevalcontrols.InitProvider"
internal const val HEVAL_ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity"
internal const val HEVAL_EXTENSION = "extensions/hevalcontrols.mpe"

/** Higher than Firebase's 100 and androidx-startup's default 0, so it is created first. */
internal const val HEVAL_INIT_ORDER = "1000"

private val logger = Logger.getLogger("HevalControls")

/**
 * The Heval Controls host of one app: the named "Heval Controls" patch plus the registry its
 * feature patches fill. Create one per app with [hevalControlsPatch] and expose [patch] as a
 * top-level `val` so Manager lists it.
 */
class HevalControlsHost internal constructor(internal val compatibility: Compatibility) {
    private val features = mutableListOf<HevalFeature>()

    /** The "Heval Controls" patch. Feature patches `dependsOn` it. */
    lateinit var patch: BytecodePatch
        internal set

    /**
     * Adds a feature to the registry. Call it from a feature patch's `execute`, after every edit
     * of that feature succeeded, so the screen lists only what was really patched.
     */
    fun register(feature: HevalFeature) {
        if (features.any { it.id == feature.id }) {
            throw PatchException("Heval Controls feature ${feature.id} is registered twice")
        }
        features += feature
    }

    internal fun clear() = features.clear()

    internal fun registered(): List<HevalFeature> = features.toList()
}

/**
 * Builds the Heval Controls host for one app. Its patch:
 * 1. adds `InitProvider` (non-exported, no data, `initOrder` 1000) and `HevalControlsActivity`
 *    (non-exported) to the manifest;
 * 2. merges `extensions/hevalcontrols.mpe`;
 * 3. in `finalize`, which runs after every feature patch's `execute`, writes the registered
 *    features, the bundle version and the patched app version into the extension's `Registry`
 *    getters.
 *
 * Unavailable on Root Mount installs, which keep the stock manifest (no provider or activity).
 *
 * @param compatibility The app this host (and its feature patches) applies to.
 * @param default Whether "Heval Controls" is selected by default.
 * @param dependencies Unnamed per-app patches that are part of the host, typically the in-app entry
 *        point that calls `HevalControlsActivity.open(Context)`. They run before the host.
 */
fun hevalControlsPatch(
    compatibility: Compatibility,
    default: Boolean = true,
    dependencies: Set<Patch<*>> = emptySet(),
): HevalControlsHost {
    val host = HevalControlsHost(compatibility)

    val manifestPatch = resourcePatch {
        execute {
            document("AndroidManifest.xml").use { it.addHevalControlsComponents() }
        }
    }

    host.patch = bytecodePatch(
        name = "Heval Controls",
        description = "Adds a screen to turn supported features on or off.",
        default = default,
    ) {
        compatibleWith(compatibility)

        availability { installer, _ ->
            when (installer) {
                InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
                else -> if (default) PatchAvailability.ENABLED else PatchAvailability.DISABLED
            }
        }

        dependsOn(manifestPatch, *dependencies.toTypedArray())

        extendWith(HEVAL_EXTENSION)

        execute {
            // Top-level hosts outlive one patcher run (Manager, the smoke test JVM): start empty.
            host.clear()
            // Loud failure when the extension was not merged.
            classDefBy(HEVAL_SETTINGS_CLASS)
            classDefBy(HEVAL_REGISTRY_CLASS)
            classDefBy(HEVAL_INIT_PROVIDER.toDescriptor())
            classDefBy(HEVAL_ACTIVITY.toDescriptor())
        }

        finalize {
            val features = host.registered()
            host.clear()
            writeRegistry(features)
        }
    }

    return host
}

/**
 * A named feature patch that depends on this host and registers [feature] once [block] finished
 * without an exception. Validate every hook site before the first edit, so a failure leaves the
 * feature neither half-applied nor listed.
 */
fun HevalControlsHost.featurePatch(
    feature: HevalFeature,
    name: String = feature.name,
    description: String = feature.description,
    default: Boolean = true,
    dependencies: Set<Patch<*>> = emptySet(),
    block: BytecodePatchContext.() -> Unit,
): BytecodePatch {
    val host = this
    return bytecodePatch(name = name, description = description, default = default) {
        compatibleWith(host.compatibility)
        dependsOn(host.patch, *dependencies.toTypedArray())
        execute {
            block()
            host.register(feature)
        }
    }
}

private fun BytecodePatchContext.writeRegistry(features: List<HevalFeature>) {
    val registered = features.map { it.id }.toSet()
    features.forEach { feature ->
        feature.dependencies.filter { it !in registered }.forEach { missing ->
            // Not fatal: the user may have left the dependency's patch out. The screen then shows
            // the feature as unsupported and its hooks stay stock.
            logger.warning("Heval Controls feature ${feature.id} depends on $missing, which is not patched")
        }
    }

    val metadata = packageMetadata
    mutableClassDefBy(HEVAL_REGISTRY_CLASS).methods.apply {
        single { it.name == "encoded" }.returnString(HevalRegistryCodec.encode(features))
        single { it.name == "bundleVersion" }.returnString(bundleVersion())
        single { it.name == "patchedAppVersion" }.returnString("${metadata.versionName} (${metadata.versionCode})")
    }
}

/**
 * `return "<value>"` at index 0 of a static String getter. Not `returnEarly(String)`: that emits
 * smali text without escaping, and the registry holds tabs, line feeds and quotes. Built as an
 * instruction, any text is safe; `const-string/jumbo` is valid whatever the dex's string count.
 */
private fun MutableMethod.returnString(value: String) {
    val implementation = implementation
        ?: throw PatchException("$definingClass->$name has no code")
    if (returnType != "Ljava/lang/String;" || implementation.registerCount < 1) {
        throw PatchException("$definingClass->$name is not a String getter with a register")
    }
    implementation.addInstruction(0, BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, 0, ImmutableStringReference(value)))
    implementation.addInstruction(1, BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
}

/**
 * The `Version` attribute of the bundle this code was loaded from. The manifest is found next to
 * the bundled .mpe, which works for the JVM (CLI, tests) and for Manager's dex class loader.
 */
private fun bundleVersion(): String = runCatching {
    val loader = HevalControlsHost::class.java.classLoader
    val mpe = loader.getResource(HEVAL_EXTENSION)?.toString() ?: return@runCatching null
    val manifestUrl = java.net.URI(mpe.removeSuffix(HEVAL_EXTENSION) + "META-INF/MANIFEST.MF").toURL()
    manifestUrl.openStream().use { Manifest(it).mainAttributes.getValue("Version") }
}.getOrNull()?.takeIf { it.isNotBlank() } ?: "unknown"

private fun String.toDescriptor() = "L" + replace('.', '/') + ";"

/**
 * Adds the init provider and the settings activity under `<application>`. Both are
 * `exported="false"`: only the app itself can start the screen, and the provider serves no data.
 * The authority uses the manifest's current package, and "GmsCore support"'s package rename
 * rewrites `<oldpackage>.`-prefixed authorities, so either patch order gives a matching authority.
 */
internal fun Document.addHevalControlsComponents() {
    val manifest = documentElement ?: throw PatchException("AndroidManifest.xml has no root element")
    val packageName = manifest.getAttribute("package").takeIf { it.isNotBlank() }
        ?: throw PatchException("AndroidManifest.xml has no package attribute")
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("AndroidManifest.xml has no <application>")

    val existing = getElementsByTagName("*")
    for (i in 0 until existing.length) {
        val name = (existing.item(i) as? Element)?.getAttribute("android:name") ?: continue
        if (name.startsWith("app.template.extension.hevalcontrols.")) {
            throw PatchException("Heval Controls is already in this APK ($name). Start from the stock APK.")
        }
    }

    application.appendChild(
        createElement("provider").apply {
            setAttribute("android:name", HEVAL_INIT_PROVIDER)
            setAttribute("android:authorities", "$packageName.hevalcontrols")
            setAttribute("android:exported", "false")
            setAttribute("android:initOrder", HEVAL_INIT_ORDER)
        },
    )
    application.appendChild(
        createElement("activity").apply {
            setAttribute("android:name", HEVAL_ACTIVITY)
            setAttribute("android:exported", "false")
            setAttribute("android:label", "Heval Controls")
        },
    )
}
