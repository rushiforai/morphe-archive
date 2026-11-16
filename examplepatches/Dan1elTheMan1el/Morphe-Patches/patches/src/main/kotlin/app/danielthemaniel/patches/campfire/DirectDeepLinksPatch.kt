package app.danielthemaniel.patches.campfire

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel

private const val BROWSER = "Lcom/capacitorjs/plugins/browser/Browser;"
private const val BRIDGE = "Lcom/getcapacitor/Bridge;"
private const val URI = "Landroid/net/Uri;"
private const val EXT = "Lapp/danielthemaniel/patches/campfire/extension/DirectDeepLinks;"

/**
 * At the start of [this] (Uri in p1): if DirectDeepLinks.openDirect(p1) handled the link, run
 * [skip] instead of the method. v0 is scratch, so it must be a local, not a parameter.
 */
private fun MutableMethod.openDirectFirst(skip: String) {
    val implementation = implementation!!
    // this + one register per parameter, two for long/double.
    val types = parameterTypes.map { it.toString() }
    val parameterRegisters = 1 + types.size + types.count { it == "J" || it == "D" }
    if (implementation.registerCount <= parameterRegisters) {
        throw PatchException("No scratch register in $definingClass->$name")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range {p1 .. p1}, $EXT->openDirect($URI)Z
            move-result v0
            if-eqz v0, :original
            $skip
        """,
        ExternalLabel("original", getInstruction(0)),
    )
}

/**
 * Campfire's "open Pokémon GO" buttons use AppsFlyer OneLink URLs that load a redirect page in a
 * browser tab before bouncing into the game. Build the final deep link locally and open it
 * directly. Falls back to the OneLink (and so the store) when the game isn't installed.
 */
@Suppress("unused")
val directDeepLinksPatch = bytecodePatch(
    name = "Open game links directly",
    description = "Opens Pokémon GO (and other game) links straight in the game instead of going " +
        "through the AppsFlyer OneLink redirect page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    dependsOn(sharedPermissionFixPatch, campfireExtensionPatch)

    execute {
        // Capacitor Browser plugin (Custom Tab). open(Uri) delegates to open(Uri, Integer).
        mutableClassDefBy(BROWSER).methods.firstOrNull {
            it.name == "open" && it.returnType == "V" &&
                it.parameterTypes.map { p -> p.toString() } == listOf(URI, "Ljava/lang/Integer;")
        }?.openDirectFirst("return-void")
            ?: throw PatchException("Browser.open(Uri, Integer) not found")

        // window.open / link navigation leaving the WebView (ACTION_VIEW).
        mutableClassDefBy(BRIDGE).methods.firstOrNull {
            it.name == "launchIntent" && it.returnType == "Z" &&
                it.parameterTypes.map { p -> p.toString() } == listOf(URI)
        }?.openDirectFirst("const/4 v0, 0x1\nreturn v0")
            ?: throw PatchException("Bridge.launchIntent(Uri) not found")
    }
}
