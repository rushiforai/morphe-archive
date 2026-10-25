/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

// Modified for Heval's Morphe Patches (2026-10-11): reimplemented on morphe-patcher 1.8.0 and
// morphe-patches-library 1.0.4 (no matchAllMethodIndicesForEach / matchSingle). Differences from
// upstream: no YouTube settings screen or link-handling patch, no "Clone app" dependency (the
// package rename is an option of this patch, default off), no GNP registration hook, no
// REQUEST_DELETE_PACKAGES permission (the extension has no uninstall flow), the play-services
// fingerprints are optional and do not require static methods, and the extension is the
// standalone extensions/gmscore module. The
// string rewrite rules and the PERMISSIONS / AUTHORITIES tables are unchanged; ACTIONS gains
// one entry (marked below). Added: androidx.credentials' framework provider is reported as
// unavailable so Credential Manager uses its Play services provider (and so MicroG RE), and
// (2026-10-12) its Google ID requests take the BeginSignIn flow instead of the Identity
// Credentials API, which MicroG RE 7.2.1 does not serve.

package app.template.patches.shared.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.returnEarly
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.misc.gms.GmsCoreConstants.ACTIONS
import app.template.patches.shared.misc.gms.GmsCoreConstants.AUTHORITIES
import app.template.patches.shared.misc.gms.GmsCoreConstants.PERMISSIONS
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
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Old vendor id for maximum backwards compatibility. MicroG RE is installed as
 * `app.revanced.android.gms`.
 */
internal const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"

internal const val GMS_CORE_EXTENSION_CLASS = "Lapp/template/extension/gmscore/GmsCoreSupport;"

private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")
private val SIGNATURE_SHA1_REGEX = Regex("^[0-9a-f]{40}$")

/**
 * Builds a "GmsCore support" patch that lets an app reach Google sign-in and Google APIs through
 * MicroG RE instead of Google Play services, which rejects the re-signed patched app.
 *
 * MicroG RE spoofs the original package name and signing certificate for any app whose manifest
 * declares them as `<meta-data>`, so the patch only has to:
 * 1. add that meta-data, the `<queries>` for MicroG and the c2dm manifest renames (resource part);
 * 2. point every Google Play services package, permission, intent action and provider authority
 *    string in the dex at MicroG RE, and report Google Play services as available;
 * 3. keep androidx.credentials (Credential Manager) off the Android 14+ framework path, which
 *    goes to the real Google Play services, and on the BeginSignIn flow MicroG RE implements;
 * 4. call the extension at the start of the main activity to tell the user when MicroG RE is
 *    missing or battery-optimised.
 *
 * @param fromPackageName The package name of the original app.
 * @param spoofedPackageSignature SHA-1 of the original app's signing certificate, as lowercase hex
 *        without colons (`apksigner verify --print-certs`).
 * @param mainActivityOnCreateFingerprint The launcher activity's `onCreate(Bundle)`. Anchor it on
 *        the manifest-declared class name, which R8 cannot rename.
 * @param compatibility The app this patch applies to.
 * @param earlyReturnFingerprints App-specific methods that must do nothing (void) or return false
 *        (boolean) under MicroG. All are mandatory.
 * @param default Whether the patch is enabled by default.
 * @param dependencies App-specific patches applied together with this one (for example the
 *        app's "Spoof signature", which Firebase needs before FCM can register through MicroG RE).
 * @param allowClone Whether to offer the "Package name" option (original or `<package>.morphe`
 *        clone). When false the option is not registered and the original package is always kept,
 *        for apps whose clone cannot install next to the stock app.
 * @param extraDescription An app-specific sentence appended to the patch description, for example
 *        which of the app's features need it.
 * @param executeBlock Additional app-specific bytecode changes.
 */
