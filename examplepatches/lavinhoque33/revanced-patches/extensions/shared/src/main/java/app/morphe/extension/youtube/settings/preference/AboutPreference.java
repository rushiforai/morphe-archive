/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-06
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import static app.morphe.extension.shared.patches.PatchStatus.PatchVersion;
import static app.morphe.extension.shared.patches.PatchStatus.PatchedTime;
import static app.morphe.extension.shared.utils.StringRef.str;
import static app.morphe.extension.shared.utils.Utils.dipToPixels;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.preference.Preference;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.style.URLSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.Date;

import app.morphe.extension.shared.patches.SettingsNamePatch;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.utils.ExtendedUtils;
import app.morphe.extension.youtube.utils.ThemeUtils;

/**
 * A root-only, keyless header, deliberately outside XML icon mapping and the settings search index.
 * Child buttons remain focusable even though the preference row itself is not selectable.
 */
@SuppressWarnings("deprecation")
public final class AboutPreference extends Preference {
    private TextView titleView;

    public AboutPreference(Context context) {

        super(context);

        setSelectable(false);
        setPersistent(false);

        // Framework comparison subtracts orders; MIN_VALUE overflows against positive root orders.
        setOrder(-1000);
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        Context context = getContext();
        LinearLayout container = verticalLayout(context);
        container.setPadding(dipToPixels(12), dipToPixels(8), dipToPixels(12), dipToPixels(12));

        LinearLayout card = verticalLayout(context);
        card.setPadding(dipToPixels(16), dipToPixels(12), dipToPixels(16), dipToPixels(12));
        card.setBackground(CustomDialog.createRoundedBackground(20, ThemeUtils.getAdjustedBackgroundColor(false)));
        container.addView(card, matchWidth());

        titleView = addText(card, SettingsNamePatch.getSettingsName(), 22);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            titleView.setAccessibilityHeading(true);
        }
        addText(card, str("revanced_about_patches", PatchVersion()), 16);
        addText(card, str("revanced_about_app", ExtendedUtils.getAppLabel(), ExtendedUtils.getAppVersionName()), 16);
        addText(card, str("revanced_about_patched", patchedDate()), 14);

        HorizontalScrollView links = new HorizontalScrollView(context);
        links.setHorizontalScrollBarEnabled(true);
        LinearLayout buttons = new LinearLayout(context);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        links.addView(buttons);
        addLink(buttons, "revanced_about_github", AboutInfo.Link.GITHUB);
        addLink(buttons, "revanced_about_report_issue", AboutInfo.Link.REPORT_ISSUE);
        addLink(buttons, "revanced_about_request_feature", AboutInfo.Link.REQUEST_FEATURE);
        card.addView(links, matchWidth());

        addButton(card, "revanced_about_credits", this::showCredits);
        addButton(card, "revanced_about_copy_debug", this::copyDebugInfo);

        return container;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);

        titleView.setText(SettingsNamePatch.getSettingsName());
    }

    private LinearLayout verticalLayout(Context context) {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        return layout;
    }

    private LinearLayout.LayoutParams matchWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private TextView addText(LinearLayout parent, String text, int sizeSp) {
        TextView view = new TextView(getContext());
        ThemeUtils.setThemeTextStyle(view, android.R.attr.textAppearanceMedium, android.R.attr.textColorPrimary);
        view.setText(text);
        view.setTextSize(sizeSp);
        view.setPadding(0, dipToPixels(2), 0, dipToPixels(2));
        parent.addView(view, matchWidth());
        return view;
    }

    private void addLink(LinearLayout parent, String labelKey, AboutInfo.Link link) {
        addButton(parent, labelKey, () -> {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(AboutInfo.url(link)));
            getContext().startActivity(intent);
        });
    }

    private void addButton(LinearLayout parent, String labelKey, Runnable action) {
        Button button = new Button(getContext());
        String label = str(labelKey);
        button.setText(label);
        button.setContentDescription(label);
        button.setAllCaps(false);
        button.setMinHeight(dipToPixels(48));
        button.setMinimumHeight(dipToPixels(48));
        button.setPadding(dipToPixels(12), dipToPixels(8), dipToPixels(12), dipToPixels(8));
        button.setOnClickListener(view -> runAction(labelKey, action));
        int width = parent.getOrientation() == LinearLayout.HORIZONTAL
                ? ViewGroup.LayoutParams.WRAP_CONTENT : ViewGroup.LayoutParams.MATCH_PARENT;
        parent.addView(button, new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void runAction(String labelKey, Runnable action) {
        try {
            action.run();
        } catch (Exception ex) {
            Logger.printException(() -> "AboutPreference action failed: " + labelKey, ex);
        }
    }

    private String patchedDate() {
        return DateFormat.getDateTimeInstance().format(new Date(PatchedTime()));
    }

    private void copyDebugInfo() {
        String text = AboutInfo.buildDebugInfo(str("revanced_about_debug_format"), PatchVersion(),
                ExtendedUtils.getAppLabel(), ExtendedUtils.getAppVersionName(), patchedDate(),
                Build.VERSION.RELEASE, Build.VERSION.SDK_INT, Build.MANUFACTURER, Build.MODEL);
        Utils.setClipboard(text);
        Utils.showToastShort(str("revanced_about_copied"));
    }

    private void showCredits() {
        SpannableStringBuilder message = new SpannableStringBuilder(
                Html.fromHtml(str("revanced_about_credits_text"), Html.FROM_HTML_MODE_LEGACY));
        for (URLSpan link : message.getSpans(0, message.length(), URLSpan.class)) {
            int start = message.getSpanStart(link);
            int end = message.getSpanEnd(link);
            int flags = message.getSpanFlags(link);
            message.removeSpan(link);
            message.setSpan(new URLSpan(link.getURL()) {
                @Override
                public void onClick(View widget) {
                    runAction("revanced_about_credits", () -> super.onClick(widget));
                }
            }, start, end, flags);
        }

        CustomDialog.create(getContext(), str("revanced_about_credits"), message,
                null, null, null, null, null, null, false).first.show();
    }
}
