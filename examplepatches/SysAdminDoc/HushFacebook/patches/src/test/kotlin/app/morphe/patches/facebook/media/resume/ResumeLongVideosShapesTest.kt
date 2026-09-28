/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.resume

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.media.taptoplay.GROOT_BIND
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The shapes Resume long videos finds its hooks by, each beside the near miss it must not take,
 * the params' field pairs read through String.valueOf, and the patch run on a small build made of
 * them: what goes first in each method, which method each stub calls, and what stops it.
 */
class ResumeLongVideosShapesTest {
    private val trigger = "Lfixture/Trigger;"
    private val player = "Lfixture/Player;"
    private val playing = "Lfixture/Playing;"
    private val other = "Lfixture/Other;"
    private val reporter = "Lfixture/Reporter;"
    private val string = "Ljava/lang/String;"

    /** The params' fields: the reported name, the field's name and its type. */
    private val paramFields = listOf(
        Triple("videoId", "id", string),
        Triple("videoDurationMs", "duration", "I"),
        Triple("startPositionMs", "start", "I"),
        Triple("isLiveNow", "live", "Z"),
        Triple("isFbShorts", "shorts", "Z"),
        Triple("isSponsored", "sponsored", "Z"),
        Triple("shouldLoopVideo", "loop", "Z"),
        Triple("isAnimatedGifVideo", "gif", "Z"),
        Triple("isAudioOnly", "audio", "Z"),
    )

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
        body: String,
        registers: Int = 4,
        static: Boolean = false,
        abstract: Boolean = false,
    ): Method {
        val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0) or
            (if (abstract) AccessFlags.ABSTRACT.value else 0)
        if (abstract) {
            return ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
                flags, null, null, null)
        }
        return MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, body.trimIndent()) }
    }

    private fun classDef(
        type: String,
        superclass: String,
        interfaces: List<String>,
        vararg methods: Method,
        flags: Int = AccessFlags.PUBLIC.value,
        fields: List<ImmutableField> = emptyList(),
    ): ClassDef = ImmutableClassDef(type, flags, superclass, interfaces, null, null, fields, methods.map(ImmutableMethod::of))

    private fun holding(text: String) = """
        const-string v0, "$text"
        return-void
    """

    private val done = "return-void"

    private fun enumNaming(names: List<String>) = classDef(
        trigger, "Ljava/lang/Enum;", emptyList(),
        method(trigger, "<clinit>", emptyList(), "V",
            names.joinToString("\n") { "const-string v0, \"$it\"" } + "\nreturn-void", registers = 1, static = true),
    )

    private fun playingInterface(vararg extra: Method) = classDef(
        playing, "Ljava/lang/Object;", emptyList(),
        method(playing, IS_PLAYING, emptyList(), "Z", "", abstract = true),
        method(playing, "position", emptyList(), "I", "", abstract = true),
        *extra,
        flags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
    )

    private fun safeSeek() = method(player, "safeSeek", listOf(trigger, player, "I", "Z"), "V", holding(GROOT_SAFE_SEEK),
        static = true)

    private fun seekWith() = method(
        player, "seekWith", listOf(trigger, "I", "Z"), "V",
        """
            invoke-static {p1, p0, p2, p3}, $player->safeSeek($trigger${player}IZ)V
            return-void
        """,
    )

    private fun seekTo(handsOn: Boolean = true) = method(
        player, "seekTo", listOf(trigger, "I"), "V",
        if (handsOn) {
            """
                const/4 v0, 0x0
                invoke-virtual {p0, p1, p2, v0}, $player->seekWith(${trigger}IZ)V
                return-void
            """
        } else {
            done
        },
    )

    private fun remaining(readsDuration: Boolean = true) = method(
        player, "remaining", emptyList(), "J",
        """
            invoke-virtual {p0}, $player->length()I
            move-result v0
            invoke-virtual {p0}, $player->params()$VIDEO_PLAYER_PARAMS
            move-result-object v1
            iget v2, v1, $VIDEO_PLAYER_PARAMS->${if (readsDuration) "duration" else "start"}:I
            invoke-virtual {p0}, $player->position()I
            move-result v1
            sub-int/2addr v0, v1
            int-to-long v0, v0
            return-wide v0
        """,
    )

    private fun playerMethods(): List<Method> = listOf(
        method(player, "play", listOf(trigger), "V", holding(GROOT_PLAY)),
        method(player, TRACK_START, listOf(trigger), "V", done),
        method(player, TRACK_STOP, listOf(trigger), "V", done),
        method(player, "release", listOf(trigger, string), "V", holding(GROOT_RELEASE)),
        method(player, "bind", listOf("Ljava/lang/Object;"), "V", holding(GROOT_BIND)),
        safeSeek(), seekWith(), seekTo(),
        method(player, "params", emptyList(), VIDEO_PLAYER_PARAMS, "const/4 v0, 0x0\nreturn-object v0"),
        method(player, IS_PLAYING, emptyList(), "Z", "const/4 v0, 0x0\nreturn v0"),
        method(player, "position", emptyList(), "I", "const/4 v0, 0x0\nreturn v0"),
        method(player, "length", emptyList(), "I", "const/4 v0, 0x0\nreturn v0"),
        remaining(),
    )

    private fun groot(
        methods: List<Method> = playerMethods(),
        interfaces: List<String> = listOf(playing, other),
        flags: Int = AccessFlags.PUBLIC.value,
    ) = classDef(player, "Ljava/lang/Object;", interfaces, *methods.toTypedArray(), flags = flags)

    /** The params' debug dump: a string straight to the reporter, a number or a flag through String.valueOf. */
    private fun dumpBody(fields: List<Triple<String, String, String>>): String = fields.joinToString("\n") { (name, field, type) ->
        when (type) {
            string -> """
                const-string v1, "$name"
                iget-object v0, p0, $VIDEO_PLAYER_PARAMS->$field:$string
                invoke-virtual {p1, v1, v0}, $reporter->add(${string}${string})V
            """.trimIndent()
            else -> """
                ${if (type == "Z") "iget-boolean" else "iget"} v0, p0, $VIDEO_PLAYER_PARAMS->$field:$type
                invoke-static {v0}, $string->valueOf($type)$string
                move-result-object v1
                const-string v0, "$name"
                invoke-virtual {p1, v0, v1}, $reporter->add(${string}${string})V
            """.trimIndent()
        }
    } + "\nreturn-void"

    private fun params(fields: List<Triple<String, String, String>> = paramFields) = classDef(
        VIDEO_PLAYER_PARAMS, "Ljava/lang/Object;", emptyList(),
        method(VIDEO_PLAYER_PARAMS, "dump", listOf(reporter), "V", dumpBody(fields), registers = 4),
        fields = fields.map { (_, field, type) -> ImmutableField(VIDEO_PLAYER_PARAMS, field, type, AccessFlags.PUBLIC.value, null, null, null) },
    )

    private fun build(
        grootPlayer: ClassDef = groot(),
        triggerEnum: ClassDef = enumNaming(RESUME_TRIGGER_NAMES),
        playingFace: ClassDef = playingInterface(),
        paramsClass: ClassDef = params(),
    ) = PatchContexts.of(
        listOf(grootPlayer, triggerEnum, playingFace, classDef(other, "Ljava/lang/Object;", emptyList(),
            flags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value),
            paramsClass, ExtensionDex.classDef(RESUME_PLAYBACK), ExtensionDex.classDef(SETTINGS_STATUS)),
    )

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    @Test
    fun `the params' fields are read through String valueOf into the reporter`() {
        val reported = reportedValues(params().methods.single { it.name == "dump" })
        assertEquals(paramFields.associate { it.first to it.second }, reported.mapValues { it.value.name })
        assertEquals(emptyList<String>(), wrongParamFields(reported))
        assertEquals("videoId=id;videoDurationMs=duration;startPositionMs=start;isLiveNow=live;isFbShorts=shorts;" +
            "isSponsored=sponsored;shouldLoopVideo=loop;isAnimatedGifVideo=gif;isAudioOnly=audio", paramFieldNames(reported))

        // A value that goes to some other call first, a name loaded after the call, and a register
        // written over between the field and the report aren't pairs.
        val strays = method(
            VIDEO_PLAYER_PARAMS, "dump", listOf(reporter), "V",
            """
                iget v0, p0, $VIDEO_PLAYER_PARAMS->duration:I
                invoke-static {v0}, Ljava/lang/Math;->abs(I)I
                move-result v0
                const-string v1, "videoDurationMs"
                invoke-virtual {p1, v1, v0}, $reporter->add(${string}I)V
                iget-object v0, p0, $VIDEO_PLAYER_PARAMS->id:$string
                invoke-virtual {p1, v1, v0}, $reporter->add(${string}${string})V
                const-string v1, "videoId"
                iget-boolean v0, p0, $VIDEO_PLAYER_PARAMS->live:Z
                const/4 v0, 0x1
                const-string v1, "isLiveNow"
                invoke-virtual {p1, v1, v0}, $reporter->add(${string}Z)V
                return-void
            """,
        )
        val strayPairs = reportedValues(strays)
        assertEquals("only the id, under the name loaded before it", mapOf("videoDurationMs" to "id"),
            strayPairs.mapValues { it.value.name })
        assertTrue(wrongParamFields(strayPairs).contains("videoDurationMs ($string, wanted I)"))
        assertTrue(wrongParamFields(strayPairs).contains("videoId (missing)"))
    }

    @Test
    fun `the anchors take the shapes they're written for and not their near misses`() {
        val owner = groot()
        assertEquals(1, trackers(owner, TRACK_START, trigger).size)
        assertEquals(0, trackers(groot(listOf(method(player, TRACK_START, listOf(trigger, "I"), "V", done))), TRACK_START, trigger).size)
        assertEquals(0, trackers(groot(listOf(method(player, TRACK_START, listOf(trigger), "V", done, static = true))),
            TRACK_START, trigger).size)
        assertEquals(1, releases(owner, trigger).size)
        assertEquals(0, releases(groot(listOf(method(player, "release", listOf(trigger), "V", holding(GROOT_RELEASE)))), trigger).size)
        assertEquals(0, releases(groot(listOf(method(player, "release", listOf(trigger, string), "V", holding("FbGrootPlayer.release")))),
            trigger).size)

        val seek = safeSeeks(owner, trigger).single()
        assertEquals("an instance seek", 0, safeSeeks(groot(listOf(method(player, "safeSeek", listOf(trigger, player, "I", "Z"), "V",
            holding(GROOT_SAFE_SEEK), registers = 6))), trigger).size)
        assertEquals("seekTo", seekTos(owner, trigger, seek).single().name)
        assertEquals("a seek that hands on to nothing", 0,
            seekTos(groot(listOf(safeSeek(), seekWith(), seekTo(handsOn = false))), trigger, seek).size)
        assertEquals("a seek straight to the static one, with no flag step", 0, seekTos(groot(listOf(safeSeek(),
            method(player, "seekTo", listOf(trigger, "I"), "V",
                "const/4 v0, 0x0\ninvoke-static {p1, p0, p2, v0}, $player->safeSeek($trigger${player}IZ)V\nreturn-void"))),
            trigger, seek).size)

        assertEquals(1, paramsGetters(owner).size)
        assertEquals(0, paramsGetters(groot(listOf(method(player, "params", listOf("I"), VIDEO_PLAYER_PARAMS,
            "const/4 v0, 0x0\nreturn-object v0")))).size)

        val faces = listOf(playingInterface(), classDef(other, "Ljava/lang/Object;", emptyList()))
        assertEquals(listOf(playing), playingInterfaces(faces).map { it.type })
        val position = positionReaders(owner, playingInterfaces(faces).single()).single()
        assertEquals("position", position.name)
        val remaining = remainingReaders(owner, position, "duration").single()
        assertEquals("length", lengthReaders(owner, remaining, position).single().name)
        assertEquals("a remaining time that doesn't read the duration", 0,
            remainingReaders(groot(playerMethods() - playerMethods().last() + remaining(readsDuration = false)),
                position, "duration").size)
    }

    @Test
    fun `the patch puts each hook first and fills each stub with the player's own method`() {
        val context = build()
        resumeLongVideosPatch.execute(context)
        val owner = context.mutableClassDefBy(player)
        fun first(name: String) = owner.methods.single { it.name == name }.let { it to it.implementation!!.instructions.first() }

        listOf(TRACK_START to STARTED, TRACK_STOP to STOPPED, "release" to RELEASED, "bind" to REBOUND, "safeSeek" to SEEKING)
            .forEach { (name, hook) ->
                val (method, instruction) = first(name)
                assertEquals(name, Opcode.INVOKE_STATIC_RANGE, instruction.opcode)
                assertEquals(name, hook, instruction.call.toString())
                val arguments = when (name) {
                    "bind" -> 1
                    "safeSeek" -> 3
                    else -> 2
                }
                assertEquals("$name reads its own arguments",
                    (method.localRegisterCount() until method.localRegisterCount() + arguments).toList(), instruction.registers())
            }
        assertEquals("the play isn't touched", Opcode.CONST_STRING, first("play").second.opcode)

        val extension = context.mutableClassDefBy(RESUME_PLAYBACK)
        fun stub(name: String) = extension.methods.single { it.name == name }.implementation!!.instructions.toList()
        assertEquals("$player->position()I", stub(POSITION_STUB).firstNotNullOf { it.call }.toString())
        assertEquals("$player->length()I", stub(DURATION_STUB).firstNotNullOf { it.call }.toString())
        assertEquals("$player->params()$VIDEO_PLAYER_PARAMS", stub(PARAMS_STUB).firstNotNullOf { it.call }.toString())
        val seek = stub(SEEK_STUB)
        assertEquals("$player->seekTo(${trigger}I)V", seek.firstNotNullOf { it.call }.toString())
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.CONST_4, Opcode.RETURN),
            seek.take(5).map { it.opcode })
        assertEquals("videoId=id;videoDurationMs=duration;startPositionMs=start;isLiveNow=live;isFbShorts=shorts;" +
            "isSponsored=sponsored;shouldLoopVideo=loop;isAnimatedGifVideo=gif;isAudioOnly=audio",
            stub(FIELDS_STUB).firstNotNullOf { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string })
    }

    @Test
    fun `a build the rule can't be sure of stops the patch`() {
        fun refusal(context: BytecodePatchContext) =
            assertThrows(PatchException::class.java) { resumeLongVideosPatch.execute(context) }.message.orEmpty()

        fun without(name: String) = groot(playerMethods().filterNot { it.name == name })

        assertTrue(refusal(build(triggerEnum = enumNaming(RESUME_TRIGGER_NAMES - "BY_PLAYER"))).contains("isn't an enum naming"))
        assertTrue(refusal(build(grootPlayer = without(TRACK_START))).contains(TRACK_START))
        assertTrue(refusal(build(grootPlayer = without(TRACK_STOP))).contains(TRACK_STOP))
        assertTrue(refusal(build(grootPlayer = without("release"))).contains(GROOT_RELEASE))
        assertTrue(refusal(build(grootPlayer = without("seekWith"))).contains("seek taking the trigger and an int"))
        assertTrue(refusal(build(grootPlayer = without("params"))).contains(VIDEO_PLAYER_PARAMS))
        assertTrue(refusal(build(grootPlayer = without("remaining"))).contains("remaining-time method"))
        assertTrue(refusal(build(grootPlayer = groot(interfaces = listOf(other)))).contains("declaring $IS_PLAYING()"))
        assertTrue(refusal(build(playingFace = playingInterface(method(playing, "buffered", emptyList(), "I", "", abstract = true))))
            .contains("int method of $playing"))
        assertTrue(refusal(build(paramsClass = params(paramFields.filterNot { it.first == "isFbShorts" })))
            .contains("reporting"))
        assertTrue(refusal(build(paramsClass = params(paramFields.map {
            if (it.first == "videoDurationMs") Triple(it.first, it.second, "Z") else it
        }))).contains("videoDurationMs (Z, wanted I)"))
        assertTrue(refusal(build(grootPlayer = groot(flags = AccessFlags.FINAL.value))).contains("isn't public"))
    }
}
