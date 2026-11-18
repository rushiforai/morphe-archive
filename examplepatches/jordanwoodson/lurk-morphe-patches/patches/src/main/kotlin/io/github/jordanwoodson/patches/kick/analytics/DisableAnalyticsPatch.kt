package io.github.jordanwoodson.patches.kick.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.requireLowRegisters
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.shared.settings.isEnabled
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import org.w3c.dom.Element

private const val KEY = "disable_analytics"
private const val BLOCK_FINGERPRINTING = "block_fingerprinting"
private const val PRIVACY = "Lio/github/jordanwoodson/extension/shared/kick/KickPrivacy;"

/**
 * Firebase's content provider starts Analytics before MainApplication.onCreate turns collection off,
 * so a fresh install would collect from the manifest default until then. The persisted value that
 * onCreate sets every start wins over this default, so the switch still turns collection back on.
 */
private val firebaseStartsDisabledPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("meta-data")
            val enabled = (0 until nodes.length).map { nodes.item(it) as Element }
                .singleOrNull { it.getAttribute("android:name") == "firebase_analytics_collection_enabled" }
                ?: throw PatchException("Kick: Firebase Analytics collection default missing")
            enabled.setAttribute("android:value", "false")
        }
    }
}

/**
 * The matched method, recorded as the locator `kick.disable_analytics.<name>`: tests/kick/BundleProbe.java runs these
 * methods on ART and reads their classes and names from the patched APK's assets/lurk/locators.json.
 */
