import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.brave.browser"
private const val PREFS = "Lorg/chromium/chrome/browser/settings/BraveOriginPreferences;"
private const val PREF_SERVICE = "Lorg/chromium/components/prefs/PrefService;"
private const val LOCAL_STATE_PREFS = "Lorg/chromium/chrome/browser/prefs/LocalStatePrefs;"
private const val BRAVE_REFERRER = "Lorg/chromium/chrome/browser/referrer/BraveReferrer;"
private const val NTP_BRIDGE = "Lorg/chromium/chrome/browser/ntp_background_images/NTPBackgroundImagesBridge;"
private const val ADS_SIGNUP_DIALOG = "Lorg/chromium/chrome/browser/dialogs/BraveAdsSignupDialog;"
private const val RETENTION_PUBLISHER =
    "Lorg/chromium/chrome/browser/notifications/retention/RetentionNotificationPublisher;"
private const val MAIN_PREFERENCES = "Lorg/chromium/chrome/browser/settings/BraveMainPreferencesBase;"
private const val SHARED_PREFS = "Landroid/content/SharedPreferences;"
private const val CRASH_CONSENT = "Chrome.Privacy.UsageAndCrashReportingPermittedByUser"

class BraveSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    private fun Instruction.referencesMethod(owner: String, name: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference as? MethodReference
        return ref?.definingClass == owner && ref.name == name
    }

    @Test
    fun `Brave Origin and the experimental Brave patches rewrite their gates`() {
        val root = repoRoot()
        val apk = File(root, "apks/brave/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.97.56",
            patchNames = setOf(
                "Brave Origin",
                "Disable telemetry",
                "Disable ads",
                "Hide promotional prompts",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        val allMethods: List<Method> = classes.flatMap { it.methods }

        fun methodWithString(value: String): Method = allMethods.firstOrNull { method ->
            method.implementation?.instructions?.any { it.referencesString(value) } == true
        } ?: error("no method references string '$value'")

        fun methodWithStringPrefix(prefix: String): Method = allMethods.firstOrNull { method ->
            method.instructions().any { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference
                ref is StringReference && ref.string.startsWith(prefix)
            }
        } ?: error("no method references a string starting with '$prefix'")

        // The credentials/subscription predicates are forced true.
        assertForcedBoolean(
            methodWithStringPrefix("getIsSubscriptionActive"),
            expected = true,
            label = "isSubscriptionActive(Profile)",
        )
        assertForcedBoolean(
            methodWithString("brave.origin.order_id_android"),
            expected = true,
            label = "hasValidSubscriptionTokens(Profile)",
        )
        assertForcedBoolean(
            methodWithString("brave_origin_credential_summary_cached"),
            expected = true,
            label = "credential summary cached",
        )

        // The credential summary request answers TRUE before reaching the SKUs service.
        val summaryRequest = methodWithString("SkusService is null, cannot request credential summary")
        val summaryHead = summaryRequest.instructions().take(3)
        assertTrue(
            summaryHead.map { it.opcode } ==
                listOf(Opcode.SGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID) &&
                ((summaryHead[0] as ReferenceInstruction).reference as FieldReference).name == "TRUE" &&
                summaryHead[1].referencesMethod("Lorg/chromium/base/Callback;", "onResult"),
            "requestCredentialSummary does not fire Boolean.TRUE immediately; head is " +
                summaryHead.map { it.opcode },
        )

        // The package/product writer is a no-op.
        val writer = allMethods.firstOrNull { method ->
            val strings = method.instructions()
                .filter { it.referencesString("brave.origin.package_name_android") }
            strings.isNotEmpty() &&
                method.instructions().any { it.referencesString("brave.origin.product_id_android") }
        } ?: error("package/product writer not found")
        assertReturnsEarlyVoid(writer, label = "Origin package/product writer")

        // The restart prompt launcher is a no-op.
        val launcher = classes.firstOrNull {
            it.type == "Lorg/chromium/chrome/browser/brave_origin/BraveOriginSettingsLauncherHelper;"
        } ?: error("BraveOriginSettingsLauncherHelper not found")
        assertReturnsEarlyVoid(
            launcher.method("showOriginSettingsForRestart"),
            label = "showOriginSettingsForRestart()",
        )

        // Gatekeepers now read SharedPreferences instead of the native policy service. The
        // patch replaces the whole body, so the old policy string is gone; find the rewritten
        // method by the pref key it now uses.
        val rewardsGate = allMethods.firstOrNull { method ->
            method.instructions().any { it.referencesString("brave_origin_off_BraveRewardsDisabled") }
        } ?: error("rewards gatekeeper with pref key not found")
        assertTrue(
            rewardsGate.instructions().any {
                it.referencesMethod("Landroid/preference/PreferenceManager;", "getDefaultSharedPreferences")
            },
            "rewards gatekeeper was not rewritten to read SharedPreferences",
        )

        // Preference listener: the managed switch binder stores state and returns.
        val prefs = classes.firstOrNull { it.type == PREFS }
            ?: error("BraveOriginPreferences not found")
        val binder = prefs.methods.firstOrNull { method ->
            method.instructions().any {
                it.referencesMethod("Landroid/preference/PreferenceManager;", "getDefaultSharedPreferences")
            }
        }
        assertTrue(binder != null, "BraveOriginPreferences listener was not rewritten")

        // The listener also drives the native P3A / usage ping prefs (no Java gatekeeper).
        assertTrue(
            binder!!.instructions().any { it.referencesString("brave.p3a.enabled") } &&
                binder.instructions().any { it.referencesString("brave.stats.reporting_enabled") } &&
                binder.instructions().any { it.isPrefSetBoolean() },
            "Origin listener does not write the native P3A / usage ping prefs",
        )

        // ── Disable telemetry (experimental) ─────────────────────────────────────────────
        val localState = classes.firstOrNull { it.type == LOCAL_STATE_PREFS }
            ?: error("LocalStatePrefs not found")
        val helper = localState.methods.firstOrNull { it.name == "morpheDisableTelemetry" }
            ?: error("telemetry helper was not added to LocalStatePrefs")
        // Each of the two prefs must be written with a register that was last set to 0.
        val helperInsns = helper.instructions()
        assertTrue(
            listOf("brave.p3a.enabled", "brave.stats.reporting_enabled").all { key ->
                val keyIndex = helperInsns.indexOfFirst { it.referencesString(key) }
                val call = helperInsns.drop(keyIndex + 1).firstOrNull { it.isPrefSetBoolean() }
                    as? FiveRegisterInstruction
                val valueRegister = call?.registerE
                val lastWrite = helperInsns.take(keyIndex).lastOrNull { insn ->
                    insn is NarrowLiteralInstruction &&
                        (insn as OneRegisterInstruction).registerA == valueRegister
                } as? NarrowLiteralInstruction
                keyIndex >= 0 && call != null && lastWrite?.narrowLiteral == 0
            },
            "telemetry helper does not write P3A / usage ping as false",
        )
        assertTrue(
            localState.method("setNativePrefsLoaded").instructions()
                .any { it.referencesMethod(LOCAL_STATE_PREFS, "morpheDisableTelemetry") },
            "setNativePrefsLoaded does not call the telemetry helper",
        )

        val crashConsentRead = allMethods.firstOrNull { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructions().any { it.referencesString(CRASH_CONSENT) }
        } ?: error("crash upload consent getter not found")
        assertForcedBoolean(crashConsentRead, expected = false, label = "crash upload consent")

        val crashConsentWrite = allMethods.firstOrNull { method ->
            method.parameterTypes.map(CharSequence::toString) == listOf("I", "Z") &&
                method.instructions().any { it.referencesString(CRASH_CONSENT) }
        } ?: error("crash upload consent writer not found")
        // const/4 0 must target p1 (the Z param), the last register of this static (IZ)V method.
        val consentHead = crashConsentWrite.instructions().first()
        val consentParamRegister = crashConsentWrite.implementation!!.registerCount - 1
        assertTrue(
            consentHead is NarrowLiteralInstruction && consentHead.opcode == Opcode.CONST_4 &&
                consentHead.narrowLiteral == 0 &&
                (consentHead as OneRegisterInstruction).registerA == consentParamRegister,
            "crash consent writer does not force p1 to false; first instruction is ${consentHead.opcode}",
        )

        // Find the promo-code mapper by shape, like the patch: the patched body no longer
        // contains its "urpc" / "gclid" strings.
        val referrer = classes.firstOrNull { it.type == BRAVE_REFERRER }
            ?: error("BraveReferrer not found")
        assertReturnsNull(
            referrer.methods.single { m ->
                m.returnType == "Ljava/lang/String;" &&
                    m.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/net/Uri;", "Ljava/lang/String;")
            },
            "BraveReferrer promo code",
        )

        // ── Disable ads (experimental) ───────────────────────────────────────────────────
        val ntpBridge = classes.firstOrNull { it.type == NTP_BRIDGE }
            ?: error("NTPBackgroundImagesBridge not found")
        assertReturnsNull(ntpBridge.method("createBrandedWallpaper"), "createBrandedWallpaper")

        val adsSignup = classes.firstOrNull { it.type == ADS_SIGNUP_DIALOG }
            ?: error("BraveAdsSignupDialog not found")
        assertForcedBoolean(
            adsSignup.methods.first { m ->
                m.returnType == "Z" && m.parameterTypes.isEmpty() &&
                    m.instructions().any { it.referencesString("should_show_onboarding_dialog_view_counter") }
            },
            expected = false,
            label = "Rewards ads signup dialog gate",
        )

        // ── Hide promotional prompts (experimental) ──────────────────────────────────────
        assertForcedBoolean(
            methodWithString("qa_force_rate_dialog"),
            expected = false,
            label = "rate dialog gate",
        )

        val retention = classes.firstOrNull { it.type == RETENTION_PUBLISHER }
            ?: error("RetentionNotificationPublisher not found")
        assertReturnsEarlyVoid(
            retention.methods.single { m ->
                m.name != "onReceive" && m.returnType == "V" &&
                    m.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/content/Context;", "Landroid/content/Intent;") &&
                    m.instructions().any { it.referencesString("notification_type") }
            },
            label = "retention notification poster",
        )

        assertPrefReadForced(
            allMethods.first { m ->
                m.instructions().any { it.referencesString("brave_default_app_open_counter") }
            },
            prefKey = "brave_default_timer_day",
            expected = -1,
            label = "default browser nag timer",
        )
        assertPrefReadForced(
            allMethods.first { m ->
                val insns = m.instructions()
                insns.withIndex().any { (i, insn) ->
                    insn.referencesString("should_show_search_widget_promo") &&
                        insns.drop(i + 1).take(5).any { it.referencesMethod(SHARED_PREFS, "getBoolean") }
                }
            },
            prefKey = "should_show_search_widget_promo",
            expected = 0,
            label = "search widget promo",
        )
        assertPrefReadForced(
            classes.first { it.type == MAIN_PREFERENCES }.methods.first { m ->
                m.instructions().any { it.referencesString("brave_vpn_callout") }
            },
            prefKey = "brave_vpn_callout",
            expected = 0,
            label = "VPN callout card",
        )
    }

    private fun Instruction.isPrefSetBoolean(): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        return ref.definingClass == PREF_SERVICE && ref.returnType == "V" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z")
    }

    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        val second = insns.getOrNull(1)
        assertTrue(
            first is NarrowLiteralInstruction && first.opcode == Opcode.CONST_4 &&
                first.narrowLiteral == 0 && second?.opcode == Opcode.RETURN_OBJECT,
            "$label does not return null immediately; head is ${insns.take(2).map { it.opcode }}",
        )
    }

    // After `const-string prefKey` the next SharedPreferences read's move-result is followed
    // by a const that overwrites the same register with the forced value.
    private fun assertPrefReadForced(method: Method, prefKey: String, expected: Int, label: String) {
        val insns = method.instructions()
        val keyIndex = insns.indexOfFirst { it.referencesString(prefKey) }
        assertTrue(keyIndex >= 0, "$label: '$prefKey' not found")
        val moveResult = insns.drop(keyIndex).firstOrNull { it.opcode == Opcode.MOVE_RESULT }
            as? OneRegisterInstruction ?: error("$label: no move-result after '$prefKey'")
        val forced = insns.getOrNull(insns.indexOf(moveResult as Instruction) + 1)
        assertTrue(
            forced is NarrowLiteralInstruction && forced.narrowLiteral == expected &&
                (forced as OneRegisterInstruction).registerA == moveResult.registerA,
            "$label: read of '$prefKey' is not forced to $expected; next is ${forced?.opcode}",
        )
    }
}
