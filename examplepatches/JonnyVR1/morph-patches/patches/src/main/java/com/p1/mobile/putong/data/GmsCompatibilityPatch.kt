package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.Method
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

private val RETURN_NULL = """
    const/4 v0, 0x0
    return-object v0
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

        // ── Block all GMS error resolution intents ──
        // When GMS error codes (1/2/3) surface through connection failures, these methods create
        // intents that open the microG-RE app settings page. Patching them to return null/void
        // prevents the app from navigating away to microG-RE settings.
        // This does NOT break Maps compatibility — Maps works via the isGooglePlayServicesAvailable
        // patches (returning 0/SUCCESS) and signature spoofing, not through error resolution flows.

        // GoogleApiAvailabilityLight: getErrorResolutionIntent() → null, getErrorResolutionPendingIntent() → null
        classDefByOrNull("Lcom/google/android/gms/common/GoogleApiAvailabilityLight;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getErrorResolutionIntent" && it.returnType == "Landroid/content/Intent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getErrorResolutionPendingIntent" && it.returnType == "Landroid/app/PendingIntent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
        }

        // GoogleApiAvailability: getErrorResolutionIntent() → null, getErrorResolutionPendingIntent() → null, showErrorNotification() → void
        classDefByOrNull("Lcom/google/android/gms/common/GoogleApiAvailability;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getErrorResolutionIntent" && it.returnType == "Landroid/content/Intent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getErrorResolutionPendingIntent" && it.returnType == "Landroid/app/PendingIntent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
            mutableClassDefBy(classDef).methods
                .filter { it.name == "showErrorNotification" && it.returnType == "V" }
                .forEach { it.addInstructions(0, "return-void") }
        }

        // GooglePlayServicesUtilLight: getGooglePlayServicesAvailabilityRecoveryIntent() → null, getErrorPendingIntent() → null
        classDefByOrNull("Lcom/google/android/gms/common/GooglePlayServicesUtilLight;")?.let { classDef ->
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getGooglePlayServicesAvailabilityRecoveryIntent" && it.returnType == "Landroid/content/Intent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
            mutableClassDefBy(classDef).methods
                .filter { it.name == "getErrorPendingIntent" && it.returnType == "Landroid/app/PendingIntent;" }
                .forEach { it.addInstructions(0, RETURN_NULL) }
        }

        // ── Broad GMS package rewriting, X-Android-Cert injection, and Google Sign-In/Facebook SDK ──
        // Single merged pass for all three transformations
        val googleSignInClientId = "218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"
        val facebookSdkInit = "The SDK has not been initialized"

        val targetStrings = setOf(
            "com.google.android.gms",
            "X-Android-Cert",
            "X-Android-Package",
            googleSignInClientId,
            facebookSdkInit
        )

        classDefForEach { classDef ->
            val type = classDef.type
            if (type == "Lcom/google/android/gms/common/internal/zzo;") return@classDefForEach

            // Package pre-filter: skip packages that don't contain GMS code
            if (type.startsWith("Landroid/") ||
                type.startsWith("Lkotlin/") ||
                type.startsWith("Ljava/") ||
                type.startsWith("Lkotlinx/") ||
                type.startsWith("Lorg/intellij/") ||
                type.startsWith("Lorg/jetbrains/")) {
                return@classDefForEach
            }

            // Quick pre-scan: does this class contain ANY target strings?
            val hasTargetString = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instr ->
                    instr is Instruction21c &&
                        (instr.reference as? StringReference)?.string in targetStrings
                } == true
            }

            if (!hasTargetString) return@classDefForEach

            val gmsReplacementsByMethod = mutableMapOf<Method, MutableList<Pair<Int, Int>>>()
            val certInjectionsByMethod = mutableMapOf<Method, MutableList<Triple<Int, String, String>>>()
            var hasGoogleSignIn = false
            var hasFacebookSdk = false

            val excludeGmsRewrite = type.startsWith("Lcom/google/firebase/auth/") ||
                type.startsWith("Lcom/google/firebase/installations/") ||
                type.startsWith("Lcom/google/firebase/iid/") ||
                type == "Lcom/google/android/gms/common/internal/zzf;"

            val excludeCertInjection = type.startsWith("Lcom/google/firebase/")

            for (method in classDef.methods) {
                if (method.name == "<init>" || method.name == "<clinit>") continue
                val impl = method.implementation ?: continue
                val instructions = impl.instructions.toList()

                instructions.forEachIndexed { index, instr ->
                    val strRef = (instr as? Instruction21c)?.reference as? StringReference ?: return@forEachIndexed
                    val str = strRef.string

                    when {
                        str == "com.google.android.gms" && !excludeGmsRewrite -> {
                            gmsReplacementsByMethod.getOrPut(method) { mutableListOf() }.add(index to instr.registerA)
                        }
                        (str == "X-Android-Cert" || str == "X-Android-Package") && !excludeCertInjection -> {
                            val replacementValue = if (str == "X-Android-Cert") ORIGINAL_SHA1 else ORIGINAL_PACKAGE
                            val headerReg = instr.registerA

                            for (j in index + 1 until minOf(index + 30, instructions.size)) {
                                val candidate = instructions[j]
                                val valueRegNum = extractValueRegister(candidate, headerReg) ?: continue
                                certInjectionsByMethod.getOrPut(method) { mutableListOf() }.add(Triple(j, "v$valueRegNum", replacementValue))
                                break
                            }
                        }
                        str == googleSignInClientId -> hasGoogleSignIn = true
                        str == facebookSdkInit -> hasFacebookSdk = true
                    }
                }
            }

            if (gmsReplacementsByMethod.isEmpty() && certInjectionsByMethod.isEmpty() && !hasGoogleSignIn && !hasFacebookSdk) {
                return@classDefForEach
            }

            val mutableClass = mutableClassDefBy(classDef)
            val methodMap = classDef.methods.zip(mutableClass.methods).toMap()

            gmsReplacementsByMethod.forEach { (method, replacements) ->
                val mutableMethod = methodMap[method] ?: return@forEach
                replacements.forEach { (index, registerA) ->
                    mutableMethod.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            registerA,
                            ImmutableStringReference(VENDOR_GMS_PACKAGE),
                        ),
                    )
                }
            }

            certInjectionsByMethod.forEach { (method, injections) ->
                val mutableMethod = methodMap[method] ?: return@forEach
                injections.sortedByDescending { it.first }.forEach { (index, registerName, value) ->
                    mutableMethod.addInstructions(
                        index,
                        "const-string $registerName, \"$value\"",
                    )
                }
            }

            if (hasGoogleSignIn) {
                mutableClass.methods
                    .filter { it.name != "<init>" && it.name != "<clinit>" && it.returnType == "Z" }
                    .forEach { it.addInstructions(0, RETURN_TRUE) }
            }

            if (hasFacebookSdk) {
                mutableClass.methods
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

    }
}
