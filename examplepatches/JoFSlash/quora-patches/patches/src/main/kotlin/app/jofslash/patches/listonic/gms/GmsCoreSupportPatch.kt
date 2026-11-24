package app.jofslash.patches.listonic.gms

import app.jofslash.patches.listonic.gms.GmsCoreLists.ACTIONS
import app.jofslash.patches.listonic.gms.GmsCoreLists.AUTHORITIES
import app.jofslash.patches.listonic.gms.GmsCoreLists.PERMISSIONS
import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.Constants.PACKAGE_NAME
import app.jofslash.patches.listonic.shared.Constants.SIGNATURE
import app.jofslash.patches.listonic.shared.methodOf
import app.jofslash.patches.listonic.shared.replaceStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element
import java.util.logging.Logger

/** Package prefix of MicroG-RE, the GmsCore build Morphe and ReVanced use. */
private const val VENDOR = "app.revanced"
private const val GMS_CORE_PACKAGE = "$VENDOR.android.gms"

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/listonic/GmsCoreCheck;"
private const val APPLICATION = "Lcom/l/ListonicApplication;"

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
            "without it, the lists work without an account or with an email sign-in, and the app says once " +
            "that MicroG-RE is missing.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    extendWith("extensions/listonic.mpe")
    dependsOn(gmsCoreSupportResourcePatch)

    execute {
        val changed = replaceStrings(::gmsCoreString)
        Logger.getLogger("GmsCoreSupport").info("Moved $changed Play services strings to MicroG-RE")

        GooglePlayServicesAvailableFingerprint.method.returnEarly(0)

        // Listonic signs in with Google through the classic GoogleSignInClient, which MicroG-RE
        // serves with the spoofed package and signature above.

        // Say once when MicroG-RE is missing.
        methodOf(APPLICATION, "onCreate", emptyList()).addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->check(Landroid/content/Context;)V"
        )
    }
}
