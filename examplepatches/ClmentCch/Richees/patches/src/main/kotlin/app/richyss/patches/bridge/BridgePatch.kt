package app.richyss.patches.bridge

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.richyss.patches.shared.Constants
import app.richyss.patches.shared.Constants.BRIDGE_AUTHORITY
import app.richyss.patches.shared.Constants.BRIDGE_MANIFEST_VERSION
import app.richyss.patches.shared.Constants.BRIDGE_PROVIDER_CLASS
import app.richyss.patches.shared.Constants.COMPATIBILITY_DISCORD

private const val BRIDGE_INIT_TYPE = "Lapp/richyss/extension/BridgeInit;"

/**
 * Injects an exported ContentProvider into the Discord client so that Richyss can
 * talk to it without any account credentials.
 *
 * The provider is a self-contained extension: it stores the presence payload that
 * Richyss sends and answers capability queries. It never reads Discord's session
 * token and never performs network requests.
 */
@Suppress("unused")
val richyssBridgePatch = patch(
    name = "Richyss Bridge",
    description = "Adds a local, credential-free content provider that Richyss uses to " +
        "detect this patch and hand over Rich Presence payloads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISCORD)

    extendWith("extensions/richyss.mpe")

    execute {
        var applicationClass: String? = null

        // Register the provider in the manifest: this is what makes the bridge
        // reachable from Richyss once the patched Discord is installed.
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.applicationElement()
            val packageName = manifest.documentElement.getAttribute("package").orEmpty()
            applicationClass = manifest.applicationClassName(packageName)

            val alreadyRegistered = application.child("provider")
                ?.getAttributeNS(ANDROID_NS, "authorities") == BRIDGE_AUTHORITY
            if (!alreadyRegistered) {
                val provider = manifest.createElement("provider").apply {
                    setAttributeNS(ANDROID_NS, "android:name", BRIDGE_PROVIDER_CLASS)
                    setAttributeNS(ANDROID_NS, "android:authorities", BRIDGE_AUTHORITY)
                    // Richyss lives in another package, so the provider must be exported.
                    // BridgeProvider enforces the caller allowlist at runtime.
                    setAttributeNS(ANDROID_NS, "android:exported", "true")
                    setAttributeNS(ANDROID_NS, "android:enabled", "true")
                }
                application.appendChild(provider)

                application.appendChild(
                    manifest.createElement("meta-data").apply {
                        setAttributeNS(ANDROID_NS, "android:name", "com.richyss.bridge.version")
                        setAttributeNS(ANDROID_NS, "android:value", BRIDGE_MANIFEST_VERSION)
                    }
                )
                application.appendChild(
                    manifest.createElement("meta-data").apply {
                        setAttributeNS(ANDROID_NS, "android:name", "com.richyss.bridge.protocol")
                        setAttributeNS(
                            ANDROID_NS,
                            "android:value",
                            Constants.BRIDGE_PROTOCOL_VERSION
                        )
                    }
                )
            }
        }

        val target = applicationClass ?: throw PatchException(
            "Discord does not declare an Application class in its manifest, " +
                "so the Richyss bridge cannot be initialised."
        )

        // Initialise the bridge from Application.onCreate() so its storage is ready
        // before the first request from Richyss arrives.
        val onCreate = mutableClassDefBy(target)
            .methods
            .firstOrNull { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("$target has no onCreate() method")

        onCreate.addInstructions(
            0,
            """
                invoke-static { p0 }, $BRIDGE_INIT_TYPE->initialize(Landroid/content/Context;)V
            """
        )
    }

    finalize {
        println(
            "Richyss bridge available at content://$BRIDGE_AUTHORITY " +
                "(protocol ${Constants.BRIDGE_PROTOCOL_VERSION})"
        )
    }
}
