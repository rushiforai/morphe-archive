/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.settings

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.mygate.shared.Constants.COMPATIBILITY_MYGATE

@Suppress("unused")
val cleanSettingsPatch = patch(
    name = "Clean up Settings page",
    description = "Removes plan info, referral cards, cancellation links, and blank dividers from the Settings screen.",
) {
    compatibleWith(COMPATIBILITY_MYGATE)

    execute {
        // Clean up Settings / Profile Activity (collapse clPlanInfo, my_plans, dividers and blank margins)
        resourceXml("res/layout/activity_settings.xml").use { xml ->
            val collapseIds = setOf(
                "@id/clPlanInfo",
                "@id/tvPlanInfo",
                "@id/tvPlanLearnMore",
                "@id/l_plan_badge_toolbar",
                "@id/chatIcon",
                "@id/gap_view_2",
                "@id/my_plans",
                "@id/subscription_icon",
                "@id/myplans_tv",
                "@id/l_plan_badge",
                "@id/ivChevron",
                "@id/userEditProfileCard",
                "@id/l_app_update_available",
            )
            xml.elements().forEach { element ->
                val id = element.attribute("android:id")
                if (id in collapseIds) {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                    element.setAttribute("android:layout_marginTop", "0.0dp")
                    element.setAttribute("android:layout_marginBottom", "0.0dp")
                    element.setAttribute("android:padding", "0.0dp")
                    element.setAttribute("android:paddingHorizontal", "0.0dp")
                    element.setAttribute("android:paddingVertical", "0.0dp")
                    if (id == "@id/clPlanInfo") {
                        element.setAttribute("android:background", "@null")
                    }
                } else if (id == "@id/l_house_hold") {
                    element.setAttribute("app:layout_constraintTop_toBottomOf", "@id/userProfileCard")
                    element.setAttribute("android:layout_marginTop", "8.0dp")
                }
            }
        }

        // Clean up Settings General section (Tell a friend, Manage/Cancel subscription & re-anchor)
        resourceXml("res/layout/layout_settings_general.xml").use { xml ->
            val collapseIds = setOf(
                "@id/cl_tell_a_friend",
                "@id/tell_a_friend_icon",
                "@id/tell_a_friend_tv",
                "@id/gap_view_4",
                "@id/clManageCancelSubscription",
                "@id/ivSubscriptionIcon",
                "@id/tvManageCancelSubscription",
                "@id/gap_view_5",
            )
            xml.elements().forEach { element ->
                val id = element.attribute("android:id")
                if (id in collapseIds) {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                    element.setAttribute("android:layout_marginTop", "0.0dp")
                    element.setAttribute("android:layout_marginBottom", "0.0dp")
                    element.setAttribute("android:padding", "0.0dp")
                } else if (id == "@id/cl_account_info") {
                    element.setAttribute("app:layout_constraintTop_toBottomOf", "@id/gap_view_3")
                    element.setAttribute("android:layout_marginTop", "3.0dp")
                } else if (id == "@id/divider3") {
                    element.setAttribute("android:visibility", "visible")
                    element.setAttribute("android:layout_height", "1.0dp")
                    element.setAttribute("android:layout_marginTop", "3.0dp")
                } else if (id == "@id/cl_logout") {
                    element.setAttribute("app:layout_constraintTop_toBottomOf", "@id/divider3")
                    element.setAttribute("android:layout_marginTop", "3.0dp")
                }
            }
        }
    }
}
