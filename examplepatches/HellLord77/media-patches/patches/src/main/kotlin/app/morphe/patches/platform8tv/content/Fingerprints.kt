package app.morphe.patches.platform8tv.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.isNotExtension
import app.morphe.patches.shared.morphe.com.android.volley.Network
import app.morphe.patches.shared.morphe.com.android.volley.NetworkResponse
import app.morphe.patches.shared.morphe.com.android.volley.Request
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object GetContentAvailabilityFingerprint :
    Fingerprint(
        definingClass = "Ldigivive/platform8/androidtv/models/",
        name = "getContent_availability",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = String.toString(),
        parameters = emptyList(),
    )

object PerformRequestMethodCallFingerprint :
    Fingerprint(
        filters =
            listOf(
                methodCall(
                    definingClass = Network.toString(),
                    name = "performRequest",
                    parameters = listOf(Request.toString()),
                    returnType = NetworkResponse.toString(),
                    opcode = Opcode.INVOKE_INTERFACE,
                ),
            ),
        custom = ::isNotExtension,
    )
