/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.view.View;
import android.view.ViewParent;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.HushTumblrPreferenceFragment;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.ScreenColors;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Share video links. A video in a post plays in a container Tumblr fills with a player for each
 * video it binds, and the player's controls hold a long-press listener whose callback is empty, so
 * a long press on a video did nothing. The patch hands each container its video's address here as
 * the player is built, and runs the controls' listener through here, so a long press on a video
 * with an address offers to share or copy it. Anything else long-pressed is Tumblr's.
 */
public final class VideoLinks {
    /** Each video container and the address of the video it plays. Views drop out when they're gone. */
    private static final Map<View, String> ADDRESSES = new WeakHashMap<>();

    private VideoLinks() {}

    /** Remembers the video a container is about to play, or forgets the one it played. */
    public static void bind(View container, String address) {
        try {
            if (container == null || !PatchFamily.Capability.VIDEO_LINK_PRESS.installed()) return;
            if (address == null || address.trim().isEmpty()) ADDRESSES.remove(container);
            else ADDRESSES.put(container, address.trim());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video address", failure);
        }
    }

    /** Stands in for the long-press listener Tumblr gives a video's controls. */
    public static View.OnLongClickListener press(View.OnLongClickListener tumblrs) {
        try {
            if (!PatchFamily.Capability.VIDEO_LINK_PRESS.installed()) return tumblrs;
            return pressed -> offer(pressed) || tumblrs != null && tumblrs.onLongClick(pressed);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "long press", failure);
            return tumblrs;
        }
    }

    /** Whether the long press opened the link menu. */
    static boolean offer(View pressed) {
        try {
            if (pressed == null || !on()) return false;
            String address = addressOf(pressed);
            if (address == null) return false;
            Context context = pressed.getContext();
            AlertDialog dialog = new AlertDialog.Builder(HushTumblrPreferenceFragment.themed(context))
                    .setItems(new CharSequence[] {L10n.t("Share video link"), L10n.t("Copy video link")},
                            (shown, which) -> {
                                if (which == 0) share(context, address);
                                else copy(context, address);
                            })
                    .create();
            dialog.show();
            ScreenColors.dialog(dialog);
            HookStatus.counted(FamilyNames.SHARE_VIDEO_LINKS, "link menu shown");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "link menu", failure);
            return false;
        }
    }

    /** The address of the video whose container holds the pressed view. */
    static String addressOf(View pressed) {
        View at = pressed;
        for (int depth = 0; at != null && depth < 32; depth++) {
            String address = ADDRESSES.get(at);
            if (address != null) return address;
            ViewParent parent = at.getParent();
            at = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    static void share(Context context, String address) {
        Intent send = new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, address);
        try {
            context.startActivity(Intent.createChooser(send, null));
        } catch (ActivityNotFoundException failure) {
            Utils.showToastShort(L10n.t("No app can share this link"));
        }
    }

    /** Copied in the open, unlike the shared helper's clips: a public link is what the preview should show. */
    static void copy(Context context, String address) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText(L10n.t("Video link"), address));
        // Android 13 and newer say so themselves.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) Utils.showToastShort(L10n.t("Video link copied"));
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.VIDEO_LINK_PRESS.installed()) return false;
        HookStatus.invoked(FamilyNames.SHARE_VIDEO_LINKS);
        return Settings.SHARE_VIDEO_LINKS.get();
    }
}
