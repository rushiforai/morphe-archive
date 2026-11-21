package io.github.jordanwoodson.patches.kick.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.jordanwoodson.patches.kick.player.KICK_PLAYER
import io.github.jordanwoodson.patches.kick.player.SetMaxResolutionFingerprint
import io.github.jordanwoodson.patches.kick.player.VIDEO_PLAYER
import io.github.jordanwoodson.patches.kick.player.VIDEO_SIZE
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesOp
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import java.nio.ByteBuffer
import java.nio.ByteOrder

private const val KEY = "default_video_quality"
private const val METERED = "quality_metered"

@Suppress("unused")
val defaultVideoQualityPatch = bytecodePatch(
    name = "Default video quality",
    description = "Caps the default adaptive quality at the selected height: the tallest rendition at or below it, " +
        "or the lowest one when every rendition is taller. Kick can still choose a lower quality. The player's Auto " +
        "option uses this ceiling. A lower starting ceiling can be set for mobile data in Lurk settings > Playback; " +
        "it's off until then." + OTA_UPDATES_OFF,
    default = false,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch, kickSettingsPatch)
    val heights = listOf(1080, 720, 480, 360, 240, 160).map(Int::toString)
    val quality by stringOption(
        key = "quality", default = "1080",
        values = heights.associateBy { "${it}p" },
        title = "Default quality ceiling",
        description = "Adaptive playback ceiling. Without a rendition at this height the next lower one plays (Kick's " +
            "lowest is 160p). Repatch to change this height.",
        required = true,
    ) { it in heights }
    execute {
        val height = quality!!.toInt()
        // Kick's player store starts every stream, and goes back on Auto, through setDefaultMaxResolution: it reduces
        // the stream's video tracks to the tallest one no taller than PlayerConfig.settings.defaultMaxAutoQualityHeight
        // (720) and makes it the player's maxResolution. When every track is taller it sets nothing and the stream
        // plays uncapped. The reducer, the closure setDefaultMaxResolution creates, gets the chosen height and, when
        // every track is taller, keeps the lowest one. The two other reads of the default, in the quality picker,
        // decide which picks need a signed-in account, and stay Kick's.
        capReducer(height)

        // Every ceiling reaches the player as its maxResolution, a video size: the stream's starting one, Auto and a
        // picked quality. On a metered network the mobile-data choice caps a starting ceiling: none, the tallest track
        // no taller than Kick's 720, or the reducer's pick for this patch's height. Any other size is a pick and
        // passes through. Kick's stored choice isn't touched.
        SetMaxResolutionFingerprint.kickMatch("player maxResolution setter").method.apply {
            Locators.record("kick.default_video_quality.set_max_resolution", this)
            addInstructions(0, """
                ${invokeStatic("$KICK_PLAYER->maxResolution(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                    parameterRegister(0), parameterRegister(1))}
                move-result-object p1
                check-cast p1, $VIDEO_SIZE
            """)
        }
        val videoTrack = "Lcom/kick/mobile/playerv3/records/VideoTrack;"
        bridge(KICK_PLAYER, "lurkHeight", "const/16 v0, $height\nreturn v0", locals = 1)
        bridge(KICK_PLAYER, "playerContext", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getContext()Landroid/content/Context;
            move-result-object p0
            return-object p0
        """)
        bridge(KICK_PLAYER, "videoTracks", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getAvailableVideoTracks()Ljava/util/List;
            move-result-object p0
            return-object p0
        """)
        bridge(KICK_PLAYER, "trackHeight", """
            check-cast p0, $videoTrack
            invoke-virtual { p0 }, $videoTrack->getSize()$VIDEO_SIZE
            move-result-object p0
            if-eqz p0, :none
            invoke-virtual { p0 }, $VIDEO_SIZE->getHeight()I
            move-result p0
            return p0
            :none
            const/4 p0, 0x0
            return p0
        """)
        bridge(KICK_PLAYER, "sizeWidth", """
            check-cast p0, $VIDEO_SIZE
            invoke-virtual { p0 }, $VIDEO_SIZE->getWidth()I
            move-result p0
            return p0
        """)
        bridge(KICK_PLAYER, "sizeHeight", """
            check-cast p0, $VIDEO_SIZE
            invoke-virtual { p0 }, $VIDEO_SIZE->getHeight()I
            move-result p0
            return p0
        """)
        bridge(KICK_PLAYER, "videoSize", """
            new-instance v0, $VIDEO_SIZE
            invoke-direct { v0, p0, p1 }, $VIDEO_SIZE-><init>(II)V
            return-object v0
        """, locals = 1)

        kickSettings.add(
            SwitchSetting(KEY, "Default video quality",
                "Caps the starting and Auto quality at ${height}p, or the next quality below it (the lowest when all " +
                    "are above it). Picking a quality in the player works normally.",
                Section.PLAYBACK, restart = true),
            ChoiceSetting(METERED, "Quality on mobile data",
                "The highest quality a stream starts at on metered networks. A quality you pick in the player " +
                    "still plays.", Section.PLAYBACK, "0",
                listOf("Same as on Wi-Fi" to "0", "720p" to "720", "480p" to "480", "360p" to "360", "160p" to "160")),
        )
    }
}

