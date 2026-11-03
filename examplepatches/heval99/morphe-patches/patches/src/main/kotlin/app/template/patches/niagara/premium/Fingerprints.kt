package app.template.patches.niagara.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** auth0's JWT classes keep their package; only the class names are R8-renamed. */
internal const val AUTH0_JWT_PACKAGE = "Lcom/auth0/android/jwt/"

/**
 * Niagara's account record: (UUID user id, email, session id, account flags, auth0 JWT). The
 * record class and the flag getters are R8-renamed (1.16.33: b/BG2V2l4pTwxKWQD3NX0c8TQ0JHSy), but
 * the constructor keeps the JDK's UUID and auth0's JWT types, and the record declares a field of
 * the flags type it receives. The JWT parse (JWT claims "pro" and "flg") builds the flags here.
 */
internal object AccountRecordFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    custom = { method, classDef ->
        val params = method.parameterTypes.map(CharSequence::toString)
        params.size == 5 &&
            params[0] == "Ljava/util/UUID;" &&
            params[1] == "Ljava/lang/String;" &&
            params[2] == "Ljava/lang/String;" &&
            params[4].startsWith(AUTH0_JWT_PACKAGE) &&
            !classDef.type.startsWith(AUTH0_JWT_PACKAGE) &&
            classDef.fields.any { it.type == params[3] }
    },
)
