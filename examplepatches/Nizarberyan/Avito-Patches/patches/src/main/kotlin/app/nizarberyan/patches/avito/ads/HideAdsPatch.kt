package app.nizarberyan.patches.avito.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.nizarberyan.patches.avito.listing.PublishedListingToStringFingerprint
import app.nizarberyan.patches.avito.listing.searchPagingLoadFingerprint
import app.nizarberyan.patches.avito.shared.Constants.COMPATIBILITY_AVITO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes the ad network banners from the search results and from the listing pages, " +
        "and stops the app from requesting ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AVITO)

    execute {
        // Never request an ad from the ad network.
        adRequestMethods.forEach { (definingClass, name) ->
            Fingerprint(
                definingClass = definingClass,
                name = name,
                returnType = "V",
            ).matchAllOrNull()?.forEach { match ->
                match.method.returnEarly()
            }
        }

        // Banner views reserve the space of the ad even if no ad is loaded.
        // Collapse them, so no empty space is left where a banner is still part of a screen.
        BaseAdViewOnMeasureFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-virtual { p0, v0, v0 }, Landroid/view/View;->setMeasuredDimension(II)V
                return-void
            """,
        )

        // Search results add banner list items only if a flag of the paging source is set.
        // Find the flag that is checked before the banner items are created, and always read it as false.
        val dfpBannerType = DfpBannerListingToStringFingerprint.originalClassDef.type
        val listingAdType = PublishedListingToStringFingerprint.originalClassDef.interfaces.singleOrNull()
            ?: throw PatchException("Could not find the listing ad interface")

        searchPagingLoadFingerprint(listingAdType).match().method.apply {
            val pagingSourceType = definingClass

            fun bannerFlagOf(index: Int) = instructions[index].let { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.takeIf {
                    instruction.opcode == Opcode.IGET_BOOLEAN && it.definingClass == pagingSourceType
                }
            }

            val newBannerIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    ((instruction as ReferenceInstruction).reference as TypeReference).type == dfpBannerType
            }
            if (newBannerIndex < 0) throw PatchException("Could not find the banner list item")

            val bannerFlag = (newBannerIndex downTo 0).firstNotNullOfOrNull(::bannerFlagOf)
                ?: throw PatchException("Could not find the banner flag")

            instructions.indices.reversed().forEach { index ->
                if (bannerFlagOf(index) != bannerFlag) return@forEach

                val register = (instructions[index] as TwoRegisterInstruction).registerA
                addInstruction(index + 1, "const/4 v$register, 0x0")
            }
        }
    }
}
