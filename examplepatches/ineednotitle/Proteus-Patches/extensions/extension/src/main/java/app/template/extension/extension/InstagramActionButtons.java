/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Adds the two action-bar buttons used by the Instagram patches:
 * a gear that opens {@link InstagramSettingsDialog} and a ghost that toggles
 * Ghost Mode.
 */
@SuppressWarnings("unused")
public final class InstagramActionButtons {
    private static final String TAG_SETTINGS = "proteus_instagram_settings_button";
    private static final String TAG_GHOST = "proteus_instagram_ghost_button";

    private static final Set<TextView> GHOST_BUTTONS =
            Collections.newSetFromMap(new WeakHashMap<TextView, Boolean>());

    private static final Runnable SETTINGS_LISTENER = new Runnable() {
        @Override
        public void run() {
            refreshGhostModeButtons();
        }
    };

    private static boolean listenerRegistered;

    private InstagramActionButtons() {
    }

    /**
     * Injection point called after Instagram has inflated the main feed action
     * bar container.
     */
    public static void mainFeedActionBarButton(ViewGroup container) {
        if (container == null) {
            return;
        }
        try {
            InstagramSettings.initialize(container.getContext());
            InstagramGhostMode.refreshRequestFilter();
            registerListener();

            if (container.findViewWithTag(TAG_SETTINGS) == null) {
                final TextView settings = createButton(
                        container, "\u2699", "Proteus Instagram settings", TAG_SETTINGS);
                settings.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Activity activity = findActivity(v.getContext());
                        if (activity != null) {
                            InstagramSettingsDialog.show(activity);
                        }
                    }
                });
                container.addView(settings, layoutParams(container));
            }

            if (container.findViewWithTag(TAG_GHOST) == null) {
                final TextView ghost = createButton(
                        container, "\uD83D\uDC7B", "Toggle Ghost Mode", TAG_GHOST);
                ghost.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        boolean enabled = !InstagramSettings.isGhostModeEnabled();
                        InstagramSettings.setBoolean(InstagramSettings.KEY_GHOST_MODE, enabled);
                        refreshGhostModeButtons();
                        Toast.makeText(
                                v.getContext(),
                                enabled ? "Ghost Mode on" : "Ghost Mode off",
                                Toast.LENGTH_SHORT).show();
                    }
                });
                container.addView(ghost, layoutParams(container));
                GHOST_BUTTONS.add(ghost);
            }

            refreshGhostModeButtons();
        } catch (Throwable ignored) {
            // Never let an optional UI button break the feed action bar.
        }
    }

    public static void refreshGhostModeButtons() {
        List<TextView> buttons;
        synchronized (GHOST_BUTTONS) {
            buttons = new ArrayList<>(GHOST_BUTTONS);
        }
        boolean enabled = InstagramSettings.isGhostModeEnabled();
        for (TextView button : buttons) {
            button.setAlpha(enabled ? 1.0f : 0.4f);
        }
    }

    private static void registerListener() {
        if (listenerRegistered) {
            return;
        }
        InstagramSettings.addListener(SETTINGS_LISTENER);
        listenerRegistered = true;
    }

    private static TextView createButton(
            ViewGroup parent,
            String text,
            String description,
            String tag
    ) {
        Context context = parent.getContext();
        TextView button = new TextView(context);
        button.setText(text);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setTextColor(Color.WHITE);
        button.setGravity(Gravity.CENTER);
        button.setContentDescription(description);
        button.setTag(tag);

        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(0x33000000);
        button.setBackground(background);
        button.setPadding(0, 0, 0, 0);
        return button;
    }

    private static ViewGroup.LayoutParams layoutParams(ViewGroup parent) {
        Context context = parent.getContext();
        int size = dp(context, 36);
        if (parent instanceof LinearLayout) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
            params.gravity = Gravity.CENTER_VERTICAL;
            params.setMargins(dp(context, 2), 0, dp(context, 2), 0);
            return params;
        }
        return new ViewGroup.LayoutParams(size, size);
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) {
                break;
            }
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics());
    }
}
