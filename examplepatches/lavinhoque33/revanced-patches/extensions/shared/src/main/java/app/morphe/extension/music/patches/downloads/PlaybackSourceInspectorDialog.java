/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.utils.ExtendedUtils.getDialogBuilder;
import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction;
import android.widget.ImageView;

import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Snapshot;
import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Source;
import app.morphe.extension.music.settings.ActivityHook;

public final class PlaybackSourceInspectorDialog {
    private static final String TITLE = "morphe_music_playback_source_inspector_title";

    private static final View.AccessibilityDelegate MENU_ACCESSIBILITY = new View.AccessibilityDelegate() {
        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            if (info.removeAction(AccessibilityAction.ACTION_LONG_CLICK)) {
                info.addAction(new AccessibilityAction(AccessibilityAction.ACTION_LONG_CLICK.getId(), str(TITLE)));
            }
        }
    };

    private PlaybackSourceInspectorDialog() {}

    /** Enabled only when the expanded player's own menu binding was resolved. */
    public static boolean hasNowPlayingShortcut() {
        return false;
    }

    @SuppressWarnings("unused") // Native hook.
    public static void bindPlayerMenu(View view) {
        if (!(view instanceof ImageView menu) || menu.isLongClickable()
                || (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && menu.hasOnLongClickListeners())) return;

        menu.setOnLongClickListener(anchor -> anchor.isShown() && show(anchor.getContext()));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && menu.getAccessibilityDelegate() == null) {
            menu.setAccessibilityDelegate(MENU_ACCESSIBILITY);
        }
    }

    public static boolean show(Context context) {
        while (!(context instanceof Activity) && context instanceof ContextWrapper wrapper) {
            context = wrapper.getBaseContext();
        }

        Activity activity = context instanceof Activity host ? host : ActivityHook.getActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;

        String messageText = snapshotMessage();
        AlertDialog dialog = getDialogBuilder(activity)
                .setTitle(str(TITLE))
                .setMessage(messageText)
                .setNeutralButton(str("morphe_music_playback_source_inspector_refresh"), null)
                .setPositiveButton(str("morphe_music_playback_source_inspector_close"), null)
                .show();

        View message = dialog.findViewById(android.R.id.message);
        if (message != null) message.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(
                button -> dialog.setMessage(snapshotMessage()));
        return true;
    }

    private static String snapshotMessage() {
        Snapshot snapshot = PlaybackSourceInspector.snapshot();
        StringBuilder message = new StringBuilder(str("morphe_music_playback_source_inspector_snapshot"));

        appendTrack(message, "morphe_music_playback_source_inspector_audio", snapshot.audio(),
                "morphe_music_playback_source_inspector_audio_format", snapshot.audioItag());
        appendTrack(message, "morphe_music_playback_source_inspector_video", snapshot.video(),
                "morphe_music_playback_source_inspector_video_format", snapshot.videoItag());
        return message.toString();
    }

    private static void appendTrack(StringBuilder message, String sourceKey, Source source, String formatKey,
                                    int itag) {
        String sourceLabel = str(switch (source) {
            case CACHED_AUDIO -> "morphe_music_playback_source_inspector_cached_audio";
            case CACHED_VIDEO_AUDIO -> "morphe_music_playback_source_inspector_cached_video_audio";
            case CACHED_VIDEO -> "morphe_music_playback_source_inspector_cached_video";
            case UNCONFIRMED -> "morphe_music_playback_source_inspector_unconfirmed";
        });

        message.append("\n\n").append(str(sourceKey, sourceLabel));
        if (itag >= 0) message.append('\n').append(str(formatKey, itag));
    }
}
