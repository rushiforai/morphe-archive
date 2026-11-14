/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.misc

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val LINKEDIN_PACKAGE = "com.linkedin.android"

/** SHA-1 of LinkedIn's signing certificate: GmsCore hands this to Google in place of the patched app's own. */
private const val LINKEDIN_SIGNATURE = "443cb997718d0ac5162888bae5e4724582862676"

/** Vendor id GmsCore uses where the app would otherwise name "com.google". */
private const val GMS_CORE_VENDOR = "app.revanced"

private const val GMS_CORE_PACKAGE = "$GMS_CORE_VENDOR.android.gms"

/**
 * Play services version from which Credential Manager takes the Identity Credentials path, which GmsCore does not
 * implement (the PRE_U_MIN_GMS_APK_VERSION constant of androidx.credentials).
 */
private const val GMS_CORE_MAX_APK_VERSION = 252400000

/** Google's availability checks: they compare the signature of the Play services package. */
private const val PLAY_SERVICES_UTIL = "Lcom/google/android/gms/common/GooglePlayServicesUtilLight;"

/** Chooses the Credential Manager implementation: the platform one on Android 14+, Play services' below it. */
private const val CREDENTIAL_PROVIDER_FACTORY = "Landroidx/credentials/CredentialProviderFactory;"

/**
 * Names that have to move from the Google packages to GmsCore's: every permission, intent action and
 * content provider authority of Google Play services that LinkedIn references. One entry per line, where a
 * line that starts at the left margin is the shared prefix (a package or a provider path) of the indented
 * lines under it.
 */
private fun gmsNames(namespace: String): Set<String> = buildSet {
    var prefix = ""
    for (raw in namespace.lineSequence()) {
        if (raw.isBlank()) continue
        val name = raw.trim()
        if (raw.startsWith(" ")) add("$prefix.$name") else prefix = name
    }
}

private val REPLACED_PERMISSIONS = gmsNames(
    """
com.google.android.c2dm.permission
    RECEIVE
    SEND
com.google.android.gms.auth.api.phone.permission
    SEND
com.google.android.gms.permission
    AD_ID
    AD_ID_NOTIFICATION
    CAR_FUEL
    CAR_INFORMATION
    CAR_MILEAGE
    CAR_SPEED
    CAR_VENDOR_EXTENSION
com.google.android.googleapps.permission
    GOOGLE_AUTH
com.google.android.googleapps.permission.GOOGLE_AUTH
    cp
    local
    mail
    writely
com.google.android.gtalkservice.permission
    GTALK_SERVICE
com.google.android.providers.gsf.permission
    READ_GSERVICES
    """.trimIndent()
)

