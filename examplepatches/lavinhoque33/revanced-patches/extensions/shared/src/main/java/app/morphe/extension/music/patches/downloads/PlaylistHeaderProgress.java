/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-18.
 */
package app.morphe.extension.music.patches.downloads;

import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.List;

/** Reserves a real footer inside the native wrap-content Elements header, outside the stock tap targets. */
final class PlaylistHeaderProgress {
    private WeakReference<View> elements = new WeakReference<>(null);
    private WeakReference<Button> row = new WeakReference<>(null);
    private int reservedHeight;
    @Nullable private String resumeSource;
    @Nullable private PlaylistTransfer.Progress shownProgress;
    private boolean shownResume;

    void bind(ViewGroup container, List<String> sources) {
        hide(container);
        // The native presenter just appended its Elements view. Our old row is not a native child.
        View child = sources.isEmpty() ? null : container.getChildAt(container.getChildCount() - 1);
        elements = new WeakReference<>(child);
    }

    void apply(ViewGroup container, List<String> sources) {
        View child = elements.get();
        if (!(container instanceof FrameLayout) || child == null || child.getParent() != container
                || !(child.getLayoutParams() instanceof FrameLayout.LayoutParams params)) {
            hide(container);
            return;
        }

        for (String id : sources) {
            if (!PlaylistDownloads.showsStreamProgress(id)) continue;

            PlaylistTransfer.Progress progress = DownloadedMarkers.playlistProgress(id);
            boolean running = PlaylistDownloads.isRunning(id);
            if (progress != null || running) {
                show(container, child, params, id, progress, running);
                return;
            }
        }
        hide(container);
    }

    private void show(ViewGroup container, View child, FrameLayout.LayoutParams params, String sourceId,
                      @Nullable PlaylistTransfer.Progress progress, boolean running) {
        Button view = row.get();
        if (view == null || view.getParent() != container) {
            view = createRow(container);
            row = new WeakReference<>(view);
            shownProgress = null;
            shownResume = false;
        }

        boolean resume = !running && progress != null;
        resumeSource = resume ? sourceId : null;
        if (view.isClickable() != resume) {
            view.setClickable(resume);
            view.setFocusable(resume);
        }
        if (!java.util.Objects.equals(shownProgress, progress) || shownResume != resume || view.length() == 0) {
            String text = progress == null
                    ? app.morphe.extension.shared.utils.StringRef.str("morphe_music_downloads_starting")
                    : PlaylistDownloads.progressText(progress, resume);
            if (!TextUtils.equals(view.getText(), text)) view.setText(text);
            shownProgress = progress;
            shownResume = resume;
        }

        int height = view.getMeasuredHeight();
        if (height > 0 && height != reservedHeight) {
            params.bottomMargin += height - reservedHeight;
            reservedHeight = height;
            child.setLayoutParams(params);
        }
        // In the initial measure (or a reflow), never expose a row that has not yet moved clear of Elements.
        int visibility = reservedHeight > 0 && view.getTop() >= child.getBottom() ? View.VISIBLE : View.INVISIBLE;
        if (view.getVisibility() != visibility) view.setVisibility(visibility);
    }

    private Button createRow(ViewGroup container) {
        Button view = new Button(container.getContext(), null, android.R.attr.borderlessButtonStyle);
        int inset = DownloadedCheck.dp(12);
        view.setPaddingRelative(inset, 0, inset, 0);
        view.setMinimumHeight(DownloadedCheck.dp(48));
        view.setAllCaps(false);
        view.setGravity(Gravity.CENTER);
        view.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        view.setVisibility(View.INVISIBLE);
        view.setOnClickListener(ignored -> {
            String source = resumeSource;
            if (source != null) PlaylistDownloads.resume(source);
        });
        container.addView(view, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL));
        return view;
    }

    private void hide(ViewGroup container) {
        resumeSource = null;
        if (reservedHeight != 0) {
            View child = elements.get();
            if (child != null && child.getParent() == container
                    && child.getLayoutParams() instanceof FrameLayout.LayoutParams params) {
                params.bottomMargin -= reservedHeight;
                child.setLayoutParams(params);
            }
            reservedHeight = 0;
        }

        Button view = row.get();
        if (view != null && view.getParent() == container) container.removeView(view);
    }
}
