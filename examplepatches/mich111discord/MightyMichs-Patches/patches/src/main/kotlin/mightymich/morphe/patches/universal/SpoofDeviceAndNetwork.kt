package mightymich.morphe.patches.universal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string

/**
 * Universal best-effort: spoof device identity, hide common root/emulator signals,
 * and optionally influence network-type checks that live inside the app dex.
 *
 * Options (Morphe Manager):
 *  - deviceModel     e.g. "Pixel 8"   (empty = unchanged)
 *  - manufacturer    e.g. "Google"    (empty = unchanged)
 *  - hideRoot        default true
 *  - hideEmulator    default true
 *  - connectionType  wifi | mobile | ethernet | none | default
 *
 * Limitations:
 *  - Only code inside the APK is patched (not the Android framework).
 *  - Play Integrity / server attestation is unaffected.
 *  - Network spoof only hits app-level helpers that expose type/connected as ()I / ()Z
 *    with recognizable strings — not every ConnectivityManager call site.
 */
@Suppress("unused")
val spoofDeviceAndNetworkPatch = bytecodePatch(
    name = "Spoof device & network",
    description = "Spoofs device model/manufacturer, hides common root/emulator " +
        "signals, and can force simple in-app network type checks.",
    default = false
) {
    val deviceModel by stringOption(
        key = "deviceModel",
        default = "",
        title = "Device model",
        description = "Value for model-style getters, e.g. Pixel 8. Empty = leave unchanged."
    )

    val manufacturer by stringOption(
        key = "manufacturer",
        default = "",
        title = "Manufacturer",
        description = "Value for manufacturer-style getters, e.g. Google. Empty = leave unchanged."
    )

    val hideRoot by booleanOption(
        key = "hideRoot",
        default = true,
        title = "Hide root",
        description = "Force common isRooted / RootBeer / su-check methods to return false."
    )

    val hideEmulator by booleanOption(
        key = "hideEmulator",
        default = true,
        title = "Hide emulator",
        description = "Force common isEmulator checks to return false."
    )

    val connectionType by stringOption(
        key = "connectionType",
        default = "default",
        values = mapOf(
            "Default (no change)" to "default",
            "Wi-Fi" to "wifi",
            "Mobile data" to "mobile",
            "Ethernet" to "ethernet",
            "No connection" to "none"
        ),
        title = "Connection type",
        description = "Best-effort force of in-app network type / connected helpers."
    )

    // ---- Root fingerprints (string-anchored) ----
    val rootFingerprints = listOf(
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("RootBeer"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isRooted"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isDeviceRooted"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("/system/bin/su"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("/system/xbin/su"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("/sbin/su"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("which su"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("magisk"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("detectRoot"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("checkRootManagementApps")))
    )

    // ---- Emulator fingerprints ----
    val emulatorFingerprints = listOf(
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isEmulator"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("goldfish"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("ranchu"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("genymotion"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("vbox86")))
    )

    // ---- Device info string getters ----
    val modelFingerprints = listOf(
        Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            filters = listOf(string("Build.MODEL"))
        ),
        Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            filters = listOf(string("ro.product.model"))
        )
    )

    val manufacturerFingerprints = listOf(
        Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            filters = listOf(string("Build.MANUFACTURER"))
        ),
        Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            filters = listOf(string("ro.product.manufacturer"))
        )
    )

    // ---- In-app network helpers (NOT framework NetworkInfo — that is not in the APK) ----
    val networkTypeFingerprints = listOf(
        Fingerprint(returnType = "I", parameters = emptyList(), filters = listOf(string("getType"))),
        Fingerprint(returnType = "I", parameters = emptyList(), filters = listOf(string("getNetworkType"))),
        Fingerprint(returnType = "I", parameters = emptyList(), filters = listOf(string("TYPE_WIFI"))),
        Fingerprint(returnType = "I", parameters = emptyList(), filters = listOf(string("NETWORK_WIFI")))
    )

    val networkConnectedFingerprints = listOf(
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isConnected"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isNetworkAvailable"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("hasInternet"))),
        Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(string("isOnline")))
    )

    execute {
        fun forceFalse(fp: Fingerprint) {
            try {
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            } catch (_: Exception) {
            }
        }

        fun forceTrue(fp: Fingerprint) {
            try {
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            } catch (_: Exception) {
            }
        }

        fun forceInt(fp: Fingerprint, value: Int) {
            try {
                val const = if (value in 0..7) "const/4 v0, $value" else "const/16 v0, $value"
                fp.method.addInstructions(
                    0,
                    """
                        $const
                        return v0
                    """
                )
            } catch (_: Exception) {
            }
        }

        fun forceString(fp: Fingerprint, value: String) {
            try {
                val safe = value.replace("\\", "\\\\").replace("\"", "")
                fp.method.addInstructions(
                    0,
                    """
                        const-string v0, "$safe"
                        return-object v0
                    """
                )
            } catch (_: Exception) {
            }
        }

        // Root
        if (hideRoot == true) {
            rootFingerprints.forEach { forceFalse(it) }
        }

        // Emulator
        if (hideEmulator == true) {
            emulatorFingerprints.forEach { forceFalse(it) }
        }

        // Model / manufacturer
        val model = deviceModel?.trim().orEmpty()
        if (model.isNotEmpty()) {
            modelFingerprints.forEach { forceString(it, model) }
        }
        val mfr = manufacturer?.trim().orEmpty()
        if (mfr.isNotEmpty()) {
            manufacturerFingerprints.forEach { forceString(it, mfr) }
        }

        // Network (app-level only)
        // Legacy ConnectivityManager types: MOBILE=0, WIFI=1, ETHERNET=9
        when (connectionType?.lowercase()) {
            "wifi" -> {
                networkTypeFingerprints.forEach { forceInt(it, 1) }
                networkConnectedFingerprints.forEach { forceTrue(it) }
            }
            "mobile" -> {
                networkTypeFingerprints.forEach { forceInt(it, 0) }
                networkConnectedFingerprints.forEach { forceTrue(it) }
            }
            "ethernet" -> {
                networkTypeFingerprints.forEach { forceInt(it, 9) }
                networkConnectedFingerprints.forEach { forceTrue(it) }
            }
            "none" -> {
                networkConnectedFingerprints.forEach { forceFalse(it) }
            }
            else -> Unit
        }
    }
}
