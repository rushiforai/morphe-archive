package app.aidan.patches.nhl.notifications

import app.aidan.patches.nhl.shared.COMPATIBILITY_NHL
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val enableNotificationsAndLiveActivitiesPatch = bytecodePatch(
    name = "Enable Notifications and Live Activities",
    description = "Enables Firebase Cloud Messaging (FCM) push notifications and Live Activities (live game score lockscreen and notification drawer updates) by spoofing the release certificate SHA-1, bypassing Play Services signature checks for MicroG, and activating the live score tracker gate.",
    default = true
) {
    category("Notifications")
    compatibleWith(COMPATIBILITY_NHL)
    extendWith("extensions/extension.mpe")

    val spoofCertificateHash = booleanOption(
        key = "spoofCertificateHash",
        title = "Spoof Certificate SHA-1",
        description = "Spoofs the release signing certificate SHA-1 in Firebase Installations requests so FCM registration succeeds on re-signed APKs.",
        default = true
    )

    val supportMicroG = booleanOption(
        key = "supportMicroG",
        title = "Support MicroG & Unverified Play Services",
        description = "Bypasses GoogleSignatureVerifier checks to allow push registration with MicroG and unverified Play Services.",
        default = true
    )

    val forceLiveActivitiesEnabled = booleanOption(
        key = "forceLiveActivitiesEnabled",
        title = "Force Live Activities Enabled",
        description = "Forces the Live Activity game score tracker toggle to be available on all live and upcoming games.",
        default = true
    )

    execute {
        if (spoofCertificateHash.value == true) {
            spoofReleaseCertificateHash()
        }

        if (supportMicroG.value == true) {
            bypassPlayServicesSignatureChecks()
        }

        if (forceLiveActivitiesEnabled.value == true) {
            forceLiveActivitiesActive()
        }
    }
}

/**
 * Spoofs the package signing certificate SHA-1 hash in AndroidUtilsLight to match the official
 * NHL release key (9D:1B:1A:C8:28:E0:47:72:A7:34:91:D8:39:D9:85:2B:80:C4:66:92).
 * Firebase Installations (FIS) uses this method to populate the X-Android-Cert header;
 * returning the official release hash allows re-signed APKs to obtain valid FCM tokens.
 */
private fun BytecodePatchContext.spoofReleaseCertificateHash() {
    val androidUtilsClass = mutableClassDefByOrNull("Lcom/google/android/gms/common/util/AndroidUtilsLight;")
        ?: throw PatchException("Missing required class Lcom/google/android/gms/common/util/AndroidUtilsLight;")

    val hashMethod = androidUtilsClass.methods.singleOrNull { method ->
        method.name == "getPackageCertificateHashBytes" &&
            method.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
            method.returnType == "[B" &&
            method.implementation != null
    } ?: throw PatchException("Missing required method AndroidUtilsLight.getPackageCertificateHashBytes(Context, String)[B")

    hashMethod.addInstructions(
        0,
        """
        invoke-static {}, Lapp/aidan/extension/nhl/PushBridge;->getCertificateHashBytes()[B
        move-result-object v0
        return-object v0
        """.trimIndent()
    )
}

/**
 * Bypasses GoogleSignatureVerifier and GooglePlayServices availability checks to ensure
 * FCM push token registration and Airship background sync succeed on MicroG or systems with
 * unverified Google Play Services.
 */
