package app.merak.patches.authenticator.gms

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.returnEarly
import app.merak.patches.authenticator.shared.AUTHENTICATOR_PACKAGE_NAME
import app.merak.patches.authenticator.shared.MainActivityOnCreateFingerprint
import app.merak.patches.shared.Constants.COMPATIBILITY_GOOGLE_AUTHENTICATOR
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_PACKAGE = "Lapp/merak/extension/"
private const val EXTENSION_CLASS = "Lapp/merak/extension/authenticator/GmsCoreSupport;"

/** Vendor prefix of the GmsCore build used by Morphe patched apps (MicroG-RE). */
private const val GMS_CORE_VENDOR = "app.revanced"
private const val GMS_CORE_PACKAGE = "$GMS_CORE_VENDOR.android.gms"

/** SHA-1 of the certificate Google Authenticator is signed with on Google Play. */
private const val AUTHENTICATOR_SIGNATURE = "38918a453d07199354f8b19af05ec6562ced5788"

/**
 * Google Play services identifiers referenced by Google Authenticator 7.2 that
 * GmsCore provides under its own vendor prefix: service actions, permissions
 * and content provider authorities.
 *
 * Derived from the strings in the app. Library module names, metadata keys and
 * AIDL interface descriptors are intentionally not included.
 *
 * Anything not listed here stays with Google Play services if it is installed. Notably the
 * ML Kit code scanner (adding codes by QR code), its module install service and dynamite
 * modules, which GmsCore does not implement and Google Play services provides to any app.
 */
private val GMS_IDENTIFIERS = setOf(
    // Service and intent actions.
    "com.google.android.gms.accountsettings.action.VIEW_SETTINGS",
    "com.google.android.gms.audit.service.START",
    "com.google.android.gms.auth.aang.events.services.START",
    "com.google.android.gms.auth.account.data.service.START",
    "com.google.android.gms.clearcut.sampler.service.START",
    "com.google.android.gms.clearcut.service.START",
    "com.google.android.gms.common.telemetry.notification.service.START",
    "com.google.android.gms.common.telemetry.service.START",
    "com.google.android.gms.common.telemetry.throttling.service.START",
    "com.google.android.gms.googlehelp.HELP",
    "com.google.android.gms.googlehelp.service.GoogleHelpService.START",
    "com.google.android.gms.inappreach.service.START",
    "com.google.android.gms.mdisync.service.START",
    "com.google.android.gms.people.contactssync.service.THIRD_PARTY_START",
    "com.google.android.gms.people.service.START",
    "com.google.android.gms.phenotype.service.START",
    "com.google.android.gms.phenotype.UPDATE",
    "com.google.android.gms.pseudonymous.service.START",
    "com.google.android.gms.signin.service.START",
    "com.google.android.gms.usagereporting.service.START",
    "com.google.android.gsf.action.GET_GLS",
    // Permissions.
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    // Content provider authorities.
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.phenotype",
)

/** Content provider authorities that are also referenced as content:// URIs. */
private val GMS_URI_AUTHORITIES = listOf(
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
)

/** Uses Google Play services directly, as it is a public API that GmsCore does not implement. */
private const val CODE_SCANNER_ACTIVITY = "Lcom/google/mlkit/vision/codescanner/internal/GmsBarcodeScanningDelegateActivity;"

private fun String.toGmsCoreVendor() = replaceFirst("com.google", GMS_CORE_VENDOR)

