// Based on bearinmindcat/morphe-patches (GPL-3.0) @ 5f79152, patches/src/main/kotlin/org/ungoogled/patches/samsungkeyboard/privacy/PrivacyPatches.kt.
// Modified for Heval's Morphe Patches on 2026-11-13: package renamed, checked instruction helpers.

package app.template.patches.samsungkeyboard.privacy

import app.template.patches.shared.addInstructionsChecked
import app.template.patches.samsungkeyboard.controls.SamsungKeyboardControlsCategory
import app.template.patches.samsungkeyboard.controls.samsungKeyboardControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.shared.samsung.hideDiagnosticsAgent
import app.template.patches.shared.Constants.COMPATIBILITY_SAMSUNG_KEYBOARD
import org.w3c.dom.Element

private const val GSIM_LOGGER = "Lcom/samsung/android/sdk/handwriting/GSIMLogger;"
private const val SCPM_RECEIVER = "Lcom/samsung/android/honeyboard/base/broadcastreceiver/ScpmReceiver;"

/** IME_FLAG_NO_PERSONALIZED_LEARNING: the field asks not to be learned from. */
private const val NO_PERSONALIZED_LEARNING = 0x1000000L

private fun MutableMethod.returnFirst(smali: String) = addInstructionsChecked(0, smali)

/** Returns at once with nothing (void, false / 0, or null) while the Patch settings switch [id] is on. */
private fun MutableMethod.returnNothingWhile(id: String) {
    if (returnType.first() == 'J' || returnType.first() == 'D') {
        val locals = (implementation?.registerCount ?: 0) - (if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(accessFlags)) 0 else 1) -
            parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        if (locals < 2) throw PatchException("$definingClass->$name has no two free local registers for a wide answer")
    }
    addHevalGate(id) { v ->
        when (returnType.first()) {
            'V' -> "return-void"
            'L', '[' -> "const/4 $v, 0x0\nreturn-object $v"
            'J', 'D' -> "const-wide/16 $v, 0x0\nreturn-wide $v"
            else -> "const/4 $v, 0x0\nreturn $v"
        }
    }
}

private val log = java.util.logging.Logger.getLogger("SamsungKeyboard")

private fun Method.strings() = implementation?.instructions?.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.orEmpty()

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

/** Every method [predicate] accepts (read-only pass). */
private fun BytecodePatchContext.methodsWhere(predicate: (Method) -> Boolean): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { c -> c.methods.filterTo(found) { it.implementation != null && predicate(it) } }
    return found
}

/**
 * Patches [fingerprint]'s method, or -- when this build has no [marker] string anywhere, i.e. the feature isn't in it --
 * logs that and skips it. A build that has the feature in a shape the fingerprint misses still fails.
 */
private fun BytecodePatchContext.whereBuilt(what: String, marker: String, fingerprint: Fingerprint, patch: MutableMethod.() -> Unit): Boolean {
    val method = fingerprint.methodOrNull
    if (method != null) {
        method.patch()
        return true
    }
    if (methodsWhere { marker in it.strings() }.isNotEmpty()) throw PatchException("$what: not found where this build has it ($marker)")
    log.info("$what: not in this build, nothing to turn off")
    return false
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Turns off Samsung Analytics, crash reports and typed-text collection.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)

    execute {
        // Samsung Analytics: the tracker is never ready, so it neither starts nor sends.
        AnalyticsTrackerReadyFingerprint.method.returnFirst("const/4 v0, 0x0\nreturn v0")

        // DiagMon (crash, ANR and usage reports): the diagnostics agent reads as not installed, the SDK's own
        // "not supported" case, so no crash handler is set and no report is made. Every lookup of the agent asks for
        // a package name nothing has, wherever R8 put it (issue #98: the start-up method and the SDKs' version checks
        // differ between builds of the same version); the version checks also answer 0 themselves.
        val agentLookups = hideDiagnosticsAgent()
        val versionChecks = methodsWhere {
            it.returnType == "I" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                "DMA Client is not exist" in it.strings()
        }
        versionChecks.forEach { mutable(it).returnFirst("const/4 v0, 0x0\nreturn v0") }
        log.info("DiagMon: $agentLookups agent lookups, ${versionChecks.size} version checks")

        // Handwriting's usage survey to the diagnostics agent.
        mutableClassDefBy(GSIM_LOGGER).methods.single { it.name == "insertLogData" }.returnFirst("return-void")

        // Galaxy AI's consent upload (not in every build).
        whereBuilt("Galaxy AI consent upload", "canSyncNow=false isSamsungAccountLoggedIn=", ConsentSyncFingerprint) {
            returnFirst("const/4 v0, 0x0\nreturn v0")
        }

        // Search-box text to Samsung's on-device data collector.
        whereBuilt("Typed-text collection", "[[AiWriter]_DATA_COLLECTION]", TypedTextCollectionFingerprint) {
            returnFirst("return-void")
        }
    }
}

