package com.awt.regain.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.replaceStrings
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.string
import app.morphe.patcher.util.registersUsed
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.awt.regain.patches.Constants.COMPATIBILITY_REGAIN

private const val MICROG_VENDOR_GROUP_ID = "app.revanced"
private const val MICROG_GMS_PACKAGE = "$MICROG_VENDOR_GROUP_ID.android.gms"
private const val REGAIN_PACKAGE_NAME = "ai.regainapp"
private const val REGAIN_SIGNING_CERT_SHA1 = "f1d63dc9f6d5b7ac1091b6a7723b957664d36f60"

/**
 * Matches GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int): int.
 * Must be resolved before "com.google.android.gms" string replacement runs.
 */
private object GooglePlayUtilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    filters = listOf(
        string("MetadataValueReader"),
        string("This should never happen."),
        string("com.google.android.gms"),
    ),
)

/**
 * Matches GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context, int): void.
 */
private object ServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

/**
 * Matches AndroidX CredentialProviderFrameworkImpl's call to the Android 14+ OS API
 * CredentialOption.Builder.setIsSystemProviderRequired(boolean).
 *
 * GetSignInWithGoogleOption sets isSystemProviderRequired = true, which causes
 * Android 14+ CredentialManagerService to filter out user-installed providers
 * such as MicroG-RE and throw NoCredentialException even when MicroG-RE is
 * enabled in system Credential Manager settings.
 */
private object CredentialOptionSystemProviderFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            smali = "Landroid/credentials/CredentialOption\$Builder;->setIsSystemProviderRequired(Z)Landroid/credentials/CredentialOption\$Builder;",
        ),
    ),
)

/**
 * Fallback match for unobfuscated androidx.credentials.GetCredentialOption.isSystemProviderRequired().
 */
