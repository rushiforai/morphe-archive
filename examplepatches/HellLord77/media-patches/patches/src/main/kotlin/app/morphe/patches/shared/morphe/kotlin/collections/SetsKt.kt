package app.morphe.patches.shared.morphe.kotlin.collections

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.util.Set
import com.android.tools.smali.dexlib2.AccessFlags

object SetsKt {
    override fun toString() = "Lkotlin/collections/SetsKt;"
}

object Sets {
    override fun toString() = "Lkotlin/collections/SetsKt__SetsKt;"

    object SetOfFingerprint :
        Fingerprint(
            definingClass = Sets.toString(),
            name = "setOf",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
            returnType = Set.toString(),
            parameters = listOf("[$Object"),
        )
}
