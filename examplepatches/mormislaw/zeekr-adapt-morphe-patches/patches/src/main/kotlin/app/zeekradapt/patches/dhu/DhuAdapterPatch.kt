package app.zeekradapt.patches.dhu

import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.floatOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

internal const val FACTORY_CLASS = "com.dhuadapter.DhuAdapterFactory"
private const val COVER_PROVIDER_CLASS = "com.dhuadapter.mediabridge.CoverProvider"
private const val RECOVERY_RECEIVER_CLASS = "com.dhuadapter.mediabridge.RecoveryReceiver"
private const val RECOVERY_ACTION = "com.dhuadapter.RECOVER"
private const val MEDIA_CENTER_PACKAGE = "com.zeekr.mediacenter"

// Same asset paths the original patch_apk.sh writes, plus the Pine native library.
private const val CONFIG_ASSET = "assets/dhu-adapter-config.json"
private const val CERT_ASSET = "assets/orig-cert.der"
private const val PINE_ASSET_DIR = "assets/dhu-adapter/lib"
private const val PINE_RESOURCE_DIR = "dhuadapter/lib"
private val PINE_ABIS = listOf("arm64-v8a", "armeabi-v7a")

private const val DEFAULT_USER_AGENT = "Mozilla/5.0 (Linux; Android 13; Pixel 5) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36"

private val logger = Logger.getLogger("DhuAdapterPatch")

/**
 * Default values of the opt-in categories, per app. Mirrors the per-app flag sets
 * of zeekr-adapt (README "Per-app flag sets" and patch_apk.sh --help).
 */
internal data class DhuPreset(
    val rootBypass: Boolean = false,
    val emulatorBypass: Boolean = false,
    val automotiveFix: Boolean = false,
    val networkBypass: Boolean = false,
    val simReady: Boolean = false,
    val mediaBridge: Boolean = false,
    val allowCapture: Boolean = false,
    val copySign: Boolean = false,
    val forceOrientation: Boolean = true,
)

/** Merges the runtime (DhuAdapterFactory, all hook categories and Pine) into the app DEX. */
private val dhuAdapterExtensionPatch = bytecodePatch {
    extendWith("extensions/dhuadapter.mpe")
}

private val DPI_VALUES = mapOf(
    "200 dpi (x1.25)" to 200,
    "240 dpi (x1.5)" to 240,
    "280 dpi (x1.75, default)" to 280,
    "320 dpi (x2.0)" to 320,
    "360 dpi (x2.25)" to 360,
)

/**
 * Builds a "DHU adapter" patch. The patch replaces the manual zeekr-adapt pipeline
 * (patch_manifest.py + patch_apk.sh): it points android:appComponentFactory at the
 * adapter, embeds the configuration, the genuine signer certificate and libpine.so
 * as assets, and declares the MediaCenter components. The hooks themselves run at
 * app start from the extension, exactly as in zeekr-adapt.
 */
