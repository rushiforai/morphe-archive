package app.ra1nify.f4t.keyboard

import app.morphe.patcher.patch.bytecodePatch
import app.ra1nify.f4t.shared.OPLUS_KEYBOARD
import app.ra1nify.f4t.shared.installAntiResaleAlert

@Suppress("unused")
val keyboardAntiResalePatch = bytecodePatch(
    name = "Alert",
    default = false,
) {
    compatibleWith(OPLUS_KEYBOARD)

    extendWith("extensions/extension.mpe")

    execute {
        installAntiResaleAlert()
    }
}
