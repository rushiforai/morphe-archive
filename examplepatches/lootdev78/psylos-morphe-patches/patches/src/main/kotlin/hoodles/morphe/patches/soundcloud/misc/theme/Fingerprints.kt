/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.soundcloud.misc.theme

import app.morphe.patcher.Fingerprint

object BottomBarCtorFingerprint : Fingerprint(
    definingClass = "Lcom/soundcloud/android/ui/components/navigations/BottomTabBarRestyle;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I")
)