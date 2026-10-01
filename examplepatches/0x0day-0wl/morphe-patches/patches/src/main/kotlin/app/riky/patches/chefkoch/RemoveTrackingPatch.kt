package app.riky.patches.chefkoch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CHEFKOCH

@Suppress("unused")
val removeTrackingPatch = bytecodePatch(
    name = "Remove tracking",
    description = "Neuters the app tracking middleware: no Snowplow events, no Admo Audix " +
        "targeting and no Firebase tracking state changes are processed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHEFKOCH)

    execute {
        // all$lambda$0 is the middleware reducer that initializes Snowplow, forwards
        // Firebase tracking state and dispatches Audix targeting. It ALSO invokes the
        // next middleware in the chain (function1) and returns its result. So we cannot
        // simply return early — that breaks action propagation app-wide (login/search).
        // Instead, call the next middleware and return its result, skipping only the
        // tracking side effects.
        AppTrackingAllFingerprint.method.addInstructions(
            0,
            """
                invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

                move-result-object v6

                return-object v6
            """,
        )
    }
}
