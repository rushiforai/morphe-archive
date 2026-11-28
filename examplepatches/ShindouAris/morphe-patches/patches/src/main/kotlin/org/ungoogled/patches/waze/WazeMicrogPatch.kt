package org.ungoogled.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.ungoogled.patches.maps.microg.MicrogSelection
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_WAZE
import org.ungoogled.patches.shared.MicrogRe
import org.w3c.dom.Element

/*
 * Signing in to Waze through microG. Same approach as the Maps patches: microG-RE installs under its own package,
 * authorities and permissions, so every Play services name in Waze (all of it in the Google Sign-In, Firebase push
 * and Play services client libraries it bundles) is pointed at microG-RE's, and the manifest names the app microG
 * should vouch for: stock Waze's package and signing certificate. Waze keeps its own package name here, unlike
 * microG Maps, which has to live beside stock Maps.
 */

private const val STOCK_PACKAGE = "com.waze"
/** Waze's signing certificate (SHA-1), which microG-RE reports to Google for this app. */
private const val STOCK_CERT_SHA1 = "35b438fe1bc69d975dc8702dc16ab69ebf65f26f"
private const val FAKE_PACKAGE_SIGNATURE = "android.permission.FAKE_PACKAGE_SIGNATURE"
/** The Play services version Waze's client asks for in place of its own (26.12): 12.0, which microG-RE exceeds. */
private const val MIN_PLAY_SERVICES_VERSION = 12000000

/** Anchor for getResourceAsStream: the patches file's class loader finds waze/ through any of its classes. */
private object WazeMicrogResource

/** The push actions Waze's Firebase messaging client uses: without microG-RE's names it gets no token, no messages. */
private val PUSH_ACTIONS_USED = listOf(
    "com.google.android.c2dm.intent.REGISTER", "com.google.android.c2dm.intent.REGISTRATION",
    "com.google.android.c2dm.intent.RECEIVE", "com.google.iid.TOKEN_REQUEST",
)

/**
 * The type of a Google ID token credential. microG-RE (7.4.0) answers Credential Manager requests for it only under
 * its own name, and hands the credential back under it too, so an app keeping Google's gets "no credential".
 */
private const val GOOGLE_ID_TYPE = "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"
private const val GOOGLE_ID_TYPE_RE = "app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"

/** microG-RE's name for a Play services name in Waze's code, its push actions included; null if it is none. */
private fun route(value: String): String? =
    MicrogRe.route(value) ?: MicrogRe.PUSH_ACTION_ROUTES[value] ?: GOOGLE_ID_TYPE_RE.takeIf { value == GOOGLE_ID_TYPE }

