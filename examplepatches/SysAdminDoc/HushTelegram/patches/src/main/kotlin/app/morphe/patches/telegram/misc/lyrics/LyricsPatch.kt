/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.lyrics

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.patches.telegram.misc.voice.MEDIA_CONTROLLER
import app.morphe.patches.telegram.misc.voice.isPlayer
import app.morphe.patches.telegram.misc.voice.resolvePlayingRead
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val LYRICS = "$EXTENSION_PACKAGE/misc/Lyrics;"
internal const val SONG_DATES = "$EXTENSION_PACKAGE/misc/SongDates;"
internal const val LYRICS_ANCHOR = "$LYRICS->anchor(Landroid/view/ViewGroup;Landroid/view/View;)V"
internal const val LYRICS_MENU = "$LYRICS->menu(Ljava/lang/Object;)V"
internal const val SONG_SAVING = "$SONG_DATES->saving(Ljava/lang/Object;)V"
internal const val SONG_AUTHOR = "$SONG_DATES->author(Ljava/lang/Object;I)Ljava/lang/String;"
internal const val REMOVE_FROM_PROFILE = "Lorg/telegram/messenger/R\$string;->ProfilePlaylistRemoveFromProfile:I"
internal const val MUSIC_AUTHOR = "Lorg/telegram/messenger/MessageObject;->getMusicAuthor(Z)Ljava/lang/String;"
internal const val SAVE_MUSIC = "Lorg/telegram/tgnet/TLRPC\$TL_account_saveMusic;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val INPUT_DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$InputDocument;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val PEER = "Lorg/telegram/tgnet/TLRPC\$Peer;"
private const val LISTENER = "Lorg/telegram/messenger/DownloadController\$FileDownloadProgressListener;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val TEXT = "Ljava/lang/CharSequence;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private val VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val ITEM_SHAPES = setOf(listOf("I", TEXT, RUNNABLE, "Z").sorted(), listOf("I", TEXT, RUNNABLE).sorted())

@Suppress("unused")
val lyricsPatch = bytecodePatch(
    name = "Lyrics and song dates",
    description = "Adds Lyrics to the music player's menu, found on lrclib.net and scrolling along with the song, and " +
        "shows when you added each song to your profile. Starts off. Turn it on in HushTelegram settings > Playback.",
    default = true,
) {
    category("Playback")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val menu = resolveLyricsMenu()
        val dates = try {
            resolveSongDates(menu.player)
        } catch (refused: PatchException) {
            refused.message ?: "the song rows changed"
        }
        // Assembled on copies first, so a refusal leaves the app untouched.
        menu.apply(MutableMethod(ImmutableMethod.of(menu.method)))
        if (dates is SongDateSites) dates.rehearse()
        writeLyricsStubs(menu)
        if (dates is SongDateSites) writeSongDateStubs()
        menu.apply(menu.method)
        enableStatus("lyrics")
        if (dates is SongDateSites) {
            dates.apply()
            enableCapability("songDates")
        } else {
            patchLog.warning("Lyrics and song dates: $dates. The patch goes on without the song dates switch.")
        }
    }
}

/**
 * The player's menu button: where it makes the menu, the register the menu lands in, the call that
 * hands the extension what the menu opens on, the menu's own add-an-item call, and how a stub reads
 * the message playing.
 */
internal class LyricsMenu(
    val player: String,
    val method: MutableMethod,
    val make: Int,
    val options: Int,
    val anchor: String,
    val item: MethodReference,
    val playing: String,
) {
    fun apply(target: MutableMethod) {
        // After the menu is kept and before the player adds its own items, so Lyrics comes first.
        target.addInstructions(make + 2, if (options > 15) {
            "invoke-static/range {v$options .. v$options}, $LYRICS_MENU"
        } else {
            "invoke-static {v$options}, $LYRICS_MENU"
        })
        target.addInstructionsAtControlFlowLabel(make, anchor)
    }
}

/**
 * AudioPlayerAlert's menu button (13.2 merges it into a lambda that keeps the player in a field)
 * makes an ItemOptions on the sheet's container and the button, then adds Remove from Profile among
 * its items. That one call is where Lyrics goes in.
 */