@Suppress("unused")
val noGifTrackingPatch = bytecodePatch(
    name = "No GIF tracking",
    description = "Stops GIPHY and Tenor view and share pings.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)

    execute {
        // Samsung's GIF revenue share: GIPHY's sessions are never sent (the queue's sender returns, or each session's
        // request is never made -- its Future is unused), Tenor's register URL is never opened -- what each already
        // does with nothing to send. Both returns sit behind the "No GIF tracking" switch; the switch is listed only
        // when at least one of the two exists in this build.
        val giphy = whereBuilt("GIPHY pingbacks", "pingback_id", GiphyPingbackFingerprint) { returnNothingWhile(NO_GIF_TRACKING_ID) }
        val tenor = whereBuilt("Tenor register", "GRS_TenorRegisterManager", TenorRegisterFingerprint) { returnNothingWhile(NO_GIF_TRACKING_ID) }
        if (giphy || tenor) {
            samsungKeyboardControls.register(
                HevalFeature(
                    id = NO_GIF_TRACKING_ID,
                    name = "No GIF tracking",
                    description = "Stops GIPHY and Tenor view and share pings.",
                    category = SamsungKeyboardControlsCategory.PRIVACY,
                    default = true,
                    icon = "shield",
                ),
            )
        }
    }
}

private const val NO_GIF_TRACKING_ID = "samsungkeyboard.no_gif_tracking"

@Suppress("unused")
val stopRemoteUpdatesPatch = bytecodePatch(
    name = "Stop remote updates",
    description = "Ignores keyboard policies pushed from Samsung's servers.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)

    execute {
        // Samsung's policy service (SCPM) delivers the keyboard's server-side lists and switches -- word
        // blocklists, writing-assist and sticker rules -- through this one receiver.
        mutableClassDefBy(SCPM_RECEIVER).methods.single { it.name == "onReceive" }.returnFirst("return-void")
    }
}

private const val SECURE_FOLDER_ID = "Lcom/samsung/android/knox/SemPersonaManager;->isSecureFolderId(I)Z"
private const val INPUT_BINDING_UID = "Landroid/view/inputmethod/InputBinding;->getUid()I"

private fun MethodReference.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun Method.calls() = implementation?.instructions?.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.key()
}.orEmpty()

@Suppress("unused")
val alwaysIncognitoPatch = samsungKeyboardControls.featurePatch(
    HevalFeature(
        id = "samsungkeyboard.always_incognito",
        name = "Always use incognito mode",
        description = "Makes the keyboard's own incognito check always say yes, so it never learns from what you type.",
        category = SamsungKeyboardControlsCategory.PRIVACY,
        // On once the patch is selected (the patch itself is opt-in in Manager).
        default = true,
        icon = "eye_off",
    ),
    name = "Always incognito",
    description = "Never learns from what you type.",
    default = false,
) {
    run {
        // The keyboard's incognito check -- true in a field that asks not to be learned from, a private field or
        // the Secure Folder -- answers yes everywhere. It is the no-argument boolean that asks the Secure Folder test
        // (the input binding's user is a Secure Folder) and tests that flag, itself or through the no-argument
        // booleans it calls (R8 inlines them in some builds, not in others).
        val booleans = mutableMapOf<String, Method>()
        val secureFolderTests = mutableSetOf<String>()
        classDefForEach { c ->
            for (m in c.methods) {
                if (m.implementation == null) continue
                if (m.returnType == "Z" && m.parameterTypes.isEmpty()) booleans[m.key()] = m
                val calls = m.calls()
                if (SECURE_FOLDER_ID in calls && INPUT_BINDING_UID in calls) secureFolderTests += m.key()
            }
        }
        fun testsFlag(m: Method, depth: Int): Boolean =
            m.implementation!!.instructions.any { (it as? WideLiteralInstruction)?.wideLiteral == NO_PERSONALIZED_LEARNING } ||
                depth > 0 && m.calls().any { key -> booleans[key]?.let { testsFlag(it, depth - 1) } == true }
        val incognito = booleans.values.filter { m -> m.calls().any { it in secureFolderTests } && testsFlag(m, 2) }
            .singleOrNull() ?: throw PatchException("incognito check not found (Secure Folder tests: $secureFolderTests)")
        // Behind its switch: while it is off the check runs as stock.
        mutable(incognito).hevalReturnEarly("samsungkeyboard.always_incognito", true)
    }
}

@Suppress("unused")
val removeInternetPermissionPatch = resourcePatch(
    name = "Remove internet permission",
    description = "Keeps the keyboard offline. GIFs, stickers, translation, AI tools and language downloads stop working.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val list = manifest.getElementsByTagName("uses-permission")
            val internet = (0 until list.length).map { list.item(it) as Element }
                .filter { it.getAttribute("android:name") == "android.permission.INTERNET" }
            if (internet.isEmpty()) throw PatchException("no INTERNET permission in the manifest")
            internet.forEach { it.parentNode.removeChild(it) }
        }
    }
}
