/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.function.BooleanSupplier;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;
import app.hushtumblr.extension.shared.Utils;

/** A result belongs to its action, survives rebinds and never writes its text to diagnostics. */
final class SettingsFeedback {
    static final String REGION_TAG = "hushtumblr_action_feedback";
    static final String MESSAGE_TAG = "hushtumblr_feedback_message";
    static final String COPY_TAG = "hushtumblr_feedback_copy";
    private final Runnable changed;
    private WeakReference<LinearLayout> bound = new WeakReference<>(null);
    private BooleanSupplier alive = () -> false;
    private String message;
    private String address;
    /** A Copy link tap that failed. The instruction it came with stays, with this said under it. */
    private boolean copyFailed;
    private long revision;
    private long spokenRevision;

    SettingsFeedback() { this(() -> {}); }
    SettingsFeedback(Runnable changed) { this.changed = changed; }

    void show(String text) { show(text, null); }

    void show(String text, String rawAddress) {
        Utils.runOnMainThreadNowOrLater(() -> publish(text, rawAddress, false));
    }

    void clear() { show(null, null); }

    private void publish(String text, String rawAddress, boolean failedCopy) {
        message = text;
        address = rawAddress;
        copyFailed = failedCopy;
        revision++;
        render();
        changed.run();
    }

    /** Puts the result in [into] under [key], so a screen rebuilt by Android can show it again. */
    void save(Bundle into, String key) {
        if (message == null) return;
        Bundle state = new Bundle();
        state.putString("message", message);
        state.putString("address", address);
        state.putBoolean("copyFailed", copyFailed);
        into.putBundle(key, state);
    }

    /**
     * Shows a result saved by {@link #save}. It was announced when it first showed, so it isn't
     * again. A result this row got since is newer, and stays.
     */
    void restore(@Nullable Bundle from, String key) {
        Bundle state = from == null ? null : from.getBundle(key);
        if (state == null || message != null) return;
        message = state.getString("message");
        address = state.getString("address");
        copyFailed = state.getBoolean("copyFailed");
        revision++;
        spokenRevision = revision;
        render();
        changed.run();
    }

    @Nullable String message() { return message; }

    void bind(View row) {
        TextView summary = row.findViewById(android.R.id.summary);
        TextView title = row.findViewById(android.R.id.title);
        View anchor = summary != null && summary.getVisibility() == View.VISIBLE ? summary : title;
        if (anchor == null || !(anchor.getParent() instanceof ViewGroup)) return;
        ViewGroup column = (ViewGroup) anchor.getParent();
        View old = column.findViewWithTag(REGION_TAG);
        if (old != null) ((ViewGroup) old.getParent()).removeView(old);
        LinearLayout region = new LinearLayout(row.getContext());
        region.setOrientation(LinearLayout.VERTICAL);
        region.setTag(REGION_TAG);
        // An id, so a row's own button (the status card's Resume) can sit below the result.
        region.setId(View.generateViewId());
        if (column instanceof RelativeLayout) {
            RelativeLayout.LayoutParams place = new RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.addRule(RelativeLayout.BELOW, anchor.getId());
            column.addView(region, place);
        } else {
            column.addView(region, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        bind(region, () -> row.isAttachedToWindow() && row.isShown());
    }

    void bind(LinearLayout region, BooleanSupplier ownerAlive) {
        bound = new WeakReference<>(region);
        alive = ownerAlive;
        render();
    }

    private void render() {
        LinearLayout region = bound.get();
        if (region == null) return;
        region.removeAllViews();
        region.setVisibility(message == null ? View.GONE : View.VISIBLE);
        if (message == null) return;
        Context context = region.getContext();
        int gap = Math.round(8 * context.getResources().getDisplayMetrics().density);
        region.setPaddingRelative(region.getPaddingStart(), gap, region.getPaddingEnd(), region.getPaddingBottom());
        TextView text = new TextView(context);
        text.setTag(MESSAGE_TAG);
        text.setTextSize(14);
        text.setTextColor(ScreenColors.DEFAULT.summary);
        text.setSingleLine(false);
        text.setMaxLines(Integer.MAX_VALUE);
        text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        text.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_NONE);
        String shownMessage = copyFailed ? message + "\n" + L10n.t(context, "Couldn't copy the link. Try again.") : message;
        text.setText(shownMessage);
        region.addView(text, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        long shownRevision = revision;
        BooleanSupplier owner = alive;
        if (address != null) {
            String rawAddress = address;
            String instruction = message;
            Button copy = new Button(context);
            copy.setTag(COPY_TAG);
            copy.setText(L10n.t(context, "Copy link"));
            copy.setAllCaps(false);
            copy.setSingleLine(false);
            copy.setMaxLines(Integer.MAX_VALUE);
            ScreenColors.DEFAULT.secondaryAction(copy);
            // The button style asks for focus outright, and a list drops a touch on any row holding
            // such a view. Focusable only because it's clickable, a keyboard still reaches it and a
            // tap on the rest of the row still works.
            copy.setFocusable(View.FOCUSABLE_AUTO);
            int target = Math.round(48 * context.getResources().getDisplayMetrics().density);
            copy.setMinHeight(target);
            copy.setMinimumHeight(target);
            copy.setOnClickListener(ignored -> {
                if (!current(region, owner, shownRevision)) return;
                try {
                    ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (clipboard == null) throw new IllegalStateException("No clipboard");
                    clipboard.setPrimaryClip(ClipData.newPlainText("HushTumblr", rawAddress));
                    // Android 13 and later confirm a copy themselves.
                    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) Utils.showToastShort(L10n.t(context, "Link copied"));
                } catch (RuntimeException refused) {
                    Logger.printInfo(() -> "Could not copy a settings help link");
                    publish(instruction, rawAddress, true);
                }
            });
            region.addView(copy, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        // A recreated preference binds retained text silently. Only a new action publishes it, once
        // the region is laid out: a list that draws the row again for the change binds a new region
        // in that layout, and the words are read out there rather than on the view it threw away.
        if (spokenRevision >= shownRevision) return;
        region.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                                 int oldLeft, int oldTop, int oldRight, int oldBottom) {
                region.removeOnLayoutChangeListener(this);
                region.post(() -> {
                    // A bind into the same region since then put a new line there, which reads out.
                    if (!current(region, owner, shownRevision) || spokenRevision >= shownRevision
                            || text.getParent() != region) return;
                    spokenRevision = shownRevision;
                    text.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                    text.setText(shownMessage);
                });
            }
        });
    }

    private boolean current(LinearLayout region, BooleanSupplier owner, long shownRevision) {
        return bound.get() == region && revision == shownRevision && region.isAttachedToWindow() && owner.getAsBoolean();
    }
}