context(context: BytecodePatchContext)
private fun Fingerprint.located(description: String, name: String) =
    kickMatch(description).method.also { Locators.record("kick.disable_analytics.$name", it) }

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics, Insider (start-up, events and queued uploads), Datadog (its " +
        "start-up, so its view, action, log and trace calls go nowhere), Mux and Datazoom player analytics, and " +
        "Google PAL nonce requests. Kick's own API requests still run, including the playback request that returns " +
        "the stream. A second switch, Block device fingerprinting, stops FingerprintJS Pro, which Kick uses to " +
        "identify this device when you sign up, for age checks and when a signed-in session starts; it starts off " +
        "because sign-up and age checks can fail while it is on. Disable analytics is on by default; turn it off in " +
        "Lurk settings > Privacy and restart Kick. This does not remove video ads.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch, firebaseStartsDisabledPatch)

    execute {
        // Resolve the original React Native completion contract, without dispatching an event task. The method has
        // one local, so the promise stays in its parameter register: refuse a version where that is above v15.
        FirebaseEventFingerprint.located("Firebase event bridge", "firebase_log_event").apply {
            requireLowRegisters("Firebase event bridge", parameterRegister(3))
            addInstructionsIfEnabled(KEY, """
                const/4 v0, 0x0
                invoke-interface { p3, v0 }, $REACT_PROMISE->resolve(Ljava/lang/Object;)V
                return-void
            """)
        }
        // No scratch registers required: only transform the existing boolean argument.
        FirebaseCollectionFingerprint.kickMatch("Firebase collection setter").method.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $PRIVACY->allowAnalyticsCollection(Z)Z
            move-result p1
        """)

        listOf(
            InsiderInitFingerprint to "Insider initialization",
            InsiderEventFingerprint to "Insider event build",
            DatadogNativeFingerprint to "Datadog native initialization",
        ).forEach { (fingerprint, description) ->
            fingerprint.kickMatch(description).method.addInstructionsIfEnabled(KEY, "return-void")
        }
        // Kick's player: Mux Data gets no options, so its monitor never starts Mux; the player view keeps no Datazoom
        // monitor, so Datazoom isn't initialized and no MediaTailor session (ad tracking, PAL signals) is made. Without
        // a session Kick plays the source it already has, as it does when a session fails.
        listOf(
            MuxOptionsFingerprint to "mux_options" to "Mux player options",
            DatazoomOptionsFingerprint to "datazoom_options" to "Datazoom player options",
        ).forEach { (match, description) ->
            val (fingerprint, name) = match
            fingerprint.located(description, name).addInstructionsIfEnabled(KEY, "return-void")
        }
        // Previously scheduled jobs can upload stored data without initializing the RN SDK.
        // Returning false reports synchronous completion: no worker was started, so jobFinished
        // is unnecessary and onStopJob will not be called for this execution. Both originals
        // have two locals; the helper checks that v0 is not a parameter before adding the guard.
        listOf(
            InsiderSessionJobFingerprint to "Insider session upload job",
            InsiderAmplificationJobFingerprint to "Insider amplification job",
        ).forEach { (fingerprint, description) ->
            fingerprint.located(description, description.lowercase().replace(' ', '_')).addInstructionsIfEnabled(KEY, """
                const/4 v0, 0x0
                return v0
            """)
        }
        // The promise is copied next to the value, so the call never depends on how many locals Datadog adds.
        DatadogBridgeFingerprint.located("Datadog React initialization", "datadog_initialize").addInstructionsIfEnabled(KEY, """
            move-object/from16 v0, p2
            const/4 v1, 0x0
            invoke-interface { v0, v1 }, $REACT_PROMISE->resolve(Ljava/lang/Object;)V
            return-void
        """, locals = 2)
        // Kick's JavaScript takes a missing nonce as an empty one and sends the playback request without it. An
        // unresolved promise would hold the request back; a rejection would report that PAL failed to load.
        PalNonceFingerprint.located("PAL nonce loader", "pal_generate_nonce").apply {
            requireLowRegisters("PAL nonce loader", parameterRegister(3))
            addInstructionsIfEnabled(KEY, """
                const/4 v0, 0x0
                invoke-interface { p3, v0 }, $EXPO_PROMISE->resolve(Ljava/lang/Object;)V
                return-void
            """)
        }

        val startup = AnalyticsStartupFingerprint.kickMatch("analytics startup").method
        startup.requireLocals(2)
        val initialization = startup.implementation!!.instructions.take(2).map {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
        }
        if (initialization != listOf(
                "Lio/github/jordanwoodson/extension/shared/settings/Settings;->init(Landroid/content/Context;)V",
                "Lio/github/jordanwoodson/extension/shared/kick/KickBundle;->init(Landroid/content/Context;)V",
            )) throw PatchException("Kick: settings must initialize before analytics collection")
        // Also restores Firebase's enabled default after switching the patch off and restarting.
        startup.addInstructions(2, """
            invoke-static/range { p0 .. p0 }, $FIREBASE->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;
            move-result-object v1
            ${isEnabled(KEY, "v0")}
            xor-int/lit8 v0, v0, 0x1
            invoke-virtual { v1, v0 }, $FIREBASE->setAnalyticsCollectionEnabled(Z)V
        """)

        // FingerprintJS Pro: Kick fingerprints the device through its own proxy on kick.com when a signed-in session
        // starts (tagged with the user ID and username, cached for a day) and for sign-up and age assurance, which
        // send the request ID to Kick. Blocked, the request fails the way the SDK reports a network error. Both entry
        // points keep the promise in p4 after seven locals: copy it low.
        listOf(FingerprintDataFingerprint to "FingerprintJS visitor data", FingerprintIdFingerprint to "FingerprintJS visitor ID")
            .forEach { (fingerprint, description) ->
                fingerprint.located(description, description.lowercase().replace(' ', '_')).apply {
                    requireLocals(3)
                    addInstructionsWithLabels(0, """
                        invoke-static { }, $PRIVACY->blockFingerprint()Z
                        move-result v0
                        if-eqz v0, :lurk_fpjs
                        move-object/from16 v0, p4
                        const-string v1, "Error: "
                        const-string v2, "NetworkError"
                        invoke-interface { v0, v1, v2 }, $REACT_PROMISE->reject(Ljava/lang/String;Ljava/lang/String;)V
                        return-void
                    """, ExternalLabel("lurk_fpjs", getInstruction(0)))
                }
            }

        kickSettings.add(
            SwitchSetting(KEY, "Disable analytics",
                "Turns off Firebase, Insider, Datadog, Mux, Datazoom and PAL. Kick's own requests, including playback, " +
                    "still run.",
                Section.PRIVACY, restart = true),
            SwitchSetting(BLOCK_FINGERPRINTING, "Block device fingerprinting",
                "Stops FingerprintJS Pro from identifying this device to Kick when signed in. Sign-up and age checks " +
                    "use it and can fail while this is on.",
                Section.PRIVACY, default = false),
        )
    }
}
