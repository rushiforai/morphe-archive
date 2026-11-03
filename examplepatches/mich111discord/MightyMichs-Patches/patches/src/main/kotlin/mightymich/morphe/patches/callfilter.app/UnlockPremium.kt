package mightymich.morphe.patches.callfilter.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Call Filter local subscription flag isSubscribed to true " +
        "(SharedPreferences reads + persist on app start).",
    default = true,
) {
    compatibleWith(CallFilterCompatibility.CALLFILTER)

    execute {
        var forcedReads = 0

        val defs = try {
            classDefByStrings("isSubscribed")
        } catch (_: Exception) {
            emptyList()
        }

        for (def in defs) {
            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }

            for (method in clazz.methods) {
                if (method.implementation == null) continue
                val list = try {
                    method.instructions.toList()
                } catch (_: Exception) {
                    continue
                }

                var i = 0
                while (i < list.size) {
                    val str = (list[i] as? ReferenceInstruction)
                        ?.reference
                        ?.let { it as? StringReference }
                        ?.string

                    if (str != "isSubscribed") {
                        i++
                        continue
                    }

                    var invokeIdx = -1
                    val limit = minOf(i + 20, list.size - 1)
                    for (j in (i + 1)..limit) {
                        val ref = (list[j] as? ReferenceInstruction)?.reference as? MethodReference
                            ?: continue
                        if (ref.name == "getBoolean") {
                            invokeIdx = j
                            break
                        }
                    }

                    if (invokeIdx < 0) {
                        i++
                        continue
                    }

                    var moveIdx = -1
                    val mLimit = minOf(invokeIdx + 6, list.size - 1)
                    for (k in (invokeIdx + 1)..mLimit) {
                        if (list[k].opcode == Opcode.MOVE_RESULT) {
                            moveIdx = k
                            break
                        }
                    }

                    if (moveIdx < 0) {
                        i++
                        continue
                    }

                    val reg = (list[moveIdx] as? OneRegisterInstruction)?.registerA
                    if (reg == null) {
                        i++
                        continue
                    }

                    try {
                        method.addInstructions(
                            moveIdx + 1,
                            "const/4 v$reg, 0x1",
                        )
                        forcedReads++
                        // Re-fetch instructions after mutation
                        i = moveIdx + 2
                        // Refresh list for subsequent scans in same method
                        break
                    } catch (_: Exception) {
                        i++
                    }
                }

                // Second pass: methods may have multiple sites; re-scan fully if we patched one
                // (simple multi-pass up to 8 times)
                for (pass in 0 until 8) {
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
                            val ref = (current[j] as? ReferenceInstruction)?.reference as? MethodReference
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
                        // Skip if next insn already forces true
                        if (mv + 1 < current.size) {
                            val next = current[mv + 1]
                            if (next.opcode == Opcode.CONST_4) {
                                idx = mv + 2
                                continue
                            }
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

        // Persist: Application.onCreate
        var wroteOnCreate = false
        try {
            val onCreateFp = Fingerprint(
                definingClass = "Lcallfilter/app/CallFilterApplication;",
                name = "onCreate",
                returnType = "V",
                parameters = emptyList(),
            )
            onCreateFp.method.addInstructions(
                0,
                """
                    const-string v0, "Settings"
                    const/4 v1, 0x0
                    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                    move-result-object v0
                    if-eqz v0, :cf_skip_sub
                    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v0
                    const-string v1, "isSubscribed"
                    const/4 v2, 0x1
                    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v0
                    invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                    :cf_skip_sub
                """,
            )
            wroteOnCreate = true
        } catch (_: Exception) {
        }

        if (forcedReads == 0 && !wroteOnCreate) {
            throw PatchException(
                "Call Filter: could not force isSubscribed " +
                    "(no getBoolean sites and Application onCreate not patched).",
            )
        }
    }
}
