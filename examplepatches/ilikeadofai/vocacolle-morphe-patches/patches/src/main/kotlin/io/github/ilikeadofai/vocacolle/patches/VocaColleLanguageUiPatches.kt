package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.bytecodePatch
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

@Suppress("unused")
val vocacolleEnglishUiPatch = bytecodePatch(
    name = "English UI",
    description = "Adds complete English static, hardcoded, and server-provided UI localization.",
    default = true
) {
    compatibleWith(VOCACOLLE)
    dependsOn(
        vocacolleStaticEnglishUiPatch,
        vocacolleHardcodedKoreanUiPatch,
        vocacolleServerUiKoreanPatch
    )
}

@Suppress("unused")
val vocacolleKoreanUiPatch = bytecodePatch(
    name = "Korean UI",
    description = "Adds complete Korean static, hardcoded, and server-provided UI localization.",
    default = true
) {
    compatibleWith(VOCACOLLE)
    dependsOn(
        vocacolleStaticKoreanUiPatch,
        vocacolleHardcodedKoreanUiPatch,
        vocacolleServerUiKoreanPatch
    )
}
