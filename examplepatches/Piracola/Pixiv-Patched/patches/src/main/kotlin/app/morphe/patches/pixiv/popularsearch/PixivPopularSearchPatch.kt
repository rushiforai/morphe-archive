package app.morphe.patches.pixiv.popularsearch

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Ported from De-Vanced (https://github.com/RookieEnough/De-Vanced), GPL-3.0.
 *
 * Pixiv gates the "popular" (popular_desc) search tab behind a premium/trial check inside the
 * search pager adapter. The adapter method that builds each tab reads the account premium flag and,
 * when the account is not premium, replaces the popular tab with a limited trial variant.
 *
 * Forcing that single boolean read to true makes the adapter build the regular fragments with the
 * popular sort parameters, which is what a premium account gets.
 *
 * Note that this only changes what the client asks for. Pixiv ranks and authorises the search on
 * the server, so a free account that requests `sort=popular_desc` is answered with the date order
 * and the popular tab ends up listing the same works as "Newest". Kept for reference; prefer
 * [pixivPopularSearchTrialPatch], which stays inside the data Pixiv actually serves to free
 * accounts. Enabling both is pointless: the faked flag wins and the trial branch is unreachable.
 */
val pixivPopularSearchPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Popular Search Unlock",
    description = "Fakes the premium flag in the search pager so the app asks for popular_desc. " +
        "Pixiv still answers a free account with date order, so use Pixiv Popular Search Trial instead.",
    default = false
) {
    compatibleWith(PixivConstants.PIXIV)

    execute {
        val searchAdapterClass = mutableClassDefBy("Lrr8;")

        val adapterMethod = searchAdapterClass.methods.first {
            it.name == "a" &&
                it.returnType == "Landroidx/fragment/app/Fragment;" &&
                it.parameterTypes.size == 1
        }

        val instructions = adapterMethod.implementation?.instructions
            ?: throw IllegalStateException("Search pager adapter has no implementation")

        // Locate the premium flag read: an IGET_BOOLEAN whose field type is the same class as the
        // object read by the immediately preceding IGET_OBJECT (i.e. `this.accountState.isPremium`).
        var flagIndex = -1
        for (i in 1 until instructions.size) {
            val current = instructions[i]
            if (current.opcode != Opcode.IGET_BOOLEAN) continue

            val boolField = (current as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            val previous = instructions[i - 1]
            val objectField = (previous as? ReferenceInstruction)?.reference as? FieldReference ?: continue

            if (previous.opcode == Opcode.IGET_OBJECT && objectField.type == boolField.definingClass) {
                flagIndex = i
                break
            }
        }

        if (flagIndex < 0) {
            throw IllegalStateException("Premium flag read not found in the search pager adapter")
        }

        val destination = (instructions[flagIndex] as OneRegisterInstruction).registerA
        adapterMethod.replaceInstruction(flagIndex, "const/4 v$destination, 0x1")
    }
}
