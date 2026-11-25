package app.stayfree.patches.sync

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val LOCAL_SYNC = "Lapp/template/extension/stayfree/LocalSync;"
private const val APPLICATION_CLASS = "Lcom/burockgames/timeclocker/StayFreeMobileApplication;"

@Suppress("unused")
val localDeviceSyncPatch = bytecodePatch(
    name = "Local device sync",
    description = "Pairs the phone with the StayFree browser extension over your local network " +
        "without data collection. The app runs a small sync server on port 8787 and serves its " +
        "usage straight from Android, so nothing goes to StayFree/SensorTower. Removes the " +
        "\"Anonymous data collection must be enabled to pair devices\" prompt. Needs the patched " +
        "browser extension.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    execute {
        // Start the server first thing in Application.onCreate(). It is declared on the
        // (obfuscated) base class of StayFreeMobileApplication in 20.14.1, so walk up the chain.
        var type: String? = APPLICATION_CLASS
        var onCreate: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod? = null
        while (type != null && type != "Landroid/app/Application;" && onCreate == null) {
            val classDef = mutableClassDefBy(type)
            onCreate = classDef.methods.firstOrNull {
                it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            type = classDef.superclass
        }
        (onCreate ?: throw PatchException("Application.onCreate not found")).addInstructions(
            0,
            "invoke-static {p0}, $LOCAL_SYNC->start(Landroid/content/Context;)V",
        )

        // Point every api.stayfreeapps.com Retrofit service at the local server. It answers the
        // sync API itself, proxies read-only lookups and drops all data-collection uploads.
        RetrofitBaseUrlFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, $LOCAL_SYNC->rewriteBaseUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )

        // The pairing gates read the SensorTower opt-out flag, which "Disable All Telemetry"
        // forces on. Pairing no longer involves SensorTower, so bypass the gates without
        // touching the flag itself (it still blocks the usage SDK upload).
        val gates = PairDeviceDataCollectionGateFingerprint.matchAllOrNull()
            ?: throw PatchException("Pairing data-collection gates not found")
        gates.forEach { match ->
            val method = match.method

            // Settings > Paired Devices warning text: a standalone composable called inside its
            // own replace group, so returning before it emits anything keeps Compose balanced.
            if (AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypes.size == 2
            ) {
                method.addInstructions(0, "return-void")
                return@forEach
            }

            // Navigator / QR deep-link: the dialog branch is the nearest `if-eqz` before the
            // string load, testing the boolean just produced by `move-result` (opted out &&
            // destination == pair-with-code in hr0, opted out in wy4). Force it to false.
            val instructions = method.implementation!!.instructions.toList()
            val stringIndex = match.instructionMatches.first().index
            val ifIndex = (stringIndex - 1 downTo 0).firstOrNull {
                instructions[it].opcode == Opcode.IF_EQZ
            } ?: throw PatchException("Pairing gate branch not found in ${method.definingClass}")
            val register = (instructions[ifIndex] as OneRegisterInstruction).registerA
            val previous = instructions[ifIndex - 1]
            if (previous.opcode != Opcode.MOVE_RESULT ||
                (previous as OneRegisterInstruction).registerA != register
            ) {
                throw PatchException("Unexpected pairing gate shape in ${method.definingClass}")
            }

            val const = if (register < 16) "const/4" else "const/16"
            method.addInstructions(ifIndex, "$const v$register, 0x0")
        }
    }
}
