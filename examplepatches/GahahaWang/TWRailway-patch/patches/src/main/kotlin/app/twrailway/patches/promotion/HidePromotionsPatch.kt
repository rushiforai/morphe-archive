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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

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
 * and sets these to `false`, so the popups are never shown. The subscription status and the
 * paid features are not changed. It can be turned off in the patch settings.
 */
@Suppress("unused")
val hidePromotionsPatch = bytecodePatch(
    name = "Hide promotions",
    description = "Stops the subscription promotion popups (discount, holiday sale and widget intro) " +
        "that only free users see. Paid features are not unlocked.",
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
    }
}
