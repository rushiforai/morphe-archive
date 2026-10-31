package app.ytvr.patches.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import app.ytvr.patches.shared.applicationOnCreateFingerprint
import app.ytvr.patches.storedChoice
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The player's PlaybackStartParameters toString is built from this exact string; it occurs
 * exactly once in the stock 1.88.10 dex, which is what pins the class without a single
 * obfuscated name.
 */
private const val FIXED_RESOLUTION_STRING = ", initialPlaybackVideoQualityFixedResolution="
private const val EXTENSION_CLASS = "Lapp/ytvr/extension/VideoQuality;"

/** The build option's default, also what the hub row shows until the viewer changes it. */
private const val DEFAULT_QUALITY = "highest"

/**
 * The quality choices, display name to stored token, in the patcher 2.x `values` orientation
 * (`storedChoice` explains why the 1.x orientation leaked display names into the stored value --
 * which here would have been seeded into the app silently, since this option has no validator).
 */
internal val qualityChoices: Map<String, String> = linkedMapOf(
    "Highest available (the video's best, 8K included)" to "highest",
    "8K (4320p)" to "4320",
    "4K (2160p)" to "2160",
    "1440p" to "1440",
    "1080p (Full HD)" to "1080",
    "720p HD" to "720",
    "480p" to "480",
    "360p" to "360",
    "Auto (the app's own per-video choice)" to "auto",
)

/**
 * The field's own type, and the reason the injected call ends in a `check-cast`: the extension's
 * method crosses as `(Ljava/lang/Object;)Ljava/lang/Object;`, and ART's verifier rejects a store of
 * an untyped `Object` into this field with
 *
 * ```
 * VerifyError: Verifier rejected class saj: void saj.<init>(... j$.util.Optional, j$.util.Optional,
 * int, j$.util.Optional, sly) failed to verify: [0x19] register v6 has type Reference:
 * java.lang.Object but expected Precise Reference: j$.util.Optional
 * ```
 *
 * which crashed the app the moment a video started (measured 2026-10-13, `sij.a` -> `saj.<init>`
 * on the main thread). The cast is a verifier hint, not a runtime conversion: the extension returns
 * exactly this type.
 */
private const val OPTIONAL_TYPE = "Lj\$/util/Optional;"

/** Matches the player's PlaybackStartParameters by the one string its toString is built from. */
private val playbackStartParametersToString = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(FIXED_RESOLUTION_STRING),
)

/**
 * Default video quality: every video starts at one resolution instead of the app's own
 * per-video choice.
 *
 * The mechanism is the phone patch set's own (Morphe's RememberVideoQualityPatch, regular-video
 * half): the player's PlaybackStartParameters carries an
 * `initialPlaybackVideoQualityFixedResolution` Optional that its constructor stores, and a
 * replacement Optional injected in front of that store pins the starting resolution. Measured
 * against the stock 1.88.10 dex:
 *
 * - the marker string occurs exactly once, in the class's `toString` (`saj` in the dex), so the
 *   toString fingerprint pins the class without a single obfuscated name;
 * - the toString builds the marker straight off the field (`String.valueOf` of an `IGET_OBJECT`
 *   of one of the class's own fields, the first one after the marker), which names the field;
 * - the builder (`sai`) is the only construction site, its `build()` is the sole `new saj`, and
 *   the class's other constructor is a `throw null` stub -- so the constructor that stores the
 *   field is unique, and hooking it covers every playback start.
 *
 * The requested resolution is a ceiling, not an exact match: a video that does not have it plays
 * at its highest available format (the behaviour the phone patch documents), which is what makes
 * "Highest available" and "8K (4320p)" the same ceiling today -- nothing taller than 4320 is served
 * -- while the viewer still sees the entry they picked. 8K arrives through the stream spoof's
 * injected format list, which carries itag 702 (the Extension patch's 8K option accepts it).
 *
 * The extension call, not the injected bytecode, decides the value: the setting lives on the
 * Patch settings hub (`ytvr_mod_video_quality` in youtube.xml, built by the SponsorBlock patch's
 * settings restructure) and can change without a rebuild, so the build option only seeds it (see
 * VideoQuality.configure). The row's picker is the extension's own in-row list (CategoryRows), not
 * a `ListPreference` dialog -- measured: this app's preference adapter dispatches a row click
 * itself and does nothing for a row type it does not know, and androidx's dialog is never
 * composited into the VR panel, so a `ListPreference` row reads as "tapping it opens nothing"
 * (2026-10-13). The Optional crosses as an opaque Object because j$.util.Optional is desugared into
 * the app but absent from the extension's compile classpath.
 *
 * Not ported (yet): remembering a manual quality change. The VR notification path is measured
 * (`pwd.x`, logging "onVideoQualitySettingChange"), and the phone patch's per-network
 * ListPreferences and Shorts halves have no VR counterpart to hook.
 */
