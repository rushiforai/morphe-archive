package io.github.sabopura.morphe.patches.twitch.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

/** APKs can contain several shaded copies of Kotlin Unit. Use the one the target actually reads. */
internal fun unitCompletionField(method: Method, resolve: (String) -> ClassDef): FieldReference {
    return method.implementation?.instructions?.toList().orEmpty().mapNotNull {
        if (it.opcode == Opcode.SGET_OBJECT) (it as? ReferenceInstruction)?.reference as? FieldReference else null
    }.distinctBy { it.toString() }.filter { field ->
        if (field.type != field.definingClass) return@filter false
        val type = resolve(field.type)
        AccessFlags.PUBLIC.isSet(type.accessFlags) && type.methods.any { candidate ->
            candidate.name == "toString" && candidate.returnType == "Ljava/lang/String;" && candidate.parameterTypes.isEmpty() &&
                candidate.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "kotlin.Unit"
                } == true
        } && type.staticFields.any { it.name == field.name && it.type == field.type && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    }.uniqueContract("native Kotlin Unit completion field")
}

@Suppress("unused")
val fixLoginPatch = bytecodePatch(
    name = "Fix login",
    description = "Optional workaround for the unsupported app/OS login error after re-signing. Skips Twitch's Play Integrity submission; leave off when login works.",
    default = false,
) {
    compatibleWith(TWITCH_SUPPORTED)
    execute {
        val type = classDefByStrings("play_integrity_setup_begin").uniqueContract("Play Integrity setup class")
        val method = mutableClassDefBy(type).methods.filter { m ->
            val strings = m.implementation?.instructions.orEmpty().mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            }.toSet()
            strings.containsAll(setOf("play_integrity_setup_begin", "play_integrity_setup_success", "play_integrity_setup_failure")) &&
                m.returnType == "Ljava/lang/Object;" && m.parameterTypes.size == 1 &&
                m.parameterTypes[0].startsWith("L") && !AccessFlags.STATIC.isSet(m.accessFlags)
        }.uniqueContract("Play Integrity suspend setup method")
        val singleton = unitCompletionField(method) { classDefBy(it) }
        // Preserve the suspend function's actual completion value, rather than returning null.
        method.addInstructions(0, "sget-object v0, $singleton\nreturn-object v0")
        Logger.getLogger("Sabopura.Login").info("Optional login workaround: 1 setup method $method; native Unit completion")
    }
}
