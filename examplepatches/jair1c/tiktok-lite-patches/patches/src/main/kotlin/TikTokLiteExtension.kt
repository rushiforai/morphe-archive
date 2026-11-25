package app.tiktoklitepatches

import app.morphe.patcher.patch.bytecodePatch

internal val tikTokLiteExtension = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
