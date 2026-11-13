package app.extendedplaylists.patches.youtube.layout.hiddenplaylists

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * Parcelable adapter of a browse response. 58173949 is the protobuf extension number
 * of singleColumnBrowseResultsRenderer, which only this adapter reads.
 */
internal object BrowseResponseFingerprint : Fingerprint(
    interfaces = listOf("Landroid/os/Parcelable;"),
    parameters = listOf(),
    filters = listOf(literal(58173949))
)

/**
 * The InnerTube response parser: every network response, on a background thread, is parsed here
 * with the generated extension registry into the message type it is given.
 */
internal object ResponseParserFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L", "L", "Lcom/google/protobuf/MessageLite;", "L"),
    filters = listOf(
        methodCall(name = "getParserForType"),
        methodCall(name = "getGeneratedRegistry"),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            parameters = listOf("L", "Lcom/google/protobuf/ExtensionRegistryLite;"),
            returnType = "Ljava/lang/Object;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately())
    )
)

/** writeToParcel reads the response message just before it writes it. */
internal object BrowseResponsePayloadFingerprint : Fingerprint(
    classFingerprint = BrowseResponseFingerprint,
    name = "writeToParcel",
    filters = listOf(
        fieldAccess(definingClass = "this", opcode = Opcode.IGET_OBJECT),
        methodCall(
            parameters = listOf("Lcom/google/protobuf/MessageLite;", "Landroid/os/Parcel;"),
            location = MatchAfterImmediately()
        )
    )
)
