package app.ra1nify.f4t.bilibili

import app.morphe.patcher.patch.bytecodePatch
import app.ra1nify.f4t.shared.BILIBILI
import app.ra1nify.f4t.shared.installAntiResaleAlert

@Suppress("unused")
val bilibiliAntiResalePatch = bytecodePatch(
    name = "Alert",
    default = false,
) {
    compatibleWith(BILIBILI)

    extendWith("extensions/extension.mpe")

    execute {
        installAntiResaleAlert()
    }
}
