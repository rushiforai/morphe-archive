package dev.jason.gboardpatches.patches.gboard.features.cursortrackpad

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardCursorTrackpadFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the user setting after the stock free_cursor and free_cursor_lock_mode results.",
    feature = GboardFlagFamilyFeature.ENABLE_CURSOR_TRACKPAD_MODE,
)
