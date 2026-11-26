// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/gms/MicroGRESupportPatch.kt
package app.w3s.patches.w3schools.misc.gms

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.replaceStrings
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.string
import app.w3s.patches.w3schools.misc.gms.GmsConstants.GMS_CORE_PACKAGE_NAME
import app.w3s.patches.w3schools.misc.gms.GmsConstants.GMS_CORE_VENDOR_GROUP_ID
import app.w3s.patches.w3schools.misc.gms.GmsConstants.QUERIES_PACKAGES
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS
import app.w3s.patches.w3schools.shared.Constants.W3S_PACKAGE_NAME
import app.w3s.patches.w3schools.shared.Constants.W3S_SIGNATURE_SHA1

@Suppress("unused")
val microGRESupportPatch = patch(
    name = "MicroG-RE support",
    description = "Redirects Google Play Services and Credential Manager to MicroG-RE (app.revanced.android.gms) " +
        "with package and signature spoofing so Google Sign-In works on re-signed builds.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.DISABLED
        }
    }

    dependsOn(pairipLicenseBypassPatch)

    execute {
        // Resolve methods before rewriting "com.google.android.gms" strings in bytecode.
        val googlePlayUtilityMethod = GooglePlayUtilityFingerprint.method
        val serviceCheckMethod = ServiceCheckFingerprint.methodOrNull
        val tryCreatePostUProviderMethod = TryCreatePostUProviderFingerprint.methodOrNull

        // Treat MicroG-RE as available without checking stock Google signing certificates.
        googlePlayUtilityMethod.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        serviceCheckMethod?.addInstructions(
            0,
            "return-void",
        )

        // Force Android 14+ CredentialManager through CredentialProviderPlayServicesImpl -> MicroG-RE.
        tryCreatePostUProviderMethod?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        val exactReplacements: Map<String, String> = buildMap {
            put("com.google", GMS_CORE_VENDOR_GROUP_ID)
            put("com.google.android.gms", GMS_CORE_PACKAGE_NAME)
            (GmsConstants.PERMISSIONS + GmsConstants.ACTIONS + GmsConstants.AUTHORITIES).forEach { value ->
                put(value, value.replace("com.google", GMS_CORE_VENDOR_GROUP_ID))
            }
        }
        val contentPrefixes = GmsConstants.AUTHORITIES.map { "content://$it" }
        val filters = exactReplacements.keys.map { string(it) } +
            string("content://", StringComparisonType.STARTS_WITH)

        replaceStrings(filters) { _, _, value ->
            exactReplacements[value] ?: contentPrefixes.firstNotNullOfOrNull { prefix ->
                if (value.startsWith(prefix)) {
                    value.replaceFirst(prefix, prefix.replace("com.google", GMS_CORE_VENDOR_GROUP_ID))
                } else {
                    null
                }
            }
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements().forEach { element ->
                element.attributeNames.forEach attributes@{ attrName ->
                    val value = element.attribute(attrName) ?: return@attributes
                    if (value.contains("com.google.android.c2dm")) {
                        element.setAttribute(
                            attrName,
                            value.replace("com.google.android.c2dm", "$GMS_CORE_VENDOR_GROUP_ID.android.c2dm"),
                        )
                    }
                }
            }

            val queries = manifest.elements("queries").firstOrNull() ?: manifest.root.appendChild("queries")
            val existingQueryPackages = queries.children("package")
                .mapNotNull { it.attribute("android:name") }
                .toSet()
            QUERIES_PACKAGES.filterNot { it in existingQueryPackages }.forEach { packageName ->
                queries.appendChild("package") {
                    setAttribute("android:name", packageName)
                }
            }

            val application = manifest.elements("application").first()
            val spoofMetadata = listOf(
                "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_NAME" to W3S_PACKAGE_NAME,
                "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_SIGNATURE" to W3S_SIGNATURE_SHA1,
                "$GMS_CORE_VENDOR_GROUP_ID.MICROG_PACKAGE_NAME" to GMS_CORE_PACKAGE_NAME,
            )
            val existingMeta = application.children("meta-data")
                .mapNotNull { it.attribute("android:name") }
                .toSet()
            spoofMetadata.filterNot { (name, _) -> name in existingMeta }.forEach { (name, value) ->
                application.appendChild("meta-data") {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                }
            }
        }
    }
}
