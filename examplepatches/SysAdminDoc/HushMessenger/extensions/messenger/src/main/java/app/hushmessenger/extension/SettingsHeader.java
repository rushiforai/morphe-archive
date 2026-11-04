/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 *
 * Modified for HushMessenger (Messenger), 2026.
 */
package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * The top of the Controls page: HushMessenger's icon, its name in Messenger's gradient and the version line, centred
 * over the rows. Nothing on it can be tapped.
 */
final class SettingsHeader {
    /** Tags of its parts, for the tests. */
    static final String HEADER = "page_header";
    static final String ICON = "header_icon";
    static final String NAME = "header_name";
    static final String VERSION = "header_version";

    private SettingsHeader() { }

    /** The header, with hostVersion as Messenger's version name, or null when Android doesn't say. */
    static LinearLayout create(Context context, SettingsUi ui, SettingsText text, String hostVersion) {
        LinearLayout column = ui.column();
        column.setTag(HEADER);
        column.setGravity(Gravity.CENTER_HORIZONTAL);
        column.setPadding(ui.dp(24), ui.dp(28), ui.dp(24), ui.dp(20));

        ImageView icon = new ImageView(context);
        icon.setTag(ICON);
        // HushMessenger's own logo, in its own colors. Messenger has none, so the payload carries it.
        icon.setImageDrawable(SettingsLogo.drawable(context));
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        // The name under it says the same.
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        column.addView(icon, new LinearLayout.LayoutParams(ui.dp(64), ui.dp(64)));

        TextView name = new TextView(context);
        name.setTag(NAME);
        name.setText("HushMessenger");
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 32);
        name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        name.setGravity(Gravity.CENTER);
        name.setAccessibilityHeading(true);
        // One line that shrinks at large text sizes, so the name is never split mid-word.
        name.setMaxLines(1);
        name.setAutoSizeTextTypeUniformWithConfiguration(20, 32, 1, TypedValue.COMPLEX_UNIT_SP);
        ShimmerTitle.wear(name, ui.light);
        LinearLayout.LayoutParams nameSpace = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameSpace.topMargin = ui.dp(12);
        column.addView(name, nameSpace);

        TextView version = ui.text(versionLine(text, hostVersion), 13, ui.muted, false);
        version.setTag(VERSION);
        version.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams versionSpace = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        versionSpace.topMargin = ui.dp(4);
        column.addView(version, versionSpace);
        return column;
    }

    /** The patches' version for Messenger's, or the patches' alone when Messenger's isn't known. */
    static String versionLine(SettingsText text, String hostVersion) {
        String patches = isolate(BuildConfig.VERSION_NAME);
        return hostVersion == null || hostVersion.trim().isEmpty() ? text.get("header_version_alone", patches)
                : text.get("header_version", patches, isolate(hostVersion.trim()));
    }

    /** value in its own direction, so a version's dots and digits keep their order inside a right-to-left line. */
    private static String isolate(String value) {
        return (char) 0x2068 + value + (char) 0x2069;
    }
}
