package app.ghostknow.patches.lihkg

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The single reader of the "is_plus_user" SharedPreferences key.
 *
 * Every LIHKG+ gate in the app goes through this one method (25 call sites: ad gating,
 * the X-LI-PLUS request header, post_plus.html, the account/history/read-later screens).
 * The holder class and method names are obfuscated and change between releases, so this
 * fingerprint matches only by shape: a non-static method returning Z with no parameters
 * that loads the "is_plus_user" key and calls a (String, Z) -> Z preference getter.
 *
 * Original body:
 *     const-string v0, "is_plus_user"
 *     const/4 v1, 0x0
 *     invoke-virtual {p0, v0, v1}, <prefs holder>;->n(Ljava/lang/String;Z)Z
 *     move-result v0
 *     return v0
 */
internal object PlusUserPrefFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("is_plus_user"),
        methodCall(
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "Z",
            location = MatchAfterWithin(4),
        ),
    ),
)

/**
 * Me.is_plus_user() - the account model getter the preference is written from.
 *
 * The class, method and field names are not obfuscated because they double as the
 * API JSON keys, so they are safe to declare directly.
 */
internal object MeIsPlusUserFingerprint : Fingerprint(
    definingClass = "Lcom/lihkg/app/obj/Me;",
    name = "is_plus_user",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            name = "is_plus_user",
            type = "Z",
        ),
    ),
)

/**
 * Me.getPlus_expiry_time() - only the account screen's "到期日" label reads this,
 * so it is pinned to a far future instant to keep the label sensible.
 */
internal object MePlusExpiryFingerprint : Fingerprint(
    definingClass = "Lcom/lihkg/app/obj/Me;",
    name = "getPlus_expiry_time",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "J",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_WIDE,
            name = "plus_expiry_time",
            type = "J",
        ),
    ),
)