internal fun dhuAdapterPatch(
    name: String,
    description: String,
    compatibility: Compatibility?,
    preset: DhuPreset = DhuPreset(),
): ResourcePatch = resourcePatch(
    name = name,
    description = description,
    default = false,
) {
    compatibility?.let { compatibleWith(it) }

    dependsOn(dhuAdapterExtensionPatch)

    // region Category 1: Display / UI

    val display by booleanOption(
        key = "display",
        default = true,
        title = "Display / UI",
        description = "Category 1. Raises the density the app perceives, recomputes screen dp from the " +
            "real usable pixels, unlocks orientation, adds the floating back/settings button, rounded " +
            "corners, WebView text zoom and user agent. Disable for a bare shell (--no-display).",
    )
    val metricsDpi by intOption(
        key = "metricsDpi",
        default = 280,
        values = DPI_VALUES,
        title = "Rendering DPI",
        description = "Density used for DisplayMetrics (rendering). Bigger means a larger UI. " +
            "Keep it equal to the layout DPI. Can also be changed at runtime in the settings panel.",
        required = true,
    ) { it != null && it in 120..640 }
    val configDpi by intOption(
        key = "configDpi",
        default = 280,
        values = DPI_VALUES,
        title = "Layout DPI",
        description = "Density written into Configuration (resource and layout selection). zeekr-adapt " +
            "keeps it equal to the rendering DPI, a split density breaks fixed-size views.",
        required = true,
    ) { it != null && it in 120..640 }
    val forceOrientation by booleanOption(
        key = "forceOrientation",
        default = preset.forceOrientation,
        title = "Unlock orientation",
        description = "Turns every Activity.setRequestedOrientation call into UNSPECIFIED, " +
            "so portrait-locked apps follow the landscape head unit (--no-orientation disables it).",
    )
    val fullscreen by booleanOption(
        key = "fullscreen",
        default = false,
        title = "Fullscreen",
        description = "Hides the system bars in every activity. Off by default, the dp recompute " +
            "accounts for the visible bars.",
    )
    val backButton by booleanOption(
        key = "backButton",
        default = true,
        title = "Floating button",
        description = "Draggable floating button in every activity. Tap: back, long press: settings " +
            "panel (DPI, button size, alpha, color, restart).",
    )
    val backButtonOnlySettings by booleanOption(
        key = "backButtonOnlySettings",
        default = false,
        title = "Floating button opens settings only",
        description = "The button shows the current DPI and a tap opens the settings panel instead of going back.",
    )
    val backButtonSize by intOption(
        key = "backButtonSize",
        default = 48,
        title = "Floating button size (dp)",
        description = "Size of the floating button, 24 to 96 dp.",
        required = true,
    ) { it != null && it in 24..96 }
    val backButtonAlpha by floatOption(
        key = "backButtonAlpha",
        default = 0.5f,
        title = "Floating button opacity",
        description = "Opacity of the floating button, 0.05 to 1.0.",
        required = true,
    ) { it != null && it in 0.05f..1.0f }
    val backButtonColor by stringOption(
        key = "backButtonColor",
        default = "#4CAF50",
        title = "Floating button color",
        description = "Color of the floating button as #RRGGBB.",
        required = true,
    ) { it != null && it.matches(Regex("^#?[0-9a-fA-F]{6}$")) }
    val roundedCorners by booleanOption(
        key = "roundedCorners",
        default = true,
        title = "Rounded corners",
        description = "Clips the activity content to rounded corners.",
    )
    val roundedCornersRadius by intOption(
        key = "roundedCornersRadius",
        default = 16,
        title = "Corner radius (dp)",
        description = "Radius of the rounded corners.",
        required = true,
    ) { it != null && it in 0..64 }
    val fontOverride by stringOption(
        key = "fontOverride",
        default = null,
        title = "Font override",
        description = "File name of a font inside the app's assets/fonts/ to apply to every TextView. Empty: off.",
    )
    val userAgentOverride by stringOption(
        key = "userAgentOverride",
        default = DEFAULT_USER_AGENT,
        title = "WebView user agent",
        description = "Returned by WebSettings.getDefaultUserAgent. Fixes web-rendered maps rejected by tile " +
            "servers. Empty: keep the system user agent.",
    )

    // endregion

    val rootBypass by booleanOption(
        key = "rootBypass",
        default = preset.rootBypass,
        title = "Root bypass",
        description = "Category 2. Hides root and su from the app: Build.TAGS, File.exists, Runtime.exec, " +
            "ProcessBuilder, PackageManager and root SystemProperties. For apps that refuse to run on " +
            "rooted or userdebug head units.",
    )
    val emulatorBypass by booleanOption(
        key = "emulatorBypass",
        default = preset.emulatorBypass,
        title = "Emulator bypass",
        description = "Category 3. De-genericises Build.* and qemu/goldfish SystemProperties.",
    )
    val automotiveFix by booleanOption(
        key = "automotiveFix",
        default = preset.automotiveFix,
        title = "Automotive de-mask",
        description = "Category 4. isAutomotiveOS() and hasSystemFeature(automotive) return false, " +
            "UiModeManager reports NORMAL, Configuration.uiMode loses CAR and the Android Auto " +
            "connection query is blocked. Fixes the blank/white screen of car-aware apps.",
    )
    val networkBypass by booleanOption(
        key = "networkBypass",
        default = preset.networkBypass,
        title = "Network bypass",
        description = "Category 5a. NetworkCapabilities.hasCapability/hasTransport and NetworkInfo.isConnected " +
            "report connected (head unit internet over Ethernet/TBOX without Android validation).",
    )
    val simReady by booleanOption(
        key = "simReady",
        default = preset.simReady,
        title = "SIM ready",
        description = "Category 5b. getSimState returns READY and key_use_cellular_data reads true. " +
            "Harmful to SIM-aware apps such as phone number registration.",
    )
    val mediaBridge by booleanOption(
        key = "mediaBridge",
        default = preset.mediaBridge,
        title = "Zeekr MediaCenter bridge",
        description = "Category 6. Registers the app's MediaSession with ZeekrMediaCenterService: steering " +
            "wheel control, cover art, metadata and reboot resume. Adds CoverProvider, RecoveryReceiver and " +
            "the com.zeekr.mediacenter package query. Media apps only.",
    )
    val allowCapture by booleanOption(
        key = "allowCapture",
        default = preset.allowCapture,
        title = "Allow screen capture",
        description = "Category 7. Strips FLAG_SECURE so the screen can be captured or mirrored.",
    )
    val debug by booleanOption(
        key = "debug",
        default = false,
        title = "Debug logging",
        description = "Category 8. Verbose logs, read with adb logcat -s DhuAdapter.",
    )
    val copySign by booleanOption(
        key = "copySign",
        default = preset.copySign,
        title = "Copy original signature",
        description = "Category 9. Stores the genuine signer certificate of the original APK and returns it " +
            "to the app's own signature self-check. Requires the original, store-signed APK.",
    )

    execute {
        val packageName = packageMetadata.packageName
        var originalFactory: String? = null

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val current = application.getAttribute("android:appComponentFactory")
            if (current == FACTORY_CLASS) {
                throw PatchException("The app is already patched with a DHU adapter patch. Apply only one of them.")
            }
            // Relative class names (".Foo") are resolved against the manifest package.
            originalFactory = current.takeIf { it.isNotEmpty() }?.let {
                if (it.startsWith(".")) packageName + it else it
            }
            application.setAttribute("android:appComponentFactory", FACTORY_CLASS)

            if (mediaBridge == true) {
                addMediaBridgeComponents(document, application, packageName)
            }
        }

        val config = linkedMapOf<String, Any?>(
            "metricsDpi" to metricsDpi,
            "configDpi" to configDpi,
            "forceOrientation" to forceOrientation,
            "backButton" to linkedMapOf(
                "enabled" to backButton,
                "sizeDp" to backButtonSize,
                "alpha" to backButtonAlpha,
                "color" to backButtonColor!!.let { if (it.startsWith("#")) it else "#$it" },
                "onlySettings" to backButtonOnlySettings,
            ),
            "roundedCorners" to linkedMapOf(
                "enabled" to roundedCorners,
                "radiusDp" to roundedCornersRadius,
            ),
            "fullscreen" to fullscreen,
            "fontOverride" to fontOverride?.takeIf { it.isNotBlank() },
            "userAgentOverride" to userAgentOverride?.takeIf { it.isNotBlank() },
            "display" to display,
            "rootBypass" to rootBypass,
            "emulatorBypass" to emulatorBypass,
            "automotiveFix" to automotiveFix,
            "networkBypass" to networkBypass,
            "simReady" to simReady,
            "mediaBridge" to mediaBridge,
            "allowCapture" to allowCapture,
            "copySign" to copySign,
            "debug" to debug,
            "delegateAppComponentFactory" to originalFactory,
        )
        get(CONFIG_ASSET, copy = false).writeText(toJson(config))

        if (copySign == true) {
            writeOriginalCertificate()
        }

        copyPineLibraries()
    }
}

