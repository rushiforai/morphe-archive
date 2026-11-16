package app.danielthemaniel.patches.pokegenie

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

// -------------------------------------------------------------------------------------
// MicroG-RE (MorpheApp/MicroG-RE, pkg app.revanced.android.gms) support — Google sign-in.
//
// Poke Genie v8.19.3 signs in through Firebase Auth. SignInActivity first tries the Android
// Credential Manager ("Sign in with Google"), which demands a SYSTEM credential provider —
// a user-installed microG can never serve it on a non-rooted device with real Play Services.
// But SignInActivity also ships a legacy path, launchGoogleWebFallback() (used when remote
// config google_sign_in_mode == 2): the old com.google.android.gms.auth.api.signin flow,
// which binds via GmsClient.
//
// This patch:
//   1. Rewrites GMS package / action / authority / permission / capability strings
//      "com.google[...]" -> "app.revanced[...]" app-wide, using Morphe's own GmsCore-support
//      string tables. MicroG-RE renames Google's action strings to app.revanced.*, so the
//      legacy sign-in bind (com.google.android.gms.auth.api.signin.service.START) must be
//      rewritten to app.revanced.android.gms.auth.api.signin.service.START or microG answers
//      "service not found". Adds the signature-verifier / availability bypasses and the
//      SPOOFED_PACKAGE_SIGNATURE metadata so microG reports Poke Genie's ORIGINAL cert.
//   2. Pins performGoogleSignIn() to the legacy path, bypassing Credential Manager. microG
//      serves the legacy flow, spoofs the cert, and the ID token feeds the app's existing
//      signInWithCredential -> Firebase path (Firebase validates the project audience from the
//      public APK config, not the app signature).
//
// Credit: string tables adapted from Morphe's GmsCoreSupportPatch (via hoo-dles/morphe-patches).
//
// REQUIRES: MicroG-RE (app.revanced.android.gms) installed, your Google account added INSIDE
// it, and device registration/checkin enabled there.
// -------------------------------------------------------------------------------------

private const val VENDOR         = "app.revanced"
private const val MICROG_PACKAGE = "app.revanced.android.gms"
private const val STOCK_PACKAGE  = "com.cjin.pokegenie.standard"
private const val STOCK_CERT_SHA1 = "1cf64f6952e7b27f05f4856715c9e3869b87dab3"

private const val SIGNATURE_VERIFIER = "Lcom/google/android/gms/common/GoogleSignatureVerifier;"
private const val AVAILABILITY_LIGHT = "Lcom/google/android/gms/common/GoogleApiAvailabilityLight;"
private const val SIGN_IN_ACTIVITY   = "Lcom/canjin/pokegenie/signIn/SignInActivity;"

// GMS strings that MicroG-RE answers under the app.revanced.* vendor prefix. Adapted from
// Morphe's GmsCore-support Constants (hoo-dles/morphe-patches).
private val GMS_CAPABILITIES = setOf(
    "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL",
)

