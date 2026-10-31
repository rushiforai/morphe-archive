/*
 * Based on the GmsCore support patch of Morphe Patches,
 * https://github.com/MorpheApp/morphe-patches, adapted for Google Maps.
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.patches.maps.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import io.github.hyperstown.patches.maps.shared.Constants.COMPATIBILITY_MAPS
import io.github.hyperstown.patches.maps.shared.Constants.EXTENSION_PACKAGE
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_CERTIFICATE_SHA1
import io.github.hyperstown.patches.maps.shared.Constants.MAPS_PACKAGE_NAME
import io.github.hyperstown.patches.util.inheritedMethod
import io.github.hyperstown.patches.util.parameterTypeNames
import io.github.hyperstown.patches.util.signatureEquals
import io.github.hyperstown.patches.util.stringOrNull
import io.github.hyperstown.patches.util.uniqueMethod
import io.github.hyperstown.patches.util.uniqueMethodOrNull
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

/** MicroG-RE keeps the vendor of ReVanced GmsCore, so apps patched for either work with it. */
private const val GMS_CORE_VENDOR_GROUP_ID = "app.revanced"
internal const val GMS_CORE_PACKAGE_NAME = "$GMS_CORE_VENDOR_GROUP_ID.android.gms"

private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}GmsCoreSupport;"
private const val MAPS_ACTIVITY_CLASS = "Lcom/google/android/maps/MapsActivity;"
private const val GOOGLE_API_CLIENT_BUILDER_CLASS = "Lcom/google/android/gms/common/api/GoogleApiClient\$Builder;"

private val logger = Logger.getLogger("io.github.hyperstown.patches.maps.misc.gms")

private val gmsCoreSupportResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            document.patchManifest(packageNameOption.value!!)
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Allows Google Maps to run without root and without Google Play services, " +
        "by using MicroG-RE under a different package name.",
) {
    compatibleWith(COMPATIBILITY_MAPS)

    packageNameOption()

    availability { installer, _ ->
        when (installer) {
            // A mounted install keeps the original package name and talks to Google Play services.
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.REQUIRED
        }
    }

    dependsOn(
        sharedExtensionPatch,
        gmsCoreSupportResourcePatch,
        deviceComplianceCheckPatch,
        gmsResolutionPatch,
        appIdentitySpoofPatch,
    )

    execute {
        bypassPlayServicesAvailabilityChecks()
        hidePlayServicesAvailabilityNotification()
        injectGmsCoreCheck()

        // Last, so the hooks above are located by the original strings.
        rewriteGmsCoreStrings()
    }
}

// region Manifest

private fun Document.patchManifest(toPackageName: String) {
    val manifest = documentElement
    manifest.setAttribute("package", toPackageName)

    // Authorities and the permissions Maps declares itself must be unique on the device.
    fun String.renameOwn() = when {
        this == MAPS_PACKAGE_NAME || startsWith("$MAPS_PACKAGE_NAME.") ->
            toPackageName + removePrefix(MAPS_PACKAGE_NAME)

        else -> this
    }

    manifest.forEachElement { element ->
        val attributes = element.attributes
        for (index in 0 until attributes.length) {
            val attribute = attributes.item(index)
            val value = attribute.nodeValue

            attribute.nodeValue = when (attribute.nodeName) {
                "android:authorities" -> value.split(';').joinToString(";") { it.renameOwn() }
                in PERMISSION_ATTRIBUTES -> value.renameOwn().toGmsCoreRoute()
                "android:name" -> when (element.tagName) {
                    in PERMISSION_TAGS -> value.renameOwn().toGmsCoreRoute()
                    "action" -> value.toGmsCoreRoute()
                    else -> value
                }

                else -> value
            }
        }
    }

    // Android 11 and newer hide other apps unless they are declared.
    val queries = manifest.childElements("queries").firstOrNull()
        ?: createElement("queries").also { manifest.insertBefore(it, manifest.firstChild) }
    queries.appendChild(createElement("package").apply { setAttribute("android:name", GMS_CORE_PACKAGE_NAME) })

    // MicroG-RE answers requests from the patched app as if they came from the original app.
    val application = getElementsByTagName("application").item(0) as Element
    mapOf(
        "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_NAME" to MAPS_PACKAGE_NAME,
        "$GMS_CORE_PACKAGE_NAME.SPOOFED_PACKAGE_SIGNATURE" to MAPS_CERTIFICATE_SHA1,
        "$GMS_CORE_VENDOR_GROUP_ID.MICROG_PACKAGE_NAME" to GMS_CORE_PACKAGE_NAME,
    ).forEach { (name, value) ->
        application.appendChild(
            createElement("meta-data").apply {
                setAttribute("android:name", name)
                setAttribute("android:value", value)
            },
        )
    }
}

