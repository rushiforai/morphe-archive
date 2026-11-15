package app.template.patches.wps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_WPS_OFFICE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

// ============================================================================
// Google sign-in through MicroG RE
//
// WPS signs in through Google's own play-services-auth client, which it bundles
// in its dex. It asks for an id_token for the server client
//   507860335923-sttjnajpflmnsfs06143ci7eldpqbvur.apps.googleusercontent.com
// and posts that token to Kingsoft's backend.
//
// A re-signed (patched or cloned) WPS cannot use real Play services: Google
// rejects the app because the (package name, signing certificate) pair it
// presents is no longer the registered one. MicroG RE solves this by asking
// Google for the token *as the original app*: it reads the original package name
// and the SHA-1 of the original signing certificate from the calling app's
// manifest meta-data and presents those to Google. Google then sees
// cn.wps.moffice_eng signed by Kingsoft's key, exactly as the OAuth client was
// registered.
//
// So this is the whole trick, and it is why the same patch keeps working when
// the app is cloned to another package name: the identity handed to Google is
// always the ORIGINAL one, hard-coded below, never the package name the app
// currently runs under.
//
// Verified against:
//   MicroG RE 7.3.0 (app.revanced.android.gms,
//     sha256 67b794fd5221512a11d5950ec214fc0af0e3a8f72840d01235920729c7e73f5e)
//     - org.microg.gms.common.PackageSpoofUtils reads exactly these two keys via
//       getPackageInfo(pkg, GET_META_DATA) -> applicationInfo.metaData;
//     - the signature value is hex-decoded two characters at a time, so it is a
//       bare 40-character SHA-1, no colons, no spaces;
//     - the account type is `app.revanced`;
//     - it exports the `app.revanced.*` service actions, permissions and provider
//       authorities this patch routes to (checked one by one in its manifest).
//   WPS Office 26.11.0 b1650, base APK sha256-verified against the audited stock
//     bundle; the signing certificate SHA-256 matches WPS_OFFICE_SIGNER_SHA256.
// ============================================================================

/** Package the stock app installs as. Never change: it is the registered identity. */
internal const val WPS_ORIGINAL_PACKAGE = "cn.wps.moffice_eng"

/**
 * SHA-1 of Kingsoft's signing certificate, read out of the stock APK's v2/v3
 * signing block (CN=KSO Agent, valid 2011-04-11..2038-08-27). Its SHA-256 is
 * WPS_OFFICE_SIGNER_SHA256. This is what MicroG RE forwards to Google.
 */
internal const val WPS_ORIGINAL_SIGNER_SHA1 = "7266e5a058b08d4c67214e681a463eabe4034a32"

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Package visibility for the sign-in hub. WPS declares neither package in its stock manifest, so on
 * Android 11+ it cannot resolve the Play services process by name. Both are listed because a build
 * can be pointed at real Play services or at MicroG RE (app.revanced.android.gms).
 */
internal val PLAY_SERVICES_PACKAGES = listOf(
    "com.google.android.gms",
    MICROG_PACKAGE,
)

// ============================================================================
// Options - each step can be turned off on its own.
// ============================================================================

internal val spoofOriginalIdentityOption = booleanOption(
    key = "spoofOriginalIdentity",
    default = true,
    title = "Sign in as the original app",
    description = "Tells MicroG the app's original name and signature, which is what makes Google accept the sign-in.",
)

internal val routeGoogleServicesOption = booleanOption(
    key = "routeGoogleServices",
    default = true,
    title = "Send Google calls to MicroG",
    description = "Points WPS's Play services calls at MicroG instead of Google.",
)

internal val forceAvailabilityOption = booleanOption(
    key = "forceGmsAvailability",
    default = true,
    title = "Report Play services as available",
    description = "MicroG fails Google's signature check, so this answers the availability check with yes.",
)

internal val routePushOption = booleanOption(
    key = "routePush",
    default = true,
    title = "Route notifications through MicroG",
    description = "Sends push notifications through MicroG so they keep arriving.",
)

