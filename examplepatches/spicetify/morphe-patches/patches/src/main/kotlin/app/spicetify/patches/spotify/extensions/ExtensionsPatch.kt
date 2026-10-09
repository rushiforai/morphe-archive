package app.spicetify.patches.spotify.extensions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import java.util.Properties

private const val COSMOS_SERVICE = "Lcom/spotify/cosmos/sharedcosmosrouterservice/SharedCosmosRouterService;"
private const val MENU_BRIDGE = "Lapp/spicetify/extension/spotify/extensions/nativebridge/MenuBridge;"
private const val HOME_FEEDS = "Lp/qrl;"
private const val CHIP_EVENTS = "Lp/a4v;"
private const val HOME_CHIP_BRIDGE = "Lapp/spicetify/extension/spotify/extensions/nativebridge/HomeChipBridge;"
private const val SHUFFLE_BUTTON = "Lp/xkp;"
private const val LIST_MENU = "Lp/sv70;"
private const val PLAYLIST_MENU_PROVIDER =
    "Lapp/spicetify/extension/spotify/extensions/nativebridge/PlaylistMenuProvider;"
private const val HIDE_PODCASTS = "Lapp/spicetify/extension/spotify/extensions/HidePodcasts;"
private const val SECTION = "Lcom/spotify/casita/v1/resolved/Section;"
private const val PROVIDED = "Lcom/spotify/casita/v1/resolved/Provided;"
private const val LIBRARY_HEADER = "spotify/your_library/esperanto/proto/YourLibraryResponseHeader"

// Every protobuf field number the extension's Esperanto.java writes or reads, as class#NAME_FIELD_NUMBER,
// for the extensions and for the Home pins picker, which reads Your Library's names and covers. These
// classes keep their names and constants, so a build that renumbers a field fails here. Map entries are
// not covered: protobuf numbers their key and value 1 and 2. Nor are enum values, since obfuscated enums
// keep no constants: the playlist query's BoolPredicate (4, 3, 7 and 6), and Your Library's Filter
// (PLAYLIST 2, ALBUM 0) and LinkType (TRACK 4).
internal val esperantoFieldNumbers = mapOf(
    "Lcom/spotify/player/esperanto/proto/EsContextPlayerState\$ContextPlayerState;" to
        mapOf("CONTEXT_URI" to 2, "TRACK" to 7),
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
    "Lspotify/your_library/esperanto/proto/YourLibraryRequest;" to mapOf("HEADER" to 1),
    "Lspotify/your_library/esperanto/proto/YourLibraryRequestHeader;" to mapOf(
        "LENGTH" to 12, "FILTERS" to 14, "ALL_PLAYLISTS" to 17, "NUM_LINK_TYPES_IN_PLAYLISTS" to 25,
        "IGNORE_PINNING" to 26,
    ),
    "Lspotify/your_library/proto/YourLibraryConfig\$YourLibraryFilters;" to mapOf("FILTER" to 1),
    "Lspotify/your_library/esperanto/proto/YourLibraryResponse;" to
        mapOf("HEADER" to 1, "ENTITY" to 2, "PINNED_ENTITY" to 3, "STATUS_CODE" to 98, "ERROR" to 99),
    "Lspotify/your_library/esperanto/proto/YourLibraryResponseHeader;" to mapOf("IS_LOADING" to 12),
    "Lspotify/your_library/proto/YourLibraryDecoratedEntityOuterClass\$YourLibraryDecoratedEntity;" to
        mapOf("ENTITY_INFO" to 1, "ALBUM" to 2, "PLAYLIST" to 4),
    "Lspotify/your_library/proto/YourLibraryDecoratedEntityOuterClass\$YourLibraryEntityInfo;" to
        mapOf("NAME" to 2, "URI" to 3, "IMAGE_URI" to 6),
    "Lspotify/your_library/proto/YourLibraryDecoratedEntityOuterClass\$YourLibraryPlaylistExtraInfo;" to
        mapOf("NUMBER_OF_ITEMS_PER_LINK_TYPE" to 12),
    "Lspotify/your_library/proto/YourLibraryDecoratedEntityOuterClass\$NumberOfItemsForLinkType;" to
        mapOf("LINK_TYPE" to 1, "NUM_ITEMS" to 2),
).flatMap { (type, fields) -> fields.map { (name, number) -> "$type#${name}_FIELD_NUMBER" to number } }.toMap()

