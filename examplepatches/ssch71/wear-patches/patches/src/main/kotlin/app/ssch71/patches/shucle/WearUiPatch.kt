/*
 * Copyright (C) 2026 ssch71
 */
package app.ssch71.patches.shucle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.ssch71.patches.shared.Constants.COMPATIBILITY_SHUCLE

private const val EXTENSION_CLASS = "Lapp/ssch71/extension/wear/WearUi;"

@Suppress("unused")
val wearUiPatch = patch(
    name = "Wear UI",
    description = "원형 워치 화면에 맞게 density를 낮추고 원형 인셋 패딩을 적용합니다.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SHUCLE)

    extendWith("extensions/extension.mpe")

    execute {
        // super.onCreate / setContent 전에 density를 바꿔야 Compose에 반영됨
        ShucleMainActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, ${EXTENSION_CLASS}->onCreate(Landroid/app/Activity;)V
            """
        )
    }
}
