/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.sync

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val SyncForRedditFreeCompatible = Compatibility(
    name = "Sync for Reddit",
    packageName = "com.laurencedawson.reddit_sync",
    targets = listOf(AppTarget(version = "v23.06.30-13:39"))
)

/**
 * The one package these patches are written for.
 *
 * <p>`com.laurencedawson.reddit_sync.pro` and `.dev` were declared here as well, at any version
 * at all, and neither has ever been patched or run: every fingerprint is written against the
 * free build's bytecode, and the paid builds are obfuscated separately, so a name like `Lpa/d;`
 * means something else in them. Declaring a target nobody can verify is worse than refusing it
 * — what a reader gets is an app that patches and then misbehaves, which neither they nor
 * anyone here can diagnose. Adding one back is a line, and should wait for somebody who has the
 * APK to test it against.
 */
internal val SyncForRedditCompatible = arrayOf(SyncForRedditFreeCompatible)

