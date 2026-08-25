package app.template.patches.rustore.auth

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Matches `AuthSuggestDelegateImpl.ensureAuthSuggestShown()`, the central
 * authorization suggestion that chooses between the VK ID sheet and its
 * fullscreen variant.
 */
object AuthSuggestShownFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "AuthSuggestDelegateImpl.kt" &&
            method.implementation?.instructions?.any { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? TypeReference

                instruction.opcode == Opcode.NEW_INSTANCE &&
                    reference?.type ==
                    "Lru/vk/store/feature/auth/api/presentation/FullscreenAuthDestination;"
            } == true
    },
)
