package semicoloncolonel.mobilestream.patches.cspan.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.cspan.shared.Constants

// C-SPAN Now 1.25.0. The promo banners above the video player and on the
// Watch tab (C-SPAN's own program ads, such as "America's Book Club") come
// from Dynamic Yield. The player and the Watch tab ask its "choose" call for
// the campaigns named Top Banner, Bottom Banner, and Middle Banner 1 to 3,
// and draw the image each one returns. Those are the only things the app asks
// Dynamic Yield for.
//
// Dynamic Yield's choose call checks whether its SDK is initialized and, if
// not, returns an error with no campaigns. Both checks in that call now read
// "not initialized", so it never contacts Dynamic Yield and no banner gets an
// image. Videos and the rest of the Watch tab are unchanged.

internal object DynamicYieldChooseFingerprint : Fingerprint(
    strings = listOf("Choosing variations for page ", "chooseVariations"),
)

@Suppress("unused")
val hidePromoBannersPatch = bytecodePatch(
    name = "Hide promo banners",
    description = "Removes C-SPAN's program promo banners above the player and on the Watch tab.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        DynamicYieldChooseFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // The initialized flag is a static boolean, read twice.
            val reads = instructions.withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.SGET_BOOLEAN
            }
            if (reads.size < 2) throw PatchException("Dynamic Yield initialized checks not found")
            // Insert from the end, so earlier indices stay valid.
            reads.reversed().forEach { (index, insn) ->
                val register = (insn as OneRegisterInstruction).registerA
                addInstruction(index + 1, "const/16 v$register, 0x0")
            }
        }
    }
}
