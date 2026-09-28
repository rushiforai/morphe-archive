/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.resume

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootBinds
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.media.taptoplay.isEnumNaming
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Resume long videos' anchors on every Facebook build the bundle declares: FbGrootPlayer's kept
 * maybeTrackVideoStart and maybeTrackVideoStop, its release, its bind, its static seek and the
 * public seek that hands on to it, its params getter, the one interface declaring isPlaying() and
 * its one position reader, Facebook's remaining-time method and the length reader it asks, each
 * there once; the trigger enum naming every trigger the extension reads; and VideoPlayerParams'
 * debug dump reporting every field the extension reads, each with its type. Then the patch itself,
 * run on those classes: each hook first in its method, reading the method's own arguments, and each
 * stub calling the method it stands for. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and
 * skips without it.
 */
class ResumeLongVideosFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    @Test
    fun `each declared build has every anchor once, and the patch goes in on its own classes`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = fixture.name
                val holders = FixtureDex.classesHolding(fixture, GROOT_PLAY)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val plays = holders.flatMap(::grootPlays)
                assertEquals("$name: players' plays holding \"$GROOT_PLAY\"", 1, plays.size)
                val play = plays.single()
                val trigger = play.parameterTypes.single().toString()
                val owner = holders.single { it.type == play.definingClass }

                val classes = FixtureDex.classes(fixture, setOf(trigger, VIDEO_PLAYER_PARAMS) + owner.interfaces)
                val triggerEnum = classes.getValue(trigger)
                assertTrue("$name: the trigger enum doesn't name ${RESUME_TRIGGER_NAMES.joinToString()}",
                    isEnumNaming(triggerEnum, RESUME_TRIGGER_NAMES))

                val start = trackers(owner, TRACK_START, trigger)
                val stop = trackers(owner, TRACK_STOP, trigger)
                assertEquals("$name: $TRACK_START", 1, start.size)
                assertEquals("$name: $TRACK_STOP", 1, stop.size)
                assertEquals("$name: releases", 1, releases(owner, trigger).size)
                assertEquals("$name: binds", 1, grootBinds(owner).size)
                val safeSeek = safeSeeks(owner, trigger)
                assertEquals("$name: static seeks", 1, safeSeek.size)
                val seekTo = seekTos(owner, trigger, safeSeek.single())
                assertEquals("$name: public seeks", 1, seekTo.size)
                assertEquals("$name: params getters", 1, paramsGetters(owner).size)

                val interfaces = owner.interfaces.mapNotNull { classes[it] }
                assertEquals("$name: interfaces read", owner.interfaces.size, interfaces.size)
                val playing = playingInterfaces(interfaces)
                assertEquals("$name: interfaces declaring isPlaying()", 1, playing.size)
                val position = positionReaders(owner, playing.single())
                assertEquals("$name: position readers", 1, position.size)

                val paramsClass = classes.getValue(VIDEO_PLAYER_PARAMS)
                val dumps = paramDumps(paramsClass)
                assertEquals("$name: VideoPlayerParams' dumps", 1, dumps.size)
                val reported = reportedValues(dumps.single())
                assertEquals("$name: fields reported wrong", emptyList<String>(), wrongParamFields(reported))
                // Every field the extension reads is a different field, as the dump reports them.
                assertEquals("$name: two names on one field", PARAM_FIELDS.size,
                    PARAM_FIELDS.keys.map { reported.getValue(it).name }.toSet().size)
                // The id is the field the params' own toString says after "VideoId: ", which the reel
                // download already names its files by.
                val toString = paramsClass.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }
                assertTrue("$name: toString doesn't say \"VideoId: \"", holdsString(toString, "VideoId: "))
                assertTrue("$name: toString doesn't read the reported id field",
                    toString.implementation!!.instructions.any {
                        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == reported.getValue("videoId").name
                    })

                val remaining = remainingReaders(owner, position.single(), reported.getValue("videoDurationMs").name)
                assertEquals("$name: remaining-time methods", 1, remaining.size)
                val length = lengthReaders(owner, remaining.single(), position.single())
                assertEquals("$name: length readers", 1, length.size)
                // The remaining time is the length less the position: a sub-int in the method.
                assertTrue("$name: the remaining-time method subtracts nothing",
                    remaining.single().implementation!!.instructions.any { it.opcode == Opcode.SUB_INT_2ADDR || it.opcode == Opcode.SUB_INT })

                // The patch, on this build's own classes.
                val context = PatchContexts.of(
                    listOf(owner, triggerEnum, paramsClass, ExtensionDex.classDef(RESUME_PLAYBACK),
                        ExtensionDex.classDef(SETTINGS_STATUS)) + interfaces,
                )
                resumeLongVideosPatch.execute(context)
                val patchedOwner = context.mutableClassDefBy(owner.type)
                fun patched(method: Method) = patchedOwner.methods.single {
                    it.name == method.name && it.returnType == method.returnType &&
                        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }

                listOf(
                    Triple(start.single(), STARTED, 2),
                    Triple(stop.single(), STOPPED, 2),
                    Triple(releases(owner, trigger).single(), RELEASED, 2),
                    Triple(grootBinds(owner).single(), REBOUND, 1),
                    Triple(safeSeek.single(), SEEKING, 3),
                ).forEach { (original, hook, arguments) ->
                    val told = patched(original)
                    val code = told.implementation!!.instructions.toList()
                    assertEquals("$name: ${original.name}'s hook", Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
                    assertEquals("$name: ${original.name}'s hook", hook, code[0].call.toString())
                    val first = told.localRegisterCount()
                    assertEquals("$name: ${original.name}'s hook reads its own arguments",
                        (first until first + arguments).toList(), code[0].registers())
                    assertEquals("$name: ${original.name} grew by the hook alone",
                        original.implementation!!.instructions.count() + 1, code.size)
                    assertEquals("$name: ${original.name}'s own first instruction follows",
                        original.implementation!!.instructions.first().opcode, code[1].opcode)
                }

                val extension = context.mutableClassDefBy(RESUME_PLAYBACK)
                fun stub(stubName: String) = extension.methods.single { it.name == stubName }.implementation!!.instructions.toList()
                fun calledBy(stubName: String) = stub(stubName).mapNotNull { it.call }.first()
                assertEquals("$name: position stub", "${owner.type}->${position.single().name}()I", calledBy(POSITION_STUB).toString())
                assertEquals("$name: length stub", "${owner.type}->${length.single().name}()I", calledBy(DURATION_STUB).toString())
                assertEquals("$name: params stub", "${owner.type}->${paramsGetters(owner).single().name}()$VIDEO_PLAYER_PARAMS",
                    calledBy(PARAMS_STUB).toString())
                assertEquals("$name: seek stub", "${owner.type}->${seekTo.single().name}(${trigger}I)V", calledBy(SEEK_STUB).toString())
                assertEquals("$name: the seek stub casts the trigger to its enum", trigger,
                    stub(SEEK_STUB).filter { it.opcode == Opcode.CHECK_CAST }
                        .map { ((it as ReferenceInstruction).reference as TypeReference).type }[1])
                val names = stub(FIELDS_STUB).firstNotNullOf { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                assertEquals("$name: the field names the stub answers", paramFieldNames(reported), names)
                PARAM_FIELDS.keys.forEach { reportedName ->
                    val field = reported.getValue(reportedName)
                    assertTrue("$name: $reportedName's field ${field.name} isn't declared by the params",
                        paramsClass.fields.any { it.name == field.name && it.type == field.type && !AccessFlags.STATIC.isSet(it.accessFlags) })
                }
                checked += version
            }
        }
        assertEquals("builds checked", versions, checked)
    }
}
