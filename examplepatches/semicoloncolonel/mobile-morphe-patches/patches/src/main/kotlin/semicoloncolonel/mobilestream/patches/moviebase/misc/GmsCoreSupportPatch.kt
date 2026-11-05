/*
 * Ported from Morphe's "GmsCore support" patch (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/tree/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms
 * with the package rename from Morphe's "Clone app".
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE SUPPORT DESIGN GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.patches.moviebase.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import semicoloncolonel.mobilestream.patches.moviebase.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GMS_EXTENSION_CLASS
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GmsCoreConstants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GmsCoreVendorGroupIdFingerprint
import semicoloncolonel.mobilestream.patches.shared.misc.gms.OriginalPackageNameFingerprint

// Moviebase 7.7.0 signs in with Google through Credential Manager and then
// Firebase Auth. Google answers only the app signed with Moviebase's Play
// signing key, so a re-signed copy has to sign in through GmsCore, which
// presents the original package name and key to Google. This is the YouTube
// TV GmsCore support patch without its YouTube-only parts:
//
// - With "Clone app" on, the app gets its own package name, so it installs
//   beside the stock app. With it off, it keeps com.moviebase and replaces
//   the stock app.
// - Every Google Play services package name, permission, intent action, and
//   content provider authority points at GmsCore.
// - The manifest tells GmsCore which package name and key to present.
// - Credential Manager always uses its Play services provider. On Android 14
//   and up it would otherwise go through the system, which reaches Google
//   Play services directly instead of GmsCore.
// - Credential Manager's Play services provider uses the older Sign in with
//   Google flow. With Play services 25.24 and up it asks the newer
//   identitycredentials service instead, which GmsCore closes without an
//   answer.
// - The Play services availability checks are skipped, and MainActivity asks
//   the extension to check that GmsCore is installed and may run in the
//   background.

private const val FROM_PACKAGE_NAME = Constants.PACKAGE_NAME
private const val TO_PACKAGE_NAME_DEFAULT = "app.mobilestream.moviebase"

// Old vendor id, which ReVanced's GmsCore and MicroG-RE both still use.
private const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"

// SHA-1 of Moviebase's Play app signing certificate.
private const val SPOOFED_PACKAGE_SIGNATURE = "80f82a99ff928977211f20e2d148fd0b9a72a3e1"

// androidx.credentials' CredentialProviderFactory.getBestAvailableProvider.
// Its first parameter is the factory, which also has the method that loads
// the Play services provider.
internal object CredentialProviderFactoryFingerprint : Fingerprint(
    strings = listOf("androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL", "android.software.leanback"),
)

// GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(Context, int). In
// this build it is an instance method, so the shared static fingerprint does
// not match it.
internal object PlayServicesAvailableFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf("MetadataValueReader", "This should never happen."),
)

// CredentialProviderPlayServicesImpl.onGetCredential: the overload that picks
// between the identitycredentials service and the older sign-in flow.
internal object PlayServicesGetCredentialFingerprint : Fingerprint(
    definingClass = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;",
    name = "onGetCredential",
    returnType = "V",
    custom = { method, _ -> method.callsIsAvailableOnDevice() >= 0 },
)

private fun com.android.tools.smali.dexlib2.iface.Method.callsIsAvailableOnDevice() =
    implementation?.instructions?.indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL &&
            ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                ref.name == "isAvailableOnDevice" && ref.parameterTypes.size == 1
            }
    } ?: -1

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lapp/moviebase/ui/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private lateinit var cloneAppOption: Option<Boolean>
private lateinit var packageNameOption: Option<String>

private val toPackageName
    get() = if (cloneAppOption.value == false) FROM_PACKAGE_NAME else packageNameOption.value ?: TO_PACKAGE_NAME_DEFAULT

private val gmsCoreSupportResourcePatch = resourcePatch {
    execute {
        val toPackageName = toPackageName

        // The manifest package, the app's own provider authorities, and its
        // permission, so the patched app does not conflict with the stock app.
        val transformations = mapOf(
            "package=\"$FROM_PACKAGE_NAME\"" to "package=\"$toPackageName\"",
            "android:authorities=\"$FROM_PACKAGE_NAME." to "android:authorities=\"$toPackageName.",
            "$FROM_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" to
                "$toPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
            "com.google.android.c2dm" to "$GMS_CORE_VENDOR_GROUP_ID.android.c2dm",
        )
        val manifest = get("AndroidManifest.xml")
        manifest.writeText(
            transformations.entries.fold(manifest.readText()) { text, (from, to) -> text.replace(from, to) }
        )

        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            if (root.getAttribute("package") != toPackageName) {
                throw PatchException("Manifest package was not renamed")
            }

            val application = document.getElementsByTagName("application").item(0)
            fun addMetaData(name: String, value: String) {
                application.appendChild(
                    document.createElement("meta-data").apply {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    }
                )
            }
            // GmsCore presents this package name and signature to Google.
            addMetaData("$GMS_CORE_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_NAME", FROM_PACKAGE_NAME)
            addMetaData("$GMS_CORE_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_SIGNATURE", SPOOFED_PACKAGE_SIGNATURE)
            addMetaData("app.revanced.MICROG_PACKAGE_NAME", "$GMS_CORE_VENDOR_GROUP_ID.android.gms")

            // Package visibility, so the app and the extension can see GmsCore.
            val queries = document.getElementsByTagName("queries").item(0)
                ?: document.createElement("queries").also { root.appendChild(it) }
            queries.appendChild(
                document.createElement("package").apply {
                    setAttribute("android:name", "$GMS_CORE_VENDOR_GROUP_ID.android.gms")
                }
            )
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Signs in with Google through GmsCore instead of Google Play services.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    // A root mount keeps the stock package name and Google's signature, so it
    // has no use for this patch. Every other install needs it.
    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.REQUIRED
        }
    }

    cloneAppOption = booleanOption(
        key = "cloneApp",
        default = false,
        title = "Clone app",
        description = "Installs the patched app beside the stock app. When off, the patched app keeps " +
            "Moviebase's package name, and the stock app has to be uninstalled first.",
        required = true,
    )

    packageNameOption = stringOption(
        key = "packageName",
        default = TO_PACKAGE_NAME_DEFAULT,
        values = mapOf("Default" to TO_PACKAGE_NAME_DEFAULT),
        title = "Package name",
        description = "Package name to install the patched app under when Clone app is on.",
        required = true,
    ) {
        it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) && it != FROM_PACKAGE_NAME
    }

    dependsOn(gmsCoreSupportResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // ensurePlayServicesAvailable relies on this too, so it passes as well.
        PlayServicesAvailableFingerprint.method.returnEarly(0)

        fun replaceStrings(fromString: String, toString: String) {
            string(fromString).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(toString)),
                )
            }
        }

        arrayOf(
            "com.google" to GMS_CORE_VENDOR_GROUP_ID,
            "com.google.android.gms" to "$GMS_CORE_VENDOR_GROUP_ID.android.gms",
        ).forEach { (fromString, toString) -> replaceStrings(fromString, toString) }

        (GmsCoreConstants.PERMISSIONS + GmsCoreConstants.ACTIONS + GmsCoreConstants.AUTHORITIES).forEach {
            replaceStrings(it, it.replace("com.google", GMS_CORE_VENDOR_GROUP_ID))
        }

        // content:// URIs of the Play services providers.
        val authorityPrefixes = GmsCoreConstants.AUTHORITIES.map { it to "content://$it" }
        string("content://", StringComparisonType.STARTS_WITH).matchAllMethodIndicesForEach(
            requireMatches = false,
        ) { index ->
            val instruction = getInstruction<ReferenceInstruction>(index)
            val uri = (instruction.reference as StringReference).string
            val (authority, prefix) = authorityPrefixes.firstOrNull { uri.startsWith(it.second) }
                ?: return@matchAllMethodIndicesForEach
            replaceInstruction(
                index,
                BuilderInstruction21c(
                    Opcode.CONST_STRING,
                    (instruction as OneRegisterInstruction).registerA,
                    ImmutableStringReference(
                        uri.replace(prefix, "content://${authority.replace("com.google", GMS_CORE_VENDOR_GROUP_ID)}")
                    ),
                ),
            )
        }

        // Credential Manager: always the Play services provider.
        CredentialProviderFactoryFingerprint.method.apply {
            val factory = parameterTypes.firstOrNull()?.toString()
                ?: throw PatchException("Credential provider factory has no parameters")
            val loadPlayServices = CredentialProviderFactoryFingerprint.classDef.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == returnType && it.name != name
            } ?: throw PatchException("Play services provider loader not found in $factory")
            addInstructions(
                0,
                """
                    invoke-virtual/range { p0 .. p0 }, $factory->${loadPlayServices.name}()$returnType
                    move-result-object v0
                    return-object v0
                """,
            )
        }

        // The identitycredentials service counts as unavailable, so the older flow runs.
        PlayServicesGetCredentialFingerprint.method.apply {
            val call = callsIsAvailableOnDevice()
            val result = getInstruction<OneRegisterInstruction>(call + 1)
            if (instructions[call + 1].opcode != Opcode.MOVE_RESULT) throw PatchException("isAvailableOnDevice result not found")
            replaceInstruction(call + 1, "const/4 v${result.registerA}, 0x0")
        }

        // Original package name and GmsCore vendor for the extension.
        OriginalPackageNameFingerprint.method.returnEarly(FROM_PACKAGE_NAME)
        GmsCoreVendorGroupIdFingerprint.method.returnEarly(GMS_CORE_VENDOR_GROUP_ID)

        // Check that GmsCore is installed and allowed to run in the background.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $GMS_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
        )
    }
}
