package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun BytecodePatchContext.patchRestoredDatRows() {
    val responseLists = mutableSetOf<String>()
    boundClassForEach("RestoredDatRowsPatch:1") { type ->
        if (type.fields.any { it.name == "mBase" && it.type == type.type } &&
            type.fields.any { it.name == "title" && it.type == "Ljava/lang/String;" }) {
            responseLists.add(type.type)
        }
    }
    val readers = mutableListOf<Pair<String, com.android.tools.smali.dexlib2.iface.Method>>()
    boundClassForEach("RestoredDatRowsPatch:2") { type ->
        type.methods.filter { method ->
            method.returnType in responseLists &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/io/File;", "I") &&
            method.implementation?.instructions?.any {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Ljava/io/FileInputStream;" && ref.name == "<init>"
            } == true
        }.forEach { readers.add(type.type to it) }
    }
    check(readers.size == 1) { "Native DAT row reader mismatch: ${readers.size}" }
    val (owner, reader) = readers.single()
    // 191 uses a static reader; 226/242 place it on the list's Kotlin companion.
    val fileParameter = if (reader.accessFlags and 8 != 0) "p0" else "p1"
    mutableClassDefBy(owner).methods.single { it.name == reader.name && it.parameterTypes == reader.parameterTypes }
        .addInstructions(0, "invoke-static/range {$fileParameter .. $fileParameter}, Lapp/morphe/extension/chmate/RestoredDatRows;->prepare(Ljava/io/File;)V")
}
