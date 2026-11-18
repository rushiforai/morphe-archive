package hooman.morphe.patches.swiftkey.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.writeRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import hooman.morphe.patches.swiftkey.swiftKeyCompatibility
import org.w3c.dom.Element

// The stock value is already false in 9.13.19.3. Keep it explicit in the patched APK, while the
// bytecode patch below prevents a runtime preference override from re-enabling the automatic prompt.
private val disableCloudSignInResourcePatch = resourcePatch(
    description = "Keeps SwiftKey's optional cloud sign-in onboarding disabled. Applied automatically " +
        "with Disable cloud sign-in prompt.",
) {
    compatibleWith(swiftKeyCompatibility)

    execute {
        document("res/values/bools.xml").use { document ->
            val matches = document.getElementsByTagName("bool")
                .let { nodes ->
                    (0 until nodes.length)
                        .mapNotNull { nodes.item(it) as? Element }
                        .filter { it.getAttribute("name") == "onboarding_cloud_sign_in_enabled" }
                }
            val enabled = matches.singleOrNull() ?: throw PatchException(
                "SwiftKey: onboarding_cloud_sign_in_enabled was not found uniquely. The launcher " +
                    "onboarding resources changed for this version.",
            )
            enabled.textContent = "false"
        }
    }
}

@Suppress("unused")
val disableCloudSignInPromptPatch = bytecodePatch(
    name = "Disable cloud sign-in prompt",
    description = "Keeps the optional Microsoft cloud sign-in onboarding from replacing SwiftKey's " +
        "launcher, so local keyboard setup and settings remain usable without an account. This does " +
        "not sign in or unlock cloud sync and other account-backed features.",
) {
    compatibleWith(swiftKeyCompatibility)
    dependsOn(disableCloudSignInResourcePatch)

    execute {
        // 9.13.19.3 inlines the old helper into onCreate. Force just the two
        // automatic prompt decisions off; preserve setup, settings and manual login.
        val method = CloudSignInPromptFingerprint.method
        val strings = mutableMapOf<Int, String>()
        val reads = mutableListOf<Pair<Int, Int>>()
        val instructions = method.instructions.toList()
        instructions.forEachIndexed { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is MethodReference && reference.toString() ==
                "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z") {
                val keyRegister = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerD
                    is RegisterRangeInstruction -> instruction.startRegister + 1
                    else -> throw PatchException("Unsupported SharedPreferences invocation")
                }
                if (strings[keyRegister] == "onboarding_cloud_sign_in_enabled") {
                    val result = instructions.getOrNull(index + 1)
                    if (result?.opcode != Opcode.MOVE_RESULT) throw PatchException("Missing onboarding result")
                    reads += (index + 2) to (result as OneRegisterInstruction).registerA
                }
            }
            val copied = if (instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16))
                strings[(instruction as TwoRegisterInstruction).registerB] else null
            instruction.writeRegister?.let { register ->
                strings.remove(register)
                if (reference is StringReference) strings[register] = reference.string
                else if (copied != null) strings[register] = copied
            }
        }
        if (reads.size != 2) throw PatchException("SwiftKey: expected two launcher cloud-prompt reads; found ${reads.size}")
        reads.asReversed().forEach { (index, register) -> method.addInstructions(index, "const/16 v$register, 0x0") }
    }
}
