package app.originisland.patches.lastwave.musiccard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val LYRICS_CLASS = "Lapp/originisland/extension/LastWaveLyrics;"
private const val PLAYABLE_TRACK = "Lcom/lastwave/app/playback/PlayableTrack;"

/**
 * A line of lyrics, with the time it starts at and its text.
 */
private object LyricLineFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("LyricLine(timeMs=")
)

/**
 * The lyrics that were loaded, both as the lyrics provider gives them and as the player keeps them.
 */
private object LyricsSuccessFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Success(lines=", ", isWordSynced=")
)

/**
 * Gives the music card the lyrics LastWave shows. The classes of LastWave are obfuscated,
 * so they are found by the text they log and by how they make each other.
 */
internal fun BytecodePatchContext.addLastWaveLyrics() {
    // The line keeps its start time as its first long and its text as its string.
    val lineClass = mutableClassDefBy(LyricLineFingerprint.classDef.type)
    val startTimeField = lineClass.fields.firstOrNull { it.type == "J" }
        ?: throw PatchException("Could not find the start time of a line of lyrics")
    val textField = lineClass.fields.firstOrNull { it.type == "Ljava/lang/String;" }
        ?: throw PatchException("Could not find the text of a line of lyrics")

    // The player makes its state of the lyrics from what the provider loaded, for a track.
    val successTypes = LyricsSuccessFingerprint.matchAll().map { it.classDef }
        .associate { it.type to it.interfaces.toSet() }
    var keepLyrics: Pair<String, String>? = null
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val parameters = method.parameterTypes.map(CharSequence::toString)
            if (parameters.size != 2 || parameters[1] != PLAYABLE_TRACK || method.returnType != "V") return@forEach

            val made = method.implementation?.instructions?.firstNotNullOfOrNull { instruction ->
                if (instruction.opcode != Opcode.NEW_INSTANCE) return@firstNotNullOfOrNull null
                val type = ((instruction as ReferenceInstruction).reference as TypeReference).type
                type.takeIf { it in successTypes && parameters[0] !in successTypes.getValue(it) }
            } ?: return@forEach
            // The loaded lyrics the player takes are of the other class.
            if (successTypes.any { (type, interfaces) -> type != made && parameters[0] in interfaces }) {
                keepLyrics = classDef.type to method.name
            }
        }
    }
    val (playerType, keepLyricsName) = keepLyrics
        ?: throw PatchException("Could not find where the player keeps the lyrics")

    val stateType = successTypes.keys.single { type ->
        mutableClassDefBy(playerType).methods.single { it.name == keepLyricsName &&
                it.parameterTypes.getOrNull(1)?.toString() == PLAYABLE_TRACK }
            .implementation!!.instructions.any {
                it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as TypeReference).type == type
            }
    }

    val lyrics = mutableClassDefBy(LYRICS_CLASS)
    fun bridge(name: String, smali: String) =
        lyrics.methods.single { it.name == name }.addInstructions(0, smali)

    bridge(
        "lineStartTimeMs",
        """
            check-cast p0, ${lineClass.type}
            iget-wide p0, p0, ${lineClass.type}->${startTimeField.name}:J
            return-wide p0
        """
    )
    bridge(
        "lineText",
        """
            check-cast p0, ${lineClass.type}
            iget-object p0, p0, ${lineClass.type}->${textField.name}:Ljava/lang/String;
            return-object p0
        """
    )
    bridge(
        "titleOf",
        """
            check-cast p0, $PLAYABLE_TRACK
            invoke-virtual { p0 }, $PLAYABLE_TRACK->getTitle()Ljava/lang/String;
            move-result-object p0
            return-object p0
        """
    )
    bridge(
        "artistOf",
        """
            check-cast p0, $PLAYABLE_TRACK
            invoke-virtual { p0 }, $PLAYABLE_TRACK->getArtist()Ljava/lang/String;
            move-result-object p0
            return-object p0
        """
    )

    // The track is kept as the player keeps its lyrics, which makes the state right after.
    mutableClassDefBy(playerType).methods.single {
        it.name == keepLyricsName && it.parameterTypes.getOrNull(1)?.toString() == PLAYABLE_TRACK
    }.addInstructions(
        0,
        "invoke-static/range { p2 .. p2 }, $LYRICS_CLASS->onLyricsTrack(Ljava/lang/Object;)V"
    )

    // The state is made with the lines and whether they are synced.
    mutableClassDefBy(stateType).methods.filter {
        it.name == "<init>" && it.parameterTypes.size >= 2 &&
                it.parameterTypes[0].toString() == "Ljava/util/List;" && it.parameterTypes[1].toString() == "Z"
    }.ifEmpty { throw PatchException("Could not find how the lyrics state is made") }.forEach {
        it.addInstructions(
            0,
            "invoke-static { p1, p2 }, $LYRICS_CLASS->onLyricsLoaded(Ljava/util/List;Z)V"
        )
    }
}
