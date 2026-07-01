package app.morphe.patches.youtube.layout.returnyoutubedislike

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchFirst
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object DislikeFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("like/dislike")
    )
)

internal object EndpointServiceNameFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "L",
    filters = listOf(
        string("serviceName"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Ljava/lang/String;"
        )
    )
)

internal fun likeEndpointParserFingerprint(definingClass: String) = object : Fingerprint(
    definingClass = definingClass,
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            location = MatchFirst()
        ),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this"
        ),
        string("")
    )
) {}

internal fun requestParameterCheckFingerprint(definingClass: String) = object : Fingerprint(
    definingClass = definingClass,
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        // playlistId
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ljava/lang/String;"
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/lang/String;->isEmpty()Z"
        ),
        // videoId
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ljava/lang/String;"
        )
    )
) {}
