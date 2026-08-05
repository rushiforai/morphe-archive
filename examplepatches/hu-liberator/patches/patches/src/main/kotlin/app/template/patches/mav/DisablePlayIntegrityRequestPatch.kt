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
 * Verified against hu.mav.emmapp_merged.apk (JADX/smali: W5/b.java, method
 * a(g)). This is Play Core's own IntegrityManager request implementation
 * (statically linked into the app's dex), the actual entry point that
 * initiates a Play Integrity token request -- everything downstream
 * (the failure callback, the verdict decode) only runs once this succeeds
 * or fails.
 *
 * W5.b and its method name "a" have stayed stable across the one app update
 * observed so far (2.4.15-prod -> 2.4.19-prod), unlike this app's own
 * obfuscated code, so definingClass/name are kept here as a primary anchor
 * -- but NOT the return type: it changed from `LV5/q;` to `LV5/r;` in that
 * same update (the Task-like class itself got renamed), which is exactly why
 * this patch no longer hardcodes it, or the exception-wrapping utility class
 * it used to call by name either (`LP2/x0;->U(...)` became
 * `Lsd/d;->v0(...)`, i.e. class, method name, AND return type all changed).
 * `parameters` is kept as a secondary anchor to disambiguate from an
 * unrelated method in a sibling class that logs the same string with a
 * different (zero-parameter) shape.
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
    definingClass = "LW5/b;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("LW5/g;"),
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
