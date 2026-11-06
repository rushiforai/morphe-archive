/*
 * The Litho text fingerprint is adapted from Morphe patches
 * (https://github.com/MorpheApp/morphe-patches), GPLv3. See NOTICE.
 */
package app.orangetree.ytmaitag.patches.music.aitag

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Builds the CharSequence for every Litho text component
 * (song rows, cards, shelves and most of the Now Playing screen).
 */
internal object LithoTextCreationFingerprint : Fingerprint(
    returnType = "Ljava/lang/CharSequence;",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = "Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;"
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "V",
            parameters = listOf(
                "Landroid/text/SpannableString;",
                "Ljava/lang/Object;",
                "I",
                "Z",
                "I"
            )
        ),
        string(
            "Failed to set PB Style Run Extension in TextComponentSpec.",
            comparison = StringComparisonType.STARTS_WITH
        )
    )
)

/**
 * The app's own TextView subclass, used by the mini player, queue
 * and other non-Litho screens. Every setText() call ends up here.
 */
internal object YouTubeTextViewSetTextFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;",
    name = "setText",
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;", "Landroid/widget/TextView\$BufferType;")
)
