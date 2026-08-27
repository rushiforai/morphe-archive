package app.template.patches.rustore.permissions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.disableComponentsByPrefix
import app.template.patches.all.analytics.removeChildren
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreInvasivePermissions")

private val removedPermissionCounts = mapOf(
    "android.permission.INSTALL_PACKAGES" to 1,
    "android.permission.ACCESS_FINE_LOCATION" to 1,
    "android.permission.ACCESS_COARSE_LOCATION" to 1,
    "com.android.vending.BILLING" to 1,
    "android.permission.USB_HOST" to 1,
    "android.permission.WRITE_EXTERNAL_STORAGE" to 1,
    "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA" to 1,
    "android.permission.READ_PHONE_STATE" to 1,
    "android.permission.READ_CALL_LOG" to 2,
    "android.permission.READ_PHONE_NUMBERS" to 2,
    "android.provider.Telephony.SMS_RECEIVED" to 1,
    "android.permission.CALL_PHONE" to 1,
    "ru.sb.mobile.sid.BIND_PERSONALIZATION_SERVICE" to 1,
    "android.permission.READ_BASIC_PHONE_STATE" to 1,
)

private val preservedUpdatePermissions = setOf(
    "android.permission.REQUEST_INSTALL_PACKAGES",
    "android.permission.QUERY_ALL_PACKAGES",
    "com.android.permission.GET_INSTALLED_APPS",
    "android.permission.POST_NOTIFICATIONS",
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
    "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION",
    "android.permission.ENFORCE_UPDATE_OWNERSHIP",
    "android.permission.REQUEST_DELETE_PACKAGES",
)

private val disableInvasivePermissionsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.childrenNamed("application").single() as Element
            val permissionNodes = manifest.childrenNamed(
                "uses-permission",
                "uses-permission-sdk-23",
            )
            val sourcePermissions = permissionNodes
                .map { it.getAttribute("android:name") }

            val invalidCounts = removedPermissionCounts.mapValues { (permission, _) ->
                sourcePermissions.count { it == permission }
            }.filter { (permission, actualCount) ->
                actualCount != removedPermissionCounts.getValue(permission)
            }
            if (invalidCounts.isNotEmpty()) {
                throw PatchException(
                    "Unexpected invasive permission inventory: $invalidCounts",
                )
            }

            val missingUpdatePermissions = preservedUpdatePermissions - sourcePermissions.toSet()
            if (missingUpdatePermissions.isNotEmpty()) {
                throw PatchException(
                    "Required update permissions are missing: " +
                        missingUpdatePermissions.sorted(),
                )
            }

            val removedNodes = permissionNodes.filter { permission ->
                permission.getAttribute("android:name") in removedPermissionCounts
            }
            manifest.removeChildren(removedNodes)

            val verificationComponents = application.disableComponentsByPrefix(
                "ru.mail.libverify.",
                "ru.mail.verify.",
                "sid.sdk.global.utils.sms.",
            )
            if (verificationComponents != 29) {
                throw PatchException(
                    "Expected twenty-nine verification components, " +
                        "found $verificationComponents",
                )
            }

            val remainingPermissions = manifest.childrenNamed(
                "uses-permission",
                "uses-permission-sdk-23",
            ).mapTo(mutableSetOf()) { it.getAttribute("android:name") }
            val permissionsStillPresent =
                removedPermissionCounts.keys intersect remainingPermissions
            if (permissionsStillPresent.isNotEmpty()) {
                throw PatchException(
                    "Invasive permissions remain: ${permissionsStillPresent.sorted()}",
                )
            }
            val updatePermissionsRemoved = preservedUpdatePermissions - remainingPermissions
            if (updatePermissionsRemoved.isNotEmpty()) {
                throw PatchException(
                    "Update permissions were removed: ${updatePermissionsRemoved.sorted()}",
                )
            }

            logger.info(
                "Removed ${removedNodes.size} invasive permission declarations, " +
                    "disabled $verificationComponents verification components, " +
                    "and preserved ${preservedUpdatePermissions.size} update permissions",
            )
        }
    }
}

@Suppress("unused")
val disableInvasivePermissionsPatch = bytecodePatch(
    name = "Disable invasive permissions",
    description =
        "Removes privileged, phone, SMS, location, storage, billing, USB, and vendor access.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)
    dependsOn(disableInvasivePermissionsManifestPatch)

    execute {
        VerificationInitProviderFingerprint
            .matchAll(1..1)
            .single()
            .method
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        verificationReceiverFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "return-void")
                ?: throw PatchException(
                    "Verification receiver changed: " +
                        verificationReceiverClasses[index],
                )
        }

        verificationServiceBindFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
                ?: throw PatchException(
                    "Verification binder service changed: " +
                        verificationServiceBindClasses[index],
                )
        }
        verificationServiceStartFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x2\nreturn v0")
                ?: throw PatchException(
                    "Verification service start method changed: " +
                        verificationServiceStartClasses[index],
                )
        }
        verificationIntentHandlerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "return-void")
                ?: throw PatchException(
                    "Verification intent handler changed: " +
                        verificationIntentHandlerClasses[index],
                )
        }
        verificationWorkHandlerFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "return-void")
                ?: throw PatchException(
                    "Verification work handler changed: " +
                        verificationWorkHandlerClasses[index],
                )
        }
        verificationJobFingerprints.forEachIndexed { index, fingerprint ->
            fingerprint
                .matchAll(1..1)
                .singleOrNull()
                ?.method
                ?.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
                ?: throw PatchException(
                    "Verification job changed: " +
                        verificationJobMethods[index].let { (className, methodName) ->
                            "$className->$methodName"
                        },
                )
        }

        verificationActivityFingerprints.forEachIndexed { index, fingerprint ->
            val result = fingerprint.matchAll(1..1).singleOrNull()
                ?: throw PatchException(
                    "Verification activity changed: " +
                        verificationActivityClasses[index],
                )
            val superclass = result.classDef.superclass
                ?: throw PatchException(
                    "Verification activity has no superclass: " +
                        verificationActivityClasses[index],
                )
            result.method.addInstructions(
                0,
                """
                invoke-super {p0, p1}, $superclass->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
                """,
            )
        }

        logger.info(
            "Disabled LibVerify and SID SMS/call receivers, providers, " +
                "services, jobs, and verification helper activities",
        )
    }
}
