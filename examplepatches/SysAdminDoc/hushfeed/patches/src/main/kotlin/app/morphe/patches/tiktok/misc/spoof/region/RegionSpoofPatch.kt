package app.morphe.patches.tiktok.misc.spoof.region

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.misc.spoof.sim.simSpoofPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/tiktok/spoof/region/RegionSpoof;"
private object RegionService : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/app/services/RegionService;",
    name = "getRegion", parameters = emptyList(), returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val regionSpoofPatch = bytecodePatch(
    name = "Region spoof",
    description = "Matches locale, timezone and native region getters to the SIM preset, with a separate experimental store-region switch.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())
    dependsOn(settingsPatch, simSpoofPatch)
    execute {
        val replacements = mapOf("Ljava/util/Locale;" to "locale", "Ljava/util/TimeZone;" to "timeZone")
        val counts = mutableMapOf<String, Int>()
        classDefForEach { definition ->
            if (definition.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
            definition.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val calls = instructions.withIndex().mapNotNull { (index, instruction) ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
                    val reference = instruction.getReference<MethodReference>() ?: return@mapNotNull null
                    val wrapper = replacements[reference.definingClass] ?: return@mapNotNull null
                    if (reference.name != "getDefault" || reference.returnType != reference.definingClass) return@mapNotNull null
                    val result = instructions.getOrNull(index + 1)
                    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
                    counts[wrapper] = (counts[wrapper] ?: 0) + 1
                    Triple(index + 2, (result as OneRegisterInstruction).registerA, wrapper to reference.returnType)
                }
                if (calls.isNotEmpty()) {
                    val mutable = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)
                    calls.asReversed().forEach { (index, register, target) ->
                        mutable.addInstructions(index, """
                            invoke-static/range { v$register .. v$register }, $EXTENSION->${target.first}(${target.second})${target.second}
                            move-result-object v$register
                        """)
                    }
                }
            }
        }
        val missingWrappers = replacements.values.filter { (counts[it] ?: 0) == 0 }
        if (missingWrappers.isNotEmpty()) {
            throw PatchException(
                "Region spoof: no native ${missingWrappers.joinToString()} getDefault call was found.",
            )
        }

        val hubReference = RegionService.method.implementationOrPatchException("Region spoof")
            .instructions.mapNotNull {
            it.getReference<MethodReference>()
        }.filter { it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() }
            .singleOrPatchException("Region spoof: RegionService string hub call")
        val hub = mutableClassDefBy(hubReference.definingClass)
        val account = mutableClassDefBy("Lcom/ss/android/ugc/aweme/AccountService;")
        val accountSuperclass = account.superclass
            ?: throw PatchException("Region spoof: AccountService has no superclass holding the store region.")
        val store = mutableClassDefBy(accountSuperclass).methods.filter {
            it.name == "getStoreRegionUpperCase" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        }.singleOrPatchException("Region spoof: AccountService store-region getter")
        // Bytecode order is part of this boundary: the getter reads two static String fields,
        // and the first is the store-region value shared with the priority hub getter.
        val storeField = store.implementationOrPatchException("Region spoof").instructions
            .filter { it.opcode == Opcode.SGET_OBJECT }
            .mapNotNull { it.getReference<FieldReference>() }
            .filter { it.type == "Ljava/lang/String;" }
            .firstOrNull() ?: throw PatchException(
            "Region spoof: the store-region getter reads no static String field.",
        )
        val getters = hub.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        }
        if (getters.size != 6) {
            throw PatchException(
                "Region spoof: expected six static String getters in ${hub.type}, found ${getters.size}.",
            )
        }
        val priority = getters.filter { method ->
            method.implementationOrPatchException("Region spoof").instructions.any {
                it.getReference<FieldReference>()?.toString() == storeField.toString()
            }
        }.singleOrPatchException("Region spoof: priority getter reading $storeField")
        (getters + store).forEach { method ->
            val wrapper = if (method == priority || method == store) "storeCountry" else "country"
            val returns = method.implementationOrPatchException("Region spoof").instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
            if (returns.isEmpty()) {
                throw PatchException(
                    "Region spoof: ${method.definingClass}->${method.name} has no String return to wrap.",
                )
            }
            returns.reversed().forEach { (index, register) ->
                    method.addInstructionsAtControlFlowLabel(index, """
                        invoke-static/range { v$register .. v$register }, $EXTENSION->$wrapper(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """)
                }
        }
        SettingsStatusLoadFingerprint.method.addInstruction(0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableRegionSpoof()V")
    }
}
