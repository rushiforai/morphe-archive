package app.template.patches.firefoxfocus.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// What Focus 158.0 sends, and what is left alone:
//  - Glean starts with upload off (GleanMetricsService.isTelemetryEnabled is a constant false), so
//    its regular pings, the activation ping and the search-ads telemetry are never sent and the
//    ads/search/cookies helper extensions are never installed (R8 removed their install code).
//  - The usage-reporting ping does not follow that switch: it has its own "Daily usage ping"
//    setting, on by default. Steps 1 and 2 stop it whatever the setting says; step 3 makes the
//    setting default to off.
//  - Nimbus downloads experiment recipes from Remote Settings at every start. Step 4 stops that.
//  - Crash reports (Sentry, Socorro) are only sent when the user taps Send in the crash prompt,
//    and caught exceptions are never sent. The prompt and its consent are not changed.
private val USAGE_PING_METHODS = setOf("submitPing", "requestDataDeletion")

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables the usage ping and experiments.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    execute {
        // 1. The usage reporting service never starts: no ping enabled, no usage profile id, no
        // lifecycle observer.
        UsageReportingStartFingerprint.method.returnEarly()

        // 2. Every implementation of the usage reporting API sends nothing: submitPing (the
        // observer's ping) and requestDataDeletion (the deletion-request ping the Settings switch
        // sends when it is turned off; R8 inlined stop() into the switch).
        val stubbed = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (USAGE_REPORTING_API !in classDef.interfaces) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in USAGE_PING_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    it.returnEarly()
                    stubbed += it.name
                }
        }
        val missing = USAGE_PING_METHODS - stubbed
        if (missing.isNotEmpty()) {
            throw PatchException("No $USAGE_REPORTING_API implementation has a concrete void ${missing.joinToString()}")
        }

        // 3. The "Daily usage ping" setting defaults to off, so the switch shows what the patch does.
        // The delegate's default lambda is created with false: the const goes right before the
        // lambda's <init>(Z), the last one before the BooleanPreference <init> that takes it.
        val settingsInit = SettingsInitFingerprint.method
        val instructions = settingsInit.instructions
        fun MethodReference.isInit(owner: String? = null) = name == "<init>" && (owner == null || definingClass == owner)
        fun callAt(index: Int) = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        val store = SettingsInitFingerprint.instructionMatches.first().index
        val preferenceInit = (store - 1 downTo 0).firstOrNull { callAt(it)?.isInit(BOOLEAN_PREFERENCE) == true }
            ?: throw PatchException("No BooleanPreference <init> before the $DAILY_USAGE_PING_DELEGATE store")
        val defaultLambda = (instructions[preferenceInit] as FiveRegisterInstruction).registerE
        val lambdaInit = (preferenceInit - 1 downTo 0).firstOrNull {
            instructions[it].opcode == Opcode.INVOKE_DIRECT && callAt(it)?.isInit() == true &&
                callAt(it)!!.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                (instructions[it] as FiveRegisterInstruction).registerC == defaultLambda
        } ?: throw PatchException("The $DAILY_USAGE_PING_DELEGATE default lambda is not created with a boolean")
        // A label on the lambda's <init> would stay on it and let a jump skip the const.
        if (instructions[lambdaInit].location.labels.isNotEmpty()) {
            throw PatchException("The $DAILY_USAGE_PING_DELEGATE default lambda <init> is a branch target")
        }
        // A non-range invoke argument is always v0-v15, so const/4 fits.
        val defaultRegister = (instructions[lambdaInit] as FiveRegisterInstruction).registerD
        settingsInit.addInstructionsChecked(lambdaInit, "const/4 v$defaultRegister, 0x0")

        // 4. Nimbus never fetches experiments. It still starts from the bundled (empty) recipes,
        // so every feature reads its default value.
        NimbusFetchExperimentsFingerprint.method.returnEarly()
    }
}
