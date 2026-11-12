package app.template.patches.shohay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_SHOHAY

@Suppress("unused")
val shohayPremiumPatch = patch(
    name = "Unlock Premium",
    description = "Unlocks all weekly premium videos by making SubscribedWeeksDeriver return every week (1-42) as subscribed with 1000 days remaining. The premium gate is evaluated locally from this result, so no server change is needed. Verified on Shohay 2.1.1.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SHOHAY)

    execute {
        // SubscribedWeeksDeriver.derive: insert an early return at the
        // method entry that returns a full premium state. The method entry
        // is a fall-through point (not a branch target), so a plain insert
        // here runs on every call and the original body -- which filters
        // the subscription rows and returns an empty set when none are
        // valid -- never executes.
        //
        // The inserted code builds the 1..42 set with the Kotlin stdlib
        // (IntRange + CollectionsKt.toSet, both already used by the app)
        // and returns DerivedPremiumState(set, 1000). It uses only v0-v2,
        // which are free at method entry, and returns before the original
        // code touches any register.
        SubscribedWeeksDeriverDeriveFingerprint.let {
            it.method.addInstructions(
                0,
                """
                    new-instance v0, Lkotlin/ranges/IntRange;
                    const/4 v1, 0x1
                    const/16 v2, 0x2a
                    invoke-direct {v0, v1, v2}, Lkotlin/ranges/IntRange;-><init>(II)V
                    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;
                    move-result-object v0
                    new-instance v1, Lhealth/shohay/pregnancy/foundation/profile/DerivedPremiumState;
                    const/16 v2, 0x3e8
                    invoke-direct {v1, v0, v2}, Lhealth/shohay/pregnancy/foundation/profile/DerivedPremiumState;-><init>(Ljava/util/Set;I)V
                    return-object v1
                """
            )
        }
    }
}
