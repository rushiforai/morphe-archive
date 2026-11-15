/*
 * Forked from https://github.com/MorpheApp/morphe-patches at e72fe6e (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Original hard forked code:
 * https://gitlab.com/ReVanced/revanced-patches at 724e6d6
 *
 * Copyright 2026 Morphe
 * Copyright 2026 HushPinterest contributors
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PATCH = "GmsCore support"

/** microG-RE's package, which stands in for Google Play services. */
internal const val GMS_CORE_PACKAGE = "app.revanced.android.gms"

/** The vendor prefix microG-RE answers to wherever Play services would answer to com.google. */
internal const val GMS_CORE_VENDOR = "app.revanced"
private const val GOOGLE_VENDOR = "com.google"
private const val PLAY_SERVICES = "com.google.android.gms"

/** Firebase Cloud Messaging's manifest names, and the ones microG-RE delivers to instead. */
internal const val GOOGLE_C2DM = "com.google.android.c2dm."
internal const val GMS_CORE_C2DM = "app.revanced.android.c2dm."

private const val CONTEXT = "Landroid/content/Context;"
private const val CREDENTIAL_MANAGER = "Landroid/credentials/CredentialManager;"
internal const val HIDDEN_ACTIVITY = "Landroidx/credentials/playservices/HiddenActivity;"
internal const val SIGN_IN_FAILURE_TEXT = "During get sign-in intent, failure response from one tap: "
private const val EXCEPTION = "Ljava/lang/Exception;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val STRING = "Ljava/lang/String;"
private const val SIGN_IN_READINESS = "$EXTENSION_PACKAGE/settings/GoogleSignInReadiness;"
internal const val SIGN_IN_FAILURE_HOOK = "$SIGN_IN_READINESS->requestFailed($EXCEPTION)V"

/** The extension's answer for the framework provider: true while microG-RE is installed, so the provider steps aside. */
internal const val CREDENTIAL_PROVIDER_HOOK = "$SIGN_IN_READINESS->signsInThroughMicroG()Z"

/** The extension's answer for one option of a credential request: true when it asks for a Google ID token. */
internal const val GOOGLE_ID_OPTION_HOOK = "$SIGN_IN_READINESS->isGoogleIdOption(Ljava/lang/String;)Z"

/** Play services permissions microG-RE defines under its own vendor. Morphe's list. */
internal val GMS_PERMISSIONS = setOf(
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
 * Play services intent actions microG-RE serves only under its own vendor. Morphe's list, and the
 * last four, which Pinterest 14.43.0 binds and microG-RE 7.2.2 declares only as app.revanced
 * actions: Credential Manager's identity credentials, App set ID, the SMS retriever and ads.
 */
internal val GMS_ACTIONS = setOf(
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
    "com.google.android.gms.identitycredentials.service.START",
    "com.google.android.gms.appset.service.START",
    "com.google.android.gms.auth.api.phone.service.SmsRetrieverApiService.START",
    "com.google.android.gms.ads.service.START",
)

/** Play services content provider authorities microG-RE serves under its own vendor. Morphe's list. */
internal val GMS_AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.android.gsf.subscribedfeeds",
    "com.google.settings",
)

/** Each exact text the reroute rewrites, and what it becomes. */
internal val GMS_CORE_TEXTS: Map<String, String> = buildMap {
    put(GOOGLE_VENDOR, GMS_CORE_VENDOR)
    put(PLAY_SERVICES, GMS_CORE_PACKAGE)
    for (text in GMS_PERMISSIONS + GMS_ACTIONS + GMS_AUTHORITIES) put(text, GMS_CORE_VENDOR + text.removePrefix(GOOGLE_VENDOR))
}

/**
 * Texts Pinterest has to name for the reroute to mean anything: Play services itself, the Google
 * account type, Firebase Cloud Messaging's registration, and the sign-in services Google sign-in
 * binds. A build missing one has moved on, so the patch refuses rather than half reroute it.
 */
internal val GMS_CORE_REQUIRED_TEXTS = listOf(
    PLAY_SERVICES, GOOGLE_VENDOR, "com.google.android.c2dm.intent.REGISTER", "com.google.iid.TOKEN_REQUEST",
    "com.google.android.gms.auth.api.identity.service.signin.START", "com.google.android.gms.identitycredentials.service.START",
)

/**
 * What [text] becomes under microG-RE, or null when it stays. An exact name from the lists, or a
 * content:// address whose authority is one of [GMS_AUTHORITIES], followed by nothing or a path.
 */
