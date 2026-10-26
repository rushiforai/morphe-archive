package app.aapam.patches.cred

import app.aapam.patches.cred.manifest.manifestFixPatch
import app.aapam.patches.cred.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val credPatch = bytecodePatch(
    name = "Disable Spying & Security Checks",
    description = "Suppresses background watchdog crashes, stubs app inventory harvesters, bypasses device profiling & root checks, and neutralizes OEM task-killer service flags.",
) {
    compatibleWith(Constants.COMPATIBILITY_CRED)
    dependsOn(manifestFixPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Install ImmunityExceptionHandler on DreamApplication
        mutableClassDefByOrNull("Lcom/dreamplug/androidapp/DreamApplication;")?.let { dreamApp ->
            dreamApp.methods.forEach { method ->
                if (method.name == "attachBaseContext" || method.name == "onCreate") {
                    method.addInstructions(
                        0,
                        """
                            invoke-static {}, Lapp/aapam/extension/cred/ImmunityExceptionHandler;->install()V
                        """,
                    )
                }
            }
        }

        // 2. Stub DeviceFingerPrint checks (root, suspicious apps & binaries)
        mutableClassDefByOrNull("Lcom/dreamplug/deviceattributes/DeviceFingerPrint;")?.let { dfp ->
            dfp.methods.forEach { method ->
                when (method.name) {
                    "checkForSusApps" -> {
                        method.addInstructions(
                            0,
                            """
                                new-instance v0, Ljava/util/ArrayList;
                                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                                iput-object v0, p0, Lcom/dreamplug/deviceattributes/DeviceFingerPrint;->secApps:Ljava/util/List;
                                return-void
                            """,
                        )
                    }
                    "checkForSusBinaries" -> {
                        method.addInstructions(
                            0,
                            """
                                new-instance v0, Ljava/util/ArrayList;
                                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                                iput-object v0, p0, Lcom/dreamplug/deviceattributes/DeviceFingerPrint;->secBinaries:Ljava/util/List;
                                return-void
                            """,
                        )
                    }
                    "isRooted" -> {
                        method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """,
                        )
                    }
                }
            }
        }

        // 3. Stub Minkasu 2FA root check methods (all methods returning boolean)
        mutableClassDefByOrNull("Lminkasu2fa/w0;")?.let { minkasuClass ->
            minkasuClass.methods.forEach { method ->
                if (method.returnType == "Z") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x0
                            return v0
                        """,
                    )
                }
            }
        }

        // 4. Stub Wibmo 3DS package list dumper
        mutableClassDefByOrNull("Lcom/wibmo/threeds2/sdk/impl/a;")?.let { wibmoClass ->
            wibmoClass.methods.forEach { method ->
                if (method.name == "getTopUpAmountannotations" && method.returnType == "Ljava/lang/Object;") {
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x0
                            new-array v0, v0, [Ljava/lang/Object;
                            return-object v0
                        """,
                    )
                }
            }
        }

        // 5. Spoof genuine DreamPlug certificate on AppSignatureProvider
        val sigProviderInterface = "Lpl/upaid/module/security/api/hash/AppSignatureProvider;"
        val dreamPlugCertBase64 = "MIIDTzCCAjegAwIBAgIEUJk5TTANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJJTjESMBAGA1UEBxMJQmFuZ2Fsb3JlMRIwEAYDVQQKEwlEcmVhbVBsdWcxETAPBgNVBAsTCENvbnN1bWVyMQ4wDAYDVQQDEwVEcmVhbTAeFw0xODA1MjcxNDUyNThaFw00MzA1MjExNDUyNThaMFgxCzAJBgNVBAYTAklOMRIwEAYDVQQHEwlCYW5nYWxvcmUxEjAQBgNVBAoTCURyZWFtUGx1ZzERMA8GA1UECxMIQ29uc3VtZXIxDjAMBgNVBAMTBURyZWFtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqsXbPmCpuCidGHCM6ntrOXwlfzl5cC9AXolA0pixCv8g2xkPkqqb7/fqMx8ZMkI65rON1ITwJEP9e9tvZ/4fAqszEk2Q/EN7vXKRKc+/wrDWcgg7XVeNSrQzQxDgeFMJfP64r21A+YqrQM9KUwqeYaJqVjAarOttKvOR80w2HuM22dlYXnxQ/zb/uH4UsBW3nSfsuN79XlVi/TxakGvnwi0A5WpYZoIAyWH5EY5hY+3XNEHTukRsaN2LppDPljzeXJiB7TeTELN5aeki0DCBnwn2J75+PHR0bODClG5VzYBGle/DfpAlz0As6BTbqy+pRt1C8lEqXcukUTJB1cKUsQIDAQABoyEwHzAdBgNVHQ4EFgQUi9wcVbE1LYmwfyxQHL3cbHYoIx8wDQYJKoZIhvcNAQELBQADggEBAH4UgaDVbnFDl27ZjjtwzLW4XJN0EgXPkaN9CWJOs0A4Gf31rQc/tiwveNva8IgFmZKY62IpgwklcOwMSvHlVBW+PlCZtGsAET5XcA1jYat+LlkSO92JNo5nS3OqS8yUtmmMbaqd7aLNrBs1VdFlnIaCVMh/vpnUDfMsRfocc+SAddMtRoU3JwJHVf4Wr13LGwPTRJcvia4zdB3y8CtQk/q1dnEiqacyPaY2Z6vU/FEbixG2hJEF5SbcYNVvQedB8IV4K8OMUMWvN3nBXCohxiZvGMGnXIHcx8xYOPezVXHs1N2sVOqZ78HQZQg1gF7hghWGCnDfHuobP+mPB3nhY2Q="

        classDefForEach { classDef ->
            if (classDef.interfaces.contains(sigProviderInterface)) {
                val mutableClass = mutableClassDefBy(classDef)
                mutableClass.methods.forEach { method ->
                    if (method.name == "getSignatures") {
                        method.addInstructions(
                            0,
                            """
                                const-string v0, "$dreamPlugCertBase64"
                                const/4 v1, 0x0
                                invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
                                move-result-object v0
                                new-instance v1, Ljava/util/ArrayList;
                                invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                                invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                                return-object v1
                            """,
                        )
                    }
                }
            }
        }

        // 6. Stub River SDK app inventory scraper
        getAllClassesWithString("/dagger/v2/app").forEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach { method ->
                if (method.parameterTypes.contains("Landroid/content/Context;") && method.returnType == "V") {
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """,
                    )
                }
            }
        }

        // 7. Neutralize DexGuard tamper checks in CredFlutterActivity
        mutableClassDefByOrNull("Lcom/dreamplug/androidapp/CredFlutterActivity;")?.let { credActivity ->
            credActivity.methods.forEach { method ->
                val callsSuperOnCreate = method.instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.let { ref ->
                        ref is MethodReference &&
                            ref.name == "onCreate" &&
                            ref.parameterTypes == listOf("Landroid/os/Bundle;")
                    } ?: false
                }
                val callsTamperCheck = method.instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("CrashlyticsController$4") == true
                }
                val hasTamperToast = method.instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("Toast;->makeText") == true
                }

                if (callsSuperOnCreate || callsTamperCheck || hasTamperToast) {
                    val ifNeIndices = method.instructions.mapIndexedNotNull { idx, ins ->
                        if (ins.opcode == Opcode.IF_NE) idx else null
                    }
                    ifNeIndices.reversed().forEach { idx ->
                        method.replaceInstruction(idx, "nop")
                    }
                }
            }
        }
    }
}