@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Allows signing in with a Google Account and using Google Account sync by using " +
        "GmsCore (MicroG-RE) instead of Google Play services. The app is installed under a " +
        "different package name, so it can be installed next to the original app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_AUTHENTICATOR)

    extendWith("extensions/extension.mpe")

    val packageNameOption = stringOption(
        key = "packageName",
        default = "app.merak.android.apps.authenticator2",
        values = mapOf("Default" to "app.merak.android.apps.authenticator2"),
        title = "Package name",
        description = "The package name of the patched app. It must be different from the original package name.",
        required = true,
        validator = { value: String? ->
            value != null && value != AUTHENTICATOR_PACKAGE_NAME &&
                value.matches(Regex("^[a-zA-Z]\\w*(\\.[a-zA-Z]\\w*)+$"))
        },
    )

    execute {
        val newPackageName = packageNameOption.value!!

        // region Manifest.

        resourceXml("AndroidManifest.xml").use { manifest ->
            // Rename the package, and anything named after it that must be unique per app
            // (content provider authorities and the app's own permissions).
            manifest.elements().forEach { element ->
                element.attributeNames.forEach { name ->
                    val value = element.attribute(name) ?: return@forEach
                    val renamed = when {
                        name == "package" && value == AUTHENTICATOR_PACKAGE_NAME -> newPackageName
                        name == "android:authorities" && value.startsWith("$AUTHENTICATOR_PACKAGE_NAME.") ->
                            newPackageName + value.removePrefix(AUTHENTICATOR_PACKAGE_NAME)
                        value == "$AUTHENTICATOR_PACKAGE_NAME.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" ->
                            "$newPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
                        else -> value
                    }
                    if (renamed != value) element.setAttribute(name, renamed)
                }
            }

            val root = manifest.root

            // GmsCore permission equivalent of the Google services permission the app uses.
            root.appendChild("uses-permission") {
                setAttribute("android:name", "com.google.android.providers.gsf.permission.READ_GSERVICES".toGmsCoreVendor())
            }

            // Allows the extension to detect whether GmsCore is installed (package visibility).
            val queries = root.elements("queries").firstOrNull() ?: root.appendChild("queries") {}
            queries.appendChild("package") { setAttribute("android:name", GMS_CORE_PACKAGE) }

            // Tells GmsCore which app to present itself as to Google.
            val application = root.elements("application").first()
            application.appendChild("meta-data") {
                setAttribute("android:name", "$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", AUTHENTICATOR_PACKAGE_NAME)
            }
            application.appendChild("meta-data") {
                setAttribute("android:name", "$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", AUTHENTICATOR_SIGNATURE)
            }
        }

        // endregion

        // region Redirect Google Play services to GmsCore.

        // Service connections bind to the package matching the service action:
        // GmsCore for the redirected actions, Google Play services for everything else.
        GmsServiceConnectionConfigFingerprint.matchAll().forEach { match ->
            match.method.apply {
                val index = match.instructionMatches.first().index
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    "invoke-static { p1 }, $EXTENSION_CLASS->servicePackage(Ljava/lang/String;)Ljava/lang/String;",
                )
                addInstruction(index + 1, "move-result-object v$register")
            }
        }

        // Dynamic service lookups ask the provider matching the service action, for the same reason.
        GmsServiceDynamicLookupFingerprint.let { match ->
            val actionRegister = match.method.getInstruction<FiveRegisterInstruction>(
                match.instructionMatches[1].index,
            ).registerE
            val uriIndex = match.instructionMatches[2].index
            val uriRegister = match.method.getInstruction<OneRegisterInstruction>(uriIndex).registerA
            match.method.replaceInstruction(
                uriIndex,
                "invoke-static { v$actionRegister }, $EXTENSION_CLASS->serviceLookupUri(Ljava/lang/String;)Landroid/net/Uri;",
            )
            match.method.addInstruction(uriIndex + 1, "move-result-object v$uriRegister")
        }

        // Classes that must keep using Google Play services. Extension classes are never rewritten,
        // as they reference both packages on purpose.
        val keepGooglePlayServices = setOf(
            CODE_SCANNER_ACTIVITY,
            DynamiteModuleFingerprint.originalClassDef.type,
        )

        fun replaceString(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, index: Int, value: String) {
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(index, "const-string v$register, \"$value\"")
        }

        val exactReplacements = buildMap {
            // Google account type and Google Play services package.
            put("com.google", GMS_CORE_VENDOR)
            put("com.google.android.gms", GMS_CORE_PACKAGE)
            GMS_IDENTIFIERS.forEach { put(it, it.toGmsCoreVendor()) }
        }
        exactReplacements.forEach { (from, to) ->
            string(from).matchAllMethodIndicesForEach(false) { index ->
                if (definingClass !in keepGooglePlayServices && !definingClass.startsWith(EXTENSION_PACKAGE)) {
                    replaceString(this, index, to)
                }
            }
        }

        GMS_URI_AUTHORITIES.forEach { authority ->
            string("content://$authority", StringComparisonType.STARTS_WITH)
                .matchAllMethodIndicesForEach(false) { index ->
                    val value = (getInstruction<ReferenceInstruction>(index).reference as StringReference).string
                    replaceString(this, index, value.replaceFirst("content://com.google", "content://$GMS_CORE_VENDOR"))
                }
        }

        // Google Play services is not required, GmsCore provides it.
        GooglePlayServicesAvailableFingerprint.method.returnEarly(0)
        EnsureGooglePlayServicesAvailableFingerprint.method.returnEarly()

        // Explain to the user if GmsCore is missing.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
        )

        // endregion
    }
}
