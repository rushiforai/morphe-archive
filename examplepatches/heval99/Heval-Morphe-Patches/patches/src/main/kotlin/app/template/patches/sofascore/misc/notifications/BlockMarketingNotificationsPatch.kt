package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Promotional banner views (class names kept: referenced from layouts).
private val PROMO_BANNERS = listOf(
    "Lcom/sofascore/results/event/details/view/promotion/PromotionBannerView;",
    "Lcom/sofascore/results/featuredtournament/view/PromotionalOffersBannerView;",
)

/** Keeps the view GONE by overriding (or prepending to) setVisibility(int). */
private fun BytecodePatchContext.keepGone(type: String) {
    val classDef = mutableClassDefBy(type)
    val existing = classDef.methods.firstOrNull {
        it.name == "setVisibility" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
    }
    if (existing != null) {
        existing.addInstructions(0, "const/16 p1, 0x8")
        return
    }
    val superclass = classDef.superclass ?: throw PatchException("$type has no superclass")
    classDef.methods.add(
        ImmutableMethod(
            type,
            "setVisibility",
            listOf(ImmutableMethodParameter("I", null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    const/16 p1, 0x8
                    invoke-super {p0, p1}, $superclass->setVisibility(I)V
                    return-void
                """.trimIndent()
            )
        }
    )
}

@Suppress("unused")
val blockMarketingNotificationsPatch = bytecodePatch(
    name = "Block marketing notifications",
    description = "Blocks in-app promotional prompts, modals and promotion banners. " +
        "Note: this only affects in-app promotions. Match-alert push delivery on " +
        "re-signed builds needs working push delivery - use MicroG integration + " +
        "signature spoofing where Play Services is absent (issue #25)."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Dismiss the sheet as soon as it is created instead of populating it, so the
        // promotional content never renders.
        val dismissEarly = """
            invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V
            return-void
        """.trimIndent()

        PromotionModalFingerprint.method.addInstructions(0, dismissEarly)
        // The tennis AI-insights promo sheet exists up to 26.09.14 and was removed in
        // 26.09.28, so it is genuinely optional.
        TennisPromoSheetFingerprint.methodOrNull?.addInstructions(0, dismissEarly)

        PROMO_BANNERS.forEach { keepGone(it) }
    }
}
