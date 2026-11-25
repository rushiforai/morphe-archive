package app.gcontacts.patches.microg

import app.gcontacts.patches.shared.Constants.COMPATIBILITY_GCONTACTS
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

/*
 * Signing in through microG, following the GmsCore support patches of ReVanced / Morphe
 * and the Google Maps bundle in apps/bundles/googleapps: microG installs under its own
 * package and authorities, so every Play services name Contacts uses is pointed at
 * microG's, and the manifest names the app microG should vouch for -- stock Contacts'
 * package and signing certificate -- so the account tokens it hands out are the ones
 * Google issues to Contacts.
 *
 * Unlike Maps, Contacts needs none of the location / Cronet / Chimera-module workarounds:
 * it talks to Play services only for accounts, auth tokens, GCM push and Phenotype.
 */

/** The package microG installs as: MicroG-RE and ReVanced GmsCore both use it. */
private const val MICROG_PACKAGE = "app.revanced.android.gms"
private const val STOCK_PACKAGE = "com.google.android.contacts"

/**
 * Google Contacts' signing certificate (SHA-1), which microG reports to Google for this app.
 *
 * The APK carries a v3 signing lineage with two signers: the original `contacts` key
 * (`ee3e2b...`, served to API 24-32) and the rotated `Android` key (served to API 33+).
 * Every device this bundle targets is API 33 or newer, so the rotated certificate is the
 * one the platform reports and therefore the one microG must spoof.
 */
private const val STOCK_CERT_SHA1 = "e4cf62543915c9ec757363c532dbaa74da7af736"

private const val VENDOR = "app.revanced"
private const val C2DM = "$VENDOR.android.c2dm"

/** Play services permissions microG declares under its own names. */
private val PERMISSION_ROUTES = mapOf(
    "com.google.android.c2dm.permission.RECEIVE" to "$C2DM.permission.RECEIVE",
    "com.google.android.c2dm.permission.SEND" to "$C2DM.permission.SEND",
    "com.google.android.providers.gsf.permission.READ_GSERVICES" to
        "$VENDOR.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.android.gms.permission.PHENOTYPE_UPDATE_BROADCAST" to
        "$MICROG_PACKAGE.permission.PHENOTYPE_UPDATE_BROADCAST",
    "com.google.android.gms.auth.api.signin.permission.REVOCATION_NOTIFICATION" to
        "$MICROG_PACKAGE.auth.api.signin.permission.REVOCATION_NOTIFICATION",
)

/** Whole strings in Contacts' code: the account type, Play services' package, its providers. */
private val STRING_ROUTES = PERMISSION_ROUTES + mapOf(
    "com.google" to VENDOR,
    "subscribedfeeds" to "$VENDOR.subscribedfeeds",
    "com.google.android.gms" to MICROG_PACKAGE,
    "com.google.android.gms.auth.accounts" to "$MICROG_PACKAGE.auth.accounts",
    "com.google.android.gms.chimera" to "$MICROG_PACKAGE.chimera",
    "com.google.android.gms.fonts" to "$MICROG_PACKAGE.fonts",
    "com.google.android.gms.phenotype" to "$MICROG_PACKAGE.phenotype",
)

/** Content URIs, by prefix. */
private val URI_ROUTES = listOf(
    "content://com.google.android.gms.phenotype" to "content://$MICROG_PACKAGE.phenotype",
    "content://com.google.android.gsf.gservices" to "content://$VENDOR.android.gsf.gservices",
    "content://com.google.settings" to "content://$VENDOR.settings",
    "content://subscribedfeeds" to "content://$VENDOR.subscribedfeeds",
)

private fun route(value: String): String? {
    STRING_ROUTES[value]?.let { return it }
    for ((from, to) in URI_ROUTES) if (value.startsWith(from)) return to + value.substring(from.length)
    return null
}

private val microgManifestPatch = resourcePatch(
    description = "Points the manifest's Play services permissions at microG and tells microG which app to vouch for.",
) {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            fun all(tag: String) = manifest.getElementsByTagName(tag)
                .let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

            // 1. The Play services permissions: those this app holds, and those guarding
            //    its push and Phenotype receivers.
            var routed = 0
            for (element in all("*")) {
                val attributes = if (element.tagName.startsWith("uses-permission")) listOf("android:name")
                else listOf("android:permission", "android:readPermission", "android:writePermission")
                for (attribute in attributes) {
                    val to = PERMISSION_ROUTES[element.getAttribute(attribute)] ?: continue
                    element.setAttribute(attribute, to)
                    routed++
                }
            }
            // RECEIVE (uses-permission), READ_GSERVICES (uses-permission), SEND, PHENOTYPE_UPDATE_BROADCAST
            // and REVOCATION_NOTIFICATION (guarding receivers) -- five sites on the verified version.
            if (routed < 4) throw PatchException("expected the Play services permissions, found only $routed")

            // 2. Android 11+ package visibility: Contacts must be allowed to see microG.
            val root = manifest.documentElement
            val queries = all("queries").firstOrNull { it.parentNode == root }
                ?: manifest.createElement("queries").also { root.insertBefore(it, root.firstChild) }
            queries.appendChild(
                manifest.createElement("package").apply { setAttribute("android:name", MICROG_PACKAGE) },
            )

            // 3. Whom microG vouches for: stock Contacts' package and certificate.
            val application = all("application").single()
            fun meta(name: String, value: String) = application.appendChild(
                manifest.createElement("meta-data").apply {
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

/**
 * Lets a re-signed Google Contacts sign in to a Google account through microG.
 */
@Suppress("unused")
val microgSupportPatch = bytecodePatch(
    name = "Add microG support",
    description = "Lets Google Contacts sign in to your Google account through microG instead of Play services, " +
        "so contacts sync, Phenotype and push work on a de-Googled phone. Every Play services name the app uses " +
        "is pointed at microG's, and microG is told to vouch for stock Contacts. Needs microG installed: " +
        "MicroG-RE or ReVanced GmsCore. Not for root (mount) installs.",
    default = true,
) {
    compatibleWith(*COMPATIBILITY_GCONTACTS)

    // A mount install keeps stock Contacts' manifest, so microG never learns whom to vouch for.
    availability(
        AvailabilityResolver { installer, _ ->
            if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED
        },
    )

    dependsOn(microgManifestPatch)

    // Every Play services name in Contacts' code: the account type, the package, its
    // providers, permissions and content URIs. In finalize, after every other patch has
    // run, so code they add is covered too.
    finalize {
        val holders = mutableListOf<String>()
        classDefForEach { classDef ->
            val routes = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                        route(((insn as ReferenceInstruction).reference as StringReference).string) != null
                } == true
            }
            if (routes) holders += classDef.type
        }

        var rewritten = 0
        for (type in holders) {
            for (method in mutableClassDefBy(type).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                instructions.forEachIndexed { index, insn ->
                    if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                    val to = route(((insn as ReferenceInstruction).reference as StringReference).string) ?: return@forEachIndexed
                    val register = (insn as OneRegisterInstruction).registerA
                    val opcode = if (insn.opcode == Opcode.CONST_STRING) "const-string" else "const-string/jumbo"
                    method.replaceInstruction(index, "$opcode v$register, \"$to\"")
                    rewritten++
                }
            }
        }
        // Measured on 4.90.16: 147 sites -- 67 account type, 64 package, 3 content URIs,
        // and the rest across chimera/phenotype/fonts/auth and the named permissions.
        if (rewritten < 130) throw PatchException("rewrote only $rewritten Play services names; Contacts changed shape")
    }
}
