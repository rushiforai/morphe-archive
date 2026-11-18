package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Disable the PairIP paths used by AndroPods 1.5.30. */
fun BytecodePatchContext.disableAndroPodsPairIp() {
    val signatureCheck = "Lcom/pairip/SignatureCheck;"
    val vmRunner = "Lcom/pairip/VMRunner;"
    val startupLauncher = "Lcom/pairip/StartupLauncher;"
    val licenseClient = "Lcom/pairip/licensecheck/LicenseClient;"
    val licenseState = "Lcom/pairip/licensecheck/LicenseClient\$LicenseCheckState;"
    val responseValidator = "Lcom/pairip/licensecheck/ResponseValidator;"

    mutableClassDefByOrNull(vmRunner)?.methods?.firstOrNull { it.name == "<clinit>" }
        ?.replaceBody("return-void")
    mutableClassDefByOrNull(vmRunner)?.methods?.firstOrNull { it.name == "invoke" }
        ?.replaceBody("const/4 v0, 0x0\nreturn-object v0")

    mutableClassDefByOrNull(signatureCheck)?.methods?.firstOrNull { it.name == "verifyIntegrity" }
        ?.replaceBody("return-void")
    mutableClassDefByOrNull(signatureCheck)?.methods?.firstOrNull {
        it.name == "verifySignatureMatches"
    }?.replaceBody("const/4 v0, 0x1\nreturn v0")

    mutableClassDefByOrNull(startupLauncher)?.methods?.firstOrNull { it.name == "launch" }
        ?.replaceBody("return-void")

    mutableClassDefByOrNull(licenseClient)?.methods?.firstOrNull {
        it.name == "initializeLicenseCheck"
    }?.replaceBody(
        """
            sget-object v0, $licenseState->LOCAL_CHECK_OK:$licenseState
            sput-object v0, $licenseClient->licenseCheckState:$licenseState
            return-void
        """.trimIndent(),
    )

    listOf(
        "connectToLicensingService",
        "lambda\$retryOrThrow\$0",
        "processResponse",
        "startPaywallActivity",
    ).forEach { name ->
        mutableClassDefByOrNull(licenseClient)?.methods?.firstOrNull { it.name == name }
            ?.replaceBody("return-void")
    }

    mutableClassDefByOrNull(licenseClient)?.methods?.firstOrNull {
        it.name == "performLocalInstallerCheck"
    }?.replaceBody("const/4 v0, 0x1\nreturn v0")

    mutableClassDefByOrNull(responseValidator)?.methods?.firstOrNull {
        it.name == "validateResponse"
    }?.replaceBody("return-void")

    mutableClassDefByOrNull(licenseClient)?.methods?.firstOrNull { it.name == "<clinit>" }
        ?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                sput-boolean v0, $licenseClient->repeatedCheckEnabled:Z
            """.trimIndent(),
        )

    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lcom/pairip/")) return@classDefForEach

        val callers = classDef.methods.filter { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.opcode.name.startsWith("INVOKE") &&
                    (instruction as? ReferenceInstruction)?.reference.let { reference ->
                        reference is MethodReference &&
                            reference.definingClass == vmRunner &&
                            reference.name == "invoke"
                    }
            } == true
        }

        val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
        callers.forEach { caller ->
            mutableClass.methods.firstOrNull {
                it.name == caller.name && it.returnType == caller.returnType
            }?.replaceBody("return-void")
        }
    }
}
