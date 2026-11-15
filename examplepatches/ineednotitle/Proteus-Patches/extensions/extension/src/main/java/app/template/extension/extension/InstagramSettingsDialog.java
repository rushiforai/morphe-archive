/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Programmatic settings dialog. It intentionally avoids Instagram resources,
 * so it keeps working across colour themes and does not depend on resource
 * patching.
 */
@SuppressWarnings("unused")
public final class InstagramSettingsDialog {

    private InstagramSettingsDialog() {
    }

    public static void show(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        InstagramSettings.initialize(activity);

        final ScrollView scroll = new ScrollView(activity);
        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(activity, 20);
        root.setPadding(pad, dp(activity, 8), pad, pad);
        scroll.addView(root);

        addHeader(activity, root, "Feed");
        addSwitch(activity, root,
                "Chronological following feed",
                "Requests the followed-only timeline and disables the ranked following feed. "
                        + "Requires the 'Limit feed to following profiles' patch.",
                InstagramSettings.KEY_CHRONOLOGICAL_FEED);

        addHeader(activity, root, "Ghost mode");
        addSwitch(activity, root,
                "Enable Ghost Mode",
                "Master switch. The options below decide which activity is hidden.",
                InstagramSettings.KEY_GHOST_MODE);
        addSwitch(activity, root,
                "Hide typing indicators",
                "Suppresses direct-message typing indicators.",
                InstagramSettings.KEY_GHOST_HIDE_TYPING);
        addSwitch(activity, root,
                "Don't send DM read receipts",
                "Blocks mark_thread_seen requests so chats stay unread for the other side.",
                InstagramSettings.KEY_GHOST_HIDE_DM_SEEN);
        addSwitch(activity, root,
                "Block story view receipts",
                "Best-effort block of the story seen endpoint. Instagram may still mark the "
                        + "story locally.",
                InstagramSettings.KEY_GHOST_HIDE_STORY_SEEN);

        addHeader(activity, root, "Reels");
        addSwitch(activity, root,
                "Playback speed menu",
                "Shows Instagram's playback-speed menu in the Reels overflow menu.",
                InstagramSettings.KEY_REELS_PLAYBACK_SPEED);
        addSwitch(activity, root,
                "Double-tap seek",
                "Enables double-tap skip/rewind controls in Reels.",
                InstagramSettings.KEY_REELS_SEEK_CONTROLS);

        addHeader(activity, root, "Like animation");
        if (InstagramLikeAnimation.isAvailable()) {
            String selected = InstagramSettings.getLikeAnimation();
            addButton(activity, root,
                    "Animation: " + InstagramLikeAnimations.label(selected),
                    "Choose one of Instagram's built-in like animations.",
                    new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            showLikeAnimationPicker(activity);
                        }
                    });
        } else {
            addNote(activity, root,
                    "Apply the 'Change like animation' patch to choose a like animation. "
                            + "Without it the native heart is used.");
        }

        addHeader(activity, root, "Browser tools");
        addButton(activity, root,
                "Open logged-out browser",
                "Browse public Instagram pages without web cookies.",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        InstagramWebBrowser.openLoggedOut(activity);
                    }
                });
        addButton(activity, root,
                "Open a profile's Reels",
                "Opens the account's public Reels tab in the in-app browser.",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        InstagramWebBrowser.openProfileReels(activity);
                    }
                });
        addButton(activity, root,
                "Open my liked posts",
                "Opens your own liked posts page in the in-app browser.",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        InstagramWebBrowser.openOwnLikedPosts(activity);
                    }
                });

        addDivider(activity, root);
        addButton(activity, root,
                "Reset all settings",
                "Restore the defaults. Patch application is unchanged.",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        InstagramSettings.resetToDefaults();
                        InstagramActionButtons.refreshGhostModeButtons();
                        Toast.makeText(activity, "Instagram settings reset", Toast.LENGTH_SHORT).show();
                    }
                });

        addNote(activity, root,
                "Settings are stored locally and apply immediately. "
                        + "Some Instagram responses are enforced on the server; see the documentation.");

        new AlertDialog.Builder(activity)
                .setTitle("Proteus · Instagram")
                .setView(scroll)
                .setPositiveButton("Close", null)
                .show();
    }

    private static void showLikeAnimationPicker(final Activity activity) {
        final String[] values = InstagramLikeAnimations.values();
        String[] labels = new String[values.length];
        int checked = 0;
        String current = InstagramSettings.getLikeAnimation();
        for (int i = 0; i < values.length; i++) {
            labels[i] = InstagramLikeAnimations.label(values[i]);
            if (values[i].equals(current)) {
                checked = i;
            }
        }

        new AlertDialog.Builder(activity)
                .setTitle("Like animation")
                .setSingleChoiceItems(labels, checked, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        InstagramSettings.setString(
                                InstagramSettings.KEY_LIKE_ANIMATION, values[which]);
                        InstagramLikeAnimation.resetSessionChoice();
                        dialog.dismiss();
                        Toast.makeText(activity,
                                "Like animation: " + InstagramLikeAnimations.label(values[which]),
                                Toast.LENGTH_SHORT).show();
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void addHeader(Activity activity, LinearLayout root, String text) {
        TextView header = new TextView(activity);
        header.setText(text);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(0xFF8E8E8E);
        header.setAllCaps(true);
        header.setPadding(0, dp(activity, 18), 0, dp(activity, 4));
        root.addView(header);
    }

    private static void addSwitch(
            Activity activity,
            LinearLayout root,
            String title,
            String summary,
            final String key
    ) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, dp(activity, 8), 0, dp(activity, 8));

        Switch toggle = new Switch(activity);
        toggle.setText(title);
        toggle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        toggle.setChecked(InstagramSettings.getBoolean(key));
        toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                InstagramSettings.setBoolean(key, isChecked);
                if (InstagramSettings.KEY_GHOST_MODE.equals(key)
                        || InstagramSettings.KEY_GHOST_HIDE_TYPING.equals(key)
                        || InstagramSettings.KEY_GHOST_HIDE_DM_SEEN.equals(key)
                        || InstagramSettings.KEY_GHOST_HIDE_STORY_SEEN.equals(key)) {
                    InstagramActionButtons.refreshGhostModeButtons();
                }
            }
        });
        row.addView(toggle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        addSummary(activity, row, summary);
        root.addView(row);
    }

    private static void addButton(
            Activity activity,
            LinearLayout root,
            String title,
            String summary,
            View.OnClickListener listener
    ) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, dp(activity, 8), 0, dp(activity, 8));

        Button button = new Button(activity);
        button.setText(title);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        button.setOnClickListener(listener);
        row.addView(button, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        addSummary(activity, row, summary);
        root.addView(row);
    }

    private static void addNote(Activity activity, LinearLayout root, String text) {
        TextView note = new TextView(activity);
        note.setText(text);
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        note.setTextColor(0xFF8E8E8E);
        note.setPadding(0, dp(activity, 8), 0, dp(activity, 8));
        root.addView(note);
    }

    private static void addSummary(Activity activity, LinearLayout root, String summary) {
        if (summary == null || summary.isEmpty()) {
            return;
        }
        TextView description = new TextView(activity);
        description.setText(summary);
        description.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        description.setTextColor(0xFF8E8E8E);
        description.setPadding(dp(activity, 4), dp(activity, 2), dp(activity, 4), 0);
        root.addView(description);
    }

    private static void addDivider(Activity activity, LinearLayout root) {
        View divider = new View(activity);
        divider.setBackgroundColor(0x22888888);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 1);
        params.topMargin = dp(activity, 16);
        params.bottomMargin = dp(activity, 4);
        root.addView(divider, params);
    }

    private static int dp(Activity activity, int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics());
    }
}
