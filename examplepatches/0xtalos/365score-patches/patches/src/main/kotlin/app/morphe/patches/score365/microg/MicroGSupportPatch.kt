package app.morphe.patches.score365.microg

import app.morphe.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

private val GMS_CORE_QUERY_PACKAGES = listOf(
    MicroGConstants.GMS_CORE_PACKAGE_NAME,
    "com.mgoogle.android.gms",
    "org.microg.gms",
)

/**
 * Manifest modifications for MicroG / ReVanced GmsCore support:
 * 1. Declares all GmsCore/MicroG packages in <queries> for Android 11+ package visibility.
 * 2. Spoofs genuine package name and signing certificate for GmsCore.
 * 3. Redirects C2DM push permissions to ReVanced GmsCore.
 */
val microGResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifestNode = document.documentElement

            // 1. Ensure <queries> tag exists and declares all GmsCore / MicroG variants
            val queriesNodes = document.getElementsByTagName("queries")
            val queriesElement = if (queriesNodes.length > 0) {
                queriesNodes.item(0) as Element
            } else {
                val newQueries = document.createElement("queries")
                manifestNode.appendChild(newQueries)
                newQueries
            }
            val existing = buildSet {
                val packages = queriesElement.getElementsByTagName("package")
                for (i in 0 until packages.length) {
                    (packages.item(i) as? Element)?.getAttribute("android:name")?.let(::add)
                }
            }
            GMS_CORE_QUERY_PACKAGES.filter { it !in existing }.forEach { packageName ->
                val pkgElement = document.createElement("package")
                pkgElement.setAttribute("android:name", packageName)
                queriesElement.appendChild(pkgElement)
            }

            // 2. Add spoofing metadata
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            mapOf(
                "${MicroGConstants.GMS_CORE_VENDOR_GROUP_ID}.android.gms.SPOOFED_PACKAGE_NAME" to MicroGConstants.SCORES365_PACKAGE_NAME,
                "${MicroGConstants.GMS_CORE_VENDOR_GROUP_ID}.android.gms.SPOOFED_PACKAGE_SIGNATURE" to MicroGConstants.SCORES365_CERTIFICATE_SHA1,
                "app.revanced.MICROG_PACKAGE_NAME" to MicroGConstants.GMS_CORE_PACKAGE_NAME,
            ).forEach { (name, value) ->
                val metaElement = document.createElement("meta-data")
                metaElement.setAttribute("android:name", name)
                metaElement.setAttribute("android:value", value)
                application.appendChild(metaElement)
            }

            // 3. Rewrite c2dm and photos mars in manifest attributes
            val transformations = mapOf(
                "com.google.android.c2dm" to "${MicroGConstants.GMS_CORE_VENDOR_GROUP_ID}.android.c2dm",
                "com.google.android.libraries.photos.api.mars" to "${MicroGConstants.GMS_CORE_VENDOR_GROUP_ID}.android.apps.photos.api.mars",
            )
            val elements = document.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val attributes = elements.item(i).attributes ?: continue
                for (j in 0 until attributes.length) {
                    val attribute = attributes.item(j)
                    val value = attribute.nodeValue
                    val rewritten = transformations.entries.fold(value) { acc, (from, to) -> acc.replace(from, to) }
                    if (rewritten != value) attribute.nodeValue = rewritten
                }
            }
        }
    }
}

private const val PLAY_SERVICES_CREDENTIAL_PROVIDER =
    "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"

private const val FRAMEWORK_CREDENTIAL_MANAGER = "Landroid/credentials/CredentialManager;"
private const val GMS_CORE_EXTENSION_CLASS = "Lapp/template/extension/gmscore/GmsCoreSupport;"
private const val IDENTITY_CREDENTIALS_SERVICE_ACTION = "com.google.android.gms.identitycredentials.service.START"

private fun Method.isIsAvailableOnDevice() =
    name == "isAvailableOnDevice" && returnType == "Z" && parameterTypes.isEmpty()

/**
 * Finds androidx.credentials' framework provider (CredentialProviderFrameworkImpl):
 * the implementation of CredentialProvider holding an android.credentials.CredentialManager field.
 */
