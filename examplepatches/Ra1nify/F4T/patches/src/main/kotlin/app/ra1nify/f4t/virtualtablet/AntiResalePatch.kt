package app.ra1nify.f4t.virtualtablet

import app.morphe.patcher.patch.bytecodePatch
import app.ra1nify.f4t.shared.VIRTUAL_TABLET
import app.ra1nify.f4t.shared.installAntiResaleAlert

@Suppress("unused")
val virtualTabletAntiResalePatch = bytecodePatch(
    name = "Alert",
    default = false,
) {
    compatibleWith(VIRTUAL_TABLET)

    extendWith("extensions/extension.mpe")

    execute {
        installAntiResaleAlert()
    }
}
