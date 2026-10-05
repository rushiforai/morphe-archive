/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.ads

import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.instagram.utils.Constants.ADS_DESCRIPTOR
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

private const val HIDE_REELS_AND_STORIES_ADS = "$ADS_DESCRIPTOR/ReelsAndStoriesAds;->hideAds()Z"

/** Annotation the ad injection engine puts on a candidate it is about to inject; no other code uses it. */
private const val AD_POD_KEY = "Is ad pod"

/**
 * Reels and Stories ads are not part of the feed response: ad candidates are prefetched into a pool and
 * one injection engine decides, per attempt, whether to insert the next one into the viewer. The feed,
 * Explore and the contextual feeds build the same engine, so the engine is the single place that covers
 * every client-side insertion.
 *
 * The engine's decision method returns whether the candidate was injected, and its callers already handle
 * `false` as a rejection. Every path that notifies the viewer of an inserted ad runs this decision first,
 * so returning `false` at the top of it keeps the ad out without touching the viewer's own state. The
 * candidate stays pooled (the engine's own rejections drop it), which costs one cheap retry per attempt.
 *
 * The decision method is the only boolean method that writes the `Is ad pod` annotation. Its owner and
 * parameters move between releases, which is why it is matched by that string and its return type.
 */
@Suppress("unused")
val hideReelsAndStoriesAdsPatch =
    bytecodePatch(
        name = "Hide reels and stories ads",
        description =
            "Stops Instagram from inserting ads into Reels and Stories. The same ad injector also " +
                "feeds Explore and the contextual feeds, so they stay ad-free too.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(sharedExtensionPatch)

        instagramToggle(
            id = "instagram.ads.hide_reels_and_stories",
            category = Categories.ADS,
            strings = settingStrings("piko_ig_hide_reels_and_stories_ads"),
            order = 200,
            defaultValue = true,
        )

        execute {
            blockAdInjection()
        }
    }

context(patchContext: BytecodePatchContext)
private fun blockAdInjection() {
    val decision =
        requireExactlyOne(
            "ad injection decision method",
            Fingerprint(
                returnType = "Z",
                filters = listOf(string(AD_POD_KEY)),
            ).matchAll(),
            describe = { match -> match.originalMethod.toString() },
        )

    // The hook is read on every attempt, so the toggle applies without restarting the viewer.
    decision.method.insertHook(index = 0, relocateBranchTargets = true) {
        val value = scratchRegister()
        invokeStatic(methodReference(HIDE_REELS_AND_STORIES_ADS))
        moveResult(value, "Z")
        ifEqz(value, Target.Original)
        constInt(value, 0)
        returnValue(value)
    }
}
