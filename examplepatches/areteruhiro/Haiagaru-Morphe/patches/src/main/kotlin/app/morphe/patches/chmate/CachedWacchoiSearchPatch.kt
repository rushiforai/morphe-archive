package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal fun BytecodePatchContext.patchCachedWacchoiSearch(version: String) {
    if(version !in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.242 dev")) return
    val fragment = mutableClassDefBy(when(version) {
        "0.8.10.242 dev" -> "Lo/GNk49;"
        "0.8.10.226 dev" -> "Lo/setUtf8okio;"
        else -> "Ljp/syoboi/a2chMate/fragment/SearchFragment;"
    })
    val create = fragment.methods.single { it.name == "onCreateView" && it.parameterTypes.size == 3 }
    // Both parameters are dead at return; do not allocate registers or alter native UI setup.
    create.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed().forEach { (index, instruction) ->
        val result = (instruction as OneRegisterInstruction).registerA
        create.addInstructionsWithLabels(index, """
            move-object/16 p1, v$result
            invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/CachedWacchoiSearch;->wrap(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
            move-result-object v$result
        """.trimIndent())
    }
    if (version != "0.8.10.191 dev") {
        val compose = mutableClassDefBy(if(version == "0.8.10.242 dev") "Lo/r7ExternalSyntheticLambda0;" else "Lo/m2a;")
        val base = mutableClassDefBy(compose.superclass!!)
        val noArgs = base.methods.filter { it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null }
        val createComposition = noArgs.single { m -> m.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.contains("createComposition requires") == true
        } }
        val disposeComposition = noArgs.single { m -> m.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "requestLayout"
        } }
        val refresh = MutableMethod(ImmutableMethod(compose.type, "haiagaruRefreshCachedSearchForm", emptyList(),
            "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
        refresh.addInstructions(0, """
            invoke-virtual {p0}, ${base.type}->${disposeComposition.name}()V
            invoke-virtual {p0}, ${base.type}->${createComposition.name}()V
            return-void
        """.trimIndent())
        compose.methods.add(refresh)
    }
}
