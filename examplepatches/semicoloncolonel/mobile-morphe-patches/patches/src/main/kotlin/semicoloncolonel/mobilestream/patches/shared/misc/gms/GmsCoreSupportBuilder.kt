/*
 * Ported from Morphe's "GmsCore support" patch (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/tree/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms
 * with the package rename from Morphe's "Clone app".
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE SUPPORT DESIGN GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.patches.shared.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
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
import org.w3c.dom.Element

// The same GmsCore support as the Moviebase patch, for apps that only need
// their package name, Play signing certificate, and launcher activity filled
// in. Google sign-in, push messages, and other Play services calls go through
// GmsCore, which presents the original package name and certificate to Google.
//
// - With "Clone app" on, the app gets its own package name, and its own
//   permissions and provider authorities are renamed, so it installs beside
//   the stock app. With it off, it keeps its package name and replaces it.
// - Every Google Play services package name, permission, intent action, and
//   content provider authority points at GmsCore.
// - The manifest tells GmsCore which package name and certificate to present.
// - Apps that sign in through Credential Manager always use its Play services
//   provider, through the older Sign in with Google flow that GmsCore answers.
// - The Play services availability checks pass, and the launcher activity asks
//   the extension to check that GmsCore is installed and may run in the
//   background.

// Old vendor id, which ReVanced's GmsCore and MicroG-RE both still use.
private const val VENDOR = "app.revanced"

// GoogleApiAvailabilityLight / GooglePlayServicesUtilLight
// .isGooglePlayServicesAvailable(Context, int), static or instance.
internal object AnyPlayServicesAvailableFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf("MetadataValueReader", "This should never happen."),
)

// The same method where the class keeps its name (no strings to match on).
internal object NamedPlayServicesAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;",
    name = "isGooglePlayServicesAvailable",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

// androidx.credentials' CredentialProviderFactory.getBestAvailableProvider.
internal object AnyCredentialProviderFactoryFingerprint : Fingerprint(
    strings = listOf("androidx.credentials.TYPE_CLEAR_RESTORE_CREDENTIAL", "android.software.leanback"),
)

// CredentialProviderPlayServicesImpl.onGetCredential, the overload that picks
// between the identitycredentials service and the older sign-in flow.
internal object AnyPlayServicesGetCredentialFingerprint : Fingerprint(
    definingClass = "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;",
    name = "onGetCredential",
    returnType = "V",
    custom = { method, _ -> method.isAvailableOnDeviceCall() >= 0 },
)

private fun com.android.tools.smali.dexlib2.iface.Method.isAvailableOnDeviceCall() =
    implementation?.instructions?.indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL &&
            ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                ref.name == "isAvailableOnDevice" && ref.parameterTypes.size == 1
            }
    } ?: -1

/**
 * @param appName Shown in the Clone app option.
 * @param packageName The app's package name.
 * @param clonePackageName Default package name when Clone app is on.
 * @param signature SHA-1 of the app's Play signing certificate, lowercase hex.
 * @param launcherActivity Type of the activity whose onCreate checks for GmsCore.
 * @param required Whether the app cannot sign in without it. Apps that also
 *   offer email or other sign-ins get it as an opt-in patch, because it also
 *   moves push notifications to GmsCore.
 */