@Suppress("unused")
val videoQualityPatch = bytecodePatch(
    name = "Default video quality",
    description = "Starts every video at one resolution instead of the app's per-video choice; " +
        "a resolution the video lacks falls back to its highest available (8K included when the " +
        "stream spoof provides it). Changeable in the headset's Patch settings; Auto keeps the " +
        "app's own behaviour.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    val videoQuality by stringOption(
        key = "videoQuality",
        default = DEFAULT_QUALITY,
        values = qualityChoices,
        title = "Default video quality",
        description = "Seeds the in-headset setting on first launch; the Patch settings row " +
            "governs from the first change there.",
    )

    execute {
        val configured = videoQuality?.let { raw ->
            storedChoice(qualityChoices, raw) ?: throw PatchException(
                "Default video quality: unknown quality '$raw' " +
                    "(want ${qualityChoices.values.joinToString(", ")}, or one of the picker's " +
                    "display names)",
            )
        } ?: DEFAULT_QUALITY

        // The seed rides Application.onCreate like the SponsorBlock option's configure call, and
        // the extension writes it through to the setting on first read, so the hub row displays
        // the build option instead of its own fallback. It crosses as a String, not a height, so
        // that "highest" survives the round trip and the row can show the option that was chosen.
        applicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$configured"
                sput-object v0, $EXTENSION_CLASS->buildDefault:Ljava/lang/String;
            """,
        )

        // The fixed-resolution field, named by the toString that documents it. The dex hoists the
        // field reads to the top of the method, so nothing follows the marker but StringBuilder
        // appends: the append right after the marker's own append sources the String.valueOf
        // result of the field's read, whose destination register the hoisted read loaded. Measured
        // on 1.88.10: reads at instructions 0-4 (m, l, j, i, b -> registers 0-4), the marker at 34,
        // the marker's append at 35, the value append from register 2 -- field j.
        val toStringMethod = playbackStartParametersToString.method
        val toStringInstructions = toStringMethod.implementation!!.instructions.toList()
        val markerIndex = toStringInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                (instruction as? ReferenceInstruction)?.reference.let { reference ->
                    reference is StringReference && reference.string == FIXED_RESOLUTION_STRING
                }
        }
        if (markerIndex < 0) {
            throw PatchException(
                "Default video quality: the resolution marker is not in the matched toString",
            )
        }
        val classType = playbackStartParametersToString.classDef.type
        fun isOwnFieldRead(instruction: Instruction) = instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is FieldReference && reference.definingClass == classType
            }
        fun isStringAppend(instruction: Instruction) = instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/lang/StringBuilder;" &&
                    reference.name == "append" &&
                    reference.parameterTypes == listOf("Ljava/lang/String;")
            }
        val markerAppendIndexed = toStringInstructions.withIndex()
            .firstOrNull { (index, instruction) -> index > markerIndex && isStringAppend(instruction) }
            ?: throw PatchException(
                "Default video quality: nothing is appended after the resolution marker",
            )
        val valueAppendIndexed = toStringInstructions.withIndex()
            .firstOrNull { (index, instruction) -> index > markerAppendIndexed.index && isStringAppend(instruction) }
            ?: throw PatchException(
                "Default video quality: the resolution marker's segment appends no value",
            )
        val valueRegister = (valueAppendIndexed.value as FiveRegisterInstruction).registerD
        val fieldReads = toStringInstructions.filter { instruction ->
            isOwnFieldRead(instruction) &&
                (instruction as TwoRegisterInstruction).registerA == valueRegister
        }
        val fixedResolutionField = when (fieldReads.size) {
            1 -> (fieldReads.single() as ReferenceInstruction).reference as FieldReference

            else -> throw PatchException(
                "Default video quality: expected exactly one field read into register " +
                    "$valueRegister for the marker's segment, found ${fieldReads.size}",
            )
        }

        // The constructor store of that field: the single place every PlaybackStartParameters
        // is built through (the builder's build() constructs, the other constructor is a stub).
        val constructorFingerprint = Fingerprint(
            definingClass = classType,
            name = "<init>",
            custom = { method, _ ->
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.IPUT_OBJECT &&
                        (instruction as? ReferenceInstruction)?.reference == fixedResolutionField
                } == true
            },
        )
        val constructor = constructorFingerprint.method
        val constructorInstructions = constructor.implementation!!.instructions.toList()
        val storeIndex = constructorInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                (instruction as? ReferenceInstruction)?.reference == fixedResolutionField
        }
        val register = (constructorInstructions[storeIndex] as TwoRegisterInstruction).registerA

        constructor.addInstructions(
            storeIndex,
            """
                invoke-static { v$register }, $EXTENSION_CLASS->fixInitialResolution(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $OPTIONAL_TYPE
            """,
        )
    }
}
