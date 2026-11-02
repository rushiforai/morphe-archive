package app.morphe.patches.shared.morphe.kotlin.sequences

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.util.Iterator
import com.android.tools.smali.dexlib2.AccessFlags
import kotlin.sequences.Sequence

object Sequence {
    override fun toString(): String = Sequence::class.java.descriptorString()

    object IteratorFingerprint :
        Fingerprint(
            definingClass = Sequence::class.java.descriptorString(),
            name = "iterator",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
            returnType = Iterator.toString(),
            parameters = emptyList(),
        )
}
