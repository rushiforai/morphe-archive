package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Mereframe 0.8.4 introduced a Pro tier; entitlement resolution happens in
 * exactly one function of the vendored licensing SDK:
 *
 *   Lnv;->e(Landroid/content/Context;LSv;Ljava/util/List;)Ljava/util/Set;
 *
 * It iterates the feature registry (the p2 List, all pluggable features with
 * a feature key Ru.a and a default-availability flag Ru.a()Z) and only adds a
 * feature to the enabled set when the *owned-id list* (Sv.a()) CONTAINS the
 * key. All feature consumers (Il, ns) read the set produced here; drop the
 * contains-guard and every registered feature resolves enabled - no web call,
 * no account, no Play Billing interaction needed.
 *
 * The edit is surgical and label-free: the `if-eqz` that skips unowned
 * features (directly after Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
 * + move-result) is replaced by `nop`, so the skip path disappears while the
 * vendor's own per-feature availability flag (Ru.a()Z) stays respected. No new
 * instructions, no registers re-purposed, layout verified against 0.8.4
 * (vc 118) with asserted opcode flow (invoke -> move-result -> if-eqz).
 *
 * Pair with "Allow re-signed/sideloaded installs": the stock APK checks the
 * installer signature; without that patch the app refuses to start at all.
 * Fail-closed on structure: any drift makes the patch throw instead of
 * silently half-patching.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro features",
    description = "Includes every registered feature in the resolved feature set by dropping the " +
        "ownership check at the entitlement resolver (nv.e). LOCAL client-side effect only. " +
        "WARNING (kept off by default): on at least one device (realme/Android 16) enabling the " +
        "single registered Pro feature crashes capture - the Pro pipeline path is gated by this " +
        "flag and we cannot verify its safety side. Enable only if you specifically want the Pro " +
        "toolset; the app works fully (RAW capture incl.) with just 'Allow re-signed installs'.",
    default = false,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

    execute {
        val method = Fingerprint(
            definingClass = "Lnv;",
            name = "e",
            returnType = "Ljava/util/Set;",
            parameters = listOf("Landroid/content/Context;", "LSv;", "Ljava/util/List;"),
        ).method

        method.apply {
            val instructions = implementation!!.instructions
            val containsIdx = instructions.indexOfFirst { ins ->
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    (ins as? ReferenceInstruction)?.reference?.toString()
                        ?.contains("->contains(Ljava/lang/Object;)Z") == true
            }
            require(containsIdx >= 0) { "nv.e: ArrayList.contains not found" }
            // Layout after the call: move-result (containsIdx+1) -> if-eqz (containsIdx+2).
            val ifIdx = containsIdx + 2
            require(instructions.elementAt(containsIdx + 1).opcode == Opcode.MOVE_RESULT &&
                instructions.elementAt(ifIdx).opcode == Opcode.IF_EQZ) {
                "nv.e: unexpected layout after contains()"
            }
            replaceInstruction(ifIdx, "nop")
        }
    }
}
