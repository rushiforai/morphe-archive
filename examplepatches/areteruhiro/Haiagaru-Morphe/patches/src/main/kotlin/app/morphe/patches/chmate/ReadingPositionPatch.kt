package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode

internal fun BytecodePatchContext.patchReadingPosition(version: String) {
    val owner = mutableClassDefBy(if (version == "0.8.10.191 dev") "Lo/pa;"
        else "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val bind = owner.methods.single { it.name == "onViewCreated" && it.parameterTypes.size == 2 }
    bind.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .asReversed().forEach { (index, _) -> bind.addInstructions(index,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/ReadingPosition;->register(Ljava/lang/Object;)V") }
    owner.methods.single { it.name == "onPause" && it.parameterTypes.isEmpty() }.addInstructions(0,
        "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/ReadingPosition;->save(Ljava/lang/Object;)V")
    // The fragment can be resumed without recreating the response list.
    owner.methods.filter { it.name == "onResume" && it.parameterTypes.isEmpty() }.forEach { resume ->
        resume.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .asReversed().forEach { (index, _) -> resume.addInstructions(index,
                "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/ThreadWatchNavigation;->onResume(Ljava/lang/Object;)V") }
    }
}
