package app.polishapps.patches.all

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import org.w3c.dom.Node

/** MicroG-RE's application id. Its Java namespace stays `com.google.android.gms`. */
internal const val MICROG_PACKAGE = "app.revanced.android.gms"

private const val EXTENSION_CLASS = "Lapp/polishapps/extension/all/MicroGMaps;"
private const val CONTEXT_TYPE = "Landroid/content/Context;"

/**
 * Module names the Maps SDK client asks Play Services' DynamiteModule for. They belong to Google's
 * bundled client library, not to the app, so R8 leaves them alone and they identify the loader in
 * any app that draws a Google map.
 */
private const val MAPS_DYNAMITE = "com.google.android.gms.maps_dynamite"
private const val MAPS_CORE_DYNAMITE = "com.google.android.gms.maps_core_dynamite"

/**
 * Lets the app see MicroG-RE. Apps targeting SDK 30+ get "package not found" for packages that are not
 * declared in `<queries>`, so without this the extension cannot even create MicroG-RE's context.
 *
 * Nameless, so it stays an internal dependency and not an entry of its own in the patch list.
 */
internal val microGPackageVisibilityPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0)

            fun Node.hasPackage(name: String) =
                (0 until childNodes.length)
                    .map { childNodes.item(it) }
                    .any { it is Element && it.tagName == "package" && it.getAttribute("android:name") == name }

            val queries = (0 until manifest.childNodes.length)
                .map { manifest.childNodes.item(it) }
                .firstOrNull { it is Element && it.tagName == "queries" }
                ?: manifest.appendChild(document.createElement("queries"))

            // Other MicroG-RE patches add the same entry, so check before appending.
            if (!queries.hasPackage(MICROG_PACKAGE)) {
                queries.appendChild(
                    document.createElement("package").apply {
                        setAttribute("android:name", MICROG_PACKAGE)
                    },
                )
            }
        }
    }
}

private fun String.registerWidth() = if (this == "J" || this == "D") 2 else 1

@Suppress("unused")
val microGMapsPatch = bytecodePatch(
    name = "MicroG-RE maps support",
    description = "Draws Google Maps with MicroG-RE's map renderer, which needs no API key and does not " +
        "check the app's signing certificate. Fixes grey maps in a re-signed app. Needs MicroG-RE 7.0.0 or " +
        "later installed. Without it the app keeps using Google Play Services. Only for apps that use the " +
        "Google Maps SDK.",
    // Apps without the Maps SDK cannot be patched, so this must be chosen on purpose.
    default = false,
) {
    dependsOn(microGPackageVisibilityPatch)

    extendWith("extensions/extension.mpe")

    // The Maps client resolves the renderer's context in one static method, which tries the dynamite
    // modules in turn, falls back to Play Services' own context and caches the result. Every map surface
    // of the app goes through it, so returning MicroG-RE's context from its first instruction redirects
    // them all. DynamiteModule itself is left alone: it also serves ads, ML Kit and other modules, which
    // must keep loading from Play Services.
    execute {
        val loader = singleMethod("Google Maps module loader") { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == CONTEXT_TYPE &&
                method.strings().let { MAPS_DYNAMITE in it && MAPS_CORE_DYNAMITE in it }
        }

        // The parameter order differs between releases of the client library, so find the Context.
        val parameterTypes = loader.parameterTypeNames()
        val contextIndex = parameterTypes.indexOf(CONTEXT_TYPE)
        if (contextIndex < 0 || parameterTypes.lastIndexOf(CONTEXT_TYPE) != contextIndex) {
            throw PatchException("Maps module loader takes no single Context parameter: $parameterTypes")
        }
        val contextRegister = parameterTypes.take(contextIndex).sumOf { it.registerWidth() }

        loader.injectMicroGContext(contextRegister, parameterTypes.sumOf { it.registerWidth() })
    }
}

private fun MutableMethod.injectMicroGContext(contextRegister: Int, parameterRegisters: Int) {
    val registerCount = implementation?.registerCount ?: throw PatchException("Maps module loader has no code")
    // v0 is used as scratch. It is free because the original body assigns it before reading it.
    if (registerCount - parameterRegisters < 1) {
        throw PatchException("Maps module loader has no free local register")
    }

    // The extension returns null when MicroG-RE cannot serve the map, and the branch then falls into
    // the original body. The label has to bind to a real instruction of the method: a label written
    // inside the injected block would resolve against the block's own addresses.
    addInstructionsWithLabels(
        0,
        """
            invoke-static { p$contextRegister }, $EXTENSION_CLASS->getMapsContext($CONTEXT_TYPE)$CONTEXT_TYPE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """,
        ExternalLabel("original", getInstruction(0)),
    )
}
