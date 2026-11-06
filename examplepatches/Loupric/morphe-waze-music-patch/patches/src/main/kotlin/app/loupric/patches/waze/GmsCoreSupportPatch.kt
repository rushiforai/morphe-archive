package app.loupric.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loupric.patches.waze.Constants.COMPATIBILITY_WAZE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val GMS_PACKAGE = "com.google.android.gms"
private const val MICROG_PACKAGE = "app.revanced.android.gms"
private const val GMS_VENDOR_GROUP_ID = "app.revanced"

// SHA-1 of the original Waze signing certificate (CN=Alex Agranovich, O=Waze)
private const val WAZE_ORIGINAL_SIGNATURE = "35b438fe1bc69d975dc8702dc16ab69ebf65f26f"

/**
 * Every permission, intent action, and content-provider authority that MicroG-RE (the
 * "app.revanced.android.gms" fork) declares under its own vendor prefix instead of the
 * literal "com.google.android.gms.*" name. Waze's bytecode still references the original
 * strings, so an explicit Intent (setPackage + setAction) or ContentResolver call against
 * one of these never matches any component MicroG-RE actually exports — the bind just fails
 * silently. This mirrors the official Morphe/ReVanced GmsCoreSupportPatch string tables
 * (app.morphe.patches.shared.misc.gms.GmsCoreSupportPatch.Constants) so nothing is missed,
 * in particular the sign-in ones: auth.api.signin.service.START, signin.service.START,
 * auth.GOOGLE_SIGN_IN.
 */
private object GmsStringTables {
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

    val ACTIONS = setOf(
        "com.google.android.c2dm.intent.RECEIVE",
        "com.google.android.c2dm.intent.REGISTER",
        "com.google.android.c2dm.intent.REGISTRATION",
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
        "com.google.android.gms.app.settings.GoogleSettingsLink",
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
        "com.google.firebase.auth.api.gms.service.START",
        "com.google.firebase.dynamiclinks.service.START",
        "com.google.iid.TOKEN_REQUEST",
        "com.google.android.gms.location.places.ui.PICK_PLACE",
    )

    val AUTHORITIES = setOf(
        "com.google.android.gms.auth.accounts",
        "com.google.android.gms.chimera",
        "com.google.android.gms.fonts",
        "com.google.android.gms.phenotype",
        "com.google.android.gsf.gservices",
        "com.google.settings",
    )

    // "subscribedfeeds" has no com.google prefix in GmsCore but is renamed under the vendor id too.
    private val EXTRA_EXACT = setOf("subscribedfeeds" to "$GMS_VENDOR_GROUP_ID.subscribedfeeds")

    /**
     * Exact-match string -> replacement string, covering the package name itself plus every
     * permission/action/authority above (all rewritten by substituting the "com.google" prefix
     * for the vendor group id, same convention MicroG-RE's own manifest uses).
     */
    val EXACT_REPLACEMENTS: Map<String, String> = buildMap {
        put(GMS_PACKAGE, MICROG_PACKAGE)
        (PERMISSIONS + ACTIONS + AUTHORITIES).forEach { original ->
            put(original, original.replace("com.google", GMS_VENDOR_GROUP_ID))
        }
        EXTRA_EXACT.forEach { (from, to) -> put(from, to) }
    }

    /**
     * content:// URIs embed an authority that isn't a standalone string constant
     * (e.g. "content://com.google.settings/partner"), so these need a prefix rewrite
     * rather than an exact match.
     */
    fun rewriteContentUri(value: String): String? {
        if (!value.startsWith("content://")) return null
        for (authority in AUTHORITIES) {
            val prefix = "content://$authority"
            if (value.startsWith(prefix)) {
                return value.replaceFirst(prefix, "content://${authority.replace("com.google", GMS_VENDOR_GROUP_ID)}")
            }
        }
        val subscribedFeedsPrefix = "content://subscribedfeeds"
        if (value.startsWith(subscribedFeedsPrefix)) {
            return value.replaceFirst(subscribedFeedsPrefix, "content://$GMS_VENDOR_GROUP_ID.subscribedfeeds")
        }
        return null
    }
}