fun gmsCoreSupportPatch(
    fromPackageName: String,
    spoofedPackageSignature: String,
    mainActivityOnCreateFingerprint: Fingerprint,
    compatibility: Compatibility,
    earlyReturnFingerprints: Set<Fingerprint> = emptySet(),
    default: Boolean = true,
    dependencies: Set<Patch<*>> = emptySet(),
    allowClone: Boolean = true,
    extraDescription: String? = null,
    executeBlock: BytecodePatchContext.() -> Unit = {},
): BytecodePatch {
    require(PACKAGE_NAME_REGEX.matches(fromPackageName)) { "Invalid package name: $fromPackageName" }
    require(SIGNATURE_SHA1_REGEX.matches(spoofedPackageSignature)) {
        "Signature must be a lowercase hex SHA-1 without colons: $spoofedPackageSignature"
    }

    val packageNameOption = if (!allowClone) null else stringOption(
        key = "packageName",
        default = fromPackageName,
        values = mapOf(
            "Original (recommended)" to fromPackageName,
            "Clone" to "$fromPackageName.morphe",
        ),
        title = "Package name",
        description = "Package name of the patched app. Keep the original to install over the " +
            "existing app. A different name installs next to it, but can break features that are " +
            "tied to the original package name.",
        required = true,
    ) { it != null && PACKAGE_NAME_REGEX.matches(it) }

    // Permissions and provider authorities renamed in the manifest (old to new). The bytecode
    // part rewrites string constants that hard-code them.
    val renamedManifestStrings = mutableMapOf<String, String>()

    val resourcePatch = gmsCoreSupportResourcePatch(
        fromPackageName,
        spoofedPackageSignature,
        packageNameOption,
        renamedManifestStrings,
    )

    return bytecodePatch(
        name = "GmsCore support",
        description = "Makes Google sign-in and Google services work. Requires MicroG RE." +
            (extraDescription?.let { " $it" } ?: ""),
        default = default,
    ) {
        compatibleWith(compatibility)

        // A mounted (root) install keeps the original signature, so Google Play services works
        // and the manifest changes would be ignored anyway.
        availability { installer, _ ->
            when (installer) {
                InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
                else -> if (default) PatchAvailability.ENABLED else PatchAvailability.DISABLED
            }
        }

        dependsOn(resourcePatch, *dependencies.toTypedArray())

        extendWith("extensions/gmscore.mpe")

        packageNameOption?.let { it() }

        execute {
            // The two library fingerprints are shared by every app's "GmsCore support" patch.
            // morphe-patcher 1.8.0 clears cached matches only for registered fingerprints and
            // drops all registrations after a run, so from their third use in one process (a third
            // GmsCore app patched by Manager or the smoke test suite) they would return the previous
            // app's method and the edit would silently miss this app. Drop any stale match first.
            GooglePlayUtilityFingerprint.clearMatch()
            ServiceCheckFingerprint.clearMatch()
            // The per-app fingerprints are top-level objects too, so the same applies to them when
            // one app is patched more than once in a process (the second run would get the first
            // run's method). clearMatch() only drops the cached match; the next lookup re-resolves.
            mainActivityOnCreateFingerprint.clearMatch()
            earlyReturnFingerprints.forEach { it.clearMatch() }

            // Resolve every fingerprint first: several match on the GMS strings rewritten below.
            val mainActivityOnCreate = mainActivityOnCreateFingerprint.method
            val earlyReturnMethods = earlyReturnFingerprints.map { it.method }

            // Optional: only apps bundling play-services-basement have these (see Fingerprints.kt).
            // When absent there is nothing to force, so methodOrNull is correct here. But if the
            // library is present and the fingerprint misses, every GMS API would report
            // SERVICE_INVALID under MicroG, so that case fails loudly instead.
            val googlePlayUtility = GooglePlayUtilityFingerprint.methodOrNull
            if (googlePlayUtility == null && classDefByStrings(GOOGLE_SIGNATURE_INVALID_WARNING).isNotEmpty()) {
                throw PatchException(
                    "play-services-basement is present but isGooglePlayServicesAvailable(Context, int) was not found",
                )
            }
            googlePlayUtility?.returnEarly(0)
            // Same rule for the ensurePlayServicesAvailable helper: optional, but a void method
            // holding its message means the library has it, so a miss fails instead of no-opping
            // (the old shape missed it in Sofascore and 365Scores without a sound). Constructors
            // do not count: when R8 drops the helper, the message can survive in the
            // GooglePlayServicesNotAvailableException(int) constructor (Shazam 16.63.0, thrown
            // only by ProviderInstaller), and there is nothing to return early from.
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

            earlyReturnMethods.forEach { method ->
                // Rule 2: an abstract match would crash returnEarly with an NPE.
                if (method.implementation == null) {
                    throw PatchException("${method.definingClass}->${method.name} has no body to return early from")
                }
                when (method.returnType) {
                    "V" -> method.returnEarly()
                    "Z" -> method.returnEarly(false)
                    else -> throw PatchException(
                        "${method.definingClass}->${method.name} returns ${method.returnType}; " +
                            "early return supports only void and boolean methods",
                    )
                }
            }

            rewriteGmsStrings(renamedManifestStrings)

            // Verify GmsCore is installed and not battery-optimised. p0 = the activity.
            mainActivityOnCreate.addInstructionChecked(
                0,
                "invoke-static/range { p0 .. p0 }, $GMS_CORE_EXTENSION_CLASS->" +
                    "checkGmsCore(Landroid/app/Activity;)V",
            )

            executeBlock()
        }
    }
}