private val PERMISSION_TAGS = setOf(
    "permission",
    "permission-group",
    "permission-tree",
    "uses-permission",
    "uses-permission-sdk-23",
)

private val PERMISSION_ATTRIBUTES = setOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
)

/** Push messages (c2dm) and GmsCore permissions are named after the GmsCore vendor. */
private fun String.toGmsCoreRoute() = when {
    startsWith("com.google.android.c2dm.") || this in PERMISSIONS ->
        replaceFirst("com.google", GMS_CORE_VENDOR_GROUP_ID)

    else -> this
}

private fun Node.forEachElement(action: (Element) -> Unit) {
    if (this is Element) action(this)
    val children = childNodes
    for (index in 0 until children.length) children.item(index).forEachElement(action)
}

private fun Element.childElements(tagName: String) = buildList {
    val children = childNodes
    for (index in 0 until children.length) {
        val child = children.item(index)
        if (child is Element && child.tagName == tagName) add(child)
    }
}

// endregion

// region Bytecode

/**
 * Point Google Play services strings in the app code at GmsCore:
 * its package, account type, permissions, service actions and content providers.
 */
private fun BytecodePatchContext.rewriteGmsCoreStrings() {
    var count = 0

    getAllClassesWithStrings().forEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@forEach

        // Only make classes mutable that change, as every mutable class is recompiled.
        val methods = classDef.methods.filter { method ->
            method.implementation?.instructions?.any { it.stringOrNull?.let(::toGmsCoreString) != null } == true
        }
        if (methods.isEmpty()) return@forEach

        val mutableClass = mutableClassDefBy(classDef)
        methods.forEach { method ->
            val mutableMethod = mutableClass.methods.single { it.signatureEquals(method) }

            mutableMethod.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                val replacement = instruction.stringOrNull?.let(::toGmsCoreString) ?: return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA

                mutableMethod.replaceInstruction(
                    index,
                    when (instruction.opcode) {
                        Opcode.CONST_STRING ->
                            BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(replacement))

                        Opcode.CONST_STRING_JUMBO ->
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ImmutableStringReference(replacement))

                        else -> throw PatchException("Unexpected string instruction ${instruction.opcode} in $mutableMethod")
                    },
                )
                count++
            }
        }
    }

    logger.info("Rewrote $count Google Play services strings for GmsCore")
}

private fun toGmsCoreString(value: String): String? = when {
    // Google account type.
    value == "com.google" -> GMS_CORE_VENDOR_GROUP_ID
    value == "com.google.android.gms" -> GMS_CORE_PACKAGE_NAME

    value in PERMISSIONS || value in ACTIONS || value in AUTHORITIES || value in MAPS_ACTIONS ->
        value.replaceFirst("com.google", GMS_CORE_VENDOR_GROUP_ID)

    value.startsWith("content://") && AUTHORITIES.any { value.startsWith("content://$it") } ->
        value.replaceFirst("com.google", GMS_CORE_VENDOR_GROUP_ID)

    else -> null
}

/**
 * Google Play services report MicroG-RE as invalid, because it is not signed by Google.
 * Maps then refuses to connect to it and asks to install Google Play services.
 */
