package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import app.morphe.patches.shared.morphe.java.lang.String
import app.morphe.patches.shared.morphe.okhttp3.Request
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object GetVideoDetailsDataMethodCallFingerprint :
    Fingerprint(
        filters =
            listOf(
                methodCall(
                    definingClass = "Lsaas/ott/smarttv/ui/details/data/DetailsEndPoint;",
                    name = "getVideoDetailsData",
                    parameters = listOf(Type.STRING),
                    returnType = "Lretrofit2/Call;",
                    opcode = Opcode.INVOKE_INTERFACE,
                ),
            ),
        custom = ::isNotExtension,
    )

object RequestFingerprint : Fingerprint(
    classFingerprint =
        Fingerprint(
            definingClass = "Lokhttp3/",
            name = "toString",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = String.toString(),
            parameters = emptyList(),
            filters = listOf(string("Response{", StringComparisonType.STARTS_WITH)),
        ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Request.toString(),
    parameters = emptyList(),
)

object HeaderFingerprint :
    Fingerprint(
        definingClass = Request.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = String.toString(),
        parameters = listOf(String.toString()),
    )
