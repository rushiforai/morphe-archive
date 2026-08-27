package morningentree.morphe.patches.all.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import morningentree.morphe.patches.all.detection.signature.pms.encodeCertificatePatch
import morningentree.morphe.patches.all.detection.signature.pms.signature
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.security.MessageDigest
import java.util.Base64
import java.util.logging.Logger

private const val DEFAULT_GMS_CORE_VENDOR = "app.revanced.android.gms"

private const val EXTENSION_CLASS =
    "Lmorningentree/morphe/extension/all/misc/gms/GmsCoreSupportPatch;"

private val log = Logger.getLogger("GmsCoreSupport")

private fun String.escapeSmali() = replace("\\", "\\\\").replace("\"", "\\\"")

private val GmsCoreSupportFingerprint = Fingerprint(
    custom = { method: Method, classDef: ClassDef ->
        classDef.type == EXTENSION_CLASS && method.name == "getGmsCoreVendorGroupId"
    },
)

private val OriginalPackageNameFingerprint = Fingerprint(
    custom = { method: Method, classDef: ClassDef ->
        classDef.type == EXTENSION_CLASS && method.name == "getOriginalPackageName"
    },
)

private var activityClassSuffix: String? = null

private val ActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    custom = { method: Method, classDef: ClassDef ->
        method.name == "onCreate" &&
            (activityClassSuffix?.let { classDef.type.endsWith(it) }
                ?: (classDef.superclass?.endsWith("Activity;") == true))
    },
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
    "com.google.android.gms.ads.identifier.service.EVENT_ATTESTATION",
    "com.google.android.gms.analytics.service.START",
    "com.google.android.gms.auth.account.authapi.START",
    "com.google.android.gms.auth.account.authenticator.auto.service.START",
    "com.google.android.gms.auth.account.authenticator.tv.service.START",
    "com.google.android.gms.auth.account.data.service.START",
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
    "com.google.android.gms.auth.service.START",
    "com.google.android.gms.checkin.BIND_TO_SERVICE",
    "com.google.android.gms.clearcut.service.START",
    "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
    "com.google.android.gms.common.download.START",
    "com.google.android.gms.common.service.START",
    "com.google.android.gms.config.START",
    "com.google.android.gms.drive.ApiService.START",
    "com.google.android.gms.droidguard.service.START",
    "com.google.android.gms.fido.fido2.privileged.START",
    "com.google.android.gms.fido.fido2.regular.START",
    "com.google.android.gms.fonts.service.START",
    "com.google.android.gms.games.service.START",
    "com.google.android.gms.gass.START",
    "com.google.android.gms.googlehelp.HELP",
    "com.google.android.gms.googlehelp.service.GoogleHelpService.START",
    "com.google.android.gms.identity.service.BIND",
    "com.google.android.gms.instantapps.START",
    "com.google.android.gms.location.reporting.service.START",
    "com.google.android.gms.locationsharing.api.START",
    "com.google.android.gms.measurement.START",
    "com.google.android.gms.nearby.connection.service.START",
    "com.google.android.gms.nearby.messages.service.NearbyMessagesService.START",
    "com.google.android.gms.notifications.service.START",
    "com.google.android.gms.people.service.START",
    "com.google.android.gms.phenotype.service.START",
    "com.google.android.gms.safetynet.service.START",
    "com.google.android.gms.signin.service.START",
    "com.google.android.gms.tapandpay.service.BIND",
    "com.google.android.gms.update.START_API_SERVICE",
    "com.google.android.gms.update.START_SERVICE",
    "com.google.android.gms.wallet.service.BIND",
    "com.google.android.gms.wearable.BIND",
    "com.google.android.gms.wearable.DATA_CHANGED",
    "com.google.android.gsf.action.GET_GLS",
    "com.google.firebase.auth.api.gms.service.START",
    "com.google.firebase.dynamiclinks.service.START",
    "com.google.iid.TOKEN_REQUEST",
)

private val GMS_AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.settings",
)

