package app.template.patches.truecaller.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val FEATURE_STATE = "Lcom/truecaller/featuretoggles/FeatureState;"
private const val SHARED_PREFERENCES = "Landroid/content/SharedPreferences;"

// The central feature-toggle resolver isEnabled(key, default state) (edo.a in 26.39.6), called
// from over 500 classes. Two twin resolvers share the signature but read a different store or
// only the default; this one reads the toggle SharedPreferences.
internal object FeatureToggleResolverFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", FEATURE_STATE),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getBoolean"),
    ),
)

// The twin resolver for the Firebase Remote Config experiment toggles (keys like
// "DisableWVMNotifications_65487"; h4k.a in 26.41.5): it switches on the default state and asks
// the remote config store through an interface getBoolean(key, default) (String, Z)Z. Unlike the
// resolver above it never touches SharedPreferences, and the third twin (default state only)
// makes no (String, Z)Z call.
internal object FirebaseFeatureToggleResolverFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", FEATURE_STATE),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf("Ljava/lang/String;", "Z"), returnType = "Z"),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.none { instruction ->
            when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                is MethodReference -> reference.definingClass == SHARED_PREFERENCES
                is TypeReference -> reference.type == SHARED_PREFERENCES
                else -> false
            }
        } == true
    },
)

/**
 * Throws unless some method still passes the toggle [key] to the [resolver], so an override of a
 * renamed or removed toggle fails the patch instead of silently changing nothing.
 */
internal fun BytecodePatchContext.requireFeatureToggleRead(
    key: String,
    resolver: Fingerprint = FeatureToggleResolverFingerprint,
) {
    val method = resolver.originalMethod
    val reads = Fingerprint(
        filters = listOf(
            string(key),
            methodCall(
                definingClass = method.definingClass,
                name = method.name,
                parameters = listOf("Ljava/lang/String;", FEATURE_STATE),
                returnType = "Z",
            ),
        ),
    ).matchAllOrNull().orEmpty()
    if (reads.isEmpty()) {
        throw PatchException("No method passes the feature toggle \"$key\" to ${method.definingClass}->${method.name}")
    }
}

/**
 * Makes the feature-toggle [resolver] return [value] for the toggle [key], whatever the server or
 * the default state says. Each call adds a self-contained check at the start of the resolver, so
 * patches that override different keys work together in any order.
 */
internal fun BytecodePatchContext.overrideFeatureToggle(
    key: String,
    value: Boolean,
    resolver: Fingerprint = FeatureToggleResolverFingerprint,
) {
    resolver.method.apply {
        // p1 is the key (compared null-safely); v0 is a local both resolvers write before reading.
        addInstructionsWithLabelsChecked(
            0,
            """
                const-string v0, "$key"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :resolve_toggle
                const/4 v0, ${if (value) "0x1" else "0x0"}
                return v0
            """,
            ExternalLabel("resolve_toggle", getInstruction(0)),
        )
    }
}

/** [requireFeatureToggleRead] then [overrideFeatureToggle] for each of [keys]. */
internal fun BytecodePatchContext.overrideReadFeatureToggles(
    keys: List<String>,
    value: Boolean,
    resolver: Fingerprint = FeatureToggleResolverFingerprint,
) {
    for (key in keys) {
        requireFeatureToggleRead(key, resolver)
        overrideFeatureToggle(key, value, resolver)
    }
}
