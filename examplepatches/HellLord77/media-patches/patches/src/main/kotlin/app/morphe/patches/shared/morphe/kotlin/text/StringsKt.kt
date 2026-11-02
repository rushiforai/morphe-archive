package app.morphe.patches.shared.morphe.kotlin.text

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.java.lang.CharSequence
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.lang.String
import app.morphe.patches.shared.morphe.java.util.List
import com.android.tools.smali.dexlib2.AccessFlags

object StringsKt {
    override fun toString() = "Lkotlin/text/StringsKt;"
}

object Strings {
    override fun toString() = "Lkotlin/text/StringsKt__StringsKt;"

    object SplitFingerprint : Fingerprint(
        definingClass = Strings.toString(),
        name = $$"split$default",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
        returnType = List.toString(),
        parameters =
            listOf(
                CharSequence.toString(),
                "[$String",
                Type.boolean,
                Type.int,
                Type.int,
                Object.toString(),
            ),
    )
}