/**
 * H1 and the protocol check, shared by every patch that talks to Spotify's core through the player
 * bridge: the extensions, and Home pins, whose picker reads Your Library through it. It has no name,
 * so Manager never lists it. It leaves InstalledPatches.extensions() off, since only the extensions
 * patch turns that on, and without it the bridge starts no extension.
 */
internal val playerBridgePatch = bytecodePatch {
    dependsOn(settingsPatch) // H1 calls into the extension, which the settings patch merges

    execute {
        checkSnapshot { it == COSMOS_SERVICE }
        val mismatches = fieldNumberMismatches(esperantoFieldNumbers) { key ->
            val (type, name) = key.split('#')
            val constant = classDefByOrNull(type)?.staticFields?.firstOrNull { it.name == name }
            (constant?.initialValue as? IntEncodedValue)?.value
        }
        if (mismatches.isNotEmpty()) throw PatchException("Spotify extensions protocol changed: $mismatches")

        // H1: hand each new service to the player bridge, which sends through its router.
        val constructor = mutableClassDefBy(COSMOS_SERVICE).methods.single {
            it.name == "<init>" &&
                it.parameterTypes.getOrNull(1) == "Lcom/spotify/cosmos/servicebasedrouter/RemoteNativeRouter;"
        }
        val index = bridgeHookIndex(constructor.implementation!!.instructions)
            ?: throw PatchException("Spotify extensions ABI changed: $COSMOS_SERVICE. Use the verified Spotify 9.1.80.2221 APK.")
        constructor.addInstructions(index,
            "invoke-static/range {p0 .. p0}, Lapp/spicetify/extension/spotify/extensions/PlayerBridge;->onCosmos(Ljava/lang/Object;)V")
    }
}

