package app.pepper.patches.icons

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Locate the icon-picker builder method by characteristic analytics-name strings
 * "custom_app_icon_tier{1,2,3}_default" — these are stable across releases.
 * The method itself is a synthetic multi-case dispatcher in `sa0`.
 */
internal object TierIconsBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf(
        "custom_app_icon_tier1_default",
        "custom_app_icon_tier2_default",
        "custom_app_icon_tier3_default",
    ),
)

/**
 * Same picker builder as TierIconsBuilderFingerprint, but located via the
 * 4 event-icon analytics names — used as a separate fingerprint so the patch
 * can run independently of the tier-icons patch.
 */
internal object EventIconsFilterFingerprint : Fingerprint(
    strings = listOf(
        "custom_app_icon_event_theming_summer_sales",
        "custom_app_icon_event_theming_autumn_sales",
        "custom_app_icon_event_theming_black_friday",
        "custom_app_icon_event_theming_el_buen_fin",
    ),
)

/**
 * `jc8.h(boolean, Continuation)Object` — ShouldRestoreEventThemingAppIconToDefaultUseCase.
 * Pin via:
 *  - 2 params: boolean + Continuation reference
 *  - returns Object (suspend Boolean)
 *  - body uses TimeUnit.MILLISECONDS to compute now-vs-activeUntilDate compare
 */
internal object ShouldRestoreEventIconFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        if (method.parameterTypes.size != 2) false
        else if (method.parameterTypes[0].toString() != "Z") false
        else {
            val secondParam = method.parameterTypes[1].toString()
            if (!secondParam.startsWith("L") || !secondParam.endsWith(";")) false
            else {
                val impl = method.implementation
                impl != null && impl.instructions.any { insn ->
                    (insn as? ReferenceInstruction)?.reference?.toString()?.contains(
                        "Ljava/util/concurrent/TimeUnit;->MILLISECONDS",
                    ) == true
                }
            }
        }
    },
)
