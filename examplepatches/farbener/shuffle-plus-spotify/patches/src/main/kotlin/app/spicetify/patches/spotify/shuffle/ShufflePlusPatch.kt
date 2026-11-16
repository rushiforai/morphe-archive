package app.spicetify.patches.spotify.shuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue

private const val COSMOS_SERVICE = "Lcom/spotify/cosmos/sharedcosmosrouterservice/SharedCosmosRouterService;"
private const val NATIVE_ROUTER_FIELD =
    "$COSMOS_SERVICE->nativeRouter:Lcom/spotify/cosmos/cosmosimpl/NativeRouter;"
private const val EXT = "Lapp/spicetify/extension/spotify/extensions"
private const val ABI_HINT = "Use the verified Spotify 9.1.94.1929 APK."

// Every protobuf field number that the extension's Esperanto.java writes or reads, as class to
// (constant to number). A build that renumbers a field fails the patch instead of misbehaving at runtime.
private val esperantoFieldNumbers = mapOf(
    "Lcom/spotify/player/esperanto/proto/EsContextPlayerState\$ContextPlayerState;" to
        mapOf("CONTEXT_URI" to 2, "TRACK" to 7, "QUEUE_REVISION" to 25),
    "Lcom/spotify/player/esperanto/proto/EsProvidedTrack\$ProvidedTrack;" to mapOf("CONTEXT_TRACK" to 1),
    "Lcom/spotify/player/esperanto/proto/EsContextTrack\$ContextTrack;" to mapOf("URI" to 1, "UID" to 2, "METADATA" to 3),
    "Lcom/spotify/player/esperanto/proto/EsGetStateRequest\$GetStateRequest;" to
        mapOf("PREV_TRACKS_CAP" to 1, "NEXT_TRACKS_CAP" to 2),
    "Lcom/spotify/player/esperanto/proto/EsOptional\$OptionalInt64;" to mapOf("VALUE" to 1),
    "Lcom/spotify/player/esperanto/proto/EsResponseWithReasons\$ResponseWithReasons;" to mapOf("ERROR" to 1),
    "Lcom/spotify/player/esperanto/proto/EsPlay\$PlayRequest;" to mapOf("PREPARE_PLAY_REQUEST" to 1),
    "Lcom/spotify/player/esperanto/proto/EsPreparePlay\$PreparePlayRequest;" to mapOf("CONTEXT" to 1, "OPTIONS" to 2),
    "Lcom/spotify/player/esperanto/proto/EsContext\$Context;" to mapOf("PAGES" to 1, "URI" to 3, "URL" to 4),
    "Lcom/spotify/player/esperanto/proto/EsContextPage\$ContextPage;" to mapOf("TRACKS" to 1),
    "Lcom/spotify/player/esperanto/proto/EsPreparePlayOptions\$PreparePlayOptions;" to
        mapOf("SKIP_TO" to 3, "PLAYER_OPTIONS_OVERRIDE" to 7),
    "Lcom/spotify/player/esperanto/proto/EsSkipToTrack\$SkipToTrack;" to mapOf("TRACK_URI" to 4, "TRACK_INDEX" to 5),
    "Lcom/spotify/player/esperanto/proto/EsContextPlayerOptions\$ContextPlayerOptionOverrides;" to
        mapOf("SHUFFLING_CONTEXT" to 1),
    "Lcom/spotify/player/esperanto/proto/EsOptional\$OptionalBoolean;" to mapOf("VALUE" to 1),
    "Lcom/spotify/player/esperanto/proto/EsSetQueueRequest\$SetQueueRequest;" to mapOf("NEXT_TRACKS" to 1, "QUEUE_REVISION" to 3),
    "Lspotify/playlist/esperanto/proto/PlaylistGetRequest;" to mapOf("URI" to 1, "QUERY" to 2, "POLICY" to 3),
    "Lspotify/playlist/esperanto/proto/PlaylistQuery;" to
        mapOf("BOOL_PREDICATES" to 1, "RANGE" to 4, "SHOW_UNAVAILABLE" to 8),
    "Lspotify/playlist/esperanto/proto/PlaylistRange;" to mapOf("START" to 1, "LENGTH" to 2),
    "Lcom/spotify/playlist/policy/proto/PlaylistRequestDecorationPolicy;" to mapOf("PLAYLIST" to 1, "ITEM" to 4),
    "Lcom/spotify/playlist/policy/proto/PlaylistDecorationPolicy;" to mapOf("UNRANGED_LENGTH" to 49),
    "Lcom/spotify/playlist/policy/proto/PlaylistItemDecorationPolicy;" to mapOf("URI" to 1),
    "Lspotify/playlist/esperanto/proto/PlaylistGetResponse;" to mapOf("STATUS" to 1, "DATA" to 2),
    "Lspotify/playlist/esperanto/proto/ResponseStatus;" to mapOf("STATUS_CODE" to 1),
    "Lcom/spotify/playlist/proto/PlaylistRequest\$Response;" to
        mapOf("ITEM" to 1, "UNRANGED_LENGTH" to 4, "LOADING_CONTENTS" to 6),
    "Lcom/spotify/playlist/proto/PlaylistRequest\$Item;" to mapOf("URI" to 18),
    "Lcom/spotify/metadata/esperanto/proto/GetEntityRequest;" to mapOf("URI" to 1),
    "Lcom/spotify/metadata/esperanto/proto/GetEntityResponse;" to mapOf("ITEM" to 1),
    "Lcom/spotify/metadata/cosmos/proto/MetadataCosmos\$MetadataItem;" to mapOf("ALBUM" to 3),
    "Lcom/spotify/metadata/proto/Metadata\$Album;" to mapOf("DISC" to 11),
    "Lcom/spotify/metadata/proto/Metadata\$Disc;" to mapOf("TRACK" to 3),
    "Lcom/spotify/metadata/proto/Metadata\$Track;" to mapOf("GID" to 1),
)