@Suppress("unused")
val extensionsPatch = bytecodePatch(
    name = "Spicetify extensions",
    description = "Adds Android versions of Spicetify extensions to the Spicetify Marketplace's Extensions tab, " +
        "in Spicetify settings, each off until you turn it on. Trash Bin skips the songs and artists you throw " +
        "away from their menus. Play a random song plays one from all of Spotify or your library, from a " +
        "Random pill on Home. Shuffle+ plays a playlist, album or Liked Songs in a truly random order when you " +
        "long-press the shuffle button in Now Playing, choose Shuffle+ this playlist in a playlist's menu, or use " +
        "its sheet. Hide podcasts hides podcasts and episodes on Home and in Search, and their " +
        "filters there and in Your Library, and audiobooks unless you turn that off.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch, playerBridgePatch)

    execute {
        // The player bridge patch checked, then hooked, the router service before this runs.
        checkSnapshot { it != COSMOS_SERVICE }

        // T1 and T2: the menu bridge gets each context menu's frozen item list, with its CollectionTrack
        // (v11) or CollectionArtist (v22), right before the menu model is built from it. v1 is dead until
        // that new-instance, so T2 moves v22 there for invoke-static.
        val trackMenu = menuBuilder("Lp/b9p0;", 1678)
        val artistMenu = menuBuilder("Lp/lr5;", 633)

        // A and B: Home's filter row gets the Random pill once Lp/xqw;->a has rewritten the server's chips,
        // which v1 holds until 315 copies them. Each chip tap is offered to the chip bridge before its
        // Lp/q8w; reaches Home's loop at 1205. v1, the chip's id, is dead after 1204, so it takes the answer,
        // and a handled tap skips to the case's return at 1214.
        val homeFeeds = mutableClassDefBy(HOME_FEEDS).methods.single {
            it.name == "invokeSuspend" && it.parameterTypes == listOf("Ljava/lang/Object;")
        }
        if (!isChipsCopy(homeFeeds.implementation!!.instructions, 315)) {
            throw PatchException("Spotify extensions ABI changed: $HOME_FEEDS. Use the verified Spotify 9.1.80.2221 APK.")
        }
        val chipEvents = mutableClassDefBy(CHIP_EVENTS).methods.single {
            it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        }
        if (!isChipTapSend(chipEvents.implementation!!.instructions, 1205, 1214)) {
            throw PatchException("Spotify extensions ABI changed: $CHIP_EVENTS. Use the verified Spotify 9.1.80.2221 APK.")
        }

        // N1: Now Playing's shuffle button gets its long-press at the end of its constructor, where v2
        // still holds the button that 61 stored.
        val shuffleButton = mutableClassDefBy(SHUFFLE_BUTTON).methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("Landroid/content/Context;")
        }
        if (!isShuffleButtonEnd(shuffleButton.implementation!!.instructions, 62)) {
            throw PatchException("Spotify extensions ABI changed: $SHUFFLE_BUTTON. Use the verified Spotify 9.1.80.2221 APK.")
        }

        // M1: the list menu, which playlists and Liked Songs open, gets one more item provider. v4 holds
        // the providers until 4 stores them.
        val listMenu = mutableClassDefBy(LIST_MENU).methods.single {
            it.name == "<init>" &&
                it.parameterTypes == listOf("Lp/y3w0;", "Lp/vz1;", "Ljava/util/List;", "Ljava/util/List;", "Lp/a94;")
        }
        if (!isItemProvidersStore(listMenu.implementation!!.instructions.getOrNull(4))) {
            throw PatchException("Spotify extensions ABI changed: $LIST_MENU. Use the verified Spotify 9.1.80.2221 APK.")
        }

        // P1 to P6: Hide podcasts' filters. Each index must hold the instruction found there in this
        // build, so a wrong index refuses.
        val homeSection = hookSite("Lp/mz1;", "g0", listOf(SECTION), 0,
            Opcode.INVOKE_VIRTUAL, "Lp/mz1;->O($SECTION)Lp/n920;")
        val homeItems = mutableClassDefBy(PROVIDED).methods.single { it.name == "getItemsList" }
        if (!isItemsGetter(homeItems.implementation!!.instructions)) {
            throw PatchException("Spotify extensions ABI changed: $PROVIDED. Use the verified Spotify 9.1.80.2221 APK.")
        }
        val homeChips = hookSite("Lp/xqw;", "a", listOf("Ljava/util/List;"), 0, Opcode.NEW_INSTANCE, "Ljava/util/ArrayList;")
        val searchEntity = hookSite("Lp/bzw0;", "b", listOf("Lcom/spotify/searchview/proto/Entity;"), 0,
            Opcode.MOVE_OBJECT_FROM16)
        val searchChips = hookSite("Lp/ipy;", "<init>", listOf("Ljava/util/ArrayList;"), 1,
            Opcode.IPUT_OBJECT, "Lp/ipy;->a:Ljava/util/ArrayList;")
        // P6 takes the Your Library chips as Spotify's mapper gets them from the chip builder, on their way
        // to Lp/j290;'s constructor. Not in that constructor: the server-files patch pins Lp/j290;, and
        // patches run in name order, so a changed Lp/j290; would refuse that patch whenever it ran second.
        val libraryChips = hookSite("Lp/b90;", "invoke", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 267,
            Opcode.INVOKE_INTERFACE_RANGE, "Lp/k770;->a(ZZL$LIBRARY_HEADER;Ljava/util/List;Ljava/util/List;)Ljava/util/List;")
        hookSite("Lp/b90;", "invoke", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), 268, Opcode.MOVE_RESULT_OBJECT)
        val chips = libraryChips.getInstruction<OneRegisterInstruction>(268).registerA

        trackMenu.addInstructions(1678, """
            invoke-static {v0, v11}, $MENU_BRIDGE->track(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0
        """.trimIndent())
        artistMenu.addInstructions(633, """
            move-object/from16 v1, v22
            invoke-static {v0, v1}, $MENU_BRIDGE->artist(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0
        """.trimIndent())
        homeFeeds.addInstructions(315, """
            invoke-static {v1}, $HOME_CHIP_BRIDGE->chips(Ljava/util/List;)Ljava/util/List;
            move-result-object v1
        """.trimIndent())
        chipEvents.addInstructionsWithLabels(1205, """
            invoke-static {v1}, $HOME_CHIP_BRIDGE->onTap(Ljava/lang/String;)Z
            move-result v1
            if-nez v1, :handled
        """.trimIndent(), ExternalLabel("handled", chipEvents.getInstruction(1214)))
        shuffleButton.addInstructions(62,
            "invoke-static {v2}, Lapp/spicetify/extension/spotify/extensions/NowPlayingShuffle;->onButton(Landroid/view/View;)V")
        listMenu.addInstructions(4, """
            invoke-static {v4}, $PLAYLIST_MENU_PROVIDER->providers(Ljava/util/List;)Ljava/util/List;
            move-result-object v4
        """.trimIndent())

        // P1 and P4 return null for a dropped section or result, which every caller already skips. v0 is
        // free at both: g0 writes it at index 1 or in its catch handler before any read, and b's index 0
        // writes it. The code lands before g0's try block, which starts at the original index 0.
        homeSection.addInstructionsWithLabels(0, """
            invoke-static {p1}, $HIDE_PODCASTS->hideHomeSection(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :keep
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(), ExternalLabel("keep", homeSection.getInstruction(0)))
        homeItems.addInstructions(1, """
            invoke-static {v0}, $HIDE_PODCASTS->filterHomeItems(Ljava/util/List;)Ljava/util/List;
            move-result-object v0
        """.trimIndent())
        homeChips.addInstructions(0, """
            invoke-static {p0}, $HIDE_PODCASTS->filterHomeChips(Ljava/util/List;)Ljava/util/List;
            move-result-object p0
        """.trimIndent())
        searchEntity.addInstructionsWithLabels(0, """
            invoke-static/range {p1 .. p1}, $HIDE_PODCASTS->hideSearchEntity(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :keep
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(), ExternalLabel("keep", searchEntity.getInstruction(0)))
        // The constructors' lists are filtered right after Object.<init>, before they're stored.
        searchChips.addInstructions(1, """
            invoke-static {p1}, $HIDE_PODCASTS->filterSearchChips(Ljava/util/ArrayList;)Ljava/util/ArrayList;
            move-result-object p1
        """.trimIndent())
        libraryChips.addInstructions(269, """
            invoke-static/range {v$chips .. v$chips}, $HIDE_PODCASTS->filterLibraryChips(Ljava/util/List;)Ljava/util/List;
            move-result-object v$chips
        """.trimIndent())
        enableSetting("extensions")
    }
}

