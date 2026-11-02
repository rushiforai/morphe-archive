package app.morphe.patches.shared.morphe.kotlin.collections

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.util.List
import app.morphe.patches.shared.morphe.java.util.Set
import com.android.tools.smali.dexlib2.AccessFlags

object ArraysKt {
    override fun toString() = "Lkotlin/collections/ArraysKt;"
}

@Suppress("ktlint:standard:class-naming")
object _ArraysJvm {
    override fun toString() = "Lkotlin/collections/ArraysKt___ArraysJvmKt;"

    object AsListFingerprint :
        Fingerprint(
            definingClass = _ArraysJvm.toString(),
            name = "asList",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = List.toString(),
            parameters = listOf("[$Object"),
        )
}

@Suppress("ktlint:standard:class-naming")
object _ArraysKt {
    override fun toString() = "Lkotlin/collections/ArraysKt___ArraysKt;"

    object ToSetFingerprint :
        Fingerprint(
            definingClass = _ArraysKt.toString(),
            name = "toSet",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
            returnType = Set.toString(),
            parameters = listOf("[$Object"),
        )
}
