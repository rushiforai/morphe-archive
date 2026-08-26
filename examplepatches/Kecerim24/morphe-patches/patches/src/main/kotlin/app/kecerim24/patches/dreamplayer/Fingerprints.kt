package app.kecerim24.patches.dreamplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Preference key holding the "premium unlocked" flag.
 *
 * The app writes it to `true` after Google Play confirms the
 * `de.cyberdream.dreamepg.player.premium.entitlement` purchase, and every premium feature
 * (as well as whether AdMob banners are shown) is decided from this single boolean.
 *
 * The same constant doubles as an AES key elsewhere in the app, so it is unlikely to change
 * between app versions.
 */
internal const val PREMIUM_PREFERENCE_KEY =
    "564E6916225CB52D17A77B9D2C58AF65CC773271B44BB895A3F286FADD8A40611F60EB6278802A19880BBD421E440BB9"

/**
 * The app wide `isPremium()` accessor. In 14.1.0 this is `Ly1/p;->e()Z`, a static method on
 * the same class that manages AdMob:
 *
 * ```
 * invoke-static      {}, Ly1/P;->f()Ly1/P;
 * move-result-object v0
 * const-string       v1, "564E69..."
 * const/4            v2, 0x0
 * invoke-virtual     {v0, v1, v2}, Ly1/P;->e(Ljava/lang/String;Z)Z
 * move-result        v0
 * return             v0
 * ```
 *
 * The class name is obfuscated and changes between app versions, so this is matched purely by
 * the preference key and the method shape. The [methodCall] filter additionally resolves the
 * generic `getBoolean` preference helper, which is patched together with this method.
 */
internal object PremiumStatusFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string(PREMIUM_PREFERENCE_KEY),
        // The generic boolean preference getter: Ly1/P;->e(Ljava/lang/String;Z)Z
        methodCall(
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "Z"
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.RETURN, MatchAfterImmediately())
    )
)

/**
 * Online license validation. In 14.1.0 this is
 * `LO0/b;->b(Landroid/app/Activity;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)Ljava/lang/Integer;`
 *
 * It POSTs the device id, the stored premium key and the Play order id to CyberDream's
 * `/query` endpoint, and returns a status code that the caller uses to revoke premium
 * (`-1`, "Purchase revoked"), clear it (`-2`, "Purchase removed") or flag the device as
 * blocked (`-3`). Matched on the JSON field names of the request and response.
 */
internal object LicenseValidationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/Integer;",
    filters = listOf(
        string("ONLINE_CHECK"),
        string("\", \"licensevalid\" : \""),
        string("\", \"premiumKey\" : \""),
        string("\"blocked\": \"1\""),
        string("\"revoked\": \"1\"")
    )
)
