package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.amc.shared.Constants as Amc
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants as Cnn
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants as Hulu
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants as FoxNews
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants as MsNow
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants as NyTimes
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants as Paramount
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.primevideo.shared.Constants as PrimeVideo
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants as Wsj
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants as WashingtonPost

// ─────────────────────────────────────────────────────────────────────────────
// Report Wi-Fi connection / Hide VPN connection (both OPT-IN, default OFF).
//
// Every app call to the Android network-state APIs in REWRITES (including the
// copies inside bundled libraries such as ExoPlayer, WorkManager and the ad
// and analytics SDKs) is pointed at NetworkStateSpoofer, which answers from
// the real API and adjusts the answer for whichever patch is on. All of these
// are framework classes, so the names are the same in every app.
//
// The two named patches share the rewrite (networkStateRewritePatch) and only
// flip their own switch in the extension, so either can be used alone.
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

internal val networkStateRewritePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
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

@Suppress("unused")
val reportWifiConnectionPatch = bytecodePatch(
    name = "Report Wi-Fi connection",
    description = "Makes the app see an unmetered Wi-Fi connection when the phone is on mobile " +
        "data, so Wi-Fi-only downloads and quality limits do not apply. This can use a lot of " +
        "mobile data. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Tubi.COMPATIBILITY, Disney.COMPATIBILITY, Hulu.COMPATIBILITY, Pluto.COMPATIBILITY, Paramount.COMPATIBILITY, HboMax.COMPATIBILITY, Peacock.COMPATIBILITY, PrimeVideo.COMPATIBILITY, Mgm.COMPATIBILITY, FoxOne.COMPATIBILITY, NyTimes.COMPATIBILITY, WashingtonPost.COMPATIBILITY, Wsj.COMPATIBILITY, Amc.COMPATIBILITY, Starz.COMPATIBILITY, Pbs.COMPATIBILITY, FoxNews.COMPATIBILITY, MsNow.COMPATIBILITY, Cnn.COMPATIBILITY, Espn.COMPATIBILITY, Nfl.COMPATIBILITY, Nba.COMPATIBILITY)

    dependsOn(networkStateRewritePatch)

    extendWith("extensions/extension.mpe")

    execute {
        ReportWifiSwitchFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

@Suppress("unused")
val hideVpnConnectionPatch = bytecodePatch(
    name = "Hide VPN connection",
    description = "Hides an active VPN from the app's on-device checks, so it sees the network " +
        "the VPN runs over. The app can still tell from your IP address on its servers. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Tubi.COMPATIBILITY, Disney.COMPATIBILITY, Hulu.COMPATIBILITY, Pluto.COMPATIBILITY, Paramount.COMPATIBILITY, HboMax.COMPATIBILITY, Peacock.COMPATIBILITY, PrimeVideo.COMPATIBILITY, Mgm.COMPATIBILITY, FoxOne.COMPATIBILITY, NyTimes.COMPATIBILITY, WashingtonPost.COMPATIBILITY, Wsj.COMPATIBILITY, Amc.COMPATIBILITY, Starz.COMPATIBILITY, Pbs.COMPATIBILITY, FoxNews.COMPATIBILITY, MsNow.COMPATIBILITY, Cnn.COMPATIBILITY, Espn.COMPATIBILITY, Nfl.COMPATIBILITY, Nba.COMPATIBILITY)

    dependsOn(networkStateRewritePatch)

    extendWith("extensions/extension.mpe")

    execute {
        HideVpnSwitchFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
