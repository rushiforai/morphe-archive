package app.noam.patches.blockblast.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BLOCK_BLAST = Compatibility(
        name = "Block Blast",
        packageName = "com.block.juggle",
        // Google Play ships it as a split bundle (base + ABI/density/language/asset-pack splits).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x3C5CB6,
        targets = listOf(AppTarget(version = "10.8.1")),
    )
}
