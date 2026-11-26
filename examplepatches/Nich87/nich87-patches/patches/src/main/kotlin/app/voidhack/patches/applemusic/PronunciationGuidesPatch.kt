package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object LyricsPronunciationAvailability : Fingerprint(
    definingClass = LYRICS_FRAGMENT,
    parameters = listOf(SONG_INFO_PTR),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/String;", name = "equalsIgnoreCase", returnType = "Z"),
        methodCall(
            definingClass = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;",
            name = "setPronunciation",
            returnType = "Z",
        ),
    ),
)

private object LyricsScriptMatch : Fingerprint(
    definingClass = "Lcom/apple/android/music/playback/util/LocaleUtil;",
    name = "matchToSystemLyricsScript",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/apple/android/mediaservices/javanative/common/StringVector\$StringVectorNative;"),
    returnType = "Ljava/lang/String;",
)

@Suppress("unused")
val pronunciationGuidesPatch = bytecodePatch(
    name = "On-device pronunciation guides",
    description = "Generates on-device pronunciation guides for Apple Music, custom, and external lyrics (offline Japanese Kuromoji dictionary and Android ICU) with word-synced karaoke and unsynced lyrics support.",
    default = false,
) {
    dependsOn(
        lyricsBasePatch,
        lrclibRomanizationResources,
        staticLyricsPronunciationPatch,
        karaokePronunciationPatch,
        lyricsGuideSourceMenuPatch,
    )
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        enableLyricsFeature("pronunciation")

        val availability = LyricsPronunciationAvailability.method
        val comparison = availability.instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/String;" && ref.name == "equalsIgnoreCase"
        }
        check(comparison >= 0) { "Could not locate language comparison in pronunciation availability" }
        val comparisonResult = availability.instructions[comparison + 1]
        check(comparisonResult.opcode == Opcode.MOVE_RESULT)
        val sameLanguage = (comparisonResult as OneRegisterInstruction).registerA
        availability.addInstructions(
            comparison + 2,
            """
                invoke-static {p1, v$sameLanguage}, $LYRICS_REFLECTION->sameLyricsLanguage(Ljava/lang/Object;Z)Z
                move-result v$sameLanguage
            """,
        )

        val scriptMatch = LyricsScriptMatch.method
        scriptMatch.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $LYRICS_REFLECTION->pronunciationScriptOverride(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :native_match
                return-object v0
            """,
            ExternalLabel("native_match", scriptMatch.instructions.first()),
        )
    }
}