private val wazeMicrogManifestPatch = resourcePatch(
    description = "Points the manifest's Play services permissions at microG-RE and tells it which app to vouch for.",
) {
    execute {
        // Runs first as the microG patch's dependency.
        MicrogSelection.select(this)

        document("AndroidManifest.xml").use { manifest ->
            fun all(tag: String) = manifest.getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

            // 1. The Play services permissions Waze holds (push receive) or guards its push receiver with (send).
            var routed = 0
            for (element in all("*")) {
                val attributes = if (element.tagName.startsWith("uses-permission")) listOf("android:name")
                else listOf("android:permission", "android:readPermission", "android:writePermission")
                for (attribute in attributes) {
                    val to = MicrogRe.PERMISSION_ROUTES[element.getAttribute(attribute)] ?: continue
                    element.setAttribute(attribute, to)
                    routed++
                }
            }
            if (routed < 2) throw PatchException("expected Waze's two push permissions, found $routed")

            // 1b. Push messages: microG-RE delivers them only with its own RECEIVE action.
            var pushActions = 0
            for (action in all("action")) {
                val to = MicrogRe.PUSH_ACTION_ROUTES[action.getAttribute("android:name")] ?: continue
                action.setAttribute("android:name", to)
                pushActions++
            }
            if (pushActions == 0) throw PatchException("Waze's push receiver (com.google.android.c2dm.intent.RECEIVE) not found")

            // 2. Android 11+ package visibility: Waze must be allowed to see microG-RE.
            val root = manifest.documentElement
            val queries = all("queries").firstOrNull { it.parentNode == root }
                ?: manifest.createElement("queries").also { root.insertBefore(it, root.firstChild) }
            queries.appendChild(manifest.createElement("package").apply { setAttribute("android:name", MicrogRe.PACKAGE) })

            // 3. Whom microG-RE vouches for: stock Waze's package and certificate.
            val application = all("application").single()
            fun meta(name: String, value: String) = application.appendChild(manifest.createElement("meta-data").apply {
                setAttribute("android:name", name)
                setAttribute("android:value", value)
            })
            meta("${MicrogRe.PACKAGE}.SPOOFED_PACKAGE_NAME", STOCK_PACKAGE)
            meta("${MicrogRe.PACKAGE}.SPOOFED_PACKAGE_SIGNATURE", STOCK_CERT_SHA1)
            meta("${MicrogRe.VENDOR}.MICROG_PACKAGE_NAME", MicrogRe.PACKAGE)
            meta("${MicrogRe.PACKAGE}.MICROG_PACKAGE_NAME", MicrogRe.PACKAGE)
        }
    }
}

