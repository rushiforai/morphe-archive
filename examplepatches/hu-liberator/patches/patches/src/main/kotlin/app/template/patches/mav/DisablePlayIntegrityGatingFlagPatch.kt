package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Verified against hu.mav.emmapp_merged.apk (originally JADX: c8/C1910A.java
 * / smali c8/A.smali method t(Object); confirmed renamed to c8/z.smali method
 * r(Object) as of app version 2.4.19-prod, with its dependencies ALSO
 * renamed: the awaited flow's class Lz8/f; became LB8/f;, and the coroutine
 * await utility LZc/T;->k(...) became Lcd/T;->j(...)). This fingerprint and
 * patch intentionally do NOT pin any of the app's own obfuscated names
 * anywhere -- not the enclosing class/method, not the model class, not the
 * await utility -- since R8 renames all of them independently on every
 * build. Instead, everything is discovered dynamically at patch time from
 * two anchors that can't change: the two literal log strings below (part of
 * this app's own source, not generated names), and the model class's
 * constructor shape `(JLjava/lang/String;Ljava/lang/String;Z)V` (confirmed
 * unchanged between the two class names observed so far).
 *
 * This coroutine awaits a "PlayIntegrityLocalModel" from a local StateFlow
 * via a suspending flow.first()-style call, then checks the model's
 * `enabled` field to decide whether to run the whole Play Integrity flow or
 * just continue initialization.
 *
 * The problem: that StateFlow is seeded null and only gets a real value from
 * either a local DB read (usually null on first launch) or a background
 * coroutine that itself waits on a live Firebase Remote Config fetch. On a
 * GmsCompat/sandboxed-Play-Services device (not a stock Play Store
 * environment) that fetch may never complete, so the flow.first() call
 * suspends forever -- silently, no crash, no log (this app's logger never
 * writes to Logcat at all) -- which is why the app's loading screen hangs
 * indefinitely rather than erroring out. This is upstream of, and
 * independent from, every other Play Integrity patch in this set: none of
 * them matter if this coroutine never even reaches the point of requesting a
 * token.
 *
 * Rather than fix the Remote Config dependency itself (fragile, multiple
 * layers deep, ultimately dependent on Play Services behaving normally,
 * which it may not under GmsCompat), this removes the await entirely and
 * directly constructs a disabled model in its place, so this coroutine
 * always and immediately takes the app's own existing "Play Integrity
 * disabled, continue initialization" branch. This method has ample local
 * register headroom and no packed-switch (just plain if/goto), so there's no
 * risk of corrupting a switch dispatch table like the one that caused a
 * VerifyError in an earlier attempt to guard Qa.u0.m()/Ta.t0.l() directly
 * (see git history) -- the 4 removed instructions (the suspending call, its
 * result, and the suspend-check branch) aren't a branch target from anywhere
 * else in the method, and the replacement instructions don't touch any
 * register that's still live afterwards.
 */
object PlayIntegrityConfigAwaitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(
        "Play Integrity disabled, continue initialization",
        "Found enabled play integrity model, validate integrity",
    ),
)

@Suppress("unused")
val disablePlayIntegrityGatingFlagPatch = bytecodePatch(
    name = "Disable Play Integrity gating flag wait",
    description = "Stops the startup coroutine from waiting forever on a Remote-Config-backed flag to decide whether to run the Play Integrity flow, by always treating it as disabled.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        val method = PlayIntegrityConfigAwaitFingerprint.method
        val instructions = method.instructions

        // Locate the "disabled" branch's log string; the model check-cast
        // that gates it (and the await sequence before that) always precedes
        // it in this method, regardless of what any of those get renamed to.
        val disabledStringIndex = instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.CONST_STRING &&
                (insn as ReferenceInstruction).reference.let {
                    it is StringReference && it.string == "Play Integrity disabled, continue initialization"
                }
        }
        check(disabledStringIndex >= 0) {
            "Could not find the \"Play Integrity disabled\" string in ${method.definingClass}->${method.name}"
        }

        val checkCastIndex = (disabledStringIndex - 1 downTo 0).first { instructions[it].opcode == Opcode.CHECK_CAST }
        val modelType = ((instructions[checkCastIndex] as Instruction21c).reference as TypeReference).type

        // The await sequence is always exactly the 4 instructions right
        // before that check-cast: the suspending call, its result, the
        // suspend-check branch, and the suspend-path return. Verify the
        // shape before mutating anything, so a future structural change
        // fails loudly here instead of silently producing broken bytecode.
        val awaitIndex = checkCastIndex - 4
        check(
            instructions[awaitIndex].opcode == Opcode.INVOKE_STATIC &&
                instructions[awaitIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                instructions[awaitIndex + 2].opcode == Opcode.IF_NE &&
                instructions[awaitIndex + 3].opcode == Opcode.RETURN_OBJECT
        ) {
            "Await sequence in ${method.definingClass}->${method.name} did not match the expected shape " +
                "(invoke-static, move-result-object, if-ne, return-object) right before the check-cast to $modelType"
        }

        method.removeInstructions(awaitIndex, 4)

        // Directly construct a disabled model into p1, taking the exact
        // place of the awaited value, so the untouched code right after
        // (check-cast p1, <modelType> ... reads the enabled field) proceeds
        // immediately down the "disabled" branch.
        method.addInstructions(
            awaitIndex,
            """
                new-instance v4, $modelType
                const-wide/16 v5, 0x0
                const-string v7, ""
                const-string v8, ""
                const/4 v9, 0x0
                invoke-direct/range {v4 .. v9}, $modelType-><init>(JLjava/lang/String;Ljava/lang/String;Z)V
                move-object p1, v4
            """
        )
    }
}