private fun BytecodePatchContext.bypassPlayServicesSignatureChecks() {
    // 1. GoogleSignatureVerifier signature validation methods
    val verifierClass = mutableClassDefByOrNull("Lcom/google/android/gms/common/GoogleSignatureVerifier;")
        ?: throw PatchException("Missing required class Lcom/google/android/gms/common/GoogleSignatureVerifier;")

    val zzaMethod = verifierClass.methods.singleOrNull { method ->
        method.name == "zza" &&
            method.parameterTypes == listOf("Landroid/content/pm/PackageInfo;", "Z") &&
            method.returnType == "Z" &&
            method.implementation != null
    } ?: throw PatchException("Missing required method GoogleSignatureVerifier.zza(PackageInfo, Z)Z")

    zzaMethod.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )

    val publicSignedMethod = verifierClass.methods.singleOrNull { method ->
        method.name == "isGooglePublicSignedPackage" &&
            method.parameterTypes == listOf("Landroid/content/pm/PackageInfo;") &&
            method.returnType == "Z" &&
            method.implementation != null
    } ?: throw PatchException("Missing required method GoogleSignatureVerifier.isGooglePublicSignedPackage(PackageInfo)Z")

    publicSignedMethod.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )

    val packageSignedMethod = verifierClass.methods.singleOrNull { method ->
        method.name == "isPackageGoogleSigned" &&
            method.parameterTypes == listOf("Ljava/lang/String;") &&
            method.returnType == "Z" &&
            method.implementation != null
    } ?: throw PatchException("Missing required method GoogleSignatureVerifier.isPackageGoogleSigned(String)Z")

    packageSignedMethod.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )

    val uidSignedMethod = verifierClass.methods.singleOrNull { method ->
        method.name == "isUidGoogleSigned" &&
            method.parameterTypes == listOf("I") &&
            method.returnType == "Z" &&
            method.implementation != null
    } ?: throw PatchException("Missing required method GoogleSignatureVerifier.isUidGoogleSigned(I)Z")

    uidSignedMethod.addInstructions(
        0,
        """
        const/4 v0, 0x1
        return v0
        """.trimIndent()
    )

    // 2. GooglePlayServicesUtilLight availability methods (return 0 = ConnectionResult.SUCCESS)
    val utilLightClass = mutableClassDefByOrNull("Lcom/google/android/gms/common/GooglePlayServicesUtilLight;")
        ?: throw PatchException("Missing required class Lcom/google/android/gms/common/GooglePlayServicesUtilLight;")

    var utilPatched = false
    for (method in utilLightClass.methods) {
        if (method.name == "isGooglePlayServicesAvailable" && method.returnType == "I" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent()
            )
            utilPatched = true
        }
    }
    if (!utilPatched) {
        throw PatchException("Missing required method GooglePlayServicesUtilLight.isGooglePlayServicesAvailable")
    }

    // 3. GoogleApiAvailabilityLight availability methods (return 0 = ConnectionResult.SUCCESS)
    val apiAvailClass = mutableClassDefByOrNull("Lcom/google/android/gms/common/GoogleApiAvailabilityLight;")
        ?: throw PatchException("Missing required class Lcom/google/android/gms/common/GoogleApiAvailabilityLight;")

    var apiPatched = false
    for (method in apiAvailClass.methods) {
        if (method.name == "isGooglePlayServicesAvailable" && method.returnType == "I" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent()
            )
            apiPatched = true
        }
    }
    if (!apiPatched) {
        throw PatchException("Missing required method GoogleApiAvailabilityLight.isGooglePlayServicesAvailable")
    }
}

/**
 * Activates the Live Activity feature gate across API response models and view model mappers:
 * 1. Forces ActionsResponse.liveActivityEnabled (Lrd;->j: Boolean) to Boolean.TRUE upon construction.
 * 2. Forces Action.liveActivityEnabled (Lrb;->i: boolean) to true upon construction.
 * This ensures GameCenterViewModel (ip7) resolves showLiveActivityToggle to true for all live and upcoming games.
 */
private fun BytecodePatchContext.forceLiveActivitiesActive() {
    // 1. ActionsResponse constructor (Lrd;)
    val rdClass = mutableClassDefByOrNull("Lrd;")
        ?: throw PatchException("Missing required class Lrd; (ActionsResponse)")

    val rdConstructor = rdClass.methods.singleOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes == listOf(
                "I",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Lfva;",
                "Lfva;",
                "Lfva;",
                "Ljava/lang/String;",
                "Lfva;",
                "Lfva;",
                "Lfva;",
                "Ljava/lang/Boolean;"
            ) &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required ActionsResponse constructor in Lrd;")

    val rdImpl = rdConstructor.implementation
        ?: throw PatchException("ActionsResponse constructor in Lrd; has no implementation")

    val rdReturnIndices = rdImpl.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()

    if (rdReturnIndices.isEmpty()) {
        throw PatchException("ActionsResponse constructor has no return instructions")
    }

    for (returnIdx in rdReturnIndices) {
        rdConstructor.addInstructions(
            returnIdx,
            """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            iput-object v0, p0, Lrd;->j:Ljava/lang/Boolean;
            """.trimIndent()
        )
    }

    // 2. Action constructor (Lrb;)
    val rbClass = mutableClassDefByOrNull("Lrb;")
        ?: throw PatchException("Missing required class Lrb; (Action)")

    val rbConstructor = rbClass.methods.singleOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes == listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Lafe;",
                "Lafe;",
                "Lafe;",
                "Leva;",
                "Lafe;",
                "Lafe;",
                "Z"
            ) &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required Action constructor in Lrb;")

    val rbImpl = rbConstructor.implementation
        ?: throw PatchException("Action constructor in Lrb; has no implementation")

    val rbReturnIndices = rbImpl.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()

    if (rbReturnIndices.isEmpty()) {
        throw PatchException("Action constructor has no return instructions")
    }

    for (returnIdx in rbReturnIndices) {
        rbConstructor.addInstructions(
            returnIdx,
            """
            const/4 p9, 0x1
            iput-boolean p9, p0, Lrb;->i:Z
            """.trimIndent()
        )
    }
}