private object GetCredentialOptionSystemProviderFingerprint : Fingerprint(
    definingClass = "Landroidx/credentials/GetCredentialOption;",
    name = "isSystemProviderRequired",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Regain 76.1.2139 uses AndroidX Credential Manager with
 * GetSignInWithGoogleOption. MicroG-RE exposes the matching Google ID
 * CredentialProviderService under its app.revanced vendor namespace.
 *
 * Keep this patch opt-in: without MicroG-RE, the stock Google credential
 * provider does not advertise the app.revanced credential type.
 */
@Suppress("unused")
val microGReSupportPatch = patch(
    name = "MicroG-RE support",
    description = "Routes Regain Google ID Credential Manager, supported GMS service actions, and Firebase C2DM names to MicroG-RE; configures Regain package/signature metadata.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_REGAIN)

    execute {
        /*
         * Bypass Google Play Services signature/availability checks when present
         * in the target APK so remapped app.revanced.android.gms is not rejected
         * as SERVICE_INVALID. Use methodOrNull so R8-stripped builds do not fail.
         * Must run before "com.google.android.gms" is rewritten below.
         */
        GooglePlayUtilityFingerprint.methodOrNull?.returnEarly(0)
        ServiceCheckFingerprint.methodOrNull?.returnEarly()

        /*
         * Allow Android 14+ Credential Manager to dispatch GetSignInWithGoogleOption
         * requests to user-installed MicroG-RE instead of restricting to system-only
         * providers (which otherwise throws NoCredentialException).
         */
        CredentialOptionSystemProviderFingerprint.matchOrNull()?.let { match ->
            val callMatch = match.instructionMatches.first()
            val boolRegister = callMatch.instruction.registersUsed[1]
            match.method.addInstruction(
                callMatch.index,
                "const/16 v$boolRegister, 0x0",
            )
        }
        GetCredentialOptionSystemProviderFingerprint.methodOrNull?.returnEarly(false)

        /*
         * MicroG-RE's credential provider advertises:
         * app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL
         *
         * Only this credential TYPE is namespaced. The Google ID BUNDLE_KEY_*
         * values and TYPE_GOOGLE_ID_TOKEN_SIWG_CREDENTIAL subtype intentionally
         * retain their com.google.android.libraries.identity.googleid names;
         * MicroG-RE reads those original keys.
         */
        val dexStringReplacements = linkedMapOf(
            "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL" to
                "$MICROG_VENDOR_GROUP_ID.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL",

            // Account type and package/authority strings consumed by MicroG-RE.
            "com.google" to MICROG_VENDOR_GROUP_ID,
            "com.google.android.gms" to MICROG_GMS_PACKAGE,
            "com.google.android.gms.phenotype" to "$MICROG_GMS_PACKAGE.phenotype",
            "com.google.android.gms.chimera" to "$MICROG_GMS_PACKAGE.chimera",
            "com.google.android.gms.fonts" to "$MICROG_GMS_PACKAGE.fonts",

            // Service actions that MicroG-RE explicitly exposes under its own package.
            "com.google.android.gms.auth.api.identity.service.signin.START" to
                "$MICROG_GMS_PACKAGE.auth.api.identity.service.signin.START",
            "com.google.android.gms.auth.api.identity.service.credentialsaving.START" to
                "$MICROG_GMS_PACKAGE.auth.api.identity.service.credentialsaving.START",
            "com.google.android.gms.auth.api.signin.service.START" to
                "$MICROG_GMS_PACKAGE.auth.api.signin.service.START",
            "com.google.android.gms.auth.api.credentials.service.START" to
                "$MICROG_GMS_PACKAGE.auth.api.credentials.service.START",
            "com.google.android.gms.signin.service.START" to
                "$MICROG_GMS_PACKAGE.signin.service.START",
            "com.google.android.gms.measurement.START" to
                "$MICROG_GMS_PACKAGE.measurement.START",
            "com.google.android.gms.common.telemetry.service.START" to
                "$MICROG_GMS_PACKAGE.common.telemetry.service.START",
            "com.google.android.gms.fido.fido2.regular.START" to
                "$MICROG_GMS_PACKAGE.fido.fido2.regular.START",
            "com.google.android.gms.fonts.service.START" to
                "$MICROG_GMS_PACKAGE.fonts.service.START",
            "com.google.android.gms.phenotype.service.START" to
                "$MICROG_GMS_PACKAGE.phenotype.service.START",

            // Firebase Cloud Messaging uses the namespaced C2DM endpoints in MicroG-RE.
            "com.google.android.c2dm.intent.RECEIVE" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.intent.RECEIVE",
            "com.google.android.c2dm.intent.REGISTER" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.intent.REGISTER",
            "com.google.android.c2dm.permission.RECEIVE" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.permission.RECEIVE",
            "com.google.android.c2dm.permission.SEND" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.permission.SEND",
            "com.google.iid.TOKEN_REQUEST" to "$MICROG_VENDOR_GROUP_ID.iid.TOKEN_REQUEST",
            "com.google.android.gms.permission.AD_ID" to "$MICROG_GMS_PACKAGE.permission.AD_ID",
        )

        replaceStrings(
            dexStringReplacements.map { (fromString, toString) ->
                string(fromString) to toString
            }
        )

        // Rewrite exact and sub-path content:// URIs for MicroG-RE's supported authorities.
        val microGAuthorities = listOf(
            "com.google.android.gms.phenotype",
            "com.google.android.gms.chimera",
            "com.google.android.gms.fonts",
        )
        replaceStrings(string("content://com.google.android.gms.", StringComparisonType.STARTS_WITH)) { _, _, value ->
            val matchedAuthority = microGAuthorities.firstOrNull { authority ->
                value == "content://$authority" || value.startsWith("content://$authority/")
            } ?: return@replaceStrings null

            value.replaceFirst(
                "content://$matchedAuthority",
                "content://${matchedAuthority.replaceFirst("com.google", MICROG_VENDOR_GROUP_ID)}",
            )
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            /*
             * Redirect only manifest permission/action/authority values that
             * MicroG-RE actually publishes. Component class names such as
             * FirebaseInstanceIdReceiver and AppMeasurementService remain
             * inside Regain's APK and must not be renamed.
             *
             * Keep com.google.android.c2dm.intent.REGISTRATION unchanged by
             * replacing only the explicit C2DM actions/permissions below.
             */
            val manifestTransformations = linkedMapOf(
                "com.google.android.c2dm.intent.RECEIVE" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.intent.RECEIVE",
                "com.google.android.c2dm.intent.REGISTER" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.intent.REGISTER",
                "com.google.android.c2dm.permission.RECEIVE" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.permission.RECEIVE",
                "com.google.android.c2dm.permission.SEND" to "$MICROG_VENDOR_GROUP_ID.android.c2dm.permission.SEND",
                "com.google.iid.TOKEN_REQUEST" to "$MICROG_VENDOR_GROUP_ID.iid.TOKEN_REQUEST",
                "com.google.android.gms.permission.AD_ID" to "$MICROG_GMS_PACKAGE.permission.AD_ID",
                "com.google.android.gms.phenotype.service.START" to
                    "$MICROG_GMS_PACKAGE.phenotype.service.START",
                "com.google.android.gms.phenotype" to "$MICROG_GMS_PACKAGE.phenotype",
                "com.google.android.gms.chimera" to "$MICROG_GMS_PACKAGE.chimera",
                "com.google.android.gms.fonts.service.START" to
                    "$MICROG_GMS_PACKAGE.fonts.service.START",
                "com.google.android.gms.fonts" to "$MICROG_GMS_PACKAGE.fonts",
                "com.google.android.gms.auth.api.identity.service.signin.START" to
                    "$MICROG_GMS_PACKAGE.auth.api.identity.service.signin.START",
                "com.google.android.gms.auth.api.identity.service.credentialsaving.START" to
                    "$MICROG_GMS_PACKAGE.auth.api.identity.service.credentialsaving.START",
                "com.google.android.gms.auth.api.signin.service.START" to
                    "$MICROG_GMS_PACKAGE.auth.api.signin.service.START",
                "com.google.android.gms.auth.api.credentials.service.START" to
                    "$MICROG_GMS_PACKAGE.auth.api.credentials.service.START",
                "com.google.android.gms.signin.service.START" to
                    "$MICROG_GMS_PACKAGE.signin.service.START",
                "com.google.android.gms.measurement.START" to
                    "$MICROG_GMS_PACKAGE.measurement.START",
                "com.google.android.gms.common.telemetry.service.START" to
                    "$MICROG_GMS_PACKAGE.common.telemetry.service.START",
                "com.google.android.gms.fido.fido2.regular.START" to
                    "$MICROG_GMS_PACKAGE.fido.fido2.regular.START",
            )

            manifest.elements().forEach { element ->
                element.attributeNames.forEach attributes@{ attributeName ->
                    val value = element.attribute(attributeName) ?: return@attributes
                    var replaced = value

                    manifestTransformations.forEach { (fromString, toString) ->
                        replaced = replaced.replace(fromString, toString)
                    }

                    if (replaced != value) {
                        element.setAttribute(attributeName, replaced)
                    }
                }
            }

            /*
             * Android 11+ package visibility: make the renamed GmsCore package
             * discoverable to Regain's package/service checks. The stock
             * Morphe implementation adds equivalent package queries.
             */
            val queries = manifest.elements("queries").firstOrNull()
                ?: manifest.root.appendChild("queries")
            if (queries.elements("package").none {
                    it.attribute("android:name") == MICROG_GMS_PACKAGE
                }
            ) {
                queries.appendChild("package") {
                    setAttribute("android:name", MICROG_GMS_PACKAGE)
                }
            }

            /*
             * Let MicroG-RE answer package/signature checks using Regain's
             * original Play-distributed identity (verified against
             * PackageSpoofUtils.kt in MorpheApp/MicroG-RE).
             */
            val application = manifest.elements("application").first()
            val metadata = mapOf(
                "$MICROG_GMS_PACKAGE.SPOOFED_PACKAGE_NAME" to REGAIN_PACKAGE_NAME,
                "$MICROG_GMS_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to REGAIN_SIGNING_CERT_SHA1,
                "$MICROG_VENDOR_GROUP_ID.MICROG_PACKAGE_NAME" to MICROG_GMS_PACKAGE,
            )

            metadata.forEach { (name, value) ->
                val existing = application.elements("meta-data").firstOrNull {
                    it.attribute("android:name") == name
                }

                if (existing == null) {
                    application.appendChild("meta-data") {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    }
                } else {
                    existing.setAttribute("android:value", value)
                }
            }
        }
    }
}
