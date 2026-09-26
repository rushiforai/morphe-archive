/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val MAP_PREF = "Lapp/morphe/ather/MapPref;"

private const val ANALYTICS_CONTEXT = "Lcom/ather/analytics/b;"

private const val POSTHOG_INIT = "Lcom/ather/ci/navigation/destinations/g;"
private const val POSTHOG_APPLICATION_CONTEXT =
    "Landroid/content/Context;->getApplicationContext()Landroid/content/Context;"
private const val POSTHOG_CONFIG_APPLY = "Lcom/posthog/b;->g(Lcom/posthog/h;)V"

private const val RETURN_VOID = "return-void"

/**
 * Unit is returned by the event logger, so the guard has to return it too.
 */
private const val RETURN_UNIT = "sget-object v0, Lkotlin/z;->a:Lkotlin/z;\n\nreturn-object v0"

/**
 * Matches the Bluetooth analytics logger.
 *
 * ```
 * public final logEvent(AnalyticsEvent): Unit
 * ```
 */
internal object PeripheralAnalyticsLoggerFingerprint : Fingerprint(
    definingClass = "Lcom/aptener/bluconnect/app/peripheral/usecase/PeripheralAnalyticsLogger;",
    name = "logEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lkotlin/z;",
    parameters = listOf("Lcom/aptener/bluconnect/app/peripheral/usecase/AnalyticsEvent;"),
)

/**
 * Matches the MoEngage dispatcher, which holds the application context.
 *
 * ```
 * public final a(c, List): void
 * ```
 */
internal object AnalyticsDispatcherFingerprint : Fingerprint(
    definingClass = ANALYTICS_CONTEXT,
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/ather/analytics/c;", "Ljava/util/List;"),
)

/**
 * Matches the Firebase event logger.
 *
 * ```
 * public static final logAnalyticEvent(String, EventType, HashMap, Double, CommonCustomParam): void
 * ```
 */
internal object FirebaseEventFingerprint : Fingerprint(
    definingClass = "Lcom/ather/firebase/analytics/AnalyticsKt;",
    name = "logAnalyticEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/ather/firebase/analytics/EventType;",
        "Ljava/util/HashMap;",
        "Ljava/lang/Double;",
        "Lcom/ather/firebase/analytics/CommonCustomParam;",
    ),
)

/**
 * Matches the analytics service dispatcher.
 *
 * ```
 * public final a(c): void
 * ```
 */
internal object AnalyticsServiceFingerprint : Fingerprint(
    definingClass = "Lcom/ather/analytics/service/b;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/ather/analytics/c;"),
)

/**
 * Matches the PostHog initialiser.
 *
 * ```
 * public final invoke(Object): Object
 * ```
 */
internal object PostHogInitFingerprint : Fingerprint(
    definingClass = POSTHOG_INIT,
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/**
 * Blocks the analytics events the app sends.
 *
 * The app has no setting to turn event reporting off. Every event passes through one of these
 * four entry points, so the patch returns from each one while the Morphe setting is off.
 * PostHog is initialised from the app's startup path, so the patch skips its initialiser too.
 * Crashlytics is left alone, so crashes stay reportable.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321), inserted at the start of each
 * entry point:
 * ```
 * invoke-static {}, Lapp/morphe/ather/MapPref;->analyticsEnabled()Z
 * move-result v0
 * if-nez v0, :morphe_analytics_on
 * return-void
 * :morphe_analytics_on
 * ```
 * and inserted before the PostHog initialiser:
 * ```
 * invoke-static {}, Lapp/morphe/ather/MapPref;->analyticsEnabled()Z
 * move-result v0
 * if-eqz v0, :morphe_posthog_skip
 * ```
 */
@Suppress("unused")
val analyticsTogglePatch = bytecodePatch(
    name = "Analytics toggle",
    description = "Blocks MoEngage, PostHog and Firebase events while the Morphe setting is off. " +
        "Crashlytics is untouched so bugs stay reportable.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        PeripheralAnalyticsLoggerFingerprint.method.guardAnalytics(RETURN_UNIT)
        AnalyticsDispatcherFingerprint.method.guardAnalyticsWithContext(RETURN_VOID)
        FirebaseEventFingerprint.method.guardAnalytics(RETURN_VOID)
        AnalyticsServiceFingerprint.method.guardAnalytics(RETURN_VOID)
        PostHogInitFingerprint.method.skipPostHogInit()
    }
}

/**
 * Skips the PostHog initialiser while analytics is off.
 *
 * The initialiser runs inside a `monitor-enter` block, so the guard jumps to the instruction
 * after the block, which releases the monitor. The guard itself sits before the block: reading
 * the setting cannot throw, and the monitor is not held while it is read.
 */
private fun MutableMethod.skipPostHogInit() {
    val body = implementation ?: throw IllegalStateException(
        "PostHog initialiser has no body to patch.",
    )

    val guardIndex = body.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
            POSTHOG_APPLICATION_CONTEXT
    }
    if (guardIndex < 0) {
        throw IllegalStateException("PostHog initialiser does not read the application context.")
    }

    val initEndIndex = body.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == POSTHOG_CONFIG_APPLY
    }
    if (initEndIndex < 0) {
        throw IllegalStateException("PostHog initialiser does not apply its configuration.")
    }

    addInstructionsWithLabels(
        guardIndex,
        """
            invoke-static {}, $MAP_PREF->analyticsEnabled()Z
            move-result v0
            if-eqz v0, :morphe_posthog_skip
        """.trimIndent(),
        ExternalLabel("morphe_posthog_skip", getInstruction(initEndIndex + 1)),
    )
}

/**
 * Returns from the method while analytics is off.
 *
 * The setting is read through the application context the app already holds.
 */
private fun MutableMethod.guardAnalytics(returnSmali: String) {
    addAnalyticsGuard(
        returnSmali,
        """
            invoke-static {}, $MAP_PREF->analyticsEnabled()Z
            move-result v0
            if-nez v0, :morphe_analytics_on
        """.trimIndent(),
    )
}

/**
 * Returns from the method while analytics is off.
 *
 * The setting is read through the context the caller holds in field `a`.
 */
private fun MutableMethod.guardAnalyticsWithContext(returnSmali: String) {
    addAnalyticsGuard(
        returnSmali,
        """
            iget-object v0, p0, $ANALYTICS_CONTEXT->a:Landroid/content/Context;
            invoke-static {v0}, $MAP_PREF->analyticsEnabled(Landroid/content/Context;)Z
            move-result v0
            if-nez v0, :morphe_analytics_on
        """.trimIndent(),
    )
}

/**
 * Inserts a guard at the start of the method and resumes the original body when analytics is on.
 */
private fun MutableMethod.addAnalyticsGuard(returnSmali: String, guard: String) {
    val body = implementation ?: throw IllegalStateException(
        "Analytics entry point has no body to patch.",
    )
    if (body.instructions.isEmpty()) {
        throw IllegalStateException("Analytics entry point is empty.")
    }

    addInstructionsWithLabels(
        0,
        """
            $guard

            $returnSmali
        """.trimIndent(),
        ExternalLabel("morphe_analytics_on", getInstruction(0)),
    )
}
