/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * The settings class's reader of the account's plan (R8-renamed): returns the plan enum (`None`, `Lifetime`,
 * `Monthly`, ... `FreePremium`, `AdsOnDemand`) saved in the "premium_type" preference. Every Premium check, including
 * the ones the app makes through reflection, asks it, and `None` means a free account.
 */
private object PremiumTypeFingerprint : Fingerprint(
    parameters = listOf(),
    strings = listOf("premium_type"),
    custom = { method, _ -> method.returnType.startsWith("L") && method.returnType != "Ljava/lang/String;" },
)

/** `Boolean getMuslimpro()`, `getMuslimproNoAds()`, `getNoInterstitial()` and `getQalbox()`: what the account's plan includes. */
private val entitlementFingerprints = listOf("getMuslimpro", "getMuslimproNoAds", "getNoInterstitial", "getQalbox").map {
    Fingerprint(
        definingClass = "Lcom/bitsmedia/android/core/premium/data/EntitledFeatures;",
        name = it,
        returnType = "Ljava/lang/Boolean;",
        parameters = listOf(),
    )
}

/** The Today card "Buka semua akses Premium... Upgrade paket saya"; Compose's trace string names the composable. */
private object FeaturePremiumCardFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        "com.bitsmedia.android.today.presentation.ui.featureds.premium.FeaturePremiumCard (FeaturePremiumCard.kt:71)",
    ),
)

/** The "Go Premium" bar at the bottom of the Qalbox lessons (Belajar); Compose's trace string names the composable. */
private object GoPremiumBarFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.qalboxmobile.screens.courses.GoPremium (LessonComposables.kt:930)"),
)

/**
 * The ad manager's "ads are allowed" check (R8-renamed, found by its onboarding preference and the Prebid field). The
 * bottom "Don't like ads? Get Premium" strip is shown only while it is true.
 */
private object AdsAllowedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("is_onboarding_completed"),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lcom/bitsmedia/android/ads/adnetwork/PrebidNetwork;" }
    },
)

/** `ProfileViewModel` picks the profile chip's label ("Upgrade" or "Go Premium") from the tier. */
private object ProfileChipFingerprint : Fingerprint(
    definingClass = "Lcom/bitsmedia/android/profile/viewmodel/ProfileViewModel;",
    custom = { method, _ ->
        method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == STRING_UPGRADE } == true
    },
)

/**
 * The ad manager's loader of one ad slot (R8-renamed): takes the slot's container, the ad unit, the banner size and a
 * callback. With ads off the container is left as an empty strip, so it is hidden here.
 */
private object AdSlotFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/view/ViewGroup;",
        "Ljava/lang/String;",
        "Lcom/google/android/libraries/ads/mobile/sdk/banner/AdSize;",
        "Lkotlin/jvm/functions/Function0;",
    ),
)

/**
 * The main screen's setup of the empty strip above the navigation bar that the ad strip fills (R8-renamed, found by the
 * strip's id). Without it the strip is an empty gap.
 */
private object AdStripSetupFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == ID_AD_STRIP } == true
    },
)

private const val ID_AD_STRIP = 0x7f0b00be

private const val DIMEN_PROFILE_STRIP_PADDING = 0x7f070169

/** The profile screen's two window-insets handlers (R8-renamed), which both pad the list's bottom for the ad strip. */
private class ProfileInsetsFingerprint(name: String) : Fingerprint(
    definingClass = "Lcom/bitsmedia/android/profile/ProfileActivity;",
    returnType = "Landroidx/core/view/WindowInsetsCompat;",
    name = name,
    custom = { method, _ ->
        method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == DIMEN_PROFILE_STRIP_PADDING } == true
    },
)
/**
 * `TodayViewModel`'s builder of the carousel under the prayer card (R8-renamed, found by the item class it creates).
 * Free accounts get a sponsor promo and a Premium upsell around the one card an ad-free account has.
 */