private fun addMediaBridgeComponents(document: Document, application: Element, packageName: String) {
    // <provider> serving album art as content:// URIs, authority "<package>.dhucovers"
    // (CoverProvider.authority uses Context.getPackageName(), so package renaming
    // patches that rewrite provider authorities keep both in sync).
    application.appendChild(
        document.createElement("provider").apply {
            setAttribute("android:name", COVER_PROVIDER_CLASS)
            setAttribute("android:authorities", "$packageName.dhucovers")
            setAttribute("android:exported", "true")
            setAttribute("android:grantUriPermissions", "true")
        },
    )

    // <receiver> woken by MediaCenter's recovery broadcast after a reboot.
    application.appendChild(
        document.createElement("receiver").apply {
            setAttribute("android:name", RECOVERY_RECEIVER_CLASS)
            setAttribute("android:enabled", "true")
            setAttribute("android:exported", "true")
            appendChild(
                document.createElement("intent-filter").apply {
                    appendChild(
                        document.createElement("action").apply {
                            setAttribute("android:name", RECOVERY_ACTION)
                        },
                    )
                },
            )
        },
    )

    // <queries><package android:name="com.zeekr.mediacenter"/></queries> (Android 11+ package visibility).
    val manifest = document.documentElement
    val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
        ?: document.createElement("queries").also { manifest.insertBefore(it, application) }
    queries.appendChild(
        document.createElement("package").apply {
            setAttribute("android:name", MEDIA_CENTER_PACKAGE)
        },
    )
}

