/*
 * Copyright (c) 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
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

import java.util.ArrayList;
import java.util.List;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;

/** Optional guidance. Reading it changes no settings, accounts or stored app data. */
@SuppressWarnings("deprecation")
public final class SetupGuidancePreference extends DialogPreference {
    private static final String PASSWORD_HELP = "https://help.pinterest.com/en/article/reset-your-password";
    private static final String DATA_HELP = "https://help.pinterest.com/en/article/download-your-pinterest-data";
    private final Activity host;
    private Session session;

    public SetupGuidancePreference(Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        host = activity(context);
        setKey("action_setup_guidance");
        setPersistent(false);
        setTitle(L10n.t(context, "Setup and backup guide"));
        setSummary(L10n.t(context, "Optional help with sign-in, supported links, patch choices and backups."));
        setDialogTitle(getTitle());
        setNegativeButtonText(L10n.t(context, "Back"));
        setPositiveButtonText(null);
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
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
            opened.refreshLinks();
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Setup guide could not open: " + failure.getClass().getSimpleName());
            if (session != null) session.close();
            session = null;
            if (getDialog() != null) getDialog().dismiss();
            Utils.showToastLong(L10n.t(getContext(), "Couldn't open the setup guide. Try again."));
        }
    }

    @Override protected void onDialogClosed(boolean positiveResult) {
        if (session != null) session.close();
        session = null;
        super.onDialogClosed(positiveResult);
    }

    @Override public void onDismiss(DialogInterface dismissed) {
        // Android queues this callback. An earlier opening can't close a replacement dialog.
        if (getDialog() == dismissed) super.onDismiss(dismissed);
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
            paragraph(L10n.t(getContext(), "Choose the patches when you build the app in Morphe Manager. The switches here can control only patches included in that build. Changing switches doesn't add or remove patches. Pause keeps your saved choices, but changes made while patching remain in the app."));

            heading(L10n.t(getContext(), "Sign in to your existing account"));
            paragraph(L10n.t(getContext(), "Use the email linked to your existing Pinterest account and a Pinterest password. Google sign-in isn't supported with this build's changed signing key. Pinterest no longer offers Facebook login. Push notifications haven't been verified."));
            paragraph(L10n.t(getContext(), "If you joined through Google or don't know your Pinterest password, choose Forgot your password on Pinterest's login page. Enter the email already linked to that account, then use the reset link sent to your email to set a Pinterest password. It's separate from your Google password. You don't need to unlink Google."));
            action(L10n.t(getContext(), "Pinterest password help"), () -> openHelp(PASSWORD_HELP));

            heading(L10n.t(getContext(), "Supported links"));
            paragraph(L10n.t(getContext(), "Re-signing can prevent automatic link verification. You can choose the web addresses in Android's Open by default settings."));
            links = paragraph("");
            links.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            action(L10n.t(getContext(), "Open link settings"), this::openLinkSettings);

            heading(L10n.t(getContext(), "Back up before changing builds"));
            paragraph(L10n.t(getContext(), "Export settings saves HushPinterest's feature switches. It doesn't include your Pinterest account, pins, downloaded files or Morphe Manager's signing key. Keep the settings file and Manager's signing-key backup somewhere you can find them."));
            paragraph(L10n.t(getContext(), "An accepted upgrade signed with the same key keeps the app's data. A build with a different key isn't a compatible update, and Android may refuse a downgrade. Keep the installed app and its data if an update is refused."));
            paragraph(L10n.t(getContext(), "Pinterest's data export is separate from Export settings. Pinterest's help page explains how to request your personal data from the account you're already using."));
            action(L10n.t(getContext(), "Pinterest data export help"), () -> openHelp(DATA_HELP));
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
            Utils.showToastLong(L10n.t(getContext(), "Android's settings for this app didn't open. Open App info from Pinterest's icon, then Open by default."));
        }

        void openHelp(String address) {
            if (!alive()) return;
            try {
                host.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(address)).addCategory(Intent.CATEGORY_BROWSABLE));
            } catch (RuntimeException unavailable) {
                Logger.printInfo(() -> "No app opened a setup help link");
                Utils.showToastLong(L10n.f(getContext(), "No app on this phone can open the link. The address is %1$s.", L10n.isolate(address)));
            }
        }

        void heading(CharSequence text) {
            TextView heading = paragraph(text);
            heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            heading.setTextColor(ScreenColors.DEFAULT.heading);
            heading.setAccessibilityHeading(true);
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
            button.setTextColor(ScreenColors.DEFAULT.secondaryActionText());
            button.setMinHeight(dp(48));
            button.setPaddingRelative(dp(12), dp(8), dp(12), dp(8));
            GradientDrawable surface = new GradientDrawable();
            surface.setColor(ScreenColors.DEFAULT.card);
            surface.setStroke(dp(1), ScreenColors.DEFAULT.outline);
            surface.setCornerRadius(dp(8));
            button.setBackground(new RippleDrawable(ColorStateList.valueOf(ScreenColors.half(ScreenColors.DEFAULT.accent)), surface, null));
            LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            size.bottomMargin = dp(8);
            content.addView(button, size);
            actions.add(button);
            button.setOnClickListener(view -> { if (alive()) action.run(); });
        }

        int dp(int value) {
            return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getContext().getResources().getDisplayMetrics()));
        }
    }
}
