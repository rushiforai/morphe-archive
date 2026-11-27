package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object FeedPagingDataSourceFingerprint : Fingerprint(
    filters = listOf(
        string("FeedPagingDataSource::getPagedDataGql not implemented")
    )
)

internal object FeedPagingDataSourceLoadFingerprint : Fingerprint(
    classFingerprint = FeedPagingDataSourceFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            opcodes = listOf(Opcode.INVOKE_INTERFACE),
            name = "getData",
            parameters = listOf(),
            returnType = "Ljava/util/List;"
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
    )
)

internal object ListingFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/listing/Listing;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            smali = "Lcom/reddit/domain/model/listing/Listing;->children:Ljava/util/List;"
        )
    )
)
