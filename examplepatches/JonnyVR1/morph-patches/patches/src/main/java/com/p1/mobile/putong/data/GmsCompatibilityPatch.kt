package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.tantantribe.tribe"
private const val ORIGINAL_SHA1 = "715BAB0F363395FE34D187684B0EF771A9D400F0"
private const val VENDOR_GROUP_ID = "app.revanced"
private const val VENDOR_GMS_PACKAGE = "$VENDOR_GROUP_ID.android.gms"

private const val RETURN_INT_SUCCESS = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private fun extractValueRegister(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    headerReg: Int,
): Int? {
    if ((instruction as? ReferenceInstruction)?.reference !is MethodReference) return null
    return when (instruction) {
        is FiveRegisterInstruction -> {
            if (instruction.registerCount < 3) return null
            val regs = listOf(
                instruction.registerC, instruction.registerD,
                instruction.registerE, instruction.registerF, instruction.registerG,
            ).take(instruction.registerCount)
            val headerIdx = regs.indexOf(headerReg)
            if (headerIdx < 0 || headerIdx >= regs.size - 1) null
            else regs[headerIdx + 1]
        }
        is RegisterRangeInstruction -> {
            if (instruction.registerCount < 3) return null
            val offset = headerReg - instruction.startRegister
            if (offset < 0 || offset >= instruction.registerCount - 1) null
            else instruction.startRegister + offset + 1
        }
        else -> null
    }
}

private val manifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val providers = application.getElementsByTagName("provider")
            var alreadyDeclared = false
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as Element
                val name = provider.getAttribute("android:name")
                if (name == "com.p1.mobile.putong.data.extension.signature.SignatureSpoofApplication") {
                    alreadyDeclared = true
                    break
                }
            }

            if (!alreadyDeclared) {
                val provider = document.createElement("provider")
                provider.setAttribute("android:name", "com.p1.mobile.putong.data.extension.signature.SignatureSpoofApplication")
                provider.setAttribute("android:authorities", "com.tantantribe.tribe.signatureSpoof")
                provider.setAttribute("android:exported", "false")
                provider.setAttribute("android:initOrder", "2147483647")
                application.appendChild(provider)
            }

            val metadata = document.createElement("meta-data")
            metadata.setAttribute("android:name", "$VENDOR_GMS_PACKAGE.SPOOFED_PACKAGE_NAME")
            metadata.setAttribute("android:value", TANTAN_PACKAGE_NAME)
            application.appendChild(metadata)

            val signatureMetadata = document.createElement("meta-data")
            signatureMetadata.setAttribute("android:name", "$VENDOR_GMS_PACKAGE.SPOOFED_PACKAGE_SIGNATURE")
            signatureMetadata.setAttribute("android:value", "71:5B:AB:0F:36:33:95:FE:34:D1:87:68:4B:0E:F7:71:A9:D4:00:F0")
            application.appendChild(signatureMetadata)

            val microgMetadata = document.createElement("meta-data")
            microgMetadata.setAttribute("android:name", "app.revanced.MICROG_PACKAGE_NAME")
            microgMetadata.setAttribute("android:value", VENDOR_GMS_PACKAGE)
            application.appendChild(microgMetadata)

            val queries = document.getElementsByTagName("queries").item(0)
            if (queries == null) {
                val newQueries = document.createElement("queries")
                val packageElement = document.createElement("package")
                packageElement.setAttribute("android:name", VENDOR_GMS_PACKAGE)
                newQueries.appendChild(packageElement)
                document.documentElement.insertBefore(newQueries, application)
            } else {
                val packageElement = document.createElement("package")
                packageElement.setAttribute("android:name", VENDOR_GMS_PACKAGE)
                queries.appendChild(packageElement)
            }
        }
    }
}

private val googleSignInClassFingerprint = Fingerprint(
    filters = listOf(
        string("218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"),
    ),
)

private val facebookSdkClassFingerprint = Fingerprint(
    filters = listOf(
        string("com.facebook.FacebookSdk"),
        string("The SDK has not been initialized"),
    ),
)

