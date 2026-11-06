// New patch (not ported) — written for this repo, 2026-10-07.
// Design input: research/vpn_detection_analysis.md section 2.3 ("Телеметрия: VPN-статус
// как поле события") — RKS Global's report shows the VPN boolean is not just checked,
// it is written into analytics events under keys like setVpn/is_vpn_on/is_vpn/
// vpn_enabled/isVpnConnected (confirmed per-app: Sberbank clickstream, VTB, VK Music,
// Yandex Browser, T-Bank fingerprint). This is deliberately a SEPARATE patch from
// SpoofVpnStatusPatch: that patch spoofs the *source* (the OS API call), but an app may
// cache the real VPN boolean in a local variable *before* the point SpoofVpnStatusPatch
// intercepts it (e.g. read once at startup, reused across many later analytics events),
// so patching only the source is not always sufficient — this patch is defense-in-depth
// at the *sink* (the value actually being reported), independent of how the app obtained
// the boolean in the first place.
//
// Scope and honesty about risk: this only handles the common Kotlin/Java codegen shape
// where a boolean destined for a `Map<String, Any>`/JSONObject-style event payload gets
// boxed via `Boolean.valueOf(Z)` shortly after the literal key string appears (e.g.
// `mapOf("is_vpn" to isVpnActive)` or `json.put("vpn", flag)` compile to this shape).
// It deliberately does NOT attempt to match direct typed setters (`setVpn(Z)`,
// `setIsVpnOn(Z)`) by method name — a bare name match like that is too easy to collide
// with an unrelated method in a large obfuscated codebase without verifying against a
// real decompile first (see apps/ru.oneme.app/analysis/decompile_log.md's false-positive
// lessons: "RASP" matched a resource color name once). Default-off pending that
// per-app verification; SpoofVpnStatusPatch (API-level, default-on) remains the primary
// defense.
package app.privacy.patches.vpn

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.shared.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BOOLEAN = "Ljava/lang/Boolean;"

// Boolean.valueOf(Z) is invoke-static with a single argument register, which can be
// encoded as either a 3-register-format instruction or (rarely) a register-range form -
// same dual-shape handling as SpoofVpnStatusPatch.kt's own `registers()` helper.
private fun Instruction.soleArgumentRegister(): Int? = when (this) {
    is FiveRegisterInstruction -> if (registerCount == 1) registerC else null
    is RegisterRangeInstruction -> if (registerCount == 1) startRegister else null
    else -> null
}

// Only overwrite an instruction that actually WRITES the register (a const/move/get of
// some kind) - never a bare one-register instruction like `if-eqz vN` or `return vN`,
// which would corrupt control flow if blindly replaced with a const. Same opcode set as
// SpoofVpnStatusPatch.kt's own `writesRegister()` helper, restricted to the boolean-
// producing subset relevant here.
private fun Instruction.writesBooleanLikeRegister(register: Int): Boolean {
    if (this !is OneRegisterInstruction || registerA != register) return false

    return when (opcode) {
        Opcode.CONST_4,
        Opcode.CONST_16,
        Opcode.CONST,
        Opcode.MOVE,
        Opcode.MOVE_FROM16,
        Opcode.MOVE_16,
        Opcode.MOVE_RESULT,
        Opcode.SGET_BOOLEAN,
        Opcode.IGET_BOOLEAN,
        -> true

        else -> false
    }
}

private val VPN_TELEMETRY_KEYS = setOf(
    "vpn",
    "is_vpn",
    "is_vpn_on",
    "isvpnconnected",
    "vpn_enabled",
    "vpn_connected",
    "setvpn",
)

private fun MethodReference.isBooleanValueOf() = definingClass == BOOLEAN &&
    name == "valueOf" &&
    parameterTypes.singleOrNull()?.toString() == "Z" &&
    returnType == BOOLEAN

private fun List<Instruction>.hasVpnTelemetryKeyBefore(index: Int): Boolean {
    for (candidateIndex in index - 1 downTo maxOf(0, index - 6)) {
        val string = this[candidateIndex].stringReferenceOrNull()?.lowercase() ?: continue
        if (string in VPN_TELEMETRY_KEYS) return true
    }
    return false
}

private fun Method.hasVpnTelemetryBoxingTarget(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false
    return instructions.withIndex().any { (index, instruction) ->
        val reference = instruction.methodReferenceOrNull() ?: return@any false
        reference.isBooleanValueOf() && instructions.hasVpnTelemetryKeyBefore(index)
    }
}

@Suppress("unused")
val spoofVpnTelemetryFieldPatch = bytecodePatch(
    name = "Spoof VPN telemetry field",
    description = "Forces boolean values boxed right after a VPN-flag telemetry key " +
        "(vpn, is_vpn, is_vpn_on, isVpnConnected, vpn_enabled, vpn_connected) to false, " +
        "as defense-in-depth alongside Spoof VPN status for apps that cache the VPN " +
        "flag before reporting it. Default-off: verify against a real decompile of the " +
        "target app first (see provenance comment).",
    default = false,
) {
    execute {
        var patchedFields = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasVpnTelemetryBoxingTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasVpnTelemetryBoxingTarget()) return@forEach

                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull() ?: return@forEachIndexed
                    if (!reference.isBooleanValueOf() || !instructions.hasVpnTelemetryKeyBefore(index)) {
                        return@forEachIndexed
                    }

                    val argumentRegister = instruction.soleArgumentRegister() ?: return@forEachIndexed

                    // The boolean argument to Boolean.valueOf(Z) is already loaded into
                    // its register by an earlier const/4 (0x0 or 0x1); overriding that
                    // load - not this invoke - is what actually changes the value, so we
                    // walk back to find and rewrite it instead of touching the call site.
                    for (priorIndex in index - 1 downTo maxOf(0, index - 4)) {
                        if (instructions[priorIndex].writesBooleanLikeRegister(argumentRegister)) {
                            method.replaceInstruction(priorIndex, "const/4 v$argumentRegister, 0x0")
                            patchedFields++
                            break
                        }
                    }
                }
            }
        }

        if (patchedFields == 0) {
            println("Spoof VPN telemetry field: no local VPN telemetry boxing sites were found.")
            return@execute
        }

        println("Spoof VPN telemetry field: patched $patchedFields boolean values.")
    }
}