private fun BytecodePatchContext.findFrameworkCredentialProvider(): ClassDef? {
    val playServicesProvider = classDefByOrNull(PLAY_SERVICES_CREDENTIAL_PROVIDER) ?: return null

    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val holdsCredentialManager = classDef.fields.any {
            it.type == FRAMEWORK_CREDENTIAL_MANAGER && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        if (holdsCredentialManager) holders += classDef
    }
    if (holders.isEmpty()) return null

    val providerInterface = playServicesProvider.interfaces.singleOrNull { type ->
        classDefByOrNull(type)?.methods?.any { it.isIsAvailableOnDevice() } == true
    } ?: throw PatchException("CredentialProvider interface of $PLAY_SERVICES_CREDENTIAL_PROVIDER not found")

    val providers = holders.filter { providerInterface in it.interfaces }
    return providers.singleOrNull() ?: throw PatchException(
        "Expected one $providerInterface implementation holding a $FRAMEWORK_CREDENTIAL_MANAGER, " +
            "found ${providers.map { it.type }}",
    )
}

/**
 * On Android 14+, androidx.credentials uses the framework provider by default, bypassing MicroG
 * and failing with UNREGISTERED_ON_API_CONSOLE on genuine Play Services.
 * Forcing isAvailableOnDevice() to return false makes androidx fall back to PlayServicesImpl.
 */
private fun BytecodePatchContext.disableFrameworkCredentialProvider() {
    val provider = findFrameworkCredentialProvider() ?: return
    val isAvailable = mutableClassDefBy(provider).methods.singleOrNull {
        it.isIsAvailableOnDevice() && it.implementation != null
    } ?: throw PatchException("${provider.type} has no concrete isAvailableOnDevice()Z")
    isAvailable.returnEarly(false)
}

/**
 * Forces onGetCredential to route Google ID requests to BeginSignIn instead of the new
 * Identity Credentials API (com.google.android.gms.identitycredentials.service.START),
 * which MicroG RE does not implement.
 */
private fun BytecodePatchContext.routeGoogleIdRequestsToBeginSignIn() {
    if (classDefByOrNull(PLAY_SERVICES_CREDENTIAL_PROVIDER) == null) return
    var rewritten = 0
    var hasBody = false
    for (method in mutableClassDefBy(PLAY_SERVICES_CREDENTIAL_PROVIDER).methods) {
        if (method.name != "onGetCredential") continue
        val instructions = method.implementation?.instructions?.toList() ?: continue
        hasBody = true
        instructions.forEachIndexed { index, instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
            if (call.definingClass != PLAY_SERVICES_CREDENTIAL_PROVIDER || call.name != "isAvailableOnDevice" ||
                call.parameterTypes.size != 1
            ) return@forEachIndexed
            val result = instructions.getOrNull(index + 1)
            if (result?.opcode != Opcode.MOVE_RESULT) return@forEachIndexed
            method.replaceInstruction(index + 1, "const/16 v${(result as OneRegisterInstruction).registerA}, 0x0")
            rewritten++
        }
    }
    if (hasBody && rewritten == 0 && classDefByStrings(IDENTITY_CREDENTIALS_SERVICE_ACTION).isNotEmpty()) {
        throw PatchException(
            "The Identity Credentials client is present but no isAvailableOnDevice(I)Z test in " +
                "$PLAY_SERVICES_CREDENTIAL_PROVIDER->onGetCredential was found",
        )
    }
}

private fun gmsStringReplacements(): Map<String, String> = buildMap {
    put("com.google", MicroGConstants.GMS_CORE_VENDOR_GROUP_ID)
    put("com.google.android.gms", MicroGConstants.GMS_CORE_PACKAGE_NAME)
    (MicroGConstants.PERMISSIONS + MicroGConstants.ACTIONS + MicroGConstants.AUTHORITIES).forEach {
        put(it, it.replace("com.google", MicroGConstants.GMS_CORE_VENDOR_GROUP_ID))
    }
}

private fun gmsContentUriReplacement(value: String): String? {
    if (!value.startsWith("content://")) return null
    for (authority in MicroGConstants.AUTHORITIES) {
        val prefix = "content://$authority"
        if (value.startsWith(prefix)) {
            return "content://" + authority.replace("com.google", MicroGConstants.GMS_CORE_VENDOR_GROUP_ID) +
                value.substring(prefix.length)
        }
    }
    return null
}

