package app.template.patches.ztnnotepad.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ZTNNOTEPAD

private const val CALLDORADO = "Lcom/calldorado/Calldorado;"

/**
 * #Notepad's ads come from the bundled Calldorado SDK: its in-app ad manager (started
 * unconditionally from ZtnApplication, regardless of premium) and its after-call screen.
 * Both entry points are public Calldorado API with stable names; the app null-checks the
 * ad manager everywhere, so it simply never gets one.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Stops the bundled Calldorado ad SDK: no in-app ads and no after-call ad screen."
) {
    compatibleWith(COMPATIBILITY_ZTNNOTEPAD)

    execute {
        val targets = mutableClassDefBy(CALLDORADO).methods.filter {
            it.implementation != null && it.returnType == "V" &&
                (it.name == "start" || it.name == "startInAppAdManager")
        }
        if (targets.none { it.name == "startInAppAdManager" } || targets.none { it.name == "start" }) {
            throw PatchException("Calldorado start/startInAppAdManager not found")
        }
        targets.forEach { it.returnEarly() }
    }
}