internal val addMicrogQueriesOption = booleanOption(
    key = "addMicrogQueries",
    default = true,
    title = "Let the app find Google and MicroG",
    description = "Makes both Play services packages visible on Android 11+, so sign-in can reach MicroG. " +
        "Stock WPS declares neither, so leaving this on changes nothing else.",
)

// ============================================================================
// Manifest
// ============================================================================

internal val wpsMicroGManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement ?: throw PatchException(
                "WPS MicroG patch: AndroidManifest.xml has no root element",
            )
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("WPS MicroG patch: AndroidManifest.xml has no <application>")

            if (spoofOriginalIdentityOption.value == true) {
                val existing = application.childNodes
                val present = (0 until existing.length).mapNotNull { index ->
                    val node = existing.item(index)
                    if (node is Element && node.tagName == "meta-data") {
                        node.getAttributeNS(ANDROID_NS, "name")
                    } else {
                        null
                    }
                }.toSet()

                mapOf(
                    "$MICROG_PACKAGE.SPOOFED_PACKAGE_NAME" to WPS_ORIGINAL_PACKAGE,
                    "$MICROG_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to WPS_ORIGINAL_SIGNER_SHA1,
                    // How a Morphe extension or the app can look for MicroG; harmless if unread.
                    "$MICROG_VENDOR.MICROG_PACKAGE_NAME" to MICROG_PACKAGE,
                ).forEach { (name, value) ->
                    if (name in present) return@forEach
                    val entry = document.createElement("meta-data")
                    entry.setAttributeNS(ANDROID_NS, "android:name", name)
                    entry.setAttributeNS(ANDROID_NS, "android:value", value)
                    application.appendChild(entry)
                }
            }

            if (addMicrogQueriesOption.value == true) {
                val existingQueries = document.getElementsByTagName("queries")
                val queries = if (existingQueries.length > 0) {
                    existingQueries.item(0) as Element
                } else {
                    document.createElement("queries").also { manifest.insertBefore(it, application) }
                }
                PLAY_SERVICES_PACKAGES.forEach { packageName ->
                    val alreadyDeclared = (0 until queries.childNodes.length).any { index ->
                        val node = queries.childNodes.item(index)
                        node is Element && node.tagName == "package" &&
                            node.getAttributeNS(ANDROID_NS, "name") == packageName
                    }
                    if (!alreadyDeclared) {
                        val entry = document.createElement("package")
                        entry.setAttributeNS(ANDROID_NS, "android:name", packageName)
                        queries.appendChild(entry)
                    }
                }
            }

            if (routePushOption.value == true) {
                // c2dm permissions and actions live in attributes; rewrite the whole document.
                val transformations = mapOf(
                    "com.google.android.c2dm" to MICROG_C2DM,
                )
                val elements = document.getElementsByTagName("*")
                for (i in 0 until elements.length) {
                    val attributes = elements.item(i).attributes ?: continue
                    for (j in 0 until attributes.length) {
                        val attribute = attributes.item(j)
                        val original = attribute.nodeValue ?: continue
                        val rewritten = transformations.entries.fold(original) { acc, (from, to) ->
                            acc.replace(from, to)
                        }
                        if (rewritten != original) attribute.nodeValue = rewritten
                    }
                }
            }
        }
    }
}

// ============================================================================
// Dex
// ============================================================================

/** Exact string constants, old to new. Everything else is left alone. */
private fun gmsStringReplacements(): Map<String, String> = buildMap {
    put("com.google", MICROG_VENDOR)
    put("com.google.android.gms", MICROG_PACKAGE)
    (MicroGRoutes.PERMISSIONS + MicroGRoutes.ACTIONS + MicroGRoutes.AUTHORITIES).forEach { name ->
        put(name, name.replace("com.google", MICROG_VENDOR))
    }
}

/** `content://` URIs whose authority is one of MicroG's providers. */
private fun contentUriReplacement(value: String): String? {
    if (!value.startsWith("content://")) return null
    for (authority in MicroGRoutes.AUTHORITIES) {
        val prefix = "content://$authority"
        if (value.startsWith(prefix)) {
            return "content://" + authority.replace("com.google", MICROG_VENDOR) +
                value.substring(prefix.length)
        }
    }
    return null
}

