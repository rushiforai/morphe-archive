/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19
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
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.text.style.URLSpan;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.patches.SettingsNamePatch;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.utils.ExtendedUtils;

/** Native About rows, deliberately excluded from the settings search index. */
@SuppressWarnings("deprecation")
public final class AboutPreference extends Preference {
    private static final String INCLUSION_DESCRIPTION = "revanced_about_patch_inclusion_summary";
    private static final String NOT_RECORDED = "revanced_about_patch_not_recorded";
    private static final String ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android";
    private static final Pattern HTML_COMMENT = Pattern.compile("<!--.*?(?:-->|\\z)", Pattern.DOTALL);
    private static final Pattern WHITESPACE = Pattern.compile("[\\t \\r\\n]+");

    private final boolean inclusionDescription;
    private final boolean notRecorded;

    public AboutPreference(Context context, AttributeSet attrs) {
        super(context, attrs);

        setPersistent(false);
        inclusionDescription = hasStringAttribute(attrs, "title", INCLUSION_DESCRIPTION);
        notRecorded = hasStringAttribute(attrs, "summary", NOT_RECORDED);

        if (inclusionDescription) {
            setTitle(formatInclusionDescription(getTitle()));
        }

        updateAppInfo();
    }

    private boolean hasStringAttribute(AttributeSet attrs, String attribute, String resourceName) {
        if (attrs == null || getKey() != null) return false;

        int id = attrs.getAttributeResourceValue(ANDROID_NAMESPACE, attribute, 0);
        return id != 0 && resourceName.equals(getContext().getResources().getResourceEntryName(id));
    }

    private void updateAppInfo() {
        if (getKey() == null) return;

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

        TextView title = view.findViewById(android.R.id.title);
        TextView summary = view.findViewById(android.R.id.summary);
        wrapText(title);
        wrapText(summary);

        if (notRecorded && summary != null && getSummary() != null) {
            summary.setText(colorUnrecordedStatus(getSummary(), BaseThemeUtils.isDarkModeEnabled()));
        }

        if (title != null) {
            boolean hasInclusionLink = inclusionDescription && title.getUrls().length != 0;
            if (hasInclusionLink || title.getMovementMethod() instanceof LinkMovementMethod) {
                title.setMovementMethod(hasInclusionLink ? LinkMovementMethod.getInstance() : null);
            }
        }
    }

    static CharSequence colorUnrecordedStatus(CharSequence label, boolean darkMode) {
        SpannableString styled = new SpannableString(label);
        // Use different shades to keep the status legible on both stock appearances.
        int color = darkMode ? 0xFFFFAA54 : 0xFF914700;
        styled.setSpan(new ForegroundColorSpan(color), 0, styled.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return styled;
    }

    static CharSequence formatInclusionDescription(CharSequence description) {
        // Older copies of this resource can contain XML comment separators as literal text.
        // Work on spans so link targets survive cleanup.
        SpannableStringBuilder text = new SpannableStringBuilder(description);
        Matcher comments = HTML_COMMENT.matcher(description);
        int offset = 0;
        while (comments.find()) {
            int start = comments.start() + offset;
            int end = comments.end() + offset;
            text.replace(start, end, " ");
            offset += 1 - (end - start);
        }

        String uncommented = text.toString();
        Matcher whitespace = WHITESPACE.matcher(uncommented);
        offset = 0;
        while (whitespace.find()) {
            int start = whitespace.start();
            int end = whitespace.end();
            String separator = start == 0 || end == uncommented.length() ? ""
                    : isParagraphBreak(uncommented, start, end) ? "\n\n" : " ";
            if (separator.length() == end - start && uncommented.startsWith(separator, start)) {
                continue;
            }
            text.replace(start + offset, end + offset, separator);
            offset += separator.length() - (end - start);
        }
        return text;
    }

    private static boolean isParagraphBreak(CharSequence text, int start, int end) {
        int lineBreaks = 0;
        for (int index = start; index < end; index++) {
            char character = text.charAt(index);
            boolean lineBreak = character == '\r'
                    || (character == '\n' && (index == start || text.charAt(index - 1) != '\r'));
            if (lineBreak && ++lineBreaks == 2) {
                return true;
            }
        }
        return false;
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
