package app.twrailway.patches.promotion

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.twrailway.patches.settings.EXTENSION_PACKAGE
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.settings.patchSettingsPatch
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PROMOTION_OVERRIDES_CLASS = "$EXTENSION_PACKAGE/PromotionOverrides;"

/**
 * Free users are shown subscription promotion popups that subscribers never see:
 * the discounted subscription popup (`PromoController`, 限時特價 / 專屬優惠),
 * the holiday sale popup, and the widget intro popup ("解鎖新功能：桌面小工具").
 * They are Dart code (AOT compiled to `libapp.so`), and each is enabled by a
 * Firebase Remote Config parameter: `promo_enabled`, `holiday_active` / `holiday_show_popup`
 * and `widget_intro_enabled`.
 *
 * The patch hooks the firebase_remote_config plugin where it hands the parameters to Dart,
 * and sets these to `false`, so the popups are never shown.
 *
 * The home screen widgets of free users also have an "升級即時看板 ›" link to the paywall in
 * their footer. They are native code (`RemoteViews`), so the patch hooks the method creating
 * the free views, and hides the footer right after the views are created.
 *
 * The subscription status and the paid features are not changed. It can be turned off in the
 * patch settings.
 */
@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Stops the subscription promotion popups (discount, holiday sale and widget intro) " +
        "that only free users see, and hides the \"升級即時看板\" link of the free home screen widgets. " +
        "Paid features are not unlocked.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(patchSettingsPatch)

    execute {
        markPatchApplied("hide_promotions")

        RemoteConfigParseParametersFingerprint.method.apply {
            val instructions = implementation?.instructions?.toList()
                ?: throw PatchException("parseParameters has no implementation")
            val returnIndexes = instructions.indices.filter { index ->
                instructions[index].opcode == Opcode.RETURN_OBJECT
            }
            if (returnIndexes.isEmpty()) throw PatchException("Could not find the return of parseParameters")

            // Insert from the last return so the earlier indexes stay valid. The return is
            // replaced by the hook (keeping the branches that jump to it), and added again after it.
            returnIndexes.reversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                replaceInstruction(
                    index,
                    "invoke-static/range { v$register .. v$register }, " +
                        "$PROMOTION_OVERRIDES_CLASS->overrideRemoteConfig(Ljava/util/Map;)V",
                )
                addInstruction(index + 1, "return-object v$register")
            }
        }

        FreeWidgetViewsFingerprint.method.apply {
            val instructions = implementation?.instructions?.toList()
                ?: throw PatchException("The free widget views method has no implementation")

            // views = new RemoteViews(context.getPackageName(), layout)
            val initIndexes = instructions.indices.filter { index ->
                val instruction = instructions[index]
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    reference?.definingClass == "Landroid/widget/RemoteViews;" &&
                    reference.name == "<init>"
            }
            val initIndex = initIndexes.singleOrNull()
                ?: throw PatchException("Expected 1 RemoteViews constructor, found ${initIndexes.size}")
            if (initIndex < 2) throw PatchException("Unexpected code before the RemoteViews constructor")

            val packageNameCall = instructions[initIndex - 2]
            val packageNameReference = (packageNameCall as? ReferenceInstruction)?.reference as? MethodReference
            if (packageNameReference?.name != "getPackageName") {
                throw PatchException("The RemoteViews constructor does not use context.getPackageName()")
            }

            // The registers are read from the instructions: the Context parameter register is
            // reused for other values later in the method, so it is only known to hold the
            // Context here.
            val viewsRegister = (instructions[initIndex] as FiveRegisterInstruction).registerC
            val contextRegister = (packageNameCall as FiveRegisterInstruction).registerC
            // A non-range invoke can only use v0-v15.
            if (viewsRegister > 15 || contextRegister > 15) {
                throw PatchException("Unexpected register layout in $definingClass->$name")
            }

            addInstruction(
                initIndex + 1,
                "invoke-static { v$viewsRegister, v$contextRegister }, " +
                    "$PROMOTION_OVERRIDES_CLASS->hideWidgetUpgradeLink(" +
                    "Landroid/widget/RemoteViews;Landroid/content/Context;)V",
            )
        }
    }
}
