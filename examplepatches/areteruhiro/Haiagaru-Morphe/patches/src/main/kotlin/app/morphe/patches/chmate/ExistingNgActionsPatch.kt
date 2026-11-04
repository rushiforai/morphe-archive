package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal fun BytecodePatchContext.patchExistingNgActions(version: String) {
    val type = when(version) {
        "0.8.10.191 dev" -> "Lo/MaxFullscreenAdImplExternalSyntheticLambda4;"
        "0.8.10.226 dev" -> "Lo/unsharedCopy;"
        "0.8.10.242 dev" -> "Lo/AdRequestBuilder;"
        else -> return
    }
    val owner = mutableClassDefBy(type)
    check(owner.methods.none { it.name == "onResume" && it.parameterTypes.isEmpty() })
    val method = MutableMethod(ImmutableMethod(type, "onResume", emptyList(), "V", 1,
        emptySet(), emptySet(), ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
    method.addInstructions(0, """
        invoke-super {p0}, ${owner.superclass}->onResume()V
        invoke-static {p0}, Lapp/morphe/extension/chmate/ExistingNgActions;->resumed(Ljava/lang/Object;)V
        return-void
    """.trimIndent())
    owner.methods.add(method)
}
