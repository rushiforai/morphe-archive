package app.template.patches.easylauncher.misc.reminder

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EASYLAUNCHER
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val ReferenceInstruction.methodReference get() = reference as? MethodReference

@Suppress("unused")
val disableDefaultLauncherReminderPatch = bytecodePatch(
    name = "Disable default launcher reminder",
    description = "Disables the reminder to set the app as default launcher.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    execute {
        // The home role helper is R8-renamed and has two implementations; the RoleManager one
        // calls RoleManager.isRoleHeld("android.app.role.HOME") in its role-held check. Find that
        // check by the framework call instead of its rotating name.
        val roleHeldChecks = mutableSetOf<Pair<String, String>>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) continue
                val callsIsRoleHeld = method.implementation?.instructions?.any { instruction ->
                    val call = (instruction as? ReferenceInstruction)?.methodReference
                    call?.definingClass == ROLE_MANAGER && call.name == ROLE_MANAGER_IS_ROLE_HELD
                } == true
                if (!callsIsRoleHeld) continue
                roleHeldChecks += classDef.type to method.name
                classDef.superclass?.let { roleHeldChecks += it to method.name }
            }
        }
        if (roleHeldChecks.isEmpty()) throw PatchException("No ()Z method calls $ROLE_MANAGER.$ROLE_MANAGER_IS_ROLE_HELD")

        // In the worker, report the home role as held right after that check, so it takes its own
        // "already held" path: cancel the reminder notification and finish.
        HomeRoleReminderWorkFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val checks = instructions.indices.filter { index ->
                val call = (instructions[index] as? ReferenceInstruction)?.methodReference
                instructions[index].opcode == Opcode.INVOKE_VIRTUAL && call != null &&
                    call.returnType == "Z" && call.parameterTypes.isEmpty() &&
                    (call.definingClass to call.name) in roleHeldChecks
            }
            val check = checks.singleOrNull()
                ?: throw PatchException("Expected one role-held check in $definingClass.$name, found ${checks.size}")
            val moveResult = instructions.getOrNull(check + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
                ?: throw PatchException("The role-held check in $definingClass.$name is not followed by move-result")
            addInstructionsChecked(check + 2, "const/4 v${moveResult.registerA}, 0x1")
        }
    }
}
