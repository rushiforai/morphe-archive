/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.google.protobuf.MessageLite;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.PlaylistTrackTapPatch.TapAction;
import app.morphe.extension.music.patches.downloads.RowEndIndicators;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

/** Header-only interaction and occurrence-only queue decoration. Never rewrites a native command or listener tap. */
@SuppressWarnings("unused")
public final class SmartShuffleUi {
    private static final Map<ViewGroup, Header> headers = new WeakHashMap<>();
    private static final Map<View, Row> rows = new WeakHashMap<>();
    private static final Rect visibleHeaderBounds = new Rect();
    private static WeakReference<ViewGroup> activeHeader = new WeakReference<>(null);
    private static long touchAt;
    private static boolean headerVisible;
    private static boolean songRow;
    private static boolean shuffled;
    private static String touchedPlaylist;
    private static String accountIdentity;
    private static String accountPage;
    private static boolean incognito;

    private static final class Header {
        String playlistId;
        SmartShuffleTrigger.Labels labels;
        WeakReference<View> shuffle = new WeakReference<>(null);
        final Sparkle sparkle = new Sparkle();
        final View.OnLongClickListener toggle = view -> {
            boolean before = SmartShuffleManager.isEnabled();
            SmartShuffleManager.setEnabled(!before);
            refresh();
            Logger.printDebug(() -> "Smart Shuffle long-click before=" + before
                    + " after=" + SmartShuffleManager.isEnabled());
            return true;
        };
    }

    private static final class Row {
        long occurrenceId;
        WeakReference<TextView> badge = new WeakReference<>(null);
    }

    private SmartShuffleUi() {}

