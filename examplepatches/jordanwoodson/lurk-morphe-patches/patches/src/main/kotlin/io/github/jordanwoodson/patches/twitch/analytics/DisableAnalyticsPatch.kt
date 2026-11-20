package io.github.jordanwoodson.patches.twitch.analytics

import io.github.jordanwoodson.patches.shared.Locators
import app.morphe.patcher.Fingerprint
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.hex
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "disable_analytics"
private const val PRIVACY = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchPrivacy;"

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops Twitch's native and React Native Spade event uploads, denies local analytics SDK " +
        "consent, enables Branch's limited tracking mode, blocks Crashlytics uploads, Nielsen audience pings and Sprig surveys, " +
        "and prevents Sentry initialization. Watch progress, viewing statistics and rewards may " +
        "stop updating; with Auto-claim channel points or Auto-claim Drops on, the minute-watched event that earns " +
        "channel points and progresses Drops still goes. Restart Twitch after changing this setting. Playback " +
        "requests still run.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchHermesPatch)

    execute {
        val event = SpadeEventFingerprint.twitchMatch("Spade event dispatcher").method
        val callbackType = event.parameterTypes[2].toString()
        val success = classDefBy(callbackType).methods.singleOrNull {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == "V" &&
                it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("Twitch: Spade callback has no unique success completion")
        // Coroutine callers await this callback. Complete success exactly once, including when no
        // network request is made; queued events pass null and need no completion. Minute-watched still goes
        // while Auto-claim channel points or Auto-claim Drops is on: channel points, bonus chests and Drops depend on it
        // (issue 69).
        event.addInstructionsIfEnabled(KEY, """
            move-object/from16 v1, p1
            invoke-static { v1 }, $PRIVACY->keepSpadeEvent(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :lurk_off
            move-object/from16 v1, p3
            if-eqz v1, :done
            const/4 v0, 0x0
            invoke-virtual { v1, v0 }, $callbackType->${success.name}(Ljava/lang/Object;)V
            :done
            return-void
        """, locals = 2)
        // Queued events upload in batches; minute-watched flushes the queue at once. Only kept events stay in it.
        SpadeBatchFingerprint.twitchMatch("Spade batch transport").method.addInstructionsIfEnabled(KEY, """
            invoke-static/range { p1 .. p1 }, $PRIVACY->keepSpadeBatch(Ljava/util/ArrayList;)Z
            move-result v0
            if-nez v0, :lurk_off
            return-void
        """)
        BranchEventFingerprint.twitchMatch("Branch analytics event").method.addInstructionsIfEnabled(KEY, "return-void")

        // Use Branch's own tracking-disabled state. Its queue completes denied operations with
        // error -117; allowed attribution-free link requests retain their existing completion.
        val branch = BranchInitializationFingerprint.twitchMatch("Branch tracking state initialization").method
        val branchInstructions = branch.implementation!!.instructions.toList()
        val trackingKey = branchInstructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "bnc_tracking_state"
        }
        val stateResult = (trackingKey + 1 until branchInstructions.size).firstOrNull {
            branchInstructions[it].opcode == Opcode.MOVE_RESULT
        } ?: throw PatchException("Twitch: Branch tracking-state preference read changed")
        if (branchInstructions.getOrNull(stateResult + 1)?.opcode != Opcode.IPUT_BOOLEAN) {
            throw PatchException("Twitch: Branch tracking-state field initialization changed")
        }
        val register = (branchInstructions[stateResult] as OneRegisterInstruction).registerA
        branch.addInstructions(stateResult + 1, """
            invoke-static/range { v$register .. v$register }, $PRIVACY->disableBranchTracking(Z)Z
            move-result v$register
        """)
        BranchTrackingSetterFingerprint.twitchMatch("Branch tracking state setter").method.addInstructions(0, """
            invoke-static/range { p2 .. p2 }, $PRIVACY->disableBranchTracking(Z)Z
            move-result p2
        """)

        val consent = UserDataConsentFingerprint.twitchMatch("local user data consent").classDef
        val comscore = consent.methods.singleOrNull {
            it.parameterTypes.isEmpty() && it.returnType == "Z"
        } ?: throw PatchException("Twitch: no unique ComScore permission")
        comscore.addInstructionsIfEnabled(KEY, "const/4 v0, 0x0\nreturn v0")
        val vendor = VendorConsentFingerprint.twitchMatch("SDK vendor consent lookup").method
        if (vendor.parameterTypes[0].toString() != consent.type) {
            throw PatchException("Twitch: vendor consent lookup uses an unexpected data model")
        }
        val denied = vendor.implementation!!.instructions.mapNotNull {
            if (it.opcode == Opcode.SGET_OBJECT) (it as ReferenceInstruction).reference as? FieldReference else null
        }.singleOrNull { it.name == "Denied" && it.type == vendor.returnType }
            ?: throw PatchException("Twitch: vendor lookup has no unique denied fallback")
        // This changes SDK decisions locally. The stored/server vendor preferences remain intact.
        vendor.addInstructionsIfEnabled(KEY, "sget-object v0, $denied\nreturn-object v0")

        val sentry = SentryInitializationFingerprint.twitchMatch("Sentry initialization").method
        sentry.addInstructionsIfEnabled(KEY, "return-void")
        sentry.addInstructions(0, "invoke-static/range { p0 .. p0 }, $PRIVACY->initSettingsOnce(Landroid/content/Context;)V")
        // Providers run before Application.onCreate. Initialize settings from the provider context
        // explicitly, so both saved off values and patch defaults apply at this early boundary.
        listOf("Lio/sentry/android/core/SentryInitProvider;",
            "Lio/sentry/android/core/SentryPerformanceProvider;", "Lio/sentry/ndk/SentryNdkPreloadProvider;").forEach { type ->
            val provider = Fingerprint(definingClass = type, name = "onCreate", returnType = "Z", parameters = emptyList())
                .twitchMatch("Sentry startup provider $type").method
            provider.addInstructionsIfEnabled(KEY, "const/4 v0, 0x1\nreturn v0")
            provider.addInstructions(0, """
                invoke-virtual/range { p0 .. p0 }, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-static { v0 }, $PRIVACY->initSettingsOnce(Landroid/content/Context;)V
            """)
        }

        // Firebase initializes before Application.onCreate, and Twitch then explicitly enables
        // Crashlytics. Keep Firebase/Messaging alive while overriding the crash upload permission.
        val firebaseProviderType = classDefBy("Ltv/twitch/android/app/consumer/TwitchFirebaseProvider;").superclass
            ?: throw PatchException("Twitch: Firebase provider has no superclass")
        val firebaseProvider = Fingerprint(definingClass = firebaseProviderType,
            name = "onCreate", returnType = "Z", parameters = emptyList()).twitchMatch("Firebase initialization provider").method
        firebaseProvider.addInstructions(0, """
            invoke-virtual/range { p0 .. p0 }, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;
            move-result-object v0
            invoke-static { v0 }, $PRIVACY->initSettingsOnce(Landroid/content/Context;)V
        """)
        val arbiter = CrashlyticsArbiterFingerprint.twitchMatch("Crashlytics automatic collection arbiter").classDef
        val permission = arbiter.methods.singleOrNull { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            ?: throw PatchException("Twitch: Crashlytics collection permission changed")
        Locators.record("twitch.disable_analytics.crashlytics_permission", permission)
        permission.addInstructionsIfEnabled(KEY, "const/4 v0, 0x0\nreturn v0")
        val crashlytics = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
        Fingerprint(definingClass = crashlytics, name = "setCrashlyticsCollectionEnabled", returnType = "V", parameters = listOf("Z"))
            .twitchMatch("Crashlytics primitive collection setter").method.addInstructions(0, """
                invoke-static/range { p1 .. p1 }, $PRIVACY->allowAnalyticsCollection(Z)Z
                move-result p1
            """)
        Fingerprint(definingClass = crashlytics, name = "setCrashlyticsCollectionEnabled", returnType = "V", parameters = listOf("Ljava/lang/Boolean;"))
            .twitchMatch("Crashlytics nullable collection setter").method.addInstructions(0, """
                invoke-static/range { p1 .. p1 }, $PRIVACY->allowAnalyticsCollectionBoxed(Ljava/lang/Boolean;)Ljava/lang/Boolean;
                move-result-object p1
            """)
        // These are fire-and-forget APIs; no Task or callback is left unresolved. The arbiter also
        // prevents stored reports being sent during startup before these public setters run.
        mutableClassDefBy(crashlytics).methods.filter { it.returnType == "V" &&
            it.name in setOf("sendUnsentReports", "log", "recordException", "setUserId", "setCustomKey", "setCustomKeys") &&
            it.implementation != null }.forEach { method ->
            // Some optimized overloads have no locals for the switch lookup: setCustomKeys only
            // throws, and every setCustomKey overload hands its key to the method guarded below.
            val locals = method.implementation!!.registerCount - 1 - method.parameterTypes.sumOf {
                if (it.toString() in setOf("J", "D")) 2 else 1
            }
            if (locals >= 1) method.addInstructionsIfEnabled(KEY, "return-void")
        }
        val stringPair = listOf("Ljava/lang/String;", "Ljava/lang/String;")
        val setCustomKey = mutableClassDefBy(crashlytics).methods.single {
            it.name == "setCustomKey" && it.parameterTypes.map { type -> type.toString() } == stringPair
        }
        val storeKey = setCustomKey.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.singleOrNull { it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == stringPair }
            ?: throw PatchException("Twitch: Crashlytics custom key storage changed")
        mutableClassDefBy(storeKey.definingClass).methods.single {
            it.name == storeKey.name && it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == stringPair
        }.addInstructionsIfEnabled(KEY, "return-void")

        // Synchronous reporter methods return undefined; the reporter object and its page/session
        // APIs stay available. Identify anonymous/shared names by unique actual instruction anchors.
        val enqueue = twitchHermes.matchingFunction(hex("34 05 00 89 08 01 34 06 01 3b 09 06 0a"))
        if (enqueue.name != "enqueue") throw PatchException("Twitch: unexpected Spade enqueue function")
        twitchHermes.returnUndefined(enqueue, KEY)
        val flush = twitchHermes.matchingFunction(hex("34 03 00 93 00 93 0c 93 05 3b 01 03 21"))
        if (flush.name != "flush") throw PatchException("Twitch: unexpected Spade flush function")
        twitchHermes.returnUndefined(flush, KEY)

        // Nielsen audience measurement and Sprig surveys report outside Spade and the consent model.
        NielsenPingFingerprint.twitchMatch("Nielsen ping").method.addInstructionsIfEnabled(KEY, "return-void")
        SprigConfigureFingerprint.twitchMatch("Sprig configuration").method.addInstructionsIfEnabled(KEY, "return-void")

        twitchSettings.add(SwitchSetting(KEY, "Disable analytics",
            "Stops Spade, Nielsen and Sprig, limits Branch tracking, denies SDK consent, disables Crashlytics uploads and Sentry. Watch progress/rewards may be affected; Auto-claim channel points and Auto-claim Drops keep the watch-time event that earns points and Drops.",
            Section.PRIVACY, restart = true))
    }
}
