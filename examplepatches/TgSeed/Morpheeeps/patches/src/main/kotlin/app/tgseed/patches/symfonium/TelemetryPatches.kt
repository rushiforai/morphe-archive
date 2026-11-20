package app.tgseed.patches.symfonium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Symfonium bundles the Matomo SDK (renamed by R8, so no `org.matomo.sdk` types survive) and builds
 * its tracker from a hard-coded collector URL that appears as a bare literal in four unrelated
 * methods. The `TrackerBuilder(apiUrl=...)` copy is a toString and is deliberately left alone.
 *
 * A single-match fingerprint is the wrong tool: four methods embed the same literal, so it would
 * pick one arbitrarily or fail under --validate. Scan every class instead, and convert only the
 * ones that actually contain the literal to mutable proxies.
 */
private const val MATOMO_URL = "https://goose.yatse.tv/matomo.php"
private const val MATOMO_DEAD = "https://matomo.invalid/matomo.php"

private fun Method.stringLiterals(): List<String> =
    implementation?.instructions
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? StringReference }
        ?.map { it.string }
        ?: emptyList()

private fun ClassDef.containsLiteral(literal: String): Boolean =
    methods.any { it.stringLiterals().contains(literal) }

@Suppress("unused")
val disableMatomoAnalyticsPatch = bytecodePatch(
    name = "Disable Matomo analytics",
    description = "Rewrites the Matomo collector URL so every analytics beacon targets an " +
        "unroutable host. The Tracker is still constructed; nothing is ever delivered.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        var hits = 0
        classDefForEach { classDef ->
            if (!classDef.containsLiteral(MATOMO_URL)) return@classDefForEach
            val mutable = mutableClassDefBy(classDef)
            mutable.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    if (reference?.string != MATOMO_URL) return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const-string v$register, \"$MATOMO_DEAD\"")
                    hits++
                }
            }
        }
        if (hits == 0) {
            throw PatchException("Matomo collector URL not found - target version changed?")
        }
    }
}

/**
 * Firebase Analytics is reached through renamed methods on an un-renamed SDK class, so the class
 * descriptor is the anchor and method names are irrelevant. Emptying every void method leaves
 * `getInstance()` and the getters intact (so nothing NPEs) while no event can be queued.
 */
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

@Suppress("unused")
val disableFirebaseAnalyticsPatch = bytecodePatch(
    name = "Disable Firebase Analytics",
    description = "Makes every void method of FirebaseAnalytics return immediately, so no analytics " +
        "event is recorded or uploaded. Getters and getInstance() are untouched.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val hits = emptyVoidMethodsOf(this, FIREBASE_ANALYTICS)
        if (hits == 0) {
            throw PatchException("FirebaseAnalytics void methods not found - target version changed?")
        }
    }
}

/**
 * This build does not ship `FirebaseCrashlytics` at all (only the internal/common helpers and the
 * registrar), so there is no reporting API to silence. What it does ship is
 * `CrashlyticsRegistrar`, the ComponentRegistrar that FirebaseApp discovers reflectively - returning
 * an empty component list from it means Crashlytics is never instantiated and its uncaught-exception
 * handler is never installed. The class name is load-bearing (Firebase looks it up by name), so this
 * anchor cannot be renamed by R8.
 */
private val CrashlyticsRegistrarFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/CrashlyticsRegistrar;",
    name = "getComponents",
    returnType = "Ljava/util/List;"
)

@Suppress("unused")
val disableCrashlyticsReportingPatch = bytecodePatch(
    name = "Disable Crashlytics",
    description = "Makes the Crashlytics Firebase registrar report no components, so the SDK is never " +
        "instantiated and its crash handler is never installed.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val method = CrashlyticsRegistrarFingerprint.method
        val registers = method.implementation?.registerCount ?: 0
        if (registers < 1) {
            throw PatchException("CrashlyticsRegistrar.getComponents has no register to return through")
        }
        method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )
    }
}

/** Makes every non-constructor void method of [classType] return immediately. */
private fun emptyVoidMethodsOf(ctx: BytecodePatchContext, classType: String): Int {
    var hits = 0
    ctx.classDefForEach { classDef ->
        if (classDef.type != classType) return@classDefForEach
        val mutable = ctx.mutableClassDefBy(classDef)
        mutable.methods.forEach { method ->
            if (method.returnType != "V") return@forEach
            if (method.name.startsWith("<")) return@forEach   // never empty a constructor
            if (method.implementation == null) return@forEach
            method.addInstructions(0, "return-void")
            hits++
        }
    }
    return hits
}
