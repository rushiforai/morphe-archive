/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Supplier;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;

/**
 * The green check on the Download button of a downloaded playlist or album page.
 * The header is a server-driven Elements (Litho) view, so its button cannot be restyled; instead a check view of
 * our own is laid over the header container, at the corner of the button's icon. The button is found by its label
 * (the content description the header gives it) and the check follows it on every layout. A button that is not
 * recognised by its label gets no check: a guess by size could put the check on another button.
 *
 * <p>A downloaded header also lays a transparent tap view of our own over the whole button: its tap is the Remove
 * download of the list, so it never depends on the command the app sends for a button it believes is a plain Download.
 */
final class DownloadedHeaders {
    private static final String DOWNLOAD_LABEL = "Download";
    /** The app's own strings for "Download" (playlist, songs, confirmation), in the language the app shows. */
    private static final String[] DOWNLOAD_LABEL_RESOURCES = {
            "action_add_playlist_to_offline", "action_add_to_offline_songs", "confirm_download"};
    private static final int BADGE_DP = 18;
    private static final int BADGE_PADDING_DP = 1;
    private static final int BADGE_OFFSET_DP = 11;
    private static final int MAX_DEPTH = 12;
    private static final int MAX_VIEWS = 400;

    /** Per header container; holds only weak references to views. */
    static final class State {
        List<String> sourceIds = Collections.emptyList();
        WeakReference<View> host = new WeakReference<>(null);
        WeakReference<DownloadedCheck> badge = new WeakReference<>(null);
        WeakReference<View> removeTap = new WeakReference<>(null);
        /** The downloaded list the tap view removes; read when it is tapped. */
        volatile String removeSource;
        boolean listening;
        boolean applyQueued;
        String lastLogged = "";
        final DownloadedAlbumRows.State albumRows = new DownloadedAlbumRows.State();
    }

    private DownloadedHeaders() {}

