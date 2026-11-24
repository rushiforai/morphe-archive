package app.jofslash.patches.kaloricketabulky.gms

import app.jofslash.patches.kaloricketabulky.gms.GmsCoreLists.ACTIONS
import app.jofslash.patches.kaloricketabulky.gms.GmsCoreLists.AUTHORITIES
import app.jofslash.patches.kaloricketabulky.gms.GmsCoreLists.PERMISSIONS
import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.Constants.PACKAGE_NAME
import app.jofslash.patches.kaloricketabulky.shared.Constants.SIGNATURE
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.methodsWhere
import app.jofslash.patches.kaloricketabulky.shared.replaceStrings
import app.jofslash.patches.kaloricketabulky.shared.returnBoolean
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element
import java.util.logging.Logger

/** Package prefix of MicroG-RE, the GmsCore build Morphe and ReVanced use. */
private const val VENDOR = "app.revanced"
private const val GMS_CORE_PACKAGE = "$VENDOR.android.gms"

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/kaloricketabulky/GmsCoreCheck;"

/** Reads the result of a Play services credential request in androidx.credentials. */
private const val RESPONSE_UTILS = "Landroidx/credentials/playservices/controllers/ResponseUtils\$Companion;"

/** Android's own Credential Manager, as androidx.credentials uses it on Android 14 and newer. */
private const val FRAMEWORK_CREDENTIAL_PROVIDER = "Landroidx/credentials/CredentialProviderFrameworkImpl;"

// GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int), obfuscated. It checks that
// Play services is installed and signed by Google; MicroG-RE has its own signature.
internal object GooglePlayServicesAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf(
        "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.",
    ),
)

/**
 * The credential type of a Google ID token in Credential Manager. MicroG-RE names it after its own
 * package prefix, both in the requests it accepts and in the credentials it returns.
 */
private const val GOOGLE_ID_TOKEN_CREDENTIAL = "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"

/** Maps a Google Play services string to its MicroG-RE counterpart, or null to keep it. */
private fun gmsCoreString(value: String): String? {
    if (value == "com.google") return VENDOR
    if (value == GOOGLE_ID_TOKEN_CREDENTIAL) return value.replace("com.google", VENDOR)
    if (value == "com.google.android.gms") return GMS_CORE_PACKAGE
    if (value in PERMISSIONS || value in ACTIONS || value in AUTHORITIES) {
        return value.replace("com.google", VENDOR)
    }
    if (value.startsWith("content://")) {
        AUTHORITIES.firstOrNull { value.startsWith("content://$it") }?.let {
            return value.replace("content://$it", "content://" + it.replace("com.google", VENDOR))
        }
    }
    return null
}

private val gmsCoreSupportResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            // Push messages and permissions come from MicroG-RE instead of Play services.
            val all = document.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as Element
                val attributes = element.attributes
                for (j in 0 until attributes.length) {
                    val attribute = attributes.item(j)
                    val value = attribute.nodeValue
                    when {
                        value.contains("com.google.android.c2dm") ->
                            attribute.nodeValue = value.replace("com.google.android.c2dm", "$VENDOR.android.c2dm")
                        value in PERMISSIONS ->
                            attribute.nodeValue = value.replace("com.google", VENDOR)
                    }
                }
            }

            val application = document.getElementsByTagName("application").item(0) as Element
            fun metaData(name: String, value: String) = application.appendChild(
                document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                }
            )
            // MicroG-RE answers Google with the original package and certificate, which is
            // what the app's Google sign-in client is registered for.
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_NAME", PACKAGE_NAME)
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_SIGNATURE", SIGNATURE)
            metaData("app.revanced.MICROG_PACKAGE_NAME", GMS_CORE_PACKAGE)

            // Android 11+ only lets the app see MicroG-RE when it is listed in <queries>.
            val manifest = document.documentElement
            val queries = document.getElementsByTagName("queries").item(0) as Element?
                ?: document.createElement("queries").also { manifest.insertBefore(it, application) }
            queries.appendChild(
                document.createElement("package").apply { setAttribute("android:name", GMS_CORE_PACKAGE) }
            )
        }
    }
}

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Makes signing in with Google and push notifications work through MicroG-RE instead of Google " +
            "Play services. A patched app can't sign in with Google through Play services, because it is no " +
            "longer signed by its maker. Needs MicroG-RE installed, with your Google account added to it; " +
            "without it, signing in with email still works, and the app says once that MicroG-RE is missing.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    extendWith("extensions/kaloricketabulky.mpe")
    dependsOn(gmsCoreSupportResourcePatch)

    execute {
        val changed = replaceStrings(::gmsCoreString)
        Logger.getLogger("GmsCoreSupport").info("Moved $changed Play services strings to MicroG-RE")

        GooglePlayServicesAvailableFingerprint.method.returnEarly(0)

        // "Sign in with Google" goes through androidx.credentials. On Android 14 and newer it would
        // ask Android's own Credential Manager, which hands the request to Google Play services with
        // the app's real (patched) signature, and Google turns it down. Without the framework
        // provider, androidx.credentials uses its Play services provider, which binds to MicroG-RE
        // through the strings above, as on Android 13 and older.
        methodOf(FRAMEWORK_CREDENTIAL_PROVIDER, "isAvailableOnDevice").returnBoolean(false)

        // MicroG-RE returns the credential (or the error) as a Bundle, the form Play services uses
        // before Android 14. On Android 14 and newer androidx.credentials reads Android's own
        // GetCredentialResponse there instead, finds none and reports a failed sign-in. Read the
        // result as on Android 13: replace its Build.VERSION.SDK_INT checks with 33.
        methodsWhere(RESPONSE_UTILS, "the result handler (int, int, Intent, ...)") { method ->
            "Landroid/content/Intent;" in method.parameterTypes.map { it.toString() }
        }.forEach { method ->
            val reads = method.implementation!!.instructions.withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.SGET &&
                    ((insn as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == "Landroid/os/Build\$VERSION;" && it.name == "SDK_INT"
                    }
            }
            if (reads.isEmpty()) throw PatchException("$RESPONSE_UTILS->${method.name} doesn't read SDK_INT")
            reads.forEach { (index, insn) ->
                method.replaceInstruction(index, "const/16 v${(insn as OneRegisterInstruction).registerA}, 0x21")
            }
        }

        // Say once when MicroG-RE is missing. App.onCreate only calls the SafeDK-renamed original.
        methodOf("$APP/App;", "onCreate", emptyList()).addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->check(Landroid/content/Context;)V"
        )
    }
}
