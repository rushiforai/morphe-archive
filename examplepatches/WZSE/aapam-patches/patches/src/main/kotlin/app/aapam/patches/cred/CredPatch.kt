package app.aapam.patches.cred

import app.aapam.patches.cred.manifest.manifestFixPatch
import app.aapam.patches.cred.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.aapam.patches.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val credPatch = bytecodePatch(
    name = "Disable Spying & Security Checks",
    description = "Removes other app querying & root checks, for NFC support check the our readme file.",
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
                    "isRooted" -> method.returnEarly(false)
                }
            }
        }

        // 3. Stub Minkasu 2FA root check methods (all methods returning boolean)
        mutableClassDefByOrNull("Lminkasu2fa/w0;")?.let { minkasuClass ->
            minkasuClass.methods.forEach { method ->
                if (method.returnType == "Z") {
                    method.returnEarly(false)
                }
            }
        }

        // 4. Stub Wibmo 3DS package list dumper
        mutableClassDefByOrNull("Lcom/wibmo/threeds2/sdk/impl/a;")?.let { wibmoClass ->
            wibmoClass.methods.forEach { method ->
                if (method.name == "getTopUpAmountannotations" && method.returnType == "Ljava/lang/Object;") {
                    method.returnEarly(null)
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
                    method.returnEarly()
                }
            }
        }

        // 7. Neutralize DexGuard tamper checks and lifecycle traps
        // 7a. Preserved CredFlutterActivity tamper neutralization for backward compatibility (v6.1.2 - v6.1.6)
        mutableClassDefByOrNull("Lcom/dreamplug/androidapp/CredFlutterActivity;")?.let { credActivity ->
            credActivity.methods.forEach { method ->
                val instructions = method.instructionsOrNull ?: return@forEach
                val callsSuperOnCreate = instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.let { ref ->
                        ref is MethodReference &&
                            ref.name == "onCreate" &&
                            ref.parameterTypes == listOf("Landroid/os/Bundle;")
                    } ?: false
                }
                val callsTamperCheck = instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("CrashlyticsController$4") == true
                }
                val hasTamperToast = instructions.any { ins ->
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("Toast;->makeText") == true
                }

                if (callsSuperOnCreate || callsTamperCheck || hasTamperToast) {
                    val ifNeIndices = instructions.mapIndexedNotNull { idx, ins ->
                        if (ins.opcode == Opcode.IF_NE) idx else null
                    }
                    ifNeIndices.reversed().forEach { idx ->
                        method.replaceInstruction(idx, "nop")
                    }
                }
            }
        }

        // 7b. Generic 4-tier structural DexGuard lifecycle trap neutralizer (v6.1.9.205+)
        val lifecycleMethods = setOf(
            "attachBaseContext",
            "onCreate",
            "onReceive",
            "onStartCommand",
            "onBind",
        )
        val agetOpcodes = setOf(
            Opcode.AGET,
            Opcode.AGET_WIDE,
            Opcode.AGET_OBJECT,
            Opcode.AGET_BOOLEAN,
            Opcode.AGET_BYTE,
            Opcode.AGET_CHAR,
            Opcode.AGET_SHORT,
        )

        classDefForEach { classDef ->
            if (classDef.methods.any { it.name in lifecycleMethods }) {
                val mutableClass = mutableClassDefBy(classDef)
                mutableClass.methods.forEach { method ->
                    if (method.name in lifecycleMethods) {
                        val instructions = method.instructionsOrNull ?: return@forEach
                        if (instructions.isEmpty()) return@forEach

                        val codeAddresses = ArrayList<Int>(instructions.size)
                        val addressToIndex = HashMap<Int, Int>(instructions.size)
                        var currentAddress = 0
                        for (idx in instructions.indices) {
                            val ins = instructions[idx]
                            addressToIndex[currentAddress] = idx
                            codeAddresses.add(currentAddress)
                            currentAddress += ins.codeUnits
                        }

                        val trapIndices = ArrayList<Int>()

                        for (i in instructions.indices) {
                            val ins = instructions[i]
                            if (ins.opcode != Opcode.IF_NE) continue
                            val offset = (ins as? OffsetInstruction)?.codeOffset ?: continue
                            if (offset < 20) continue

                            val targetAddress = codeAddresses[i] + offset
                            val targetIdx = addressToIndex[targetAddress] ?: continue
                            if (targetIdx <= i) continue

                            val startIdx = maxOf(0, i - 7)
                            var hasPrimArrayCast = false
                            var hasArrayLookup = false
                            for (k in startIdx until i) {
                                val prev = instructions[k]
                                if (prev.opcode == Opcode.CHECK_CAST) {
                                    val ref = (prev as? ReferenceInstruction)?.reference?.toString()
                                    // Single-dimension primitive array check: [I, [B, [C, [S, [Z, [J, [F, [D
                                    if (ref != null && ref.length == 2 && ref[0] == '[' && ref[1] != 'L') {
                                        hasPrimArrayCast = true
                                    }
                                }
                                if (prev.opcode in agetOpcodes) {
                                    hasArrayLookup = true
                                }
                            }
                            if (!hasPrimArrayCast || !hasArrayLookup) continue

                            val searchLimit = minOf(instructions.size, targetIdx + 15)
                            var isTrapBlock = false
                            for (t in targetIdx until searchLimit) {
                                val ti = instructions[t]
                                val top = ti.opcode

                                if (top == Opcode.THROW) {
                                    isTrapBlock = true
                                    break
                                }
                                if (top == Opcode.DIV_INT ||
                                    top == Opcode.DIV_INT_2ADDR ||
                                    top == Opcode.DIV_INT_LIT8 ||
                                    top == Opcode.REM_INT ||
                                    top == Opcode.REM_INT_2ADDR ||
                                    top == Opcode.REM_INT_LIT8
                                ) {
                                    isTrapBlock = true
                                    break
                                }
                                if (top == Opcode.NEW_INSTANCE && ti is ReferenceInstruction) {
                                    val typeRef = ti.reference.toString()
                                    if (typeRef.contains("RuntimeException") ||
                                        typeRef.contains("Exception") ||
                                        typeRef.contains("Error") ||
                                        typeRef.contains("ArrayList")
                                    ) {
                                        isTrapBlock = true
                                        break
                                    }
                                }
                                if (ti is ReferenceInstruction) {
                                    val ref = ti.reference.toString()
                                    if (ref.contains("Toast;->makeText") ||
                                        ref.contains("ContextMenu_android") ||
                                        ref.contains("bringIntoViewlocalRect") ||
                                        ref.contains("VideoFrameReleaseEarlyTimeForecaster") ||
                                        ref.contains("CrashlyticsController$4")
                                    ) {
                                        isTrapBlock = true
                                        break
                                    }
                                }
                            }

                            if (isTrapBlock) {
                                trapIndices.add(i)
                            }
                        }

                        if (trapIndices.isNotEmpty()) {
                            trapIndices.asReversed().forEach { idx ->
                                method.replaceInstruction(idx, "nop")
                            }
                        }
                    }
                }
            }
        }

        // 8. Stub Tap & Pay status holder class (Lo/putByte;)
        mutableClassDefByOrNull("Lo/putByte;")?.let { putByteClass ->
            putByteClass.methods.forEach { method ->
                if (method.name == "Amount") {
                    if (method.returnType == "Z") {
                        method.returnEarly(false)
                    } else if (method.returnType == "V" && method.parameterTypes == listOf("Z")) {
                        method.returnEarly()
                    }
                }
            }
        }

        // 9. Stub in-app card tokenization security check coroutine
        mutableClassDefByOrNull("Lo/TextLinkScopeExternalSyntheticLambda10$1;")?.let { lambdaClass ->
            lambdaClass.methods.forEach { method ->
                when (method.name) {
                    "invokeSuspend" -> {
                        if (method.returnType == "Ljava/lang/Object;") {
                            method.returnEarly(null)
                        }
                    }
                    "Amount" -> {
                        if (method.returnType == "Ljava/lang/Object;") {
                            method.returnEarly(null)
                        } else if (method.returnType == "V") {
                            method.returnEarly()
                        }
                    }
                }
            }
        }
    }
}
