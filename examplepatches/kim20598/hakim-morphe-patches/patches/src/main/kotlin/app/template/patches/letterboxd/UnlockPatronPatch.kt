package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.android.tools.smali.dexlib2.AccessFlags

private const val COMPANION =
    "Lcom/letterboxd/api/model/MemberStatus\$Companion;"
private const val MEMBER_STATUS =
    "Lcom/letterboxd/api/model/MemberStatus;"
private const val PATRON =
    "Lcom/letterboxd/api/model/MemberStatus\$Patron;"

/**
 * `MemberStatus.Companion.valueOf(String)` — the string → enum parser Kotlin serialization
 * runs on every server response that carries a `memberStatus` field.
 *
 * Note: Kotlin enums don't expose the constants as static fields on the outer enum class. Each
 * case is its own nested class (e.g. `MemberStatus$Patron`) with a singleton `INSTANCE` field.
 * So we fetch `INSTANCE`, then cast it to `MemberStatus`.
 */
internal object MemberStatusValueOfFingerprint : Fingerprint(
    definingClass = COMPANION,
    name = "valueOf",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = MEMBER_STATUS,
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val unlockPatronPatch = bytecodePatch(
    name = "Force Patron (local)",
    description = "Makes the app treat your own account as Patron locally, so Patron-only " +
        "screens and pickers appear. Purely cosmetic — the server still knows the real tier, " +
        "so anything that saves (posters, backdrops) or fetches Patron-only data will not " +
        "actually work. Off by default.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        MemberStatusValueOfFingerprint.method.apply {
            // Prepend: return MemberStatus.Patron immediately, ignoring the input string.
            // The enum constant is fetched from its nested singleton INSTANCE field, then
            // cast to the outer MemberStatus type — that's how Kotlin generates enum access.
            addInstructions(
                0,
                """
                    sget-object p1, $PATRON->INSTANCE:$PATRON
                    check-cast p1, $MEMBER_STATUS
                    return-object p1
                """.trimIndent(),
            )
        }
    }
}
