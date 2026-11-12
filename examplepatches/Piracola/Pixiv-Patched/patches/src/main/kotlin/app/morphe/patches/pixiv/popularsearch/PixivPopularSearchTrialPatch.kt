package app.morphe.patches.pixiv.popularsearch

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Alternative to [pixivPopularSearchPatch], which fakes the premium flag.
 *
 * Pixiv ranks the search results on the server. A free account that sends
 * `sort=popular_desc` to `/v1/search/illust` is answered with the plain date order (verified on the
 * web endpoint too: `order=popular_d` and `order=date_d` return the same ids and the same total), so
 * a client-side premium flag cannot produce a popularity ranking.
 *
 * What the client does own is the seven-day trial window. The search pager computes
 * `7 - daysSinceFirstLaunch` whenever it builds the popular tab; while the value is positive the
 * trial variant of the fragment is built, once it reaches zero the paywall/preview variant is used
 * instead. Pinning the value to 7 keeps a trial account in the trial variant for good.
 *
 * Caveat: the whole branch sits behind the account's premium flag, so this patch changes nothing
 * for an account that never had the trial - for those the tab is built as a plain date-ordered list
 * either way.
 */
val pixivPopularSearchTrialPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Popular Search Trial",
    description = "Pins the 7-day popular-search trial countdown so a trial account keeps getting " +
        "the trial version of the popular tab instead of falling back to the preview/paywall. " +
        "Does not change what Pixiv returns for accounts without the trial.",
    default = true
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

        // Locate the trial countdown: `7 - daysSinceFirstLaunch`, clamped to zero right after.
        val countdownIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.RSUB_INT_LIT8 &&
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 7
        }

        if (countdownIndex < 0) {
            throw IllegalStateException("Trial countdown computation not found in the search pager adapter")
        }

        val destination = (instructions[countdownIndex] as OneRegisterInstruction).registerA
        adapterMethod.replaceInstruction(countdownIndex, "const/16 v$destination, 0x7")
    }
}
