/*
 * Ported from Morphe's "GmsCore support" patch (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/tree/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms
 * with the package rename from Morphe's "Clone app" and the manifest queries
 * from morphe-patches-library's gmsCorePackageQueriesPatch.
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE SUPPORT DESIGN GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GMS_EXTENSION_CLASS
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GmsCoreConstants
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GmsCoreVendorGroupIdFingerprint
import semicoloncolonel.mobilestream.patches.shared.misc.gms.GooglePlayUtilityFingerprint
import semicoloncolonel.mobilestream.patches.shared.misc.gms.OriginalPackageNameFingerprint
import semicoloncolonel.mobilestream.patches.shared.misc.gms.ServiceCheckFingerprint
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// YouTube TV signs in with the Google account on the device through Google
// Play services, which only answers apps signed by Google. A re-signed copy
// has to use GmsCore (ReVanced's microG build, package
// app.revanced.android.gms) instead. This does what Morphe's patch does for
// YouTube:
//
// - The app gets its own package name, so it installs beside the stock app.
// - Every Google Play services package name, permission, intent action, and
//   content provider authority in the app and its manifest points at GmsCore.
// - The manifest tells GmsCore which package name and signing certificate to
//   present to Google, so Google sees the stock app.
// - The Play services availability checks are skipped, and MainActivity asks
//   the extension to check that GmsCore is installed and may run in the
//   background.
//
// Morphe's settings screen entries, its MicroG-RE conflict and update checks,
// and the YouTube-only parts (spoofed video streams, the cast button, the
// device compliance check) are left out. YouTube TV has no settings screen
// for them, and the conflict check would flag ReVanced's GmsCore, which is
// signed with a different key than MicroG-RE.

private const val FROM_PACKAGE_NAME = Constants.PACKAGE_NAME
private const val TO_PACKAGE_NAME_DEFAULT = "app.morphe.android.youtube.unplugged"

// Old vendor id, which ReVanced's GmsCore and MicroG-RE both still use.
private const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"
private const val LOCATION_SERVICE_ACTION = "com.google.android.location.internal.GoogleLocationManagerService"

// SHA-1 of YouTube TV's original signing certificate
// (CN=youtube_android_unplugged). 10.44.0 is signed with a rotated key for
// Android 13 and up, but Google's sign-in still identifies the app by this one.
private const val SPOOFED_PACKAGE_SIGNATURE = "3a82b5ee26bc46bf68113d920e610cd090198d4a"

private lateinit var packageNameOption: Option<String>

private val toPackageName get() = packageNameOption.value ?: TO_PACKAGE_NAME_DEFAULT

private val gmsCoreSupportResourcePatch = resourcePatch {
    execute {
        val toPackageName = toPackageName

        // Text replacements, as in Morphe. These also rename the manifest
        // package (what "Clone app" does) and the app's own provider
        // authorities and permissions, so the patched app does not conflict
        // with the stock app.
        val transformations = mapOf(
            "package=\"$FROM_PACKAGE_NAME" to "package=\"$toPackageName",
            "android:authorities=\"$FROM_PACKAGE_NAME" to "android:authorities=\"$toPackageName",
            "$FROM_PACKAGE_NAME.permission.C2D_MESSAGE" to "$toPackageName.permission.C2D_MESSAGE",
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

            // Package visibility, so the extension can see that GmsCore is
            // installed on Android 11 and up.
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
    category("Setup")
    compatibleWith(Constants.COMPATIBILITY)

    // A root mount keeps the stock package name and Google's signature, so it
    // has no use for this patch. Every other install needs it.
    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.REQUIRED
        }
    }

    packageNameOption = stringOption(
        key = "packageName",
        default = TO_PACKAGE_NAME_DEFAULT,
        values = mapOf("Default" to TO_PACKAGE_NAME_DEFAULT),
        title = "Package name",
        description = "Package name to install the patched app under.",
        required = true,
    ) {
        it!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) && it != FROM_PACKAGE_NAME
    }

    dependsOn(gmsCoreSupportResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        val toPackageName = toPackageName

        GooglePlayUtilityFingerprint.method.returnEarly(0)

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
            "$FROM_PACKAGE_NAME.SuggestionProvider" to "$toPackageName.SuggestionProvider",
            "$FROM_PACKAGE_NAME.fileprovider" to "$toPackageName.fileprovider",
            // Morphe's list has this action without ".START", which YouTube TV
            // appends. Without it the fused location service cannot bind, and
            // YouTube TV cannot check the user's home area.
            "$LOCATION_SERVICE_ACTION.START" to
                "${LOCATION_SERVICE_ACTION.replace("com.google", GMS_CORE_VENDOR_GROUP_ID)}.START",
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

        // Keep the renamed app on the Primes allowlist.
        PrimeMethodFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as StringReference).string == FROM_PACKAGE_NAME
            }
            if (index < 0) throw PatchException("Package name not found in the prime method")
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "const-string v$register, \"$toPackageName\"")
        }

        CastContextFetchFingerprint.method.returnEarly()
        ServiceCheckFingerprint.method.returnEarly()

        // Original package name and GmsCore vendor for the extension.
        OriginalPackageNameFingerprint.method.returnEarly(FROM_PACKAGE_NAME)
        GmsCoreVendorGroupIdFingerprint.method.returnEarly(GMS_CORE_VENDOR_GROUP_ID)

        // Check that GmsCore is installed and allowed to run in the background.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $GMS_EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
        )

        // GNP expects the original Google package even when the installed app is renamed.
        // Up to 10.44 the target method reads the Android ID itself, so one fingerprint
        // finds it. From 10.45 the Android ID lookup is its own class: the target is the
        // one (Object)Object method that calls into that class and reads the package name.
        val (_, gnpMethod, gnpIndex) = GnpRegistrationTargetFingerprint.matchOrNull()?.let {
            Triple(it.classDef.type, it.method, it.instructionMatches[1].index)
        } ?: run {
            val idClass = GnpAndroidIdFingerprint.classDef.type
            val found = mutableListOf<Pair<String, Method>>()
            classDefForEach { classDef ->
                classDef.methods.forEach { method ->
                    if (method.returnType != "Ljava/lang/Object;" ||
                        method.parameterTypes.map { it.toString() } != listOf("Ljava/lang/Object;")
                    ) return@forEach
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    val callsIdClass = instructions.any {
                        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == idClass
                    }
                    if (callsIdClass && packageNameResult(instructions) != null) found += classDef.type to method
                }
            }
            if (found.size != 1) throw PatchException("GNP registration target not found (${found.size} matches)")
            val (type, method) = found.single()
            val mutable = mutableClassDefBy(type).methods.first { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
            Triple(type, mutable, packageNameResult(mutable.implementation!!.instructions.toList())!!)
        }
        val register = gnpMethod.getInstruction<OneRegisterInstruction>(gnpIndex).registerA
        gnpMethod.replaceInstruction(
            gnpIndex,
            BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(FROM_PACKAGE_NAME)),
        )
    }
}

/** Index of the move-result-object right after Context.getPackageName(), or null. */
private fun packageNameResult(instructions: List<Instruction>): Int? {
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
        if (instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference.definingClass == "Landroid/content/Context;" && reference.name == "getPackageName" &&
            instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        ) return index + 1
    }
    return null
}
