package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/**
 * On TV, the sites screen (`wk2`) shows site tiles only for
 * `SiteInfo.packagename == "standardsite"` (all others become an empty group
 * that is dropped), and the tile click handler (`k23.h`) falls through to a
 * no-op for any packagename it doesn't know. Without a user account free
 * sites therefore show nothing, and the screen is gated behind the
 * "User Account needed" dialog (`wk2.b1` → `fk.D`).
 *
 * Redirecting `getPackagename()` to "standardsite" makes every site a
 * standard site: tiles appear for all sites and every tile click routes
 * through the free path (`VideoActivityTV` with the `SITETAG` extra). The
 * paid "paysites" row (`sitetag == "paysites"`) still opens its login
 * activity, and other screens (phone sites screen, extrasite picker) are
 * unaffected because they never branch on unknown packagenames.
 */
object SitePackagenameFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/sites/SiteInfo;",
    name = "getPackagename",
    returnType = "Ljava/lang/String;"
)

/**
 * `wk2.b1(ZZ)V` is the account gate: it shows the "User Account needed"
 * dialog (`fk.D`) when the stored username is empty, both at startup and on
 * every site-tile click (the click handler checks the logged-in flag `u4`,
 * which is only set by the login success callback). Routing the empty-branch
 * to the login path (`fk.q`) instead performs a silent anonymous login whose
 * success callback sets `u4 = true` and un-gates the tiles.
 *
 * The second `Z` parameter keeps the real login entry point working: the
 * callers are startup (`wk2.u0`, p2=false), site-tile click (`k23`,
 * p2=false) and the "Login with PRO Account" tile (`k23` pswitch_19,
 * p2=true). The isEmpty force is applied only when p2=false; with p2=true
 * the stock branch is kept, so the login tile still opens the dialog with
 * username/password + Sign Up for a real (free or PRO) login.
 */
object TvAccountGateFingerprint : Fingerprint(
    definingClass = "Lwk2;",
    name = "b1",
    returnType = "V",
    parameters = listOf("Z", "Z")
)

@Suppress("unused")
val bypassAccountNeededPatch = bytecodePatch(
    name = "Use free sites on TV without account",
    description = "Bypasses the 'User Account needed' gate so free sites are listed and playable on the TV UI without a user account.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        SitePackagenameFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "standardsite"
                return-object v0
            """
        )

        val gate = TvAccountGateFingerprint.method
        val instrs = gate.implementation!!.instructions
        var isEmptyResult = -1
        for (i in 1 until instrs.size) {
            // directly follows the String.isEmpty() call (the only invoke-virtual+move-result pair in b1)
            if (instrs[i].opcode == Opcode.MOVE_RESULT && instrs[i - 1].opcode == Opcode.INVOKE_VIRTUAL) {
                isEmptyResult = i
                break
            }
        }
        check(isEmptyResult >= 0) { "b1: isEmpty move-result not found" }
        // p2=true only from the "Login with PRO Account" tile: keep the real
        // isEmpty result there so the login dialog opens (real PRO login).
        // p2=false (startup / site-tile gate): force isEmpty=false → silent
        // anonymous login, the bypass this patch exists for.
        gate.addInstructionsWithLabels(
            isEmptyResult + 1,
            """
                if-nez p2, :cond_morphe_anon
                const/4 p1, 0x0
                :cond_morphe_anon
            nop
            """.trimIndent()
        )
    }
}
