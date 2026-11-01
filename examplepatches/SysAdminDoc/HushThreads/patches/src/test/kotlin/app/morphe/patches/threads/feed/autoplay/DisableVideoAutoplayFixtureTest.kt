/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.autoplay

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.argumentRegister
import app.morphe.util.getReference
import app.morphe.util.readsAfter
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
 * on 450, 451 and 452, each feed post's call to PostVideo hands that flag to the extension first, and so do the
 * Instagram post, trend preview and ad card calls. The two of those that leave the flag to
 * PostVideo's default get that default's bit cleared and ask about the default's 1 instead.
 * 451 and 452 send those embeds through a shortened forwarder. PostVideo, that forwarder, its playback
 * effect and the full-screen viewer are left as they were.
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
    fun `PostVideo plays by its default when a caller's mask says so, and the trend preview, the ad card and the viewer do`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val types = fixture.postVideo.parameterTypes.map { it.toString() }
            // On 450 the default mask is PostVideo's last int, and the flag's default, a 1, sits behind its 0x4000 bit.
            assertEquals(build.name, PlayDefault(types.lastIndexOf("I"), PLAY_BIT, 1), fixture.postVideo.playDefault(fixture.postVideo.playTest(fixture.effect)))
            for (note in EMBEDS) assertEquals("${build.name} $note", 1, fixture.embeds.count { it.method.holdsNote(note) })
            // Feed posts and the Instagram post hand PostVideo their own flag. The trend preview and the
            // ad card leave it to the default, so a hook on what they pass would never be read.
            assertTrue(build.name, fixture.sites.none { it.defaulted })
            assertEquals(build.name, listOf(false, true, true), EMBEDS.map { note -> fixture.embeds.single { it.method.holdsNote(note) }.defaulted })
            // The viewer leaves it to the default too, so a hook at PostVideo's default would hold the viewer.
            assertTrue(build.name, fixture.viewerCalls.isNotEmpty() && fixture.viewerCalls.all { it.defaulted })
            assertTrue(build.name, fixture.viewer.none { viewer -> VIDEO_CALLERS.any { viewer.holdsNote(it) } })
        }
    }

    @Test
    fun `each feed post asks the extension just before PostVideo, and nothing else changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            disableVideoAutoplayPatch.execute(context)

            assertAsksBefore(build, context, fixture.sites)
            for (untouched in listOfNotNull(fixture.postVideo, fixture.effect, fixture.forwarder) + fixture.viewer) {
                assertEquals(build.name, untouched.body().map { it.opcode }, context.method(untouched).map { it.opcode })
            }
            assertEquals(build.name, 1, status(context))
        }
    }

    @Test
    fun `Instagram posts, trend previews and ad cards ask the extension just before PostVideo, and the viewer stays as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            disableVideoAutoplayPatch.execute(context)

            assertAsksBefore(build, context, fixture.embeds)
            for (untouched in listOfNotNull(fixture.postVideo, fixture.effect, fixture.forwarder) + fixture.viewer) {
                assertEquals(build.name, untouched.body().map { it.opcode }, context.method(untouched).map { it.opcode })
            }
        }
    }

    /**
     * Each of [sites] hands its play flag to the extension just before its call. A defaulted one
     * first gets its mask without the flag's bit and the default's 1 in the flag's register. A
     * branch aimed at the call lands on the first of those, nothing reads them after the call, and
     * nothing else in the method changes.
     */
    private fun assertAsksBefore(build: File, context: BytecodePatchContext, sites: List<Site>) {
        for ((method, inMethod) in sites.groupBy { it.method }) {
            val label = "${build.name} ${method.definingClass}"
            val before = method.body()
            val after = context.method(method)
            // Two instructions go in front of a call, four in front of a defaulted one.
            fun added(site: Site) = if (site.defaulted) 4 else 2
            // Where an instruction of the original lands once those are put in front of each call.
            fun moved(index: Int) = index + inMethod.filter { it.call < index }.sumOf(::added)
            assertEquals(label, before.size + inMethod.sumOf(::added), after.size)
            for (site in inMethod) {
                assertEquals(label, emptyList<Int>(), method.readsAfter(site.call, site.register))
                var at = moved(site.call)
                if (site.defaulted) {
                    assertEquals(label, emptyList<Int>(), method.readsAfter(site.call, site.maskRegister))
                    assertEquals(label, Opcode.CONST, after[at].opcode)
                    assertEquals(label, site.maskRegister, (after[at] as OneRegisterInstruction).registerA)
                    assertEquals(label, site.mask and PLAY_BIT.inv(), (after[at] as NarrowLiteralInstruction).narrowLiteral)
                    assertEquals(label, Opcode.CONST_16, after[at + 1].opcode)
                    assertEquals(label, site.register, (after[at + 1] as OneRegisterInstruction).registerA)
                    assertEquals(label, 1, (after[at + 1] as NarrowLiteralInstruction).narrowLiteral)
                    at += 2
                }
                val hook = after[at] as RegisterRangeInstruction
                assertEquals(label, play, (hook as ReferenceInstruction).reference.toString())
                assertEquals(label, site.register, hook.startRegister)
                assertEquals(label, 1, hook.registerCount)
                assertEquals(label, Opcode.MOVE_RESULT, after[at + 1].opcode)
                assertEquals(label, site.register, (after[at + 1] as OneRegisterInstruction).registerA)
                val call = after[at + 2]
                assertEquals(label, before[site.call].reference(), call.reference())
                assertEquals(label, site.register, call.argumentRegister(site.target.argumentOffset(site.parameter)))
                assertEquals(label, site.maskRegister, call.argumentRegister(site.target.argumentOffset(site.maskParameter)))
                // A branch aimed at the call now lands on the first instruction put in front of it.
                for (branch in before.indices.filter { before.aims(it, site.call) }) {
                    assertTrue(label, after.aims(moved(branch), moved(site.call)))
                }
            }
            val hooks = inMethod.flatMap { site -> moved(site.call) until moved(site.call) + added(site) }.toSet()
            // Inserting a hook can widen goto to goto/16. Its destination must still be the same
            // instruction (or the first hook before a call), as must every normal and catch edge.
            fun normalized(opcode: Opcode) = when (opcode) {
                Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
                else -> opcode
            }
            assertEquals(label, before.map { normalized(it.opcode) },
                after.filterIndexed { i, _ -> i !in hooks }.map { normalized(it.opcode) })
            val stockFlow = ControlFlow.of(method)
            val patchedFlow = ControlFlow.of(context.mutableMethod(method))
            for (index in before.indices) {
                val kept = moved(index) + inMethod.filter { it.call == index }.sumOf(::added)
                assertEquals("$label: normal edges at $index", stockFlow.normal[index].map(::moved).toSet(),
                    patchedFlow.normal[kept].toSet())
                assertEquals("$label: exception edges at $index", stockFlow.exceptional[index].map(::moved).toSet(),
                    patchedFlow.exceptional[kept].toSet())
            }
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
    fun `a caller whose default mask isn't one constant, or that reads it again after PostVideo, is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val site = fixture.embeds.first { it.defaulted }
            val computed = context(fixture)
            computed.mutableMethod(site.method).addInstructions(site.call, "add-int/lit8 v${site.maskRegister}, v${site.maskRegister}, 0x0")
            val notConstant = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(computed) }
            assertTrue(notConstant.message.orEmpty(), notConstant.message.orEmpty().contains("default mask in v${site.maskRegister} that isn't one constant"))

            val reread = context(fixture)
            reread.mutableMethod(site.method).addInstructions(site.call + 1, "move/from16 v0, v${site.maskRegister}")
            val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(reread) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("reads v${site.maskRegister} again after PostVideo"))
        }
    }

    @Test
    fun `a shortened PostVideo forwarder that changes its play flag or default mask is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val forwarder = fixture.forwarder ?: continue
            val original = forwarder.body()
            val call = original.indices.single { original[it].reference() == fixture.postVideo.reference() }
            val parameter = fixture.postVideo.playParameter(fixture.effect)
            val mask = fixture.postVideo.parameterTypes.map { it.toString() }.lastIndexOf("I")
            for (argument in listOf(parameter, mask)) {
                val register = original[call].argumentRegister(fixture.postVideo.argumentOffset(argument))!!
                val write = (call - 1 downTo 0).first {
                    original[it].opcode.setsRegister() && (original[it] as? OneRegisterInstruction)?.registerA == register
                }
                val context = context(fixture)
                context.mutableMethod(forwarder).replaceInstruction(write, "const/16 v$register, 0x1")
                val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(context) }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("doesn't forward PostVideo's"))
                assertEquals(build.name, 0, status(context))
                for (site in fixture.sites + fixture.embeds) {
                    assertFalse(build.name, context.method(site.method).any { it.reference() == play })
                }
            }
        }
    }

    @Test
    fun `PostVideo whose play flag's default isn't behind one bit of its mask is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            val method = context.mutableMethod(fixture.postVideo)
            val at = method.body().indices.single {
                method.body()[it].opcode == Opcode.AND_INT_LIT16 && (method.body()[it] as NarrowLiteralInstruction).narrowLiteral == PLAY_BIT
            }
            val and = method.body()[at] as TwoRegisterInstruction
            method.replaceInstruction(at, "and-int/lit16 v${and.registerA}, v${and.registerB}, ${PLAY_BIT or (PLAY_BIT shr 1)}")
            val error = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("isn't behind one bit"))
        }
    }

    @Test
    fun `the extension answers the prefetch skip with a boolean`() {
        val method = ExtensionDex.classDef(VIDEO_AUTOPLAY).methods.single { it.name == "skipPrefetch" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(listOf("Z"), method.parameterTypes.map { it.toString() })
        assertEquals("Z", method.returnType)
    }

    @Test
    fun `the prefetch skip hands the check's answer to the extension and uses what comes back`() {
        for (build in Fixtures.declaredBuilds()) {
            val prefetch = prefetch(build)
            val context = context(fixture(build))
            val before = prefetch.skip.body()
            disableVideoAutoplayPatch.execute(context)
            val after = context.method(prefetch.skip)

            val call = before.indices.single { before[it].reference() == prefetch.check.reference() }
            val register = (before[call + 1] as OneRegisterInstruction).registerA
            assertEquals(build.name, Opcode.MOVE_RESULT, before[call + 1].opcode)
            assertEquals(build.name, Opcode.IF_NEZ, before[call + 2].opcode)
            assertEquals(build.name, register, (before[call + 2] as OneRegisterInstruction).registerA)
            assertEquals(build.name, before.size + 2, after.size)
            // Everything up to and including the check's own call and result is as it was.
            assertEquals(build.name, before.take(call + 2).map { it.opcode to it.reference() }, after.take(call + 2).map { it.opcode to it.reference() })
            val hook = after[call + 2] as RegisterRangeInstruction
            assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(build.name, "$VIDEO_AUTOPLAY->skipPrefetch(Z)Z", (hook as ReferenceInstruction).reference.toString())
            assertEquals(build.name, register, hook.startRegister)
            assertEquals(build.name, 1, hook.registerCount)
            assertEquals(build.name, Opcode.MOVE_RESULT, after[call + 3].opcode)
            assertEquals(build.name, register, (after[call + 3] as OneRegisterInstruction).registerA)
            // The test reads the register the extension wrote, and everything after it is as it was.
            assertEquals(build.name, Opcode.IF_NEZ, after[call + 4].opcode)
            assertEquals(build.name, register, (after[call + 4] as OneRegisterInstruction).registerA)
            assertEquals(build.name, before.drop(call + 2).map { it.opcode to it.reference() }, after.drop(call + 4).map { it.opcode to it.reference() })
            // Its branch still lands on the same instruction: the one that sat there before.
            val ifBefore = before[call + 2] as OffsetInstruction
            val ifAfter = after[call + 4] as OffsetInstruction
            val landed = before.indices.first { before.addressOf(it) == before.addressOf(call + 2) + ifBefore.codeOffset }
            val landedAfter = after.indices.first { after.addressOf(it) == after.addressOf(call + 4) + ifAfter.codeOffset }
            assertEquals(build.name, landed + 2, landedAfter)
            assertEquals(build.name, 1, status(context))
        }
    }

    @Test
    fun `the autoplay check and the legacy autoplay checker stay as they were`() {
        for (build in Fixtures.declaredBuilds()) {
            val prefetch = prefetch(build)
            val context = context(fixture(build))
            disableVideoAutoplayPatch.execute(context)
            for (untouched in listOf(prefetch.check, prefetch.legacy, prefetch.dispatcher)) {
                assertEquals(build.name, untouched.body().map { it.opcode to it.reference() }, context.method(untouched).map { it.opcode to it.reference() })
            }
            // The new answer is asked from the skip test only.
            for (classDef in prefetch.classes) for (method in context.mutableClassDefBy(classDef.type).methods) {
                val asks = method.body().any { it.reference() == "$VIDEO_AUTOPLAY->skipPrefetch(Z)Z" }
                assertEquals("${build.name} ${method.reference()}", method.reference() == prefetch.skip.reference(), asks)
            }
        }
    }

    @Test
    fun `no dispatcher, no autoplay check, a second check or a skip that doesn't test straight away is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val prefetch = prefetch(build)
            fun rename(method: Method, note: String): BytecodePatchContext = context(fixture(build)).also { context ->
                val mutable = context.mutableMethod(method)
                mutable.body().indices.filter { mutable.body()[it].getReference<StringReference>()?.string == note }.forEach {
                    mutable.replaceInstruction(it, "const-string v${(mutable.body()[it] as OneRegisterInstruction).registerA}, \"some other note\"")
                }
            }
            val noDispatcher = assertThrows(build.name, PatchException::class.java) {
                disableVideoAutoplayPatch.execute(rename(prefetch.dispatcher, PREFETCH_DISPATCHER))
            }
            assertTrue(noDispatcher.message.orEmpty(), noDispatcher.message.orEmpty().contains("the video prefetch dispatcher"))

            val noCheck = assertThrows(build.name, PatchException::class.java) {
                disableVideoAutoplayPatch.execute(rename(prefetch.check, AUTOPLAY_OFF))
            }
            assertTrue(noCheck.message.orEmpty(), noCheck.message.orEmpty().contains("Instagram's autoplay-off check: expected exactly one match, found 0"))

            val twice = context(fixture(build))
            twice.mutableClassDefBy(prefetch.check.definingClass).methods.add(MutableMethod(ImmutableMethod(
                prefetch.check.definingClass, "copyOfCheck", prefetch.check.parameters, prefetch.check.returnType,
                prefetch.check.accessFlags, null, null, ImmutableMethodImplementation.of(prefetch.check.implementation),
            )))
            val second = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(twice) }
            assertTrue(second.message.orEmpty(), second.message.orEmpty().contains("Instagram's autoplay-off check: expected exactly one match, found 2"))

            val askedBefore = context(fixture(build))
            val skip = askedBefore.mutableMethod(prefetch.skip)
            val call = skip.body().indices.single { skip.body()[it].reference() == prefetch.check.reference() }
            skip.replaceInstruction(call + 2, "nop")
            val noTest = assertThrows(build.name, PatchException::class.java) { disableVideoAutoplayPatch.execute(askedBefore) }
            assertTrue(noTest.message.orEmpty(), noTest.message.orEmpty().contains("doesn't test the autoplay-off check's answer straight away"))
            assertEquals(build.name, 0, status(askedBefore))
        }
    }

    @Test
    fun `before the patch runs, no feed post asks and the status says it isn't in`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            for (site in fixture.sites + fixture.embeds) {
                assertFalse(build.name, context.method(site.method).any { (it as? ReferenceInstruction)?.reference?.toString() == play })
            }
            assertEquals(build.name, 0, status(context))
        }
    }

    /**
     * A [call] to PostVideo in [method], passing its [parameter] in [register] and its default mask,
     * the constant [mask], in [maskRegister].
     */
    private data class Site(val method: Method, val call: Int, val register: Int, val parameter: Int,
        val maskRegister: Int, val mask: Int, val target: Method, val maskParameter: Int) {
        /** Whether the caller leaves the play flag to PostVideo's default. */
        val defaulted get() = mask and PLAY_BIT != 0
    }

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val postVideo: Method,
        val effect: Method,
        val forwarder: Method?,
        val sites: List<Site>,
        val embeds: List<Site>,
        val viewer: List<Method>,
        val viewerCalls: List<Site>,
        val prefetch: Prefetch,
    )

    /** A forwarder's parameter count, the parameter carrying PostVideo's play flag, and its mask, the last int. */
    private data class Forwarder(val size: Int, val play: Int, val mask: Int)

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val notes = listOf(POST_VIDEO, PLAYBACK_EFFECT, MEDIA_VIEWER) + VIDEO_CALLERS
        val classes = FixtureDex.classesWhere(build, { true }) { method -> notes.any { method.holdsNote(it) } }
        val methods = classes.flatMap { it.methods }
        val postVideo = methods.single { it.holdsNote(POST_VIDEO) }
        val effect = methods.single { it.holdsNote(PLAYBACK_EFFECT) }
        val parameter = postVideo.playParameter(effect)
        // The default mask is PostVideo's last int on 450.
        val maskParameter = postVideo.parameterTypes.map { it.toString() }.lastIndexOf("I")
        // Read independently: the shorter overload calls PostVideo once and returns. 453's has 17
        // parameters, ending on four ints and three booleans, so the play flag is its second boolean
        // (15) and the mask its last int (13).
        val shape = FORWARDERS.entries.singleOrNull { build.name.startsWith(it.key) }?.value
        val forwarders = methods.filter { method ->
            method.definingClass == postVideo.definingClass && method.reference() != postVideo.reference() &&
                method.body().any { it.reference() == postVideo.reference() }
        }
        assertTrue("${build.name}: one shortened PostVideo overload", forwarders.size <= 1)
        val forwarder = forwarders.singleOrNull()
        assertEquals("${build.name}: the shortened overload", shape != null, forwarder != null)
        if (forwarder != null) {
            shape!!
            assertEquals(build.name, shape.size, forwarder.parameterTypes.size)
            assertEquals(build.name, List(shape.size - shape.mask - 1) { "Z" }, forwarder.parameterTypes.drop(shape.mask + 1).map { it.toString() })
            assertEquals(build.name, "I", forwarder.parameterTypes[shape.mask].toString())
            val body = forwarder.body()
            val call = body.indices.single { body[it].reference() == postVideo.reference() }
            assertEquals(build.name, body.lastIndex - 1, call)
            assertEquals(build.name, Opcode.RETURN_VOID, body.last().opcode)
            val first = forwarder.implementation!!.registerCount - shape.size
            for ((into, from) in listOf(parameter to shape.play, maskParameter to shape.mask)) {
                val argument = body[call].argumentRegister(postVideo.argumentOffset(into))!!
                val copy = body.take(call).last { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == argument }
                assertEquals(build.name, Opcode.MOVE_FROM16, copy.opcode)
                assertEquals(build.name, first + from, (copy as TwoRegisterInstruction).registerB)
            }
        }
        fun calls(method: Method): List<Site> {
            val body = method.body()
            return body.indices.mapNotNull { at ->
                val target = when (body[at].reference()) {
                    postVideo.reference() -> postVideo
                    forwarder?.reference() -> forwarder ?: return@mapNotNull null
                    else -> return@mapNotNull null
                }
                val passedPlay = if (target == postVideo) parameter else shape!!.play
                val passedMask = if (target == postVideo) maskParameter else shape!!.mask
                val maskRegister = body[at].argumentRegister(target.argumentOffset(passedMask))!!
                // On 450 every caller loads its mask as a constant, last written just before the call.
                val write = (at - 1 downTo 0).first { body[it].opcode.setsRegister() && (body[it] as? OneRegisterInstruction)?.registerA == maskRegister }
                val mask = (body[write] as NarrowLiteralInstruction).narrowLiteral
                Site(method, at, body[at].argumentRegister(target.argumentOffset(passedPlay))!!,
                    passedPlay, maskRegister, mask, target, passedMask)
            }
        }
        val sites = methods.filter { it.holdsNote(POST_SINGLE_MEDIA) || it.holdsNote(POST_CAROUSEL) }.flatMap(::calls)
        val embeds = methods.filter { method -> EMBEDS.any { method.holdsNote(it) } }.flatMap(::calls)
        val viewer = methods.filter { it.holdsNote(MEDIA_VIEWER) }
        Fixture(classes, postVideo, effect, forwarder, sites, embeds, viewer, viewer.flatMap(::calls), prefetch(build))
    }

    /**
     * Instagram's autoplay-off [check], read here by its own two strings, and its two callers: the
     * prefetch [skip] the [dispatcher] calls directly, and the [legacy] autoplay checker.
     */
    private data class Prefetch(val classes: List<ClassDef>, val check: Method, val dispatcher: Method, val skip: Method, val legacy: Method)

    private fun prefetch(build: File): Prefetch = prefetches.getOrPut(build) {
        val holders = FixtureDex.classesWhere(build, { true }) { it.holdsString(AUTOPLAY_OFF) || it.holdsString(PREFETCH_DISPATCHER) }
        val methods = holders.flatMap { it.methods }
        val check = methods.filter { it.holdsString(AUTOPLAY_OFF) && it.holdsString(AUTOPLAY_OFF_OLYMPUS) }.single()
        assertTrue(build.name, AccessFlags.STATIC.isSet(check.accessFlags))
        assertEquals(build.name, "Z", check.returnType)
        assertEquals(build.name, 1, check.parameterTypes.size)
        val dispatcher = methods.single { it.holdsString(PREFETCH_DISPATCHER) }
        val callers = FixtureDex.methodsWhere(build, { true }) { method ->
            method.implementation?.instructions?.any { it.reference() == check.reference() } == true
        }
        assertEquals("${build.name}: the check's callers", 2, callers.size)
        val skip = callers.single { caller -> dispatcher.body().any { it.reference() == caller.reference() } }
        val legacy = callers.single { it.reference() != skip.reference() }
        assertTrue(build.name, legacy.holdsNote("Video autoplay not allowed"))
        assertFalse(build.name, skip.body().any { it.getReference<StringReference>() != null })
        val types = setOf(skip.definingClass, legacy.definingClass)
        val classes = (holders + FixtureDex.classes(build, types).values).distinctBy { it.type }
        Prefetch(classes, check, dispatcher, skip, legacy)
    }

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes + fixture.prefetch.classes)

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

        /** The composables that show a video inside a post rather than as its own media. */
        val EMBEDS = listOf(INLINE_IG_VIDEO, TREND_PREVIEW_VIDEO, AD_CARD)

        /** The shortened PostVideo forwarder of each build that has one: its parameter count, play flag and mask. */
        val FORWARDERS = mapOf(
            "threads-453." to Forwarder(size = 17, play = 15, mask = 13),
        )

        /** The bit of PostVideo's default mask that hands its play flag to the default, on 450. */
        const val PLAY_BIT = 0x4000

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Fixture>()
        val prefetches = PerBuild<Prefetch>()
    }
}
