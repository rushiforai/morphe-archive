package app.gwp.patches.google.microg

import app.gwp.patches.google.clone.googleCloneCompatibilityPatch
import app.gwp.patches.shared.Constants.COMPATIBILITY_GOOGLE
import app.gwp.patches.shared.Constants.GOOGLE_APP_SIGNATURE_SHA1
import app.gwp.patches.shared.Constants.GOOGLE_PACKAGE
import app.gwp.patches.shared.Constants.MICROG_EXTENDED_ACCESS
import app.gwp.patches.shared.Constants.MICROG_PACKAGE
import app.gwp.patches.shared.Constants.MICROG_VENDOR
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("MicrogSupportPatch")
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/** Content provider authorities of Google Play services that microG provides under its own prefix. */
private val GMS_AUTHORITIES = setOf(
    "com.google.android.gms.auth.accounts",
    "com.google.android.gms.chimera",
    "com.google.android.gms.fonts",
    "com.google.android.gms.phenotype",
    "com.google.android.gsf.gservices",
    "com.google.settings",
)

/** Permissions declared by Google Play services that microG declares under its own prefix. */
private val GMS_PERMISSIONS = setOf(
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.google.android.c2dm.permission.RECEIVE",
    "com.google.android.c2dm.permission.SEND",
    "com.google.android.gtalkservice.permission.GTALK_SERVICE",
    "com.google.android.googleapps.permission.GOOGLE_AUTH",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.cp",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.local",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.mail",
    "com.google.android.googleapps.permission.GOOGLE_AUTH.writely",
    "com.google.android.gms.permission.ACTIVITY_RECOGNITION",
    "com.google.android.gms.permission.AD_ID",
    "com.google.android.gms.permission.AD_ID_NOTIFICATION",
    "com.google.android.gms.auth.api.phone.permission.SEND",
    "com.google.android.gms.permission.CAR_INFORMATION",
    "com.google.android.gms.permission.CAR_SPEED",
    "com.google.android.gms.permission.CAR_FUEL",
    "com.google.android.gms.permission.CAR_MILEAGE",
    "com.google.android.gms.permission.CAR_VENDOR_EXTENSION",
    "com.google.android.gms.locationsharingreporter.periodic.STATUS_UPDATE",
    "com.google.android.gms.auth.permission.GOOGLE_ACCOUNT_CHANGE",
)

/**
 * Activity actions that microG exposes under its own prefix. Binder *service* actions are intentionally
 * not changed: microG answers them under the original Google names.
 */
private val GMS_UI_ACTIONS = setOf(
    "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
    "com.google.android.gms.common.account.CHOOSE_ACCOUNT_USERTILE",
    "com.google.android.gms.auth.GOOGLE_SIGN_IN",
)

private fun toMicrog(value: String) = value.replace("com.google", MICROG_VENDOR)

/** Redirects Google Play services package names, account type, permissions and providers to microG. */
private fun redirectGmsStrings() {
    val exact = mutableMapOf(
        "com.google.android.gms" to MICROG_PACKAGE,
        // Account type: microG accounts are of type "app.revanced".
        "com.google" to MICROG_VENDOR,
        "subscribedfeeds" to "$MICROG_VENDOR.subscribedfeeds",
    )
    (GMS_PERMISSIONS + GMS_AUTHORITIES + GMS_UI_ACTIONS).forEach { exact[it] = toMicrog(it) }

    fun transform(value: String): String? {
        exact[value]?.let { return it }
        if (!value.startsWith("content://")) return null
        GMS_AUTHORITIES.firstOrNull { value.startsWith("content://$it") }?.let {
            return value.replaceFirst("content://$it", "content://${toMicrog(it)}")
        }
        if (value.startsWith("content://subscribedfeeds")) return "content://$MICROG_VENDOR.subscribedfeeds"
        return null
    }

    val classes = LinkedHashMap<String, ClassDef>()
    exact.keys.forEach { s -> classDefByStrings(s, StringComparisonType.EQUALS).forEach { classes[it.type] = it } }
    (GMS_AUTHORITIES.map { "content://$it" } + "content://subscribedfeeds").forEach { s ->
        classDefByStrings(s, StringComparisonType.STARTS_WITH).forEach { classes[it.type] = it }
    }

    var replaced = 0
    for (classDef in classes.values) {
        for (method in mutableClassDefBy(classDef).methods) {
            if (method.implementation == null) continue
            method.instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                val original = ((instruction as ReferenceInstruction).reference as StringReference).string
                val target = transform(original) ?: return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                val reference = ImmutableStringReference(target)
                method.replaceInstruction(
                    index,
                    if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                        BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                    } else {
                        BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                    }
                )
                replaced++
            }
        }
    }
    if (replaced == 0) throw PatchException("No Google Play services references found")
    logger.info("Redirected $replaced Google Play services references in ${classes.size} classes")
}