internal fun gmsCoreText(text: String): String? {
    GMS_CORE_TEXTS[text]?.let { return it }
    if (!text.startsWith("content://")) return null
    val rest = text.removePrefix("content://")
    val authority = GMS_AUTHORITIES.firstOrNull { rest == it || rest.startsWith("$it/") } ?: return null
    return "content://" + GMS_CORE_VENDOR + authority.removePrefix(GOOGLE_VENDOR) + rest.removePrefix(authority)
}

/** One const-string to rewrite: its method, its index, and the text it gets. */
internal data class GmsCoreText(val method: Method, val index: Int, val text: String)

/** One static String field whose value gets rewritten: its class, its name, and the text it gets. */
internal data class GmsCoreField(val type: String, val name: String, val text: String)

/**
 * androidx Credential Manager's provider choice and what its option loop reads: the request class it
 * tests its argument against, that request's option list, the option class and its type field, and
 * the call that picks the Play services provider. [call] is that call's opcode.
 */
internal data class GmsCoreProviderChoice(
    val method: Method,
    val request: String,
    val options: String,
    val option: String,
    val type: String,
    val fallback: String,
    val call: Opcode,
)

/** Everything the patch edits, found before any edit. */
internal data class GmsCorePlan(
    val availability: Method,
    val frameworkProvider: Method,
    val providerChoice: GmsCoreProviderChoice,
    val signInFailure: Method,
    val texts: List<GmsCoreText>,
    val fields: List<GmsCoreField>,
)

/**
 * Finds the five edits, refusing when any of them isn't exactly where 14.43.0 has it:
 *
 * - Play services' availability check, the one method taking a Context and the minimum version
 *   that reads the version metadata ("MetadataValueReader") and Play services' package. It answers
 *   success, so the library stops asking whether Google's own Play services is installed and
 *   signed by Google. In 14.42.0 R8 merged it into an instance method, so the shape leaves the
 *   receiver open.
 * - androidx Credential Manager's framework provider, the one class holding Android's
 *   CredentialManager. On Android 14 and later androidx prefers it, and Android hands Google
 *   sign-in to Google's own Play services whatever the app asks for, so while microG-RE is
 *   installed it answers unavailable and androidx falls back to the Play services provider, which
 *   the reroute sends to microG-RE. Without microG-RE it answers for itself: the Play services
 *   provider is missing there too, and answering unavailable left androidx no provider at all.
 * - androidx's provider choice, the one static method taking its own class and the request that
 *   builds the framework provider and asks isAvailableOnDevice. A request whose every option asks
 *   for a Google ID token goes straight to the Play services provider it would fall back to, so
 *   Continue with Google always reaches microG-RE, and without microG-RE fails into the listener
 *   below. Every other request, a saved password's among them, keeps the choice's own body.
 * - androidx's failure listener for the Sign in with Google request, the static method of its
 *   hidden activity taking that activity and an Exception and naming [SIGN_IN_FAILURE_TEXT]. It
 *   turns any failed request into "no credential", and Pinterest shows nothing for that, so the
 *   button looks dead when microG-RE can't be reached. The extension says why first. Autologin at
 *   launch goes through the begin sign-in request instead and stays silent.
 * - Every const-string outside the extension that [gmsCoreText] rewrites, and every static String
 *   field value it rewrites (14.43.0 keeps Firebase messaging's receive action in one).
 */
