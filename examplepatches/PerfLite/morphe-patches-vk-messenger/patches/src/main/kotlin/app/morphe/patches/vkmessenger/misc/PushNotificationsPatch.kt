package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vkmessenger/push/FirebaseSpoof;"
private const val PACKAGE_HEADER = "X-Android-Package"
private val HEADER_SETTERS = setOf("addRequestProperty", "setRequestProperty")

@Suppress("unused")
val pushNotificationsPatch = bytecodePatch(
    name = "Fix push notifications",
    description = "Sends the official package name and signing certificate in Firebase requests, " +
        "so a re-signed or cloned app gets an FCM token and receives push notifications in the background.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

    extendWith("extensions/vkmessenger.mpe")

    execute {
        val originalPackage = packageMetadata.packageName

        mutableClassDefBy(EXTENSION_CLASS).methods.single { it.name == "originalPackageName" }.addInstructions(
            0,
            """
                const-string v0, "$originalPackage"
                return-object v0
            """
        )

        // Every Firebase client that identifies the app to Google sets X-Android-Package
        // next to X-Android-Cert: installations, remote config and so on.
        var patched = 0
        classDefByStrings(PACKAGE_HEADER).forEach { classDef ->
            if (classDef.type == EXTENSION_CLASS) return@forEach
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val setsHeader = instructions.any {
                    it.opcode == Opcode.CONST_STRING &&
                        ((it as Instruction21c).reference as StringReference).string == PACKAGE_HEADER
                }
                if (!setsHeader) return@forEach

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed
                    val reference = (instruction as ReferenceInstruction).reference as MethodReference
                    if (reference.name !in HEADER_SETTERS || reference.parameterTypes.size != 2) return@forEachIndexed
                    if (!reference.definingClass.endsWith("URLConnection;")) return@forEachIndexed

                    val registers = instruction as FiveRegisterInstruction
                    method.replaceInstruction(
                        index,
                        "invoke-static { v${registers.registerC}, v${registers.registerD}, v${registers.registerE} }, " +
                            "$EXTENSION_CLASS->${reference.name}(Ljava/net/URLConnection;Ljava/lang/String;Ljava/lang/String;)V"
                    )
                    patched++
                }
            }
        }
        if (patched == 0) throw IllegalStateException("No Firebase request sets $PACKAGE_HEADER")
        println("PushPatch: rewrote $patched Firebase header call(s)")
    }
}
