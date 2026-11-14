package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_AIDETECTOR = Compatibility(
        name = "AI Detector",
        packageName = "com.aidetector.app",
        targets = listOf(
            AppTarget(
                version = "22.0.0"
            )
        )
    )

    val COMPATIBILITY_REVERSO = Compatibility(
        name = "Reverso Context",
        packageName = "com.softissimo.reverso.context",
        targets = listOf(
            AppTarget(
                version = "17.2.0",
            )
        )
    )

    val COMPATIBILITY_RIGHTGALLERY = Compatibility(
        name = "RightGallery",
        packageName = "dev.goodwy.gallery",
        targets = listOf(
            AppTarget(
                version = "8.3.1"
            )
        )
    )

    val COMPATIBILITY_RILLPHONE = Compatibility(
        name = "RillPhone",
        packageName = "dev.goodwy.rphone",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "0.7.3"
            )
        )
    )

    val COMPATIBILITY_XAPKEXTRACTOR = Compatibility(
        name = "XAPK Extractor",
        packageName = "com.ytheekshana.apkextractor",
        targets = listOf(
            AppTarget(
                version = "1.8.9",
            )
        )
    )

    val COMPATIBILITY_ZERCH = Compatibility(
        name = "Zerch",
        packageName = "com.zerch.widget",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "2.3.3",
            )
        )
    )

    val COMPATIBILITY_USENETPANDA = Compatibility(
        name = "Usenet Panda",
        packageName = "at.mann.usenetpanda",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "3.0.1",
            )
        )
    )

    val COMPATIBILITY_FILETREESIZE = Compatibility(
        name = "File Tree Size",
        packageName = "com.devone.filetreesize",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "4.5.1-NRS.V5",
            )
        )
    )

    val COMPATIBILITY_MONITEE = Compatibility(
        name = "Monitee",
        packageName = "com.krillsson.monitee",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "0.42.0",
            )
        )
    )

    val STICKER_MAKER_COMPATIBILITY = Compatibility(
        name = "Sticker Maker",
        packageName = "com.marsvard.stickermakerforwhatsapp",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(
                version = "1.0.12-7",
            )
        )
    )
}
