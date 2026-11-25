package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val USER = "LIlllIIlIIIIIIII;"
private const val USER_STATE = "LIIIllIlIIIl;"
private const val USER_ID_PREFERENCE = "bc391985"

/**
 * Deezer saves the whole in-memory user to APP_PREFS through `IIIIIlIIIlIlIIlI(context, loggedOut)`
 * whenever one field changes (refreshed ARL, credentials, email, profile). With `loggedOut = false`
 * it writes the signed-in flag `807b5f36 = true` together with the user id `bc391985`.
 *
 * When Deezer cold-starts in the background, for example because an Android Auto host such as
 * DriveDeck rebinds the media browser service after the app was stopped, a refresh can reach this
 * method before the user was restored from preferences. It then stores an empty user id next to
 * the signed-in flag. Deezer flags that state itself (`IllegalStateException("Where are you now")`)
 * but writes it anyway, and the next start treats "signed in without a user id" as a broken
 * session and runs the full logout.
 *
 * Skip only that invalid write: a signed-in save with an empty user id. The stored session stays
 * intact and is restored normally; logout (`loggedOut = true`) and every save that carries a user
 * id are unchanged.
 */
internal val deezerKeepSessionOnColdStart = bytecodePatch {
    dependsOn(originalInput)

    execute {
        val method = exact(USER, "IIIIIlIIIlIlIIlI", "V", "Landroid/content/Context;", "Z").method
        val writesUserId = method.instructions.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == USER_ID_PREFERENCE
        }
        check(writesUserId) { "Deezer user persistence no longer writes the user id preference" }

        method.addInstructions(
            0,
            """
                if-nez p1, :morphe_persist_user
                sget-object v0, $USER->IIIIIlIIIlIlIIlI:$USER_STATE
                iget-object v0, v0, $USER_STATE->lIllllIIIIII:Ljava/lang/String;
                invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :morphe_persist_user
                return-void
                :morphe_persist_user
                nop
            """,
        )
    }
}
