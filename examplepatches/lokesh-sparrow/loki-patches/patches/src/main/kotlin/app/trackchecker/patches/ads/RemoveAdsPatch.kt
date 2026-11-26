/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.trackchecker.patches.ads

import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.trackchecker.patches.menu.trackCheckerMenuRowPatch
import app.trackchecker.patches.shared.Constants.COMPATIBILITY_TRACKCHECKER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val YANDEX_BANNER = "Lcom/yandex/mobile/ads/banner/BannerAdView;"

/**
 * "Should the banner be shown today?" The app already lets you close the ads for the rest of the day: it stores
 * the day in "ads_last_closed" and answers false until midnight. Both screens with a banner, and the main
 * screen's refresh, ask this before they build the ad container.
 */
private val showAdsToday = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("ads_last_closed"),
)

/**
 * Loads an ad into a banner view that already exists: attaches the listener and posts the load. It has no
 * strings, so it is found by what it does - it hands a Yandex banner its event listener.
 */
private val loadBanner = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/view/View;", "L"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == YANDEX_BANNER && ref.name == "setBannerAdEventListener"
        } == true
    },
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads (TrackChecker)",
    description = "Removes the banner ad in TrackChecker. The app has no paid version, so the ads are its only extra.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRACKCHECKER)
    dependsOn(menuFlagPatch("app.loki.menu.hideads"))
    dependsOn(trackCheckerMenuRowPatch)

    execute {
        showAdsToday.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        loadBanner.method.addInstructions(0, "return-void")
    }
}