private fun BytecodePatchContext.bypassPlayServicesAvailabilityChecks() {
    uniqueMethodOrNull(ServiceCheckFingerprint, "legacy Play services check")
        ?.addInstruction(0, "return-void")

    // GoogleApiAvailability is obfuscated, but the builder that accepts it for testing is not.
    val builder = classDefByOrNull(GOOGLE_API_CLIENT_BUILDER_CLASS)
        ?: throw PatchException("Could not find $GOOGLE_API_CLIENT_BUILDER_CLASS")
    val availabilityClass = builder.methods
        .singleOrNull { it.name == "setApiAvailabilityForTesting" }
        ?.parameterTypes?.singleOrNull()?.toString()
        ?: throw PatchException("Could not find GoogleApiClient.Builder.setApiAvailabilityForTesting")

    val availabilityParameters = listOf("Landroid/content/Context;", "I")
    val isAvailable = inheritedMethod(availabilityClass, "GoogleApiAvailability.isGooglePlayServicesAvailable") {
        it.returnType == "I" && it.parameterTypeNames() == availabilityParameters
    }

    // It delegates to the static GooglePlayServicesUtilLight check, which other code also calls directly.
    val utility = isAvailable.implementation!!.instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.returnType == "I" && it.parameterTypeNames() == availabilityParameters }
        .distinct()
        .singleOrNull()
        ?: throw PatchException("Could not find GooglePlayServicesUtilLight.isGooglePlayServicesAvailable")
    val utilityMethod = mutableClassDefBy(utility.definingClass).methods.single {
        it.name == utility.name && it.returnType == utility.returnType && it.parameterTypes == utility.parameterTypes
    }

    listOf(isAvailable, utilityMethod).forEach { it.returnSuccess() }
}

/** ConnectionResult.SUCCESS. */
private fun MutableMethod.returnSuccess() = addInstructions(
    0,
    """
        const/4 v0, 0x0
        return v0
    """,
)

/** Maps would keep asking to install or update Google Play services, which does not apply to MicroG-RE. */
private fun BytecodePatchContext.hidePlayServicesAvailabilityNotification() {
    val method = uniqueMethod(PlayServicesAvailabilityNotificationFingerprint, "Play services availability notification")
    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) throw PatchException("Unexpected abstract $method")

    method.addInstruction(0, "return-void")
}

/** Check at startup that MicroG-RE is installed and allowed to run in the background. */
private fun BytecodePatchContext.injectGmsCoreCheck() {
    inheritedMethod(MAPS_ACTIVITY_CLASS, "MapsActivity.onCreate") {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypeNames() == listOf("Landroid/os/Bundle;")
    }.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/app/Activity;)V",
    )
}

// endregion

// region Fingerprints

private object ServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

private object PlayServicesAvailabilityNotificationFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/google/android/gms/common/ConnectionResult;"),
    strings = listOf("com.google.android.gms.availability"),
)

// endregion

// region GmsCore names

/**
 * Service actions Maps uses beyond the ones shared with other Google apps in [ACTIONS].
 * MicroG-RE declares each of them under the GmsCore vendor.
 */
private val MAPS_ACTIONS = setOf(
    // Location.
    "com.google.android.location.internal.GoogleLocationManagerService.START",
    "com.google.android.gms.location.settings.GOOGLE_LOCATION_SETTINGS",
    "com.google.android.gms.location.settings.LOCATION_SHARING",
    // Timeline.
    "com.google.android.gms.semanticlocationhistory.service.START",
    "com.google.android.gms.auth.key.retrieval.service.START",
    "com.google.android.gms.clearcut.bootcount.service.START",
    "com.google.android.gms.chimera.container.moduleinstall.ModuleInstallService.START",
)

private val PERMISSIONS = setOf(
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

private val ACTIONS = setOf(
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

private val AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.android.gsf.subscribedfeeds",
    "com.google.settings",
)

// endregion
