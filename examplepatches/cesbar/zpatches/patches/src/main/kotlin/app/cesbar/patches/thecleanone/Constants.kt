package app.cesbar.patches.minesweeperthecleanone

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PAIRIP = arrayOf(
        Compatibility(
            name = "Sudoku The Clean One",
            packageName = "ee.dustland.android.dustlandsudoku",
            appIconColor = 0x3C3C3C,
            targets = listOf(AppTarget("2.18.3"), AppTarget(null))
        )
    )
    val COMPATIBILITY = arrayOf(
        *COMPATIBILITY_PAIRIP,
        Compatibility(
            name = "Minesweeper The Clean One",
            packageName = "ee.dustland.android.minesweeper",
            appIconColor = 0x3C3C3C,
            targets = listOf(AppTarget("1.21.3"), AppTarget(null))
        ),
        Compatibility(
            name = "Solitaire The Clean One",
            packageName = "ee.dustland.android.solitaire",
            appIconColor = 0x3C3C3C,
            targets = listOf(AppTarget("1.20.3"), AppTarget(null))
        )
    )
    
}