/* SPDX-License-Identifier: GPL-3.0-only. Community add-on, not an official Morphe release. */
package io.github.kljjh.flymelyrics;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.service.notification.StatusBarNotification;
import android.util.Log;

import java.lang.reflect.Field;
import java.util.Objects;

/** Receives official media events and the already formatted mini-player text. */
public final class FlymeLyrics {
    private static final String OWNER = "community.flymelyrics.owned";
    private static final String ADDED_NO_CLEAR = "community.flymelyrics.added_no_clear";
    private static final int SHOW = readFlag("FLAG_ALWAYS_SHOW_TICKER");
    private static final int UPDATE = readFlag("FLAG_ONLY_UPDATE_TICKER");
    private static boolean loggedFailure;
    private static boolean playing;
    private static boolean metadataValid;
    private static MediaSession.Token lastToken;
    private static String lastTitle;
    private static String lastArtist;

    private FlymeLyrics() { }

    private static int readFlag(String name) {
        try {
            Field field = Notification.class.getDeclaredField(name);
            field.setAccessible(true);
            return field.getInt(null);
        } catch (Exception | LinkageError unsupported) {
            return 0;
        }
    }

    public static synchronized void onMetadata(Context context, MediaSession session, MediaMetadata metadata) {
        if (session == null || metadata == null) {
            metadataValid = false;
            clear(context);
            return;
        }
        try {
            MediaSession.Token token = session.getSessionToken();
            String title = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
            String artist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
            if (!Objects.equals(token, lastToken) || !Objects.equals(title, lastTitle)
                    || !Objects.equals(artist, lastArtist)) {
                clear(context);
            }
            lastToken = token;
            lastTitle = title;
            lastArtist = artist;
            metadataValid = true;
        } catch (Exception | LinkageError error) {
            metadataValid = false;
            clear(context);
            report(error);
        }
    }

    public static synchronized void onPlaybackState(Context context, PlaybackState state) {
        playing = state != null && state.getState() == PlaybackState.STATE_PLAYING;
        if (!playing) clear(context);
    }

    /** Runs after the official mini-player matching checks and receives its current line. */
    public static synchronized void onLine(Context context, MediaSession session, String text) {
        if (!playing || !metadataValid
            || session == null || !session.getSessionToken().equals(lastToken)
                || text == null || text.trim().isEmpty()) {
            clear(context);
            return;
        }
        publish(context, session, text);
    }

    public static synchronized void clear(Context context) {
        publish(context, null, null);
    }

    private static void publish(Context context, MediaSession session, String text) {
        if (SHOW <= 0 || UPDATE <= 0 || context == null) return;
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) return;
            for (StatusBarNotification entry : manager.getActiveNotifications()) {
                Notification original = entry.getNotification();
                if (original.extras == null) continue;
                boolean owned = original.extras.getBoolean(OWNER, false);
                MediaSession.Token token = original.extras.getParcelable(Notification.EXTRA_MEDIA_SESSION);
                boolean show = session != null && session.getSessionToken().equals(token) && text != null;
                if (!show && !owned) continue;
                int flags = SHOW | UPDATE | Notification.FLAG_NO_CLEAR;
                if (show && owned && Objects.equals(text, original.tickerText == null ? null : original.tickerText.toString())
                        && (original.flags & flags) == flags) continue;

                Notification changed = original.clone();
                if (show) {
                    if (!owned) changed.extras.putBoolean(ADDED_NO_CLEAR, (original.flags & Notification.FLAG_NO_CLEAR) == 0);
                    changed.extras.putBoolean(OWNER, true);
                    changed.tickerText = text;
                    changed.flags |= flags;
                } else {
                    changed.tickerText = null;
                    changed.flags &= ~(SHOW | UPDATE);
                    if (changed.extras.getBoolean(ADDED_NO_CLEAR, false)) changed.flags &= ~Notification.FLAG_NO_CLEAR;
                    changed.extras.remove(OWNER);
                    changed.extras.remove(ADDED_NO_CLEAR);
                }
                changed.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
                manager.notify(entry.getTag(), entry.getId(), changed);
            }
        } catch (Exception | LinkageError error) {
            report(error);
        }
    }

    private static void report(Throwable error) {
        if (!loggedFailure) {
            loggedFailure = true;
            Log.w("FlymeLyrics", "Status bar notification update unavailable", error);
        }
    }
}
