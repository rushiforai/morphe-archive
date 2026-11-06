/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.returnEarlyWhen
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch

private const val PATCH = "Hide the Save button"
internal const val HIDE_SAVE_HOOK = "$POST_FOOTER->hideSaveButton()Z"

/**
 * Puts `PostFooter.hideSaveButton` first in the function that draws the footer's Save button, the
 * button that saves a post for later, and returns at once while the switch is on, so the footer is
 * drawn without it. Compose expects a footer to draw the same buttons each time, so the extension
 * keeps its first answer until Tumblr restarts.
 *
 * The function is the one whose source note starts with [FOOTER_CONTROLS] and [SAVE_CONTROL]
 * (`qvg.d` in 46.5.0.109, drawing `ic_dashboard_post_control_save` with `alt_text_save_btn`). The
 * footer calls it only when the post's state has a Save button, which Tumblr builds only while its
 * `POST_STASH` flag is on (`oji.f`), so with the flag off the hook is never asked. 47.0.0.108's
 * check (`t4k.f`) also wants `POST_STASH_WRITE` and a published post; with both flags forced on in
 * Tumblr's saved feature config the button shows, and the hook takes it out with no gap (emulator,
 * 2026-11-05). Community posts' own footer has no Save button. Found by reading Tumblr 46.5.0.109
 * (2026-10-11).
 */
@Suppress("unused")
val hideSaveButtonPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the Save button out of the footer under posts in your dashboard and other feeds, when" +
        " Tumblr shows one. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideSaveButton")
        requireStatusMethod("saveButton")
        // Found and checked before the edit, so a refusal leaves the APK as it was.
        val button = resolveFooterButton(PATCH, SAVE_CONTROL, HIDE_SAVE_HOOK)
        button.returnEarlyWhen(PATCH, HIDE_SAVE_HOOK, "return-void")
        enableCapability("saveButton")
        enableStatus("hideSaveButton")
    }
}