private val GMS_PERMISSIONS = setOf(
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

private val GMS_ACTIONS = setOf(
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

private val GMS_AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.settings",
)

private val gmsCoreManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_POKEGENIE)
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement

            val queries = (0 until root.childNodes.length)
                .mapNotNull { root.childNodes.item(it) as? Element }
                .firstOrNull { it.tagName == "queries" }
                ?: document.createElement("queries").also { root.insertBefore(it, root.firstChild) }
            queries.appendChild(document.createElement("package").apply {
                setAttribute("android:name", MICROG_PACKAGE)
            })

            val application = document.getElementsByTagName("application").item(0) as Element
            fun meta(name: String, value: String) = application.appendChild(
                document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                },
            )
            meta("$MICROG_PACKAGE.SPOOFED_PACKAGE_NAME", STOCK_PACKAGE)
            meta("$MICROG_PACKAGE.SPOOFED_PACKAGE_SIGNATURE", STOCK_CERT_SHA1)
            meta("$VENDOR.MICROG_PACKAGE_NAME", MICROG_PACKAGE)
            meta("$MICROG_PACKAGE.MICROG_PACKAGE_NAME", MICROG_PACKAGE)
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "microG-RE support (Google sign-in)",
    description = "Routes Google Play Services to MicroG-RE (app.revanced.android.gms) and pins " +
        "Poke Genie's legacy sign-in path so Google sign-in works on the re-signed app. Install " +
        "MicroG-RE, add your account there. Minimal: no push/FCM.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKEGENIE)
    dependsOn(gmsCoreManifestPatch)

    execute {
        // 1. Rewrite GMS package / action / authority / permission / capability strings to the
        //    app.revanced.* vendor so binds resolve to MicroG-RE. commonTransform mirrors
        //    Morphe's GmsCore-support patch; contentUrisTransform handles content:// authorities.
        fun commonTransform(s: String): String? = when (s) {
            "com.google",
            "com.google.android.gms",
            in GMS_PERMISSIONS,
            in GMS_ACTIONS,
            in GMS_AUTHORITIES,
            in GMS_CAPABILITIES,
            -> s.replace("com.google", VENDOR)
            "subscribedfeeds" -> "$VENDOR.subscribedfeeds"
            else -> null
        }

        fun contentUrisTransform(s: String): String? {
            if (!s.startsWith("content://")) return null
            for (authority in GMS_AUTHORITIES) {
                val prefix = "content://$authority"
                if (s.startsWith(prefix)) {
                    return s.replace(prefix, "content://${authority.replace("com.google", VENDOR)}")
                }
            }
            val subFeeds = "content://subscribedfeeds"
            if (s.startsWith(subFeeds)) return s.replace(subFeeds, "content://$VENDOR.subscribedfeeds")
            return null
        }

        classDefForEach { classDef ->
            // CRITICAL: never rewrite our own restore data — PairipData* holds the 1,471 PairIP
            // string-table values as const-strings; rewriting one would corrupt a virtualized
            // method at runtime. Skip PairIP runtime too.
            val type = classDef.type
            if (type.startsWith("Lapp/danielthemaniel/") || type.startsWith("Lcom/pairip/")) {
                return@classDefForEach
            }

            // Materialize the mutable class only if a method actually needs editing.
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach classLoop@{ method ->
                val implementation = method.implementation ?: return@classLoop
                implementation.instructions.forEachIndexed { index, instruction ->
                    val string = ((instruction as? Instruction21c)?.reference as? StringReference)?.string
                        ?: return@forEachIndexed
                    val to = commonTransform(string) ?: contentUrisTransform(string)
                        ?: return@forEachIndexed

                    // No findMutableMethodOf in this patcher version; map the immutable method to
                    // its mutable twin by signature. The proxy is 1:1, so CONST_STRING indices
                    // line up and replacing in place keeps them stable.
                    val params = method.parameterTypes.map { it.toString() }
                    val mutableMethod = mutableClass.methods.first {
                        it.name == method.name &&
                            it.parameterTypes.map { p -> p.toString() } == params
                    }
                    mutableMethod.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            (instruction as Instruction21c).registerA,
                            ImmutableStringReference(to),
                        ),
                    )
                }
            }
        }

        // 2. Accept MicroG-RE as if it were Google-signed.
        mutableClassDefBy(SIGNATURE_VERIFIER).methods
            .filter {
                it.returnType == "Z" && it.name in setOf(
                    "isGooglePublicSignedPackage", "isPackageGoogleSigned", "isUidGoogleSigned",
                )
            }
            .forEach { it.addInstructions(0, "const/4 v0, 0x1\nreturn v0") }

        // 3. Report Play Services available (SUCCESS == 0).
        mutableClassDefBy(AVAILABILITY_LIGHT).methods
            .filter {
                it.name == "isGooglePlayServicesAvailable" && it.returnType == "I" &&
                    it.parameterTypes.firstOrNull() == "Landroid/content/Context;"
            }
            .forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }

        // 4. Force the legacy GoogleSignIn path (SignInActivity "web fallback", mode 2) instead
        //    of Credential Manager, which routes "Sign in with Google" to a SYSTEM provider only.
        //    launchGoogleWebFallback is private in the DEX (R8), so it must be invoke-direct —
        //    invoke-virtual on a private method is a VerifyError that rejects the whole class.
        //    googleSignInLauncher is registered unconditionally in onCreate, so this is safe.
        mutableClassDefBy(SIGN_IN_ACTIVITY).methods
            .first { it.name == "performGoogleSignIn" && it.parameterTypes.isEmpty() }
            .addInstructions(
                0,
                "invoke-direct { p0 }, $SIGN_IN_ACTIVITY->launchGoogleWebFallback()V\n" +
                    "return-void",
            )
    }
}
