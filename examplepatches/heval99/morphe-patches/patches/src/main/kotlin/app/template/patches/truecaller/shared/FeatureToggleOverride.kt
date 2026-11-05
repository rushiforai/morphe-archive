package app.template.patches.truecaller.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import com.android.tools.smali.dexlib2.AccessFlags

private const val FEATURE_STATE = "Lcom/truecaller/featuretoggles/FeatureState;"

// Every feature-toggle resolver isEnabled(key, default state). 26.42.5 has three with this
// signature: the SharedPreferences store (doo.a, ~1040 call sites), the Firebase Remote Config
// experiments such as "DisableWVMNotifications_65487" (f5k.a, ~100) and a default-only one (rpq.a,
// 9). 26.42.5 added the same local override read (SharedPreferences contains + getBoolean) to all
// three, so the store each one reads no longer tells them apart; every override goes into every
// resolver instead, and a key only reaches the one it is read through.
internal object FeatureToggleResolverFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", FEATURE_STATE),
    custom = { method, _ -> method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) },
)

/** Every concrete feature-toggle resolver; fails when there is none. */
private fun BytecodePatchContext.featureToggleResolvers(): List<MutableMethod> =
    FeatureToggleResolverFingerprint.matchAllOrNull().orEmpty().map { it.method }.ifEmpty {
        throw PatchException("No feature toggle resolver (String, FeatureState)Z found")
    }

/**
 * Throws unless some method still passes the toggle [key] to a toggle resolver, so an override of
 * a renamed or removed toggle fails the patch instead of silently changing nothing.
 */
internal fun BytecodePatchContext.requireFeatureToggleRead(key: String) {
    val reads = Fingerprint(
        filters = listOf(
            string(key),
            methodCall(parameters = listOf("Ljava/lang/String;", FEATURE_STATE), returnType = "Z"),
        ),
    ).matchAllOrNull().orEmpty()
    if (reads.isEmpty()) {
        throw PatchException("No method passes the feature toggle \"$key\" to a feature toggle resolver")
    }
}

/**
 * Makes every feature-toggle resolver return [value] for the toggle [key], whatever the server,
 * the local override or the default state says. Each call adds a self-contained check at the start
 * of each resolver, so patches that override different keys work together in any order.
 *
 * With a Heval Controls [featureId], the override applies only while that feature is on: a
 * matching key asks `HevalSettings.isEnabled(featureId)` and, when it answers false, resolves the
 * toggle as stock. Other keys never reach the gate, so the hot resolver path stays as cheap as it
 * was.
 */
internal fun BytecodePatchContext.overrideFeatureToggle(key: String, value: Boolean, featureId: String? = null) {
    if (featureId != null) require(HevalFeature.ID_REGEX.matches(featureId)) { "Invalid Patch settings feature id: $featureId" }
    // const-string, /range invoke and move-result take any v0; the gate goes between the key match
    // and the forced value.
    val gate = featureId?.let { id ->
        """
            const-string v0, "$id"
            invoke-static/range {v0 .. v0}, $HEVAL_SETTINGS_CLASS->isEnabled(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :resolve_toggle
        """
    }.orEmpty()
    for (resolver in featureToggleResolvers()) {
        // v0 must be a local, not this/key/state (a thin wrapper without locals would be clobbered).
        if (resolver.implementation!!.registerCount <= 3) {
            throw PatchException("Feature toggle resolver $resolver has no local register for the override")
        }
        // p1 is the key (compared null-safely); v0 is a local every resolver writes before reading.
        resolver.addInstructionsWithLabelsChecked(
            0,
            """
                const-string v0, "$key"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :resolve_toggle
            """ + gate + """
                const/4 v0, ${if (value) "0x1" else "0x0"}
                return v0
            """,
            ExternalLabel("resolve_toggle", resolver.getInstruction(0)),
        )
    }
}

/** [requireFeatureToggleRead] then [overrideFeatureToggle] for each of [keys]. */
internal fun BytecodePatchContext.overrideReadFeatureToggles(keys: List<String>, value: Boolean, featureId: String? = null) {
    for (key in keys) {
        requireFeatureToggleRead(key)
        overrideFeatureToggle(key, value, featureId)
    }
}
