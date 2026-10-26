package io.github.pengusto.patches.contacts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val mergedFieldsPatch = bytecodePatch(
    name = "Show emails and notes from merged contacts",
    description = "Include duplicate contact emails and notes in the detail view without changing stored contact records.", default = true
) {
    compatibleWith(Compatibility(name = "Fossify Contacts", packageName = "org.fossify.contacts", targets = listOf(AppTarget(version = "1.6.0"))))
    extendWith("extensions/extension.mpe")
    execute {
        for ((methodName, index, getter, returnType, helper) in listOf(
            listOf("H4", "9", "F", "Ljava/util/ArrayList;", "emails"),
            listOf("a5", "5", "T", "Ljava/lang/String;", "notes")
        )) {
            val method = Fingerprint(definingClass = "Lorg/fossify/contacts/activities/ViewContactActivity;", name = methodName, returnType = "V", parameters = emptyList()).method
            val code = method.implementation!!.instructions
            val offset = index.toInt()
            check((code[offset - 2] as? ReferenceInstruction)?.reference.toString() == "Le5/l;->$getter()$returnType") { "Unsupported Contacts field binding" }
            method.addInstructionsWithLabels(offset, """
                invoke-direct {p0}, Lorg/fossify/contacts/activities/ViewContactActivity;->W3()Z
                move-result v1
                if-eqz v1, :original
                iget-object v1, p0, Lorg/fossify/contacts/activities/ViewContactActivity;->s0:Ljava/util/ArrayList;
                invoke-static {v0, v1}, Lio/github/pengusto/patches/extension/contacts/MergedFields;->${helper}(${returnType}Ljava/util/ArrayList;)${returnType}
                move-result-object v0
            """.trimIndent(), ExternalLabel("original", code[offset]))
            val bridge = Fingerprint(definingClass = "Lio/github/pengusto/patches/extension/contacts/MergedFields;", name = helper + "Of", returnType = returnType, parameters = listOf("Ljava/lang/Object;")).method
            bridge.removeInstructions(0, bridge.implementation!!.instructions.size)
            bridge.addInstructions(0, """
                check-cast p0, Le5/l;
                invoke-virtual {p0}, Le5/l;->$getter()$returnType
                move-result-object p0
                return-object p0
            """.trimIndent())
        }
    }
}
