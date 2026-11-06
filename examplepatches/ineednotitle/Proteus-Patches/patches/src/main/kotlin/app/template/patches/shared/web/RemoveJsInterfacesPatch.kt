package app.template.patches.shared.web
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal "Remove JavaScript bridges" patch: NOPs every
// WebSettings.addJavascriptInterface(Object, String) call (void return, so a
// plain NOP is safe). Fail-safe; default = false (some web logins need it).

private const val WEB_SETTINGS = "Landroid/webkit/WebSettings;"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val removeJsInterfacesPatch = bytecodePatch(
    name = "WebView: remove JavaScript interface objects",
    description = """
        Removes addJavascriptInterface bridges from the app's WebViews so loaded web
        content cannot invoke injected Java objects.

        Applies to any app. Web flows that depend on the bridge (some logins) may break.
    """.trimIndent(),
    default = false,
) {
    execute {
        var patched = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != WEB_SETTINGS ||
                        reference.name != "addJavascriptInterface" ||
                        reference.returnType != "V"
                    ) return@forEachIndexed

                    replacements[index] = "nop"
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (i, smali) -> method.replaceInstruction(i, smali) }
                    patched += replacements.size
                }
            }
        }

        logUniversal("Remove JS interfaces: $patched addJavascriptInterface call(s) NOPed.")
    }
}
