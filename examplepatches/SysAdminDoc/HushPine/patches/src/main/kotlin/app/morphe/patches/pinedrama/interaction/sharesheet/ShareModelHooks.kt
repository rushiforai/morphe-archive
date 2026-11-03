/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.pinedrama.interaction.sharesheet

import app.morphe.patcher.Fingerprint

/**
 * The share model builder's actions row, the List the snapshot below copies its actions from. The
 * story save button (#93) finds the snapshot's own actions field by where this one is stored.
 */
internal const val SHARE_BUILDER_ACTIONS = "LJFF"

internal object ShareSnapshotFingerprint : Fingerprint(
    strings = listOf("click_to_respond_duration", "config_duration"),
    custom = { method, _ -> method.name == "<init>" && method.parameterTypes.size == 1 },
)