internal fun BytecodePatchContext.resolveLyricsMenu(): LyricsMenu {
    requireStatusMethod("lyrics")
    controlHook(LYRICS, "anchor", listOf("Landroid/view/ViewGroup;", "Landroid/view/View;"), "V")
    controlHook(LYRICS, "menu", listOf(OBJECT), "V")
    controlHook(LYRICS, "addItem", listOf(OBJECT, "I", TEXT, RUNNABLE), "V")
    controlHook(LYRICS, "playing", emptyList(), OBJECT)
    controlHook(LYRICS, "title", listOf(OBJECT), STRING)
    controlHook(LYRICS, "author", listOf(OBJECT), STRING)
    controlHook(LYRICS, "progress", listOf(OBJECT), "F")
    controlHook(LYRICS, "duration", listOf(OBJECT), "D")
    controlHook(LYRICS, "playerDuration", listOf(OBJECT), "I")
    controlHook(LYRICS, "documentId", listOf(OBJECT), "J")
    controlMembers(MESSAGE, "getMusicTitle(Z)$STRING", "getMusicAuthor(Z)$STRING", "getDocument()$DOCUMENT",
        "getDuration()D", "audioProgress:F", "audioPlayerDuration:I")
    controlMembers(DOCUMENT, "id:J")

    class Found(val type: String, val signature: String, val make: Int, val player: String)
    val found = mutableListOf<Found>()
    forEachClassMentioning(Mention.reference(REMOVE_FROM_PROFILE)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        val held = (listOf(cls.type) + cls.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type })
            .distinct().filter { isPlayer(tgClassDefByOrNull(it)) }
        if (held.size != 1) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            if (body.none { it.controlRef() == REMOVE_FROM_PROFILE }) return@forEach
            body.indices.filter { makesOptions(body[it]) }.forEach { found += Found(cls.type, signature(m), it, held.single()) }
        }
    }
    val site = found.controlSingle("the music player's menu")
    val method = tgMutableClassDefBy(site.type).methods.single { signature(it) == site.signature }
    val body = method.controlBody()
    val make = body[site.make]
    val kept = body.getOrNull(site.make + 1)
    controlShape(kept?.opcode == Opcode.MOVE_RESULT_OBJECT, "the music player's menu isn't kept where it's made")
    val registers = make.namedRegisters()
    val container = registers[0]
    val button = registers[2]
    val anchor = when {
        container <= 15 && button <= 15 -> "invoke-static {v$container, v$button}, $LYRICS_ANCHOR"
        button == container + 1 -> "invoke-static/range {v$container .. v$button}, $LYRICS_ANCHOR"
        else -> null
    }
    controlShape(anchor != null, "the music player's menu is made from registers a call can't name")

    val owner = make.call()!!.definingClass
    val item = body.filter { it.opcode in VIRTUAL }.mapNotNull { it.call() }
        .filter { it.definingClass == owner && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString).sorted() in ITEM_SHAPES }
        .distinctBy { "${it.name}${it.parameterTypes.joinToString("")}" }
        .controlSingle("the music player's menu items")
    val parameters = item.parameterTypes.map(CharSequence::toString)
    if ("Z" in parameters) {
        // Its last word says whether to add the item at all, and the stub always says yes.
        val code = tgClassDefByOrNull(owner)?.methods?.singleOrNull {
            it.name == item.name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == "V"
        }
        val count = code?.implementation?.registerCount ?: 0
        val first = code?.controlBody().orEmpty()
        controlShape(first.size > 2 && first[0].opcode == Opcode.IF_NEZ &&
            (first[0] as OneRegisterInstruction).registerA == count - parameters.size + parameters.indexOf("Z") &&
            first[1].opcode == Opcode.RETURN_VOID, "the music player's menu no longer adds an item when asked")
    }
    requireReachable("$owner->${item.name}(${parameters.joinToString("")})V", false)
    return LyricsMenu(site.player, method, site.make, (kept as OneRegisterInstruction).registerA, anchor!!, item,
        resolvePlayingRead())
}

