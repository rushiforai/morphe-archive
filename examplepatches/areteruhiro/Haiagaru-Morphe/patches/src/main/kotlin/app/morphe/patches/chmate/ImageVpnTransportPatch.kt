package app.morphe.patches.chmate

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val imageVpnTransportPatch = bytecodePatch {
    dependsOn(haiagaruPatch)
    execute {
        var count = 0
        boundClassForEach("ImageVpnTransportPatch:1") { definition ->
            if (definition.type.startsWith("Lapp/morphe/extension/")) return@boundClassForEach
            definition.methods.forEach methodLoop@ { method ->
                val code = method.implementation?.instructions?.toList() ?: return@methodLoop
                val literals = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                if ("scheme == null" !in literals || "host == null" !in literals
                    || method.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)
                    || !method.returnType.startsWith("L")) return@methodLoop
                val urlClass = mutableClassDefBy(method.returnType)
                check(urlClass.methods.any {
                    AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == urlClass.type
                        && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
                }) { "Image VPN: no validated URL parser in ${urlClass.type}" }
                val mutable = mutableClassDefBy(definition).findMutableMethodOf(method)
                code.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed().forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    mutable.addInstructions(index, """
                        invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/ImageVpnController;->routeHttpUrl(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, ${method.returnType}
                    """.trimIndent())
                }
                count++
            }
        }
        check(count > 0) { "Image VPN: no native HTTP URL builder found" }
        println("Image VPN: protected target routing in $count native URL builders")
    }
}
