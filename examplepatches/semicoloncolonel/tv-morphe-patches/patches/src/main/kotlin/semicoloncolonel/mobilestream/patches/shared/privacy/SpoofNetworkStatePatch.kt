package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ─────────────────────────────────────────────────────────────────────────────
// Report Wi-Fi connection / VPN connection (options of Hide device
// identifiers, both off by default).
//
// Every app call to the Android network-state APIs in REWRITES (including the
// copies inside bundled libraries such as ExoPlayer, WorkManager and the ad
// and analytics SDKs) is pointed at NetworkStateSpoofer, which answers from
// the real API and adjusts the answer for whichever option is on. All of these
// are framework classes, so the names are the same in every app.
//
// The two options share the rewrite (rewriteNetworkState) and only flip their
// own switch in the extension, so either can be used alone.
//
// Not covered: native-code checks and server-side checks of the public IP.
// ─────────────────────────────────────────────────────────────────────────────

private const val SPOOFER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/NetworkStateSpoofer;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

private class Rewrite(
    val definingClass: String,
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
    val isStatic: Boolean = false,
)

private val REWRITES = listOf(
    Rewrite("Landroid/net/ConnectivityManager;", "isActiveNetworkMetered", listOf(), "Z"),
    Rewrite("Landroid/net/ConnectivityManager;", "getRestrictBackgroundStatus", listOf(), "I"),
    Rewrite("Landroid/net/ConnectivityManager;", "getNetworkInfo", listOf("I"), "Landroid/net/NetworkInfo;"),
    Rewrite("Landroid/net/NetworkCapabilities;", "hasTransport", listOf("I"), "Z"),
    Rewrite("Landroid/net/NetworkCapabilities;", "hasCapability", listOf("I"), "Z"),
    Rewrite("Landroid/net/NetworkInfo;", "getType", listOf(), "I"),
    Rewrite("Landroid/net/NetworkInfo;", "getTypeName", listOf(), "Ljava/lang/String;"),
    Rewrite("Landroid/net/NetworkInfo;", "getSubtype", listOf(), "I"),
    Rewrite("Landroid/net/NetworkInfo;", "getSubtypeName", listOf(), "Ljava/lang/String;"),
    Rewrite("Landroid/net/NetworkInfo;", "getExtraInfo", listOf(), "Ljava/lang/String;"),
    Rewrite("Landroid/net/LinkProperties;", "getInterfaceName", listOf(), "Ljava/lang/String;"),
    Rewrite("Ljava/net/NetworkInterface;", "getNetworkInterfaces", listOf(), "Ljava/util/Enumeration;", isStatic = true),
    Rewrite("Ljava/net/NetworkInterface;", "getByName", listOf("Ljava/lang/String;"), "Ljava/net/NetworkInterface;", isStatic = true),
    Rewrite("Landroid/app/job/JobInfo\$Builder;", "setRequiredNetworkType", listOf("I"), "Landroid/app/job/JobInfo\$Builder;"),
    Rewrite("Landroid/net/NetworkRequest\$Builder;", "addCapability", listOf("I"), "Landroid/net/NetworkRequest\$Builder;"),
    Rewrite("Landroid/net/NetworkRequest\$Builder;", "addTransportType", listOf("I"), "Landroid/net/NetworkRequest\$Builder;"),
    Rewrite("Landroid/app/DownloadManager\$Request;", "setAllowedNetworkTypes", listOf("I"), "Landroid/app/DownloadManager\$Request;"),
    Rewrite("Landroid/app/DownloadManager\$Request;", "setAllowedOverMetered", listOf("Z"), "Landroid/app/DownloadManager\$Request;"),
)

private fun Instruction.rewriteFor(): Rewrite? {
    val virtual = opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE
    val static = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE
    if (!virtual && !static) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    return REWRITES.firstOrNull {
        it.isStatic == static &&
            it.definingClass == reference.definingClass &&
            it.name == reference.name &&
            it.returnType == reference.returnType &&
            it.parameterTypes == reference.parameterTypes.map { type -> type.toString() }
    }
}

// The receiver becomes the first parameter, so the register list is unchanged.
private fun Rewrite.replacement(): String {
    val parameters = (if (isStatic) parameterTypes else listOf(definingClass) + parameterTypes).joinToString("")
    return "$SPOOFER->$name($parameters)$returnType"
}

internal fun BytecodePatchContext.rewriteNetworkState() {
    // Collect first, mutate after: mutableClassDefBy swaps the class map
    // entry, which must not happen mid-iteration.
    val targets = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.rewriteFor() != null } == true
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
                val rewrite = instruction.rewriteFor() ?: return@forEachIndexed
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

internal object ReportWifiSwitchFingerprint : Fingerprint(
    definingClass = SPOOFER,
    name = "reportWifi",
    parameters = listOf(),
    returnType = "Z",
)

internal object HideVpnSwitchFingerprint : Fingerprint(
    definingClass = SPOOFER,
    name = "hideVpn",
    parameters = listOf(),
    returnType = "Z",
)

internal fun BytecodePatchContext.reportWifi() =
    ReportWifiSwitchFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

internal fun BytecodePatchContext.hideVpn() =
    HideVpnSwitchFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
