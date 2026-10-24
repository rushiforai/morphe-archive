package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal fun BytecodePatchContext.patchNativeDrawDates(version: String) {
    if(version != "0.8.10.191 dev")return
    val owner="Lo/r8lambda4fIVmDse184MJavTVTXSBZQF_UA;"
    val klass=mutableClassDefBy(owner)
    val original=klass.methods.single{it.name=="b"&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType=="J"}
    check(original.accessFlags and 8 == 0)
    val renamed=MutableMethod(ImmutableMethod(owner,"haiagaruNativeDrawDate",original.parameters,
        original.returnType,original.accessFlags,original.annotations,original.hiddenApiRestrictions,original.implementation))
    val wrapper=MutableMethod(ImmutableMethod(owner,original.name,original.parameters,original.returnType,
        original.accessFlags,original.annotations,original.hiddenApiRestrictions,
        ImmutableMethodImplementation(4,emptyList(),emptyList(),emptyList())))
    wrapper.addInstructions(0,"""
        invoke-static {p0, p1}, Lapp/morphe/extension/chmate/NativeDrawDates;->parse(Ljava/lang/Object;Ljava/lang/String;)J
        move-result-wide v0
        return-wide v0
    """.trimIndent())
    klass.methods.remove(original)
    klass.methods.add(renamed)
    klass.methods.add(wrapper)
    println("191 native draw date parsing: bounded per-parser cache, original calculation retained")
}
