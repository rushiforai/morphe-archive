package app.jofslash.patches.youtubekids.gms

import app.jofslash.patches.youtubekids.gms.GmsCoreLists.ACTIONS
import app.jofslash.patches.youtubekids.gms.GmsCoreLists.AUTHORITIES
import app.jofslash.patches.youtubekids.gms.GmsCoreLists.PERMISSIONS
import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.jofslash.patches.youtubekids.shared.Constants.PACKAGE_NAME
import app.jofslash.patches.youtubekids.shared.Constants.SIGNATURE
import app.jofslash.patches.youtubekids.shared.replaceStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import java.util.logging.Logger

/** Package prefix of MicroG-RE, the GmsCore build Morphe and ReVanced use. */
private const val VENDOR = "app.revanced"
private const val GMS_CORE_PACKAGE = "$VENDOR.android.gms"

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/youtubekids/GmsCoreCheck;"

// GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int), obfuscated. It checks that
// Play services is installed and signed by Google; MicroG-RE has its own signature.
internal object GooglePlayServicesAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    filters = listOf(
        string("MetadataValueReader"),
        string("This should never happen."),
        string("com.google.android.gms"),
    ),
)

// GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context, int): throws when the check above fails.
internal object EnsurePlayServicesAvailableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

// The launcher activity; the Application's onCreate is in an obfuscated superclass.
internal object SplashScreenOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/kids/splash/SplashScreenActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Maps a Google Play services string to its MicroG-RE counterpart, or null to keep it. */
private fun gmsCoreString(value: String): String? {
    if (value == "com.google") return VENDOR
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
            // MicroG-RE answers Google with the original package and certificate, so
            // DroidGuard and the player see the app YouTube registered.
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
    description = "Makes videos play through MicroG-RE instead of Google Play services. A patched app " +
            "can't use Play services, because it is no longer signed by Google, and Play services stops " +
            "the player. Needs MicroG-RE (app.revanced.android.gms) installed; without it the app " +
            "says once that MicroG-RE is missing.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    extendWith("extensions/youtubekids.mpe")
    dependsOn(gmsCoreSupportResourcePatch)

    execute {
        // Before the strings move: the fingerprint looks for "com.google.android.gms".
        GooglePlayServicesAvailableFingerprint.method.returnEarly(0)
        EnsurePlayServicesAvailableFingerprint.method.returnEarly()

        val changed = replaceStrings(::gmsCoreString)
        Logger.getLogger("GmsCoreSupport").info("Moved $changed Play services strings to MicroG-RE")

        // Tell the user when MicroG-RE is missing.
        SplashScreenOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->check(Landroid/content/Context;)V"
        )
    }
}
