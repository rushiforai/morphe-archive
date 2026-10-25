package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * The location check and the Wi-Fi and Bluetooth scans Messenger runs on a timer while it's open, and its reads of the
 * phone's own list of Wi-Fi networks in range.
 */
internal const val NEARBY_SCANS = "nearby_scans"

/**
 * Messenger's foreground location loop. While the app is in front it queues one task over and over that asks for a
 * location, starts a Wi-Fi scan and starts a Bluetooth scan. It keeps this name in 584.
 */
internal const val FOREGROUND_LOCATION = "Lcom/facebook/location/foreground/ForegroundLocationFrameworkController;"

/** The name the loop's scheduler gives the task it queues. The first run, every repeat and both restarts go through it. */
internal const val NEARBY_SCAN_MARK = "ForegroundLocationFrameworkController_scheduleRequestLocationWithDelay"

internal const val WIFI_MANAGER = "Landroid/net/wifi/WifiManager;"
internal const val BLE_SCANNER = "Landroid/bluetooth/le/BluetoothLeScanner;"
internal const val BLE_OPERATION = "Lcom/facebook/blescan/BleScanOperation;"

/** The system's list of Wi-Fi networks in range. Reading it starts no scan, but it's the same list a scan fills. */
internal const val SCAN_RESULTS = "getScanResults"

private val SCHEDULER_PARAMETERS = listOf("Landroid/content/Context;", FB_USER_SESSION, FOREGROUND_LOCATION, "J")

private fun nearbyScansChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the foreground location loop changed ($detail)")

/** The loop's scheduler: the controller's static (context, session, controller, delay)V that names the task it queues. */
internal fun Method.isNearbyScanScheduler() =
    definingClass == FOREGROUND_LOCATION && AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
        parameterTypes.map { it.toString() } == SCHEDULER_PARAMETERS &&
        implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == NEARBY_SCAN_MARK } == true

private fun MethodReference.readsScanResults() = definingClass == WIFI_MANAGER && name == SCAN_RESULTS

/**
 * Messenger's reader of the Wi-Fi scan results: an instance (Z)ArrayList holding the app's one getScanResults call.
 * It already answers null when Messenger isn't allowed to read the list, so null is an answer every caller has to take.
 */
internal fun Method.isScanResultReader(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Ljava/util/ArrayList;" || parameterTypes.map { it.toString() } != listOf("Z")) return false
    val code = implementation?.instructions?.toList() ?: return false
    val nulls = code.filter { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0 }
        .map { (it as OneRegisterInstruction).registerA }.toSet()
    return code.count { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.readsScanResults() == true } == 1 &&
        code.any { it.opcode == Opcode.RETURN_OBJECT && (it as OneRegisterInstruction).registerA in nulls }
}

private fun Method.calls(owner: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == owner
} == true

/**
 * The scheduler and the scan-result reader, but only while every scan Messenger can start still sits behind the
 * scheduler and every read of the results goes through the reader. The app has to hold exactly one Wi-Fi startScan,
 * in the task the scheduler queues, exactly one Bluetooth startScan, in a task of the scan operation that same queued
 * task drives, and exactly one getScanResults, in the reader. A build with a scan or a read anywhere else gets no
 * hook, so the switch never claims more than it stops.
 */
internal fun findNearbyScans(classes: Iterable<ClassDef>): List<Method> {
    val scheduler = classes.firstOrNull { it.type == FOREGROUND_LOCATION }?.methods?.singleOrNull { it.isNearbyScanScheduler() }
        ?: return emptyList()
    val wifi = mutableListOf<ClassDef>()
    val bluetooth = mutableListOf<ClassDef>()
    val readers = mutableListOf<Method>()
    for (cls in classes) for (method in cls.methods) for (instruction in method.implementation?.instructions ?: emptyList()) {
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (call.readsScanResults()) readers.add(method)
        if (call.name != "startScan") continue
        if (call.definingClass == WIFI_MANAGER) wifi.add(cls)
        if (call.definingClass == BLE_SCANNER) bluetooth.add(cls)
    }
    val loop = wifi.singleOrNull() ?: return emptyList()
    val bluetoothTask = bluetooth.singleOrNull() ?: return emptyList()
    val reader = readers.singleOrNull()?.takeIf { it.isScanResultReader() } ?: return emptyList()
    val queued = scheduler.implementation!!.instructions.any {
        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == loop.type
    }
    val drivesBluetooth = bluetoothTask.fields.any { it.type == BLE_OPERATION } && loop.methods.any { it.calls(BLE_OPERATION) }
    return if (queued && drivesBluetooth) listOf(scheduler, reader) else emptyList()
}