internal fun BytecodePatchContext.resolveGmsCore(): GmsCorePlan {
    val availability = mutableListOf<Method>()
    val providers = mutableListOf<Method>()
    val signInFailures = mutableListOf<Method>()
    val choices = mutableListOf<ChoiceCandidate>()
    val texts = mutableListOf<GmsCoreText>()
    val fields = mutableListOf<GmsCoreField>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (field in owner.staticFields) {
            val text = (field.initialValue as? StringEncodedValue)?.value ?: continue
            gmsCoreText(text)?.let { fields += GmsCoreField(owner.type, field.name, it) }
        }
        val holdsCredentialManager = owner.fields.any { it.type == CREDENTIAL_MANAGER && !AccessFlags.STATIC.isSet(it.accessFlags) }
        for (method in owner.methods) {
            val body = method.implementation?.instructions?.toList() ?: continue
            val strings = mutableSetOf<String>()
            body.forEachIndexed { index, instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ?: return@forEachIndexed
                strings += text
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                gmsCoreText(text)?.let { texts += GmsCoreText(method, index, it) }
            }
            if (method.returnType == "I" && method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT, "I") &&
                "MetadataValueReader" in strings && "This should never happen." in strings && PLAY_SERVICES in strings
            ) availability += method
            if (holdsCredentialManager && method.name == "isAvailableOnDevice" && method.returnType == "Z" &&
                method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags)
            ) providers += method
            if (owner.type == HIDDEN_ACTIVITY && method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.map(CharSequence::toString) == listOf(HIDDEN_ACTIVITY, EXCEPTION) && SIGN_IN_FAILURE_TEXT in strings
            ) signInFailures += method
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") &&
                method.parameterTypes.map(CharSequence::toString) == listOf(owner.type, OBJECT) &&
                body.any { it.methodReference()?.let { called -> called.name == "isAvailableOnDevice" &&
                    called.returnType == "Z" && called.parameterTypes.isEmpty() } == true }
            ) choices += ChoiceCandidate(method, body.filter { it.opcode == Opcode.NEW_INSTANCE }.mapTo(mutableSetOf()) { it.typeReference() })
        }
    }
    shape(availability.size == 1, "Play services' availability check has ${availability.size} matches")
    shape(providers.size == 1, "Credential Manager's framework provider has ${providers.size} matches")
    // Its only parameter is this, so any register below it is a local the answer can borrow on entry.
    shape(providers.single().implementation!!.registerCount > 1, "Credential Manager's framework provider has no local register")
    val choice = providerChoice(choices, providers.single())
    shape(signInFailures.size == 1, "androidx's sign-in failure listener has ${signInFailures.size} matches")
    val rewritten = texts.map { text -> text.method.texts()[text.index] }.toSet()
    GMS_CORE_REQUIRED_TEXTS.firstOrNull { it !in rewritten }?.let { shape(false, "Pinterest no longer names $it") }
    return GmsCorePlan(availability.single(), providers.single(), choice, signInFailures.single(), texts, fields)
}

/** A static method that might be androidx's provider choice, with the classes it builds. */
internal class ChoiceCandidate(val method: Method, val built: Set<String>)

/**
 * The one candidate that builds [provider]'s class, and what its option loop reads, refusing when
 * any piece isn't single or the hook can't run in its frame.
 */
private fun BytecodePatchContext.providerChoice(candidates: List<ChoiceCandidate>, provider: Method): GmsCoreProviderChoice {
    val matches = candidates.filter { provider.definingClass in it.built }
    shape(matches.size == 1, "androidx's credential provider choice has ${matches.size} matches")
    val method = matches.single().method
    val implementation = method.implementation!!
    val body = implementation.instructions.toList()
    // Static, so the choice's class and the request are the last two registers and the rest are
    // locals. The hook names p0 and p1 in four-bit register forms.
    val registers = implementation.registerCount
    shape(registers >= 4, "androidx's credential provider choice has fewer than two local registers")
    shape(registers <= 16, "androidx's credential provider choice has more registers than the hook can name")
    val requests = body.filter { it.opcode == Opcode.INSTANCE_OF && (it as TwoRegisterInstruction).registerB == registers - 1 }
        .mapTo(mutableSetOf()) { it.typeReference() }
    shape(requests.size == 1, "androidx's credential provider choice tests its request against ${requests.size} classes")
    val request = requests.single()
    val lists = body.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == request && it.type == LIST }.mapTo(mutableSetOf()) { it.toString() }
    shape(lists.size == 1, "androidx's credential provider choice reads ${lists.size} option lists")
    val casts = body.filter { it.opcode == Opcode.CHECK_CAST }.mapTo(mutableSetOf()) { it.typeReference() } - request
    shape(casts.size == 1, "androidx's credential provider choice casts to ${casts.size} option classes")
    val option = casts.single()
    val types = classDefByOrNull(option)?.fields?.filter { it.type == STRING && !AccessFlags.STATIC.isSet(it.accessFlags) }.orEmpty()
    shape(types.size == 1, "androidx's credential option has ${types.size} String fields")
    shape(AccessFlags.PUBLIC.isSet(types.single().accessFlags), "androidx's credential option type isn't public")
    val fallbacks = body.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_DIRECT) return@mapNotNull null
        val called = instruction.methodReference() ?: return@mapNotNull null
        if (called.definingClass != method.definingClass || called.parameterTypes.isNotEmpty() || called.returnType != method.returnType) null
        else instruction.opcode to called.toString()
    }.toSet()
    shape(fallbacks.size == 1, "androidx's credential provider choice has ${fallbacks.size} Play services lookups")
    val answers = classDefByOrNull(provider.definingClass)?.interfaces.orEmpty()
    shape(method.returnType in answers, "androidx's credential provider choice doesn't answer the framework provider's kind")
    val (call, fallback) = fallbacks.single()
    return GmsCoreProviderChoice(method, request, lists.single(), option, "$option->${types.single().name}:$STRING", fallback, call)
}