private val REPLACED_ACTIONS = gmsNames(
    """
com.google.android.c2dm.intent
    RECEIVE
    REGISTER
    UNREGISTER
com.google.android.contextmanager.service.ContextManagerService
    START
com.google.android.gcm.intent
    SEND
com.google.android.gms.accounts
    ACCOUNT_SERVICE
com.google.android.gms.accountsettings
    ACCOUNT_PREFERENCES_SETTINGS
    MY_ACCOUNT
    PRIVACY_SETTINGS
    SECURITY_SETTINGS
com.google.android.gms.accountsettings.action
    BROWSE_SETTINGS
    VIEW_SETTINGS
com.google.android.gms.ads.gservice
    START
com.google.android.gms.ads.identifier.service
    EVENT_ATTESTATION
com.google.android.gms.ads.service
    CACHE
    CONSENT_LOOKUP
    HTTP
com.google.android.gms.analytics.service
    START
com.google.android.gms.appstate.service
    START
com.google.android.gms.appusage.service
    START
com.google.android.gms.asterism.service
    START
com.google.android.gms.audiomodem.service.AudioModemService
    START
com.google.android.gms.audit.service
    START
com.google.android.gms.auth.account.authapi
    START
com.google.android.gms.auth.account.authenticator.auto.service
    START
com.google.android.gms.auth.account.authenticator.chromeos
    START
com.google.android.gms.auth.account.authenticator.tv.service
    START
com.google.android.gms.auth.account.data.service
    START
com.google.android.gms.auth.api.credentials
    PICKER
com.google.android.gms.auth.api.credentials.service
    START
com.google.android.gms.auth.api.identity.service.authorization
    START
com.google.android.gms.auth.api.identity.service.credentialsaving
    START
com.google.android.gms.auth.api.identity.service.signin
    START
com.google.android.gms.auth.api.phone.service.InternalService
    START
com.google.android.gms.auth.api.signin.service
    START
com.google.android.gms.auth.be.appcert
    AppCertService
com.google.android.gms.auth.blockstore.service
    START
com.google.android.gms.auth.config.service
    START
com.google.android.gms.auth.cryptauth.cryptauthservice
    START
com.google.android.gms.auth
    GOOGLE_SIGN_IN
com.google.android.gms.auth.login
    LOGIN
com.google.android.gms.auth.proximity.devicesyncservice
    START
com.google.android.gms.auth.proximity.securechannelservice
    START
com.google.android.gms.auth.proximity
    START
com.google.android.gms.auth.service
    START
com.google.android.gms.backup
    ACTION_BACKUP_SETTINGS
    G1_BACKUP
    G1_RESTORE
    GMS_MODULE_RESTORE
com.google.android.gms.beacon.internal.IBleService
    START
com.google.android.gms.car.service
    START
com.google.android.gms.carrierauth.service
    START
com.google.android.gms.cast.firstparty
    START
com.google.android.gms.cast.remote_display.service
    START
com.google.android.gms.cast.service
    BIND_CAST_DEVICE_CONTROLLER_SERVICE
com.google.android.gms.cast_mirroring.service
    START
com.google.android.gms.checkin
    BIND_TO_SERVICE
com.google.android.gms.chromesync.service
    START
com.google.android.gms.clearcut.service
    START
com.google.android.gms.common.account
    CHOOSE_ACCOUNT
com.google.android.gms.common.download
    START
com.google.android.gms.common.service
    START
com.google.android.gms.common.telemetry.service
    START
com.google.android.gms.config
    START
com.google.android.gms.constellation.service
    START
com.google.android.gms.credential.manager.service.firstparty
    START
com.google.android.gms.deviceconnection.service
    START
com.google.android.gms.drive.ApiService
    RESET_AFTER_BOOT
    START
    STOP
com.google.android.gms.droidguard.service
    INIT
    PING
    START
com.google.android.gms.enterprise.loader.service
    START
com.google.android.gms.facs.cache.service
    START
com.google.android.gms.facs.internal.service
    START
com.google.android.gms.feedback.internal
    IFeedbackService
com.google.android.gms.fido.credentialstore.internal_service
    START
com.google.android.gms.fido.fido2.privileged
    START
com.google.android.gms.fido.fido2.regular
    START
com.google.android.gms.fido.fido2.zeroparty
    START
com.google.android.gms.fido.sourcedevice.service
    START
com.google.android.gms.fido.targetdevice.internal_service
    START
com.google.android.gms.fido.u2f.privileged
    START
com.google.android.gms.fido.u2f.thirdparty
    START
com.google.android.gms.fido.u2f.zeroparty
    START
com.google.android.gms.fitness
    BleApi
    ConfigApi
    GoalsApi
    HistoryApi
    InternalApi
    RecordingApi
    SensorsApi
    SessionsApi
com.google.android.gms.fitness.GoogleFitnessService
    START
com.google.android.gms.fonts.service
    START
com.google.android.gms.freighter.service
    START
com.google.android.gms.games.internal.connect.service
    START
com.google.android.gms.games
    PLAY_GAMES_UPGRADE
com.google.android.gms.games.service
    START
com.google.android.gms.gass
    START
com.google.android.gms.gmscompliance.service
    START
com.google.android.gms.googlehelp
    HELP
com.google.android.gms.googlehelp.service.GoogleHelpService
    START
com.google.android.gms.growth.service
    START
com.google.android.gms.herrevad.services.LightweightNetworkQualityAndroidService
    START
com.google.android.gms.icing
    INDEX_SERVICE
    LIGHTWEIGHT_INDEX_SERVICE
com.google.android.gms.identity.service
    BIND
com.google.android.gms.inappreach.service
    START
com.google.android.gms.instantapps
    START
com.google.android.gms.kids.service
    START
com.google.android.gms.languageprofile.service
    START
com.google.android.gms.learning.internal.dynamitesupport
    START
com.google.android.gms.learning.intservice
    START
com.google.android.gms.learning.predictor
    START
com.google.android.gms.learning.trainer
    START
com.google.android.gms.learning.training.background
    START
com.google.android.gms.location.places
    GeoDataApi
    PlaceDetectionApi
    PlacesApi
com.google.android.gms.location.reporting.service
    START
com.google.android.gms.location.settings
    LOCATION_HISTORY
    LOCATION_REPORTING_SETTINGS
com.google.android.location.internal
    GoogleLocationManagerService
com.google.android.gms.locationsharing.api
    START
com.google.android.gms.locationsharingreporter.service
    START
com.google.android.gms.lockbox.service
    START
com.google.android.gms.matchstick.lighter.service
    START
com.google.android.gms.mdm.services.DeviceManagerApiService
    START
com.google.android.gms.mdm.services
    START
com.google.android.gms.mdns.service
    START
com.google.android.gms.measurement
    START
com.google.android.gms.nearby.bootstrap.service.NearbyBootstrapService
    START
com.google.android.gms.nearby.connection.service
    START
com.google.android.gms.nearby.fastpair
    START
com.google.android.gms.nearby.messages.service.NearbyMessagesService
    START
com.google.android.gms.nearby.sharing.service.NearbySharingService
    START
com.google.android.gms.nearby.sharing
    START_SERVICE
com.google.android.gms.notifications.service
    START
com.google.android.gms.ocr.service.internal
    START
com.google.android.gms.ocr.service
    START
com.google.android.gms.oss.licenses.service
    START
com.google.android.gms.payse.service
    BIND
com.google.android.gms.people.contactssync.service
    START
com.google.android.gms.people.service
    START
com.google.android.gms.phenotype.service
    START
com.google.android.gms.photos.autobackup.service
    START
com.google.android.gms.playlog.service
    START
com.google.android.gms.plus.service.default
    INTENT
com.google.android.gms.plus.service.image
    INTENT
com.google.android.gms.plus.service.internal
    START
com.google.android.gms.plus.service
    START
com.google.android.gms.potokens.service
    START
com.google.android.gms.pseudonymous.service
    START
com.google.android.gms.rcs
    START
com.google.android.gms.reminders.service
    START
com.google.android.gms.romanesco
    MODULE_BACKUP_AGENT
com.google.android.gms.romanesco.service
    START
com.google.android.gms.safetynet.service
    START
com.google.android.gms.scheduler
    ACTION_PROXY_SCHEDULE
com.google.android.gms.search.service
    SEARCH_AUTH_START
com.google.android.gms.semanticlocation.service
    START_ODLH
com.google.android.gms.sesame.service
    BIND
com.google.android.gms.settings
    EXPOSURE_NOTIFICATION_SETTINGS
com.google.android.gms.setup.auth.SecondDeviceAuth
    START
com.google.android.gms.signin.service
    START
com.google.android.gms.smartdevice.d2d.SourceDeviceService
    START
com.google.android.gms.smartdevice.d2d.TargetDeviceService
    START
com.google.android.gms.smartdevice.directtransfer.SourceDirectTransferService
    START
com.google.android.gms.smartdevice.directtransfer.TargetDirectTransferService
    START
com.google.android.gms.smartdevice.postsetup.PostSetupService
    START
com.google.android.gms.smartdevice.setup.accounts.AccountsService
    START
com.google.android.gms.smartdevice.wifi
    START_WIFI_HELPER_SERVICE
com.google.android.gms.social.location.activity.service
    START
com.google.android.gms.speech.service
    START
com.google.android.gms.statementservice
    EXECUTE
com.google.android.gms.stats
    ACTION_UPLOAD_DROPBOX_ENTRIES
com.google.android.gms.tapandpay.service
    BIND
com.google.android.gms.telephonyspam.service
    START
com.google.android.gms.testsupport.service
    START
com.google.android.gms.thunderbird.service
    START
com.google.android.gms.trustagent.BridgeApi
    START
com.google.android.gms.trustagent.StateApi
    START
com.google.android.gms.trustagent.trustlet.trustletmanagerservice
    BIND
com.google.android.gms.trustlet.bluetooth.service
    BIND
com.google.android.gms.trustlet.connectionlessble.service
    BIND
com.google.android.gms.trustlet.face.service
    BIND
com.google.android.gms.trustlet.nfc.service
    BIND
com.google.android.gms.trustlet.onbody.service
    BIND
com.google.android.gms.trustlet.place.service
    BIND
com.google.android.gms.trustlet.voiceunlock.service
    BIND
com.google.android.gms.udc.service
    START
com.google.android.gms.update
    START_API_SERVICE
    START_SERVICE
    START_SINGLE_USER_API_SERVICE
    START_TV_API_SERVICE
com.google.android.gms.usagereporting.service
    START
com.google.android.gms.userlocation.service
    START
com.google.android.gms.vehicle.cabin.service
    START
com.google.android.gms.vehicle.climate.service
    START
com.google.android.gms.vehicle.info.service
    START
com.google.android.gms.wallet.firstparty
    ACTION_PURCHASE_MANAGER
com.google.android.gms.wallet.service
    BIND
com.google.android.gms.walletp2p.service.firstparty
    BIND
com.google.android.gms.walletp2p.service.zeroparty
    BIND
com.google.android.gms.wearable
    BIND
    BIND_LISTENER
    DATA_CHANGED
    MESSAGE_RECEIVED
    NODE_CHANGED
com.google.android.gsf.action
    GET_GLS
com.google.android.location.settings
    LOCATION_REPORTING_SETTINGS
com.google.android.mdd.service
    START
com.google.android.mdh.service.listener
    START
com.google.android.mdh.service
    START
com.google.android.mobstore.service
    START
com.google.iid
    TOKEN_REQUEST
com.google.android.gms.location.places.ui
    PICK_PLACE
    """.trimIndent()
)

