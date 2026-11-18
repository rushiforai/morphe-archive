package patches.bol.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal sealed interface ModelValue {
    data object Null : ModelValue
    data object EmptyList : ModelValue
    data object False : ModelValue
    data class OptionalFalse(val presentType: String) : ModelValue
    data class Filter(val method: String) : ModelValue
    data class EmptyListIfSponsored(val flag: String) : ModelValue
    data class StaticField(val reference: FieldReference) : ModelValue
}

internal fun modelFingerprint(anchor: String) = Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(), strings = listOf(anchor),
)

/** Patch the stored data, including cache reconstruction and copies, without hiding the sponsored label alone. */
context(context: BytecodePatchContext)
internal fun clearModelFields(
    anchor: String,
    fields: Map<String, ModelValue>,
    expected: IntRange = 1..1,
    extraAnchor: String? = null,
) {
    Fingerprint(name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOfNotNull(anchor, extraAnchor)).matchAll(expected).forEach { match ->
        // Field names are the inspected 430517 binding, guarded by semantic model anchors and exact types.
        // Do not infer helper argument order from toString(): R8 permutes append-helper arguments.
        val resolved = fields.mapKeys { (name, _) ->
            match.classDef.fields.singleOrNull { it.name == name }
                ?: error("Missing field $name in $anchor (${match.classDef.type})")
        }
        var constructors = 0
        match.classDef.methods.filter { it.name == "<init>" }.forEach constructorLoop@ { constructor ->
            val stores = constructor.instructions.filter {
                it.opcode in setOf(Opcode.IPUT, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN) && it.getReference<FieldReference>()?.definingClass == match.classDef.type
            }.toList()
            // A delegating synthetic constructor is already covered by its real constructor.
            if (stores.isEmpty()) return@constructorLoop
            constructors++
            val thisRegister = (stores.last() as TwoRegisterInstruction).registerB
            val (value, auxiliary) = (0 until 16).filter { it != thisRegister }.take(2)
            val replacement = resolved.entries.joinToString("\n") { (field, neutral) ->
                val reference = "${field.definingClass}->${field.name}:${field.type}"
                when (neutral) {
                    is ModelValue.StaticField -> {
                        val source = neutral.reference
                        require(field.type == source.type)
                        "sget-object v$value, ${source.definingClass}->${source.name}:${source.type}\n" +
                            "iput-object v$value, v$thisRegister, $reference"
                    }
                    ModelValue.Null -> {
                        require(field.type.startsWith("L") || field.type.startsWith("[")) { "Non-reference $reference" }
                        "const/4 v$value, 0x0\niput-object v$value, v$thisRegister, $reference"
                    }
                    ModelValue.EmptyList -> {
                        require(field.type == "Ljava/util/List;") { "Non-list $reference" }
                        "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;\n" +
                            "move-result-object v$value\niput-object v$value, v$thisRegister, $reference"
                    }
                    ModelValue.False -> {
                        require(field.type == "Z") { "Non-boolean $reference" }
                        "const/4 v$value, 0x0\niput-boolean v$value, v$thisRegister, $reference"
                    }
                    is ModelValue.OptionalFalse ->
                        "new-instance v$value, ${neutral.presentType}\n" +
                            "sget-object v$auxiliary, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n" +
                            "invoke-direct {v$value, v$auxiliary}, ${neutral.presentType}-><init>(Ljava/lang/Object;)V\n" +
                            "iput-object v$value, v$thisRegister, $reference"
                    is ModelValue.Filter -> {
                        require(field.type == "Ljava/util/List;")
                        "iget-object v$value, v$thisRegister, $reference\n" +
                            "invoke-static {v$value}, ${neutral.method}(Ljava/util/List;)Ljava/util/List;\n" +
                            "move-result-object v$value\niput-object v$value, v$thisRegister, $reference"
                    }
                    is ModelValue.EmptyListIfSponsored -> {
                        require(field.type == "Ljava/util/List;")
                        val flag = match.classDef.fields.single { it.name == neutral.flag }
                        val load = when (flag.type) {
                            "Z" -> "iget-boolean v$value, v$thisRegister, ${flag.definingClass}->${flag.name}:Z"
                            "Ljava/lang/Boolean;" ->
                                "sget-object v$value, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\n" +
                                    "iget-object v$auxiliary, v$thisRegister, ${flag.definingClass}->${flag.name}:${flag.type}\n" +
                                    "invoke-virtual {v$value, v$auxiliary}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z\nmove-result v$value"
                            else -> error("Unexpected sponsored flag ${flag.type}")
                        }
                        "$load\nif-eqz v$value, :keep_${field.name}\n" +
                            "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;\n" +
                            "move-result-object v$value\niput-object v$value, v$thisRegister, $reference\n:keep_${field.name}\nnop"
                    }
                }
            }
            constructor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach { constructor.addInstructionsAtControlFlowLabel(it, replacement) }
        }
        require(constructors > 0) { "No stored constructor fields for $anchor" }
    }
}
