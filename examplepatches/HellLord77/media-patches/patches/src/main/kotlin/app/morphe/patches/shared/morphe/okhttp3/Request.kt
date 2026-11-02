package app.morphe.patches.shared.morphe.okhttp3

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags

object Request {
    override fun toString() = "Lokhttp3/Request;"

    object HeaderFingerprint :
        Fingerprint(
            definingClass = Request.toString(),
            name = "header",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = String.toString(),
            parameters = listOf(String.toString()),
        )
}
