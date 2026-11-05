package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal fun BytecodePatchContext.patchNativeAaClassifier(version: String) {
    val (owner,name)=when(version) {
        "0.8.10.191 dev" -> "Lo/MediationServiceImplExternalSyntheticLambda1;" to "g"
        "0.8.10.226 dev" -> "Lo/BouncyCastleSocketAdapterCompanionfactory1;" to "a"
        "0.8.10.242 dev" -> "Lo/KeJ13;" to "e"
        else -> return
    }
    val klass=mutableClassDefBy(owner)
    val original=klass.methods.single { it.name==name&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType=="Z" }
    check(original.accessFlags and 8 != 0)
    val retained=MutableMethod(ImmutableMethod(owner,"haiagaruNativeAaClassifier",original.parameters,
        original.returnType,original.accessFlags,original.annotations,original.hiddenApiRestrictions,original.implementation))
    val wrapper=MutableMethod(ImmutableMethod(owner,original.name,original.parameters,original.returnType,
        original.accessFlags,original.annotations,original.hiddenApiRestrictions,
        ImmutableMethodImplementation(2,emptyList(),emptyList(),emptyList())))
    wrapper.addInstructions(0,"""
        if-eqz p0, :native_null_check
        invoke-static {p0}, Lapp/morphe/extension/chmate/NativeAaClassifier;->classify(Ljava/lang/String;)Z
        move-result v0
        return v0
        :native_null_check
        invoke-static {p0}, $owner->haiagaruNativeAaClassifier(Ljava/lang/String;)Z
        move-result v0
        return v0
    """.trimIndent())
    klass.methods.remove(original);klass.methods.add(retained);klass.methods.add(wrapper)
    println("$version native AA classification: equivalent character ratio, early completion, native null check")
}
