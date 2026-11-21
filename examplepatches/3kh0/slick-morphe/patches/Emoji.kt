package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val blankEmoji =
    slackPatch("Fix blank emoji names", "Prevent profile crashes caused by blank emoji names.") {
        dependsOn(modMenu)
        execute {
            val errors = setOf("Emoji name is blank", "Unable to transform an empty emoji name to a canonical emoji name")
            val loader =
                findMethod("invokeSuspend") { method ->
                    method.definingClass.startsWith("Lslack/emoji/impl/routine/LoadEmojiRoutine\$") &&
                        method.parameterTypes == listOf("Ljava/lang/Object;") && method.returnType == "Ljava/lang/Object;" &&
                        method.implementation?.instructions?.any {
                            (it.ref as? StringReference)?.string == "Emoji name is blank"
                        } == true
                }
            val failures = loader.indexed { (it.ref as? StringReference)?.string in errors }
            check(failures.size == errors.size) { "Emoji loader validation changed" }
            for ((index, message) in failures) {
                check(message.opcode == Opcode.CONST_STRING || message.opcode == Opcode.CONST_STRING_JUMBO)
                val call = loader.code[index + 1]
                val ref = call.ref as? MethodReference
                check(
                    call.opcode == Opcode.INVOKE_STATIC && ref?.parameterTypes == listOf("Ljava/lang/String;") &&
                        ref.returnType == "V" && (call as FiveRegisterInstruction).registerCount == 1 && call.registerC == message.reg &&
                        loader.code[index + 2].opcode == Opcode.RETURN_OBJECT,
                ) { "Emoji loader exception path changed" }
                // The loader already returns null for missing emoji. Reuse that result for invalid
                // names, including colon-only names that become blank during canonicalization.
                // Replace in place so existing branch targets enter the safe return path.
                loader.replaceInstruction(index, "const/16 v${message.reg}, 0x0")
                loader.replaceInstruction(index + 1, "return-object v${message.reg}")
            }
        }
    }
