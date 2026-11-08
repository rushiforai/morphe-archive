package app.morphe.patches.tinder.signature

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

private const val HOOK_CLASS = "Lapp/morphe/extension/tinder/patches/SpoofSignaturePatch;"

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = "Fixes push notifications on the patched app by spoofing the original signature.",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    extendWith("extensions/extension.mpe")

    execute {
        classDefForEach { classDef ->
            if (classDef.type != HOOK_CLASS && classDef.superclass == "Landroid/app/Application;") {
                mutableClassDefBy(classDef).setSuperClass(HOOK_CLASS)
            }
        }
    }
}