/** Rewrites every planned text and field, answers the two checks, hooks the provider choice, then the listener. Texts go first: they keep every index. */
internal fun BytecodePatchContext.applyGmsCore(plan: GmsCorePlan) {
    for ((type, sites) in plan.texts.groupBy { it.method.definingClass }) {
        val owner = mutableClassDefBy(type)
        for (site in sites) {
            val method = owner.methods.single { it.same(site.method) }
            val original = method.implementation!!.instructions[site.index]
            val register = (original as OneRegisterInstruction).registerA
            val reference = ImmutableStringReference(site.text)
            method.replaceInstruction(site.index, when (original.opcode) {
                Opcode.CONST_STRING -> BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                else -> BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
            })
        }
    }
    for ((type, held) in plan.fields.groupBy { it.type }) {
        val owner = mutableClassDefBy(type)
        for (field in held) (owner.staticFields.single { it.name == field.name }.initialValue as MutableStringEncodedValue).value = field.text
    }
    mutableClassDefBy(plan.availability.definingClass).methods.single { it.same(plan.availability) }.returnEarly(0)
    // The framework provider answers false while microG-RE is installed and otherwise runs its own
    // body. v0 is a local the plan checked for, unread before the original body's first write.
    val provider = mutableClassDefBy(plan.frameworkProvider.definingClass).methods.single { it.same(plan.frameworkProvider) }
    provider.addInstructionsWithLabels(0, """
        invoke-static {}, $CREDENTIAL_PROVIDER_HOOK
        move-result v0
        if-eqz v0, :framework
        const/4 v0, 0x0
        return v0
    """, ExternalLabel("framework", provider.getInstruction(0)))
    // The provider choice sends a request whose every option asks for a Google ID token to the
    // Play services provider and runs its own body for anything else. v0 and v1 are locals the plan
    // checked for, unread before the original body's first write; p1 itself is never cast.
    val choice = plan.providerChoice
    val chooser = mutableClassDefBy(choice.method.definingClass).methods.single { it.same(choice.method) }
    val lookup = if (choice.call == Opcode.INVOKE_DIRECT) "invoke-direct" else "invoke-virtual"
    chooser.addInstructionsWithLabels(0, """
        instance-of v0, p1, ${choice.request}
        if-eqz v0, :own
        move-object v0, p1
        check-cast v0, ${choice.request}
        iget-object v0, v0, ${choice.options}
        invoke-interface {v0}, $LIST->isEmpty()Z
        move-result v1
        if-nez v1, :own
        invoke-interface {v0}, $LIST->iterator()Ljava/util/Iterator;
        move-result-object v0
        :next
        invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
        move-result v1
        if-eqz v1, :google
        invoke-interface {v0}, Ljava/util/Iterator;->next()$OBJECT
        move-result-object v1
        check-cast v1, ${choice.option}
        iget-object v1, v1, ${choice.type}
        invoke-static {v1}, $GOOGLE_ID_OPTION_HOOK
        move-result v1
        if-eqz v1, :own
        goto :next
        :google
        $lookup {p0}, ${choice.fallback}
        move-result-object v0
        return-object v0
    """, ExternalLabel("own", chooser.getInstruction(0)))
    mutableClassDefBy(plan.signInFailure.definingClass).methods.single { it.same(plan.signInFailure) }
        .addInstructions(0, "invoke-static/range { p1 .. p1 }, $SIGN_IN_FAILURE_HOOK")
}

/**
 * Sends Firebase Cloud Messaging's manifest names to microG-RE: the receive permission Pinterest
 * asks for, the send permission its Firebase receiver demands of a sender, and the receive action
 * that receiver listens for. microG-RE's package joins the first query block, which a manifest
 * without one gets, so Pinterest can see it on Android 11 and later. Everything is checked before
 * the first edit: a manifest with no c2dm name, or one already naming microG-RE, refuses unchanged.
 */
