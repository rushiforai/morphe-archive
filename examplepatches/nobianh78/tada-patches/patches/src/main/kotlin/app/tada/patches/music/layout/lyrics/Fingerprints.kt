/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3033
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.music.layout.lyrics

import app.morphe.patcher.Fingerprint

/**
 * Matched only to reach the engagement panel controller class, which owns the field
 * holding the panel currently in the container.
 */
internal object EngagementPanelControllerFingerprint : Fingerprint(
    strings = listOf(
        "EngagementPanelController: cannot show EngagementPanel before EngagementPanelController.init() has been called.",
        "[EngagementPanel] Cannot show EngagementPanel before EngagementPanelController.init() has been called."
    )
)
