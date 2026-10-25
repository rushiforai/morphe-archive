package app.template.patches.easylauncher.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYLAUNCHER
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// Push notifications must keep working, so nothing here touches Firebase Messaging, Firebase
// Installations, Remote Config, App Check, com.eet.core.push or FeaturePushHandler. The only
// push-side change is that BrazePushService no longer starts the Braze SDK.

/**
 * Turns off Crashlytics, Firebase Analytics, advertising ID and deferred deep link collection,
 * and Facebook auto-init and advertiser ID collection, through their manifest switches.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_deferred_deep_link_enabled" to "false",
                "com.facebook.sdk.AutoInitEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            )) {
                // Crashlytics, deferred deep links and the two Facebook keys already ship enabled:
                // overwrite them in place.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_EASYLAUNCHER)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 1. Every analytics service: the methods that send events, errors, user data or
        // screenshots return at once. Collect first: mutating classes while iterating them is not
        // allowed.
        val services = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.superclass == ANALYTICS_SERVICE) services += classDef
        }
        if (services.size < 3) {
            throw PatchException("Only ${services.size} $ANALYTICS_SERVICE subclasses found")
        }
        var logEvents = 0
        for (classDef in services) {
            mutableClassDefBy(classDef).methods
                .filter { it.name in ANALYTICS_SEND_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    if (it.name == "logEvent") logEvents++
                    it.returnEarly()
                }
        }
        if (logEvents < 3) throw PatchException("Only $logEvents concrete logEvent methods found")

        // 2. Amplitude: the client is never built (its field stays null, which every caller
        // already handles).
        AmplitudeInitializeFingerprint.method.returnEarly()

        // 3. Rudderstack: the constructor skips client setup when the write key is empty. Make
        // the key's length read as 0 so that existing guard takes over.
        RudderstackConstructorFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val lengthCall = instructions.indexOfFirst { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    call?.definingClass == "Ljava/lang/String;" && call.name == "length"
            }
            val moveResult = instructions.getOrNull(lengthCall + 1)
                ?.takeIf { lengthCall >= 0 && it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
            val guard = instructions.getOrNull(lengthCall + 2)
                ?.takeIf { it.opcode == Opcode.IF_LEZ || it.opcode == Opcode.IF_EQZ } as? OneRegisterInstruction
            if (moveResult == null || guard == null || guard.registerA != moveResult.registerA) {
                throw PatchException("$definingClass.<init> no longer guards on the write key length")
            }
            addInstructionsChecked(lengthCall + 2, "const/4 v${moveResult.registerA}, 0x0")
        }

        // 4. Singular: init reports failure without starting the SDK. The caller only logs the
        // result and retries on the next activity, which hits this again.
        val singularInits = mutableClassDefBy(SINGULAR).methods.filter { method ->
            method.name == "init" && method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) in SINGULAR_INIT_OVERLOADS
        }
        if (singularInits.isEmpty()) throw PatchException("$SINGULAR has no concrete init overload")
        singularInits.forEach { it.returnEarly(false) }

        // 5. Braze: the push service's initialize returns Unit without enqueuing BrazeInitWorker.
        val unit = classDefBy("Lkotlin/Unit;").staticFields.firstOrNull { it.type == "Lkotlin/Unit;" }
            ?: throw PatchException("kotlin.Unit has no singleton field")
        BrazePushInitializeFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object p0, Lkotlin/Unit;->${unit.name}:Lkotlin/Unit;
                return-object p0
            """,
        )

        // 6. Crashlytics: the app can no longer switch collection on at runtime (the manifest
        // switch above turns it off at startup).
        FirebaseSetCrashCollectionEnabledFingerprint.method.addInstructionsChecked(0, "const/4 p1, 0x0")
    }
}
