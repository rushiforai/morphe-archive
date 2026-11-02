package app.morphe.patches.shared.morphe.kotlin.sequences

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.util.Iterator
import app.morphe.patches.shared.morphe.java.util.List
import com.android.tools.smali.dexlib2.AccessFlags

object SequencesKt {
    override fun toString() = "Lkotlin/sequences/SequencesKt;"
}

@Suppress("ktlint:standard:class-naming")
object _Sequences {
    override fun toString() = "Lkotlin/sequences/SequencesKt___SequencesKt;"

    object ToListFingerprint :
        Fingerprint(
            definingClass = _Sequences.toString(),
            name = "toList",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = Sequence.toString(),
            parameters = listOf(List.toString()),
        )

    object ToMutableListFingerprint :
        Fingerprint(
            definingClass = _Sequences.toString(),
            name = "toMutableList",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
            returnType = Sequence.toString(),
            parameters = listOf(List.toString()),
        )
}

object Sequences {
    override fun toString() = "Lkotlin/sequences/SequencesKt__SequencesKt;"

    object AsSequenceFingerprint :
        Fingerprint(
            definingClass = Sequences.toString(),
            name = "asSequence",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = Sequence.toString(),
            parameters = listOf(Iterator.toString()),
        )
}