private val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
@JvmField
val gmsCompatibilityPatch = bytecodePatch(
    name = "GMS Compatibility",
    description = "Makes Google Maps and GMS-dependent features work in re-signed APKs. " +
            "Includes signature spoofing, auth header fixes, MicroG support, and GMS availability bypass.",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    dependsOn(manifestPatch)
    extendWith("extensions/signature.mpe")

    execute {
        classDefByOrNull("Lcom/google/android/gms/common/GooglePlayServicesUtilLight;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "isGooglePlayServicesAvailable" }
                .forEach { it.addInstructions(0, RETURN_INT_SUCCESS) }
        }

        classDefByOrNull("Lcom/google/android/gms/common/GoogleApiAvailabilityLight;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "isGooglePlayServicesAvailable" }
                .forEach { it.addInstructions(0, RETURN_INT_SUCCESS) }
        }

        classDefByOrNull("Lcom/google/android/gms/common/GoogleApiAvailability;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "isGooglePlayServicesAvailable" }
                .forEach { it.addInstructions(0, RETURN_INT_SUCCESS) }
        }

        classDefByOrNull("Lcom/google/android/gms/common/GoogleSignatureVerifier;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name in listOf("isPackageGoogleSigned", "isUidGoogleSigned", "isGooglePublicSignedPackage") }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull("Lcom/google/android/gms/common/zzn;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "zzf" && it.returnType == "Z" }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull("Lcom/cosmos/photon/push/util/AppContext;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "hasGoogleMap" }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        classDefByOrNull("Lcom/google/android/gms/common/internal/zzf;")?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = mutableClass.methods.associateBy { it.name }
            
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method.name] ?: return@forEach

                implementation.instructions.forEachIndexed { index, instruction ->
                    val str = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@forEachIndexed

                    if (str.string == "com.google.android.gms") {
                        mutableMethod.replaceInstruction(
                            index,
                            BuilderInstruction21c(
                                Opcode.CONST_STRING,
                                instruction.registerA,
                                ImmutableStringReference(VENDOR_GMS_PACKAGE),
                            ),
                        )
                    }
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/installations/FirebaseInstallations;")?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = mutableClass.methods.associateBy { it.name }
            
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method.name] ?: return@forEach

                implementation.instructions.forEachIndexed { index, instruction ->
                    val strRef = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val replacementValue = when (strRef.string) {
                        "X-Android-Cert" -> ORIGINAL_SHA1
                        "X-Android-Package" -> ORIGINAL_PACKAGE
                        else -> return@forEachIndexed
                    }
                    val headerReg = instruction.registerA

                    data class Injection(val index: Int, val registerName: String, val value: String)
                    val injections = mutableListOf<Injection>()
                    val instructions = implementation.instructions.toList()

                    for (j in index + 1 until minOf(index + 30, instructions.size)) {
                        val candidate = instructions[j]
                        val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue
                        injections.add(Injection(j, "v$valueRegNum", replacementValue))
                        break
                    }

                    injections.sortedByDescending { it.index }.forEach { injection ->
                        mutableMethod.addInstructions(
                            injection.index,
                            "const-string ${injection.registerName}, \"${injection.value}\"",
                        )
                    }
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/iid/FirebaseInstanceId;")?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = mutableClass.methods.associateBy { it.name }
            
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method.name] ?: return@forEach

                implementation.instructions.forEachIndexed { index, instruction ->
                    val strRef = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val replacementValue = when (strRef.string) {
                        "X-Android-Cert" -> ORIGINAL_SHA1
                        "X-Android-Package" -> ORIGINAL_PACKAGE
                        else -> return@forEachIndexed
                    }
                    val headerReg = instruction.registerA

                    data class Injection(val index: Int, val registerName: String, val value: String)
                    val injections = mutableListOf<Injection>()
                    val instructions = implementation.instructions.toList()

                    for (j in index + 1 until minOf(index + 30, instructions.size)) {
                        val candidate = instructions[j]
                        val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue
                        injections.add(Injection(j, "v$valueRegNum", replacementValue))
                        break
                    }

                    injections.sortedByDescending { it.index }.forEach { injection ->
                        mutableMethod.addInstructions(
                            injection.index,
                            "const-string ${injection.registerName}, \"${injection.value}\"",
                        )
                    }
                }
            }
        }

        classDefByOrNull("Lcom/google/firebase/messaging/FirebaseMessaging;")?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = mutableClass.methods.associateBy { it.name }
            
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method.name] ?: return@forEach

                implementation.instructions.forEachIndexed { index, instruction ->
                    val strRef = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val replacementValue = when (strRef.string) {
                        "X-Android-Cert" -> ORIGINAL_SHA1
                        "X-Android-Package" -> ORIGINAL_PACKAGE
                        else -> return@forEachIndexed
                    }
                    val headerReg = instruction.registerA

                    data class Injection(val index: Int, val registerName: String, val value: String)
                    val injections = mutableListOf<Injection>()
                    val instructions = implementation.instructions.toList()

                    for (j in index + 1 until minOf(index + 30, instructions.size)) {
                        val candidate = instructions[j]
                        val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue
                        injections.add(Injection(j, "v$valueRegNum", replacementValue))
                        break
                    }

                    injections.sortedByDescending { it.index }.forEach { injection ->
                        mutableMethod.addInstructions(
                            injection.index,
                            "const-string ${injection.registerName}, \"${injection.value}\"",
                        )
                    }
                }
            }
        }

        // ── Google Sign-In: patch sign-in client to work with re-signed APKs ──
        googleSignInClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name != "<init>" && it.name != "<clinit>" && it.returnType == "Z" }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        // ── Google Places API: ensure Places initialization works with re-signed APKs ──
        classDefByOrNull("Lcom/google/android/libraries/places/api/Places;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "isInitialized" }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

        // ── Firebase Crashlytics: disable collection for re-signed APKs (server rejects reports) ──
        classDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")?.let { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods
                .filter { it.name == "isCrashlyticsCollectionEnabled" }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
            mutableClass.methods
                .filter { it.name == "setCrashlyticsCollectionEnabled" }
                .forEach {
                    if (it.parameterTypes.isEmpty() || it.parameterTypes[0] == "Z") {
                        it.addInstructions(0, "return-void")
                    }
                }
        }

        // ── Facebook Login: patch SDK initialization for re-signed APKs ──
        facebookSdkClassFingerprint.matchOrNull()?.classDef?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter {
                    it.name != "<init>" && it.name != "<clinit>" &&
                            it.returnType == "Z" && it.parameterTypes.isEmpty()
                }
                .forEach { it.addInstructions(0, RETURN_TRUE) }
        }

    }
}