    static void apply(ViewGroup container, State state) {
        listenForLayouts(container, state);
        // The track rows of the page are looked at from its header: the header is what names the album.
        DownloadedAlbumRows.apply(container, state.albumRows, state.sourceIds);

        DownloadedCheck badge = state.badge.get();
        String downloadedSource = downloadedSource(state);
        if (downloadedSource == null) {
            if (badge != null) badge.setShown(false);
            hideRemoveTap(state);
            logOnChange(state, () -> "not downloaded");
            return;
        }

        View button = downloadButton(container, state, badge);
        if (button == null) {
            if (badge != null) badge.setShown(false);
            hideRemoveTap(state);
            logOnChange(state, () -> "downloaded but no button labelled " + downloadLabels()
                    + " in the header (collapsed, not laid out, or another language): no check");
            return;
        }

        if (badge == null || badge.getParent() != container) {
            badge = DownloadedCheck.create(container.getContext(), true);
            if (badge == null) return;

            int size = DownloadedCheck.dp(BADGE_DP);
            int padding = DownloadedCheck.dp(BADGE_PADDING_DP);
            badge.setPadding(padding, padding, padding, padding);
            container.addView(badge, new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.LEFT));
            state.badge = new WeakReference<>(badge);
        }
        badge.restyle();
        if (container.indexOfChild(badge) != container.getChildCount() - 1) badge.bringToFront();
        place(container, button, badge);
        badge.setShown(true);
        placeRemoveTap(container, button, badge, state, downloadedSource);
        logOnChange(state, () -> "check shown at " + button.getClass().getSimpleName()
                + " " + button.getWidth() + "x" + button.getHeight() + ", tap removes " + downloadedSource);
    }

    /** The first list of the header that is saved whole as stream copies, or null when there is none. */
    @Nullable
    private static String downloadedSource(State state) {
        if (!DownloadedMarkers.enabled()) return null;

        for (String sourceId : state.sourceIds) {
            if (DownloadedMarkers.isSourceDownloaded(sourceId)) return sourceId;
        }
        return null;
    }

    private static void hideRemoveTap(State state) {
        View tap = state.removeTap.get();
        if (tap != null && tap.getVisibility() != View.GONE) tap.setVisibility(View.GONE);
        state.removeSource = null;
    }

    /** Lays the tap view over the button, below the check, and points it at the list the header names. */
    private static void placeRemoveTap(ViewGroup container, View button, DownloadedCheck badge, State state,
                                       String sourceId) {
        View tap = state.removeTap.get();
        if (tap == null || tap.getParent() != container) {
            tap = new View(container.getContext());
            tap.setContentDescription(str("morphe_music_remove_download"));
            tap.setOnClickListener(view -> {
                String source = state.removeSource;
                if (source != null) PlaylistDownloads.onDownloadButton(source);
            });
            container.addView(tap, new FrameLayout.LayoutParams(button.getWidth(), button.getHeight(),
                    Gravity.TOP | Gravity.LEFT));
            state.removeTap = new WeakReference<>(tap);
        }
        state.removeSource = sourceId;

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) tap.getLayoutParams();
        if (params.width != button.getWidth() || params.height != button.getHeight()) {
            params.width = button.getWidth();
            params.height = button.getHeight();
            tap.setLayoutParams(params);
        }
        int[] buttonAt = new int[2];
        int[] containerAt = new int[2];
        button.getLocationInWindow(buttonAt);
        container.getLocationInWindow(containerAt);
        tap.setTranslationX(buttonAt[0] - containerAt[0]);
        tap.setTranslationY(buttonAt[1] - containerAt[1]);
        tap.setVisibility(View.VISIBLE);

        // The tap view sits under the check, which stays on top of the row.
        tap.bringToFront();
        badge.bringToFront();
    }

    /** One line per change of what the header shows, never one per bind or layout. */
    private static void logOnChange(State state, Supplier<String> result) {
        if (!BaseSettings.DEBUG.get()) return;

        String line = "Header sources=" + state.sourceIds + ": " + result.get();
        if (line.equals(state.lastLogged)) return;

        state.lastLogged = line;
        Logger.printDebug(() -> line);
    }

    /** The header lays its content out after it was bound, so the check is re-placed after every layout. */
    private static void listenForLayouts(ViewGroup container, State state) {
        if (state.listening) return;

        state.listening = true;
        container.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            if (state.sourceIds.isEmpty() && state.badge.get() == null || state.applyQueued) return;

            state.applyQueued = true;
            container.post(() -> {
                state.applyQueued = false;
                try {
                    apply(container, state);
                } catch (Exception ex) {
                    Logger.printException(() -> "Could not place the downloaded check", ex);
                }
            });
        });
    }

    private static void place(ViewGroup container, View button, DownloadedCheck badge) {
        int[] buttonAt = new int[2];
        int[] containerAt = new int[2];
        button.getLocationInWindow(buttonAt);
        container.getLocationInWindow(containerAt);

        int offset = DownloadedCheck.dp(BADGE_OFFSET_DP);
        boolean rightToLeft = container.getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
        float centerX = buttonAt[0] - containerAt[0] + button.getWidth() / 2f + (rightToLeft ? -offset : offset);
        float centerY = buttonAt[1] - containerAt[1] + button.getHeight() / 2f + offset;
        float x = centerX - badge.getLayoutParams().width / 2f;
        float y = centerY - badge.getLayoutParams().height / 2f;
        if (badge.getTranslationX() != x) badge.setTranslationX(x);
        if (badge.getTranslationY() != y) badge.setTranslationY(y);
    }

    @Nullable
    private static View downloadButton(ViewGroup container, State state, @Nullable DownloadedCheck badge) {
        View cached = state.host.get();
        if (cached != null && cached.isAttachedToWindow() && cached.getWidth() > 0 && isInside(cached, container)) {
            return cached;
        }

        View[] labeled = new View[1];
        scan(container, badge, downloadLabels(), labeled, new int[]{MAX_VIEWS}, 0);
        state.host = new WeakReference<>(labeled[0]);
        return labeled[0];
    }

    private static boolean isInside(View view, ViewGroup container) {
        ViewParent parent = view.getParent();
        while (parent != null) {
            if (parent == container) return true;
            parent = parent.getParent();
        }
        return false;
    }

    private static void scan(ViewGroup parent, @Nullable View ignored, List<String> labels, View[] labeled,
                             int[] budget, int depth) {
        for (int index = 0; index < parent.getChildCount() && labeled[0] == null; index++) {
            View child = parent.getChildAt(index);
            if (child == ignored || --budget[0] < 0) continue;
            if (!(child instanceof ViewGroup group)) continue;

            if (child.isClickable() && child.getWidth() > 0 && isDownloadLabel(child.getContentDescription(), labels)) {
                labeled[0] = child;
            }
            if (depth < MAX_DEPTH) scan(group, ignored, labels, labeled, budget, depth + 1);
        }
    }

    /** Whether a content description is one of the labels of the Download button, ignoring case and spacing. */
    static boolean isDownloadLabel(@Nullable CharSequence description, List<String> labels) {
        if (description == null) return false;

        String text = description.toString().trim();
        for (String label : labels) {
            if (label.equalsIgnoreCase(text)) return true;
        }
        return false;
    }

    private static volatile List<String> downloadLabels;

    /** The English label and the app's own "Download" strings in the language it shows; resolved once. */
    private static List<String> downloadLabels() {
        List<String> labels = downloadLabels;
        if (labels != null) return labels;

        List<String> found = new ArrayList<>();
        found.add(DOWNLOAD_LABEL);
        for (String name : DOWNLOAD_LABEL_RESOURCES) {
            try {
                int id = ResourceUtils.getStringIdentifier(name);
                String text = id == 0 ? null : ResourceUtils.getActivityOrContext().getString(id).trim();
                if (text != null && !text.isEmpty() && !found.contains(text)) found.add(text);
            } catch (RuntimeException unavailable) {
                // The string does not exist in this version.
            }
        }
        downloadLabels = Collections.unmodifiableList(found);
        return downloadLabels;
    }
}
