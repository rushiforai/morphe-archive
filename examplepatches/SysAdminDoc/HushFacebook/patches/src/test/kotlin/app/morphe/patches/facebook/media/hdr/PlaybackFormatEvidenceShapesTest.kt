/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.hdr

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.FACEBOOK_APPLICATION
import app.morphe.patches.facebook.misc.extension.PatchLogCapture
import app.morphe.patches.facebook.misc.settings.compressedCodeRefusal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The playback format evidence on stand-in adapters: what counts as Android's own decoder, an
 * observer on a returned format's own label, and a build without dav1d or with an opaque player,
 * which Hushfacebook settings goes on through without the evidence.
 */
class PlaybackFormatEvidenceShapesTest {
    private val iface = "Lfixture/PlaybackAdapter;"
    private val parameters = listOf(MEDIA_FORMAT, "Landroid/view/Surface;", "Landroid/media/MediaCrypto;", "I", "Ljava/lang/Object;")

    private fun method(type: String, name: String, result: String, params: List<String> = emptyList(), code: String): Method =
        MutableMethod(ImmutableMethod(type, name, params.map { ImmutableMethodParameter(it, null, null) }, result,
            AccessFlags.PUBLIC.value, null, null, ImmutableMethodImplementation(params.size + 2, emptyList(), null, null)))
            .apply { addInstructionsWithLabels(0, code) }

    private fun owner(type: String, vararg methods: Method): ClassDef = ImmutableClassDef(type, AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;", listOf(iface), null, null, emptyList(), methods.toList())

    private fun platform(type: String = "Lfixture/Platform;", delegate: Boolean = false): ClassDef = owner(type,
        method(type, "configure", "V", parameters, if (delegate) "invoke-interface/range { p0 .. p5 }, $iface->configure(${parameters.joinToString("")})V\nreturn-void" else
            "iget-object v0, p0, $type->codec:Landroid/media/MediaCodec;\ninvoke-virtual { v0, p1, p2, p3, p4 }, Landroid/media/MediaCodec;->configure($MEDIA_FORMAT${"Landroid/view/Surface;"}Landroid/media/MediaCrypto;I)V\nreturn-void"),
        method(type, "getOutputFormat", MEDIA_FORMAT, code =
            "iget-object v0, p0, $type->codec:Landroid/media/MediaCodec;\ninvoke-virtual { v0 }, Landroid/media/MediaCodec;->getOutputFormat()$MEDIA_FORMAT\nmove-result-object v0\nreturn-object v0"))

    @Test
    fun `forwarding wrappers and unrelated interfaces never qualify as platform codecs`() {
        assertTrue(isPlatformPlaybackAdapter(platform(), iface))
        assertFalse(isPlatformPlaybackAdapter(platform(delegate = true), iface))
        assertFalse(isPlatformPlaybackAdapter(platform(), "Lfixture/Other;"))
    }

    @Test
    fun `a branch into a returned format visits the observer without replacing the return`() {
        val type = "Lfixture/BranchingAdapter;"
        val configure = method(type, "configure", "V", parameters, "return-void")
        val output = method(type, "getOutputFormat", MEDIA_FORMAT, code = "const/4 v0, 0x0\nif-eqz v0, :answer\nconst/4 v0, 0x0\n:answer\nreturn-object v0")
        val context = PatchContexts.of(listOf(owner(type, configure, output)))
        context.applyPlaybackEvidenceAnchors(listOf(PlaybackEvidenceAnchor(owner(type, configure, output), configure, output, "platform")))
        val patched = context.mutableClassDefBy(type).methods.single { it.name == "getOutputFormat" }.implementation!!.instructions.toList()
        val branch = patched.single { it.opcode == Opcode.IF_EQZ } as BuilderOffsetInstruction
        val target = branch.target.location.index
        val call = (patched[target] as ReferenceInstruction).reference as MethodReference
        assertEquals("$FORMAT_EVIDENCE->platformOutput($MEDIA_FORMAT)V", call.toString())
        assertEquals(Opcode.RETURN_OBJECT, patched[target + 1].opcode)
        assertEquals(0, (patched[target + 1] as OneRegisterInstruction).registerA)
    }

    @Test
    fun `a missing native boundary refuses the observer rather than guessing a codec`() {
        val context = PatchContexts.of(listOf(platform()))
        val failure = assertThrows(PatchException::class.java) { context.findPlaybackEvidenceAnchors() }
        assertTrue(failure.message!!.contains("no kept Dav1d playback adapter"))
    }

    /** Hushfacebook settings brings this in, so a build without dav1d warns and patches on. */
    @Test
    fun `a build without the anchors warns and leaves every adapter as it was`() {
        val stock = platform()
        val context = PatchContexts.of(listOf(stock))
        val warnings = PatchLogCapture.warnings { playbackFormatEvidencePatch.execute(context) }
        assertEquals(listOf("Playback format evidence: no kept Dav1d playback adapter. Debug reports go on without the video formats."),
            warnings)
        for (original in stock.methods) {
            val after = context.mutableClassDefBy(stock.type).methods.single { it.name == original.name }
            assertEquals("${original.name} changed", original.implementation!!.instructions.map { it.opcode },
                after.implementation!!.instructions.map { it.opcode })
        }
    }

    /** A dav1d adapter whose getOutputFormat only throws is refused before Android's decoder is touched. */
    @Test
    fun `an output boundary that never returns is refused before either decoder changes`() {
        val adapter = "Lfixture/Dav1dInterface;"
        val presenter = ImmutableMethod(adapter, "setDav1dPresenter", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
        val abstractConfigure = ImmutableMethod(adapter, "configure", parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
        val playbackInterface = ImmutableClassDef(adapter, AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
            "Ljava/lang/Object;", null, null, null, emptyList(), listOf(presenter, abstractConfigure))
        val dav1d = ImmutableClassDef(DAV1D_ADAPTER, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(adapter), null, null,
            emptyList(), listOf(
                method(DAV1D_ADAPTER, "configure", "V", parameters, "return-void"),
                method(DAV1D_ADAPTER, "getOutputFormat", MEDIA_FORMAT,
                    code = "new-instance v0, Ljava/lang/IllegalStateException;\ninvoke-direct { v0 }, Ljava/lang/IllegalStateException;-><init>()V\nthrow v0"),
            ))
        val linked = ImmutableClassDef(platform().type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(adapter), null, null,
            emptyList(), platform().methods.toList())
        val context = PatchContexts.of(listOf(playbackInterface, dav1d, linked))
        val failure = assertThrows(PatchException::class.java) { context.findPlaybackEvidenceAnchors() }
        assertTrue(failure.message, failure.message!!.contains("the dav1d output-format boundary never returns"))
        assertFalse("Android's decoder changed", context.mutableClassDefBy(linked.type).methods.any { method ->
            method.implementation!!.instructions.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == FORMAT_EVIDENCE }
        })
    }

    @Test
    fun `opaque builds keep the original helpful settings refusal before any observer lookup`() {
        val application = owner(FACEBOOK_APPLICATION)
        val context = PatchContexts.of(listOf(application))
        // No lookup at all, so not even the warning a build without dav1d gets.
        assertEquals(emptyList<String>(), PatchLogCapture.warnings { playbackFormatEvidencePatch.execute(context) })
        assertTrue(compressedCodeRefusal(true, null)!!.contains("Android 9 or older"))
    }
}