    public static void onHeaderBound(ViewGroup container, Object model) {
        try {
            Header previous = headers.get(container);
            String playlistId = null;
            SmartShuffleTrigger.Labels labels = null;
            if (model instanceof MessageLite lite) {
                byte[] bytes = lite.toByteArray();
                playlistId = SmartShuffleTrigger.headerPlaylist(bytes);
                labels = SmartShuffleTrigger.labels(bytes);
            }
            if (previous == null) {
                previous = new Header();
                headers.put(container, previous);
                WeakReference<ViewGroup> weak = new WeakReference<>(container);
                container.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                    ViewGroup host = weak.get();
                    if (host != null) paintHeader(host, headers.get(host));
                });
            }
            ViewGroup active = activeHeader.get();
            Header activeState = active == null ? null : headers.get(active);
            if (activeState != null && !Objects.equals(activeState.playlistId, playlistId)) {
                SmartShuffleManager.cancel();
            }
            previous.playlistId = playlistId;
            previous.labels = labels;
            activeHeader = new WeakReference<>(container);
            paintHeader(container, previous);
        } catch (Exception exception) {
            Logger.printException(() -> "Could not bind Smart Shuffle header", exception);
        }
    }

    private static void paintHeader(ViewGroup host, Header state) {
        if (state == null) return;
        View old = state.shuffle.get();
        View button = state.playlistId == null || state.labels == null ? null
                : findLabel(host, state.labels.shuffleOff(), state.labels.shuffleOn());
        if (old != button) {
            if (old != null) {
                old.getOverlay().remove(state.sparkle);
                old.setOnLongClickListener(null);
            }
            state.shuffle = new WeakReference<>(button);
        }
        if (button == null) return;
        button.setOnLongClickListener(state.toggle);
        boolean enabled = SmartShuffleManager.isEnabled();
        button.setTooltipText(str(enabled ? "morphe_smart_shuffle_on" : "morphe_smart_shuffle_off"));
        if (Build.VERSION.SDK_INT >= 30) {
            button.setStateDescription(str(enabled ? "morphe_smart_shuffle_on" : "morphe_smart_shuffle_off"));
        }
        int size = dp(button, 12);
        state.sparkle.setBounds(button.getWidth() - size, 0, button.getWidth(), size);
        if (enabled) button.getOverlay().add(state.sparkle);
        else button.getOverlay().remove(state.sparkle);
    }

    static boolean refreshHeaderOnTouch(int action) {
        return action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_UP;
    }

    /** Runs before Activity dispatch, so activation precedes the accepted native start command. */
    public static void onTouch(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_CANCEL) clearTouch();
        if (!refreshHeaderOnTouch(action)) return;
        ViewGroup host = activeHeader.get();
        Header state = host == null ? null : headers.get(host);
        if (state == null || state.labels == null || state.playlistId == null || !host.isAttachedToWindow()) return;
        paintHeader(host, state);
        // Native button rebinding clears/replaces long-click listeners without a header layout.
        // Restore ours before DOWN reaches the button and schedules its long press, not only after UP.
        if (action != MotionEvent.ACTION_UP) return;
        View shuffle = state.shuffle.get();
        shuffled = shuffle != null && state.labels.shuffleOn() != null
                && state.labels.shuffleOn().contentEquals(shuffle.getContentDescription() == null
                        ? "" : shuffle.getContentDescription());
        headerVisible = host.isShown() && host.getGlobalVisibleRect(visibleHeaderBounds);
        songRow = !hit(host, event) && hitPlaylistRow(host.getRootView(), event);
        touchedPlaylist = state.playlistId;
        touchAt = SystemClock.elapsedRealtime();
    }

    private static void clearTouch() {
        touchAt = 0;
        headerVisible = false;
        songRow = false;
        touchedPlaylist = null;
    }

    public static void onCommand(Object command) {
        long age = SystemClock.elapsedRealtime() - touchAt;
        boolean recentUserCommand = touchAt != 0 && age >= 0 && age <= 500;
        if (!recentUserCommand || !(command instanceof MessageLite lite)) return;
        SmartShuffleTrigger.Start start = SmartShuffleTrigger.command(lite.toByteArray());
        // Respect the fork's explicit single-song / append override instead of arming for a rewritten command.
        boolean playlistStart = start != null && (start.kind() == SmartShuffleTrigger.Kind.PLAYLIST
                || Settings.PLAYLIST_TRACK_TAP_ACTION.get() == TapAction.DEFAULT);
        if (playlistStart && SmartShuffleTrigger.accepts(start, touchedPlaylist, headerVisible, songRow,
                shuffled, SmartShuffleManager.isEnabled(), recentUserCommand)) {
            String playlistId = start.playlistId();
            String trigger = start.kind() == SmartShuffleTrigger.Kind.PLAYLIST ? "header-play" : "playlist-song";
            clearTouch();
            SmartShuffleManager.activate(playlistId, trigger);
        }
    }

    /** Actual account/page identity, never the rotating Authorization token. */
    public static synchronized void onAccountIdentity(String accountId, String pageId, boolean newIncognito) {
        String identity = accountId == null ? "" : accountId;
        String page = pageId == null ? "" : pageId;
        if (accountIdentity != null && (!identity.equals(accountIdentity)
                || !page.equals(accountPage) || incognito != newIncognito)) {
            clearTouch();
            SmartShuffleManager.onAccountChanged();
        }
        accountIdentity = identity;
        accountPage = page;
        incognito = newIncognito;
    }

    public static void onQueueRowBound(View view, Object nativeItem) {
        Row row = rows.get(view);
        if (row == null) {
            row = new Row();
            rows.put(view, row);
        }
        row.occurrenceId = SmartShuffleNative.occurrenceId(nativeItem);
        paintRow(view, row);
    }

    private static void paintRow(View view, Row row) {
        boolean suggested = row.occurrenceId != Long.MIN_VALUE && SmartShuffleManager.isSuggested(row.occurrenceId);
        TextView badge = row.badge.get();
        if (badge == null && suggested) {
            badge = new TextView(view.getContext());
            badge.setText("✦");
            badge.setTextColor(0xFFFFC857);
            badge.setTextSize(22);
            badge.setGravity(Gravity.CENTER);
            badge.setContentDescription(str("morphe_smart_shuffle_suggested"));
            badge.setFocusable(true);
            if (!RowEndIndicators.add(view, badge, 40)) return;
            row.badge = new WeakReference<>(badge);
            Row bound = row;
            badge.setOnClickListener(clicked -> showActions(clicked, bound));
        }
        if (badge != null) RowEndIndicators.visibility(badge, suggested);
    }

    private static void showActions(View view, Row row) {
        long occurrenceId = row.occurrenceId;
        if (!SmartShuffleManager.isSuggested(occurrenceId)) return;
        new AlertDialog.Builder(view.getContext())
                .setTitle(str("morphe_smart_shuffle_suggested"))
                .setItems(new String[]{str("morphe_smart_shuffle_keep"), str("morphe_smart_shuffle_dismiss")},
                        (dialog, which) -> {
                            if (which == 0) SmartShuffleManager.keep(occurrenceId);
                            else SmartShuffleManager.dismiss(occurrenceId);
                        })
                .show();
    }

    public static void refresh() {
        Utils.runOnMainThread(() -> {
            for (Map.Entry<ViewGroup, Header> entry : headers.entrySet()) paintHeader(entry.getKey(), entry.getValue());
            for (Map.Entry<View, Row> entry : rows.entrySet()) paintRow(entry.getKey(), entry.getValue());
        });
    }

    private static View findLabel(View view, String first, String second) {
        if (first == null || second == null) return null;
        CharSequence description = view.getContentDescription();
        if (view.isClickable() && (first.contentEquals(description == null ? "" : description)
                || second.contentEquals(description == null ? "" : description))) return view;
        if (view instanceof ViewGroup group) {
            for (int index = 0; index < group.getChildCount(); index++) {
                View found = findLabel(group.getChildAt(index), first, second);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean hit(View view, MotionEvent event) {
        Rect bounds = new Rect();
        return view != null && view.getGlobalVisibleRect(bounds)
                && bounds.contains((int) event.getRawX(), (int) event.getRawY());
    }

    private static boolean hitPlaylistRow(View view, MotionEvent event) {
        if (!hit(view, event) || !(view instanceof ViewGroup group)) return false;
        int menuId = ResourceUtils.getIdIdentifier("contextual_menu_container");
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (menuId != 0 && child.getId() == menuId) return true;
            if (hitPlaylistRow(child, event)) return true;
        }
        return false;
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }

    private static final class Sparkle extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        Sparkle() { paint.setColor(0xFFFFC857); }

        @Override protected void onBoundsChange(Rect bounds) {
            float centerX = bounds.exactCenterX();
            float centerY = bounds.exactCenterY();
            float radius = bounds.width() / 2f;
            path.reset();
            for (int point = 0; point < 8; point++) {
                double angle = point * Math.PI / 4 - Math.PI / 2;
                float length = point % 2 == 0 ? radius : radius / 3;
                float x = centerX + (float) Math.cos(angle) * length;
                float y = centerY + (float) Math.sin(angle) * length;
                if (point == 0) path.moveTo(x, y); else path.lineTo(x, y);
            }
            path.close();
        }

        @Override public void draw(Canvas canvas) {
            canvas.drawPath(path, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
