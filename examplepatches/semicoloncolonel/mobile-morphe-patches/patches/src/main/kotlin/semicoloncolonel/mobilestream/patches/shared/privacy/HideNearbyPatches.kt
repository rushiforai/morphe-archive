package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.shared.SHOPPING_APPS

// ─────────────────────────────────────────────────────────────────────────────
// Hide Wi-Fi networks / Block Bluetooth scanning / Hide cell tower info /
// Block background location (all OPT-IN, default OFF, shopping apps only).
//
// Retail apps tell that you are inside a store from nearby radio signals as
// well as GPS: Walmart matches its store Wi-Fi in scans, Target, Home Depot
// and CVS range in-store Bluetooth beacons, and fraud SDKs collect nearby
// networks and cell towers as a device fingerprint. Each patch takes away one
// of those signals and can be used alone.
//
// The first three rewrite every app call to the framework methods in their
// list (bundled SDKs included) into NearbyHider, the same way the network-
// state patches do. Block background location removes the permission from the
// manifest, so Android and Play Services refuse background location and
// geofences themselves.
//
// Not covered: native code, and the IP address that a store's Wi-Fi gives
// the retailer's servers.
// ─────────────────────────────────────────────────────────────────────────────

private const val HIDER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/NearbyHider;"
private const val SPOOFER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/NetworkStateSpoofer;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

internal class CallRewrite(
    val definingClass: String,
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
    val isStatic: Boolean = false,
) {
    fun matches(reference: MethodReference, static: Boolean) =
        isStatic == static &&
            definingClass == reference.definingClass &&
            name == reference.name &&
            returnType == reference.returnType &&
            parameterTypes == reference.parameterTypes.map { it.toString() }

    // The receiver becomes the first parameter, so the register list is unchanged.
    fun replacement(): String {
        val parameters = (if (isStatic) parameterTypes else listOf(definingClass) + parameterTypes).joinToString("")
        return "$HIDER->$name($parameters)$returnType"
    }
}

private const val WIFI_MANAGER = "Landroid/net/wifi/WifiManager;"
private const val WIFI_INFO = "Landroid/net/wifi/WifiInfo;"
private const val LE_SCANNER = "Landroid/bluetooth/le/BluetoothLeScanner;"
private const val ADAPTER = "Landroid/bluetooth/BluetoothAdapter;"
private const val TELEPHONY = "Landroid/telephony/TelephonyManager;"

internal val WIFI_REWRITES = listOf(
    CallRewrite(WIFI_MANAGER, "getScanResults", listOf(), "Ljava/util/List;"),
    CallRewrite(WIFI_MANAGER, "startScan", listOf(), "Z"),
    CallRewrite(WIFI_MANAGER, "getConfiguredNetworks", listOf(), "Ljava/util/List;"),
    CallRewrite(WIFI_INFO, "getSSID", listOf(), "Ljava/lang/String;"),
    CallRewrite(WIFI_INFO, "getBSSID", listOf(), "Ljava/lang/String;"),
    CallRewrite(WIFI_INFO, "getMacAddress", listOf(), "Ljava/lang/String;"),
    CallRewrite(WIFI_INFO, "getNetworkId", listOf(), "I"),
    CallRewrite("Landroid/net/NetworkInfo;", "getExtraInfo", listOf(), "Ljava/lang/String;"),
    // The same call after "Report Wi-Fi connection" rewrote it.
    CallRewrite(SPOOFER, "getExtraInfo", listOf("Landroid/net/NetworkInfo;"), "Ljava/lang/String;", isStatic = true),
)

internal val BLUETOOTH_REWRITES = listOf(
    CallRewrite(LE_SCANNER, "startScan", listOf("Landroid/bluetooth/le/ScanCallback;"), "V"),
    CallRewrite(
        LE_SCANNER, "startScan",
        listOf("Ljava/util/List;", "Landroid/bluetooth/le/ScanSettings;", "Landroid/bluetooth/le/ScanCallback;"), "V",
    ),
    CallRewrite(
        LE_SCANNER, "startScan",
        listOf("Ljava/util/List;", "Landroid/bluetooth/le/ScanSettings;", "Landroid/app/PendingIntent;"), "I",
    ),
    CallRewrite(ADAPTER, "startLeScan", listOf("Landroid/bluetooth/BluetoothAdapter\$LeScanCallback;"), "Z"),
    CallRewrite(
        ADAPTER, "startLeScan",
        listOf("[Ljava/util/UUID;", "Landroid/bluetooth/BluetoothAdapter\$LeScanCallback;"), "Z",
    ),
    CallRewrite(ADAPTER, "startDiscovery", listOf(), "Z"),
    CallRewrite(ADAPTER, "getBondedDevices", listOf(), "Ljava/util/Set;"),
)

private val CELL_REWRITES = listOf(
    CallRewrite(TELEPHONY, "getAllCellInfo", listOf(), "Ljava/util/List;"),
    CallRewrite(TELEPHONY, "getCellLocation", listOf(), "Landroid/telephony/CellLocation;"),
    CallRewrite(TELEPHONY, "getNeighboringCellInfo", listOf(), "Ljava/util/List;"),
    CallRewrite(
        TELEPHONY, "requestCellInfoUpdate",
        listOf("Ljava/util/concurrent/Executor;", "Landroid/telephony/TelephonyManager\$CellInfoCallback;"), "V",
    ),
    CallRewrite(TELEPHONY, "listen", listOf("Landroid/telephony/PhoneStateListener;", "I"), "V"),
)

