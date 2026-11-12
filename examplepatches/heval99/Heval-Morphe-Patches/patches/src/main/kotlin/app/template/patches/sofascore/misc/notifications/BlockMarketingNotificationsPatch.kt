package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.template.patches.shared.addInstructionsChecked

internal val BLOCK_MARKETING_NOTIFICATIONS = HevalFeature(
    id = FEATURE,
    calm = true,
    name = "Hide promo banners",
    description = "Hides promotional banners, offer sheets and pop-up campaigns.",
    category = SofascoreControlsCategory.POPUPS,
)

private const val FEATURE = "sofascore.block_marketing_notifications"

// Promotional banner views (class names kept: referenced from layouts).
private val PROMO_BANNERS = listOf(
    "Lcom/sofascore/results/event/details/view/promotion/PromotionBannerView;",
    "Lcom/sofascore/results/featuredtournament/view/PromotionalOffersBannerView;",
)

// Firebase In-App Messaging's display callback. Its implementations (the FIAM display component
// and an R8 lambda wrapping it) are obfuscated, but they implement this kept interface and the
// interface keeps the method name.
private const val FIAM_DISPLAY = "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;"

/**
 * The FirebaseInAppMessagingDisplay.displayMessage implementations to gate, so server-side In-App
 * Messaging campaigns (promo modals, cards, banners) never render while the feature is on. Empty
 * when the app does not bundle FIAM; fails when it does but no implementation has a body to gate.
 * An implementation that is already only `return-void` (a no-op stub) needs no gate.
 */
private fun BytecodePatchContext.inAppMessagingDisplays(): List<MutableMethod> {
    var bundled = false
    val displays = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type == FIAM_DISPLAY) bundled = true
        if (FIAM_DISPLAY in classDef.interfaces) displays += classDef
    }
    if (!bundled) return emptyList()
    val methods = displays.flatMap { classDef ->
        mutableClassDefBy(classDef).methods.filter {
            it.name == "displayMessage" && it.returnType == "V" && it.implementation != null &&
                it.getInstruction(0).opcode != Opcode.RETURN_VOID
        }
    }
    if (methods.isEmpty()) throw PatchException("No FirebaseInAppMessagingDisplay.displayMessage implementation found")
    return methods
}

/**
 * Keeps the view GONE while the feature is on, through setVisibility(int): an existing override
 * gets a gate that sets the argument to GONE; otherwise one is added that does the same and calls
 * the superclass. Returns the edit to make once every site is validated.
 */
private fun BytecodePatchContext.keepGone(type: String): () -> Unit {
    val classDef = mutableClassDefBy(type)
    val existing = classDef.methods.firstOrNull {
        it.name == "setVisibility" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
    }
    if (existing != null) return { existing.addHevalGate(FEATURE) { "const/16 p1, 0x8" } }
    val superclass = classDef.superclass ?: throw PatchException("$type has no superclass")
    return {
        // Three registers: v0 for the gate, p0 and p1.
        val method = ImmutableMethod(
            type,
            "setVisibility",
            listOf(ImmutableMethodParameter("I", null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsChecked(
                0,
                """
                    invoke-super {p0, p1}, $superclass->setVisibility(I)V
                    return-void
                """.trimIndent(),
            )
            addHevalGate(FEATURE) { "const/16 p1, 0x8" }
        }
        classDef.methods.add(method)
    }
}

// A Heval Controls feature: on by default, like the always-on patch it replaced.
@Suppress("unused")
val blockMarketingNotificationsPatch = sofascoreControls.featurePatch(
    BLOCK_MARKETING_NOTIFICATIONS,
    // The Manager patch keeps its name and description; only the Patch settings row was reworded (2026-11-11).
    name = "Block marketing notifications",
    description = "Blocks promo popups and banners.",
) {
    // Validate every site before the first edit.
    val promotionModal = PromotionModalFingerprint.method
    val banners = PROMO_BANNERS.map { keepGone(it) }
    val displays = inAppMessagingDisplays()

    // Dismiss the sheet as soon as it is created instead of populating it, so the promotional
    // content never renders.
    val dismissEarly = """
        invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V
        return-void
    """.trimIndent()
    promotionModal.addHevalGate(FEATURE) { dismissEarly }

    banners.forEach { it() }

    displays.forEach { it.hevalReturnEarly(FEATURE) }
}
