package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Replace only a render-local body copy, before both text layout and URL scanning.
 * Never change response-model fields, stored DAT, posting, or NG evaluation.
 */
internal fun BytecodePatchContext.patchStringReplacement() {
    val (model, body) = when (packageMetadata.versionName) {
        "0.8.10.191 dev" -> "Lo/processAdDisplayErrorPostbackForUserError;" to "c"
        "0.8.10.226 dev" -> "Lo/BouncyCastleSocketAdapterCompanion;" to "d"
        "0.8.10.241" -> "Lo/setDislikeWidth;" to "g"
        "0.8.10.242 dev" -> "Lo/KeJ11;" to "h"
        else -> return
    }
    var methodsPatched = 0
    var sitesPatched = 0
    classDefForEach { klass ->
        if (!klass.type.startsWith("Lo/")) return@classDefForEach
        klass.methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            // Response row rendering has a dedicated five-argument URL scanner.
            // This excludes model constructors, attachment extractors and NG routines.
            val rendersLinks = instructions.any { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref != null && ref.returnType == "V" && ref.parameterTypes.size == 5
                    && ref.parameterTypes[2].toString() == "Ljava/lang/String;"
                    && ref.parameterTypes[4].toString() == "Z"
            }
            if (!rendersLinks) return@forEach
            val sites = instructions.mapIndexedNotNull { index, instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (instruction.opcode == Opcode.IGET_OBJECT && field?.definingClass == model
                    && field.name == body && field.type == "Ljava/lang/String;")
                    index to (instruction as TwoRegisterInstruction).registerA else null
            }
            if (sites.isEmpty()) return@forEach
            val mutable = mutableClassDefBy(klass).methods.single {
                it.name == method.name && it.parameterTypes == method.parameterTypes
                    && it.returnType == method.returnType
            }
            sites.asReversed().forEach { (index, register) ->
                mutable.addInstructionsWithLabels(index + 1, """
                    invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/StringReplacement;->apply(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """.trimIndent())
            }
            methodsPatched++
            sitesPatched += sites.size
        }
    }
    check(methodsPatched in 1..4) { "Replacement body renderer anchor not found/unexpected: $methodsPatched" }
    println("ReplaceStr rendering: $methodsPatched methods, $sitesPatched body reads (${packageMetadata.versionName})")
}
