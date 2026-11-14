package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.s.chzzk.common.utils.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal fun BytecodePatchContext.addStartupPopupHooks() {
    val owner = "Lcom/navercorp/game/android/community/data/mobile/entity/home/streaming/StreamingHomePopupBanners;"
    val getter = mutableClassDefBy(owner).methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Ljava/util/List;" &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { field ->
                    field.definingClass == owner && field.name == "popupBanners"
                } == true
            } == true
    }
    getter.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .reversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            getter.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $SETTINGS->filterStartupPopups(Ljava/util/List;)Ljava/util/List;
                move-result-object v$register
            """.trimIndent())
        }
}
