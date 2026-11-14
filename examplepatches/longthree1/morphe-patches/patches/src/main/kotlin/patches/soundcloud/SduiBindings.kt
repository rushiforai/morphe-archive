package patches.soundcloud

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Resolve JSON property -> stored field from the actual constructor, including R8 register moves. */
context(context: BytecodePatchContext)
internal fun bindSduiHomeModels() {
    val models = mapOf(
        "ApiSDUIResponse" to setOf("homeSdui"),
        "ApiSDUIData" to setOf("sections"),
        "ApiSDUIMetadataResult" to setOf("result"),
        "ApiSDUISuggestionResult" to setOf("result"),
        "ApiSDUIEntity\$Track" to setOf("urn", "trackTitle", "trackArtworkUrlTemplate", "trackUser"),
        "ApiSDUIEntity\$Playlist" to setOf("urn", "playlistTitle", "playlistArtworkUrlTemplate", "playlistUser"),
        "ApiSDUIEntity\$User" to setOf("urn", "username", "avatarUrl", "userAvatarUrlTemplate"),
        "ApiSDUIEntity\$Repost" to setOf("target"),
    ) + listOf("Carousel", "ContentWall", "Pair", "Suggestions", "UpdateCarousel", "RepostCarousel", "Gallery", "ListPreview").associate {
        "ApiSDUISection\$$it" to setOf("title", "subtitle", "results")
    } + mapOf(
        "ApiSDUISection\$Single" to setOf("title", "subtitle", "result"),
        "ApiSDUISection\$ListPreview" to setOf("title", "subtitle", "main", "results"),
        "ApiSDUISection\$PromoCarousel" to setOf("title", "subtitle", "mainResult", "results"),
    )
    val body = StringBuilder("if-eqz p0, :missing\n")
    var index = 0
    for ((model, required) in models) {
        val type = "Lcom/soundcloud/android/sdui/data/apidata/$model;"
        val klass = context.classDefBy(type)
        val fields = mutableMapOf<String, FieldReference>()
        for (constructor in klass.methods.filter { it.name == "<init>" && it.implementation != null }) {
            val impl = constructor.implementation!!
            val words = constructor.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
            var register = impl.registerCount - words
            val properties = mutableMapOf<Int, String>()
            for (parameter in constructor.parameters) {
                val property = parameter.annotations.singleOrNull { it.type == "Lcom/fasterxml/jackson/annotation/JsonProperty;" }
                    ?.elements?.singleOrNull { it.name == "value" }?.value as? StringEncodedValue
                if (property != null) properties[register] = property.value
                register += if (parameter.type in listOf("J", "D")) 2 else 1
            }
            for (instruction in impl.instructions) {
                val pair = instruction as? TwoRegisterInstruction
                val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (instruction.opcode == Opcode.IPUT_OBJECT && pair != null && ref?.definingClass == type) {
                    properties[pair.registerA]?.let { property ->
                        if (property in required && ref.type.startsWith("L")) fields[property] = ref
                    }
                } else if (instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) && pair != null) {
                    val property = properties[pair.registerB]
                    properties.remove(pair.registerA)
                    if (property != null) properties[pair.registerA] = property
                } else if (instruction.opcode.setsRegister() && instruction is OneRegisterInstruction) {
                    properties.remove(instruction.registerA)
                }
            }
        }
        val needed = required
        if (!fields.keys.containsAll(needed)) throw PatchException("SoundCloud SDUI fields changed: $model ${needed - fields.keys}")
        for (property in needed) {
            val field = fields.getValue(property)
            if (klass.fields.none { it.name == field.name && AccessFlags.PUBLIC.isSet(it.accessFlags) })
                throw PatchException("SoundCloud SDUI field is no longer accessible: $field")
            val next = "next_${index++}"
            body.append("""
                instance-of v0, p0, $type
                if-eqz v0, :$next
                const-string v1, "$property"
                invoke-virtual { v1, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :$next
                move-object v0, p0
                check-cast v0, $type
                iget-object v0, v0, $field
                return-object v0
                :$next
            """.trimIndent()).append('\n')
        }
    }
    body.append(":missing\nconst/4 v0, 0x0\nreturn-object v0")
    val owner = "Lnl/johninnl/soundcloud/SduiHomeMapper;"
    val extension = context.mutableClassDefBy(owner)
    extension.methods.removeAll { it.name == "value" }
    extension.methods.add(MutableMethod(ImmutableMethod(owner, "value", listOf("Ljava/lang/Object;", "Ljava/lang/String;").map {
        ImmutableMethodParameter(it, emptySet(), null)
    }, "Ljava/lang/Object;", AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, body.toString()) })
}
