package lab.juicessh.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import lab.juicessh.patches.shared.COMPATIBILITY_JUICESSH

/**
 * Unlocks JuiceSSH Pro on version 3.2.2.
 *
 * The app is normally licensed through a one-time Google Play purchase
 * (`com.sonelli.juicessh.propack`) that is verified by api.sonelli.com and
 * then enforced entirely on-device by `oi0.d(User)` and `User.H()`.
 *
 * This patch:
 *  1. Forces `oi0.d(Object)` — the single Pro predicate — to return true.
 *  2. Forces `User.H()` — the RSA signature check — to return true, so cached
 *     or dummy users are accepted.
 *  3. Replaces the "New User" error branch in `pi0.j(...)` with a callback
 *     carrying a fresh `User`, so a clean install reaches the Pro gates
 *     without requiring a Google sign-in or a real purchase.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks JuiceSSH Pro features without a Play purchase by forcing the " +
        "client-side entitlement and signature checks. Online features (CloudSync, TeamShare, " +
        "EC2 Link, plugin repository, purchase/restore) will not work because api.sonelli.com is offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JUICESSH)

    execute {
        // 1. The single entitlement predicate used by every Pro gate.
        ProEntitlementFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // 2. The server-record signature check. Returning true makes any
        //    locally cached User acceptable even if its signature is stale.
        UserSignatureFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // 3. Clean-install path: pi0.j(...) normally calls callback.a("New User")
        //    and returns. Replace that with callback.b(new User()).
        val authMethod = NewUserAuthFingerprint.method
        val callbackIndex = authMethod.indexOfNewUserCallback()
        if (callbackIndex < 0) {
            throw PatchException("Could not find the 'New User' callback in pi0.j(...)")
        }
        authMethod.removeInstructions(callbackIndex, 2)
        authMethod.addInstructions(
            callbackIndex,
            """
                new-instance v0, Lcom/sonelli/juicessh/models/User;
                invoke-direct {v0}, Lcom/sonelli/juicessh/models/User;-><init>()V
                invoke-virtual {v1, v0}, Lcom/sonelli/pi0${'$'}p;->b(Lcom/sonelli/juicessh/models/User;)V
                return-void
            """.trimIndent(),
        )
    }
}

/**
 * Index of the first `pi0.p.a(String)` call that follows the `"New User"`
 * string literal, or -1 when the expected branch is absent.
 */
private fun MutableMethod.indexOfNewUserCallback(): Int {
    val instructions = implementation?.instructions ?: return -1
    var sawNewUser = false
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (!sawNewUser) {
            if (reference is StringReference && reference.string == "New User") {
                sawNewUser = true
            }
        } else if (reference is MethodReference &&
            reference.definingClass == "Lcom/sonelli/pi0\$p;" &&
            reference.name == "a"
        ) {
            return index
        }
    }
    return -1
}