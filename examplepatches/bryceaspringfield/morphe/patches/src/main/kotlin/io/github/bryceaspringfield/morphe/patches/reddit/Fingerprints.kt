package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The base class of every paged feed (Home, Popular, Latest, communities, custom feeds).
 */
internal object FeedPagingDataSourceFingerprint : Fingerprint(
    filters = listOf(
        string("FeedPagingDataSource::getPagedDataGql not implemented")
    )
)

/**
 * The feed's page loader, which reads each fetched page's elements with getData().
 */
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

/**
 * The older post listings' constructor (search results, profiles), which stores the posts.
 * Morphe Patches' ad filter hooks the same constructor.
 */
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