internal fun rerouteManifestToGmsCore(document: Document) {
    val manifest = document.documentElement
    val elements = mutableListOf<Element>()
    fun walk(element: Element) {
        elements += element
        val children = element.childNodes
        for (index in 0 until children.length) (children.item(index) as? Element)?.let(::walk)
    }
    walk(manifest)
    val renamed = elements.flatMap { element ->
        (0 until element.attributes.length).map { element.attributes.item(it) }.filter { it.nodeValue.startsWith(GOOGLE_C2DM) }
    }
    val requested = elements.any { it.tagName == "uses-permission" &&
        it.getAttribute("android:name") == "com.google.android.c2dm.permission.RECEIVE" }
    if (!requested) throw PatchException("$PATCH: AndroidManifest.xml doesn't ask for Firebase Cloud Messaging's receive permission")
    elements.flatMap { element -> (0 until element.attributes.length).map { element.attributes.item(it) } }
        .firstOrNull { it.nodeValue.startsWith(GMS_CORE_C2DM) || (it.nodeName == "android:name" && it.nodeValue == GMS_CORE_PACKAGE) }
        ?.let { throw PatchException("$PATCH: AndroidManifest.xml already names ${it.nodeValue}") }

    renamed.forEach { it.nodeValue = GMS_CORE_C2DM + it.nodeValue.removePrefix(GOOGLE_C2DM) }
    val queries = elements.firstOrNull { it.tagName == "queries" && it.parentNode === manifest }
        ?: document.createElement("queries").also { created ->
            val application = elements.firstOrNull { it.tagName == "application" && it.parentNode === manifest }
            manifest.insertBefore(created, application)
        }
    queries.appendChild(document.createElement("package").apply { setAttribute("android:name", GMS_CORE_PACKAGE) })
}

/** Checks the status flag and every bytecode edit first, so nothing refuses after the manifest changed. */
internal val gmsCorePreflightPatch = bytecodePatch {
    dependsOn(settingsPatch, pinterestExtensionPatch)
    execute {
        requireStatusMethod("gmsCoreSupport")
        requireStatusMethod("signInFailure")
        val readiness = classDefByOrNull(SIGN_IN_READINESS)?.methods?.toList().orEmpty()
        val hook = readiness.singleOrNull {
            it.name == "requestFailed" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(EXCEPTION)
        }
        shape(hook != null && AccessFlags.PUBLIC.isSet(hook.accessFlags) && AccessFlags.STATIC.isSet(hook.accessFlags),
            "the extension has no callable $SIGN_IN_FAILURE_HOOK")
        val provider = readiness.singleOrNull { it.name == "signsInThroughMicroG" && it.returnType == "Z" && it.parameterTypes.isEmpty() }
        shape(provider != null && AccessFlags.PUBLIC.isSet(provider.accessFlags) && AccessFlags.STATIC.isSet(provider.accessFlags),
            "the extension has no callable $CREDENTIAL_PROVIDER_HOOK")
        val option = readiness.singleOrNull {
            it.name == "isGoogleIdOption" && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
        }
        shape(option != null && AccessFlags.PUBLIC.isSet(option.accessFlags) && AccessFlags.STATIC.isSet(option.accessFlags),
            "the extension has no callable $GOOGLE_ID_OPTION_HOOK")
        resolveGmsCore()
    }
}

internal val gmsCoreManifestPatch = resourcePatch {
    dependsOn(gmsCorePreflightPatch)
    execute { document("AndroidManifest.xml").use(::rerouteManifestToGmsCore) }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = PATCH,
    description = "Lets Google sign-in and push notifications go through microG-RE instead of Google Play services. " +
        "Pick it only if microG-RE is on your phone. Without microG-RE, Google sign-in and push notifications stop " +
        "working in the patched app. It brings Spoof signature for Google sign-in along. It isn't selected by default. " +
        "Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch, signatureSpoofManifestPatch, gmsCoreManifestPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        // Found again rather than carried over: patches that ran since may have edited these classes.
        applyGmsCore(resolveGmsCore())
        enableCapability("signInFailure")
        enableStatus("gmsCoreSupport")
    }
}

private fun Method.texts(): List<String?> = implementation?.instructions?.map {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.orEmpty()

private fun Method.same(other: Method) = definingClass == other.definingClass && name == other.name &&
    returnType == other.returnType && parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.typeReference() = ((this as ReferenceInstruction).reference as TypeReference).type

private fun shape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses before any edit")
}
