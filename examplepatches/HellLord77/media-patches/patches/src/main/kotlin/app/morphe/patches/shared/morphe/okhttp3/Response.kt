package app.morphe.patches.shared.morphe.okhttp3

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags

object Response {
    override fun toString() = "Lokhttp3/Response;"

    object RequestFingerprint : Fingerprint(
        definingClass = Response.toString(),
        name = "request",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Request.toString(),
        parameters = emptyList(),
    )

    object ToStringFingerprint : Fingerprint(
        definingClass = Response.toString(),
        name = "toString",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = String.toString(),
        parameters = emptyList(),
    )
}
