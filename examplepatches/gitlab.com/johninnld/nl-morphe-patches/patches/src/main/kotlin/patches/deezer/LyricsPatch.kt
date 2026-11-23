package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal data class LyricsClick2703(val owner: String, val name: String, val parameters: List<String>,
    val registers: Int, val featureIndex: Int, val decisionIndex: Int, val upsellIndex: Int)

internal val lyricsClicks2703 = listOf(
    LyricsClick2703("LIlIlIllllIIlIII;", "onClick", listOf("Landroid/view/View;"), 11, 62, 65, 77),
    LyricsClick2703("LIlIIlllIIIllIII;", "IlIllIIIlIIIlIIl",
        listOf("LIlIIlIlIIIII;", "LIllllIIIIlIllIII;"), 7, 10, 14, 39),
)

/** Change the inspected premium-offer edge only; track availability and native loading stay native. */
internal fun openNativeLyrics2703(method: MutableMethod): Int {
    val target = lyricsClicks2703.single { it.owner == method.definingClass && it.name == method.name &&
        it.parameters == method.parameterTypes.map(CharSequence::toString) }
    check(method.returnType == "V" && method.implementation!!.registerCount == target.registers)
    val code = method.instructions.toList()
    fun text(index: Int) = ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
    check(text(target.featureIndex) == "disable_lyrics_feature" && text(target.upsellIndex) == "try_to_go_lyrics") {
        "Deezer lyrics click markers changed"
    }
    val branch = code[target.decisionIndex] as? BuilderOffsetInstruction
        ?: error("Deezer lyrics decision is no longer a branch")
    check(branch.opcode == Opcode.IF_NEZ && branch.target.location.index in
        (target.decisionIndex + 1)..target.upsellIndex) { "Deezer lyrics upsell edge changed" }
    // Preserve the two-code-unit width, including existing switch-payload alignment.
    method.replaceInstruction(target.decisionIndex, BuilderInstruction20t(Opcode.GOTO_16,
        method.implementation!!.newLabelForIndex(target.decisionIndex + 1)))
    return target.decisionIndex
}

@Suppress("unused")
val deezerLyrics = bytecodePatch(
    name = "Enable lyrics",
    description = "Opens Deezer's native lyrics view from the legacy and modern players instead of the Premium offer. " +
        "Keeps native lyrics first and uses matching LRCLIB lyrics when native data is missing. " +
        "Availability follows usable native or fallback data; LRCLIB metadata lookups use no account credentials.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase)
    extendWith(java.util.function.Supplier { lyricsExtension() })
    execute {
        lyricsClicks2703.forEach { target ->
            openNativeLyrics2703(exact(target.owner, target.name, "V", *target.parameters.toTypedArray()).method)
        }
        bindLyricsFallback { mutableClassDefBy(it) }
    }
}