private fun ResourcePatchContext.writeOriginalCertificate() {
    // The signer certificate of the highest signature scheme present (the first one of
    // the chain), like tools/extract_apk_cert.py. Its DER is what PackageManager hands
    // to the app as Signature/SigningInfo. Other blocks (e.g. source stamp) are ignored.
    val certificates = packageMetadata.signingCertificates
    val certificate = listOf(ApkSignatureScheme.V31, ApkSignatureScheme.V3, ApkSignatureScheme.V2)
        .firstNotNullOfOrNull { certificates[it]?.firstOrNull() }

    if (certificate == null) {
        logger.warning(
            "Copy original signature: the input APK has no v2/v3 signer certificate, " +
                "the signature spoof will be a no-op. Use the original store-signed APK.",
        )
        return
    }

    get(CERT_ASSET, copy = false).writeBytes(certificate.encoded)
}

private fun ResourcePatchContext.copyPineLibraries() {
    val classLoader = DhuPreset::class.java.classLoader
    PINE_ABIS.forEach { abi ->
        val stream = classLoader.getResourceAsStream("$PINE_RESOURCE_DIR/$abi/libpine.so")
            ?: throw PatchException("libpine.so for $abi is missing from the patches bundle")
        stream.use { input ->
            get("$PINE_ASSET_DIR/$abi/libpine.so", copy = false).outputStream().use { input.copyTo(it) }
        }
    }
}

private fun toJson(value: Any?, indent: String = ""): String = when (value) {
    null -> "null"
    is Boolean, is Int -> value.toString()
    is Float -> value.toString()
    is String -> buildString {
        append('"')
        value.forEach { c ->
            when {
                c == '"' -> append("\\\"")
                c == '\\' -> append("\\\\")
                c < ' ' -> append("\\u%04x".format(c.code))
                else -> append(c)
            }
        }
        append('"')
    }
    is Map<*, *> -> {
        val inner = "$indent  "
        value.entries.joinToString(",\n", "{\n", "\n$indent}") { (k, v) ->
            "$inner${toJson(k.toString())}: ${toJson(v, inner)}"
        }
    }
    else -> throw IllegalArgumentException("Unsupported config value: $value")
}
