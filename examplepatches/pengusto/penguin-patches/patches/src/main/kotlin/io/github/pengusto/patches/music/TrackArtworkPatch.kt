package io.github.pengusto.patches.music

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val trackArtworkPatch = bytecodePatch(
    name = "Prefer each track's embedded cover",
    description = "Use file-specific cover artwork before shared album art, retaining the original fallback and worker callback.", default = true
) {
    compatibleWith(Compatibility(name = "Fossify Music Player", packageName = "org.fossify.musicplayer", targets = listOf(AppTarget(version = "1.8.4"))))
    extendWith("extensions/extension.mpe")
    execute {
        val method = Fingerprint(definingClass = "Lja;", name = "h0", returnType = "Lw05;", parameters = listOf("Ldk1;", "Lfu4;", "Landroid/content/Context;")).method
        val code = method.implementation!!.instructions
        check(code.size == 82 && (code[11] as? ReferenceInstruction)?.reference.toString() == "Lfu4;->g()Ljava/lang/String;" &&
            (code[73] as? ReferenceInstruction)?.reference.toString() == "Landroid/os/Handler;") { "Unsupported Music Player artwork worker" }
        method.addInstructionsWithLabels(13, """
            invoke-virtual {p1}, Lfu4;->r()Ljava/lang/String;
            move-result-object v2
            invoke-static {p2, v2}, Lio/github/pengusto/patches/extension/music/TrackArtwork;->load(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
            move-result-object v2
            if-eqz v2, :fallback
            move-object v1, v2
            goto :post
        """.trimIndent(), ExternalLabel("post", code[73]), ExternalLabel("fallback", code[13]))
    }
}
