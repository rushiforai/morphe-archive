package suchi.morphe.patches.shared.microg

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import suchi.morphe.patches.renshuu.renshuuCompatibility
import suchi.morphe.patches.duchinese.duChineseCompatibility
import suchi.morphe.patches.pimsleur.pimsleurCompatibility
import suchi.morphe.patches.teuida.patchTeuidaCredentialManager
import suchi.morphe.patches.teuida.teuidaCompatibility

private data class MicroGTarget(
    val compatibility: Compatibility,
    val utilClass: String = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    val utilMethod: String = "isGooglePlayServicesAvailable",
    val apiClass: String = "Lcom/google/android/gms/common/GoogleApiAvailabilityLight;",
    val apiMethod: String = "isGooglePlayServicesAvailable",
)

private val targets = listOf(
    MicroGTarget(renshuuCompatibility),
    MicroGTarget(duChineseCompatibility, "LY5/n;", "f", "LY5/k;", "h"),
    MicroGTarget(pimsleurCompatibility),
    MicroGTarget(teuidaCompatibility),
)

@Suppress("unused")
val microGSupportPatch = bytecodePatch(
    name = "MicroG integration",
    description = "Experimental native Google-service routing through app.revanced.android.gms. " +
        "Requires MicroG; sign-in and notification delivery need device verification.",
    default = false,
) {
    compatibleWith(*targets.map { it.compatibility }.toTypedArray())
    dependsOn(microGSupportResourcePatch)

    execute {
        val target = targets.singleOrNull { it.compatibility.packageName == packageMetadata.packageName }
            ?: throw PatchException("MicroG integration has no verified target for this package.")
        val availabilityMethod = Fingerprint(
            definingClass = target.utilClass,
            name = target.utilMethod,
            returnType = "I",
            parameters = listOf("Landroid/content/Context;", "I"),
        ).method
        val apiAvailabilityMethod = Fingerprint(
            definingClass = target.apiClass,
            name = target.apiMethod,
            returnType = "I",
            parameters = listOf("Landroid/content/Context;", "I"),
        ).methodOrNull
        var gmsPackageReferences = 0
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach methodLoop@{ method ->
                val implementation = method.implementation ?: return@methodLoop
                val mutableMethod by lazy {
                    mutableClass.methods.first { MethodUtil.methodSignaturesMatch(it, method) }
                }
                implementation.instructions.forEachIndexed instructionLoop@{ index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) return@instructionLoop
                    val value = ((instruction as ReferenceInstruction).reference as StringReference).string
                    val replacement = microGStringReplacement(value) ?: return@instructionLoop
                    if (value == "com.google.android.gms") gmsPackageReferences++
                    val register = (instruction as OneRegisterInstruction).registerA
                    val reference = ImmutableStringReference(replacement)
                    mutableMethod.replaceInstruction(
                        index,
                        if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                        },
                    )
                }
            }
        }
        if (gmsPackageReferences == 0) {
            throw PatchException("Google Play Services package references were not found.")
        }

        if (target.compatibility.packageName == teuidaCompatibility.packageName) {
            patchTeuidaCredentialManager(this)
        }

        availabilityMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        apiAvailabilityMethod?.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