private fun Instruction.callRewrite(rewrites: List<CallRewrite>): CallRewrite? {
    val virtual = opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE
    val static = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE
    if (!virtual && !static) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    return rewrites.firstOrNull { it.matches(reference, static) }
}

internal fun BytecodePatchContext.rewriteCalls(rewrites: List<CallRewrite>) {
    // Collect first, mutate after: mutableClassDefBy swaps the class map
    // entry, which must not happen mid-iteration.
    val targets = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.callRewrite(rewrites) != null } == true
            }
        ) {
            targets += classDef.type
        }
    }

    targets.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            // Snapshot: replaceInstruction mutates the live list.
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                val rewrite = instruction.callRewrite(rewrites) ?: return@forEachIndexed
                val smali = when (instruction) {
                    is FiveRegisterInstruction -> {
                        val registers = listOf(
                            instruction.registerC, instruction.registerD, instruction.registerE,
                            instruction.registerF, instruction.registerG,
                        ).take(instruction.registerCount)
                        "invoke-static {${registers.joinToString { "v$it" }}}, ${rewrite.replacement()}"
                    }
                    is RegisterRangeInstruction -> {
                        val last = instruction.startRegister + instruction.registerCount - 1
                        "invoke-static/range { v${instruction.startRegister} .. v$last }, ${rewrite.replacement()}"
                    }
                    else -> return@forEachIndexed
                }
                method.replaceInstruction(index, smali)
            }
        }
    }
}

@Suppress("unused")
val hideWifiNetworksPatch = bytecodePatch(
    name = "Hide Wi-Fi networks",
    description = "Hides nearby Wi-Fi networks and the name of the network you are on from the " +
        "app, so it cannot tell which store's Wi-Fi is around you. May affect: store detection " +
        "and store mode, Wi-Fi setup for smart-home devices (Amazon), and fraud checks at " +
        "checkout, which can then ask for extra verification. Opt-in / experimental; test " +
        "on-device.",
    default = false,
) {
    compatibleWith(*SHOPPING_APPS)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(WIFI_REWRITES) }
}

// AltBeacon's StartupBroadcastReceiver starts the app on boot and whenever the
// phone is plugged in, so it can resume beacon scanning in the background. Its
// intent filters are removed. The receiver stays declared, since the library
// may refer to it by name.
private const val BEACON_STARTUP_RECEIVER = "org.altbeacon.beacon.startup.StartupBroadcastReceiver"

internal val beaconWakeupPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val receivers = document.getElementsByTagName("receiver")
            for (i in 0 until receivers.length) {
                val receiver = receivers.item(i) as? Element ?: continue
                if (receiver.getAttribute("android:name") != BEACON_STARTUP_RECEIVER) continue
                val filters = receiver.getElementsByTagName("intent-filter")
                // Snapshot: the NodeList is live.
                (0 until filters.length).map { filters.item(it) }.forEach { receiver.removeChild(it) }
            }
        }
    }
}

@Suppress("unused")
val blockBluetoothScanningPatch = bytecodePatch(
    name = "Block Bluetooth scanning",
    description = "Stops the app from scanning for Bluetooth devices and in-store beacons, and " +
        "hides your paired devices. Beacon libraries no longer wake the app when the phone " +
        "starts or charges. May affect: in-store maps and their location dot (Target, The Home " +
        "Depot), pharmacy kiosk check-in (CVS), smart-home device setup (Amazon), and pairing " +
        "with Bluetooth accessories inside the app. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(*SHOPPING_APPS)

    dependsOn(beaconWakeupPatch)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(BLUETOOTH_REWRITES) }
}

@Suppress("unused")
val hideCellTowerInfoPatch = bytecodePatch(
    name = "Hide cell tower info",
    description = "Hides the cell towers your phone sees from the app, which can place you " +
        "within a few blocks even without location access. Use Spoof carrier to hide the " +
        "carrier itself. Few app features rely on this. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(*SHOPPING_APPS)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(CELL_REWRITES) }
}

private const val BACKGROUND_LOCATION = "android.permission.ACCESS_BACKGROUND_LOCATION"

@Suppress("unused")
val blockBackgroundLocationPatch = resourcePatch(
    name = "Block background location",
    description = "Removes the app's ability to ask for location while it is closed or in the " +
        "background, so it cannot notice you arriving at a store, even if you tap Allow all " +
        "the time. Location while you use the app still works if you allow it. May affect: " +
        "automatic store mode, store-arrival notifications, and pickup check-in that tracks " +
        "your drive after you close the app. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(*SHOPPING_APPS)

    execute { removeBackgroundLocation() }
}

internal fun ResourcePatchContext.removeBackgroundLocation() {
    document("AndroidManifest.xml").use { document ->
        val manifest = document.getElementsByTagName("manifest").item(0) as Element
        listOf("uses-permission", "uses-permission-sdk-23").forEach { tag ->
            val permissions = document.getElementsByTagName(tag)
            (0 until permissions.length)
                .map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") == BACKGROUND_LOCATION }
                .forEach { manifest.removeChild(it) }
        }
    }
}
