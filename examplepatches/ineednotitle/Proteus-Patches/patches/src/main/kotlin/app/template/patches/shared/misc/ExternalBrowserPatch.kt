package app.template.patches.shared.misc
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal "Prefer external browser over Custom Tabs" patch: rewrites
// CustomTabsIntent.launchUrl(Context, String|Uri) call sites into
// ACTION_VIEW + startActivity, using a free register for scratch. Fail-safe
// (site skipped if no free register); default = false.

private const val CUSTOM_TABS_INTENT = "Landroidx/browser/customtabs/CustomTabsIntent;"
private const val CONTEXT_CLASS = "Landroid/content/Context;"
private const val INTENT_CLASS = "Landroid/content/Intent;"
private const val URI_CLASS = "Landroid/net/Uri;"
private const val ACTION_VIEW = "android.intent.action.VIEW"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val externalBrowserPatch = bytecodePatch(
    name = "Prefer external browser over Custom Tabs",
    description = """
        Opens links in the default external browser instead of an in-app Custom Tab,
        by rewriting CustomTabsIntent.launchUrl call sites into ACTION_VIEW intents.

        Applies to any app. Some apps rely on the Custom Tab session (shared cookies,
        return results) and may misbehave.
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
                    if (instruction !is FiveRegisterInstruction) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != CUSTOM_TABS_INTENT ||
                        reference.name != "launchUrl" ||
                        reference.returnType != "V"
                    ) return@forEachIndexed

                    val thisReg = instruction.registerC
                    val contextReg = instruction.registerD
                    val urlReg = instruction.registerE

                    val urlIsString = reference.parameterTypes == listOf(CONTEXT_CLASS, "Ljava/lang/String;")
                    val urlIsUri = reference.parameterTypes == listOf(CONTEXT_CLASS, URI_CLASS)
                    if (!urlIsString && !urlIsUri) return@forEachIndexed

                    // Use fresh scratch registers instead of overwriting the CustomTabsIntent
                    // receiver (thisReg), which may still be live after this call.
                    // String URLs need a third register for the parsed Uri.
                    val scratchRegisters = try {
                        val provider = method.getFreeRegisterProvider(
                            index,
                            if (urlIsString) 3 else 2,
                            listOf(thisReg, contextReg, urlReg),
                        )
                        List(if (urlIsString) 3 else 2) { provider.getFreeRegister() }
                    } catch (_: RuntimeException) {
                        return@forEachIndexed // fail-safe: leave this site stock
                    }

                    val actionReg = scratchRegisters[0]
                    val intentReg = scratchRegisters[1]
                    val uriArgReg = if (urlIsString) scratchRegisters[2] else urlReg

                    val body = buildList {
                        if (urlIsString) {
                            add("invoke-static {v$urlReg}, $URI_CLASS->parse(Ljava/lang/String;)$URI_CLASS")
                            add("move-result-object v$uriArgReg")
                        }
                        add("const-string v$actionReg, \"$ACTION_VIEW\"")
                        add("new-instance v$intentReg, $INTENT_CLASS")
                        add(
                            "invoke-direct {v$intentReg, v$actionReg, v$uriArgReg}, " +
                                "$INTENT_CLASS-><init>(Ljava/lang/String;$URI_CLASS)V",
                        )
                        add(
                            "invoke-virtual {v$contextReg, v$intentReg}, " +
                                "$CONTEXT_CLASS->startActivity($INTENT_CLASS)V",
                        )
                    }.joinToString("\n")

                    replacements[index] = body
                    patched++
                }

                if (replacements.isNotEmpty()) {
                    // Descending order keeps earlier indices valid while each replacement
                    // expands the method by several instructions.
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstructions(index, smali) }
                }
            }
        }

        logUniversal("External browser: $patched CustomTabsIntent.launchUrl call site(s) rewritten.")
    }
}
