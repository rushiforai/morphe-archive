package mightymich.morphe.patches.callfilter.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Call Filter premium unlock (1.50.2).
 *
 * Gate: SharedPreferences("Settings").getBoolean("isSubscribed", false).
 *
 * IMPORTANT: Do NOT inject putBoolean into CallFilterApplication.onCreate without
 * raising .locals. Stock onCreate only has a tiny register frame; using v2 causes
 * VerifyError: register index out of range (2 >= 2) and the app crashes on launch.
 *
 * Safe approach: after every getBoolean("isSubscribed") + move-result, force the
 * result register to true. Optionally early-return true on ()Z isSubscribed helpers.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Call Filter isSubscribed SharedPreferences reads to true " +
        "(no Application.onCreate rewrite — avoids VerifyError).",
    default = true,
) {
    compatibleWith(CallFilterCompatibility.CALLFILTER)

    execute {
        var forcedReads = 0
        var forcedMethods = 0

        val defs = try {
            classDefByStrings("isSubscribed")
        } catch (_: Exception) {
            emptyList()
        }

        for (def in defs) {
            if (AccessFlags.INTERFACE.isSet(def.accessFlags)) continue
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }

            // 1) Force getter-style ()Z methods named isSubscribed (if any)
            for (method in clazz.methods) {
                if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                if (AccessFlags.NATIVE.isSet(method.accessFlags)) continue
                if (method.returnType != "Z") continue
                if (method.parameterTypes.isNotEmpty()) continue
                if (method.name != "isSubscribed" && method.name != "getIsSubscribed") continue
                try {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """,
                    )
                    forcedMethods++
                } catch (_: Exception) {
                }
            }

            // 2) After each getBoolean("isSubscribed") + move-result → const/4 vN, 0x1
            for (method in clazz.methods) {
                if (method.implementation == null) continue
                for (pass in 0 until 16) {
                    val current = try {
                        method.instructions.toList()
                    } catch (_: Exception) {
                        break
                    }
                    var patchedThisPass = false
                    var idx = 0
                    while (idx < current.size) {
                        val s = (current[idx] as? ReferenceInstruction)
                            ?.reference
                            ?.let { it as? StringReference }
                            ?.string
                        if (s != "isSubscribed") {
                            idx++
                            continue
                        }

                        var inv = -1
                        for (j in (idx + 1) until minOf(idx + 21, current.size)) {
                            val ref =
                                (current[j] as? ReferenceInstruction)?.reference as? MethodReference
                            if (ref?.name == "getBoolean") {
                                inv = j
                                break
                            }
                        }
                        if (inv < 0) {
                            idx++
                            continue
                        }

                        var mv = -1
                        for (k in (inv + 1) until minOf(inv + 7, current.size)) {
                            if (current[k].opcode == Opcode.MOVE_RESULT) {
                                mv = k
                                break
                            }
                        }
                        if (mv < 0) {
                            idx++
                            continue
                        }

                        val reg = (current[mv] as? OneRegisterInstruction)?.registerA ?: run {
                            idx++
                            continue
                        }

                        // Already forced?
                        if (mv + 1 < current.size && current[mv + 1].opcode == Opcode.CONST_4) {
                            idx = mv + 2
                            continue
                        }

                        try {
                            method.addInstructions(mv + 1, "const/4 v$reg, 0x1")
                            forcedReads++
                            patchedThisPass = true
                            break
                        } catch (_: Exception) {
                            idx++
                        }
                    }
                    if (!patchedThisPass) break
                }
            }
        }

        // Soft success if we hit at least one site
        if (forcedReads == 0 && forcedMethods == 0) {
            throw PatchException(
                "Call Filter: no SharedPreferences.getBoolean(\"isSubscribed\") sites " +
                    "and no isSubscribed()Z helpers found.",
            )
        }
    }
}
