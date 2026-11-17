package semicoloncolonel.mobilestream.patches.mlb.tv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.tvName
import semicoloncolonel.mobilestream.patches.shared.misc.tvOnly

// ─────────────────────────────────────────────────────────────────────────────
// MLB Android TV — Hide betting odds.
//
// The Android TV scores screen is server-driven. The server sends each games
// carousel page with an optional odds-provider banner, which the page holds in
// one field (OddsProviderBannerUIModel; the field name is renamed per build,
// but the model's package is not). When that field is set, the page draws the
// odds banner.
//
// The field is forced to null where the page's constructor stores it, so the
// banner is dropped on arrival and never drawn, while the page's own
// equals/hashCode/toString stay in agreement with the stored null. This is the
// Android TV counterpart of the phone Hide betting odds, which hides a
// different, web-rendered odds section (see mlb/misc/HideBettingOddsPatch.kt).
// ─────────────────────────────────────────────────────────────────────────────

private const val ODDS_BANNER =
    "Lmlb/app/ui/mlbappuidatamodels/items/scores/OddsProviderBannerUIModel;"

@Suppress("unused")
val hideBettingOddsPatch = bytecodePatch(
    name = tvName("Hide betting odds (Android TV)"),
    description = "Removes the betting-odds banner from the scores screen.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY.tvOnly())

    execute {
        var patched = 0
        classDefForEach { classDef ->
            if (classDef.fields.none { it.type == ODDS_BANNER }) return@classDefForEach
            mutableClassDefBy(classDef.type).methods.forEach { method ->
                if (method.name != "<init>") return@forEach
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.reversed().forEach { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEach
                    val reference = (instruction as ReferenceInstruction).reference as FieldReference
                    if (reference.type != ODDS_BANNER) return@forEach
                    // Store null in place of the banner. iput-object uses 4-bit
                    // registers, so the source register is always const/4-sized.
                    val source = (instruction as TwoRegisterInstruction).registerA
                    method.addInstructions(index, "const/4 v$source, 0x0")
                    patched++
                }
            }
        }
        if (patched == 0) throw PatchException("No OddsProviderBannerUIModel field write found")
    }
}
