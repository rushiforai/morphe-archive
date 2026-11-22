package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Verified against hu.mav.emmapp 2.7.6-prod (smali: LU5/b;->a(LU5/g;)LT5/r;,
 * located purely by the log string below). This is Play Core's own
 * IntegrityManager request implementation
 * (statically linked into the app's dex), the actual entry point that
 * initiates a Play Integrity token request -- everything downstream
 * (the failure callback, the verdict decode) only runs once this succeeds
 * or fails.
 *
 * This is Play Core library code, and R8 re-obfuscates it on every app
 * update, so NOTHING obfuscated is hardcoded here any more. Across the
 * versions observed, the class went `LW5/b;` -> `LU5/b;`, its single
 * parameter `LW5/g;` -> `LU5/g;`, and the Task-like return type
 * `LV5/q;` -> `LV5/r;` -> `LT5/r;`; the exception-wrapping factory it calls
 * has likewise been `LP2/x0;->U`, `Lsd/d;->v0`, and now
 * `Lcom/bumptech/glide/c;->f0`. (An earlier version of this fingerprint
 * pinned definingClass/name/parameter-type and broke on 2.7.6 when all three
 * were re-obfuscated at once.)
 *
 * The only stable anchor is the log string "requestIntegrityToken(%s)" plus
 * the method's shape: public final, exactly one object parameter, object
 * (non-void) return. `parameters`/`returnType` are given as the single char
 * "L", which morphe matches as "starts with L" (any object type), while the
 * parameter COUNT (1) rules out the sibling class that logs the same string
 * from a zero-parameter, void method (`LU5/c;->b()V`).
 *
 * Rather than keep patching downstream callbacks -- the verdict-decode
 * method in particular is a fragile, control-flow-flattened, packed-switch-
 * based method shared with unrelated features, where inserting a guard
 * around one of its casts previously corrupted the switch and caused a
 * VerifyError -- this stops the request from ever being made, by
 * unconditionally returning an already-failed Task at the very top of the
 * method.
 *
 * The first version of this patch reused the method's own built-in "API
 * unavailable" failure path, which fails with a `W5.a`-typed exception
 * carrying status code -2. That turned out to be the wrong choice: the
 * caller (the OnFailureListener attached to this request -- see
 * DisablePlayIntegrityFailureCrashPatch.kt) inspects the exception's status
 * code when it *is* a W5.a, and -2 is one of six codes that set the app's
 * global init state to "ForcePlayUpgrade" and return *without* ever
 * resuming initialization -- which is exactly the "loading screen times out
 * and restarts" loop this produced (it's the app's built-in "please
 * update/reinstall from Play Store" gate, not a hung network wait).
 *
 * The fix is to fail with a plain `java.lang.Exception` instead of a `W5.a`.
 * The failure callback's `exc instanceof W5.a` check then evaluates false,
 * so its status code becomes null, every special-cased branch
 * (the ForcePlayUpgrade codes, the two that throw SecurityException, the
 * NETWORK_ERROR retry) is skipped, and it falls through to the plain
 * default, which resumes the app's normal initialization continuation.
 *
 * To stay correct even if the exception-wrapping utility's signature drifts
 * again, that call is never hardcoded: this method already calls it three
 * times (once per existing early-return branch), always as
 * `invoke-static {v?}, <factory>(Ljava/lang/Exception;)<This method's own
 * return type>`, so it's found dynamically by matching that shape and its
 * exact MethodReference (whatever it currently is) is reused verbatim.
 */
object PlayIntegrityRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    // "L" alone is matched by morphe as STARTS_WITH, i.e. "any object type",
    // never hardcoding the obfuscated names (see KDoc). returnType "L" also
    // excludes the void sibling; the one-element parameters list pins the
    // method to exactly one (object) argument.
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf("requestIntegrityToken(%s)"),
)

@Suppress("unused")
val disablePlayIntegrityRequestPatch = bytecodePatch(
    name = "Disable Play Integrity token request",
    description = "Makes the Play Integrity token request always fail immediately with an unclassified exception, so the app treats it as gracefully unavailable and continues initialization instead of getting stuck on a Play-Store-required gate.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        val method = PlayIntegrityRequestFingerprint.method
        val instructions = method.instructions
        val returnType = method.returnType

        // This method's own "wrap an Exception into an already-failed Task"
        // factory call: invoke-static taking a single java.lang.Exception
        // and returning this method's own return type. Every existing
        // early-return branch in this method uses it, so it's reliably
        // present regardless of its own class/method/return-type name.
        val wrapCallIndex = instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_STATIC &&
                (insn as ReferenceInstruction).reference.let {
                    it is MethodReference &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes[0] == "Ljava/lang/Exception;" &&
                        it.returnType == returnType
                }
        }
        check(wrapCallIndex >= 0) {
            "Could not find the exception-wrapping Task factory call in ${method.definingClass}->${method.name}"
        }

        val wrapRef = (instructions[wrapCallIndex] as ReferenceInstruction).reference as MethodReference

        method.addInstructions(
            0,
            """
                new-instance v0, Ljava/lang/Exception;
                invoke-direct {v0}, Ljava/lang/Exception;-><init>()V
                invoke-static {v0}, ${wrapRef.definingClass}->${wrapRef.name}(Ljava/lang/Exception;)${wrapRef.returnType}
                move-result-object v0
                return-object v0
            """
        )
    }
}