@Suppress("unused")
val shufflePlusPatch = bytecodePatch(
    name = "Shuffle+",
    description = "Long-press Now Playing's shuffle button to play the current playlist, album or Liked Songs " +
        "in a truly random (Fisher-Yates, SecureRandom) order, with Spotify's own shuffle off.",
) {
    val tapShuffles by booleanOption(
        key = "tapShuffles",
        default = false,
        title = "Tap shuffles",
        description = "A tap on the shuffle button runs Shuffle+ too, instead of Spotify's own shuffle.",
    )

    val commandShuffles by booleanOption(
        key = "commandShuffles",
        default = false,
        title = "Shuffle from car screens and other controls",
        description = "Turning shuffle on from Android Auto or any other control runs Shuffle+ " +
            "instead of Spotify's own shuffle.",
    )

    val recentHours by intOption(
        key = "recentHours",
        default = 24,
        title = "Played-song window (hours)",
        description = "Songs played in the last N hours go to the end of a shuffle. 0 turns this off.",
    )

    compatibleWith(spotifyCompatibility)
    extendWith("extensions/shuffle.mpe")

    execute {
        // Protocol check: refuse a build whose protobuf field numbers moved.
        val mismatches = esperantoFieldNumbers.flatMap { (type, fields) ->
            val definition = classDefByOrNull(type)
            fields.mapNotNull { (name, expected) ->
                val found = (definition?.staticFields?.firstOrNull { it.name == "${name}_FIELD_NUMBER" }
                    ?.initialValue as? IntEncodedValue)?.value
                if (found == expected) null else "$type#$name expected $expected, found $found"
            }
        }
        if (mismatches.isNotEmpty()) throw PatchException("Spotify protocol changed: $mismatches")

        // H1: hand each new SharedCosmosRouterService to the player bridge, right after it stores its
        // native router, while p0 still holds the service.
        val constructor = mutableClassDefBy(COSMOS_SERVICE).methods.single {
            it.name == "<init>" &&
                it.parameterTypes.getOrNull(1) == "Lcom/spotify/cosmos/servicebasedrouter/RemoteNativeRouter;"
        }
        val code = constructor.implementation!!
        val self = code.registerCount - 3 // two parameters plus `this`
        val index = bridgeStoreIndex(code.instructions, self)
            ?: throw PatchException("Spotify ABI changed: $COSMOS_SERVICE. $ABI_HINT")
        constructor.addInstructions(index, "invoke-static/range {p0 .. p0}, $EXT/PlayerBridge;->onCosmos(Ljava/lang/Object;)V")

        // N1: Now Playing's shuffle button, found by shape (its class name is obfuscated and changes per build),
        // hooked at the end of its constructor, where the last stored value is the button view.
        val (type, buttonStore) = findShuffleButton()
        val button = mutableClassDefBy(type).methods.single { it.name == "<init>" && it.parameterTypes == CONTEXT_ONLY }
        val end = button.implementation!!.instructions.count() - 1
        button.addInstructions(end, "invoke-static/range {v$buttonStore .. v$buttonStore}, $EXT/NowPlayingShuffle;->onButton(Landroid/view/View;)V")
        val hours = recentHours ?: 24
        if (hours !in 0..32767) throw PatchException("recentHours must be between 0 and 32767")
        mutableClassDefBy("$EXT/RecentlyPlayed;").methods.single { it.name == "hours" }
            .replaceInstruction(0, "const/16 v0, $hours")
        if (tapShuffles == true) {
            mutableClassDefBy("$EXT/NowPlayingShuffle;").methods.single { it.name == "tapShuffles" }
                .replaceInstruction(0, "const/4 v0, 0x1")
        }

        // C1: the player's "set shuffle" sender, which every shuffle toggle passes (phone, Android Auto, other controls).
        // Only hooked when the option is on, so the default build is unchanged.
        if (commandShuffles == true) {
            val (sender, valueStore) = findShuffleSender()
            mutableClassDefBy(sender.first).methods.single { it.name == sender.second.name && it.parameterTypes == sender.second.parameterTypes }
                .addInstructions(
                    valueStore.first,
                    "invoke-static {v${valueStore.second}}, $EXT/CommandShuffle;->onShuffleCommand(Z)Z\n" +
                        "move-result v${valueStore.second}",
                )
            // C2: Spotify's Esperanto sender, where the shuffle toggle's SetOptions request is rewritten.
            val client = mutableClassDefBy("Lcom/spotify/esperanto/esperanto/ClientBase;").methods
                .single { it.name == "callSingle" && it.parameterTypes.size == 3 }
            client.addInstructions(
                0,
                listOf(
                    "invoke-static {p1, p2, p3}, $EXT/CommandShuffle;->onCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;",
                    "move-result-object p3",
                    "check-cast p3, ${client.parameterTypes[2]}",
                ).joinToString("\n"),
            )
            mutableClassDefBy("$EXT/CommandShuffle;").methods.single { it.name == "commandShuffles" }
                .replaceInstruction(0, "const/4 v0, 0x1")
        }
    }
}

