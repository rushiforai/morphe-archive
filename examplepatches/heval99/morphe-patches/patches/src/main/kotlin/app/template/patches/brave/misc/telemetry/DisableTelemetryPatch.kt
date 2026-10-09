package app.template.patches.brave.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.returnEarly
import app.template.patches.brave.LocalStatePrefsGetterFingerprint
import app.template.patches.brave.LocalStatePrefsLoadedFingerprint
import app.template.patches.brave.P3A_ENABLED_PREF
import app.template.patches.brave.PrefServiceSetBooleanFingerprint
import app.template.patches.brave.STATS_REPORTING_ENABLED_PREF
import app.template.patches.shared.Constants.COMPATIBILITY_BRAVE_EXPERIMENTAL
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val CRASH_CONSENT_PREF = "Chrome.Privacy.UsageAndCrashReportingPermittedByUser"
private const val HELPER_METHOD_NAME = "morpheDisableTelemetry"

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Experimental: turns off P3A analytics and the usage ping on every start " +
        "(overriding the in-app switches), stops crash report uploads and drops the " +
        "install-referrer attribution code.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BRAVE_EXPERIMENTAL)

    execute {
        // ── 1. P3A + usage ping: force the native local-state prefs off on every start ────
        //
        //  Both are on by default and their uploaders are native, so the only Java lever is the
        //  local-state pref they read. setNativePrefsLoaded() has just two registers, so the
        //  writes go into a new static helper that it calls right after flagging prefs loaded.
        val getter = LocalStatePrefsGetterFingerprint.originalMethod
        val setter = PrefServiceSetBooleanFingerprint.originalMethod
        val setBoolean = "${setter.definingClass}->${setter.name}(Ljava/lang/String;Z)V"

        val prefsLoaded = LocalStatePrefsLoadedFingerprint.method
        val localStatePrefs = LocalStatePrefsLoadedFingerprint.classDef
        val helper = ImmutableMethod(
            localStatePrefs.type,
            HELPER_METHOD_NAME,
            emptyList<MethodParameter>(),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, ${getter.definingClass}->${getter.name}()${getter.returnType}
                    move-result-object v0
                    if-eqz v0, :done
                    const/4 v2, 0x0
                    const-string v1, "$P3A_ENABLED_PREF"
                    invoke-virtual {v0, v1, v2}, $setBoolean
                    const-string v1, "$STATS_REPORTING_ENABLED_PREF"
                    invoke-virtual {v0, v1, v2}, $setBoolean
                    const/4 v2, 0x1
                    const-string v1, "brave.p3a.notice_acknowledged"
                    invoke-virtual {v0, v1, v2}, $setBoolean
                    :done
                    return-void
                """,
            )
        }
        localStatePrefs.methods.add(helper)

        // Call it right after the "prefs loaded" flag is set (the getter returns null before
        // that). Not at the final return-void: the runnable loop jumps straight to that label.
        val loadedFlagIndex = prefsLoaded.implementation!!.instructions
            .indexOfFirst { it.opcode == Opcode.SPUT_BOOLEAN }
        check(loadedFlagIndex >= 0) { "LocalStatePrefs loaded flag not found" }
        prefsLoaded.addInstruction(
            loadedFlagIndex + 1,
            "invoke-static {}, ${localStatePrefs.type}->$HELPER_METHOD_NAME()V",
        )

        // ── 2. Crash uploads: report the user's crash-upload consent as "not permitted" ────
        //
        //  m9f.c() reads the consent pref for MinidumpUploadCallable and the upload job. A fresh
        //  install sets it to true from onboarding without a tap; the writer is pinned to false
        //  too so the stored pref and the native consent agree.
        Fingerprint(
            returnType = "Z",
            parameters = emptyList(),
            strings = listOf(CRASH_CONSENT_PREF),
        ).method.returnEarly(false)

        Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = "V",
            parameters = listOf("I", "Z"),
            strings = listOf(CRASH_CONSENT_PREF),
        ).method.addInstruction(0, "const/4 p1, 0x0")

        // ── 3. Install referrer: never turn the Play referrer into a promo/attribution code ─
        //
        //  BraveReferrer.c(Uri, String) maps gclid/gbraid/urpc to the code native sends to the
        //  referral API and the usage ping. null makes the caller skip writing the promoCode file.
        Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/referrer/BraveReferrer;",
            returnType = "Ljava/lang/String;",
            parameters = listOf("Landroid/net/Uri;", "Ljava/lang/String;"),
            strings = listOf("urpc", "gclid"),
        ).method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