/**
 * androidx.credentials' Play services provider. Its name survives R8 because androidx loads it
 * reflectively from the `androidx.credentials.CREDENTIAL_PROVIDER_KEY` manifest meta-data.
 */
private const val PLAY_SERVICES_CREDENTIAL_PROVIDER =
    "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"

private const val FRAMEWORK_CREDENTIAL_MANAGER = "Landroid/credentials/CredentialManager;"

private fun Method.isIsAvailableOnDevice() =
    name == "isAvailableOnDevice" && returnType == "Z" && parameterTypes.isEmpty()

/**
 * Finds androidx.credentials' framework provider (CredentialProviderFrameworkImpl, R8-renamed):
 * the implementation of the CredentialProvider interface that holds an
 * `android.credentials.CredentialManager` instance field. The interface is the one
 * [PLAY_SERVICES_CREDENTIAL_PROVIDER] implements that declares `isAvailableOnDevice()Z` (the
 * interface's method names are kept because the Play services provider is kept).
 *
 * Returns null when there is nothing to patch: no Play services provider (androidx.credentials or
 * play-services-auth is absent), or no framework provider (androidx.credentials before 1.2, which
 * has no `CredentialManager` field anywhere). Throws when the library is present but the provider
 * cannot be identified uniquely.
 */
private fun BytecodePatchContext.findFrameworkCredentialProvider(): ClassDef? {
    val playServicesProvider = classDefByOrNull(PLAY_SERVICES_CREDENTIAL_PROVIDER) ?: return null

    // Collect first: mutating classes while iterating them is not allowed.
    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val holdsCredentialManager = classDef.fields.any {
            it.type == FRAMEWORK_CREDENTIAL_MANAGER && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        if (holdsCredentialManager) holders += classDef
    }
    // No framework provider. Also the case when the app never calls Credential Manager and R8
    // reduced the Play services provider to a bare keep-rule stub (365Scores 14.9.6).
    if (holders.isEmpty()) return null

    val providerInterface = playServicesProvider.interfaces.singleOrNull { type ->
        classDefByOrNull(type)?.methods?.any { it.isIsAvailableOnDevice() } == true
    } ?: throw PatchException("CredentialProvider interface of $PLAY_SERVICES_CREDENTIAL_PROVIDER not found")

    val providers = holders.filter { providerInterface in it.interfaces }
    return providers.singleOrNull() ?: throw PatchException(
        "Expected one $providerInterface implementation holding a $FRAMEWORK_CREDENTIAL_MANAGER, " +
            "found ${providers.map { it.type }} (classes with the field: ${holders.map { it.type }})",
    )
}

/**
 * On Android 14+ androidx.credentials prefers the framework provider when its
 * `isAvailableOnDevice()` is true. The framework hands Google ID requests (GetGoogleIdOption) to
 * the real Google Play services, which rejects the re-signed app (UNREGISTERED_ON_API_CONSOLE)
 * and never involves MicroG RE. Reporting the framework provider as unavailable makes androidx
 * fall back to its Play services provider, whose Identity API calls the string rewrite points at
 * MicroG RE. Not done without the Play services provider: androidx would then have no provider.
 */
private fun BytecodePatchContext.disableFrameworkCredentialProvider() {
    val provider = findFrameworkCredentialProvider() ?: return
    val isAvailable = mutableClassDefBy(provider).methods.singleOrNull {
        it.isIsAvailableOnDevice() && it.implementation != null
    } ?: throw PatchException("${provider.type} has no concrete isAvailableOnDevice()Z")
    isAvailable.returnEarly(false)
}

