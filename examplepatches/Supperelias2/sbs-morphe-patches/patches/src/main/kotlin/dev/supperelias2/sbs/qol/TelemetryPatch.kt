package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private const val ANALYTICS = "Lcom/sbs/ondemand/analytics/AnalyticsManagerImpl;"
private const val ADOBE = "Lcom/sbs/ondemand/analytics/receiver/AdobeReceiver;"
private const val OZTAM = "Lcom/sbs/ondemand/analytics/receiver/OztamReceiver;"
private const val XDM = "Lcom/sbs/ondemand/analytics/model/xdm/"
private const val GENERAL_HOOKS = "Ldev/supperelias2/sbs/morphe/features/GeneralHooks;"

private data class TelemetryDispatch(
    val name: String,
    val parameters: List<String>,
    val localRegisters: Int = 1,
    val receiver: String = ADOBE
) {
    val fingerprint = Fingerprint(
        definingClass = ANALYTICS,
        name = name,
        returnType = "V",
        parameters = parameters,
        filters = listOf(methodCall(definingClass = receiver, name = name))
    )
}

// Explicitly reviewed event dispatchers in mobile 6.4.0. The generic XdmEvent
// trackPlaybackEvent/trackVideoEvent overloads already do nothing and are omitted.
private val telemetryDispatches = listOf(
    TelemetryDispatch("trackErrorEvent", listOf("${XDM}XdmEvent;", "Z")),
    TelemetryDispatch("trackFavouriteEvent", listOf("${XDM}XdmEvent;", "${XDM}XDMDevice;", "${XDM}ContentDetails;", "Z")),
    TelemetryDispatch("trackLifecycleAction", listOf("${XDM}XdmEvent;")),
    TelemetryDispatch("trackNavigationEvent", listOf(
        "Lcom/sbs/ondemand/model/fda/catalogue/Trackable;", "${XDM}XdmEvent;",
        "${XDM}SiteSubSections;", "${XDM}XdMClickSource;", "Ljava/lang/String;",
        "Ljava/lang/String;", "${XDM}XDMDevice;"
    ), localRegisters = 9),
    TelemetryDispatch("trackPauseAdInteraction", listOf(
        "${XDM}XdmEvent;", "${XDM}XDMDevice;", "Lcom/sbs/ondemand/model/playback/VideoTracking;"
    )),
    TelemetryDispatch("trackPlayFromStartEvent", listOf("${XDM}ContentDetails;", "${XDM}XDMDevice;")),
    TelemetryDispatch("trackPlaybackEvent", listOf("${XDM}PlaybackEvent;", "${XDM}XDMDevice;"), localRegisters = 3),
    TelemetryDispatch("trackQRPageViewEvent", listOf("${XDM}XdmEvent;", "${XDM}XDMDevice;")),
    TelemetryDispatch("trackUserAction", listOf("${XDM}XdmEvent;", "${XDM}XdMClickSource;", "${XDM}XDMDevice;")),
    TelemetryDispatch("trackVideoEvent", listOf("${XDM}VideoEvent;"), receiver = OZTAM),
    TelemetryDispatch("trackViewAllEvent", listOf("${XDM}XdmEvent;", "${XDM}XDMDevice;"))
)

@Suppress("unused")
val reduceTelemetryPatch = bytecodePatch(
    name = "Experimental: reduce telemetry",
    description = "Adds an off-by-default setting to suppress selected navigation, interaction and playback analytics events. SDK initialization remains enabled.",
    default = true
) {
    category("Experimental")
    compatibleWith(Compatibility(
        name = "SBS On Demand",
        packageName = "com.sbs.ondemand.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xDCBD1D,
        targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
    ))
    dependsOn(settingsPatch)

    execute {
        check(telemetryDispatches.size == 11)
        telemetryDispatches.forEach { dispatch ->
            val method = dispatch.fingerprint.method
            check(!AccessFlags.STATIC.isSet(method.accessFlags)) { "Unexpected static analytics dispatcher" }
            val implementation = method.implementation ?: error("Missing analytics dispatcher implementation")
            val parameterWords = 1 + method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
            check(implementation.registerCount - parameterWords == dispatch.localRegisters) {
                "Unexpected analytics register layout: ${dispatch.name}"
            }
            // v0 is an existing local, and is overwritten by the original first
            // const-string when the toggle is off. No parameter register moves.
            check(dispatch.localRegisters >= 1)
            val instructions = implementation.instructions.toList()
            check(instructions.first().opcode == Opcode.CONST_STRING &&
                (instructions.first() as OneRegisterInstruction).registerA == 0) {
                "Analytics dispatcher no longer initializes scratch v0: ${dispatch.name}"
            }
            val calls = instructions.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }
            check(calls.all { call ->
                when (call.definingClass) {
                    "Lkotlin/jvm/internal/Intrinsics;" -> call.name == "checkNotNullParameter"
                    ANALYTICS -> call.name == "getAdobeReceiver" || call.name == "getOztamReceiver"
                    ADOBE, OZTAM -> call.name == dispatch.name
                    "Lcom/sbs/ondemand/common/util/Logger;" -> dispatch.name == "trackPlaybackEvent" && call.name == "d"
                    "Ljava/lang/StringBuilder;" -> dispatch.name == "trackPlaybackEvent" && call.name in setOf("<init>", "append", "toString")
                    "${XDM}XdmEvent;" -> dispatch.name == "trackPlaybackEvent" && call.name == "getValue"
                    "Ljava/lang/Throwable;" -> dispatch.name == "trackPlaybackEvent" && call.name == "getMessage"
                    else -> false
                }
            }) { "Unexpected non-telemetry call in ${dispatch.name}" }
            check(instructions.none {
                val opcodeName = it.opcode.toString().uppercase()
                opcodeName.startsWith("IPUT") || opcodeName.startsWith("SPUT")
            }) { "Unexpected state mutation in ${dispatch.name}" }
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $GENERAL_HOOKS->reduceTelemetry()Z
                    move-result v0
                    if-eqz v0, :original_dispatch
                    return-void
                """,
                ExternalLabel("original_dispatch", instructions.first())
            )
        }
        registerFeature("minimal_telemetry")
    }
}