private object CarouselBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/bitsmedia/android/today/presentation/ui/today/TodayViewModel;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == "LbottomToWindowBottom;"
        } == true
    },
)

private const val STRING_UPGRADE = 0x7f150df1
private const val STRING_GO_PREMIUM = 0x7f1504c8
private const val STRING_MY_PREMIUM = 0x7f15077a

@Suppress("unused")
val premiumUnlockPatch = patch(
    name = "Premium unlock",
    description = "Unlocks Premium on the device: no ads, no upgrade banners and the Premium-only features that do not " +
        "need the server.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Premium")
    extendWith("extensions/extension.mpe")

    execute {
        // The plan alone leaves the "Upgrade paket saya" card up, which the entitlements decide.
        entitlementFingerprints.forEach {
            it.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                """,
            )
        }

        val plan = PremiumTypeFingerprint.method.returnType
        PremiumTypeFingerprint.method.addInstructions(
            0,
            """
                const-class v0, $plan
                const-string v1, "Lifetime"
                invoke-static { v0, v1 }, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;
                move-result-object v0
                check-cast v0, $plan
                return-object v0
            """,
        )

        FeaturePremiumCardFingerprint.method.addInstructions(0, "return-void")
        GoPremiumBarFingerprint.method.addInstructions(0, "return-void")
        AdsAllowedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        AdSlotFingerprint.method.addInstructions(
            0,
            """
                if-eqz p1, :skip
                const/16 v0, 0x8
                invoke-virtual { p1, v0 }, Landroid/view/View;->setVisibility(I)V
                :skip
                nop
            """,
        )

        val builder = CarouselBuilderFingerprint.method
        val adds = builder.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference.let {
                it is MethodReference && it.definingClass == "Ljava/util/AbstractCollection;" && it.name == "add"
            }
        }.toList()
        if (adds.isEmpty()) throw PatchException("No carousel add found")
        adds.forEach { (index, instruction) ->
            val call = instruction as FiveRegisterInstruction
            builder.replaceInstruction(
                index,
                "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                    "Lapp/fakh/extension/muslimpro/Carousel;->add(Ljava/util/AbstractCollection;Ljava/lang/Object;)Z",
            )
        }

        // The profile list keeps a bottom padding for the hidden ad strip, which clips its last rows.
        listOf("IqraCourseModuleResponse", "getErrorCode").forEach { name ->
            val insets = ProfileInsetsFingerprint(name).method
            val instructions = insets.implementation!!.instructions.toList()
            val dimen = instructions.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == DIMEN_PROFILE_STRIP_PADDING }
            val pad = (dimen + 1 until instructions.size).firstOrNull {
                ((instructions[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setPaddingRelative"
            } ?: throw PatchException("setPaddingRelative after the strip padding not found in $name")
            val args = instructions[pad] as FiveRegisterInstruction
            insets.replaceInstruction(
                pad,
                "invoke-static { v${args.registerC}, v${args.registerD}, v${args.registerE}, v${args.registerF}, v${args.registerG} }, " +
                    "Lapp/fakh/extension/muslimpro/Rows;->padRelative(Landroid/view/View;IIII)V",
            )
        }

        AdStripSetupFingerprint.method.addInstructions(
            0,
            """
                const v1, $ID_AD_STRIP
                invoke-virtual { p1, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
                move-result-object v1
                if-eqz v1, :skip
                const/16 v2, 0x8
                invoke-virtual { v1, v2 }, Landroid/view/View;->setVisibility(I)V
                :skip
                return-void
            """,
        )

        val chip = ProfileChipFingerprint.method
        val labels = chip.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral.let { it == STRING_UPGRADE || it == STRING_GO_PREMIUM }
        }.toList()
        if (labels.size != 2) throw PatchException("Expected 2 profile chip labels, found ${labels.size}")
        labels.forEach { (index, instruction) ->
            chip.replaceInstruction(index, "const v${(instruction as OneRegisterInstruction).registerA}, $STRING_MY_PREMIUM")
        }
    }
}
