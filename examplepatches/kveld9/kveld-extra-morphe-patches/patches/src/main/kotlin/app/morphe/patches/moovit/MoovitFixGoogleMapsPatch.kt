package app.morphe.patches.moovit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.Constants.COMPATIBILITY_MOOVIT
import app.morphe.patches.shared.setApplicationMetaData
import app.morphe.patches.shared.sharedExtensionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private val mapsApiKeyOption = stringOption(
    key = "mapsApiKey",
    default = null,
    title = "Google Maps Platform API key",
    description = "Personal Google Maps Platform API key. Required because the built-in key only works with the original signature.",
    required = true,
)

private val forceGoogleMapsOption = booleanOption(
    key = "forceGoogleMaps",
    default = false,
    title = "Force Google Maps engine",
    description = "Always use Google Maps instead of the region default map.",
    required = false,
)

private val moovitMapsApiKeyResourcePatch = resourcePatch(
    name = "Moovit Custom Maps API Key",
    description = "Replaces the Google Maps API key in AndroidManifest.xml and web-service strings when a custom key is provided.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MOOVIT)

    execute {
        val key = mapsApiKeyOption.value
        if (key.isNullOrBlank()) {
            error("[Fix Google Maps] A personal Google Maps API key is required. See docs/apps/moovit.md, section Fix Google Maps.")
        }

        val cleanKey = key.trim()

        val manifestFile = get("AndroidManifest.xml")
        if (manifestFile.exists()) {
            document(manifestFile.absolutePath).use { doc ->
                val application = doc.getElementsByTagName("application").item(0) as? Element
                if (application != null) {
                    application.setApplicationMetaData("com.google.android.geo.API_KEY", cleanKey)
                }
            }
        }

        decode("res/values*")
        val stringsFile = get("res/values/strings.xml")
        if (stringsFile.exists()) {
            document(stringsFile.absolutePath).use { doc ->
                val strings = doc.getElementsByTagName("string")
                val webServicesKey = (0 until strings.length)
                    .mapNotNull { strings.item(it) as? Element }
                    .singleOrNull { it.getAttribute("name") == "google_wla_api_key" }
                if (webServicesKey != null) {
                    webServicesKey.textContent = cleanKey
                }
            }
        }

        println("[Fix Google Maps] Injected custom Google Maps API key into AndroidManifest.xml and strings.xml.")
    }
}

private val acquireMapViewFactoryFingerprint = Fingerprint(
    parameters = listOf("Lcom/moovit/map/MapImplType;"),
    strings = listOf("acquireMapViewFactory mapImplType: "),
)

@Suppress("unused")
val moovitFixGoogleMapsPatch = bytecodePatch(
    name = "Fix Google Maps",
    description = "Restores Google Maps rendering by spoofing the original package signature to Google Play Services.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOOVIT)
    dependsOn(moovitMapsApiKeyResourcePatch, sharedExtensionPatch)

    mapsApiKeyOption()
    forceGoogleMapsOption()

    execute {
        val appClass = mutableClassDefBy("Lcom/moovit/MoovitApplication;")
        val attachBaseContextMethod = appClass.methods.firstOrNull { it.name == "attachBaseContext" }
        if (attachBaseContextMethod != null) {
            attachBaseContextMethod.addInstructions(
                0,
                "invoke-static {p1}, Lcom/kveld9/morphe/extra/extension/MoovitHelper;->init(Landroid/content/Context;)V",
            )
        } else {
            val method = MutableMethod(
                ImmutableMethod(
                    "Lcom/moovit/MoovitApplication;",
                    "attachBaseContext",
                    listOf(ImmutableMethodParameter("Landroid/content/Context;", emptySet(), null)),
                    "V",
                    AccessFlags.PROTECTED.value,
                    emptySet(),
                    null,
                    MutableMethodImplementation(2)
                )
            ).apply {
                addInstructions(
                    0,
                    """
                        invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V
                        invoke-static {p1}, Lcom/kveld9/morphe/extra/extension/MoovitHelper;->init(Landroid/content/Context;)V
                        return-void
                    """.trimIndent()
                )
            }
            appClass.methods.add(method)
        }
        println("[Fix Google Maps] Injected signature spoofing initializer into MoovitApplication.attachBaseContext -> Maps rendering restored.")

        if (forceGoogleMapsOption.value == true) {
            val targetMethod = acquireMapViewFactoryFingerprint.method
            val paramReg = if (AccessFlags.STATIC.isSet(targetMethod.accessFlags)) "p0" else "p1"
            targetMethod.addInstructions(
                0,
                "sget-object $paramReg, Lcom/moovit/map/MapImplType;->GOOGLE:Lcom/moovit/map/MapImplType;",
            )
            println("[Fix Google Maps] Forced Google Maps engine in map factory selector.")
        }
    }
}
