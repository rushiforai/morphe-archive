/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.ninjavpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PREMIUM_MODE = "Lapp/ninjavpn/android/app/revenue/subscription/Premium\$Mode;"
private const val H_CLASS = "Lapp/ninjavpn/android/app/h;"
private const val R_FIELD = "r"

// The two server/callback writers of h.r. Dashboard already writes PREMIUM -> not listed.
private val WRITER_CLASSES = listOf("Los0;", "Lat0;")

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Ninja VPN's premium mode state to PREMIUM at every server/cache write site. only some servers work (defaults to US if it doesn't).",
) {
    compatibleWith(
        Compatibility(
            name = "Ninja VPN",
            packageName = "app.ninjavpn.android",
            targets = listOf(
                AppTarget(version = "1.4.13", versionCode = 50),
            ),
        ),
    )

    execute {
        var patched = 0
        for (cls in WRITER_CLASSES) {
            val classDef = mutableClassDefByOrNull(cls)
                ?: throw PatchException("NinjaVPN: writer class $cls not found (version drift?)")
            val sites = mutableListOf<Pair<MutableMethod, Int>>()
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                impl.instructions.forEachIndexed { i, insn ->
                    if (insn.opcode != Opcode.IPUT_OBJECT) return@forEachIndexed
                    val ref = insn.getReference<FieldReference>() ?: return@forEachIndexed
                    if (ref.definingClass == H_CLASS && ref.name == R_FIELD) sites.add(method to i)
                }
            }
            if (sites.isEmpty()) throw PatchException("NinjaVPN: no h.r write in $cls (version drift?)")
            for ((method, idx) in sites.sortedByDescending { it.second }) {
                val src = (method.getInstruction(idx) as TwoRegisterInstruction).registerA
                method.addInstruction(idx, "sget-object v$src, $PREMIUM_MODE->PREMIUM:$PREMIUM_MODE")
                patched++
            }
        }
        if (patched != WRITER_CLASSES.size) {
            throw PatchException("NinjaVPN: patched $patched, expected ${WRITER_CLASSES.size}")
        }
    }
}