private object WazeServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/google/android/gms/common/")
    },
)

private object WazeGooglePlayUtilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    strings = listOf(
        "This should never happen.",
        "MetadataValueReader",
    ),
)

// Matches CredentialProviderPlayServicesImpl.isAvailableOnDevice() (no-arg overload).
// Called by instantiatePreUProvider() to decide whether to accept this provider.
private object CredentialProviderPlayServicesAvailableFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.type == "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
    },
)

// Matches com.google.android.gms.common.ah.e(PackageInfo, Z)Z — the GMS certificate
// validator. Returns false for MicroG (not signed with Google key) → SERVICE_INVALID.
// Returning true bypasses both the GMS and Play Store certificate checks inside ag.a(),
// allowing the method to reach the version check at the end.
private object GmsCertificateValidatorFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L", "Z"),
    custom = { _, classDef ->
        classDef.type == "Lcom/google/android/gms/common/ah;"
    },
)

// Matches com.google.android.gms.common.util.b.c(Context)Z — an "isEmbeddedDevice" check.
// Returns true to skip the Play Store Signature.equals() block in ag.a() so MicroG's
// unsigned-by-Google cert doesn't cause SERVICE_INVALID before the version check.
private object GmsEmbeddedDeviceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L"),
    strings = listOf("android.hardware.type.embedded"),
    custom = { _, classDef ->
        classDef.type == "Lcom/google/android/gms/common/util/b;"
    },
)

// Matches com.google.android.gms.common.ag.a(Context, int)I — isGooglePlayServicesAvailable()
// with a minimum-version parameter. MicroG reports versionCode 250932004 but Waze requires
// 252400000, so this method logs "Google Play services out of date for …" and returns
// SERVICE_VERSION_UPDATE_REQUIRED (2). The GMS client layer then falls back to real
// com.google.android.gms, whose OAuth rejects com.waze.morphe. Returning 0 (SUCCESS)
// prevents the fallback so the connection stays on MicroG throughout.
private object GmsIsAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play services out of date for "),
)

private val wazeGmsCoreSupportResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifestNode = document.getElementsByTagName("manifest").item(0)
            val queriesNodes = document.getElementsByTagName("queries")
            val queriesNode = if (queriesNodes.length > 0) {
                queriesNodes.item(0)
            } else {
                val newQueries = document.createElement("queries")
                manifestNode.appendChild(newQueries)
                newQueries
            }
            val pkgNode = document.createElement("package")
            pkgNode.setAttribute("android:name", MICROG_PACKAGE)
            queriesNode.appendChild(pkgNode)

            val app = document.getElementsByTagName("application").item(0)
            fun meta(name: String, value: String) {
                val node = document.createElement("meta-data")
                node.setAttribute("android:name", name)
                node.setAttribute("android:value", value)
                app.appendChild(node)
            }
            meta("app.revanced.android.gms.SPOOFED_PACKAGE_NAME", "com.waze")
            meta("app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE", WAZE_ORIGINAL_SIGNATURE)
            meta("app.revanced.MICROG_PACKAGE_NAME", MICROG_PACKAGE)
        }
    }
}

