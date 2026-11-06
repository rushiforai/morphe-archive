/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 * Modified by lavinhoque33, 2026-11-06.
 */

package app.morphe.patches.youtube.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patches.youtube.utils.navigation.YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal object YouTubeActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object WatchNextResponseParserFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/util/List;",
    filters = listOf(
        literal(49399797L),
        opcode(Opcode.SGET_OBJECT),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            location = MatchAfterImmediately()
        ),
        literal(51779735L),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ljava/lang/Object;",
            location = MatchAfterWithin(5)
        ),
        opcode(
            Opcode.CHECK_CAST,
            location = MatchAfterImmediately()
        ),
        literal(46659098L),
    )
)

internal object RelatedItemSectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        opcode(Opcode.AND_INT_LIT8),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ljava/lang/String;",
        ),
        string(
            string = "related-items",
            location = MatchAfterWithin(3),
        ),
    ),
)

internal object WatchNextResponseModelClassResolverFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("Request being made from non-critical thread"),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            smali = "Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;",
        ),
        opcode(
            opcode = Opcode.CHECK_CAST,
            location = MatchAfterWithin(3),
        ),
    ),
)

/** First match is the sections field; last match identifies the section message class. */
internal fun BytecodePatchContext.watchNextResultsFingerprint(
    sectionsType: String,
    resultsClass: String,
) = Fingerprint(
    definingClass = WatchNextResponseModelClassResolverFingerprint
        .instructionMatches.last().instruction.getReference<TypeReference>()!!.type,
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(resultsClass),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = resultsClass,
            type = sectionsType,
        ),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            name = "iterator",
            location = MatchAfterImmediately(),
        ),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = RelatedItemSectionFingerprint.instructionMatches[1].fieldReference.definingClass,
        ),
    ),
)