@Suppress("unused")
val wazeMicrogSupportPatch = bytecodePatch(
    name = "Add microG-RE support for Waze",
    description = "Signs in to your Google account through microG-RE (MicroG-RE or ReVanced GmsCore) instead of " +
        "Google Play services. Not for root installs; for original microG, use Add original microG support for Waze.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("microG-RE")
    // A mount install keeps stock Waze's manifest, so microG never learns whom to vouch for.
    availability(AvailabilityResolver { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.DISABLED
    })
    dependsOn(wazeMicrogManifestPatch)

    execute {
        MicrogSelection.select(this)

        // The Play services client checks that the package it talks to is signed by Google, and microG-RE is not:
        // every service connection ended in SERVICE_INVALID ("their signature is invalid"). The check now accepts
        // microG-RE's package, and only that one.
        findWazeMethod("com/google/android/gms/common/ai", "e(Landroid/content/pm/PackageInfo;Z)Z").apply {
            addInstructionsWithLabels(
                0,
                """
                    if-eqz p0, :gw_stock_check
                    iget-object v0, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
                    const-string v1, "${MicrogRe.PACKAGE}"
                    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :gw_stock_check
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("gw_stock_check", getInstruction(0)),
            )
        }

        // The same check also wants the Play Store and Play services to be signed with one key, which a microG-RE
        // package never is ("signature doesn't match that of Google Play services"): the comparison now passes.
        findWazeMethod("com/google/android/gms/common/ah", "a(Landroid/content/Context;I)I").apply {
            val compare = implementation!!.instructions.indexOfFirst { insn ->
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.let { it.definingClass == "Landroid/content/pm/Signature;" && it.name == "equals" } == true
            }
            if (compare < 0 || getInstruction(compare + 1).opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Play Store signature comparison not found: not the Waze build the patch was made for")
            }
            val result = (getInstruction(compare + 1) as OneRegisterInstruction).registerA
            addInstruction(compare + 2, "const/4 v$result, 0x1")
            // And that the installed Play services is as new as the one Waze was built against (26.12), where
            // microG-RE reports 24.09: the version asked for is lowered to what microG-RE offers.
            addInstruction(0, "const p1, $MIN_PLAY_SERVICES_VERSION")
        }
    }

    // Every Play services name in Waze's code: the account type, the package, its providers, permissions and content
    // URIs. In finalize, after every other patch has run, so code they add is covered too. Not the Mod's extension,
    // which asks for real Play services by name on purpose.
    finalize {
        val holders = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/waze/gw/")) return@classDefForEach
            val routes = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                        route(((insn as ReferenceInstruction).reference as StringReference).string) != null
                } == true
            }
            if (routes) holders += classDef.type
        }
        var rewritten = 0
        val pushActions = mutableSetOf<String>()
        var idTypes = 0
        for (type in holders) {
            for (method in mutableClassDefBy(type).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                instructions.forEachIndexed { index, insn ->
                    if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                    val value = ((insn as ReferenceInstruction).reference as StringReference).string
                    val to = route(value) ?: return@forEachIndexed
                    val register = (insn as OneRegisterInstruction).registerA
                    val opcode = if (insn.opcode == Opcode.CONST_STRING) "const-string" else "const-string/jumbo"
                    method.replaceInstruction(index, "$opcode v$register, \"$to\"")
                    rewritten++
                    if (value in MicrogRe.PUSH_ACTION_ROUTES) pushActions += value
                    if (value == GOOGLE_ID_TYPE) idTypes++
                }
            }
        }
        // The Google ID option Waze asks for, the credential class it reads the answer with, and the check of the type.
        if (idTypes != 3) throw PatchException("expected 3 Google ID credential types in Waze, found $idTypes")
        // Measured on Waze 5.27.90.900: about 58 names in the bundled Play services client libraries.
        if (rewritten < 40) throw PatchException("rewrote only $rewritten Play services names; Waze changed shape")
        val missing = PUSH_ACTIONS_USED - pushActions
        if (missing.isNotEmpty()) throw PatchException("Waze's FCM client no longer uses $missing; push not routed to microG-RE")
    }
}

/**
 * Original microG (in Play services' place, on a ROM with signature spoofing) only lists accounts for, and fetches
 * tokens as, an app it sees as Google's: stock Waze's package name and certificate. The ROM shows apps that hold
 * FAKE_PACKAGE_SIGNATURE the certificate in their fake-signature meta-data (DER in hex, waze/microg_cert.txt).
 */
private val wazeOriginalMicrogManifestPatch = resourcePatch(
    description = "Declares stock Waze's certificate for signature spoofing.",
) {
    execute {
        MicrogSelection.select(this, MicrogSelection.Flavor.ORIGINAL)

        val cert = WazeMicrogResource::class.java.getResourceAsStream("/waze/microg_cert.txt")
            ?.use { String(it.readBytes(), Charsets.UTF_8).trim() }
            ?: throw PatchException("waze/microg_cert.txt is missing from the patches file")

        document("AndroidManifest.xml").use { manifest ->
            fun all(tag: String) = manifest.getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
            val root = manifest.documentElement
            if (root.getAttribute("package") != STOCK_PACKAGE) throw PatchException("expected $STOCK_PACKAGE, found ${root.getAttribute("package")}")
            val application = all("application").single()
            if (all("uses-permission").none { it.getAttribute("android:name") == FAKE_PACKAGE_SIGNATURE }) {
                root.insertBefore(manifest.createElement("uses-permission").apply {
                    setAttribute("android:name", FAKE_PACKAGE_SIGNATURE)
                }, application)
            }
            application.appendChild(manifest.createElement("meta-data").apply {
                setAttribute("android:name", "fake-signature")
                setAttribute("android:value", cert)
            })
        }
    }
}

@Suppress("unused")
val wazeOriginalMicrogSupportPatch = bytecodePatch(
    name = "Add original microG support for Waze",
    description = "Signs in through original microG on ROMs with signature spoofing. Keeps Waze's own package " +
        "name; allow signature spoofing for it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("microG")
    // A mount install keeps stock Waze and its real signature, which original microG already accepts.
    availability(AvailabilityResolver { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.DISABLED
    })
    dependsOn(wazeOriginalMicrogManifestPatch)

    execute {
        MicrogSelection.select(this, MicrogSelection.Flavor.ORIGINAL)
    }
}