private fun replacementFor(instruction: Instruction, replacements: Map<String, String>): String? {
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
        return null
    }
    val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        ?: return null
    return replacements[value] ?: contentUriReplacement(value)
}

/**
 * Replaces a method body with a fixed one, preserving signature, annotations and
 * hidden-API flags. The register count is kept, so register references stay valid.
 */
private fun MutableClass.forceBody(method: MutableMethod, body: String, label: String) {
    val implementation = method.implementation
        ?: throw PatchException("WPS MicroG patch: $label has no body to replace")
    val fresh = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        MutableMethodImplementation(implementation.registerCount),
    ).toMutable()
    fresh.addInstructions(0, body)
    methods.remove(method)
    methods.add(fresh)
}

internal val wpsMicroGSignInPatch = bytecodePatch(
    name = "Google sign-in via MicroG RE",
    description = "Makes Google sign-in work on a re-signed WPS by signing in as the original app. Needs MicroG RE " +
        "installed with a Google account added. WPS account login is unaffected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WPS_OFFICE)

    dependsOn(wpsMicroGManifestPatch)

    spoofOriginalIdentityOption()
    routeGoogleServicesOption()
    forceAvailabilityOption()
    routePushOption()
    addMicrogQueriesOption()

    execute {
        // Resolve these first: both match on the literal "com.google.android.gms"
        // that the rewrite below removes.
        val availability = if (forceAvailabilityOption.value == true) {
            WpsPlayServicesAvailabilityFingerprint.methodOrNull
                ?: throw PatchException(
                    "WPS MicroG patch: GooglePlayServicesUtilLight.isGooglePlayServicesAvailable " +
                        "not found. WPS 26.11.0 (b1650) is the supported build.",
                )
        } else {
            null
        }
        val ensureAvailable = if (forceAvailabilityOption.value == true) {
            WpsPlayServicesEnsureFingerprint.methodOrNull
                ?: throw PatchException(
                    "WPS MicroG patch: ensurePlayServicesAvailable not found. " +
                        "WPS 26.11.0 (b1650) is the supported build.",
                )
        } else {
            null
        }

        if (routeGoogleServicesOption.value == true) {
            val replacements = gmsStringReplacements()

            // Collect first: classes must not be mutated while iterating them.
            val targets = mutableListOf<ClassDef>()
            classDefForEach { classDef ->
                val hit = classDef.methods.any { method ->
                    method.implementation?.instructions?.any {
                        replacementFor(it, replacements) != null
                    } == true
                }
                if (hit) targets += classDef
            }

            var edits = 0
            for (classDef in targets) {
                val mutableClass = mutableClassDefBy(classDef)
                for (method in mutableClass.methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    instructions.forEachIndexed { index, instruction ->
                        val replacement = replacementFor(instruction, replacements) ?: return@forEachIndexed
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                        edits++
                    }
                }
            }

            if (edits == 0) {
                throw PatchException(
                    "WPS MicroG patch: no Google Play services string was rewritten, the dex layout changed",
                )
            }
            println("MicroG: rewrote $edits Google Play services string(s) in ${targets.size} class(es).")
        }

        if (availability != null) {
            val owner = mutableClassDefBy(availability.definingClass)
            owner.forceBody(
                owner.methods.single { it.name == availability.name && it.returnType == "I" && it.parameterTypes == availability.parameterTypes },
                "const/4 v0, 0x0\nreturn v0",
                "isGooglePlayServicesAvailable",
            )
        }
        if (ensureAvailable != null) {
            val owner = mutableClassDefBy(ensureAvailable.definingClass)
            owner.forceBody(
                owner.methods.single { it.name == ensureAvailable.name && it.returnType == "V" && it.parameterTypes == ensureAvailable.parameterTypes },
                "return-void",
                "ensurePlayServicesAvailable",
            )
        }

        println(
            "MicroG: identity is $WPS_ORIGINAL_PACKAGE signed by $WPS_ORIGINAL_SIGNER_SHA1; " +
                "MicroG RE must be installed as $MICROG_PACKAGE.",
        )
    }
}
