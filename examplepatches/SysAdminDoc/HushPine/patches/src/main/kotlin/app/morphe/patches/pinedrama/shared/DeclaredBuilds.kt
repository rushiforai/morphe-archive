/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.shared

import app.morphe.patcher.PackageMetadata

/**
 * The builds a patch must apply to in full, where a part it can't find stops the patch rather than
 * being left out with a note. None yet: PineDrama lacks parts of TikTok's code that some of these
 * patches also reach for, and each of those patches leaves that part out and says so.
 */
internal fun declaredVersions(): Set<String> = emptySet()

/** What a patch's declared-build checks and notes call this build. */
internal val PackageMetadata.buildName: String
    get() = "PineDrama $versionName"
