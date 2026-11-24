/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 * Based on the A–B loop in Morphe PR #4685 (Copyright 2026 Morphe; see NOTICE).
 */
package app.morphe.extension.music.patches.loop;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;

import app.morphe.extension.music.settings.Settings;

/** A dedicated row, not a listener on the seekbar or on the playback source inspector's menu. */
final class RepeatControls implements View.OnAttachStateChangeListener {
    private static final ArrayList<RepeatControls> ATTACHED = new ArrayList<>();

    private final WeakReference<View> timeBar;
    private LinearLayout row;
    private View transport;
    private Button mark;
    private Button clear;
    private TextView active;

    private RepeatControls(View timeBar) {
        this.timeBar = new WeakReference<>(timeBar);
    }

    static void watch(View timeBar) {
        timeBar.addOnAttachStateChangeListener(new RepeatControls(timeBar));
    }

    static void refresh() {
        for (int index = 0; index < ATTACHED.size(); index++) {
            ATTACHED.get(index).render();
        }
    }

    @Override
    public void onViewAttachedToWindow(View view) {
        ATTACHED.add(this);
        // A parent in the process of attaching its children cannot be safely edited inline.
        view.post(this::render);
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        ATTACHED.remove(this);
    }

    private void render() {
        View anchor = timeBar.get();
        if (anchor == null || !anchor.isAttachedToWindow()) return;

        boolean enabled = Settings.AB_REPEAT.get();
        if (!enabled && row == null) return;
        if (row == null && !attachRow(anchor)) return;

        int below = enabled ? row.getId() : anchor.getId();
        if (transport.getLayoutParams() instanceof RelativeLayout.LayoutParams params
                && params.getRule(RelativeLayout.BELOW) != below) {
            params.addRule(RelativeLayout.BELOW, below);
            transport.setLayoutParams(params);
        }
        row.setVisibility(enabled ? View.VISIBLE : View.GONE);
        if (!enabled) return;

        long start = RepeatSection.start();
        long end = RepeatSection.end();
        boolean hasStart = start != RepeatRange.UNSET;
        boolean hasEnd = end != RepeatRange.UNSET;
        clear.setVisibility(hasStart ? View.VISIBLE : View.GONE);
        mark.setVisibility(hasEnd ? View.GONE : View.VISIBLE);
        active.setVisibility(hasEnd ? View.VISIBLE : View.GONE);
        if (hasEnd) {
            active.setText(str("morphe_music_ab_repeat_active", format(start), format(end)));
        } else {
            mark.setText(hasStart ? str("morphe_music_ab_repeat_set_b", format(start))
                    : str("morphe_music_ab_repeat_set_a"));
        }
        clear.setContentDescription(str("morphe_music_ab_repeat_clear_description"));
    }

    private boolean attachRow(View anchor) {
        if (!(anchor.getParent() instanceof RelativeLayout parent) || anchor.getId() == View.NO_ID) return false;

        // Both classic and modern time bars are immediately above the native transport row.
        for (int index = 0; index < parent.getChildCount(); index++) {
            View child = parent.getChildAt(index);
            if (child instanceof LinearLayout && child.getLayoutParams() instanceof RelativeLayout.LayoutParams params
                    && params.getRule(RelativeLayout.BELOW) == anchor.getId()) {
                transport = child;
                installRow(parent, anchor, index);
                return true;
            }
        }
        return false;
    }

    private void installRow(RelativeLayout parent, View anchor, int index) {
        Context context = anchor.getContext();
        row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER);
        row.setId(View.generateViewId());

        mark = new Button(context);
        mark.setAllCaps(false);
        mark.setOnClickListener(view -> RepeatSection.setNextPoint());
        clear = new Button(context);
        clear.setAllCaps(false);
        clear.setText(str("morphe_music_ab_repeat_clear"));
        clear.setOnClickListener(view -> RepeatSection.clear());
        active = new TextView(context);
        active.setGravity(Gravity.CENTER);
        active.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        int padding = Math.round(8 * context.getResources().getDisplayMetrics().density);
        active.setPaddingRelative(padding, 0, padding, 0);

        row.addView(mark, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.addView(active, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.addView(clear, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        RelativeLayout.LayoutParams layout = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        layout.addRule(RelativeLayout.BELOW, anchor.getId());
        parent.addView(row, index, layout);
    }

    private static String format(long millis) {
        long seconds = millis / 1000;
        return String.format(Locale.getDefault(), "%d:%02d.%02d", seconds / 60, seconds % 60, millis / 10 % 100);
    }
}
