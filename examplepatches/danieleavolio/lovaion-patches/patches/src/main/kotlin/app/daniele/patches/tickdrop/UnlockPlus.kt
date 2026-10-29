package app.daniele.patches.tickdrop

import app.daniele.patches.shared.Constants.COMPATIBILITY_TICKDROP
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The coroutine that publishes the Plus entitlement.
 *
 * Tickdrop keeps two DataStore keys (both `Lad2;` preference keys held on
 * `Lz41;`): `is_plus_user` and `plus_token`. The token is only written after
 * a purchase is acknowledged, and it is compared with the token currently
 * held by the billing repository (`Lfj3;->b`). As a result the app computes
 * Plus as "flag AND token matches", never from the flag alone, so patching
 * only the boolean would still leave the user on the free tier.
 *
 * The whole computation lives in the `default` branch of the obfuscated
 * dispatcher `Lni0;->n`, which emits the result once through
 * `Lyh0;->n(Object, Lj00)`. Verified against classes.dex of version 1.9.6
 * with a dexlib2 dump:
 *
 *   28: check-cast v12, Lyh0;
 *   29: check-cast v11, Lwk1;
 *   30: sget-object v1, Lz41;->z:Lad2;        # is_plus_user
 *   31: invoke-virtual {v11, v1}, Lwk1;->c(Lad2;)Ljava/lang/Object;
 *   ...
 *   40: sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;   # not plus
 *   42: sget-object v1, Lz41;->A:Lad2;        # plus_token
 *   43: invoke-virtual {v11, v1}, Lwk1;->c(Lad2;)Ljava/lang/Object;
 *   ...
 *   47: sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;   # no token
 *   55: invoke-virtual {v11, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
 *   57: invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
 *   60: invoke-interface {v12, v11}, Lyh0;->n(Ljava/lang/Object;Lj00;)Ljava/lang/Object;
 *
 * The two `Boolean.FALSE` loads and the `valueOf(equals)` verdict are the only
 * three producers of the emitted value. Replacing each `Boolean.FALSE` with
 * `Boolean.TRUE` and short-circuiting `valueOf` with `Boolean.TRUE` makes every
 * branch publish Plus without touching the DataStore keys or the billing
 * repository. Every replacement is object-to-object (`sget-object` to
 * `sget-object`) and keeps the original instruction size, so the switch table,
 * the branch offsets and the verifier's register types stay valid: a `const/4`
 * would put an int in the register the emit passes as `Ljava/lang/Object;`,
 * which the DEX verifier rejects at runtime.
 */
private object PlusGateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lz41;",
            name = "A",
            type = "Lad2;",
        ),
        methodCall(
            definingClass = "Lwk1;",
            name = "c",
        ),
        methodCall(
            definingClass = "Ljava/lang/Object;",
            name = "equals",
        ),
    ),
)

/**
 * PairIP's license entry point, called from the Application and from the
 * LicenseContentProvider at startup. Tickdrop ships PairIP license-check only
 * (there is no `libpairipcore` VM in the APK), so a re-signed build is refused
 * by this check; making the entry point a no-op removes the enforcement while
 * leaving the billing code untouched.
 */
private object LicenseCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "Cannot check license with null context.",
        "Skipping license check in isolated process.",
    ),
)

@Suppress("unused")
val pairIpBypassPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables the PairIP license check so a re-signed build of " +
        "Tickdrop starts instead of being refused. Required by every other patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TICKDROP)

    execute {
        LicenseCheckFingerprint.method.addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Forces the Plus entitlement to always resolve as active, " +
        "unlocking the premium skins, the unlimited tasks, pinning and backup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TICKDROP)

    dependsOn(pairIpBypassPatch)

    execute {
        val method = PlusGateFingerprint.method
        val instructions = method.implementation?.instructions?.toList()
            ?: throw PatchException("Plus gate method has no body.")

        // Indexes are collected first and replaced from the last to the first,
        // so a replacement never invalidates the index of another one.
        val falseLoads = mutableListOf<Int>()
        var equalsIndex = -1
        instructions.forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            when {
                instruction.opcode == Opcode.SGET_OBJECT &&
                    reference is FieldReference &&
                    reference.definingClass == "Ljava/lang/Boolean;" &&
                    reference.name == "FALSE" -> falseLoads += index
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    reference is MethodReference &&
                    reference.name == "equals" -> equalsIndex = index
            }
        }

        if (falseLoads.size != 2 || equalsIndex < 0) {
            throw PatchException(
                "Obsolete patch: the Plus gate in Lni0;->n changed " +
                    "(${falseLoads.size} Boolean.FALSE loads, equals at $equalsIndex). " +
                    "This patch set targets Tickdrop 1.9.6.",
            )
        }

        // equals path: move-result -> invoke-static Boolean.valueOf(Z) -> move-result-object.
        // The verdict is replaced by Boolean.TRUE, which keeps the emitted value an object.
        val valueOfIndex = equalsIndex + 2
        val valueOfReference = (instructions[valueOfIndex] as? ReferenceInstruction)?.reference
        if (instructions[valueOfIndex].opcode != Opcode.INVOKE_STATIC ||
            valueOfReference !is MethodReference ||
            valueOfReference.definingClass != "Ljava/lang/Boolean;" ||
            valueOfReference.name != "valueOf"
        ) {
            throw PatchException(
                "Obsolete patch: Boolean.valueOf is not where the Plus gate expects it. " +
                    "This patch set targets Tickdrop 1.9.6.",
            )
        }

        method.replaceInstruction(equalsIndex + 3, "nop")

        // The register Boolean.valueOf receives is the one the emit passes on.
        val equalsRegister = (instructions[valueOfIndex] as FiveRegisterInstruction).registerC
        method.replaceInstruction(
            valueOfIndex,
            "sget-object v$equalsRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
        )

        // flag/token paths: every Boolean.FALSE load becomes Boolean.TRUE.
        for (index in falseLoads.reversed()) {
            val register = (instructions[index] as OneRegisterInstruction).registerA
            method.replaceInstruction(
                index,
                "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
            )
        }
    }
}
