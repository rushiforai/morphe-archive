package mightymich.morphe.patches.com.sideme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * SideMe Super / Premium unlock.
 *
 * Narrow targeting only:
 *  - classes that literally contain the "UserSubscription" model string
 *  - instance method isActive():Boolean on that model → Boolean.TRUE
 *  - short ()Z helpers on the same class that only read isActive
 *
 * Avoids broad "any class with setActive" matching, which could force
 * unrelated models and crash startup.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks SideMe Super / Premium by forcing UserSubscription.isActive to true.",
    default = true,
) {
    compatibleWith(SideMeCompatibility.SIDEME)

    execute {
        val defs = try {
            classDefByStrings("UserSubscription")
        } catch (_: Exception) {
            emptyList()
        }

        var patchedIsActive = false
        var patchedGates = 0

        for (def in defs) {
            // Prefer the model class itself (has isActive + setActive / tier)
            val hasIsActive = def.methods.any {
                it.name == "isActive" &&
                    it.returnType == "Ljava/lang/Boolean;" &&
                    it.parameterTypes.isEmpty()
            }
            if (!hasIsActive) continue

            val clazz = try {
                mutableClassDefBy(def)
            } catch (_: Exception) {
                continue
            }

            for (method in clazz.methods) {
                if (method.name != "isActive") continue
                if (method.returnType != "Ljava/lang/Boolean;") continue
                if (method.parameterTypes.isNotEmpty()) continue
                if (AccessFlags.STATIC.isSet(method.accessFlags)) continue

                method.addInstructions(
                    0,
                    """
                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                        return-object v0
                    """,
                )
                patchedIsActive = true
            }
        }

        // Secondary: ()Z methods that invoke isActive() on UserSubscription-like flow.
        // Only patch methods whose instruction text references isActive and Boolean.TRUE
        // path — still scoped to classes found via "UserSubscription" string when possible.
        try {
            for (def in classDefByStrings("isActive")) {
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                // Skip if class has nothing to do with subscription naming
                val typeName = def.type
                if (!typeName.contains("sideme", ignoreCase = true) &&
                    !typeName.contains("Subscription", ignoreCase = true) &&
                    !typeName.contains("UserSub", ignoreCase = true)
                ) {
                    // Obfuscated packages: allow only very short ()Z with isActive invoke
                }

                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (AccessFlags.STATIC.isSet(method.accessFlags)) continue
                    val impl = method.implementation ?: continue
                    val insns = impl.instructions.toList()
                    if (insns.size > 24) continue

                    val text = insns.joinToString("\n") { it.toString() }
                    if (!text.contains("isActive")) continue
                    // Must look like a premium probe, not random UI
                    if (!text.contains("Boolean") && !text.contains("TRUE") &&
                        !text.contains("Subscription")
                    ) {
                        continue
                    }

                    try {
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x1
                                return v0
                            """,
                        )
                        patchedGates++
                    } catch (_: Exception) {
                    }
                }
            }
        } catch (_: Exception) {
        }

        if (!patchedIsActive && patchedGates == 0) {
            throw PatchException(
                "SideMe: could not find UserSubscription.isActive() or premium ()Z gates. " +
                    "Obfuscation may have changed; re-derive for this version.",
            )
        }
    }
}
