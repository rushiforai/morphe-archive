package patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Only server-owned section labels are eligible; entity titles and search input are excluded. */
internal val vietnameseUiLabelsPatch = bytecodePatch {
    dependsOn(originalInput)
    extendWith("extensions/soundcloud.mpe")
    execute {
        fun fieldKey(field: FieldReference) = "${field.definingClass}->${field.name}:${field.type}"
        // Verified display-only fields for SoundCloud 2026.11.02. Never read entity titles,
        // identifiers, links or search input. Keep domain/cache values in their original language.
        val fieldsByModel = mapOf(
            "sdui/components/SDUIView\$Header" to listOf("b", "c"),
            "sdui/components/SDUIView\$Banner" to listOf("b", "c"),
            "sdui/components/HeaderAction" to listOf("b"),
            "sdui/components/FilterAction" to listOf("b"),
            "sdui/components/BannerAction" to listOf("b"),
            "sdui/components/ShortcutAction" to listOf("b"),
            "sdui/components/supportingmodels/CarouselItem" to listOf("b"),
            "sections/ui/models/SectionItem\$Header" to listOf("b", "c"),
            "sections/ui/models/SectionItem\$Headline" to listOf("b"),
            "sections/ui/models/SectionItem\$PageHeader" to listOf("b"),
            "sections/domain/Choice" to listOf("b"),
            "sections/domain/Pill" to listOf("b"),
            "sections/domain/LinkAction" to listOf("b"),
            "sections/domain/CarouselMetadata" to listOf("a", "b"),
        )
        val displayFields = mutableMapOf<String, String>()
        val models = fieldsByModel.keys.map { "Lcom/soundcloud/android/$it;" }.toSet()
        for ((model, names) in fieldsByModel) {
            val type = "Lcom/soundcloud/android/$model;"
            val klass = classDefBy(type)
            for (name in names) {
                val field = klass.fields.singleOrNull { it.name == name && it.type == "Ljava/lang/String;" }
                    ?: throw PatchException("SoundCloud display field changed: $type->$name")
                displayFields[fieldKey(field)] = if (model == "sections/domain/Choice") "translateChoice" else "translate"
            }
        }

        // Translate at the consumer, leaving JSON/cache objects untouched when locales change.
        data class Hook(val index: Int, val register: Int, val function: String)
        val targets = mutableListOf<Pair<Method, List<Hook>>>()
        classDefForEach { klass ->
            if (klass.type !in models && !klass.type.contains("/data/") && !klass.type.contains("/domain/") &&
                !klass.type.startsWith("Lcom/fasterxml/") && !klass.type.startsWith("Lnl/")) {
                for (method in klass.methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    val hooks = mutableListOf<Hook>()
                    for ((index, instruction) in instructions.withIndex()) {
                        val reference = (instruction as? ReferenceInstruction)?.reference
                        if (instruction.opcode == Opcode.IGET_OBJECT && reference is FieldReference) {
                            displayFields[fieldKey(reference)]?.let { function ->
                                hooks += Hook(index + 1, (instruction as TwoRegisterInstruction).registerA, function)
                            }
                        }
                    }
                    if (hooks.isNotEmpty()) targets += method to hooks
                }
            }
        }
        var hooked = 0
        for ((method, hooks) in targets) {
            val mutable = mutableClassDefBy(method.definingClass).methods.single {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }
            for (hook in hooks.sortedByDescending { it.index }) {
                val register = "v${hook.register}"
                mutable.addInstructions(hook.index, """
                    invoke-static/range {$register .. $register}, Lnl/johninnl/soundcloud/VietnameseLabels;->${hook.function}(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object $register
                """.trimIndent())
                hooked++
            }
        }
        if (hooked < 10) throw PatchException("SoundCloud UI label consumers changed ($hooked)")
    }
}
