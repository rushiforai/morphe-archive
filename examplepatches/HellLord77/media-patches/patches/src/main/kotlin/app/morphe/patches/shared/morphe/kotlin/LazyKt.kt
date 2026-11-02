package app.morphe.patches.shared.morphe.kotlin

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object LazyKt {
    override fun toString() = "Lkotlin/LazyKt;"
}

object LazyJVM {
    override fun toString() = "Lkotlin/LazyKt__LazyJVMKt;"

    object LazyFingerprint : Fingerprint(
        definingClass = LazyJVM.toString(),
        name = "lazy",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = Lazy.toString(),
        parameters = listOf(Function0.toString()),
    )
}