/** Refuses to patch unless each class of the extensions snapshot that [selected] picks has its recorded digest. */
private fun BytecodePatchContext.checkSnapshot(selected: (String) -> Boolean) {
    val snapshot = Properties().apply {
        NativeSettingsAbi::class.java.getResourceAsStream("/extensions/9.1.80.2221.properties")!!.use(::load)
    }
    for (type in snapshot.stringPropertyNames().filter(selected)) {
        val definition = classDefByOrNull(type)
            ?: throw PatchException("Spotify extensions ABI changed: missing $type")
        if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
            throw PatchException("Spotify extensions ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
        }
    }
}

/** Menu builder [type]'s `apply(Object)`, once [index] holds the menu model's new-instance. Throws otherwise. */
private fun BytecodePatchContext.menuBuilder(type: String, index: Int): MutableMethod {
    val apply = mutableClassDefBy(type).methods.single {
        it.name == "apply" && it.parameterTypes == listOf("Ljava/lang/Object;")
    }
    if (!isMenuModel(apply.implementation!!.instructions.getOrNull(index))) {
        throw PatchException("Spotify extensions ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
    }
    return apply
}

/** [type]'s method [name]([parameters]), once the instruction at [index] is [opcode] with [reference]. Throws otherwise. */
private fun BytecodePatchContext.hookSite(
    type: String,
    name: String,
    parameters: List<String>,
    index: Int,
    opcode: Opcode,
    reference: String? = null,
): MutableMethod {
    val method = mutableClassDefBy(type).methods.single { it.name == name && it.parameterTypes == parameters }
    if (!isHookSite(method.implementation!!.instructions.getOrNull(index), opcode, reference)) {
        throw PatchException("Spotify extensions ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
    }
    return method
}

/** Whether [instruction] is [opcode] with [reference], written like `Lp/a;->b:I`, or with none when it's null. */
internal fun isHookSite(instruction: Instruction?, opcode: Opcode, reference: String? = null): Boolean =
    instruction?.opcode == opcode && (instruction as? ReferenceInstruction)?.reference?.toString() == reference

/**
 * Whether [index] holds A's place in `Lp/qrl;->invokeSuspend`: `new-instance v2, ArrayList`, which copies
 * the chips, right after `move-result-object v1` took them from `Lp/xqw;->a`. A replaces them in v1 first.
 */
internal fun isChipsCopy(instructions: List<Instruction>, index: Int): Boolean {
    val chips = instructions.getOrNull(index - 1)
    val copy = instructions.getOrNull(index)
    return isHookSite(chips, Opcode.MOVE_RESULT_OBJECT) && (chips as OneRegisterInstruction).registerA == 1 &&
        isHookSite(copy, Opcode.NEW_INSTANCE, "Ljava/util/ArrayList;") && (copy as OneRegisterInstruction).registerA == 2
}

/**
 * Whether [index] holds B's place in `Lp/a4v;->invoke`: `invoke-virtual {v3, v2}, Lp/bay;->invoke`, which
 * sends a chip tap's `Lp/q8w;` to Home's loop, and [end] holds the `return-object v13` that B skips to.
 */
internal fun isChipTapSend(instructions: List<Instruction>, index: Int, end: Int): Boolean {
    val send = instructions.getOrNull(index)
    val done = instructions.getOrNull(end)
    return isHookSite(send, Opcode.INVOKE_VIRTUAL, "Lp/bay;->invoke(Ljava/lang/Object;)Ljava/lang/Object;") &&
        (send as FiveRegisterInstruction).registerC == 3 && send.registerD == 2 &&
        isHookSite(done, Opcode.RETURN_OBJECT) && (done as OneRegisterInstruction).registerA == 13
}

/**
 * Whether [index] holds N1's place in the shuffle button's constructor: `return-void`, right after
 * `iput-object v2, v4, Lp/xkp;->i`, which stores the button that N1 passes on from v2.
 */
internal fun isShuffleButtonEnd(instructions: List<Instruction>, index: Int): Boolean {
    val store = instructions.getOrNull(index - 1)
    return isHookSite(store, Opcode.IPUT_OBJECT, "$SHUFFLE_BUTTON->i:Landroidx/appcompat/widget/AppCompatImageButton;") &&
        (store as TwoRegisterInstruction).registerA == 2 && store.registerB == 4 &&
        isHookSite(instructions.getOrNull(index), Opcode.RETURN_VOID)
}

/**
 * Whether [instruction] is `iput-object v4, v0, Lp/sv70;->d`, the list menu's constructor storing its item
 * providers, which M1 replaces in v4 first.
 */
internal fun isItemProvidersStore(instruction: Instruction?): Boolean =
    isHookSite(instruction, Opcode.IPUT_OBJECT, "$LIST_MENU->d:Ljava/util/List;") &&
        (instruction as TwoRegisterInstruction).registerA == 4 && instruction.registerB == 0

/** Whether [instructions] are the whole of P2's getter: `iget-object v0, v1, Provided;->items_`, then `return-object v0`. */
internal fun isItemsGetter(instructions: List<Instruction>): Boolean =
    instructions.size == 2 && isHookSite(instructions[0], Opcode.IGET_OBJECT, "$PROVIDED->items_:Lp/ih40;") &&
        isHookSite(instructions[1], Opcode.RETURN_OBJECT) &&
        instructions.all { (it as OneRegisterInstruction).registerA == 0 }

/** Whether [instruction] is `new-instance v1, Lp/krj;`, the menu model that T1 and T2 insert before. */
internal fun isMenuModel(instruction: Instruction?): Boolean =
    instruction?.opcode == Opcode.NEW_INSTANCE && (instruction as OneRegisterInstruction).registerA == 1 &&
        ((instruction as ReferenceInstruction).reference as TypeReference).type == "Lp/krj;"

/** Each expected `class#FIELD_NUMBER` whose value in the APK differs, or that the APK lacks. */
internal fun fieldNumberMismatches(expected: Map<String, Int>, actual: (String) -> Int?): List<String> =
    expected.mapNotNull { (key, number) ->
        when (val found = actual(key)) {
            number -> null
            null -> "$key missing"
            else -> "$key expected $number, found $found"
        }
    }

/**
 * H1's place in `SharedCosmosRouterService.<init>`: before its only return-void, which must directly follow
 * `NativeRouter.initializeScheduling`, so the router already takes requests. Null for any other shape.
 */
internal fun bridgeHookIndex(instructions: List<Instruction>): Int? {
    val index = instructions.indices.singleOrNull { instructions[it].opcode == Opcode.RETURN_VOID } ?: return null
    val call = instructions.getOrNull(index - 1)
    val method = (call as? ReferenceInstruction)?.reference as? MethodReference
    return index.takeIf {
        call?.opcode == Opcode.INVOKE_VIRTUAL && method?.name == "initializeScheduling" &&
            method.definingClass == "Lcom/spotify/cosmos/cosmosimpl/NativeRouter;"
    }
}
