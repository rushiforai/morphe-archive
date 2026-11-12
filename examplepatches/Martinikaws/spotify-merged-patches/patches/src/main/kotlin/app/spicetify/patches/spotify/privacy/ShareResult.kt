package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val GENERATE_URL_RESPONSE =
    "Lcom/spotify/share/linkgeneration/api/proto/GenerateUrlResponse;"
private const val STRING = "Ljava/lang/String;"

/** Resolve URL semantics from named protobuf fields, not obfuscated model names. */
internal fun findShareResultConstructor(classes: List<ClassDef>): Method {
    val response = classes.singleOrNull { it.type == GENERATE_URL_RESPONSE }
        ?: throw PatchException("Spotify sharing response class is missing or ambiguous.")
    val fieldNames = listOf("shareableUrl_", "shareId_", "spotifyUri_", "fullUrl_")
    val getters = fieldNames.map { fieldName ->
        response.methods.singleOrNull { method ->
            val code = method.implementation?.instructions?.toList().orEmpty()
            val read = code.firstOrNull() as? TwoRegisterInstruction
            val field = (code.firstOrNull() as? ReferenceInstruction)?.reference as? FieldReference
            method.parameterTypes.isEmpty() && method.returnType == STRING &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && code.size == 2 &&
                code[0].opcode == Opcode.IGET_OBJECT && field?.definingClass == response.type &&
                field.name == fieldName && field.type == STRING &&
                read?.registerB == method.implementation!!.registerCount - 1 &&
                code[1].opcode == Opcode.RETURN_OBJECT &&
                (code[1] as OneRegisterInstruction).registerA == read.registerA
        } ?: throw PatchException("Spotify sharing response getter for $fieldName changed.")
    }

    val candidates = mutableListOf<MethodReference>()
    for (clazz in classes) for (method in clazz.methods) {
        val code = method.implementation?.instructions?.toList() ?: continue
        for (index in 8 until code.size) {
            val call = code[index] as? FiveRegisterInstruction ?: continue
            val target = (code[index] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (code[index].opcode != Opcode.INVOKE_DIRECT || call.registerCount != 5 ||
                target.name != "<init>" || target.returnType != "V" ||
                target.parameterTypes != List(4) { STRING }) continue
            val arguments = listOf(call.registerD, call.registerE, call.registerF, call.registerG)
            val receiver = (code[index - 8] as? FiveRegisterInstruction)?.registerC
            val matches = getters.withIndex().all { (argument, getter) ->
                val invoke = code[index - 8 + argument * 2]
                val result = code[index - 7 + argument * 2]
                val registers = invoke as? FiveRegisterInstruction
                val reference = (invoke as? ReferenceInstruction)?.reference as? MethodReference
                invoke.opcode == Opcode.INVOKE_VIRTUAL && registers?.registerCount == 1 &&
                    registers.registerC == receiver && reference == getter &&
                    result.opcode == Opcode.MOVE_RESULT_OBJECT &&
                    (result as OneRegisterInstruction).registerA == arguments[argument] &&
                    // Earlier results cannot overwrite the response or another argument.
                    (argument == 3 || arguments[argument] != receiver)
            }
            if (matches && arguments.toSet().size == 4 && call.registerC !in arguments) candidates += target
        }
    }
    val target = candidates.singleOrNull()
        ?: throw PatchException("Expected one Spotify sharing result construction, found ${candidates.size}.")
    val constructor = classes.single { it.type == target.definingClass }.methods.single { it == target }
    val code = constructor.implementation?.instructions?.toList().orEmpty()
    val superCall = code.firstOrNull() as? FiveRegisterInstruction
    val superMethod = (code.firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference
    if (constructor.implementation?.registerCount != 5 || code.size != 6 ||
        !AccessFlags.CONSTRUCTOR.isSet(constructor.accessFlags) ||
        code[0].opcode != Opcode.INVOKE_DIRECT || superCall?.registerCount != 1 ||
        superCall.registerC != 0 || superMethod?.definingClass != "Ljava/lang/Object;" ||
        superMethod.name != "<init>" || superMethod.parameterTypes.isNotEmpty() ||
        superMethod.returnType != "V" || code[5].opcode != Opcode.RETURN_VOID) {
        throw PatchException("Spotify sharing result constructor changed.")
    }
    val fields = mutableSetOf<String>()
    for (argument in 1..4) {
        val store = code[argument] as? TwoRegisterInstruction
        val field = (code[argument] as? ReferenceInstruction)?.reference as? FieldReference
        if (code[argument].opcode != Opcode.IPUT_OBJECT || store?.registerA != argument ||
            store.registerB != 0 || field?.definingClass != target.definingClass ||
            field.type != STRING || !fields.add(field.name)) {
            throw PatchException("Spotify sharing result argument storage changed.")
        }
    }
    return constructor
}
