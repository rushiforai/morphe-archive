/*
 * From ajstrick81's Tubi Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/privacy
 * ALL CREDIT FOR THE ORIGINAL DESIGN GOES TO ajstrick81. Changes: split out
 * of the Tubi patch so every app's analytics patch can share it.
 */

package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// ─────────────────────────────────────────────────────────────────────────────
// Shared layers of every "Block analytics & tracking" patch.
//
//   1. Manifest: the SDKs' own documented kill switches (Firebase Analytics
//      deactivated, no SSAID / ad-ID collection; Meta auto-logged events and
//      ad-ID collection off; Contentsquare auto-start off). Keys an app does
//      not use are ignored by Android.
//   2. One host blocklist (TrackerBlocker) enforced at every
//      URL.openConnection() call site, and at every OkHttp client in apps
//      that keep OkHttp's public API (Tubi). Trackers that send through a
//      renamed OkHttp (Datadog in Disney+ and Pluto) are not covered.
//
// App patches add their own layers (for example, Adjust on Tubi) and then
// call blockTrackers(). A blocked request fails like an offline network,
// which these SDKs already tolerate.
// ─────────────────────────────────────────────────────────────────────────────

internal const val TRACKER_BLOCKER = "Lsemicoloncolonel/mobilestream/extension/shared/privacy/TrackerBlocker;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

private val manifestKillSwitches = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_ssaid_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
    "com.contentsquare.android.autostart" to "false",
)

internal val analyticsKillSwitchesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val existing = mutableMapOf<String, Element>()
            val metaData = application.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as? Element ?: continue
                existing[element.getAttribute("android:name")] = element
            }
            for ((name, value) in manifestKillSwitches) {
                val element = existing[name] ?: document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                element.setAttribute("android:value", value)
            }
        }
    }
}

// OkHttpClient(Builder): both Builder.build() and the no-arg OkHttpClient()
// construct through here, so hooking it covers every OkHttp client.
internal object OkHttpClientInitFingerprint : Fingerprint(
    definingClass = "Lokhttp3/OkHttpClient;",
    name = "<init>",
    parameters = listOf("Lokhttp3/OkHttpClient\$Builder;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR)
)

// TrackerBlocker's interceptor is compiled against OkHttp's public API
// (Builder.interceptors(), Request.url(), Chain.proceed()). Only Tubi keeps
// those names. Disney+ 26.20.0 renames them (proceed -> a, url() and host()
// renamed) and Pluto 17.2.0 renames all of OkHttp, so the interceptor would
// throw NoSuchMethodError on every request there. These two probes gate the
// OkHttp layer on the API actually being present.
internal object OkHttpBuilderInterceptorsFingerprint : Fingerprint(
    definingClass = "Lokhttp3/OkHttpClient\$Builder;",
    name = "interceptors",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

internal object OkHttpRequestUrlFingerprint : Fingerprint(
    definingClass = "Lokhttp3/Request;",
    name = "url",
    parameters = listOf(),
    returnType = "Lokhttp3/HttpUrl;",
)

private fun Instruction.isUrlOpenConnection(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == "Ljava/net/URL;" &&
        reference.name == "openConnection" &&
        reference.parameterTypes.isEmpty()
}

private fun Method.callsUrlOpenConnection() =
    implementation?.instructions?.any { it.isUrlOpenConnection() } == true

internal fun BytecodePatchContext.blockTrackers() {
    // Every OkHttp client gets the blocking interceptor, where the app keeps
    // OkHttp's public API (see the probes above). The call sits before the
    // super() call, which the verifier allows because it doesn't touch `this`.
    if (OkHttpBuilderInterceptorsFingerprint.methodOrNull != null &&
        OkHttpRequestUrlFingerprint.methodOrNull != null
    ) {
        OkHttpClientInitFingerprint.methodOrNull?.addInstructions(
            0,
            // /range: the patcher silently drops a 4-bit invoke whose register is
            // past v15, and constructor sizes differ between apps.
            "invoke-static/range { p1 .. p1 }, $TRACKER_BLOCKER->install(Lokhttp3/OkHttpClient\$Builder;)V",
        )
    }

    // Route every URL.openConnection() in the app through the blocklist.
    // Collect first, mutate after: mutableClassDefBy swaps the class map
    // entry, which must not happen mid-iteration. Extension classes are
    // skipped, since TrackerBlocker itself calls openConnection.
    val targets = mutableListOf<String>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith(EXTENSION_PACKAGE) &&
            classDef.methods.any { it.callsUrlOpenConnection() }
        ) {
            targets += classDef.type
        }
    }

    val replacement = "$TRACKER_BLOCKER->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;"
    targets.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            // Snapshot: replaceInstruction mutates the live list.
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.isUrlOpenConnection()) return@forEachIndexed
                val smali = when (instruction) {
                    is FiveRegisterInstruction ->
                        "invoke-static { v${instruction.registerC} }, $replacement"
                    is RegisterRangeInstruction ->
                        "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister} }, $replacement"
                    else -> return@forEachIndexed
                }
                method.replaceInstruction(index, smali)
            }
        }
    }
}