@Suppress("unused")
val gmsCorePatch = bytecodePatch(
    name = "GmsCore support (MicroG)",
    description = """
        Routes Google Play Services calls through MicroG instead of real GPS.

        Works for: Google apps (YouTube, Maps, News, Photos) and third-party apps using classic Google Sign-In (Android 13 and below).

        Does not work for: Android 14+ Credential Manager sign-in (most modern third-party apps), Play Integrity / SafetyNet checks, or apps with custom auth.

        Requires MicroG RE installed. Apply with the original app certificate patch.
    """.trimIndent(),
    default = false,
) {
    extendWith("extensions/all/misc/gms.mpe")

    val gmsCoreVendorOption by stringOption(
        key = "gmsCoreVendor",
        default = DEFAULT_GMS_CORE_VENDOR,
        values = mapOf(
            "app.revanced.android.gms (default)" to "app.revanced.android.gms",
            "app.morphe.android.gms" to "app.morphe.android.gms",
            "app.morphe.manager" to "app.morphe.manager",
            "app.revanced.manager" to "app.revanced.manager",
            "app.rvx.manager" to "app.rvx.manager",
            "com.google.android.gms" to "com.google.android.gms",
            "org.microg.gms" to "org.microg.gms",
        ),
        title = "MicroG package name",
        description = "Which MicroG / GmsCore app is installed on your device. " +
            "Check your device's app list for \"MicroG\" or \"GmsCore\" if unsure — " +
            "most users should leave this as the default.",
        required = true,
    )

    val mainActivityName by stringOption(
        key = "mainActivityName",
        default = null,
        title = "Main activity class (optional)",
        description = "The app's main Activity class name ending with a semicolon, e.g. /MainActivity; " +
            "Used to inject the MicroG check at startup. Leave blank for auto-detection.",
        required = false,
    ) { it == null || it.endsWith(";") }

    val customPackageName by stringOption(
        key = "packageName",
        default = null,
        title = "Custom package name (optional)",
        description = "Rename the app to this package name. Leave blank to keep the original. " +
            "Must be a valid package name (e.g. com.example.myapp).",
        required = false,
    ) { it == null || it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")) }

    val spoofedPackageSignature by stringOption(
        key = "spoofedPackageSignature",
        default = null,
        title = "Spoofed signing certificate SHA-256 (optional)",
        description = "Overrides the auto-computed SHA-256 written to SPOOFED_PACKAGE_SIGNATURE. " +
            "Leave blank to derive it from the original app's certificate automatically.",
        required = false,
    ) { it == null || it.isBlank() || it.matches(Regex("^[0-9A-Fa-f]{64}$")) }

    lateinit var originalPackageName: String

    dependsOn(
        encodeCertificatePatch,
        resourcePatch {
            execute {
                originalPackageName = document("AndroidManifest.xml").use { doc ->
                    (doc.getElementsByTagName("manifest").item(0) as Element).getAttribute("package")
                }

                val vendor = gmsCoreVendorOption ?: DEFAULT_GMS_CORE_VENDOR
                val resolvedPackageName = customPackageName?.takeIf { it.isNotBlank() } ?: originalPackageName

                val computedSig = signature?.let { b64 ->
                    runCatching {
                        val der = Base64.getDecoder().decode(b64)
                        MessageDigest.getInstance("SHA-256").digest(der)
                            .joinToString("") { "%02x".format(it) }
                    }.getOrNull()
                }
                val sig = spoofedPackageSignature?.takeIf { it.isNotBlank() } ?: computedSig

                document("AndroidManifest.xml").use { doc ->
                    val manifestNode = doc.getElementsByTagName("manifest").item(0)
                    val applicationNode = doc.getElementsByTagName("application").item(0)

                    val existingPerms = doc.getElementsByTagName("uses-permission")
                    val permAdded = (0 until existingPerms.length).any { i ->
                        existingPerms.item(i).attributes
                            ?.getNamedItem("android:name")
                            ?.nodeValue == "org.microg.gms.permission.FAKE_PACKAGE_SIGNATURE"
                    }
                    if (!permAdded) {
                        val perm = doc.createElement("uses-permission")
                        perm.setAttribute("android:name", "org.microg.gms.permission.FAKE_PACKAGE_SIGNATURE")
                        manifestNode.appendChild(perm)
                    }

                    fun Node.upsertMeta(name: String, value: String) {
                        val existing = (0 until childNodes.length)
                            .map { childNodes.item(it) }
                            .firstOrNull { node ->
                                node.nodeName == "meta-data" &&
                                    node.attributes?.getNamedItem("android:name")?.nodeValue == name
                            } as? Element
                        if (existing != null) {
                            existing.setAttribute("android:value", value)
                            return
                        }
                        val meta = (ownerDocument ?: doc).createElement("meta-data") as Element
                        meta.setAttribute("android:name", name)
                        meta.setAttribute("android:value", value)
                        appendChild(meta)
                    }

                    applicationNode.upsertMeta("$vendor.SPOOFED_PACKAGE_NAME", originalPackageName)
                    if (sig != null) applicationNode.upsertMeta("$vendor.SPOOFED_PACKAGE_SIGNATURE", sig)
                    applicationNode.upsertMeta("$vendor.MICROG_PACKAGE_NAME", vendor)
                }

                val manifestFile = get("AndroidManifest.xml")
                var text = manifestFile.readText()
                if ("</queries>" in text && vendor !in text) {
                    text = text.replace("</queries>", "<package android:name=\"$vendor\"/></queries>")
                }
                if (!vendor.contains("microg") && !vendor.startsWith("com.google")) {
                    text = text.replace("com.google.android.c2dm", "${vendor.substringBeforeLast(".")}.c2dm")
                }
                text = text.replace("android:authorities=\"$originalPackageName", "android:authorities=\"$resolvedPackageName")
                text = text.replace("$originalPackageName.permission.C2D_MESSAGE", "$resolvedPackageName.permission.C2D_MESSAGE")
                text = text.replace(
                    "$originalPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
                    "$resolvedPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
                )
                manifestFile.writeText(text)
            }
        },
    )

    execute {
        val vendor = gmsCoreVendorOption ?: DEFAULT_GMS_CORE_VENDOR
        val vendorGroup = when {
            vendor.endsWith(".android.gms") -> vendor.removeSuffix(".android.gms")
            vendor.endsWith(".manager") -> vendor.removeSuffix(".manager")
            else -> vendor
        }

        val rewriteStrings = buildMap {
            put("com.google", vendorGroup)
            put("com.google.android.gms", vendor)
            put("subscribedfeeds", "$vendorGroup.subscribedfeeds")
            (GMS_PERMISSIONS + GMS_ACTIONS + GMS_AUTHORITIES).forEach { s ->
                put(s, s.replace("com.google", vendorGroup))
            }
        }

        fun transform(str: String): String? {
            rewriteStrings[str]?.let { return it }
            if (str.startsWith("content://")) {
                GMS_AUTHORITIES.forEach { auth ->
                    if (str.startsWith("content://$auth")) {
                        return str.replace("content://$auth", "content://${auth.replace("com.google", vendorGroup)}")
                    }
                }
                if (str.startsWith("content://subscribedfeeds")) {
                    return str.replace("content://subscribedfeeds", "content://$vendorGroup.subscribedfeeds")
                }
            }
            return null
        }

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                val instructions = method.instructionsOrNull?.toList() ?: continue
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) return@forEachIndexed
                    val stringRef = (instruction as? ReferenceInstruction)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val transformed = transform(stringRef.string) ?: return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        index,
                        "const-string v$register, \"${transformed.escapeSmali()}\"",
                    )
                }
            }
        }

        activityClassSuffix = mainActivityName

        ServiceCheckFingerprint.methodOrNull?.addInstruction(0, "return-void")

        GooglePlayUtilityFingerprint.methodOrNull?.let { method ->
            method.addInstruction(0, "return v0")
            method.addInstruction(0, "const/4 v0, 0x0")
        }

        GmsCoreSupportFingerprint.methodOrNull?.apply {
            addInstruction(0, "return-object v0")
            addInstruction(0, "const-string v0, \"$vendorGroup\"")
        } ?: log.warning("GmsCore extension: getGmsCoreVendorGroupId() NOT FOUND — extension may not be merged.")

        OriginalPackageNameFingerprint.methodOrNull?.apply {
            addInstruction(0, "return-object v0")
            addInstruction(0, "const-string v0, \"$originalPackageName\"")
        } ?: log.warning("GmsCore extension: getOriginalPackageName() NOT FOUND — extension may not be merged.")

        ActivityOnCreateFingerprint.methodOrNull?.let { onCreate ->
            onCreate.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->checkGmsCore(Landroid/content/Context;)V",
            )
        } ?: log.info("GmsCore extension: Activity.onCreate() NOT FOUND — checkGmsCore() not injected.")
    }
}