private fun BytecodePatchContext.rewriteGmsStrings() {
    val replacements = gmsStringReplacements()
    fun replacementFor(instruction: Instruction): String? {
        if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return null
        val value = ((instruction as ReferenceInstruction).reference as StringReference).string
        return replacements[value] ?: gmsContentUriReplacement(value)
    }

    // Collect first: mutating classes while iterating them is not allowed.
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val matches = classDef.methods.any { method ->
            method.implementation?.instructions?.any { replacementFor(it) != null } == true
        }
        if (matches) targets += classDef
    }

    for (classDef in targets) {
        for (method in mutableClassDefBy(classDef).methods) {
            val instructions = method.implementation?.instructions ?: continue
            val edits = instructions.mapIndexedNotNull { index, instruction ->
                replacementFor(instruction)?.let { Triple(index, instruction, it) }
            }
            for ((index, instruction, replacement) in edits) {
                val register = (instruction as OneRegisterInstruction).registerA
                val reference = ImmutableStringReference(replacement)
                method.replaceInstruction(
                    index,
                    if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                        BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                    } else {
                        BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                    },
                )
            }
        }
    }
}

/**
 * Bytecode modifications for MicroG / ReVanced GmsCore support:
 * 1. Extends with GmsCore extension to check MicroG installation & battery optimization.
 * 2. Redirects all string references from "com.google.android.gms" to "app.revanced.android.gms".
 * 3. Redirects GMS actions, authorities, and content URIs to ReVanced GmsCore.
 * 4. Disables Android 14+ CredentialManager framework provider to prevent UNREGISTERED_ON_API_CONSOLE.
 * 5. Routes Google ID credential requests to BeginSignIn flow for MicroG compatibility.
 * 6. Forces Google Play Services availability checks to return SUCCESS (0).
 */
@Suppress("unused")
val microGSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes Google sign-in and Google APIs work by routing them to MicroG RE instead of Google Play services. " +
        "Requires MicroG RE (app.revanced.android.gms) and a Google account added in it.",
    // On by default: 365Scores' Google sign-in and FCM alerts do not work without it once the
    // APK is re-signed, and leaving it off is the most common reason sign-in "does nothing".
    default = true,
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    // A mounted (root) install keeps the original signature, so Google Play services works and
    // the manifest/bytecode changes would be ignored anyway.
    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            else -> PatchAvailability.ENABLED
        }
    }

    dependsOn(microGResourcePatch, spoofSignaturePatch)

    extendWith("extensions/gmscore.mpe")

    execute {
        // These fingerprints are shared across patch runs in one process (the smoke test patches
        // twice), so drop any stale match first. A stale match would silently edit the previous
        // run's method and leave this APK unpatched.
        GooglePlayUtilityFingerprint.clearMatch()
        ServiceCheckFingerprint.clearMatch()
        SplashOnCreateFingerprint.clearMatch()

        // Required: without checkGmsCore the user is never told that the sign-in backend is
        // missing, and the patch would appear to "do nothing" on a device without MicroG RE.
        val mainActivityOnCreate = SplashOnCreateFingerprint.method

        val googlePlayUtility = GooglePlayUtilityFingerprint.methodOrNull
        if (googlePlayUtility == null && classDefByStrings(GOOGLE_SIGNATURE_INVALID_WARNING).isNotEmpty()) {
            throw PatchException(
                "play-services-basement is present but isGooglePlayServicesAvailable(Context, int) was not found",
            )
        }
        googlePlayUtility?.returnEarly(0)

        val serviceCheck = ServiceCheckFingerprint.methodOrNull
        if (serviceCheck == null && classDefByStrings(SERVICE_CHECK_MESSAGE).any { classDef ->
                classDef.methods.any { method ->
                    method.returnType == "V" && method.name != "<init>" && method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SERVICE_CHECK_MESSAGE
                    } == true
                }
            }
        ) {
            throw PatchException(
                "play-services-basement is present but ensurePlayServicesAvailable(Context[, int]) was not found",
            )
        }
        serviceCheck?.returnEarly()

        disableFrameworkCredentialProvider()
        routeGoogleIdRequestsToBeginSignIn()

        rewriteGmsStrings()

        // Verify GmsCore is installed and prompt for battery optimization whitelist. p0 = activity.
        val checkGmsCore =
            "invoke-static/range { p0 .. p0 }, $GMS_CORE_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V"
        mainActivityOnCreate.addInstructions(0, checkGmsCore)
        val inserted = mainActivityOnCreate.implementation?.instructions?.firstOrNull()
        if ((inserted as? ReferenceInstruction)?.reference?.toString() !=
            "$GMS_CORE_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V"
        ) {
            throw PatchException("checkGmsCore was not inserted at the start of ${mainActivityOnCreate.name}")
        }
    }
}
