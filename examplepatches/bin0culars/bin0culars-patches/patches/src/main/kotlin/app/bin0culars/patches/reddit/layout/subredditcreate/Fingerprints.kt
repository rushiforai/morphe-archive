package app.bin0culars.patches.reddit.layout.subredditcreate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object SubredditToolbarSearchButtonFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(
        string("subreddit_toolbar_search_button"),
        methodCall(
            parameters = listOf("L", "Ljava/lang/String;"),
            returnType = "L",
            location = MatchAfterImmediately(),
        ),
        methodCall(
            definingClass = "this",
            returnType = "V",
            parameters = listOf(
                "L",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Z",
                "Lkotlin/jvm/functions/Function0;",
                "L",
                "L",
                "L",
                "I",
            ),
        ),
    ),
)

internal object HeaderStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("SubredditHeaderState(displayName="),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Ljava/lang/String;",
            definingClass = "this",
            location = MatchAfterWithin(5),
        ),
    ),
)