internal fun gmsCoreSupportPatch(
    compatibility: Compatibility,
    appName: String,
    packageName: String,
    clonePackageName: String,
    signature: String,
    launcherActivity: String,
    required: Boolean = false,
): BytecodePatch {
    lateinit var cloneApp: Option<Boolean>
    lateinit var clonePackage: Option<String>
    fun targetPackage() = if (cloneApp.value == false) packageName else clonePackage.value ?: clonePackageName

    val resources = resourcePatch {
        execute {
            val target = targetPackage()
            document("AndroidManifest.xml").use { document ->
                val root = document.documentElement
                root.setAttribute("package", target)

                fun Element.renameAttribute(attribute: String, rename: (String) -> String) {
                    val value = getAttribute(attribute)
                    if (value.isNotEmpty()) setAttribute(attribute, rename(value))
                }
                val ownPrefix = "$packageName."
                fun own(value: String) = if (value.startsWith(ownPrefix)) target + value.removePrefix(packageName) else value

                // In clone mode, the app's own permissions and authorities.
                if (target != packageName) {
                    listOf("permission", "uses-permission").forEach { tag ->
                        val nodes = document.getElementsByTagName(tag)
                        for (i in 0 until nodes.length) (nodes.item(i) as Element).renameAttribute("android:name", ::own)
                    }
                    val providers = document.getElementsByTagName("provider")
                    for (i in 0 until providers.length) {
                        (providers.item(i) as Element).renameAttribute("android:authorities") { authorities ->
                            authorities.split(';').joinToString(";") { own(it) }
                        }
                    }
                }

                // Push messages go through GmsCore's c2dm.
                listOf("permission", "uses-permission", "action").forEach { tag ->
                    val nodes = document.getElementsByTagName(tag)
                    for (i in 0 until nodes.length) {
                        (nodes.item(i) as Element).renameAttribute("android:name") {
                            it.replace("com.google.android.c2dm", "$VENDOR.android.c2dm")
                        }
                    }
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
                addMetaData("$VENDOR.android.gms.SPOOFED_PACKAGE_NAME", packageName)
                addMetaData("$VENDOR.android.gms.SPOOFED_PACKAGE_SIGNATURE", signature)
                addMetaData("app.revanced.MICROG_PACKAGE_NAME", "$VENDOR.android.gms")

                val queries = document.getElementsByTagName("queries").item(0)
                    ?: document.createElement("queries").also { root.appendChild(it) }
                queries.appendChild(
                    document.createElement("package").apply { setAttribute("android:name", "$VENDOR.android.gms") }
                )
            }
        }
    }

    val launcherOnCreate = Fingerprint(
        definingClass = launcherActivity,
        name = "onCreate",
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
    )

    return bytecodePatch(
        name = "GmsCore support",
        description = "Signs in with Google through GmsCore instead of Google Play services.",
        default = required,
    ) {
        compatibleWith(compatibility)

        // A root mount keeps the stock package name and Google's signature.
        availability { installer, _ ->
            when (installer) {
                InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
                InstallerType.STANDARD, InstallerType.SHIZUKU ->
                    if (required) PatchAvailability.REQUIRED else PatchAvailability.DISABLED
            }
        }

        cloneApp = booleanOption(
            key = "cloneApp",
            default = false,
            title = "Clone app",
            description = "Installs the patched app beside the stock app. When off, the patched app keeps " +
                "$appName's package name, and the stock app has to be uninstalled first.",
            required = true,
        )

        clonePackage = stringOption(
            key = "packageName",
            default = clonePackageName,
            values = mapOf("Default" to clonePackageName),
            title = "Package name",
            description = "Package name to install the patched app under when Clone app is on.",
            required = true,
        ) {
            it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) && it != packageName
        }

        dependsOn(resources)

        extendWith("extensions/extension.mpe")

        execute {
            val available = AnyPlayServicesAvailableFingerprint.methodOrNull
                ?: NamedPlayServicesAvailableFingerprint.methodOrNull
                ?: throw PatchException("Play services availability check not found")
            available.returnEarly(0)

            fun replaceStrings(from: String, to: String) {
                string(from).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    replaceInstruction(
                        index,
                        BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(to)),
                    )
                }
            }

            arrayOf(
                "com.google" to VENDOR,
                "com.google.android.gms" to "$VENDOR.android.gms",
            ).forEach { (from, to) -> replaceStrings(from, to) }

            (GmsCoreConstants.PERMISSIONS + GmsCoreConstants.ACTIONS + GmsCoreConstants.AUTHORITIES).forEach {
                replaceStrings(it, it.replace("com.google", VENDOR))
            }

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
                            uri.replace(prefix, "content://${authority.replace("com.google", VENDOR)}")
                        ),
                    ),
                )
            }

            // Credential Manager, where the app uses it. On Android 14 and up
            // it prefers the system provider, which reaches Google Play
            // services directly. Where R8 merged the provider choice into the
            // caller, the system provider's isAvailableOnDevice() check now
            // says no, so the Play services provider is used.
            var mergedChoice = 0
            string("android.software.leanback").matchAllMethodIndicesForEach(requireMatches = false) { _ ->
                val calls = instructions.withIndex().filter { (_, insn) ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as ReferenceInstruction).reference as MethodReference).let { ref ->
                            ref.name == "isAvailableOnDevice" && ref.parameterTypes.isEmpty() && ref.returnType == "Z"
                        }
                }
                calls.reversed().forEach { (index, _) ->
                    if (instructions[index + 1].opcode == Opcode.MOVE_RESULT) {
                        val result = getInstruction<OneRegisterInstruction>(index + 1).registerA
                        replaceInstruction(index + 1, "const/4 v$result, 0x0")
                        mergedChoice++
                    }
                }
            }

            // Where the factory method is still separate, it always loads the
            // Play services provider.
            if (mergedChoice == 0) AnyCredentialProviderFactoryFingerprint.methodOrNull?.apply {
                val factory = parameterTypes.firstOrNull()?.toString()
                    ?: throw PatchException("Credential provider factory has no parameters")
                val loadPlayServices = AnyCredentialProviderFactoryFingerprint.classDef.methods.firstOrNull {
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
            AnyPlayServicesGetCredentialFingerprint.methodOrNull?.apply {
                val call = isAvailableOnDeviceCall()
                if (instructions[call + 1].opcode != Opcode.MOVE_RESULT) {
                    throw PatchException("isAvailableOnDevice result not found")
                }
                val result = getInstruction<OneRegisterInstruction>(call + 1)
                replaceInstruction(call + 1, "const/4 v${result.registerA}, 0x0")
            }

            OriginalPackageNameFingerprint.method.returnEarly(packageName)
            GmsCoreVendorGroupIdFingerprint.method.returnEarly(VENDOR)

            launcherOnCreate.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, $GMS_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
            )
        }
    }
}
