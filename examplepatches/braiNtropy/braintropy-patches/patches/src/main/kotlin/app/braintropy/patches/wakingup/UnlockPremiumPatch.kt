package app.braintropy.patches.wakingup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_WAKING_UP

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium content and removes subscription banners.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAKING_UP)

    execute {
        // Force every UserModel to report an active paid subscription:
        // isSubscribed = true and isTrialSubscription = false.
        // All subscription checks (IsUserSubscribedUseCase, IsUserPaidSubscribedUseCase,
        // enforced paywall logic, widgets and menu entries) read these fields.
        UserModelConstructorFingerprint.method.apply {
            // Insert before the final return-void.
            // At this point v0 holds "this" and v1 is a dead scratch register.
            val insertIndex = implementation!!.instructions.size - 1
            addInstructions(
                insertIndex,
                """
                    const/4 v1, 0x1
                    iput-boolean v1, v0, Le40/u;->k:Z
                    const/4 v1, 0x0
                    iput-boolean v1, v0, Le40/u;->n:Z
                """
            )
        }

        // Mark every CourseModel as available. The server flags premium content
        // with is_unlocked=false for unsubscribed users; this overrides it so
        // all courses are playable and no lock icons are shown.
        CourseModelConstructorFingerprint.method.apply {
            // Insert before the final return-void. v0 is a dead scratch register here.
            val insertIndex = implementation!!.instructions.size - 1
            addInstructions(
                insertIndex,
                """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, Lo20/b;->c:Z
                """
            )
        }

        // Never render the "Subscribe to unlock" / "See Membership Options" upsell row.
        SubscribeRowFingerprint.method.addInstructions(0, "return-void")

        // Never render the home/explore "Join Waking Up" / "Get started" CTA banner.
        HomeCtaBannerFingerprint.method.addInstructions(0, "return-void")
    }
}
