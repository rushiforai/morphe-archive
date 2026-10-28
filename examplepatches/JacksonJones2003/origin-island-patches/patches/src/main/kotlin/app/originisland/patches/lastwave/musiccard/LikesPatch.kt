package app.originisland.patches.lastwave.musiccard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.originisland.patches.shared.mediasession.MediaSessionCallbackOnSetRatingFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val LIKES_CLASS = "Lapp/originisland/extension/LastWaveLikes;"
private const val PLAYABLE_TRACK = "Lcom/lastwave/app/playback/PlayableTrack;"
private const val PLAYBACK_SERVICE_CLASS = "Lcom/lastwave/app/playback/MusicPlaybackService;"

/**
 * The class that manages the playlist of the liked songs.
 */
private object LikedSongsManagerFingerprint : Fingerprint(
    strings = listOf("Liked Songs refresh failed")
)

/**
 * The coroutine of the player that toggles the like of the song that plays.
 */
private object LikeToggleFingerprint : Fingerprint(
    strings = listOf("Like toggle failed")
)

/**
 * Where the playback service publishes the track that plays to its session.
 */
private object PublishTrackFingerprint : Fingerprint(
    definingClass = PLAYBACK_SERVICE_CLASS,
    strings = listOf("android.media.metadata.ALBUM_ART_URI")
)

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"


/**
 * Lets the heart button of the card like the song the way the like button of LastWave does.
 * The classes of LastWave are obfuscated, so they are found by the text they log and by how
 * they call each other, and the bridges of the extension are filled with calls to them.
 */
internal fun BytecodePatchContext.addLastWaveLikes(extensionClass: String) {
    fun Fingerprint.methodCalls() = method.implementation!!.instructions.mapNotNull { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { instruction to it }
    }

    val managerType = LikedSongsManagerFingerprint.classDef.type

    // The like is toggled by a method of the manager that takes the track and a continuation.
    val toggle = LikeToggleFingerprint.methodCalls().map { it.second }.firstOrNull {
        it.definingClass == managerType && it.parameterTypes.size == 2 && it.returnType == "Ljava/lang/Object;"
    } ?: throw PatchException("Could not find how a like is toggled")
    val trackType = toggle.parameterTypes[0].toString()
    val continuationType = toggle.parameterTypes[1].toString()

    // The track that plays is turned into the track the manager takes.
    val toManagedTrack = LikeToggleFingerprint.methodCalls().map { it.second }.firstOrNull {
        it.returnType == trackType && it.parameterTypes.map(CharSequence::toString) == listOf(PLAYABLE_TRACK)
    } ?: throw PatchException("Could not find how a track of the liked songs is made")

    // The manager keeps the keys of the liked songs in a set, which it fills with a method of the track.
    val keyOf = mutableClassDefBy(managerType).methods.asSequence().mapNotNull { method ->
        val instructions = method.implementation?.instructions ?: return@mapNotNull null
        val makesSet = instructions.any {
            it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/LinkedHashSet;"
        }
        if (!makesSet) return@mapNotNull null

        instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.firstOrNull {
            it.definingClass == trackType && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        }
    }.firstOrNull() ?: throw PatchException("Could not find the key of a liked song")

    // The coroutine is a block that LastWave starts with a launcher of a scope, which the manager keeps.
    // The launcher is the method of that shape that LastWave calls the most.
    val blockType = LikeToggleFingerprint.classDef.interfaces.singleOrNull()
        ?: throw PatchException("Could not find the type of the like toggle")
    val fieldTypes = mutableClassDefBy(managerType).fields.map { it.type }.toSet()
    val launches = mutableMapOf<String, Pair<MethodReference, Int>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEach { instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEach
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                val parameters = reference.parameterTypes.map(CharSequence::toString)
                if (parameters.size == 5 && parameters[0] in fieldTypes && parameters[3] == blockType && parameters[4] == "I") {
                    val key = reference.toSmali()
                    launches[key] = reference to (launches[key]?.second ?: 0) + 1
                }
            }
        }
    }
    val launch = launches.values.maxByOrNull { it.second }?.first
        ?: throw PatchException("Could not find how the like toggle is started")
    val scopeType = launch.parameterTypes[0].toString()

    val scopeField = mutableClassDefBy(managerType).fields.first { it.type == scopeType }

    val likes = mutableClassDefBy(LIKES_CLASS)
    fun bridge(name: String, smali: String) =
        likes.methods.single { it.name == name }.addInstructions(0, smali)

    bridge(
        "toManagedTrack",
        """
            check-cast p0, $PLAYABLE_TRACK
            invoke-static { p0 }, ${toManagedTrack.toSmali()}
            move-result-object p0
            return-object p0
        """
    )
    bridge(
        "keyOf",
        """
            check-cast p0, $trackType
            invoke-virtual { p0 }, ${keyOf.toSmali()}
            move-result-object p0
            return-object p0
        """
    )
    bridge(
        "toggle",
        """
            check-cast p0, $managerType
            check-cast p1, $trackType
            check-cast p2, $continuationType
            invoke-virtual { p0, p1, p2 }, ${toggle.toSmali()}
            move-result-object p0
            return-object p0
        """
    )
    bridge(
        "scopeOf",
        """
            check-cast p0, $managerType
            iget-object p0, p0, $managerType->${scopeField.name}:$scopeType
            return-object p0
        """
    )
    bridge(
        "launch",
        """
            check-cast p0, $scopeType
            check-cast p1, $blockType
            const/4 p2, 0x0
            const/4 p3, 0x3
            invoke-static { p0, p2, p2, p1, p3 }, ${launch.toSmali()}
            return-void
        """
    )
    bridge(
        "blockInterface",
        """
            const-class p0, $blockType
            return-object p0
        """
    )

    // The manager is kept as it is made.
    mutableClassDefBy(managerType).methods.filter { it.name == "<init>" }.forEach { constructor ->
        val instructions = constructor.implementation!!.instructions
        instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            .reversed().forEach { index ->
                constructor.addInstructions(
                    index,
                    "invoke-static/range { p0 .. p0 }, $LIKES_CLASS->onManagerCreated(Ljava/lang/Object;)V"
                )
            }
    }

    // The track that plays is kept as the service publishes it.
    PublishTrackFingerprint.method.apply {
        val index = implementation!!.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == PLAYABLE_TRACK && reference.name == "getTitle"
        }
        if (index < 0) throw PatchException("Could not find where the track is published")
        val register = getInstruction<FiveRegisterInstruction>(index).registerC

        addInstructions(
            index,
            "invoke-static/range { v$register .. v$register }, $LIKES_CLASS->onCurrentTrack(Ljava/lang/Object;)V"
        )
    }

    // The card sends a heart rating for its heart button.
    MediaSessionCallbackOnSetRatingFingerprint.matchAll().forEach { match ->
        match.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $extensionClass->onSetRating(Landroid/media/Rating;)Landroid/media/Rating;
                move-result-object p1
            """
        )
    }
}