/**
 * androidx.credentials 1.6+ sends GetCredential requests (GetGoogleIdOption) through the Play
 * services Identity Credentials API when `isAvailableOnDevice(minVersion)` says Google Play
 * services is new enough (25.24+), and through the older BeginSignIn (One Tap) or GetSignInIntent
 * flow otherwise. The forced availability check makes every version test pass, and MicroG RE's
 * Identity Credentials chooser (7.2.1) answers Google ID requests with an error at once, so no
 * account picker appears (Sofascore 26.09.28). Reading those version tests as false keeps
 * onGetCredential on the BeginSignIn / GetSignInIntent flow, which MicroG RE implements. Nothing
 * to do for older androidx versions, which have no such test. Every such test in onGetCredential
 * is affected: in builds that keep androidx's digital-credential or restore-credential branches
 * (R8 removed them in Sofascore), those report "Google Play Services update required" instead.
 * onClearCredential (sign-out) is left alone; it has its own fallback flow.
 *
 * Fails when onGetCredential has a body and the app ships the Identity Credentials client (its
 * service action string, [IDENTITY_CREDENTIALS_SERVICE_ACTION]) but no version test was rewritten:
 * that is the drifted-shape case, where Google ID requests would go to MicroG RE's failing chooser.
 * 365Scores 14.9.7 has neither (a bare keep-rule stub and no client, only its R class).
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
    // Runs before rewriteGmsStrings, so the action string still has its Google Play services name.
    if (hasBody && rewritten == 0 && classDefByStrings(IDENTITY_CREDENTIALS_SERVICE_ACTION).isNotEmpty()) {
        throw PatchException(
            "The Identity Credentials client is present but no isAvailableOnDevice(I)Z test in " +
                "$PLAY_SERVICES_CREDENTIAL_PROVIDER->onGetCredential was found",
        )
    }
}

/** The Identity Credentials client binds to this Google Play services action (see [ACTIONS]). */
private const val IDENTITY_CREDENTIALS_SERVICE_ACTION = "com.google.android.gms.identitycredentials.service.START"

/**
 * Exact string constants (old to new) that are rewritten anywhere in the dex. Upstream's rules:
 * the "com.google" account type, the "com.google.android.gms" package, and every GmsCore
 * permission, intent action and provider authority, with "com.google" replaced by the vendor id.
 * Only exact matches are rewritten, so class names, log tags and similar strings that merely start
 * with these values (for example "com.google.android.gms.ads.AdActivity") are never touched.
 */
internal fun gmsStringReplacements(extra: Map<String, String> = emptyMap()): Map<String, String> = buildMap {
    put("com.google", GMS_CORE_VENDOR_GROUP_ID)
    put("com.google.android.gms", "$GMS_CORE_VENDOR_GROUP_ID.android.gms")
    (PERMISSIONS + ACTIONS + AUTHORITIES).forEach { put(it, it.replace("com.google", GMS_CORE_VENDOR_GROUP_ID)) }
    putAll(extra)
}

/**
 * Rewrites a `content://` URI whose authority is one of the GmsCore [AUTHORITIES], or returns
 * null when it is not one.
 */
internal fun gmsContentUriReplacement(value: String): String? {
    if (!value.startsWith("content://")) return null
    for (authority in AUTHORITIES) {
        val prefix = "content://$authority"
        if (value.startsWith(prefix)) {
            return "content://" + authority.replace("com.google", GMS_CORE_VENDOR_GROUP_ID) +
                value.substring(prefix.length)
        }
    }
    return null
}

/**
 * One pass over every method: replaces each `const-string` / `const-string/jumbo` whose value has
 * a GmsCore replacement, keeping the register and opcode.
 */
