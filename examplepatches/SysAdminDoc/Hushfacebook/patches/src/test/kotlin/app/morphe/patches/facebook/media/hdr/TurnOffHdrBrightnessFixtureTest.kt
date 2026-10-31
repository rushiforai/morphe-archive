/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.hdr

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Turn off HDR brightness on each declared Facebook build: every call of Window.setColorMode and
 * Window.setDesiredHdrHeadroom, and every question of what the screen shows (Display.isHdr and
 * the two getSupportedHdrTypes), outside the extension becomes the extension's call with the same
 * registers, and every SurfaceView Facebook builds goes to the extension right after its
 * constructor, with nothing else in those methods changed. The extension's own calls stay
 * Android's, or its setColorMode would call itself.
 */
class TurnOffHdrBrightnessFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun same(a: Method, b: Method) = a.name == b.name && a.returnType == b.returnType &&
        a.parameterTypes.map(CharSequence::toString) == b.parameterTypes.map(CharSequence::toString)

    private fun registers(instruction: Instruction): List<Int> = when (instruction) {
        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        is FiveRegisterInstruction -> listOf(
            instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG,
        ).take(instruction.registerCount)
        else -> emptyList()
    }

    @Test
    fun `each declared build's window HDR calls go to the extension with their registers`() = bundles { bundle ->
        val callers = FixtureDex.methodsWhere(bundle, { true }) { method ->
            method.implementation?.instructions?.any { ownWindowCall(it) != null } == true
        }
        fun calls(own: String) = callers.sumOf { method -> method.implementation!!.instructions.count { ownWindowCall(it) == own } }
        val modes = calls(OWN_SET_COLOR_MODE)
        val headrooms = calls(OWN_SET_HDR_HEADROOM)
        // The HDR helper, the Reels viewer, a dialog and two more screens set a colour mode, and
        // the helper asks for headroom on Android 15.
        assertTrue("${bundle.name}: $modes colour mode calls", modes >= 5)
        assertTrue("${bundle.name}: $headrooms headroom calls", headrooms >= 1)
        // Probed on all three builds (2026-10-07): ExoPlayer's Dolby Vision checks and the device
        // details ask isHdr; the inverse tone mapping check, a surface check and the device details
        // read a mode's types; the Dolby Vision checks, the device details and two more read the
        // capabilities' types. 585 (2026-10-30) folds the two Dolby Vision checks into one
        // (Context)Z method, so it asks isHdr twice and reads the capabilities' types four times.
        val isHdr = calls(OWN_IS_HDR)
        val modeTypes = calls(OWN_MODE_HDR_TYPES)
        val capabilityTypes = calls(OWN_CAPABILITY_HDR_TYPES)
        assertTrue("${bundle.name}: $isHdr isHdr calls", isHdr >= 2)
        assertTrue("${bundle.name}: $modeTypes mode type reads", modeTypes >= 4)
        assertTrue("${bundle.name}: $capabilityTypes capability type reads", capabilityTypes >= 4)
        // Probed on 582 (2026-10-11): ExoPlayer's platform adapter (SyncMediaCodecAdapterExt), the
        // player's codec helper, webrtc, the camera roll and the encoders, about 25 in all.
        val decoders = calls(OWN_CODEC_CONFIGURE)
        assertTrue("${bundle.name}: $decoders decoder set-ups", decoders >= 15)
        val adapter = callers.filter { method -> method.name == "configure" && method.implementation!!.instructions.any { ownWindowCall(it) == OWN_CODEC_CONFIGURE } }
        assertTrue("${bundle.name}: no playback adapter's configure sets up a MediaCodec", adapter.isNotEmpty())

        val owners = FixtureDex.classes(bundle, callers.map { it.definingClass }.toSet())
        val context = PatchContexts.of(owners.values)
        assertEquals("${bundle.name}: the callers", owners.keys, context.windowCallers())
        assertEquals("${bundle.name}: calls sent", modes + headrooms + isHdr + modeTypes + capabilityTypes + decoders,
            context.hookWindowCalls(owners.keys))
        for ((type, original) in owners) {
            for (method in context.mutableClassDefBy(type).methods) {
                val body = method.implementation?.instructions?.toList() ?: continue
                val where = "${bundle.name}: $type->${method.name}"
                val code = original.methods.single { same(it, method) }.implementation!!.instructions.toList()
                assertEquals("$where: one for one", code.size, body.size)
                for (at in code.indices) {
                    val own = ownWindowCall(code[at])
                    if (own == null) {
                        assertEquals("$where: instruction $at", code[at].opcode, body[at].opcode)
                        continue
                    }
                    assertEquals("$where: the call at $at", own, (body[at] as ReferenceInstruction).reference.toString())
                    val static = if (code[at] is RegisterRangeInstruction) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                    assertEquals("$where: the call's form at $at", static, body[at].opcode)
                    assertEquals("$where: the registers at $at", registers(code[at]), registers(body[at]))
                }
            }
        }
    }

    @Test
    fun `each declared build's SurfaceViews go to the extension right after they're built`() = bundles { bundle ->
        fun sitesIn(code: List<Instruction>) = code.mapNotNull(::builtSurfaceView)
        val builders = FixtureDex.methodsWhere(bundle, { true }) { method ->
            method.implementation?.instructions?.any { builtSurfaceView(it) != null } == true
        }
        val sites = builders.sumOf { method -> sitesIn(method.implementation!!.instructions.toList()).size }
        // The video plugin, the video surface factories, calls, games and a progress indicator.
        assertTrue("${bundle.name}: $sites SurfaceViews built", sites >= 8)

        val owners = FixtureDex.classes(bundle, builders.map { it.definingClass }.toSet())
        val context = PatchContexts.of(owners.values)
        assertEquals("${bundle.name}: the builders", owners.keys, context.surfaceViewBuilders())
        assertEquals("${bundle.name}: views hooked", sites, context.hookSurfaceViews(owners.keys))
        for ((type, original) in owners) {
            for (method in context.mutableClassDefBy(type).methods) {
                val body = method.implementation?.instructions?.toList() ?: continue
                val where = "${bundle.name}: $type->${method.name}"
                val code = original.methods.single { same(it, method) }.implementation!!.instructions.toList()
                val at = body.indices.filter { (body[it] as? ReferenceInstruction)?.reference?.toString() == OWN_SURFACE_BUILT }
                assertEquals("$where: the registers handed over", sitesIn(code), at.map { (body[it] as RegisterRangeInstruction).startRegister })
                for (hook in at) {
                    assertTrue("$where: the hook at $hook follows the constructor", builtSurfaceView(body[hook - 1]) != null)
                    assertEquals("$where: one register", 1, (body[hook] as RegisterRangeInstruction).registerCount)
                }
                // The assembler pads a payload that follows the hook to its alignment with a nop.
                val was = code.map { it.opcode }.filter { it != Opcode.NOP }
                val left = body.filterIndexed { index, _ -> index !in at }.map { it.opcode }.filter { it != Opcode.NOP }
                val first = (0 until maxOf(was.size, left.size)).firstOrNull { was.getOrNull(it) != left.getOrNull(it) }
                assertEquals("$where: nothing else changed, first difference at", null, first)
            }
        }
    }

    @Test
    fun `each declared build's DASH manifest parse hands its string to the extension first`() = bundles { bundle ->
        val parses = FixtureDex.methodsWhere(bundle, { true }, ::isManifestParse)
        // Probed on 582 arm64 (2026-10-14): one static (Uri, parser, String) method logging
        // DashManifestHelper2, called by the player's setup, prefetch and offline saves.
        assertEquals("${bundle.name}: manifest parses", 1, parses.size)
        val parse = parses.single()
        val owners = FixtureDex.classes(bundle, setOf(parse.definingClass))
        val context = PatchContexts.of(owners.values)
        assertTrue("${bundle.name}: the parse found", same(parse, context.manifestParse()))
        context.hookManifestParse(context.manifestParse())

        val code = parse.implementation!!.instructions.toList()
        val body = context.mutableClassDefBy(parse.definingClass).methods.single { same(it, parse) }.implementation!!.instructions.toList()
        val manifest = parse.implementation!!.registerCount - 1
        assertEquals("${bundle.name}: the hook's call", OWN_MANIFEST, (body[0] as ReferenceInstruction).reference.toString())
        assertEquals("${bundle.name}: the hook's form", Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
        assertEquals("${bundle.name}: the manifest string handed over", listOf(manifest), registers(body[0]))
        assertEquals("${bundle.name}: the answer read back", Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
        assertEquals("${bundle.name}: into the manifest's register", manifest, (body[1] as OneRegisterInstruction).registerA)
        assertEquals("${bundle.name}: nothing else changed", code.map { it.opcode }, body.drop(2).map { it.opcode })
        // A jump to the first instruction would skip the hook in front of it.
        var address = 0
        for (instruction in code) {
            val offset = (instruction as? OffsetInstruction)?.codeOffset
            assertTrue("${bundle.name}: a jump back to the start", offset == null || address + offset != 0)
            address += instruction.codeUnits
        }
    }

    @Test
    fun `a build without the manifest parse is refused`() {
        val notIt = type(
            "LX/parser;",
            method(
                "LX/parser;", listOf("Landroid/net/Uri;", "Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/Object;", 4,
                """
                    const-string v0, "$MANIFEST_PARSE_FAILED"
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            ),
        )
        assertThrows(PatchException::class.java) { PatchContexts.of(listOf(notIt)).manifestParse() }
    }

    private fun method(type: String, parameters: List<String>, returnType: String, registers: Int, smali: String): MutableMethod =
        MutableMethod(
            ImmutableMethod(
                type,
                "run",
                parameters.map { ImmutableMethodParameter(it, null, null) },
                returnType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        ).apply { addInstructions(0, smali) }

    private fun type(name: String, vararg methods: Method): ClassDef =
        ImmutableClassDef(name, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods.toList())

    private fun windowCaller(type: String, call: String) = type(
        type,
        method(type, listOf(WINDOW, "I"), "V", 2, "$call\nreturn-void"),
    )

    @Test
    fun `the extension's own window calls stay Android's`() {
        val call = "invoke-virtual { p0, p1 }, $SET_COLOR_MODE"
        val extension = "Lapp/morphe/extension/facebook/media/HdrBrightness;"
        val context = PatchContexts.of(listOf(windowCaller(extension, call), windowCaller("LX/app;", call)))
        assertEquals(setOf("LX/app;"), context.windowCallers())
        assertEquals(1, context.hookWindowCalls())
        fun calledBy(type: String) = context.mutableClassDefBy(type).methods.single().implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(listOf(SET_COLOR_MODE), calledBy(extension))
        assertEquals(listOf(OWN_SET_COLOR_MODE), calledBy("LX/app;"))
    }

    @Test
    fun `a screen question goes to the extension and its result is still read`() {
        val asker = type(
            "LX/asker;",
            method(
                "LX/asker;", listOf(DISPLAY), "Z", 2,
                """
                    invoke-virtual { p0 }, $IS_HDR
                    move-result v0
                    return v0
                """.trimIndent(),
            ),
        )
        val context = PatchContexts.of(listOf(asker, windowCaller("LX/app;", "invoke-virtual { p0, p1 }, $SET_COLOR_MODE")))
        assertEquals(setOf("LX/asker;", "LX/app;"), context.windowCallers())
        assertEquals(2, context.hookWindowCalls())
        val body = context.mutableClassDefBy("LX/asker;").methods.single().implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), body.map { it.opcode })
        assertEquals(OWN_IS_HDR, (body[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(1), registers(body[0]))
    }

    @Test
    fun `a range call keeps its range`() {
        val context = PatchContexts.of(listOf(windowCaller("LX/app;", "invoke-virtual/range { p0 .. p1 }, $SET_COLOR_MODE")))
        assertEquals(1, context.hookWindowCalls())
        val call = context.mutableClassDefBy("LX/app;").methods.single().implementation!!.instructions.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(OWN_SET_COLOR_MODE, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 1), registers(call))
    }

    @Test
    fun `a decoder's set-up goes to the extension with its five registers`() {
        val decoder = type(
            "LX/decoder;",
            method(
                "LX/decoder;", listOf(MEDIA_CODEC, MEDIA_FORMAT, "Landroid/view/Surface;", "Landroid/media/MediaCrypto;", "I"), "V", 5,
                "invoke-virtual { p0, p1, p2, p3, p4 }, $CODEC_CONFIGURE\nreturn-void",
            ),
        )
        val context = PatchContexts.of(listOf(decoder, windowCaller("LX/app;", "invoke-virtual { p0, p1 }, $SET_COLOR_MODE")))
        assertEquals(setOf("LX/decoder;", "LX/app;"), context.windowCallers())
        assertEquals(2, context.hookWindowCalls())
        val call = context.mutableClassDefBy("LX/decoder;").methods.single().implementation!!.instructions.first()
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(OWN_CODEC_CONFIGURE, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 1, 2, 3, 4), registers(call))
    }

    @Test
    fun `a build with no colour mode call or no SurfaceView is refused before anything changes`() {
        val headroomOnly = windowCaller("LX/app;", "invoke-virtual { p0, p1 }, $SET_HDR_HEADROOM")
        assertThrows(PatchException::class.java) { PatchContexts.of(listOf(headroomOnly)).windowCallers() }
        assertThrows(PatchException::class.java) { PatchContexts.of(listOf(headroomOnly)).surfaceViewBuilders() }
    }

    @Test
    fun `a SurfaceView goes to the extension after its constructor`() {
        val builder = type(
            "LX/maker;",
            method(
                "LX/maker;", listOf("Landroid/content/Context;"), SURFACE_VIEW, 2,
                """
                    new-instance v0, $SURFACE_VIEW
                    invoke-direct { v0, p0 }, $SURFACE_VIEW-><init>(Landroid/content/Context;)V
                    return-object v0
                """.trimIndent(),
            ),
        )
        val context = PatchContexts.of(listOf(builder))
        assertEquals(1, context.hookSurfaceViews())
        val body = context.mutableClassDefBy("LX/maker;").methods.single().implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC_RANGE, Opcode.RETURN_OBJECT), body.map { it.opcode })
        assertEquals(OWN_SURFACE_BUILT, (body[2] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0), registers(body[2]))
    }
}
