/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.autoplay

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.argumentRegister
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Disable video autoplay on each declared build: PostVideo plays its video by its fourth boolean
 * on 450, each feed post's call to PostVideo hands that flag to the extension first,
 * and PostVideo, its playback effect and the full-screen viewer are left as they were.
 */
class DisableVideoAutoplayFixtureTest {
    private val play = "$VIDEO_AUTOPLAY->play(Z)Z"

    @Test
    fun `the extension answers with a boolean`() {
        val method = ExtensionDex.classDef(VIDEO_AUTOPLAY).methods.single { it.name == "play" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(listOf("Z"), method.parameterTypes.map { it.toString() })
        assertEquals("Z", method.returnType)
    }

    @Test
    fun `every declared build plays a post video by the boolean it tests, from single and carousel posts`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val effectTypes = fixture.effect.parameterTypes.map { it.toString() }
            assertEquals(build.name, effectTypes.indexOf("Z"), fixture.effect.requirePlaybackEffect())
            val types = fixture.postVideo.parameterTypes.map { it.toString() }
            // 450 dropped a boolean ahead of the play flag, so it's the fourth there.
            assertEquals(build.name, types.indices.filter { types[it] == "Z" }[3], fixture.postVideo.playParameter(fixture.effect))
            assertTrue(build.name, fixture.sites.any { it.method.holdsNote(POST_SINGLE_MEDIA) })
            assertTrue(build.name, fixture.sites.any { it.method.holdsNote(POST_CAROUSEL) })
            // The viewer reaches PostVideo another way, and holds neither note.
            assertTrue(build.name, fixture.viewer.none { it.holdsNote(POST_SINGLE_MEDIA) || it.holdsNote(POST_CAROUSEL) })
        }
    }

    @Test
    fun `each feed post asks the extension just before PostVideo, and nothing else changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            disableVideoAutoplayPatch.execute(context)

            for ((method, sites) in fixture.sites.groupBy { it.method }) {
                val label = "${build.name} ${method.definingClass}"
                val before = method.body()
                val after = context.method(method)
                val calls = sites.map { it.call }
                // Where an instruction of the original lands once two are put in front of each call.
                fun moved(index: Int) = index + 2 * calls.count { it < index }
                assertEquals(label, before.size + 2 * calls.size, after.size)
                for (site in sites) {
                    val hook = after[moved(site.call)] as RegisterRangeInstruction
                    assertEquals(label, play, (hook as ReferenceInstruction).reference.toString())
                    assertEquals(label, site.register, hook.startRegister)
                    assertEquals(label, 1, hook.registerCount)
                    assertEquals(label, Opcode.MOVE_RESULT, after[moved(site.call) + 1].opcode)
                    assertEquals(label, site.register, (after[moved(site.call) + 1] as OneRegisterInstruction).registerA)
                    val call = after[moved(site.call) + 2]
                    assertEquals(label, before[site.call].reference(), call.reference())
                    assertEquals(label, site.register, call.argumentRegister(fixture.postVideo.argumentOffset(site.parameter)))
                    // A branch aimed at the call now lands on the question.
                    for (branch in before.indices.filter { before.aims(it, site.call) }) {
                        assertTrue(label, after.aims(moved(branch), moved(site.call)))
                    }
                }
                val hooks = calls.flatMap { listOf(moved(it), moved(it) + 1) }.toSet()
                assertEquals(label, before.map { it.opcode }, after.filterIndexed { i, _ -> i !in hooks }.map { it.opcode })
            }
            for (untouched in listOf(fixture.postVideo, fixture.effect) + fixture.viewer) {
                assertEquals(build.name, untouched.body().map { it.opcode }, context.method(untouched).map { it.opcode })
            }
            assertEquals(build.name, 1, status(context))
        }
    }

    @Test
    fun `PostVideo that plays by another boolean is followed, and by anything else is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val postVideo = fixture.postVideo
            val play = postVideo.playParameter(fixture.effect)
            val base = postVideo.implementation!!.registerCount - postVideo.parameterTypes.size
            val parameter = base + postVideo.argumentOffset(play)
            val types = postVideo.parameterTypes.map { it.toString() }
            val firstBoolean = types.indexOf("Z")
            assertEquals(build.name, "I", types[firstBoolean - 1])

            // PostVideo copies the flag before testing it. Copy the boolean before it instead, as a
            // build with its booleans in another order would, and the patch follows that one.
            fun repointed(register: Int) = context(fixture).also { context ->
                val other = context.mutableMethod(postVideo)
                val copy = other.body().indexOfFirst { it.opcode.name.startsWith("move") && (it as? TwoRegisterInstruction)?.registerB == parameter }
                assertTrue(build.name, copy >= 0)
                other.replaceInstruction(copy, "move/from16 v${(other.body()[copy] as TwoRegisterInstruction).registerA}, v$register")
            }
            assertEquals(build.name, play - 1, repointed(parameter - 1).mutableMethod(postVideo).playParameter(fixture.effect))

            // An int ahead of the booleans isn't a play flag.
            val noTest = assertThrows(build.name, PatchException::class.java) {
                disableVideoAutoplayPatch.execute(repointed(base + postVideo.argumentOffset(firstBoolean - 1)))
            }
            assertTrue(noTest.message.orEmpty(), noTest.message.orEmpty().contains("never tests one of its booleans"))

            val computed = context(fixture)
            val copied = computed.mutableMethod(postVideo)
            val write = postVideo.playWrite(fixture.effect)
            val register = (copied.body()[write] as OneRegisterInstruction).registerA
            copied.replaceInstruction(write, "move/from16 v$register, v0")
            val notLiteral = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(computed) }
            assertTrue(notLiteral.message.orEmpty(), notLiteral.message.orEmpty().contains("isn't set from the boolean it tests"))

            // A build that plays when the boolean is false, or never plays, isn't one the hook can hold.
            val shape = postVideo.playTest(fixture.effect)
            for (value in listOf<(Int) -> Int>({ 1 - it }, { 0 })) {
                val flipped = context(fixture)
                val method = flipped.mutableMethod(postVideo)
                (shape.test + 1 until shape.call).filter {
                    (method.body()[it] as? OneRegisterInstruction)?.registerA == shape.argument && method.body()[it] is NarrowLiteralInstruction
                }.forEach { at ->
                    val literal = (method.body()[at] as NarrowLiteralInstruction).narrowLiteral
                    method.replaceInstruction(at, "const/16 v${shape.argument}, ${value(literal)}")
                }
                val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(flipped) }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("doesn't follow the boolean it tests"))
            }
        }
    }

    @Test
    fun `a feed post that reads the flag again after PostVideo is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val site = fixture.sites.first()
            val context = context(fixture)
            context.mutableMethod(site.method).addInstructions(site.call + 1, "move/from16 v0, v${site.register}")
            val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("reads v${site.register} again after PostVideo"))
        }
    }

    @Test
    fun `no carousel call, or a second PostVideo, is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val noCarousel = context(fixture)
            for (site in fixture.sites.filter { it.method.holdsNote(POST_CAROUSEL) }) {
                val method = noCarousel.mutableMethod(site.method)
                method.body().indices.filter { method.body()[it].getReference<StringReference>()?.string?.startsWith(POST_CAROUSEL) == true }.forEach {
                    method.replaceInstruction(it, "const-string v${(method.body()[it] as OneRegisterInstruction).registerA}, \"some other composable\"")
                }
            }
            val missing = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(noCarousel) }
            assertTrue(missing.message.orEmpty(), missing.message.orEmpty().contains("no call to PostVideo holds \"$POST_CAROUSEL\""))

            val twice = context(fixture)
            twice.mutableClassDefBy(fixture.postVideo.definingClass).methods.add(MutableMethod(ImmutableMethod(
                fixture.postVideo.definingClass, "copyOfPostVideo", fixture.postVideo.parameters, fixture.postVideo.returnType,
                fixture.postVideo.accessFlags, null, null, ImmutableMethodImplementation.of(fixture.postVideo.implementation),
            )))
            val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(twice) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("found 2. Candidates"))
        }
    }

    @Test
    fun `before the patch runs, no feed post asks and the status says it isn't in`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            for (site in fixture.sites) {
                assertFalse(build.name, context.method(site.method).any { (it as? ReferenceInstruction)?.reference?.toString() == play })
            }
            assertEquals(build.name, 0, status(context))
        }
    }

    private data class Site(val method: Method, val call: Int, val register: Int, val parameter: Int)

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val postVideo: Method,
        val effect: Method,
        val sites: List<Site>,
        val viewer: List<Method>,
    )

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val notes = listOf(POST_VIDEO, PLAYBACK_EFFECT, POST_SINGLE_MEDIA, POST_CAROUSEL, MEDIA_VIEWER)
        val classes = FixtureDex.classesWhere(build, { true }) { method -> notes.any { method.holdsNote(it) } }
        val methods = classes.flatMap { it.methods }
        val postVideo = methods.single { it.holdsNote(POST_VIDEO) }
        val effect = methods.single { it.holdsNote(PLAYBACK_EFFECT) }
        val parameter = postVideo.playParameter(effect)
        val sites = methods.filter { it.holdsNote(POST_SINGLE_MEDIA) || it.holdsNote(POST_CAROUSEL) }.flatMap { method ->
            val body = method.body()
            body.indices.filter { body[it].reference() == postVideo.reference() }.map {
                Site(method, it, body[it].argumentRegister(postVideo.argumentOffset(parameter))!!, parameter)
            }
        }
        Fixture(classes, postVideo, effect, sites, methods.filter { it.holdsNote(MEDIA_VIEWER) })
    }

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes)

    /** The last literal PostVideo writes as the effect's play argument before calling it. */
    private fun Method.playWrite(effect: Method): Int {
        val body = body()
        val call = body.indices.single { body[it].reference() == effect.reference() }
        val playArgument = body[call].argumentRegister(effect.argumentOffset(effect.requirePlaybackEffect()))!!
        return (call - 1 downTo 0).first {
            (body[it] as? OneRegisterInstruction)?.registerA == playArgument && body[it] is NarrowLiteralInstruction
        }
    }

    private fun Method.argumentOffset(parameter: Int) =
        parameterTypes.take(parameter).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.reference() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.reference() = getReference<MethodReference>()?.let {
        "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
    }

    private fun BytecodePatchContext.mutableMethod(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }

    private fun BytecodePatchContext.method(method: Method): List<Instruction> = mutableMethod(method).body()

    private fun List<Instruction>.addressOf(index: Int) = subList(0, index).sumOf { it.codeUnits }

    private fun List<Instruction>.aims(branch: Int, target: Int) =
        this[branch] is OffsetInstruction && addressOf(branch) + (this[branch] as OffsetInstruction).codeOffset == addressOf(target)

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "disableVideoAutoplay" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** The full-screen viewer's video composable, which must stay as Threads wrote it. */
        const val MEDIA_VIEWER = "com.instagram.barcelona.feed.mediaviewer.ui.MediaViewerVideo"

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = mutableMapOf<File, Fixture>()
    }
}
