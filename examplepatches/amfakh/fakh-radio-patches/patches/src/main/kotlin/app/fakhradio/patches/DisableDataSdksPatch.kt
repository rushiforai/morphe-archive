package app.fakhradio.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Whether this method reads `Build.MANUFACTURER`, which only the per-manufacturer
 * blocklist checks do among the `()Z` methods of their packages.
 */
private fun Method.readsManufacturer(): Boolean =
    implementation?.instructions?.any {
        (it as? ReferenceInstruction)?.reference?.toString() ==
            "Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;"
    } == true

/**
 * `com.appmind.utils.tracking.a.a()`: the app's own "no tracking on this
 * device" switch, true only for blocklisted manufacturers on Android 10. When
 * true, the Weplan (Cumberland) wrapper calls `WeplanSdk.disable()` and the
 * Monedata wrapper calls `Wavebrook.stop()`, which carries CellRebel,
 * M2Catalyst, Umlaut, Teragence, Rootlake and ipinfo.
 */
private val trackingBlockedFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appmind/utils/tracking/") && method.readsManufacturer()
    },
)

/**
 * `com.appmind.speedchecker.wrapper.e.o()`: the Speedchecker blocklist check.
 * When true, the wrapper disables the SDK's service and receivers and cancels
 * its WorkManager jobs instead of starting it.
 */
private val speedcheckerBlockedFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/appmind/speedchecker/wrapper/") && method.readsManufacturer()
    },
)

/**
 * Remote config readers that return `null` when the key is unset, `TRUE` to
 * start the SDK and `FALSE` to stop it (LowLagLabs `a.f()` in
 * `com.appmind.external.signal`, `com.appmind.geotruth.a.b()`).
 */
private val lowLagLabsFlagFingerprint = Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    strings = listOf("INIT_LOW_LAG_LABS_SDK"),
)

private val geoTruthFlagFingerprint = Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf(),
    strings = listOf("INIT_GEOTRUTH_SDK"),
)

@Suppress("unused")
val disableDataSdksPatch = bytecodePatch(
    name = "Disable data collection SDKs",
    description = "Stops the location, Wi-Fi and network data SDKs (Weplan, Wavebrook and its partners, Speedchecker, LowLagLabs, GeoTruth) through the app's own off switches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Privacy")

    execute {
        listOf(trackingBlockedFingerprint, speedcheckerBlockedFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
        listOf(lowLagLabsFlagFingerprint, geoTruthFlagFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """,
            )
        }
    }
}
