package anxyis.morphe.patches.alightmotion

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AMZ_MOTIOO = Compatibility(
        name = "After Motion Z+ (motioo)",
        packageName = "com.alightcreative.motioo",
        targets = listOf(
            AppTarget("5.0.272.1028371"),
            AppTarget("5.0.273.1028426"),
            AppTarget("5.0.273.1028420"),
            AppTarget("5.0.273"),
            AppTarget("5.0.272")
        )
    )

    val COMPATIBILITY_AMZ_MOTION = Compatibility(
        name = "After Motion Z+ (motion)",
        packageName = "com.alightcreative.motion",
        targets = listOf(
            AppTarget("5.0.273.1028426"),
            AppTarget("5.0.272.1028371"),
            AppTarget("5.0.273"),
            AppTarget("5.0.272")
        )
    )

    val COMPATIBILITY_AM_PRO = Compatibility(
        name = "Alight Motion Pro",
        packageName = "com.alightcreative.motion",
        targets = listOf(
            AppTarget("5.0.273.1028420"),
            AppTarget("5.0.273.1028426"),
            AppTarget("5.0.272.1028371"),
            AppTarget("5.0.273"),
            AppTarget("5.0.272")
        )
    )
}
