/*
 * Meta Patches — Unlock developer options.
 *
 * Ported from InstaFL patcher-core "Unlock Developer Options"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getMutableMethod
import app.morphe.patcher.util.returnLate
import app.hemk651.patches.shared.MetaCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val USER_SESSION_TYPE = "Lcom/instagram/common/session/UserSession;"

/**
 * The obfuscated gate method InstaFL looks for: `A00(UserSession)Z`.
 *
 * The gate reads a MobileConfig boolean (`LX/02wa;->A00` on inspected
 * builds, id `0x81007600000105L`) and returns it; it controls the
 * shake-gesture entry to the developer options.
 */
private const val GATE_CALLEE_NAME = "A00"
private const val GATE_CLASS_PREFIX = "LX/"

/** The extension class that installs the MobileConfig overrides file. */
private const val MC_OVERRIDES_CLASS = "Lapp/hemk651/meta/extension/MCOverrides;"

@Suppress("unused")
val unlockDeveloperOptionsPatch = patch(
    name = "Unlock developer options",
    description = "Unlocks the developer options: writes the MobileConfig overrides " +
            "file that reveals Developer options in the settings together with a " +
            "dedicated Employee options entry, and forces the employee options gate " +
            "to true (shake-gesture entry). The overrides file becomes active after " +
            "an app restart.",
    default = true
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    // The extension classes are needed at runtime for the overrides file
    // installation, independent of the optional "Add Mods menu" patch.
    extendWith("extensions/extension.mpe")

    execute {
        installMcOverridesInstaller()
        unlockDeveloperGate()
    }
}

/**
 * Installs the runtime hook that writes `<filesDir>/mobileconfig/mc_overrides.json`.
 *
 * The curated payload (`config/mc_overrides.json`, embedded into the extension
 * at build time) is what reveals the Settings-level Developer options and the
 * dedicated Employee options entry; the bytecode gate below only unlocks the
 * shake-gesture entry.
 *
 * Like the "Add Mods menu" patch, the hook is injected right after the
 * `Application.onCreate` super call of the app shell, re-using the super
 * call's own register (the Application is a Context).
 */
private fun installMcOverridesInstaller() {
    val appShellMatch = InstagramAppShellOnCreateFingerprint.matchOrNull()
        ?: throw PatchException("InstagramAppShell.onCreate did not match")

    val method = appShellMatch.method
    val alreadyInjected = method.instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is MethodReference && reference.definingClass == MC_OVERRIDES_CLASS
    }
    if (alreadyInjected) {
        return
    }

    val superCallIndex = appShellMatch.instructionMatches.first().index
    val superCall = method.getInstruction<Instruction>(superCallIndex)
    val contextRegister = when (superCall) {
        // `invoke-super {v0}` uses the 35c format with the registers in fixed
        // slots; range invokes use 3rc.
        is FiveRegisterInstruction -> superCall.registerC
        is RegisterRangeInstruction -> superCall.startRegister
        else -> throw PatchException(
            "Unexpected invoke format of Application.onCreate: ${superCall.opcode}"
        )
    }

    val invocation = if (contextRegister < 16) {
        "invoke-static {v$contextRegister}, $MC_OVERRIDES_CLASS->install(Landroid/content/Context;)V"
    } else {
        "invoke-static/range {v$contextRegister}, $MC_OVERRIDES_CLASS->install(Landroid/content/Context;)V"
    }
    method.addInstruction(superCallIndex + 1, invocation)
}

/**
 * Forces the employee options gate (`A00(UserSession)Z`) to return true.
 *
 * Port of the InstaFL algorithm:
 *
 *  1. Walk the fallback chain of stable, non-obfuscated reference classes.
 *  2. In each class, look for `invoke-static` call sites that call the
 *     `A00` method of an `LX/`-obfuscated class with the shape
 *     `A00(UserSession)Z` (the strict `->A00(` + `UserSession` + `)Z` shape).
 *  3. Validate each candidate by checking that the referenced gate class
 *     really defines an `A00(UserSession)Z` method.
 *  4. Patch the first validated gate: InstaFL inserts `const v0, 0x1` after
 *     the single `move-result v0` of the A00 body; `returnLate(true)` forces
 *     every return of the method to true, which covers the same (single)
 *     return path and stays robust if the method gains extra returns.
 */
private fun unlockDeveloperGate() {
    for (referenceClass in employeeOptionsReferenceClasses) {
        val referenceClassDef = classDefByOrNull(referenceClass) ?: continue
        val gateReference = findValidatedGateReference(referenceClassDef) ?: continue

        gateReference.getMutableMethod().returnLate(true)
        return
    }

    throw PatchException(
        "Could not resolve the developer options gate from any reference class. " +
                "Tried: ${employeeOptionsReferenceClasses.joinToString(", ")}"
    )
}

/**
 * Scans every `invoke-static` call site of the reference class for the gate
 * shape and returns the validated gate method reference, or null when the
 * class yields no valid candidate (the next reference is tried then).
 */
private fun findValidatedGateReference(
    classDef: ClassDef
): MethodReference? {
    for (method in classDef.methods) {
        for (instruction in method.instructions) {
            if (instruction.opcode != Opcode.INVOKE_STATIC &&
                instruction.opcode != Opcode.INVOKE_STATIC_RANGE
            ) {
                continue
            }

            val callee = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference
                ?: continue
            if (callee.name != GATE_CALLEE_NAME) {
                continue
            }
            if (callee.parameterTypes != listOf(USER_SESSION_TYPE) || callee.returnType != "Z") {
                continue
            }
            if (!callee.definingClass.startsWith(GATE_CLASS_PREFIX)) {
                continue
            }

            // Validate the candidate: the gate class must actually define the
            // A00(UserSession)Z method (InstaFL parity; invoke-static alone
            // already guarantees the method is static).
            val gateClassDef = classDefByOrNull(callee.definingClass) ?: continue
            val gateDefined = gateClassDef.methods.any { candidate ->
                candidate.name == GATE_CALLEE_NAME &&
                        candidate.parameterTypes == listOf(USER_SESSION_TYPE) &&
                        candidate.returnType == "Z"
            }
            if (!gateDefined) {
                continue
            }

            return callee
        }
    }
    return null
}
