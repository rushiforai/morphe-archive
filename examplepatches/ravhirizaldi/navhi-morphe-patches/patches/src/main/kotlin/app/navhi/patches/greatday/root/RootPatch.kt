package app.navhi.patches.greatday.root

import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val IROOT = "Lde/cyberkatze/iroot/IRoot;"

/** Result the plugin reports when the device is treated as unrooted. */
private val UNROOTED = """
    new-instance v0, Lorg/apache/cordova/PluginResult;
    sget-object v1, Lorg/apache/cordova/PluginResult${'$'}Status;->OK:Lorg/apache/cordova/PluginResult${'$'}Status;
    const/4 v2, 0x0
    invoke-direct { v0, v1, v2 }, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult${'$'}Status;Z)V
    return-object v0
"""

private fun irootMethod(
    name: String,
    parameters: List<String>,
) = Fingerprint(
    definingClass = IROOT,
    name = name,
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Lorg/apache/cordova/PluginResult;",
    parameters = parameters,
)

private val checkBuildTagsFingerprint = irootMethod(
    "a",
    listOf("Lorg/json/JSONArray;", "Lorg/apache/cordova/CallbackContext;", "Ljava/lang/String;"),
)
private val checkRootBeerFingerprint = irootMethod("b", listOf("Lorg/json/JSONArray;", "Lorg/apache/cordova/CallbackContext;"))
private val checkBusyBoxFingerprint = irootMethod("c", listOf("Lorg/json/JSONArray;", "Lorg/apache/cordova/CallbackContext;"))
private val checkSuFingerprint = irootMethod("d", listOf("Lorg/json/JSONArray;", "Lorg/apache/cordova/CallbackContext;"))
private val checkInternalFingerprint = irootMethod("e", listOf("Lorg/json/JSONArray;", "Lorg/apache/cordova/CallbackContext;"))

@Suppress("unused")
val disableRootDetectionPatch = bytecodePatch(
    name = "Hide root",
    description = "Attendance no longer fails on a rooted phone.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        listOf(
            checkBuildTagsFingerprint,
            checkRootBeerFingerprint,
            checkBusyBoxFingerprint,
            checkSuFingerprint,
            checkInternalFingerprint,
        ).forEach { it.method.addInstructions(0, UNROOTED) }
    }
}