@Suppress("unused")
val wazeGmsCoreSupportPatch = bytecodePatch(
    name = "Waze GmsCore support",
    description = "Redirects GMS calls to MicroG (app.revanced.android.gms) and enables Google account sign-in.",
    default = true
) {
    dependsOn(wazeGmsCoreSupportResourcePatch)
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        // Rewrite every GMS-related string constant in Waze's bytecode so it targets MicroG
        // (app.revanced.android.gms) instead of real Play Services: the bare package name,
        // every permission/intent-action/content-authority MicroG-RE declares under its own
        // vendor prefix (see GmsStringTables — this is what makes the sign-in service bind
        // actually resolve), and content:// URIs that embed one of those authorities.
        // Handles both CONST_STRING (21c, index < 65536) and CONST_STRING_JUMBO (31c, index ≥ 65536)
        // so that service-binding calls inside large DEX files are also redirected.
        fun resolveReplacement(original: String): String? =
            GmsStringTables.EXACT_REPLACEMENTS[original] ?: GmsStringTables.rewriteContentUri(original)

        getAllClassesWithStrings().forEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                val matches = instructions.withIndex()
                    .mapNotNull { (index, inst) ->
                        val original = when (inst.opcode) {
                            Opcode.CONST_STRING ->
                                ((inst as? Instruction21c)?.reference as? StringReference)?.string
                            Opcode.CONST_STRING_JUMBO ->
                                ((inst as? Instruction31c)?.reference as? StringReference)?.string
                            else -> null
                        } ?: return@mapNotNull null

                        val replacement = resolveReplacement(original) ?: return@mapNotNull null
                        index to replacement
                    }

                if (matches.isEmpty()) return@forEach

                val mutableMethod = mutableClass.methods.first { m ->
                    m.name == method.name &&
                    m.returnType == method.returnType &&
                    m.parameters.map { it.type } == method.parameters.map { it.type }
                }

                matches.forEach { (index, replacement) ->
                    val original = instructions.elementAt(index)
                    when (original.opcode) {
                        Opcode.CONST_STRING -> mutableMethod.replaceInstruction(
                            index,
                            BuilderInstruction21c(
                                Opcode.CONST_STRING,
                                (original as Instruction21c).registerA,
                                ImmutableStringReference(replacement),
                            ),
                        )
                        Opcode.CONST_STRING_JUMBO -> mutableMethod.replaceInstruction(
                            index,
                            BuilderInstruction31c(
                                Opcode.CONST_STRING_JUMBO,
                                (original as Instruction31c).registerA,
                                ImmutableStringReference(replacement),
                            ),
                        )
                        else -> {}
                    }
                }
            }
        }

        WazeServiceCheckFingerprint.methodOrNull?.addInstruction(0, "return-void")

        if (WazeGooglePlayUtilityFingerprint.methodOrNull != null) {
            WazeGooglePlayUtilityFingerprint.method.apply {
                addInstruction(0, "const/4 p1, 0x0")
                addInstruction(1, "return p1")
            }
        }

        // Previously forced to always instantiate the Play-Services-backed (closed-source)
        // credential provider. That provider talks to GmsCore over the modern Identity
        // Services API (GetServiceRequest[IDENTITY_CREDENTIALS] / [AUTH_API_IDENTITY_SIGNIN]),
        // which MicroG's GmsDummySvc does not implement — it always answers API_DISABLED,
        // so Waze looped forever between the "credman" and "gis" retry paths and Google
        // sign-in never completed. Forcing isAvailableOnDevice() to false instead makes
        // CredentialProviderFactory skip this provider entirely, so Waze falls back to its
        // own legacy GoogleSignInClient-based flow, which MicroG does implement.
        CredentialProviderPlayServicesAvailableFingerprint.methodOrNull?.apply {
            addInstruction(0, "const/4 p0, 0x0")
            addInstruction(1, "return p0")
        }

        GmsCertificateValidatorFingerprint.methodOrNull?.apply {
            addInstruction(0, "const/4 v0, 0x1")
            addInstruction(1, "return v0")
        }

        GmsEmbeddedDeviceFingerprint.methodOrNull?.apply {
            addInstruction(0, "const/4 p0, 0x1")
            addInstruction(1, "return p0")
        }

        // Make isGooglePlayServicesAvailable(Context, int) always return SUCCESS (0)
        // so the GMS connection to MicroG proceeds without version-based fallback to real GMS.
        GmsIsAvailableFingerprint.methodOrNull?.apply {
            addInstruction(0, "const/4 p0, 0x0")
            addInstruction(1, "return p0")
        }
    }
}
