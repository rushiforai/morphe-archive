package app.ahmedyarub.patches.x.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly

private const val FEATURE_FLAGS_CLASS = "$EXTENSION_PACKAGE/FeatureFlags;"

/**
 * The one method every server feature switch read goes through: the typed getters of the
 * repository, and its peek variants, all delegate to it. Its name survives R8.
 */
private object GetFeatureSwitchValueFingerprint : Fingerprint(
    definingClass = "Lcom/x/featureswitches/FeatureSwitchesRepositoryImpl;",
    name = "getFeatureSwitchValue",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

private object ForcedFlagsExtensionFingerprint : Fingerprint(
    definingClass = FEATURE_FLAGS_CLASS,
    name = "forcedFlags",
)

private val forcedFlags = linkedMapOf<String, String>()

private val SAFE_KEY = Regex("[A-Za-z0-9_.:-]+")
private val SAFE_VALUE = Regex("[A-Za-z0-9_.:,/+@-]*")

/**
 * Makes the app read [value] for the feature switch [key]. Called from the execute block of a
 * patch that depends on [featureFlagsPatch]. The value must have the type the app reads the
 * switch as: a getter handed another type silently falls back to its default.
 */
internal fun forceFeatureFlag(key: String, value: Any) {
    // The flags are written into the extension as one smali string, so keys and values keep to
    // characters it takes as they are, and to none of the separators.
    if (!key.matches(SAFE_KEY)) throw PatchException("Invalid feature switch key: $key")

    forcedFlags[key] = when (value) {
        is Boolean -> "b:$value"
        is Int, is Long -> "l:$value"
        is Float, is Double -> "d:$value"
        is String -> if (!value.matches(SAFE_VALUE)) throw PatchException("Invalid value for $key: $value") else "s:$value"
        else -> throw PatchException("Unsupported value type for $key: ${value::class.simpleName}")
    }
}

val featureFlagsPatch = bytecodePatch(
    description = "Lets the patches force feature switch values.",
) {
    dependsOn(xExtensionPatch)

    execute {
        forcedFlags.clear()

        // A forced value is returned before the app looks the switch up, which also skips the
        // experiment impression it would log.
        GetFeatureSwitchValueFingerprint.method.addInstructionsWithLabels(
            0,
            """
            invoke-static { p1 }, $FEATURE_FLAGS_CLASS->getOverride(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            """,
            ExternalLabel("original", GetFeatureSwitchValueFingerprint.method.getInstruction(0)),
        )
    }

    // After every patch has registered its flags.
    finalize {
        ForcedFlagsExtensionFingerprint.method.returnEarly(
            forcedFlags.entries.joinToString(";") { (key, value) -> "$key=$value" },
        )
    }
}
