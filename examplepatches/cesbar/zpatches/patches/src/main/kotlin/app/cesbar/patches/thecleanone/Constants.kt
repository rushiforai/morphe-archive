package app.cesbar.patches.minesweeperthecleanone

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = arrayOf(
        Compatibility(
            name = "Minesweeper The Clean One",
            packageName = "ee.dustland.android.minesweeper",
            appIconColor = 0x3C3C3C,
            targets = listOf(AppTarget(null))
        ),
        Compatibility(
            name = "Solitaire The Clean One",
            packageName = "ee.dustland.android.solitaire",
            appIconColor = 0x3C3C3C,
            targets = listOf(AppTarget(null))
        ),
        // Uses Pair-Ip, should find a way to nuke it
        // Compatibility(
        //     name = "Sudoku The Clean One",
        //     packageName = "ee.dustland.android.dustlandsudoku",
        //     appIconColor = 0x3C3C3C,
        //     targets = listOf(AppTarget(null))
        // )
    )
}