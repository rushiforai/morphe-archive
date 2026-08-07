package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
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
        // ── Signature spoof initialization: hook Application.attachBaseContext() ──
        // This bypasses the need for the ContentProvider declaration in AndroidManifest.xml,
        // which is silently dropped by morphe's resourcePatch due to an XML-to-binary encoding bug.
        // SignatureSpoofApplication.initialize() hooks the PackageManager to return the original
        // Tantan certificate, allowing Google Maps and other signature-dependent services to work.
        classDefByOrNull("Lcom/p1/mobile/putong/app/TantanApp;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "attachBaseContext" && it.parameterTypes == listOf("Landroid/content/Context;") }
                .forEach { method ->
                    // Find the super.attachBaseContext() call and insert after it
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    val superCallIndex = instructions.indexOfFirst { instruction ->
                        instruction is ReferenceInstruction &&
                            instruction.reference is MethodReference &&
                            (instruction.reference as MethodReference).let { ref ->
                                ref.name == "attachBaseContext" &&
                                    (ref.definingClass == "Landroid/app/Application;" ||
                                        ref.definingClass == "Landroid/content/ContextWrapper;")
                            }
                    }
                    val insertIndex = if (superCallIndex >= 0) superCallIndex + 1 else 0
                    method.addInstructions(
                        insertIndex,
                        "invoke-static {p0}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialize(Landroid/content/Context;)V",
                    )
                }
        }

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

        listOf(
            "Lcom/google/android/gms/common/internal/zzo;",
            "Lcom/google/android/gms/common/internal/BaseGmsClient;",
            "Lcom/google/android/gms/common/internal/GetServiceRequest;",
            "Lcom/google/android/gms/common/GooglePlayServicesUtil;",
            "Lcom/google/firebase/messaging/FirebaseMessaging;",
            "Lcom/google/android/gms/common/GoogleSignatureVerifier;",
            // Maps SDK classes
            "Lcom/google/android/gms/maps/SupportMapFragment;",
            "Lcom/google/android/gms/maps/MapFragment;",
            "Lcom/google/android/gms/maps/GoogleMapOptions;",
            "Lcom/google/android/libraries/places/internal/zziw;",
            "Lcom/google/android/libraries/places/internal/zzki;",
            "Lcom/google/android/libraries/places/internal/zzjw;",
        ).forEach { classDescriptor ->
            classDefByOrNull(classDescriptor)?.let { classDef ->
                val mutableClass = mutableClassDefBy(classDef)
                val methodMap = mutableClass.methods.associateBy { 
                    "${it.name}(${it.parameterTypes.joinToString(",")})" 
                }

                classDef.methods.forEach { method ->
                    val implementation = method.implementation ?: return@forEach
                    val key = "${method.name}(${method.parameterTypes.joinToString(",")})"
                    val mutableMethod = methodMap[key] ?: return@forEach
                    val instructions = implementation.instructions.toList()

                    instructions.forEachIndexed { index, instruction ->
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
        }

        listOf(
            "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;",
            "Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;",
            "Lcom/google/firebase/remoteconfig/internal/ConfigRealtimeHttpClient;",
            "Lcom/google/android/libraries/places/internal/zzki;",
            "Lcom/google/android/libraries/places/internal/zzjw;",
            // Maps SDK classes that make API requests
            "Lcom/google/android/gms/maps/SupportMapFragment;",
            "Lcom/google/android/gms/maps/MapFragment;",
            "Lcom/google/android/gms/maps/GoogleMapOptions;",
            "Lcom/google/android/libraries/places/internal/zziw;",
        ).forEach { classDescriptor ->
            classDefByOrNull(classDescriptor)?.let { classDef ->
                val mutableClass = mutableClassDefBy(classDef)
                // Key by full signature to handle overloaded methods/constructors
                val methodMap = mutableClass.methods.associateBy { 
                    "${it.name}(${it.parameterTypes.joinToString(",")})" 
                }

                classDef.methods.forEach { method ->
                    val implementation = method.implementation ?: return@forEach
                    val key = "${method.name}(${method.parameterTypes.joinToString(",")})"
                    val mutableMethod = methodMap[key] ?: return@forEach
                    val instructions = implementation.instructions.toList()

                    instructions.forEachIndexed { index, instruction ->
                        val strRef = (instruction as? Instruction21c)?.reference as? StringReference
                            ?: return@forEachIndexed
                        val replacementValue = when (strRef.string) {
                            "X-Android-Cert" -> ORIGINAL_SHA1
                            "X-Android-Package" -> ORIGINAL_PACKAGE
                            else -> return@forEachIndexed
                        }
                        val headerReg = instruction.registerA

                        for (j in index + 1 until minOf(index + 30, instructions.size)) {
                            val candidate = instructions[j]
                            val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue

                            for (k in j - 1 downTo 0) {
                                val valueInst = instructions[k]
                                if (valueInst is Instruction21c && valueInst.registerA == valueRegNum
                                    && valueInst.reference is StringReference
                                ) {
                                    mutableMethod.replaceInstruction(
                                        k,
                                        BuilderInstruction21c(
                                            Opcode.CONST_STRING,
                                            valueRegNum,
                                            ImmutableStringReference(replacementValue),
                                        ),
                                    )
                                    break
                                }
                            }
                            break
                        }
                    }
                }
            }
        }

        // ── Broad GMS package name rewriting ──
        // Rewrites "com.google.android.gms" → "app.revanced.android.gms" across all classes
        // This ensures Maps SDK and other GMS-dependent code uses MicroG instead of real GMS
        // Excludes Firebase auth classes to avoid breaking session authentication
        classDefForEach { classDef ->
            val hasMethods = classDef.methods.any { it.implementation != null }
            if (!hasMethods) return@classDefForEach

            val containsTarget = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    (instruction as? Instruction21c)?.reference is StringReference &&
                            ((instruction as Instruction21c).reference as StringReference).string == "com.google.android.gms"
                } == true
            }

            if (!containsTarget) return@classDefForEach

            val type = classDef.type
            // Exclude Firebase auth classes to prevent session issues
            if (type.startsWith("Lcom/google/firebase/auth/") ||
                type.startsWith("Lcom/google/firebase/installations/") ||
                type.startsWith("Lcom/google/firebase/iid/") ||
                type == "Lcom/google/android/gms/common/internal/zzf;") {
                return@classDefForEach
            }

            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = classDef.methods.zip(mutableClass.methods).toMap()

            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method] ?: return@forEach

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

        // ── Broad X-Android-Cert header injection ──
        // Injects original certificate fingerprint into all classes that send X-Android-Cert headers
        // This ensures Maps API and other Google services accept requests from re-signed APKs
        // Excludes Firebase classes that handle authentication
        classDefForEach { classDef ->
            val hasMethods = classDef.methods.any { it.implementation != null }
            if (!hasMethods) return@classDefForEach

            val containsTargetStrings = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@any false
                    ref.string == "X-Android-Cert" || ref.string == "X-Android-Package"
                } == true
            }

            if (!containsTargetStrings) return@classDefForEach

            val type = classDef.type
            // Exclude all Firebase classes to prevent auth/session issues
            if (type.startsWith("Lcom/google/firebase/")) {
                return@classDefForEach
            }

            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = classDef.methods.zip(mutableClass.methods).toMap()

            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val mutableMethod = methodMap[method] ?: return@forEach

                data class Injection(val index: Int, val registerName: String, val value: String)
                val injections = mutableListOf<Injection>()

                val instructions = implementation.instructions.toList()

                instructions.forEachIndexed { index, instruction ->
                    val strRef = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val replacementValue = when (strRef.string) {
                        "X-Android-Cert" -> ORIGINAL_SHA1
                        "X-Android-Package" -> ORIGINAL_PACKAGE
                        else -> return@forEachIndexed
                    }
                    val headerReg = instruction.registerA

                    for (j in index + 1 until minOf(index + 30, instructions.size)) {
                        val candidate = instructions[j]
                        val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue
                        injections.add(Injection(j, "v$valueRegNum", replacementValue))
                        break
                    }
                }

                injections.sortedByDescending { it.index }.forEach { injection ->
                    mutableMethod.addInstructions(
                        injection.index,
                        "const-string ${injection.registerName}, \"${injection.value}\"",
                    )
                }
            }
        }

        // ── Google Sign-In + Facebook SDK: single-pass scan for all matching classes ──
        val googleSignInClientId = "218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"
        val facebookSdkInit = "The SDK has not been initialized"

        classDefForEach { classDef ->
            var foundGoogleSignIn = false
            var foundFacebookSdk = false

            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instruction in impl.instructions) {
                    val stringRef = (instruction as? Instruction21c)?.reference as? StringReference
                        ?: continue
                    val str = stringRef.string
                    if (str == googleSignInClientId) foundGoogleSignIn = true
                    if (str == facebookSdkInit) foundFacebookSdk = true
                    if (foundGoogleSignIn && foundFacebookSdk) break
                }
                if (foundGoogleSignIn && foundFacebookSdk) break
            }

            if (foundGoogleSignIn) {
                mutableClassDefBy(classDef).methods
                    .filter { it.name != "<init>" && it.name != "<clinit>" && it.returnType == "Z" }
                    .forEach { it.addInstructions(0, RETURN_TRUE) }
            }

            if (foundFacebookSdk) {
                mutableClassDefBy(classDef).methods
                    .filter {
                        it.name != "<init>" && it.name != "<clinit>" &&
                                it.returnType == "Z" && it.parameterTypes.isEmpty()
                    }
                    .forEach { it.addInstructions(0, RETURN_TRUE) }
            }
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

    }
}
