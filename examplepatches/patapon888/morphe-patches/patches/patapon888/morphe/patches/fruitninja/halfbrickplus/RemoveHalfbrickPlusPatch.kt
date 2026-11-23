package patapon888.morphe.patches.fruitninja.halfbrickplus

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.RETURN_FALSE
import patapon888.morphe.patches.fruitninja.native.RETURN_TRUE
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

/**
 * Fruit Ninja Classic is a paid game that now also asks for a Halfbrick+ subscription check,
 * which needs the network. The game is treated as owned, so the pop-up never blocks it.
 */
@Suppress("unused")
val removeHalfbrickPlusPatch = resourcePatch(
    name = "Remove Halfbrick+ check",
    description = "Removes the Halfbrick+ subscription pop-up that blocks the game, so it can be played offline. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                LibraryEdit(0x2DBB274, "fe0f1df8 f65701a9", RETURN_TRUE), // Subscription.IsGamePurchased
                LibraryEdit(0x2D5EBAC, "fe0f1ef8 f44f01a9", RETURN_TRUE), // halfbrickPlusSystem.IsGamePurchased
                LibraryEdit(0x2D679F0, "fe57bea9 f44f01a9", RETURN_TRUE), // CanPlayTheGame
                LibraryEdit(0x2D6AB70, "ff4302d1 fe2300f9", RETURN_FALSE), // OnPlacement: no Halfbrick+ placement
            )
        )
    }
}