private val REPLACED_AUTHORITIES = gmsNames(
    """
com.google.android.gms.auth
    accounts
com.google.android.gms
    chimera
    fonts
    phenotype
com.google.android.gsf
    gservices
    subscribedfeeds
com.google
    settings
    """.trimIndent()
)

/** Neither side of the redirect is a plain rename, so the manifest is patched separately from the dex. */
private val gmsCoreSupportResourcePatch = resourcePatch {
    execute {
        val manifest = get("AndroidManifest.xml")
        manifest.writeText(manifest.readText().replace("com.google.android.c2dm", "$GMS_CORE_VENDOR.android.c2dm"))

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            fun metaData(name: String, value: String) = document.createElement("meta-data").also { entry ->
                entry.setAttribute("android:name", name)
                entry.setAttribute("android:value", value)
                application.appendChild(entry)
            }
            // GmsCore reads these to know which package and certificate it should present to Google.
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_NAME", LINKEDIN_PACKAGE)
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_SIGNATURE", LINKEDIN_SIGNATURE)
            metaData("$GMS_CORE_VENDOR.MICROG_PACKAGE_NAME", GMS_CORE_PACKAGE)

            // Package visibility: without this entry Android 11+ hides GmsCore from the app.
            val queries = document.getElementsByTagName("queries").item(0) as? Element
                ?: document.createElement("queries").also { document.documentElement.insertBefore(it, application) }
            queries.appendChild(document.createElement("package").also {
                it.setAttribute("android:name", GMS_CORE_PACKAGE)
            })
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Routes \"Continue with Google\" through microG RE (GmsCore) instead of Google Play services, so " +
        "signing in works in patched LinkedIn. microG RE has to be installed and signed in to a Google account.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, gmsCoreSupportResourcePatch)

    execute {
        val renamed = buildMap {
            put("com.google", GMS_CORE_VENDOR)
            put("com.google.android.gms", GMS_CORE_PACKAGE)
            for (name in REPLACED_PERMISSIONS + REPLACED_ACTIONS + REPLACED_AUTHORITIES) {
                put(name, name.replace("com.google", GMS_CORE_VENDOR))
            }
        }
        // Content URIs carry an authority followed by a path, so they are matched by prefix instead.
        fun gmsCoreName(string: String): String? = renamed[string]
            ?: REPLACED_AUTHORITIES.firstOrNull { string.startsWith("content://$it") }?.let { authority ->
                string.replace("content://$authority", "content://${authority.replace("com.google", GMS_CORE_VENDOR)}")
            }

        if (replaceStrings(::gmsCoreName) == 0) throw PatchException("No Google Play services strings found")

        // The patched app is signed with another key, so every signature check would fail. GmsCore is reported
        // as an old Play services instead: the APIs that need 25.24 or newer (Credential Manager's Identity
        // Credentials API, absent from GmsCore) then fall back to the ones GmsCore implements, and nothing on
        // the sign-in path aborts on the check.
        mutableClass(PLAY_SERVICES_UTIL).methods.forEach { method ->
            when (method.name) {
                "isGooglePlayServicesAvailable" -> method.addInstructions(
                    0,
                    """
                        const v0, $GMS_CORE_MAX_APK_VERSION
                        if-ge p1, v0, :too_old
                        const/4 v0, 0x0
                        return v0
                        :too_old
                        const/4 v0, 0x2
                        return v0
                    """
                )
                "ensurePlayServicesAvailable" -> method.addInstructions(0, "return-void")
            }
        }

        // The platform's Credential Manager would ask the real Play services, whose signature check fails.
        // Play services' own implementation inside the app talks to GmsCore instead.
        mutableClass(CREDENTIAL_PROVIDER_FACTORY).methods
            .first { it.name == "getBestAvailableProvider\$default" }
            .addInstructions(
                0,
                """
                    invoke-virtual { p0 }, $CREDENTIAL_PROVIDER_FACTORY->tryCreateClosedSourceProviderFromManifest()Landroidx/credentials/CredentialProvider;
                    move-result-object v0
                    return-object v0
                """
            )

        // Push needs a Firebase installation first, and Google only issues one when the request names the
        // certificate LinkedIn's API key is bound to. The patched app is signed with another key, so the request is
        // refused (API_KEY_ANDROID_APP_BLOCKED), GmsCore's push registration then fails with FIS_AUTH_ERROR, and
        // no notification ever arrives. The header gets LinkedIn's own certificate instead.
        spoofFirebaseCertificate(LINKEDIN_SIGNATURE.uppercase())

        markIncluded("isGmsCoreSupportIncluded")
    }
}

/**
 * Sets the value of every "X-Android-Cert" request header to [sha1]. Firebase names the header with a string
 * constant and passes it straight to URLConnection, so the value register is found from that call, whatever the
 * obfuscated class around it is called.
 */
private fun BytecodePatchContext.spoofFirebaseCertificate(sha1: String) {
    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.stringConstant() == "X-Android-Cert" } == true
            }) holders += classDef
    }
    var spoofed = 0
    holders.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.reversed().forEach { index ->
                if (code[index].stringConstant() != "X-Android-Cert") return@forEach
                val name = (code[index] as OneRegisterInstruction).registerA
                val call = (index + 1 until minOf(index + 6, code.size)).firstOrNull { at ->
                    val instruction = code[at]
                    val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction is FiveRegisterInstruction && instruction.registerCount == 3 &&
                        instruction.registerD == name &&
                        target?.definingClass == "Ljava/net/URLConnection;" &&
                        target.name.endsWith("RequestProperty")
                } ?: return@forEach
                val value = (code[call] as FiveRegisterInstruction).registerE
                method.addInstructions(call, "const-string v$value, \"$sha1\"")
                spoofed++
            }
        }
    }
    if (spoofed == 0) throw PatchException("Firebase certificate header not found")
}

/** The mutable class with [type]. */
private fun BytecodePatchContext.mutableClass(type: String): MutableClass {
    var found: MutableClass? = null
    classDefForEach { if (it.type == type) found = mutableClassDefBy(it) }
    return found ?: throw PatchException("$type not found")
}

/** Rewrites every string constant [rename] knows; returns how many were rewritten. */
private fun BytecodePatchContext.replaceStrings(rename: (String) -> String?): Int {
    val holders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val holds = classDef.methods.any { method ->
            method.implementation?.instructions?.any { it.stringConstant()?.let(rename) != null } == true
        }
        if (holds) holders += classDef
    }
    var rewritten = 0
    holders.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            // Backwards: jumbo strings that grow must not shift the indexes still to visit.
            code.indices.reversed().forEach { index ->
                val instruction = code[index]
                val new = instruction.stringConstant()?.let(rename) ?: return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                val opcode = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) "const-string/jumbo" else "const-string"
                method.replaceInstruction(index, "$opcode v$register, \"$new\"")
                rewritten++
            }
        }
    }
    return rewritten
}

/** The string this instruction loads, if it is a string constant. */
private fun Instruction.stringConstant(): String? =
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) null
    else ((this as ReferenceInstruction).reference as StringReference).string
