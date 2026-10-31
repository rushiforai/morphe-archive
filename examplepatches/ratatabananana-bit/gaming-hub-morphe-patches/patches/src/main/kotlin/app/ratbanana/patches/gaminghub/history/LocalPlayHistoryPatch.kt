package app.ratbanana.patches.gaminghub.history

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SERVICE_EXTENSION_CLASS = "$EXTENSION_PACKAGE/LocalGamingHubService;"
private const val PROFILE_EXTENSION_CLASS = "$EXTENSION_PACKAGE/ProfileAccess;"

private const val NETWORK_MODULE_CLASS = "Lcom/samsung/android/game/gamehome/network/di/NetworkModule;"

@Suppress("unused")
val localPlayHistoryPatch = bytecodePatch(
    name = "Local play history",
    description = "Experimental. Shows your play history in the gamer profile, computed on the device " +
        "from Android's usage data instead of Samsung's server, and stops account-only requests " +
        "to Samsung's server that fail without a Samsung account. " +
        "Requires usage data access for Gaming Hub in Android settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        // Wrap the API implementation right after Retrofit.create(GameLauncherService::class.java).
        var wrappedServices = 0
        mutableClassDefBy(NETWORK_MODULE_CLASS).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val serviceClassIndex = instructions.indexOfFirst { it.isConstClass(API_SERVICE_CLASS) }
            if (serviceClassIndex < 0) return@forEach

            val createIndex = (serviceClassIndex + 1 until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.INVOKE_VIRTUAL
            } ?: throw PatchException("Retrofit create call not found after the API service class")
            val resultIndex = createIndex + 1
            if (instructions.getOrNull(resultIndex)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Retrofit create result not found")
            }

            val serviceClassRegister = (instructions[serviceClassIndex] as OneRegisterInstruction).registerA
            if ((instructions[createIndex] as FiveRegisterInstruction).registerD != serviceClassRegister) {
                throw PatchException("Unexpected Retrofit create call")
            }
            val serviceRegister = (instructions[resultIndex] as OneRegisterInstruction).registerA

            method.addInstructions(
                resultIndex + 1,
                """
                    invoke-static { v$serviceRegister, v$serviceClassRegister }, $SERVICE_EXTENSION_CLASS->wrap(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
                    move-result-object v$serviceRegister
                """,
            )
            wrappedServices++
        }
        if (wrappedServices == 0) throw PatchException("API service creation not found in $NETWORK_MODULE_CLASS")

        // Let the signed-out profile button open the gamer profile.
        InitProfileMenuFingerprint.let { fingerprint ->
            val buttonMatch = fingerprint.instructionMatches.first()
            val buttonRegister = buttonMatch.getInstruction<TwoRegisterInstruction>().registerA

            fingerprint.method.addInstructions(
                buttonMatch.index + 1,
                "invoke-static { v$buttonRegister }, $PROFILE_EXTENSION_CLASS->enableSignedOutProfileButton(Landroid/view/View;)V",
            )
        }

        // Open the gamer profile instead of the sign-in prompt that a re-signed APK can never pass.
        ProfileClickFingerprint.let { fingerprint ->
            val signInPromptMatch = fingerprint.instructionMatches.first()
            val fragmentRegister = signInPromptMatch.getInstruction<FiveRegisterInstruction>().registerC

            fingerprint.method.replaceInstruction(
                signInPromptMatch.index,
                "invoke-static { v$fragmentRegister }, $PROFILE_EXTENSION_CLASS->openProfile(Ljava/lang/Object;)V",
            )
        }
    }
}

private fun Instruction.isConstClass(type: String) =
    opcode == Opcode.CONST_CLASS && ((this as ReferenceInstruction).reference as TypeReference).type == type