/** The clone is not signed by Google, so the bundled GMS client would reject microG and itself. */
private fun bypassSignatureChecks() {
    IsGooglePlayServicesAvailableFingerprint.matchAll(1..1).single().method.returnEarly(0)

    val verifier = classDefByStrings(SIGNATURE_VERIFIER_LOG, StringComparisonType.EQUALS).singleOrNull()
        ?: throw PatchException("GoogleSignatureVerifier not found")
    var patched = 0
    mutableClassDefBy(verifier).methods.filter { it.returnType == "Z" && it.implementation != null }.forEach {
        val descriptor = "(${it.parameterTypes.joinToString("")})Z"
        if (descriptor !in SIGNATURE_VERIFIER_METHODS) throw PatchException("Unexpected verifier method $descriptor")
        it.returnEarly(true)
        patched++
    }
    if (patched != SIGNATURE_VERIFIER_METHODS.size) throw PatchException("Expected 3 verifier methods, found $patched")
}

private fun Element.androidName() = getAttributeNS(ANDROID_NS, "name").ifEmpty { getAttribute("android:name") }

private fun patchManifest() = document("AndroidManifest.xml").use { document ->
    val manifest = document.documentElement
    val application = document.getElementsByTagName("application").item(0) as Element

    // microG: present the original package name and Google's signature to Google servers.
    mapOf(
        "$MICROG_VENDOR.android.gms.SPOOFED_PACKAGE_NAME" to GOOGLE_PACKAGE,
        "$MICROG_VENDOR.android.gms.SPOOFED_PACKAGE_SIGNATURE" to GOOGLE_APP_SIGNATURE_SHA1,
        "$MICROG_VENDOR.MICROG_PACKAGE_NAME" to MICROG_PACKAGE,
    ).forEach { (name, value) ->
        application.appendChild(document.createElement("meta-data").apply {
            setAttribute("android:name", name)
            setAttribute("android:value", value)
        })
    }

    // Package visibility (Android 11+): the app must be allowed to see microG.
    val queries = (document.getElementsByTagName("queries").item(0) as? Element)
        ?: document.createElement("queries").also { manifest.appendChild(it) }
    queries.appendChild(document.createElement("package").apply { setAttribute("android:name", MICROG_PACKAGE) })

    listOf(
        "android.permission.GET_ACCOUNTS",
        MICROG_EXTENDED_ACCESS,
        "android.permission.SCHEDULE_EXACT_ALARM",
        "android.permission.USE_EXACT_ALARM",
    ).forEach { permission ->
        manifest.appendChild(document.createElement("uses-permission").apply { setAttribute("android:name", permission) })
    }

    // Boot / update receivers crash in the clone.
    val receivers = document.getElementsByTagName("receiver")
    for (i in 0 until receivers.length) {
        val receiver = receivers.item(i) as Element
        if (receiver.androidName().contains("BootOrUpdateReceiver")) receiver.setAttribute("android:enabled", "false")
    }

    // Distinguishable labels.
    application.setAttribute("android:label", "Google (Morphe)")
    val activities = document.getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val activity = activities.item(i) as Element
        if (activity.androidName().contains("RobinEntryPointActivity")) activity.setAttribute("android:label", "Gemini (Morphe)")
    }
    val aliases = document.getElementsByTagName("activity-alias")
    for (i in 0 until aliases.length) {
        val alias = aliases.item(i) as Element
        val name = alias.androidName()
        alias.setAttribute("android:label", if (name.contains("Robin") || name.contains("bard")) "Gemini (Morphe)" else "Google (Morphe)")
    }
}

@Suppress("unused")
val microgSupportPatch = patch(
    name = "microG support",
    description = "Installs the Google app as a separate clone that signs in with microG (app.revanced.android.gms) " +
        "instead of Google Play services. microG must be installed in the same profile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE)
    dependsOn(googleCloneCompatibilityPatch)

    execute {
        redirectGmsStrings()
        bypassSignatureChecks()
        patchManifest()
    }
}
