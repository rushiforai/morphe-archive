// New patch (not ported) — written for this repo, 2026-10-07.
// Design input: research/notes/02_rks_global.md + research/notes/01_mintsifry_metodichka.md
// (the Mintsifry methodology's client-side detection checklist includes enumerating
// installed VPN client apps, separately from the TRANSPORT_VPN/NetworkCapabilities check
// that app/privacy/patches/vpn/SpoofVpnStatusPatch.kt already covers). Closes a gap
// explicitly named in research/vpn_detection_analysis.md section 4: existing ported
// patches (xob0t, Jl4cTuk) only spoof the OS "is a VPN currently active" signal, not
// this separate "which VPN apps are installed" signal.
package app.privacy.patches.vpn

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.shared.*
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val VPN_SERVICE_ACTION = "android.net.VpnService"

/**
 * Every Android app implementing a VPN client must declare, in its manifest, a
 * `<service>` with an `<intent-filter>` for the action `android.net.VpnService`
 * (this is required by the Android VpnService API itself, not an app-specific
 * convention — see developer.android.com/reference/android/net/VpnService). An app
 * that wants to know "which VPN apps are installed" resolves an `Intent(action =
 * android.net.VpnService)` against the PackageManager — `queryIntentServices` for the
 * services themselves, or `queryIntentActivities` if it resolves the VPN app's launcher
 * activity instead. Either way, the literal string `"android.net.VpnService"` has to be
 * present nearby, which is what this patch keys off (same structural heuristic style as
 * SpoofVpnStatusPatch's hasVpnTransportLiteralBefore: look back from the call site for
 * the gating literal/string within a bounded window, rather than hardcoding one app's
 * class names).
 */
private fun MethodReference.isQueryIntentServices() = definingClass == PACKAGE_MANAGER &&
    name == "queryIntentServices" &&
    returnType == "Ljava/util/List;"

private fun MethodReference.isQueryIntentActivities() = definingClass == PACKAGE_MANAGER &&
    name == "queryIntentActivities" &&
    returnType == "Ljava/util/List;"

private fun List<Instruction>.hasVpnServiceActionStringBefore(index: Int): Boolean {
    for (candidateIndex in index - 1 downTo maxOf(0, index - 12)) {
        if (this[candidateIndex].stringReferenceOrNull() == VPN_SERVICE_ACTION) return true
    }
    return false
}

private fun Method.hasVpnAppQueryTarget(): Boolean {
    val instructions = instructionsOrNull?.toList() ?: return false
    return instructions.withIndex().any { (index, instruction) ->
        val reference = instruction.methodReferenceOrNull() ?: return@any false
        (reference.isQueryIntentServices() || reference.isQueryIntentActivities()) &&
            instructions.hasVpnServiceActionStringBefore(index)
    }
}

@Suppress("unused")
val spoofInstalledVpnAppsPatch = bytecodePatch(
    name = "Spoof installed VPN apps list",
    description = "Makes PackageManager queries for installed VpnService-implementing apps " +
        "(the android.net.VpnService intent action) return an empty list, hiding which VPN " +
        "client apps are installed without affecting any other PackageManager query.",
    default = false,
) {
    execute {
        var patchedQueries = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { it.hasVpnAppQueryTarget() }) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (!method.hasVpnAppQueryTarget()) return@forEach

                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = instruction.methodReferenceOrNull() ?: return@forEachIndexed
                    if (
                        (reference.isQueryIntentServices() || reference.isQueryIntentActivities()) &&
                        instructions.hasVpnServiceActionStringBefore(index)
                    ) {
                        method.replaceInstruction(
                            index,
                            "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;",
                        )
                        patchedQueries++
                    }
                }
            }
        }

        if (patchedQueries == 0) {
            println("Spoof installed VPN apps list: no local VpnService query sites were found.")
            return@execute
        }

        println("Spoof installed VPN apps list: patched $patchedQueries PackageManager queries.")
    }
}