private const val SET_SHUFFLING_COMMAND = "Lcom/spotify/player/model/command/SetShufflingContextCommand;"
private const val SET_SHUFFLING_VALUE = "$SET_SHUFFLING_COMMAND->value()Z"

/**
 * The method that sends Spotify's "SetShufflingContext" request for a SetShufflingContextCommand, and where to
 * hook it: the index after the move-result of the command's value() and that result's register. Exactly one
 * method must take the command, read its value and name the request, or the patch refuses.
 */
private fun BytecodePatchContext.findShuffleSender():
    Pair<Pair<String, com.android.tools.smali.dexlib2.iface.Method>, Pair<Int, Int>> {
    val found = mutableListOf<Pair<Pair<String, com.android.tools.smali.dexlib2.iface.Method>, Pair<Int, Int>>>()
    classDefForEach { cls ->
        for (method in cls.methods) {
            if (method.parameterTypes != listOf(SET_SHUFFLING_COMMAND)) continue
            val code = method.implementation?.instructions?.toList() ?: continue
            val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            if (refs.none { it == SET_SHUFFLING_VALUE }) continue
            if (code.none { (it as? ReferenceInstruction)?.reference?.toString() == "SetShufflingContext" }) continue
            val call = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == SET_SHUFFLING_VALUE }
            val result = code.getOrNull(call + 1)
            if (result?.opcode != Opcode.MOVE_RESULT) continue
            found += (cls.type to method) to ((call + 2) to (result as OneRegisterInstruction).registerA)
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Spotify ABI changed: found ${found.size} shuffle command senders. $ABI_HINT")
}

/** Right after the only store of the `nativeRouter` field, made on [self], the `this` register. Null for any other shape. */
private fun bridgeStoreIndex(instructions: Iterable<Instruction>, self: Int): Int? {
    val list = instructions.toList()
    val stores = list.indices.filter {
        list[it].opcode == Opcode.IPUT_OBJECT && (list[it] as ReferenceInstruction).reference.toString() == NATIVE_ROUTER_FIELD
    }
    val store = stores.singleOrNull() ?: return null
    return (store + 1).takeIf { (list[store] as TwoRegisterInstruction).registerB == self }
}

private val CONTEXT_ONLY = listOf("Landroid/content/Context;")
private const val GET_STRING = "Landroid/content/res/Resources;->getString(I)Ljava/lang/String;"

/**
 * The class of Now Playing's shuffle button and the register that holds the button in its constructor's
 * last store. Its constructor, taking only a Context, builds an AppCompatImageButton and reads four strings
 * (its content descriptions); the other player buttons read none or one. Exactly one class must match.
 */
private fun BytecodePatchContext.findShuffleButton(): Pair<String, Int> {
    val found = mutableListOf<Pair<String, Int>>()
    classDefForEach { cls ->
        for (method in cls.methods) {
            if (method.name != "<init>" || method.parameterTypes != CONTEXT_ONLY) continue
            val code = method.implementation?.instructions?.toList() ?: continue
            val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            val store = code.getOrNull(code.size - 2)
            if (refs.any { it.startsWith("Landroidx/appcompat/widget/AppCompatImageButton;-><init>") } &&
                refs.count { it == GET_STRING } == 4 &&
                store?.opcode == Opcode.IPUT_OBJECT && code.last().opcode == Opcode.RETURN_VOID
            ) {
                found += cls.type to (store as TwoRegisterInstruction).registerA
            }
        }
    }
    return found.singleOrNull()
        ?: throw PatchException("Spotify ABI changed: found ${found.size} shuffle button candidates. $ABI_HINT")
}
