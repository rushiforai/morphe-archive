package app.template.patches.samsungkeyboard.misc

import app.morphe.patcher.Fingerprint

/** The sticker panel's "download more" button: opens the Galaxy Store sticker category with a bare startActivity. */
internal object StickerStoreClickFingerprint : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("samsungapps://CategoryList/0000005276"),
)
