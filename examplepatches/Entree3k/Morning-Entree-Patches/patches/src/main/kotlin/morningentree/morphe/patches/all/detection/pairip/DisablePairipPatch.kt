package morningentree.morphe.patches.all.detection.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import morningentree.morphe.util.returnEarly
import java.util.logging.Logger

private const val SIGNATURE_CHECK = "Lcom/pairip/SignatureCheck;"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val LICENSE_ACTIVITY = "Lcom/pairip/licensecheck/LicenseActivity;"
private const val RESPONSE_VALIDATOR = "Lcom/pairip/licensecheck/ResponseValidator;"
private const val VM_RUNNER = "Lcom/pairip/VMRunner;"
private const val STARTUP_LAUNCHER = "Lcom/pairip/StartupLauncher;"

private val SIGNATURE_VOID = setOf("verifyIntegrity")
private val SIGNATURE_TRUE = setOf("verifySignatureMatches")

private val LICENSE_CLIENT_VOID = setOf(
    "checkLicense",
    "initializeLicenseCheck",
    "connectToLicensingService",
    "processResponse",
    "startPaywallActivity",
)
private val LICENSE_CLIENT_TRUE = setOf("performLocalInstallerCheck")

private val LICENSE_ACTIVITY_VOID = setOf(
    "closeApp",
    "exitApp",
    "closeAllTasks",
    "showPaywallAndCloseApp",
    "showErrorDialog",
    "logAndShowErrorDialog",
)

private val RESPONSE_VALIDATOR_VOID = setOf("validateResponse")

@Suppress("unused")
val disablePairipPatch = bytecodePatch(
    name = "Disable Pairip protection",
    description = "Neutralizes Pairip's client-side signature and license checks (including the " +
        "LicenseActivity paywall/close-app enforcement) so the re-signed APK launches and stays " +
        "open. Optionally guts the Pairip VM as well. Does not bypass server-side Play Integrity.",
    default = false,
) {
    val gutVmRunner by booleanOption(
        key = "gutVmRunner",
        default = false,
        title = "Gut Pairip VM",
        description = "Also neutralizes the Pairip VM: makes VMRunner.invoke() return null, drops the " +
            "pairipcore native library load, and no-ops StartupLauncher.launch(). Only enable this " +
            "for apps whose VM merely runs the startup integrity/license program (its result is " +
            "discarded). If the app routes real functionality through the VM — e.g. broadcast " +
            "receivers or IAP — enabling this breaks those features. Leave off unless the app needs it.",
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val voidMethods = mapOf(
            SIGNATURE_CHECK to SIGNATURE_VOID,
            LICENSE_CLIENT to LICENSE_CLIENT_VOID,
            LICENSE_ACTIVITY to LICENSE_ACTIVITY_VOID,
            RESPONSE_VALIDATOR to RESPONSE_VALIDATOR_VOID,
        )

        val trueMethods = mapOf(
            SIGNATURE_CHECK to SIGNATURE_TRUE,
            LICENSE_CLIENT to LICENSE_CLIENT_TRUE,
        )

        var signature = 0
        var license = 0
        var vm = 0

        classDefForEach { classDef ->
            val type = classDef.type

            val voids = voidMethods[type]
            val trues = trueMethods[type]
            if (voids != null || trues != null) {
                for (method in mutableClassDefBy(classDef).methods) {
                    val changed = when {
                        voids != null && method.name in voids && method.returnType == "V" -> {
                            method.addInstruction(0, "return-void")
                            true
                        }
                        trues != null && method.name in trues && method.returnType == "Z" -> {
                            method.returnEarly(true)
                            true
                        }
                        else -> false
                    }
                    if (changed) {
                        if (type == SIGNATURE_CHECK) signature++ else license++
                    }
                }
            }

            if (gutVmRunner == true) {
                when (type) {
                    VM_RUNNER -> for (method in mutableClassDefBy(classDef).methods) {
                        if (method.name == "invoke" && method.returnType == "Ljava/lang/Object;") {
                            method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                            vm++
                        }

                        if (method.name == "<clinit>" && method.returnType == "V") {
                            method.addInstruction(0, "return-void")
                            vm++
                        }
                    }

                    STARTUP_LAUNCHER -> mutableClassDefBy(classDef).methods
                        .filter { it.name == "launch" && it.returnType == "V" }
                        .forEach {
                            it.addInstruction(0, "return-void")
                            vm++
                        }
                }
            }
        }

        logger.info("Pairip: signature=$signature, license=$license, vm=$vm method(s) neutralized.")

        if (signature == 0 && license == 0 && vm == 0) {
            logger.warning("Pairip: no Pairip classes found; no changes applied.")
        }
    }
}