/** ItemOptions.makeOptions(container, resources, button, swipeBack): a static call that returns its own class. */
private fun makesOptions(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val call = instruction.call() ?: return false
    val parameters = call.parameterTypes.map(CharSequence::toString)
    return call.returnType == call.definingClass && parameters.size == 4 && parameters[0] == "Landroid/view/ViewGroup;" &&
        parameters[2] == "Landroid/view/View;" && parameters[3] == "Z"
}

private fun BytecodePatchContext.writeLyricsStubs(menu: LyricsMenu) {
    val owner = menu.item.definingClass
    val arguments = menu.item.parameterTypes.joinToString(", ") {
        when (it.toString()) {
            "I" -> "p1"
            TEXT -> "p2"
            RUNNABLE -> "p3"
            else -> "v0"
        }
    }
    writeStub(LYRICS, "addItem", 5, """
        check-cast p0, $owner
        const/4 v0, 0x1
        invoke-virtual {p0, $arguments}, $owner->${menu.item.name}(${menu.item.parameterTypes.joinToString("")})V
        return-void
    """)
    writeStub(LYRICS, "playing", 1, """
        invoke-static {}, $MEDIA_CONTROLLER->getInstance()$MEDIA_CONTROLLER
        move-result-object v0
        ${menu.playing}
        return-object v0
    """)
    for ((name, getter) in listOf("title" to "getMusicTitle", "author" to "getMusicAuthor")) {
        // No "Unknown" stand-in: without a tag the file's name is what the search gets.
        writeStub(LYRICS, name, 2, """
            check-cast p0, $MESSAGE
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, $MESSAGE->$getter(Z)$STRING
            move-result-object v0
            return-object v0
        """)
    }
    writeStub(LYRICS, "progress", 2, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->audioProgress:F
        return v0
    """)
    writeStub(LYRICS, "duration", 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDuration()D
        move-result-wide v0
        return-wide v0
    """)
    writeStub(LYRICS, "playerDuration", 2, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->audioPlayerDuration:I
        return v0
    """)
    writeStub(LYRICS, "documentId", 4, DOCUMENT_ID)
}

private const val DOCUMENT_ID = """
    check-cast p0, $MESSAGE
    invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
    move-result-object v0
    if-eqz v0, :none
    iget-wide v1, v0, $DOCUMENT->id:J
    return-wide v1
    :none
    const-wide/16 v1, 0x0
    return-wide v1
"""

/** The request that adds, moves or removes a profile song, and each read of the artist in the player's song rows. */
internal class SongDateSites(val saving: MutableMethod, val rows: List<Pair<MutableMethod, List<Int>>>) {
    fun rehearse() {
        hookSaving(MutableMethod(ImmutableMethod.of(saving)))
        rows.forEach { (method, indices) -> replaceAuthors(MutableMethod(ImmutableMethod.of(method)), indices) }
    }

    fun apply() {
        hookSaving(saving)
        rows.forEach { (method, indices) -> replaceAuthors(method, indices) }
    }
}

private fun hookSaving(target: MutableMethod) = target.addInstructions(0, "invoke-static/range {p0 .. p0}, $SONG_SAVING")

/** Each read of the artist asks the extension instead, with the same registers and the same result. */
private fun replaceAuthors(target: MutableMethod, indices: List<Int>) {
    for (index in indices) {
        val call = target.getInstruction(index)
        val registers = call.namedRegisters()
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $SONG_AUTHOR"
        } else {
            "invoke-static {${registers.joinToString(", ") { "v$it" }}}, $SONG_AUTHOR"
        })
    }
}

/**
 * account.saveMusic adds, moves or removes a song on your profile; its serializer runs as it goes
 * out. The player's song rows are the list cell its adapter passes back to the player, which
 * listens for downloads and reads each song's artist.
 */
internal fun BytecodePatchContext.resolveSongDates(player: String): SongDateSites {
    requireStatusMethod("songDates")
    controlHook(SONG_DATES, "saving", listOf(OBJECT), "V")
    controlHook(SONG_DATES, "author", listOf(OBJECT, "I"), STRING)
    controlHook(SONG_DATES, "musicAuthor", listOf(OBJECT, "Z"), STRING)
    for (name in listOf("listedBy", "documentId", "savedId")) controlHook(SONG_DATES, name, listOf(OBJECT), "J")
    controlHook(SONG_DATES, "account", listOf(OBJECT), "I")
    controlHook(SONG_DATES, "unsaves", listOf(OBJECT), "Z")
    controlHook(SONG_DATES, "moves", listOf(OBJECT), "Z")
    controlHook(SONG_DATES, "selfId", listOf("I"), "J")
    controlMembers(SAVE_MUSIC, "id:$INPUT_DOCUMENT", "after_id:$INPUT_DOCUMENT", "unsave:Z")
    controlMembers(INPUT_DOCUMENT, "id:J")
    controlMembers(MESSAGE, "messageOwner:$TL_MESSAGE", "currentAccount:I")
    controlMembers(TL_MESSAGE, "date:I", "peer_id:$PEER")
    controlMembers(PEER, "user_id:J")
    controlMembers(USER_CONFIG, "static getInstance(I)$USER_CONFIG", "getClientUserId()J")

    val saving = tgMutableClassDefByOrNull(SAVE_MUSIC)?.methods.orEmpty().filter {
        it.name == "serializeToStream" && it.parameterTypes.size == 1 && it.returnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.controlBody().isNotEmpty()
    }.controlSingle("the request that saves a song to your profile")

    val takes = tgClassDefByOrNull(player)!!.methods.flatMap { m -> m.parameterTypes.map(CharSequence::toString) }.toSet()
    val rows = mutableListOf<String>()
    // The player listens and reads the artist too, and its own static helpers take it.
    forEachClassMentioning(Mention.reference(MUSIC_AUTHOR)) { cls ->
        if (cls.type != player && LISTENER in cls.origInterfaces && cls.type in takes) rows += cls.type
    }
    val row = tgMutableClassDefBy(rows.distinct().controlSingle("the music player's song rows"))
    val reads = row.methods.mapNotNull { m ->
        val body = m.controlBody()
        body.indices.filter { body[it].opcode in VIRTUAL && body[it].controlRef() == MUSIC_AUTHOR }
            .takeIf { it.isNotEmpty() }?.let { m to it }
    }
    controlShape(reads.isNotEmpty(), "the music player's song rows no longer read the artist")
    return SongDateSites(saving, reads)
}

private fun BytecodePatchContext.writeSongDateStubs() {
    writeStub(SONG_DATES, "musicAuthor", 3, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0, p1}, $MUSIC_AUTHOR
        move-result-object v0
        return-object v0
    """)
    // Telegram lists a profile's songs as messages dated 0 from that profile's owner.
    writeStub(SONG_DATES, "listedBy", 4, """
        check-cast p0, $MESSAGE
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :none
        iget v1, v0, $TL_MESSAGE->date:I
        if-nez v1, :none
        iget-object v0, v0, $TL_MESSAGE->peer_id:$PEER
        if-eqz v0, :none
        iget-wide v1, v0, $PEER->user_id:J
        return-wide v1
        :none
        const-wide/16 v1, 0x0
        return-wide v1
    """)
    writeStub(SONG_DATES, "account", 2, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->currentAccount:I
        return v0
    """)
    writeStub(SONG_DATES, "documentId", 4, DOCUMENT_ID)
    writeStub(SONG_DATES, "savedId", 4, """
        check-cast p0, $SAVE_MUSIC
        iget-object v0, p0, $SAVE_MUSIC->id:$INPUT_DOCUMENT
        if-eqz v0, :none
        iget-wide v1, v0, $INPUT_DOCUMENT->id:J
        return-wide v1
        :none
        const-wide/16 v1, 0x0
        return-wide v1
    """)
    writeStub(SONG_DATES, "unsaves", 2, """
        check-cast p0, $SAVE_MUSIC
        iget-boolean v0, p0, $SAVE_MUSIC->unsave:Z
        return v0
    """)
    writeStub(SONG_DATES, "moves", 2, """
        check-cast p0, $SAVE_MUSIC
        iget-object v0, p0, $SAVE_MUSIC->after_id:$INPUT_DOCUMENT
        if-eqz v0, :stays
        const/4 v0, 0x1
        return v0
        :stays
        const/4 v0, 0x0
        return v0
    """)
    writeStub(SONG_DATES, "selfId", 3, """
        invoke-static {p0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $USER_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
}

private fun signature(method: Method) = "${method.origName}${method.origDescriptor}"
