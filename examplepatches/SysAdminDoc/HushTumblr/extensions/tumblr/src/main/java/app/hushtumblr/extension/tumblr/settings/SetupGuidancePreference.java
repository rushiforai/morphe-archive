/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright (c) 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.preference.DialogPreference;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;

/** Optional guidance. Reading it changes no settings, accounts or stored app data. */
@SuppressWarnings("deprecation")
public final class SetupGuidancePreference extends DialogPreference {
    static final String KEY = "action_setup_guidance";
    /** Tumblr's article on resetting a password through its reset page. */
    private static final String PASSWORD_HELP = "https://help.tumblr.com/knowledge-base/resetting-your-password/";
    /** Tumblr's article on requesting an account's personal data, which it takes on its website only. */
    private static final String DATA_HELP = "https://help.tumblr.com/knowledge-base/manage-account-and-privacy-data/";
    private final Activity host;
    private Session session;
    /**
     * What the last help button left to do. It outlives one opening only when Android rebuilds the
     * screen with the guide open, and the settings page saves and restores it for that.
     */
    final SettingsFeedback feedback = new SettingsFeedback();

    public SetupGuidancePreference(Context context) {
        super(HushTumblrPreferenceFragment.themed(context));
        host = activity(context);
        setKey(KEY);
        setPersistent(false);
        setTitle(L10n.t(context, "Setup and backup guide"));
        setSummary(L10n.t(context, "Optional help with sign-in, supported links, patch choices and backups."));
        setDialogTitle(getTitle());
        setNegativeButtonText(L10n.t(context, "Back"));
        setPositiveButtonText(null);
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushTumblrPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushTumblrPreferenceFragment.RowSemantics(this, Button.class));
    }

    @Override protected View onCreateDialogView() {
        if (session != null) session.close();
        session = new Session();
        return session.scroll;
    }

    @Override protected void showDialog(Bundle state) {
        if (host == null || host.isFinishing() || host.isDestroyed()) return;
        try {
            super.showDialog(state);
            Session opened = session;
            opened.dialog = (AlertDialog) getDialog();
            ScreenColors.dialog(opened.dialog);
            setSummary(L10n.t(getContext(), "Optional help with sign-in, supported links, patch choices and backups."));
            opened.refreshLinks();
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Setup guide could not open: " + failure.getClass().getSimpleName());
            if (session != null) session.close();
            session = null;
            if (getDialog() != null) getDialog().dismiss();
            setSummary(L10n.t(getContext(), "Couldn't open the setup guide. Try again."));
        }
    }

    @Override protected void onDialogClosed(boolean positiveResult) {
        if (session != null) session.close();
        session = null;
        // The next opening starts clean.
        if (feedback.message() != null) feedback.clear();
        super.onDialogClosed(positiveResult);
    }

    @Override public void onDismiss(DialogInterface dismissed) {
        // Android queues this callback. An earlier opening can't close a replacement dialog.
        if (getDialog() == dismissed) super.onDismiss(dismissed);
    }

    /** Closing the parent window must make its help actions inert immediately. */
    void closeDialog() {
        if (session != null) session.close();
        if (getDialog() != null) getDialog().dismiss();
    }

    @Override protected void onPrepareForRemoval() {
        onActivityDestroy();
        super.onPrepareForRemoval();
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return null;
    }

    /** One opening owns its views and actions. Dismissal makes every retained callback inert. */
    private final class Session {
        final ScrollView scroll = new ScrollView(getContext()) {
            @Override public void onWindowFocusChanged(boolean hasWindowFocus) {
                super.onWindowFocusChanged(hasWindowFocus);
                if (hasWindowFocus) refreshLinks();
            }
        };
        final LinearLayout content = new LinearLayout(getContext());
        final List<Button> actions = new ArrayList<>();
        final TextView links;
        final LinearLayout feedbackRegion = new LinearLayout(getContext());
        /** The button whose action is running, for its result to show right under it. */
        View tapped;
        AlertDialog dialog;
        boolean closed;

        Session() {
            scroll.setId(android.R.id.list);
            // Only the content scrolls, so Back stays visible even with large text.
            int height = Math.min(dp(420), getContext().getResources().getDisplayMetrics().heightPixels / 2);
            scroll.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPaddingRelative(dp(24), dp(12), dp(24), dp(16));
            scroll.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            heading(L10n.t(getContext(), "Installed patches and switches"));
            paragraph(L10n.t(getContext(), "Pick the patches in Morphe Manager when you patch the app. The switches "
                + "here only control patches that are in your build. Changing a switch "
                + "doesn't add or remove a patch. Pause keeps your saved choices, but "
                + "anything set while patching stays in the app."));

            heading(L10n.t(getContext(), "Sign in to your existing account"));
            paragraph(L10n.t(getContext(), "Use the email on your Tumblr account and a Tumblr password. Google "
                + "sign-in may not work, because this patched app is signed with a different key. Push "
                + "notifications haven't been tested."));
            paragraph(L10n.t(getContext(), "If you joined through Google or don't know your Tumblr password, ask for a password reset on Tumblr's login screen. Enter the email already linked to that account, then use the reset link sent to your email to set a Tumblr password. It's separate from your Google password."));
            action(L10n.t(getContext(), "Tumblr password help"), () -> openHelp(PASSWORD_HELP));

            heading(L10n.t(getContext(), "Supported links"));
            paragraph(L10n.t(getContext(), "Android may not trust a patched app's links on its own. You can choose "
                + "the web addresses in Android's Open by default settings."));
            links = paragraph("");
            links.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            action(L10n.t(getContext(), "Open link settings"), this::openLinkSettings);

            heading(L10n.t(getContext(), "Back up before changing builds"));
            paragraph(L10n.t(getContext(), "Export settings saves HushTumblr's settings, including word lists and tab order. It doesn't include your "
                + "Tumblr account, posts, downloaded files, local mute list or Morphe Manager's signing "
                + "key. Keep the settings file and a backup of Manager's signing key "
                + "somewhere you can find them."));
            paragraph(L10n.t(getContext(), "An update signed with the same key keeps the app's data. A build signed "
                + "with a different key can't update this one, and Android may refuse to "
                + "install an older version. If an update is refused, keep the installed "
                + "app and its data."));
            paragraph(L10n.t(getContext(), "Tumblr's data export is separate from Export settings. To get a copy of your personal data, sign in on Tumblr's website with the account you're already using and ask for it in Settings, under Privacy. Tumblr's apps can't make that request. Exporting a blog's posts is a different Tumblr feature with its own help article."));
            action(L10n.t(getContext(), "Tumblr data export help"), () -> openHelp(DATA_HELP));
            feedbackRegion.setOrientation(LinearLayout.VERTICAL);
            content.addView(feedbackRegion, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            feedback.bind(feedbackRegion, this::alive);
        }

        boolean alive() {
            return !closed && session == this && dialog != null && dialog.isShowing()
                    && host != null && !host.isFinishing() && !host.isDestroyed();
        }

        void close() {
            closed = true;
            for (Button button : actions) button.setOnClickListener(null);
            actions.clear();
        }

        void refreshLinks() {
            if (alive()) links.setText(SupportedLinks.summary(SupportedLinks.read(getContext())));
        }

        void openLinkSettings() {
            if (!alive()) return;
            for (Intent page : SupportedLinks.settingsIntents(getContext())) {
                try {
                    host.startActivity(page);
                    return;
                } catch (RuntimeException unavailable) {
                    // Some phones expose only the app's own page. Try that fallback next.
                }
            }
            Logger.printInfo(() -> "No settings page opened from setup guidance");
            report(L10n.t(getContext(), "Android's settings for this app didn't open. Open App info from Tumblr's icon, then Open by default."), null);
        }

        /**
         * Shows [text] right under the button that was tapped and scrolls it into view. At the end
         * of the scrolled guidance, large text left it out of sight below the buttons.
         */
        void report(String text, @Nullable String address) {
            View under = tapped;
            if (under != null && under.getParent() == content) {
                content.removeView(feedbackRegion);
                content.addView(feedbackRegion, content.indexOfChild(under) + 1, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            feedback.show(text, address);
            feedbackRegion.post(() -> {
                if (alive()) feedbackRegion.requestRectangleOnScreen(
                        new Rect(0, 0, feedbackRegion.getWidth(), feedbackRegion.getHeight()), true);
            });
        }

        void openHelp(String address) {
            if (!alive()) return;
            try {
                host.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(address)).addCategory(Intent.CATEGORY_BROWSABLE));
            } catch (RuntimeException unavailable) {
                Logger.printInfo(() -> "No app opened a setup help link");
                report(L10n.f(getContext(), "No app on this phone can open the link. The address is %1$s.", L10n.isolate(address)), address);
            }
        }

        void heading(CharSequence text) {
            if (content.getChildCount() != 0) {
                View divider = new View(getContext());
                divider.setBackgroundColor(ScreenColors.DEFAULT.outline);
                LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
                size.topMargin = dp(12);
                size.bottomMargin = dp(4);
                content.addView(divider, size);
                divider.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            }
            TextView heading = paragraph(text);
            heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            heading.setTextColor(ScreenColors.DEFAULT.heading);
            HushTumblrPreferenceFragment.markHeading(heading);
            heading.setPaddingRelative(0, dp(12), 0, dp(4));
        }

        TextView paragraph(CharSequence text) {
            TextView view = new TextView(getContext());
            view.setText(text);
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            view.setTextColor(ScreenColors.DEFAULT.summary);
            view.setSingleLine(false);
            view.setMaxLines(Integer.MAX_VALUE);
            view.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
            view.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            view.setPaddingRelative(0, 0, 0, dp(8));
            content.addView(view, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return view;
        }

        void action(CharSequence title, Runnable action) {
            Button button = new Button(getContext());
            button.setText(title);
            button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            button.setAllCaps(false);
            button.setSingleLine(false);
            button.setMaxLines(Integer.MAX_VALUE);
            button.setEllipsize(null);
            button.setGravity(Gravity.CENTER);
            ScreenColors.DEFAULT.secondaryAction(button);
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            size.bottomMargin = dp(8);
            content.addView(button, size);
            actions.add(button);
            button.setOnClickListener(view -> {
                if (!alive()) return;
                tapped = view;
                action.run();
            });
        }

        int dp(int value) {
            return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getContext().getResources().getDisplayMetrics()));
        }
    }
}
