package app.morphe.patches.sube

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.Constants.COMPATIBILITY_SUBE
import app.morphe.patches.shared.disableComponentsByName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private val FIREBASE_MESSAGING_COMPONENTS = arrayOf(
    "com.google.firebase.messaging.FirebaseMessagingService",
    "com.google.firebase.iid.FirebaseInstanceIdReceiver",
)

// FirebaseInitProvider MUST remain enabled.
// Disabling FirebaseInitProvider causes a fatal startup crash during MainActivity initialization:
//   java.lang.RuntimeException: Unable to start activity ComponentInfo{com.sube.app/com.sube.app.MainActivity}:
//   java.lang.IllegalStateException: Default FirebaseApp is not initialized in this process com.sube.app. Make sure to call FirebaseApp.initializeApp(Context) first.
//   Caused by: FirebaseApp.getInstance (W6.e.e FirebaseApp.java:56) called from FirebaseCrashlytics (m7.f.a FirebaseCrashlytics.java:1) during MainActivity startup.
// FirebaseInitProvider is explicitly kept enabled so FirebaseApp initialization succeeds, while Firebase Cloud
// Messaging (FCM) background wakeups and push traffic are severed via disabled services/receivers.
@Suppress("unused")
val subeFirebaseKillManifestPatch = resourcePatch(
    name = "Cut Firebase Manifest",
    description = "Disables Firebase Cloud Messaging services and instance ID receivers in AndroidManifest.xml. Breaks push notifications and FCM background delivery.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SUBE)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Cut Firebase Manifest] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        var disabledCount = 0
        document(manifestFile.absolutePath).use { doc ->
            val root = doc.documentElement
            val application = root.getElementsByTagName("application").item(0) as? Element
            if (application != null) {
                disabledCount = application.disableComponentsByName(*FIREBASE_MESSAGING_COMPONENTS)
            }
        }

        println("[Cut Firebase Manifest] Disabled $disabledCount Firebase messaging component(s).")
    }
}

private const val TARGET_HOST = "firebaseinstallations.googleapis.com"
private const val SINK_HOST = "0.0.0.0"

private data class PendingRewrite(
    val index: Int,
    val register: Int,
    val replacement: String,
    val original: String,
)

private fun extractCandidateHost(raw: String): String {
    val withoutScheme = if (raw.contains("://")) raw.substringAfter("://") else raw
    return withoutScheme
        .substringBefore('/')
        .substringBefore('?')
        .substringBefore('#')
        .substringBefore(':')
        .trim()
        .trimEnd('.')
}

private fun buildRewriteLiteral(literal: String, targetHost: String): String? {
    if (literal.isBlank() || literal.length > 512) return null

    val candidateHost = extractCandidateHost(literal)
    if (candidateHost.isEmpty() || candidateHost.length > 253) return null

    val matches = candidateHost.equals(targetHost, ignoreCase = true) ||
        candidateHost.endsWith(".$targetHost", ignoreCase = true)
    if (!matches) return null

    return literal.replace(candidateHost, SINK_HOST, ignoreCase = true)
}

private fun collectRewrites(method: MutableMethod, targetHost: String): List<PendingRewrite> {
    val implementation = method.implementation ?: return emptyList()
    val instructions = implementation.instructions
    val rewrites = mutableListOf<PendingRewrite>()

    for ((index, instruction) in instructions.withIndex()) {
        val opcode = instruction.opcode
        if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) continue
        val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
        val original = ref.string
        val replacement = buildRewriteLiteral(original, targetHost) ?: continue
        val register = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        rewrites.add(PendingRewrite(index, register, replacement, original))
    }

    return rewrites
}

private fun escapeSmaliLiteral(value: String): String =
    value.replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("\t", "\\t")

private fun applyRewrites(method: MutableMethod, rewrites: List<PendingRewrite>) {
    for (rewrite in rewrites.sortedByDescending { it.index }) {
        method.replaceInstruction(
            rewrite.index,
            "const-string v${rewrite.register}, \"${escapeSmaliLiteral(rewrite.replacement)}\"",
        )
    }
}

@Suppress("unused")
val subeFirebaseKillPatch = bytecodePatch(
    name = "Cut Firebase Entirely",
    description = "Rewrites the Firebase Installations API endpoint (firebaseinstallations.googleapis.com) to 0.0.0.0 in DEX bytecode across all classes, severing background FID registration and installation auth tokens. WARNING: Breaks push notifications (FCM) and cloud messaging.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SUBE)
    dependsOn(subeFirebaseKillManifestPatch)

    execute {
        var totalRewritten = 0
        var modifiedClasses = 0
        var modifiedMethods = 0
        val touchedLocations = mutableListOf<String>()

        classDefForEach { classDef ->
            var classHasTarget = false
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (instruction in impl.instructions) {
                    val opcode = instruction.opcode
                    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) continue
                    val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    if (ref.string.contains(TARGET_HOST, ignoreCase = true)) {
                        classHasTarget = true
                        break
                    }
                }
                if (classHasTarget) break
            }

            if (!classHasTarget) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            var classModified = false

            for (method in mutableClass.methods) {
                val rewrites = collectRewrites(method, TARGET_HOST)
                if (rewrites.isNotEmpty()) {
                    applyRewrites(method, rewrites)
                    totalRewritten += rewrites.size
                    modifiedMethods++
                    classModified = true
                    for (rw in rewrites) {
                        touchedLocations.add("${classDef.type}->${method.name} [${rw.original} -> ${rw.replacement}]")
                    }
                }
            }

            if (classModified) {
                modifiedClasses++
            }
        }

        if (totalRewritten == 0) {
            error("[Cut Firebase Entirely] No Firebase installations endpoint literals found - failing closed.")
        }

        val locationsSummary = touchedLocations.joinToString(", ")
        println("[Cut Firebase Entirely] Applied $totalRewritten endpoint rewrite(s) across $modifiedMethods method(s) in $modifiedClasses class(es) -> $TARGET_HOST redirected to $SINK_HOST ($locationsSummary).")
    }
}
