/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11
 * Written by lavinhoque33, 2026-11-06
 */

package app.morphe.extension.youtube.settings.preference;

import static app.morphe.extension.shared.patches.PatchStatus.PatchVersion;
import static app.morphe.extension.shared.patches.PatchStatus.PatchedTime;
import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.preference.Preference;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.style.URLSpan;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.Date;

import app.morphe.extension.shared.patches.SettingsNamePatch;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.utils.ExtendedUtils;

/** Native About rows, deliberately excluded from the settings search index. */
@SuppressWarnings("deprecation")
public final class AboutPreference extends Preference {
    public AboutPreference(Context context, AttributeSet attrs) {
        super(context, attrs);

        setPersistent(false);
        updateAppInfo();
    }

    private void updateAppInfo() {
        switch (getKey()) {
            case "revanced_about_patches" -> {
                String customName = SettingsNamePatch.getCustomSettingsName();
                setSummary(customName == null ? PatchVersion() : PatchVersion() + "\n" + customName);
            }
            case "revanced_about_app" -> {
                setTitle(ExtendedUtils.getAppLabel());
                setSummary(ExtendedUtils.getAppVersionName());
            }
            case "revanced_about_patched" -> setSummary(patchedDate());
        }
    }

    @Override
    protected void onBindView(View view) {
        if ("revanced_about_patches".equals(getKey())) updateAppInfo();
        super.onBindView(view);

        wrapText(view.findViewById(android.R.id.title));
        wrapText(view.findViewById(android.R.id.summary));
    }

    private void wrapText(TextView text) {
        if (text != null) {
            text.setSingleLine(false);
            text.setMaxLines(Integer.MAX_VALUE);
            text.setEllipsize(null);
        }
    }

    @Override
    protected void onClick() {
        String key = getKey();
        runAction(key, () -> {
            switch (key) {
                case "revanced_about_github" -> openLink(AboutInfo.Link.GITHUB);
                case "revanced_about_report_issue" -> openLink(AboutInfo.Link.REPORT_ISSUE);
                case "revanced_about_request_feature" -> openLink(AboutInfo.Link.REQUEST_FEATURE);
                case "revanced_about_credits" -> showCredits();
                case "revanced_about_copy_debug" -> copyDebugInfo();
            }
        });
    }

    private void openLink(AboutInfo.Link link) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(AboutInfo.url(link)));
        getContext().startActivity(intent);
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
