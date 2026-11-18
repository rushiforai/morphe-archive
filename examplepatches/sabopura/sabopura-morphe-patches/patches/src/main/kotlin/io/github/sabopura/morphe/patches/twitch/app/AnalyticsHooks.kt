package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val ANALYTICS = "Lio/github/sabopura/morphe/extension/twitch/app/Analytics;"
private const val SENTRY = "Lio/sentry/android/core/SentryAndroid;"
private const val SPRIG = "Lcom/userleap/UserLeap;"
private const val NIELSEN_PING = "Ltv/twitch/android/shared/nielsen/NielsenS2SApi\$NielsenS2SService;->firePing"
private const val COMSCORE_START = "Lcom/comscore/Analytics;->start(Landroid/content/Context;)V"

private fun Method.callsPrefix(prefix: String) =
    implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString()?.startsWith(prefix) == true } == true

private fun MutableMethod.exitWhenAnalyticsOff(what: String, exit: String = "return-void") {
    requireLocal(what)
    addInstructionsWithLabels(0, """
        invoke-static {}, $ANALYTICS->off()Z
        move-result v0
        if-eqz v0, :run
        $exit
    """, ExternalLabel("run", getInstruction(0)))
}

private fun MutableMethod.parameterWords() = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 as Int } + 1

internal val disableAnalyticsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        // Every event passes this dispatcher, including the batched ones, so gating by name keeps
        // the batch uploads alive for the events that stay.
        methodWith("Spade event dispatcher", "branch_campaign", "mweb_device_id", "x_untrusted_minute-watched_spade") {
            it.returnType == "V" && it.parameterTypes.size == 4 && it.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                it.parameterTypes[1].toString() == "Ljava/util/LinkedHashMap;" && it.parameterTypes[3].toString() == "Z"
        }.apply {
            val callback = parameterTypes[2].toString()
            val callbackType = classDefBy(callback)
            val invoke = if (AccessFlags.INTERFACE.isSet(callbackType.accessFlags)) "invoke-interface" else "invoke-virtual"
            val success = callbackType.methods.filter {
                AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == "V" &&
                    it.parameterTypes.singleOrNull()?.toString() == "Ljava/lang/Object;"
            }.uniqueContract("Spade callback success")
            if (implementation!!.registerCount - parameterWords() < 2) throw PatchException("Twitch: Spade dispatcher has too few locals")
            // Coroutine callers await this callback, so a dropped event still completes it.
            addInstructionsWithLabels(0, """
                invoke-static/range {p1 .. p1}, $ANALYTICS->dropEvent(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :keep
                move-object/from16 v1, p3
                if-eqz v1, :done
                const/4 v0, 0x0
                $invoke {v1, v0}, $callback->${success.name}(Ljava/lang/Object;)V
                :done
                return-void
            """, ExternalLabel("keep", getInstruction(0)))
        }

        // Only custom events go through here; Branch's session and the start screen's wait are untouched.
        methodWith("Branch custom event", "branch_event_name") {
            it.returnType == "V" && it.parameterTypes.singleOrNull()?.toString() == "Ljava/lang/String;"
        }.exitWhenAnalyticsOff("Branch custom event")

        val arbiter = classesWithStrings("com.google.firebase.crashlytics", "firebase_crashlytics_collection_enabled")
            .uniqueContract("Crashlytics collection setting")
        mutableClassDefBy(arbiter).methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
            .uniqueContract("Crashlytics collection flag")
            .exitWhenAnalyticsOff("Crashlytics collection flag", "const/4 v0, 0x0\nreturn v0")

        classDefByOrNull(SENTRY)?.let { sentry ->
            mutableClassDefBy(sentry).methods.single { m ->
                m.name == "init" && m.parameterTypes.map { it.toString() } ==
                    listOf("Landroid/content/Context;", "Lio/sentry/ILogger;", "Lio/sentry/Sentry\$OptionsConfiguration;")
            }.exitWhenAnalyticsOff("Sentry start")
        }

        methodsMatching { it.returnType == "V" && it.callsPrefix(NIELSEN_PING) }.uniqueContract("Nielsen ping")
            .let { (owner, found) -> mutable(owner, found).exitWhenAnalyticsOff("Nielsen ping") }

        // The only overload Twitch calls; without it Sprig has no environment to send to.
        mutableClassDefBy(SPRIG).methods.filter { m ->
            m.name == "configure" && m.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;", "Ljava/lang/String;")
        }.uniqueContract("Sprig configure").exitWhenAnalyticsOff("Sprig configure")

        methodsMatching { it.returnType == "V" && it.callsPrefix(COMSCORE_START) }.uniqueContract("comScore start")
            .let { (owner, found) -> mutable(owner, found).exitWhenAnalyticsOff("comScore start") }
    }
}