/**
 * The reducer setDefaultMaxResolution creates, `(best, track) => track.size.height <= default && track.size.height >
 * best.height ? {width, height} : best` from `{width: 0, height: 0}`. It reads the track's height, then the default
 * through its environment (PlayerConfig, settings, defaultMaxAutoQualityHeight), then compares:
 * `free = best; if (!(height <= default)) return free; ...; if (!(height > best.height)) return free;` and makes the
 * new size. The chain that reads the default writes only `free`, which the comparisons overwrite first, and the
 * default's register. In the same bytes it becomes:
 *
 *     limit = <height>
 *     free = best.height
 *     if (!free) goto new size                 // no track yet: this one
 *     if (!(free > limit)) goto comparisons    // the best fits: Kick's rule, the tallest track no taller than limit
 *     if (height < free) goto new size         // the best is taller than limit: a lower track replaces it
 *     return best
 *
 * So the reducer ends at the tallest track no taller than the height and, when every track is taller, at the lowest
 * one, in any track order. The jumps land only on Kick's own instructions after the chain (its comparisons and the new
 * size, which reads only the track). `best.height` is read through the replaced read's cache slot, which nothing else
 * in the function uses.
 */
private fun capReducer(height: Int) {
    fun fail(what: String): Nothing = throw PatchException("Kick: the video track reducer $what")
    val reducer = kickHermes.closureUsing(kickHermes.function("setDefaultMaxResolution"), "video track reducer",
        reads = listOf("defaultMaxAutoQualityHeight", "size", "height"))
    val code = kickHermes.instructions(reducer)
    val read = code.singleOrNull(kickHermes.reads("defaultMaxAutoQualityHeight"))
        ?: fail("doesn't read the default height exactly once")
    if (read.opcode != HermesOp.GET_BY_ID) fail("changed how it reads the default height")
    val at = code.indexOf(read)
    val limit = read.u8(1)
    fun parameter(index: Int) = code.singleOrNull { it.opcode == HermesOp.LOAD_PARAM && it.u8(2) == index }?.u8(1)
        ?: fail("no longer loads parameter $index once")
    val best = parameter(1)
    val track = parameter(2)
    // Right after the read: `free = best; if (!(height <= limit)) return free`.
    val move = code.getOrNull(at + 1)
    val compare = code.getOrNull(at + 2)
    if (move?.opcode != HermesOp.MOV || move.u8(2) != best || compare?.opcode != HermesOp.J_NOT_LESS_EQUAL ||
        compare.u8(3) != limit) {
        fail("no longer compares a track's height with the default")
    }
    val trackHeight = compare.u8(2)
    val free = move.u8(1)
    if (setOf(best, track, trackHeight, limit, free).size != 5) fail("shares registers between its values")
    // The chain: everything after the track's height read up to the default read, writing only `free` and `limit`.
    val readsHeight = kickHermes.reads("height")
    val start = (at - 1 downTo 0).firstOrNull { readsHeight(code[it]) && code[it].u8(1) == trackHeight }?.plus(1)
        ?: fail("no longer reads the track's height before the default")
    val chain = code.subList(start, at + 1)
    val chainOps = listOf(HermesOp.GET_PARENT_ENVIRONMENT, HermesOp.LOAD_FROM_ENVIRONMENT, HermesOp.GET_BY_ID,
        HermesOp.GET_BY_ID, HermesOp.GET_BY_ID)
    if (chain.map { it.opcode } != chainOps || chain.dropLast(1).any { it.u8(1) != free }) {
        fail("reads the default through a different chain")
    }
    // The new size comes right after Kick's second comparison, `if (!(height > best.height)) return free`.
    val created = code.singleOrNull(kickHermes.creates("width", "height")) ?: fail("no longer makes one video size")
    val taller = code.getOrNull(code.indexOf(created) - 1)
    if (taller?.opcode != HermesOp.J_NOT_GREATER || taller.target() != compare.target()) {
        fail("no longer compares a track's height with the best one before making its size")
    }
    val cache = read.u8(3)
    val reads = setOf(HermesOp.GET_BY_ID_SHORT, HermesOp.GET_BY_ID)
    if (code.any { it !== read && it.opcode in reads && it.u8(3) == cache }) fail("shares the default read's cache slot")

    val origin = chain.first().offset
    val bytes = mutableListOf<Byte>()
    fun emit(vararg values: Int) = values.forEach { bytes += it.toByte() }
    fun jump(opcode: Int, target: Int, vararg registers: Int) {
        val distance = target - (origin + bytes.size)
        if (distance !in Byte.MIN_VALUE..Byte.MAX_VALUE) fail("is too long for a short jump")
        emit(opcode, distance, *registers)
    }
    emit(HermesOp.LOAD_CONST_INT, limit)
    bytes += ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(height).array().toList()
    bytes += kickHermes.getById(free, best, cache, "height").toList()
    jump(HermesOp.JMP_FALSE, created.offset, free)
    jump(HermesOp.J_NOT_GREATER, move.offset, free, limit)
    jump(HermesOp.J_LESS, created.offset, trackHeight, free)
    emit(HermesOp.RET, best)
    val size = chain.sumOf { it.bytes.size }
    if (bytes.size > size) fail("has too short a chain for the new comparisons")
    // Unreachable padding after the return, should Kick's chain grow.
    val replacement = ByteArray(size) { HermesOp.UNREACHABLE.toByte() }.also { bytes.toByteArray().copyInto(it) }
    kickHermes.replaceInstructions(reducer, KEY, chain, replacement)
}
