package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

private const val DEVICE_INFO = "Lcom/rovio/beacon/DeviceInfo;"
private const val ATTRIBUTION = "Lcom/rovio/beacon/Attribution;"

/**
 * Neutralizes the beacon tracking entry points both Rovio games hand to their C# layer. Every value
 * is replaced at the data level with the original threading intact: `getAdvertisingIdentifier`,
 * `getAdvertisingTrackingEnabled` and `getAppSetId` feed the advertising-identifier callback, and
 * install-referrer attribution is reported as already queried so the C# bootstrap never starts the
 * Play/Facebook/Instagram referrer queries at all. The game's own cloud services keep working.
 */
context(context: BytecodePatchContext)
internal fun silenceRovioBeaconTracking(game: String) {
    /** Replaces an argument-less getter's body with a constant, keeping the return type intact. */
    fun forceReturn(owner: String, name: String, returnType: String, constant: String) {
        val method = context.mutableClassDefBy(owner).methods.singleOrNull {
            it.name == name && it.parameterTypes.isEmpty() && it.returnType == returnType
        } ?: error("$game tracking entry changed: $name")
        val implementation = method.implementation ?: error("$game tracking entry $name has no body")
        check(implementation.instructions.count() > 2) { "$game tracking entry already patched: $name" }
        check(implementation.registerCount > 1) { "$game tracking entry $name has no scratch register" }
        val returnOpcode = if (returnType.startsWith("L") || returnType.startsWith("[")) "return-object" else "return"
        method.addInstructions(0, "$constant\n$returnOpcode v0")
    }

    forceReturn(DEVICE_INFO, "getAdvertisingIdentifier", "Ljava/lang/String;", "const-string v0, \"\"")
    forceReturn(DEVICE_INFO, "getAdvertisingTrackingEnabled", "Z", "const/4 v0, 0x0")
    forceReturn(DEVICE_INFO, "getAppSetId", "Ljava/lang/String;", "const-string v0, \"\"")

    forceReturn(ATTRIBUTION, "hasQueriedReferrer", "Z", "const/4 v0, 0x1")
    forceReturn(ATTRIBUTION, "getMetaInstallReferrer", "Lorg/json/JSONObject;", "const/4 v0, 0x0")
}
