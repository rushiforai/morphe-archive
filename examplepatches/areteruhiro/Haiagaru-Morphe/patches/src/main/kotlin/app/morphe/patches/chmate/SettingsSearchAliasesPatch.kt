package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Scope aliases to the native preference search, keeping the original registers and labels. */
internal fun BytecodePatchContext.patchSettingsSearchAliases(version: String) {
    if (version !in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.242 dev")) return
    val modern = version == "0.8.10.242 dev"
    val screen = mutableClassDefBy(if (modern)
        "Ljp/syoboi/a2chMate/ui/setting/TwoPaneSettingFragmentViewModel\$ComponentActivity;"
        else "Ljp/syoboi/a2chMate/ui/setting/TowPaneSettingFragmentViewModel;")
    val calls = screen.methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.returnType == "V" && it.parameterTypes.size == (if (modern) 5 else 4) &&
            it.parameterTypes[0] == "Ljava/util/ArrayList;" && it.parameterTypes[1] == "Ljava/util/regex/Matcher;" &&
            it.parameterTypes[3] == "Ljava/util/List;" }.distinctBy { it.toString() }
    check(calls.size == 1) { "Native preference search model changed: $version" }
    val reference = calls.single()
    val model = mutableClassDefBy(reference.definingClass)
    val search = model.methods.single { it.name == reference.name && it.parameterTypes == reference.parameterTypes }
    var resets = 0
    search.implementation!!.instructions.toList().withIndex().forEach { (index, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == "Ljava/util/regex/Matcher;" && ref.name == "reset" &&
            ref.parameterTypes == listOf("Ljava/lang/CharSequence;")) {
            check(instruction.opcode == Opcode.INVOKE_VIRTUAL)
            val call = instruction as FiveRegisterInstruction
            check(call.registerCount == 2)
            search.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, Lapp/morphe/extension/chmate/SettingsSearchTerms;->reset(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;")
            resets++
        }
    }
    check(resets == 3) { "Native preference title/summary/keywords changed: $version ($resets)" }
}
