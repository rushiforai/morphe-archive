package app.template.patches.ninegag.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG

val hidePromotedPostsPatch = bytecodePatch(
    description = "Uses the existing feed query filter to hide promoted posts."
) {
    compatibleWith(COMPATIBILITY_NINEGAG)

    execute {
        val candidates = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.filter { method ->
                classDef.type == "Lhx3;" && method.name == "j" &&
                    method.returnType == "Ljava/util/List;" &&
                    method.parameterTypes.map { it.toString() } ==
                        listOf("I", "Ljava/lang/String;", "Z") &&
                    method.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)
            }.forEach { candidates += classDef to it }
        }
        check(candidates.size == 1) {
            "Expected exactly one 9GAG 8.23.0 promoted-post display query; found ${candidates.size}."
        }
        val (classDef, method) = candidates.single()
        val implementation = checkNotNull(method.implementation)
        val instructions = implementation.instructions.toList()
        val references = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
        check(
            implementation.registerCount == 10 && instructions.size == 30 &&
                instructions[1].opcode == Opcode.IF_EQZ &&
                (instructions[1] as? OneRegisterInstruction)?.registerA == 9 &&
                (instructions[2] as? NarrowLiteralInstruction)?.narrowLiteral == 2 &&
                references.filterIsInstance<FieldReference>().any {
                    it.definingClass == "Lcom/ninegag/android/app/model/newdb/GagListItemDao\$Properties;" &&
                        it.name == "LocalInsertOrder"
                } &&
                references.filterIsInstance<StringReference>().any { it.string == " ASC" } &&
                instructions.filterIsInstance<NarrowLiteralInstruction>().any { it.narrowLiteral == 1000 } &&
                references.filterIsInstance<MethodReference>().count {
                    it.definingClass == "Lhx3;" && it.name == "d" && it.returnType == "Lwm7;" &&
                        it.parameterTypes.map { type -> type.toString() } ==
                            listOf("I", "Ljava/lang/String;", "I", "I", "Z")
                } == 1
        ) { "9GAG's promoted-post display query no longer has the validated 8.23.0 structure." }

        // The Boolean p3 is the display query's hide-promoted option. The existing
        // code maps true to Promoted <> TRUE before applying its original order,
        // offset and limit. Do not modify d(): it is also used for DB maintenance.
        mutableClassDefBy(classDef).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes == method.parameterTypes
        }.addInstruction(0, "const/4 p3, 0x1")
    }
}
