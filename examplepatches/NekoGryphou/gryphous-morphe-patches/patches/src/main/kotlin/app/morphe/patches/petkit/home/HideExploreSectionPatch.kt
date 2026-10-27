package app.morphe.patches.petkit.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.petkit.shared.COMPATIBILITY_PETKIT

@Suppress("unused")
val hideExploreSectionPatch = bytecodePatch(
    name = "Hide Explore section",
    description = "Removes the Explore (Explorer) section from the PETKIT home page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETKIT)

    execute {
        val method = HomeCardListFingerprint.method
        val registerCount = method.implementation?.registerCount ?: 0
        // Four scratch locals and the two instance-method parameter registers.
        // The injected non-range calls also require p1 to fit in four bits.
        if (registerCount !in 6..16) {
            throw PatchException("PETKIT home card refresh has an unsupported register layout.")
        }

        // Copy first: the presenter/cache may retain the original list. Filter
        // before the field assignment and empty-state checks, so both layouts
        // receive consistent data and no invisible row or heading is left.
        method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                move-object p1, v0
                invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :petkit_explore_next
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :petkit_explore_done
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lcom/petkit/android/activities/home/adapter/model/NewHomeCardData;
                invoke-virtual {v1}, Lcom/petkit/android/activities/home/adapter/model/NewHomeCardData;->getType()Ljava/lang/String;
                move-result-object v1
                const-string v2, "HOME_CARD_VIRTUAL_AREA"
                invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v3
                if-eqz v3, :petkit_explore_next
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :petkit_explore_next
                :petkit_explore_done
                nop
            """,
        )
    }
}
