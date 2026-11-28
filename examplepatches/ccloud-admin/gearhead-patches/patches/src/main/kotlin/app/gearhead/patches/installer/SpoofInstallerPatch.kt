package app.gearhead.patches.installer

import app.gearhead.patches.shared.Constants.COMPATIBILITY_ANDROID_AUTO
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/gearhead/extension/InstallerSpoof;"
private const val EXTENSION_PACKAGE = "Lapp/gearhead/extension/"

/**
 * An installer-source API call inside Android Auto, and the static extension method that
 * replaces it. The extension method takes the original receiver as its first parameter
 * followed by the original parameters, so the call keeps exactly the same registers.
 */
private class SpoofedCall(
    val definingClass: String,
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
    val extensionDescriptor: String,
) {
    fun matches(reference: MethodReference) =
        reference.definingClass == definingClass &&
            reference.name == name &&
            reference.returnType == returnType &&
            reference.parameterTypes.map { it.toString() } == parameterTypes
}

private val spoofedCalls = listOf(
    // Android 11+ (API 30+): Android Auto reads who started the install.
    SpoofedCall(
        definingClass = "Landroid/content/pm/InstallSourceInfo;",
        name = "getInitiatingPackageName",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
        extensionDescriptor = "$EXTENSION_CLASS->getInitiatingPackageName(Ljava/lang/Object;)Ljava/lang/String;",
    ),
    // Android 10 and older, and any remaining legacy code paths.
    SpoofedCall(
        definingClass = "Landroid/content/pm/PackageManager;",
        name = "getInstallerPackageName",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "Ljava/lang/String;",
        extensionDescriptor = "$EXTENSION_CLASS->getInstallerPackageName(" +
            "Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;",
    ),
)

private fun Instruction.spoofedCallOrNull(): SpoofedCall? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = getReference<MethodReference>() ?: return null
    return spoofedCalls.firstOrNull { it.matches(reference) }
}

/** The register list of an invoke instruction, in smali syntax. */
private fun Instruction.registerList(): String = when (this) {
    is RegisterRangeInstruction ->
        "{v$startRegister .. v${startRegister + registerCount - 1}}"

    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG)
            .take(registerCount)
            .joinToString(prefix = "{", postfix = "}") { "v$it" }

    else -> throw PatchException("Unexpected invoke instruction format: $opcode")
}

private fun ClassDef.hasSpoofedCall() = methods.any { method ->
    method.implementation?.instructions?.any { it.spoofedCallOrNull() != null } == true
}

@Suppress("unused")
val spoofInstallerPatch = patch(
    name = "Allow apps from any installer",
    description = "Makes Android Auto treat every app as installed from the Google Play Store, so " +
        "sideloaded Android Auto apps show up in the car launcher without an installer app, " +
        "developer settings or the \"Unknown sources\" setting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANDROID_AUTO)

    extendWith("extensions/extension.mpe")

    execute {
        // Collect first, then modify, so the class list is not changed while it is iterated.
        val targetClasses = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(EXTENSION_PACKAGE) && classDef.hasSpoofedCall()) {
                targetClasses += classDef
            }
        }

        var replacedCount = 0

        targetClasses.forEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach

                // Find the call sites first, then replace them. Replacing one invoke with one
                // invoke never moves other instructions, so the indices stay valid.
                val callSites = implementation.instructions.mapIndexedNotNull { index, instruction ->
                    instruction.spoofedCallOrNull()?.let { call -> Triple(index, instruction, call) }
                }

                callSites.forEach { (index, instruction, call) ->
                    val invokeStatic =
                        if (instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) "invoke-static/range"
                        else "invoke-static"

                    method.replaceInstruction(
                        index,
                        "$invokeStatic ${instruction.registerList()}, ${call.extensionDescriptor}",
                    )
                    replacedCount++
                }
            }
        }

        if (replacedCount == 0) {
            throw PatchException(
                "No installer checks were found in this Android Auto APK. " +
                    "Google may have changed how Android Auto checks where apps come from.",
            )
        }

        Logger.getLogger("GearheadPatches")
            .info("Allow apps from any installer: replaced $replacedCount installer checks")
    }
}
