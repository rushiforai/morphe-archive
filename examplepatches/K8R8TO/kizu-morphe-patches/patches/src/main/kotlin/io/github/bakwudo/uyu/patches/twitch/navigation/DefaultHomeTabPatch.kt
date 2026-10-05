package io.github.bakwudo.uyu.patches.twitch.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

internal val defaultHomeTabPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        DefaultHomePageFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lapp/morphe/extension/DefaultFollowing;->useNativeFollowing()Z
                move-result v0
                if-eqz v0, :kizu_default_home_original
                sget-object v0, $FOLLOWING_PAGE_TYPE->INSTANCE:$FOLLOWING_PAGE_TYPE
                return-object v0
                :kizu_default_home_original
            """,
        )
    }
}
