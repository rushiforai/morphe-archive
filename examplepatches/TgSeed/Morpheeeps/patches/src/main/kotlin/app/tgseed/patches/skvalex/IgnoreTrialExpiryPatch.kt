package app.tgseed.patches.skvalex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_CALLRECORDER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Stops the trial from ever counting as expired, without claiming a licence.
 *
 * How the licence works in this app (verified on 3.7.8, classes.dex + smali):
 *
 *   - One int on the Application class holds the state: 0 = check pending, 1/2 = not licensed
 *     (trial or error), 3/4 = licensed. It is written by the native licence engine and read by
 *     one package-private static `()S` accessor (see [LicenseStateGetterFingerprint]).
 *   - Three tiny static `()Z` predicates turn that state into verdicts:
 *       * "is licensed"   : state == 3 || state == 4
 *       * "trial expired" : Calendar.now > trialEnd && !isLicensed
 *       * "grace expired" : Calendar.now > trialEnd + 5 days && !isLicensed
 *   - The master recording switch is `is_recording_enabled && !graceExpired`, and the purchase
 *     wall is driven by "trial expired".
 *
 * This patch forces only the two expiry predicates to `false`. It deliberately leaves the state
 * and "is licensed" alone.
 *
 * Why that restraint matters: an earlier version of this patch also pinned the accessor to 3 and
 * forced "is licensed" to true. The app then believed it was licensed while its native engine knew
 * otherwise, and the first thing that state does at startup is make `Lo/js0;->e()Z` (called while
 * the navigation drawer is built) fire two *synchronous* native licence commands
 * (`Native.z(4180/4181, ...)`) because the companion unlocker package `org.skvalex.cr.unlock` is
 * not installed. On a re-signed build that path is what killed the process - the app closed
 * immediately on launch. Keeping the state honest avoids that path entirely.
 *
 * Structural discovery, no obfuscated name:
 *   - the predicates are static `()Z` methods that call the state accessor;
 *   - "is licensed" is the one without a `java.util.Calendar` call, "trial expired" is the one
 *     with it;
 *   - "grace expired" has a Calendar call and consults "is licensed" instead of the accessor.
 *
 * Fails loudly if the shapes do not match; a half-patched trial is worse than none.
 */
private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.isStaticMethod(): Boolean =
    (accessFlags and AccessFlags.STATIC.value) != 0

/** A static, argument-less `boolean` method — the shape of every licence predicate. */
private fun Method.isBooleanPredicate(): Boolean =
    isStaticMethod() && returnType == "Z" && parameterTypes.isEmpty()

private fun Method.instructionList(): List<Instruction>? =
    implementation?.instructions?.toList()

/** Same declaring class, name, return type and parameters. */
private fun MethodReference.matches(target: Method): Boolean =
    definingClass == target.definingClass &&
        name == target.name &&
        returnType == target.returnType &&
        parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() }

private fun Method.sameShapeAs(target: Method): Boolean =
    name == target.name &&
        returnType == target.returnType &&
        parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() }

/** Predicates that touch `java.util.Calendar` deal with trial expiry; the plain one does not. */
private fun List<Instruction>.callsCalendar(): Boolean =
    any { it.methodReference()?.definingClass == "Ljava/util/Calendar;" }

private class PredicateCandidate(
    val classDef: ClassDef,
    val method: Method,
    val instructions: List<Instruction>
)

@Suppress("unused")
val ignoreTrialExpiryPatch = bytecodePatch(
    name = "Ignore trial expiry",
    description = "Makes the trial/grace expiry predicates report \"not expired\", so recording " +
        "is never blocked and the purchase wall never appears. The licence state itself is left " +
        "untouched, so the app keeps telling its licence engine the truth.",
    default = false
) {
    compatibleWith(COMPATIBILITY_CALLRECORDER)

    execute {
        val stateGetter = LicenseStateGetterFingerprint.method

        // Every small static ()Z method in the APK; the licence predicates are among them.
        val candidates = ArrayList<PredicateCandidate>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (!method.isBooleanPredicate()) return@forEach
                val instructions = method.instructionList() ?: return@forEach
                // The predicates are one-liners; anything larger is app logic that merely happens
                // to return boolean.
                if (instructions.size > 80) return@forEach
                candidates.add(PredicateCandidate(classDef, method, instructions))
            }
        }

        val stateUsers = candidates.filter { candidate ->
            candidate.instructions.any { it.methodReference()?.matches(stateGetter) == true }
        }
        val licensedPredicates = stateUsers.filterNot { it.instructions.callsCalendar() }
        val expiredPredicates = stateUsers.filter { it.instructions.callsCalendar() }

        if (licensedPredicates.size != 1 || expiredPredicates.size != 1) {
            throw PatchException(
                "Licence predicates: ${licensedPredicates.size} plain / " +
                    "${expiredPredicates.size} calendar, expected 1 / 1 - structure changed?"
            )
        }

        val licensedPredicate = licensedPredicates.single()
        val gracePredicates = candidates.filter { candidate ->
            candidate.instructions.callsCalendar() &&
                candidate.instructions.any {
                    it.methodReference()?.matches(licensedPredicate.method) == true
                }
        }
        if (gracePredicates.size != 1) {
            throw PatchException(
                "Grace-period predicate candidates: ${gracePredicates.size}, expected 1 - " +
                    "structure changed?"
            )
        }

        val expiredPredicate = expiredPredicates.single()
        val gracePredicate = gracePredicates.single()

        // One class holds both predicates in this build, but resolve per class anyway so the
        // conversion stays correct if a future build moves one of them.
        val edits = listOf(
            expiredPredicate.classDef to expiredPredicate.method,
            gracePredicate.classDef to gracePredicate.method
        )
        edits.groupBy({ it.first }, { it.second }).forEach { (classDef, targets) ->
            val mutable = mutableClassDefBy(classDef)
            targets.forEach { target ->
                val method = mutable.methods.firstOrNull { it.sameShapeAs(target) }
                    ?: throw PatchException("Lost ${classDef.type}->${target.name} after conversion")
                if ((method.implementation?.registerCount ?: 0) < 1) {
                    throw PatchException(
                        "${classDef.type}->${target.name} has no local register to return " +
                            "from - structure changed?"
                    )
                }
                method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        }

        println(
            "Ignore trial expiry: ${edits.size} expiry predicates -> false " +
                "(licence state left untouched)"
        )
    }
}
