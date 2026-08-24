package dev.jason.gboardpatches.patches.gboard.features.cursortrackpad

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardCursorTrackpadFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在 free_cursor 與 free_cursor_lock_mode 原始結果後套用使用者設定值",
    feature = GboardFlagFamilyFeature.ENABLE_CURSOR_TRACKPAD_MODE,
)
