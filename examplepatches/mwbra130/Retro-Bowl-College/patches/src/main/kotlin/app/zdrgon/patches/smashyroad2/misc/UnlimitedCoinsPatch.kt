package app.zdrgon.patches.smashyroad2.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.smashyroad2.shared.Constants.COMPATIBILITY_SMASHY_ROAD_2

// Extension helper that backs up and rewrites the game's save file. Must
// match the class in the extensions module.
private const val COIN_PATCHER =
    "Lapp/template/extension/smashyroad2/CoinPatcher;"

@Suppress("unused")
val unlimitedCoinsPatch = bytecodePatch(
    name = "Unlimited coins & unlocks",
    description = "Sets cash to 9,999,999, every upgrade card to 10,000, " +
        "unlocks ALL vehicles and characters (no spinning needed), unlocks the Pro Pass, " +
        "slot/lottery machines, completes all main + side missions, " +
        "and maxes vehicle durability. " +
        "Backs up your save before touching it. To revert: place an empty file named " +
        "SR2_RESTORE.txt in Android/data/com.rkgames.basisgame/files/ and open the game.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMASHY_ROAD_2)

    // Merge the extension DEX into the patched app. Without this the
    // injected call below references a class that does not exist at
    // runtime and the game crashes on launch with NoClassDefFoundError.
    extendWith("extensions/extension.mpe")

    execute {
        val method = LauncherOnCreateFingerprint.method

        // Insert at the very start of onCreate. p0 is the Activity (a Context)
        // and is already initialized as a parameter, so calling a static
        // helper with it before anything else is safe. Unity loads PlayerPrefs
        // from disk later during player init, so the edited save wins the race.
        method.addInstructions(
            0,
            """
                invoke-static {p0}, $COIN_PATCHER->run(Landroid/content/Context;)V
            """,
        )
    }
}
