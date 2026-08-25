package app.aimal.patches.crunchyroll

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ── Speed control ──

object PlaybackSpeedConfigToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("PlaybackSpeedConfigurationImpl(isEnabled="),
    ),
)

/**
 * The player-settings view model constructor, which builds the default
 * playback-speed table as a `Float[]` of {1.0, 0.75, 0.5}.
 *
 * An earlier version matched this on three field-name strings ("storage",
 * "subtitlesSettingsViewModel", "audioSettingsViewModel"). R8 moved two of
 * those into synthetic classes and dropped "audioSettingsViewModel" entirely
 * (verified against 3.117.0, where the class is `Lqz/g0;`), so that fingerprint
 * stopped matching. The speed values themselves cannot move while the feature
 * exists, so this matches on them instead: three consecutive float literals
 * immediately followed by the `Float[]` construction. A scan of the whole app
 * found this to be the only constructor building such an array, and
 * [addFastSpeedsPatch] re-validates the array type before touching anything, so
 * a drifted match degrades to "the fast speeds are missing" rather than a crash.
 */
object PlayerSettingsViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        literal(1.0f),
        literal(0.75f),
        literal(0.5f),
        opcode(Opcode.FILLED_NEW_ARRAY),
    ),
)

// ── Player view ──

object InternalPlayerViewLayoutClassFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("getAdViewGroup(...)"),
    ),
)

/**
 * InternalPlayerViewLayout.onAttachedToWindow — where the aspect-ratio toggle
 * is injected. The class is found by the (unobfuscated) fingerprint above; the
 * method name is a framework override and cannot be renamed, so this is stable.
 */
object PlayerViewOnAttachedFingerprint : Fingerprint(
    classFingerprint = InternalPlayerViewLayoutClassFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    custom = { method, _ -> method.name == "onAttachedToWindow" },
)
