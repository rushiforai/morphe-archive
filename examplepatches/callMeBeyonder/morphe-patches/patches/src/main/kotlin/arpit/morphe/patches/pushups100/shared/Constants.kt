package arpit.morphe.patches.pushups100.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * 0-100 Pushups Trainer by Zen Labs Fitness — part of the `com.zenlabs.challenge.*`
     * line, which does *not* share the `com.c25k.reboot` subscription module used by the
     * running apps. It has its own `AppSubscriptionStateProvider`.
     *
     * Shipped as a plain universal APK (APKPure build), not a split bundle.
     */
    val COMPATIBILITY_PUSHUPS100 = Compatibility(
        name = "0-100 Pushups",
        packageName = "com.zenlabs.challenge.pushups",
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "5.3.3"
            )
        )
    )
}
