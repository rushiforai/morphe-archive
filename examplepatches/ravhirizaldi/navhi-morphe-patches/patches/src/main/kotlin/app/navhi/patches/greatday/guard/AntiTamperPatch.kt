package app.navhi.patches.greatday.guard

import app.navhi.patches.greatday.shared.Constants.COMPATIBILITY_GREATDAY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// Held without the trailing `;`: gluing it into the templates below would produce `;;`.
private const val ANTI_TAMPERING_PLUGIN = "Lcom/duddu/antitampering/AntiTamperingPlugin"
private const val PLUGIN_RESULT = "Lorg/apache/cordova/PluginResult"
private const val CALLBACK_CONTEXT = "Lorg/apache/cordova/CallbackContext"

/** The asset-hash check runs here on plugin init; the mod's smali answers before it. */
private val checkAssetsFingerprint = Fingerprint(
    definingClass = "$ANTI_TAMPERING_PLUGIN;",
    name = "a",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)

private val executeFingerprint = Fingerprint(
    definingClass = "$ANTI_TAMPERING_PLUGIN;",
    name = "execute",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONArray;", "$CALLBACK_CONTEXT;"),
)

/**
 * Answers the JS `verify` call so it never reaches the hash comparison.
 * The method's registers are `p0..p3` only, so the rewritten answer reuses the dead
 * `p0..p2` rather than asking for new ones.
 */
private val ALWAYS_OK = """
    sget-object p2, $PLUGIN_RESULT${'$'}Status;->OK:$PLUGIN_RESULT${'$'}Status;
    new-instance p1, $PLUGIN_RESULT;
    const-string p0, "{}"
    invoke-direct { p1, p2, p0 }, $PLUGIN_RESULT;-><init>($PLUGIN_RESULT${'$'}Status;Ljava/lang/String;)V
    invoke-virtual { p3, p1 }, $CALLBACK_CONTEXT;->sendPluginResult($PLUGIN_RESULT;)V
    const/4 p0, 0x1
    return p0
"""

/** Both anti-tampering entry points skip the check: re-signing the APK always trips it. */
@Suppress("unused")
val disableAntiTamperingPatch = bytecodePatch(
    name = "Skip signature check",
    description = "The modified app starts normally instead of quitting with a \"changed by another party\" warning.",
) {
    compatibleWith(COMPATIBILITY_GREATDAY)

    execute {
        checkAssetsFingerprint.method.addInstructions(0, "return-void")
        executeFingerprint.method.addInstructions(0, ALWAYS_OK)
    }
}