internal fun MutableMethod.validateNearbyScans() {
    if (!isNearbyScanScheduler() && !isScanResultReader()) nearbyScansChanged("unexpected method ${hookId()}")
    validateSwitch()
    // The check goes in front of the lock the scheduler takes and of the reader's own checks, so nothing may jump back
    // to the first instruction.
    if (0 in jumpTargets()) nearbyScansChanged("a jump back to the start of ${hookId()}")
}

/**
 * While the switch is on the scheduler returns before it queues anything, so the loop never starts and a run already
 * queued is the last. The reader answers null before it touches the Wi-Fi service, the answer it gives without the
 * location permission. Off, Pause and safe mode run Messenger's own code, and the loop starts again the next time
 * Messenger comes to the front.
 */
internal fun MutableMethod.injectNearbyScans() {
    validateNearbyScans()
    injectSwitch("$SETTINGS->stopNearbyScans()Z", "0x0")
}

/** Messenger's reads of the name and BSSID of the Wi-Fi network the phone is connected to. */
internal const val WIFI_IDENTITY = "wifi_identity"

private const val WIFI_INFO = "Landroid/net/wifi/WifiInfo;"

/** WebRTC's own network monitor picks the network a call goes over, so its read is left alone. */
private const val WEBRTC = "Lorg/webrtc/"

/** Each read and the extension call that takes its answer. */
private fun Instruction.wifiIdentityFilter(): String? {
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (call.definingClass != WIFI_INFO || call.returnType != "Ljava/lang/String;" || call.parameterTypes.isNotEmpty()) return null
    return when (call.name) {
        "getSSID" -> "$SETTINGS->wifiName(Ljava/lang/String;)Ljava/lang/String;"
        "getBSSID" -> "$SETTINGS->wifiBssid(Ljava/lang/String;)Ljava/lang/String;"
        else -> null
    }
}

/** Where this method reads the network's name or BSSID. */
private fun Method.wifiIdentityReads(): List<Int> {
    val reads = mutableListOf<Int>()
    implementation?.instructions?.forEachIndexed { index, instruction ->
        if (instruction.wifiIdentityFilter() != null) reads.add(index)
    }
    return reads
}

/** True when the very next instruction keeps the read's answer, the one place a filter can take it. */
private fun Method.keepsEveryWifiIdentityRead(): Boolean {
    val code = implementation?.instructions?.toList() ?: return false
    return wifiIdentityReads().all { code.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT }
}

/**
 * Every method outside WebRTC that reads the connected network's name or BSSID. On 583 that's six: the Wi-Fi
 * diagnostics snapshot, two network descriptions in the network manager, a per-network key (the carrier's name on mobile
 * data) and the two methods of the Wi-Fi logger that writes down the access point's hardware address. A build where any
 * read's answer isn't kept right away gets no hook at all, so the switch never claims more than it hides.
 */
internal fun findWifiIdentityReads(classes: Iterable<ClassDef>): List<Method> {
    val readers = mutableListOf<Method>()
    for (cls in classes) {
        if (cls.type.startsWith(WEBRTC)) continue
        for (method in cls.methods) {
            var reads = false
            var pending = false
            for (instruction in method.implementation?.instructions ?: continue) {
                if (pending && instruction.opcode != Opcode.MOVE_RESULT_OBJECT) return emptyList()
                pending = instruction.wifiIdentityFilter() != null
                reads = reads || pending
            }
            if (pending) return emptyList()
            if (reads) readers.add(method)
        }
    }
    return readers
}

internal fun MutableMethod.validateWifiIdentity() {
    if (definingClass.startsWith(WEBRTC)) nearbyScansChanged("WebRTC's network read in ${hookId()}")
    if (wifiIdentityReads().isEmpty()) nearbyScansChanged("no Wi-Fi network read in ${hookId()}")
    if (!keepsEveryWifiIdentityRead()) nearbyScansChanged("a Wi-Fi network read whose answer isn't kept in ${hookId()}")
}

/**
 * Hands each answer to the extension right where it's kept. With the switch on Messenger gets what Android gives an app
 * without location access: "<unknown ssid>" and 02:00:00:00:00:00. Messenger already handles those, since that's what
 * it reads on every phone where it can't see your location. The connection itself, its signal and its speed stay as
 * they are, so calls still pick their network the same way.
 */
internal fun MutableMethod.injectWifiIdentity() {
    validateWifiIdentity()
    for (read in wifiIdentityReads().asReversed()) {
        val filter = requireNotNull(getInstruction<Instruction>(read).wifiIdentityFilter())
        val held = getInstruction<OneRegisterInstruction>(read + 1).registerA
        addInstructions(read + 2, """
            invoke-static/range {v$held .. v$held}, $filter
            move-result-object v$held
        """.trimIndent())
    }
}
