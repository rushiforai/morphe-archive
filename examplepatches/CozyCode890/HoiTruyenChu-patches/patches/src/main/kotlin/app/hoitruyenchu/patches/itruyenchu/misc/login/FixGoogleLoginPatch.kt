package app.hoitruyenchu.patches.itruyenchu.misc.login

import app.hoitruyenchu.patches.itruyenchu.misc.extension.sharedExtensionPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_FIX_GOOGLE_LOGIN
import app.hoitruyenchu.patches.itruyenchu.shared.CreateClientBuilderFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.OKHTTP_CLIENT_BUILDER
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val fixGoogleLoginPatch = patch(
    name = "Fix Google login",
    description = "Fixes \"Đăng nhập với Google\" failing with error 400: the server now expects the " +
            "Firebase ID token (like the website) instead of the email sent by this app version.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    dependsOn(sharedExtensionPatch)

    execute {
        CreateClientBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // Every return of the builder gets the interceptor.
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstruction(
                        index,
                        "invoke-static { v$register }, $EXTENSION_FIX_GOOGLE_LOGIN->" +
                                "onCreateClientBuilder($OKHTTP_CLIENT_BUILDER)V",
                    )
                }
        }
    }
}
