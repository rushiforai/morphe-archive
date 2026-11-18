package app.saketh.patches.webnovel.reader

import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.saketh.patches.webnovel.controls.whenEnabled
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val READER = "Lcom/qidian/Int/reader/wengine/NewWReaderActivity;"

private inline fun <reified T> MutableMethod.references(opcode: Opcode): List<T> =
    implementation?.instructions.orEmpty().filter { it.opcode == opcode }.map { (it as ReferenceInstruction).reference as T }

@Suppress("unused")
val disableRewardTimerPatch = patch(
    name = "Disable reader reward timer",
    description = "Adds a switch to hide the reader's corner widget and stop its timer. Reading rewards from this timer stop while disabled.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("disable_reward_timer")
        val reader = mutableClassDefBy(READER)

        // The controller class, its field and its teardown are obfuscated. Derive them from
        // updateFarmingReward, which keeps its name and stores a new controller in that field.
        val farmingReward = reader.methods.single {
            it.name == "updateFarmingReward" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val constructed = farmingReward.references<TypeReference>(Opcode.NEW_INSTANCE).map { it.type }
        val controller = farmingReward.references<FieldReference>(Opcode.IPUT_OBJECT)
            .single { it.definingClass == READER && it.type in constructed }
        val controllerField = "$READER->${controller.name}:${controller.type}"

        // Both native entry points construct the same controller; all other uses are null-safe.
        val creators = reader.methods.filter { method ->
            method.references<TypeReference>(Opcode.NEW_INSTANCE).any { it.type == controller.type }
        }
        check(creators.size == 2 && creators.all { it.parameterTypes.isEmpty() && it.returnType == "V" }) {
            "Expected two no-argument reward-timer entry points, found ${creators.map { it.name }}"
        }

        // The native teardown is the no-argument call made right before the reader clears the field.
        val teardown = reader.methods.flatMap { method ->
            method.implementation?.instructions.orEmpty().zipWithNext().mapNotNull { (call, store) ->
                val target = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
                val stored = (store as? ReferenceInstruction)?.reference
                target.name.takeIf {
                    call.opcode == Opcode.INVOKE_VIRTUAL && target.definingClass == controller.type &&
                        target.parameterTypes.isEmpty() && target.returnType == "V" &&
                        store.opcode == Opcode.IPUT_OBJECT && stored == controller
                }
            }
        }.distinct().single()

        creators.forEach { it.whenEnabled("disableRewardTimer", "return-void") }
        val resume = reader.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() }
        val register = resume.findFreeRegister(0)
        // Dispose an already-open reader's ticker and Handler through its native teardown.
        // Continue the rest of onResume, including independent reading statistics.
        resume.whenEnabled("disableRewardTimer", """
            iget-object v$register, p0, $controllerField
            if-eqz v$register, :original
            invoke-virtual { v$register }, ${controller.type}->$teardown()V
            const/4 v$register, 0x0
            iput-object v$register, p0, $controllerField
        """)
    }
}