private fun BytecodePatchContext.rewriteGmsStrings(extra: Map<String, String>) {
    val replacements = gmsStringReplacements(extra)
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
 * The manifest part of "GmsCore support".
 */
private fun gmsCoreSupportResourcePatch(
    fromPackageName: String,
    spoofedPackageSignature: String,
    packageNameOption: Option<String>?,
    renamedManifestStrings: MutableMap<String, String>,
) = resourcePatch {
    execute {
        // No option (allowClone = false): always keep the original package.
        val toPackageName = if (packageNameOption == null) {
            fromPackageName
        } else {
            packageNameOption.value ?: throw PatchException("Package name option is not set")
        }

        document("AndroidManifest.xml").use { document ->
            renamedManifestStrings.clear()
            if (toPackageName != fromPackageName) {
                renamedManifestStrings += document.changePackageName(fromPackageName, toPackageName)
            }

            document.rewriteGmsManifestReferences()
            document.addGmsCorePackageQueries()
            document.addSpoofingMetadata(fromPackageName, spoofedPackageSignature)
        }
    }
}

/**
 * Upstream's manifest text replacements that apply regardless of the package name: c2dm
 * permissions/actions and the Google Photos "mars" API move to the vendor's namespace.
 */
private fun Document.rewriteGmsManifestReferences() {
    val transformations = mapOf(
        "com.google.android.c2dm" to "$GMS_CORE_VENDOR_GROUP_ID.android.c2dm",
        "com.google.android.libraries.photos.api.mars" to "$GMS_CORE_VENDOR_GROUP_ID.android.apps.photos.api.mars",
    )
    val elements = getElementsByTagName("*")
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

/**
 * MicroG RE reads these from the calling app's manifest to answer as the original app.
 */
private fun Document.addSpoofingMetadata(fromPackageName: String, spoofedPackageSignature: String) {
    val application = getElementsByTagName("application").item(0) as? Element
        ?: throw PatchException("AndroidManifest.xml has no <application>")

    mapOf(
        "$GMS_CORE_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_NAME" to fromPackageName,
        "$GMS_CORE_VENDOR_GROUP_ID.android.gms.SPOOFED_PACKAGE_SIGNATURE" to spoofedPackageSignature,
        // GmsCore presence detection.
        "app.revanced.MICROG_PACKAGE_NAME" to "$GMS_CORE_VENDOR_GROUP_ID.android.gms",
    ).forEach { (name, value) ->
        application.appendChild(
            createElement("meta-data").apply {
                setAttribute("android:name", name)
                setAttribute("android:value", value)
            },
        )
    }
}

/**
 * A collection of permissions, intents and content provider authorities
 * that are present in GmsCore which need to be transformed.
 */
internal object GmsCoreConstants {
    /**
     * All permissions.
     */
    val PERMISSIONS = setOf(
        "com.google.android.c2dm.permission.RECEIVE",
        "com.google.android.c2dm.permission.SEND",
        "com.google.android.gms.auth.api.phone.permission.SEND",
        "com.google.android.gms.permission.AD_ID",
        "com.google.android.gms.permission.AD_ID_NOTIFICATION",
        "com.google.android.gms.permission.CAR_FUEL",
        "com.google.android.gms.permission.CAR_INFORMATION",
        "com.google.android.gms.permission.CAR_MILEAGE",
        "com.google.android.gms.permission.CAR_SPEED",
        "com.google.android.gms.permission.CAR_VENDOR_EXTENSION",
        "com.google.android.googleapps.permission.GOOGLE_AUTH",
        "com.google.android.googleapps.permission.GOOGLE_AUTH.cp",
        "com.google.android.googleapps.permission.GOOGLE_AUTH.local",
        "com.google.android.googleapps.permission.GOOGLE_AUTH.mail",
        "com.google.android.googleapps.permission.GOOGLE_AUTH.writely",
        "com.google.android.gtalkservice.permission.GTALK_SERVICE",
        "com.google.android.providers.gsf.permission.READ_GSERVICES",
    )

    /**
     * All intent actions.
     */
    val ACTIONS = setOf(
        "com.google.android.c2dm.intent.RECEIVE",
        "com.google.android.c2dm.intent.REGISTER",
        "com.google.android.c2dm.intent.UNREGISTER",
        "com.google.android.contextmanager.service.ContextManagerService.START",
        "com.google.android.gcm.intent.SEND",
        "com.google.android.gms.accounts.ACCOUNT_SERVICE",
        "com.google.android.gms.accountsettings.ACCOUNT_PREFERENCES_SETTINGS",
        "com.google.android.gms.accountsettings.action.BROWSE_SETTINGS",
        "com.google.android.gms.accountsettings.action.VIEW_SETTINGS",
        "com.google.android.gms.accountsettings.MY_ACCOUNT",
        "com.google.android.gms.accountsettings.PRIVACY_SETTINGS",
        "com.google.android.gms.accountsettings.SECURITY_SETTINGS",
        "com.google.android.gms.ads.gservice.START",
        "com.google.android.gms.ads.identifier.service.EVENT_ATTESTATION",
        "com.google.android.gms.ads.service.CACHE",
        "com.google.android.gms.ads.service.CONSENT_LOOKUP",
        "com.google.android.gms.ads.service.HTTP",
        "com.google.android.gms.analytics.service.START",
        "com.google.android.gms.appstate.service.START",
        "com.google.android.gms.appusage.service.START",
        "com.google.android.gms.asterism.service.START",
        "com.google.android.gms.audiomodem.service.AudioModemService.START",
        "com.google.android.gms.audit.service.START",
        "com.google.android.gms.auth.account.authapi.START",
        "com.google.android.gms.auth.account.authenticator.auto.service.START",
        "com.google.android.gms.auth.account.authenticator.chromeos.START",
        "com.google.android.gms.auth.account.authenticator.tv.service.START",
        "com.google.android.gms.auth.account.data.service.START",
        "com.google.android.gms.auth.api.credentials.PICKER",
        "com.google.android.gms.auth.api.credentials.service.START",
        "com.google.android.gms.auth.api.identity.service.authorization.START",
        "com.google.android.gms.auth.api.identity.service.credentialsaving.START",
        "com.google.android.gms.auth.api.identity.service.signin.START",
        "com.google.android.gms.auth.api.phone.service.InternalService.START",
        "com.google.android.gms.auth.api.signin.service.START",
        "com.google.android.gms.auth.be.appcert.AppCertService",
        "com.google.android.gms.auth.blockstore.service.START",
        "com.google.android.gms.auth.config.service.START",
        "com.google.android.gms.auth.cryptauth.cryptauthservice.START",
        "com.google.android.gms.auth.GOOGLE_SIGN_IN",
        "com.google.android.gms.auth.login.LOGIN",
        "com.google.android.gms.auth.proximity.devicesyncservice.START",
        "com.google.android.gms.auth.proximity.securechannelservice.START",
        "com.google.android.gms.auth.proximity.START",
        "com.google.android.gms.auth.service.START",
        "com.google.android.gms.backup.ACTION_BACKUP_SETTINGS",
        "com.google.android.gms.backup.G1_BACKUP",
        "com.google.android.gms.backup.G1_RESTORE",
        "com.google.android.gms.backup.GMS_MODULE_RESTORE",
        "com.google.android.gms.beacon.internal.IBleService.START",
        "com.google.android.gms.car.service.START",
        "com.google.android.gms.carrierauth.service.START",
        "com.google.android.gms.cast.firstparty.START",
        "com.google.android.gms.cast.remote_display.service.START",
        "com.google.android.gms.cast.service.BIND_CAST_DEVICE_CONTROLLER_SERVICE",
        "com.google.android.gms.cast_mirroring.service.START",
        "com.google.android.gms.checkin.BIND_TO_SERVICE",
        "com.google.android.gms.chromesync.service.START",
        "com.google.android.gms.clearcut.service.START",
        "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
        "com.google.android.gms.common.download.START",
        "com.google.android.gms.common.service.START",
        "com.google.android.gms.common.telemetry.service.START",
        "com.google.android.gms.config.START",
        "com.google.android.gms.constellation.service.START",
        "com.google.android.gms.credential.manager.service.firstparty.START",
        "com.google.android.gms.deviceconnection.service.START",
        "com.google.android.gms.drive.ApiService.RESET_AFTER_BOOT",
        "com.google.android.gms.drive.ApiService.START",
        "com.google.android.gms.drive.ApiService.STOP",
        "com.google.android.gms.droidguard.service.INIT",
        "com.google.android.gms.droidguard.service.PING",
        "com.google.android.gms.droidguard.service.START",
        "com.google.android.gms.enterprise.loader.service.START",
        "com.google.android.gms.facs.cache.service.START",
        "com.google.android.gms.facs.internal.service.START",
        "com.google.android.gms.feedback.internal.IFeedbackService",
        "com.google.android.gms.fido.credentialstore.internal_service.START",
        "com.google.android.gms.fido.fido2.privileged.START",
        "com.google.android.gms.fido.fido2.regular.START",
        "com.google.android.gms.fido.fido2.zeroparty.START",
        "com.google.android.gms.fido.sourcedevice.service.START",
        "com.google.android.gms.fido.targetdevice.internal_service.START",
        "com.google.android.gms.fido.u2f.privileged.START",
        "com.google.android.gms.fido.u2f.thirdparty.START",
        "com.google.android.gms.fido.u2f.zeroparty.START",
        "com.google.android.gms.fitness.BleApi",
        "com.google.android.gms.fitness.ConfigApi",
        "com.google.android.gms.fitness.GoalsApi",
        "com.google.android.gms.fitness.GoogleFitnessService.START",
        "com.google.android.gms.fitness.HistoryApi",
        "com.google.android.gms.fitness.InternalApi",
        "com.google.android.gms.fitness.RecordingApi",
        "com.google.android.gms.fitness.SensorsApi",
        "com.google.android.gms.fitness.SessionsApi",
        "com.google.android.gms.fonts.service.START",
        "com.google.android.gms.freighter.service.START",
        "com.google.android.gms.games.internal.connect.service.START",
        "com.google.android.gms.games.PLAY_GAMES_UPGRADE",
        "com.google.android.gms.games.service.START",
        "com.google.android.gms.gass.START",
        "com.google.android.gms.gmscompliance.service.START",
        "com.google.android.gms.googlehelp.HELP",
        "com.google.android.gms.googlehelp.service.GoogleHelpService.START",
        "com.google.android.gms.growth.service.START",
        "com.google.android.gms.herrevad.services.LightweightNetworkQualityAndroidService.START",
        "com.google.android.gms.icing.INDEX_SERVICE",
        "com.google.android.gms.icing.LIGHTWEIGHT_INDEX_SERVICE",
        "com.google.android.gms.identity.service.BIND",
        // Not upstream (added 2026-10-11): the IdentityCredentials API used by
        // androidx.credentials-play-services (Bluecoins 13.1.149). MicroG RE 7.2.1 declares
        // app.revanced.android.gms.identitycredentials.service.START (IdentityCredentialApiService).
        "com.google.android.gms.identitycredentials.service.START",
        "com.google.android.gms.inappreach.service.START",
        "com.google.android.gms.instantapps.START",
        "com.google.android.gms.kids.service.START",
        "com.google.android.gms.languageprofile.service.START",
        "com.google.android.gms.learning.internal.dynamitesupport.START",
        "com.google.android.gms.learning.intservice.START",
        "com.google.android.gms.learning.predictor.START",
        "com.google.android.gms.learning.trainer.START",
        "com.google.android.gms.learning.training.background.START",
        "com.google.android.gms.location.places.GeoDataApi",
        "com.google.android.gms.location.places.PlaceDetectionApi",
        "com.google.android.gms.location.places.PlacesApi",
        "com.google.android.gms.location.reporting.service.START",
        "com.google.android.gms.location.settings.LOCATION_HISTORY",
        "com.google.android.gms.location.settings.LOCATION_REPORTING_SETTINGS",
        "com.google.android.location.internal.GoogleLocationManagerService",
        "com.google.android.gms.locationsharing.api.START",
        "com.google.android.gms.locationsharingreporter.service.START",
        "com.google.android.gms.lockbox.service.START",
        "com.google.android.gms.matchstick.lighter.service.START",
        "com.google.android.gms.mdm.services.DeviceManagerApiService.START",
        "com.google.android.gms.mdm.services.START",
        "com.google.android.gms.mdns.service.START",
        "com.google.android.gms.measurement.START",
        "com.google.android.gms.nearby.bootstrap.service.NearbyBootstrapService.START",
        "com.google.android.gms.nearby.connection.service.START",
        "com.google.android.gms.nearby.fastpair.START",
        "com.google.android.gms.nearby.messages.service.NearbyMessagesService.START",
        "com.google.android.gms.nearby.sharing.service.NearbySharingService.START",
        "com.google.android.gms.nearby.sharing.START_SERVICE",
        "com.google.android.gms.notifications.service.START",
        "com.google.android.gms.ocr.service.internal.START",
        "com.google.android.gms.ocr.service.START",
        "com.google.android.gms.oss.licenses.service.START",
        "com.google.android.gms.payse.service.BIND",
        "com.google.android.gms.people.contactssync.service.START",
        "com.google.android.gms.people.service.START",
        "com.google.android.gms.phenotype.service.START",
        "com.google.android.gms.photos.autobackup.service.START",
        "com.google.android.gms.playlog.service.START",
        "com.google.android.gms.plus.service.default.INTENT",
        "com.google.android.gms.plus.service.image.INTENT",
        "com.google.android.gms.plus.service.internal.START",
        "com.google.android.gms.plus.service.START",
        "com.google.android.gms.potokens.service.START",
        "com.google.android.gms.pseudonymous.service.START",
        "com.google.android.gms.rcs.START",
        "com.google.android.gms.reminders.service.START",
        "com.google.android.gms.romanesco.MODULE_BACKUP_AGENT",
        "com.google.android.gms.romanesco.service.START",
        "com.google.android.gms.safetynet.service.START",
        "com.google.android.gms.scheduler.ACTION_PROXY_SCHEDULE",
        "com.google.android.gms.search.service.SEARCH_AUTH_START",
        "com.google.android.gms.semanticlocation.service.START_ODLH",
        "com.google.android.gms.sesame.service.BIND",
        "com.google.android.gms.settings.EXPOSURE_NOTIFICATION_SETTINGS",
        "com.google.android.gms.setup.auth.SecondDeviceAuth.START",
        "com.google.android.gms.signin.service.START",
        "com.google.android.gms.smartdevice.d2d.SourceDeviceService.START",
        "com.google.android.gms.smartdevice.d2d.TargetDeviceService.START",
        "com.google.android.gms.smartdevice.directtransfer.SourceDirectTransferService.START",
        "com.google.android.gms.smartdevice.directtransfer.TargetDirectTransferService.START",
        "com.google.android.gms.smartdevice.postsetup.PostSetupService.START",
        "com.google.android.gms.smartdevice.setup.accounts.AccountsService.START",
        "com.google.android.gms.smartdevice.wifi.START_WIFI_HELPER_SERVICE",
        "com.google.android.gms.social.location.activity.service.START",
        "com.google.android.gms.speech.service.START",
        "com.google.android.gms.statementservice.EXECUTE",
        "com.google.android.gms.stats.ACTION_UPLOAD_DROPBOX_ENTRIES",
        "com.google.android.gms.tapandpay.service.BIND",
        "com.google.android.gms.telephonyspam.service.START",
        "com.google.android.gms.testsupport.service.START",
        "com.google.android.gms.thunderbird.service.START",
        "com.google.android.gms.trustagent.BridgeApi.START",
        "com.google.android.gms.trustagent.StateApi.START",
        "com.google.android.gms.trustagent.trustlet.trustletmanagerservice.BIND",
        "com.google.android.gms.trustlet.bluetooth.service.BIND",
        "com.google.android.gms.trustlet.connectionlessble.service.BIND",
        "com.google.android.gms.trustlet.face.service.BIND",
        "com.google.android.gms.trustlet.nfc.service.BIND",
        "com.google.android.gms.trustlet.onbody.service.BIND",
        "com.google.android.gms.trustlet.place.service.BIND",
        "com.google.android.gms.trustlet.voiceunlock.service.BIND",
        "com.google.android.gms.udc.service.START",
        "com.google.android.gms.update.START_API_SERVICE",
        "com.google.android.gms.update.START_SERVICE",
        "com.google.android.gms.update.START_SINGLE_USER_API_SERVICE",
        "com.google.android.gms.update.START_TV_API_SERVICE",
        "com.google.android.gms.usagereporting.service.START",
        "com.google.android.gms.userlocation.service.START",
        "com.google.android.gms.vehicle.cabin.service.START",
        "com.google.android.gms.vehicle.climate.service.START",
        "com.google.android.gms.vehicle.info.service.START",
        "com.google.android.gms.wallet.firstparty.ACTION_PURCHASE_MANAGER",
        "com.google.android.gms.wallet.service.BIND",
        "com.google.android.gms.walletp2p.service.firstparty.BIND",
        "com.google.android.gms.walletp2p.service.zeroparty.BIND",
        "com.google.android.gms.wearable.BIND",
        "com.google.android.gms.wearable.BIND_LISTENER",
        "com.google.android.gms.wearable.DATA_CHANGED",
        "com.google.android.gms.wearable.MESSAGE_RECEIVED",
        "com.google.android.gms.wearable.NODE_CHANGED",
        "com.google.android.gsf.action.GET_GLS",
        "com.google.android.location.settings.LOCATION_REPORTING_SETTINGS",
        "com.google.android.mdd.service.START",
        "com.google.android.mdh.service.listener.START",
        "com.google.android.mdh.service.START",
        "com.google.android.mobstore.service.START",
        "com.google.iid.TOKEN_REQUEST",
        "com.google.android.gms.location.places.ui.PICK_PLACE",
    )

    /**
     * All content provider authorities.
     */
    val AUTHORITIES = setOf(
        "com.google.android.gms.auth.accounts",
        "com.google.android.gms.chimera",
        "com.google.android.gms.fonts",
        "com.google.android.gms.phenotype",
        "com.google.android.gsf.gservices",
        "com.google.android.gsf.subscribedfeeds",
        "com.google.settings",
    )
}
