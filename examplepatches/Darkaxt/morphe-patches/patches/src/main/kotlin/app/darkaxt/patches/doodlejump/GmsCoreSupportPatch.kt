/*
 * Adapted from JoFSlash/morphe-patches (GPLv3):
 * patches/src/main/kotlin/app/jofslash/patches/imdb/gms/GmsCoreSupportPatch.kt
 * which follows MorpheApp/morphe-patches' shared GmsCoreSupportPatch.
 */
package app.darkaxt.patches.doodlejump

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_DOODLE_JUMP
import app.darkaxt.patches.shared.gms.GmsCoreLists.ACTIONS
import app.darkaxt.patches.shared.gms.GmsCoreLists.AUTHORITIES
import app.darkaxt.patches.shared.gms.GmsCoreLists.PERMISSIONS
import app.darkaxt.patches.shared.gms.replaceStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import java.util.logging.Logger

/** Package prefix of MicroG-RE, the GmsCore build Morphe and ReVanced use. */
private const val VENDOR = "app.revanced"
private const val GMS_CORE_PACKAGE = "$VENDOR.android.gms"

private const val DOODLE_JUMP_PACKAGE = "com.lima.doodlejump"

/**
 * SHA-1 of Lima Sky's original signing certificate
 * (CN=Marko Pusenjak, OU=Lima Sky LLC; APKMirror, SHA-256 80a2d30e...893711824).
 * Google's Play Games / Sign-In clients for the game are registered to it.
 */
private const val DOODLE_JUMP_SIGNATURE = "1d34a1c90ea703ae0e43ca3fb6f102d5b3f6fcbb"

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
            // MicroG-RE answers Google with the original package and certificate.
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_NAME", DOODLE_JUMP_PACKAGE)
            metaData("$GMS_CORE_PACKAGE.SPOOFED_PACKAGE_SIGNATURE", DOODLE_JUMP_SIGNATURE)
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
    description = "Routes Google Play Games and Google sign-in through MicroG-RE (app.revanced.android.gms) " +
        "instead of Google Play services, which rejects the re-signed game. Needs MicroG-RE installed " +
        "with your Google account added to it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOODLE_JUMP)
    dependsOn(gmsCoreSupportResourcePatch)

    execute {
        val changed = replaceStrings(::gmsCoreString)
        Logger.getLogger("GmsCoreSupport").info("Moved $changed Play services strings to MicroG-RE")

        GooglePlayServicesAvailableFingerprint.method.returnEarly(0)
    }
}
