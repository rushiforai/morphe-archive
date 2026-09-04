package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `PopularViewModel.UIState.MainView.getVideoStoreHomeData()` is read in exactly one
 * place — `SignedInPopularFilmsFragment$onViewCreated$3$1`, which shows the "Video
 * Store" row on the Films tab only when the value is non-null. Returning null there
 * takes the branch that hides the row (`videoStoreProductsLayout` → GONE) without
 * touching the adapter, so nothing else about the Video Store changes.
 */
internal object VideoStoreHomeDataFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;",
    name = "getVideoStoreHomeData",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/letterboxd/api/model/VideoStoreHomeResponse;",
    parameters = emptyList(),
)

@Suppress("unused")
val hideVideoStoreHomeSectionPatch = bytecodePatch(
    name = "Hide Video Store on home",
    description = "Removes the \"Letterboxd Video Store\" promo row from the Films tab. The Video " +
        "Store itself, its settings and every other entry point are left untouched.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        VideoStoreHomeDataFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
