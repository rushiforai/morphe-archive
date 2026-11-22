package patapon888.morphe.patches.bejeweled.purchases

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary
import patapon888.morphe.patches.bejeweled.unlock.unlockGameModesPatch

private const val NOP = 0xd503201f.toInt()
private const val RET = 0xd65f03c0.toInt()

@Suppress("unused")
val removePurchasesPatch = resourcePatch(
    name = "Remove purchases and ads",
    description = "Removes ads, the store, promotional pop-ups and the paid continue offers after a game over."
) {
    compatibleWith(BEJEWELED_3)

    // Reuses the w13 = 1 set up by the unlock patch in the Bej3App constructor.
    dependsOn(unlockGameModesPatch)

    execute {
        patchGameLibrary(
            listOf(
                // Bej3App::Bej3App(): gAppNoAdPurchased = true, in the slots freed by the unlock patch.
                InstructionEdit(0xf201d0, 0x52822a2c, 0xd00083ae.toInt()), // adrp x14, GOT page
                InstructionEdit(0xf201d4, 0x382c6928, 0xf946b9ce.toInt()), // ldr x14, [x14, #3440]
                InstructionEdit(0xf201e8, 0x52822c2a, 0x390001cd), // strb w13, [x14]
                InstructionEdit(0xf201ec, 0x382a6928, NOP),
                // Profile::LoadProfileHelper: saved "ads removed" flag is always true.
                InstructionEdit(0x1063844, 0x12000108, 0x52800028),
                // Bej3App::DoEndGameMenu: go straight to the results instead of the continue offers
                // (Diamond Mine, Lightning, Classic, Butterflies, Poker, Ice Storm).
                InstructionEdit(0xf26870, 0x54000461, 0x14000023),
                InstructionEdit(0xf26908, 0x54000441, 0x14000022),
                InstructionEdit(0xf26998, 0x35000448, 0x14000022),
                InstructionEdit(0xf26a2c, 0x54000441, 0x14000022),
                InstructionEdit(0xf26ac0, 0x54000441, 0x14000022),
                InstructionEdit(0xf26b54, 0x54000441, 0x14000022),
                // MainMenuOptions constructors: never add the store button.
                InstructionEdit(0x11f2b50, 0xd63f0100.toInt(), NOP),
                InstructionEdit(0x11f3888, 0xd63f0100.toInt(), NOP),
                // MainMenuOptions constructors: never add the "Get Stars" cross-promotion button.
                InstructionEdit(0x11f2448, 0xd63f0100.toInt(), NOP),
                InstructionEdit(0x11f3170, 0xd63f0100.toInt(), NOP),
                // Anything left that would open the store, buy or show a promotion does nothing.
                InstructionEdit(0xf4ab6c, 0xd10083ff.toInt(), RET), // Bej3App::DoNewStoreMenu
                InstructionEdit(0x1179204, 0xd10703ff.toInt(), RET), // AppStoreManager::Purchase
                InstructionEdit(0x117e1e8, 0xd100c3ff.toInt(), RET), // DraperManager::Show
            )
        )
    }
}
