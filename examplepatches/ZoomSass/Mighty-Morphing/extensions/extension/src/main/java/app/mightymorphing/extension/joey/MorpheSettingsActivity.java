package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toolbar;

/**
 * Joey-style settings screen. Each control writes its choice immediately.
 * Layout matches Award settings: theme canvas, full-width subject card, toolbar back arrow.
 */
public final class MorpheSettingsActivity extends Activity {
    static android.view.View create(Activity activity, Runnable close) {
        return new MorpheSettingsActivity().build(activity, close);
    }

    private View profileRow;
    private View youtubeRow;
    private View autoplayRow;
    private View sizeRow;
    private View limitRow;
    private View dragRow;
    private View handleRow;

    private int canvas = 0xFF102022;
    private int card = 0xFF000000;
    private int title = 0xFFF0A202;
    private int textColor = 0xFFE6E6E6;
    private int sub = 0xFF9A9A9A;

    private android.view.View build(Activity activity, Runnable close) {
        attachBaseContext(activity);
        readTheme(activity);
        float density = activity.getResources().getDisplayMetrics().density;

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(canvas);

        Toolbar toolbar = new Toolbar(activity);
        toolbar.setBackgroundColor(card);
        toolbar.setTitle("Morphe Settings");
        toolbar.setTitleTextColor(title);
        int back = activity.getResources().getIdentifier(
                "abc_ic_ab_back_material", "drawable", activity.getPackageName());
        if (back == 0) back = android.R.drawable.ic_media_previous;
        toolbar.setNavigationIcon(back);
        Drawable icon = toolbar.getNavigationIcon();
        if (icon != null) icon.setColorFilter(title, PorterDuff.Mode.SRC_IN);
        toolbar.setNavigationOnClickListener(v -> close.run());
        root.addView(toolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.round(56 * density)));

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(canvas);
        if (MorpheSettings.pictureControls()) {
            LinearLayout sheet = new LinearLayout(activity);
            sheet.setOrientation(LinearLayout.VERTICAL);
            sheet.setBackgroundColor(card);
            sheet.addView(sectionTitle(activity, "Comments"));
            profileRow = toggleRow(activity, "Profile comment previews",
                    "Pictures, GIFs and video previews show on profile comments. Applies to your profile and other's.",
                    MorpheSettings.profileCommentsEnabled(activity),
                    (button, checked) -> MorpheSettings.saveProfile(activity, checked));
            youtubeRow = toggleRow(activity, "YouTube inline preview",
                    "Show YouTube links in the comment. Off shows link, alternative is to use Joey's default link preview option in settings.",
                    MorpheSettings.youtubeInline(activity),
                    (button, checked) -> MorpheSettings.saveYoutubeInline(activity, checked));
            autoplayRow = toggleRow(activity, "Autoplay GIFs",
                    "Autoplay or show gifs paused by default.",
                    MorpheSettings.autoplay(activity),
                    (button, checked) -> {
                        MorpheSettings.saveAutoplay(activity, checked);
                        applyCommentRows(activity);
                    });
            sizeRow = sizeRow(activity);
            limitRow = limitRow(activity);
            handleRow = toggleRow(activity, "Invisible handle", "Hides the corner handle. Dragging still resizes.",
                    MorpheSettings.invisibleHand(activity),
                    (button, checked) -> MorpheSettings.saveInvisibleHand(activity, checked));
            dragRow = toggleRow(activity, "Drag to resize", "Drag a comment image (to the right) to change its size.",
                    MorpheSettings.resizeEnabled(activity),
                    (button, checked) -> {
                        MorpheSettings.saveResize(activity, checked);
                        applyCommentRows(activity);
                    });
            sheet.addView(toggleRow(activity, "Inline previews",
                    "Show pictures, GIFs and reddit video previews in comments.",
                    MorpheSettings.inlineComments(activity),
                    (button, checked) -> {
                        MorpheSettings.saveInline(activity, checked);
                        applyCommentRows(activity);
                    }));
            sheet.addView(sizeRow);
            sheet.addView(dragRow);
            sheet.addView(handleRow);
            sheet.addView(profileRow);
            sheet.addView(youtubeRow);
            sheet.addView(autoplayRow);
            sheet.addView(limitRow);
            applyCommentRows(activity);
            column.addView(sheet);
        }
        if (MorpheSettings.showHideControls()) {
            LinearLayout showHide = new LinearLayout(activity);
            showHide.setOrientation(LinearLayout.VERTICAL);
            showHide.setBackgroundColor(card);
            LinearLayout.LayoutParams showHideParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (column.getChildCount() > 0) showHideParams.topMargin = Math.round(12 * density);
            showHide.setLayoutParams(showHideParams);
            showHide.addView(sectionTitle(activity, "Show/Hide"));
            showHide.addView(actionRow(activity, "Text Formatting bar", "Choose which buttons are shown on the editor toolbar when adding/editing text.",
                    () -> EditorBar.show(activity)));
            showHide.addView(actionRow(activity, "Sidebar", "Choose which sidebar entries are shown. Core options can't be toggled off.",
                    () -> Sidebar.show(activity)));
            showHide.addView(actionRow(activity, "Subreddit toolbar", "Choose which items appear on the top bar and overflow menu, and change their order.",
                    () -> SubredditToolbar.show(activity)));
            column.addView(showHide);
        }
        if (MorpheSettings.backupControls()) {
            LinearLayout backup = new LinearLayout(activity);
            backup.setOrientation(LinearLayout.VERTICAL);
            backup.setBackgroundColor(card);
            LinearLayout.LayoutParams backupParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (column.getChildCount() > 0) backupParams.topMargin = Math.round(12 * density);
            backup.setLayoutParams(backupParams);
            backup.addView(sectionTitle(activity, "Backup"));
            backup.addView(actionRow(activity, "Backup settings", "Save selected settings to a file.",
                    () -> MorpheBackup.backup(activity)));
            backup.addView(actionRow(activity, "Restore settings", "Restore settings from a backup file.",
                    () -> MorpheBackup.restore(activity)));
            column.addView(backup);
        }

        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.addView(column, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return root;
    }

    private View sectionTitle(Activity activity, String text) {
        TextView heading = new TextView(activity);
        heading.setText(text);
        heading.setTextColor(sub);
        heading.setTextSize(16);
        heading.setGravity(Gravity.CENTER);
        heading.setTypeface(heading.getTypeface(), android.graphics.Typeface.BOLD);
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        heading.setPadding(pad, pad, pad, pad);
        return heading;
    }

    private View actionRow(Activity activity, String titleText, String subtitle, Runnable action) {
        LinearLayout row = rowShell(activity);
        row.addView(labels(titleText, subtitle), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.setOnClickListener(v -> action.run());
        return row;
    }

    private void applyCommentRows(Activity activity) {
        boolean inline = MorpheSettings.inlineComments(activity);
        setRowEnabled(profileRow, inline);
        setRowEnabled(youtubeRow, inline);
        setRowEnabled(autoplayRow, inline);
        setRowEnabled(sizeRow, inline);
        setRowEnabled(limitRow, inline && MorpheSettings.autoplay(activity));
        setRowEnabled(dragRow, inline);
        setRowEnabled(handleRow, inline && MorpheSettings.resizeEnabled(activity));
    }

    private void setRowEnabled(View row, boolean enabled) {
        row.setEnabled(enabled);
        row.setAlpha(enabled ? 1f : 0.45f);
        if (row instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) row;
            for (int i = 0; i < group.getChildCount(); i++) group.getChildAt(i).setEnabled(enabled);
        }
    }

    private View toggleRow(Activity activity, String titleText, String subtitle, boolean checked,
                           CompoundButton.OnCheckedChangeListener listener) {
        LinearLayout row = rowShell(activity);
        row.addView(labels(titleText, subtitle), new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        CompoundButton toggle = materialSwitch(activity);
        toggle.setChecked(checked);
        toggle.setOnCheckedChangeListener(listener);
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        toggle.setPadding(toggle.getPaddingLeft(), toggle.getPaddingTop(), pad, toggle.getPaddingBottom());
        row.addView(toggle);
        row.setOnClickListener(v -> toggle.setChecked(!toggle.isChecked()));
        return row;
    }

    private View sizeRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(MorpheSettings.sizeLabel(MorpheSettings.sizeIndex(activity)));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("Default size", "Default size is small for inline images."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.setOnClickListener(v -> {
            int next = (MorpheSettings.sizeIndex(activity) + 1) % 3;
            MorpheSettings.saveSize(activity, next);
            value.setText(MorpheSettings.sizeLabel(next));
        });
        return row;
    }

    private View limitRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(MorpheSettings.limitLabel(MorpheSettings.mediaLimitMb(activity)));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("GIF size limit", "GIFs over this size will show paused as with autoplay setting."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.setOnClickListener(v -> pickLimit(activity, value));
        return row;
    }

    private void pickLimit(Activity activity, TextView value) {
        String[] labels = {"5 MB", "10 MB", "25 MB", "50 MB", "100 MB", "Unlimited", "Custom"};
        int[] values = {5, 10, 25, 50, 100, -1};
        new android.app.AlertDialog.Builder(activity)
                .setTitle("GIF size limit")
                .setItems(labels, (dialog, which) -> {
                    if (which == labels.length - 1) {
                        customLimit(activity, value);
                        return;
                    }
                    MorpheSettings.saveLimit(activity, values[which]);
                    value.setText(MorpheSettings.limitLabel(values[which]));
                })
                .show();
    }

    private void customLimit(Activity activity, TextView value) {
        android.widget.EditText input = new android.widget.EditText(activity);
        input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        input.setHint("Megabytes");
        int current = MorpheSettings.mediaLimitMb(activity);
        if (current > 0) input.setText(String.valueOf(current));
        int pad = Math.round(20 * activity.getResources().getDisplayMetrics().density);
        input.setPadding(pad, pad, pad, pad);
        new android.app.AlertDialog.Builder(activity)
                .setTitle("Custom limit")
                .setView(input)
                .setPositiveButton("Save", (dialog, which) -> {
                    try {
                        int mb = Integer.parseInt(input.getText().toString().trim());
                        if (mb < 1) return;
                        MorpheSettings.saveLimit(activity, mb);
                        value.setText(MorpheSettings.limitLabel(mb));
                    } catch (NumberFormatException ignored) {
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private LinearLayout labels(String titleText, String subtitle) {
        float density = getResources().getDisplayMetrics().density;
        int margin = Math.round(16 * density);
        LinearLayout text = new LinearLayout(this);
        text.setOrientation(LinearLayout.VERTICAL);
        text.setPadding(margin, 0, margin, 0);
        TextView main = new TextView(this);
        main.setText(titleText);
        main.setTextColor(textColor);
        main.setTextSize(15);
        TextView subView = new TextView(this);
        subView.setText(subtitle);
        subView.setTextColor(sub);
        subView.setTextSize(12);
        text.addView(main);
        text.addView(subView);
        return text;
    }

    private LinearLayout rowShell(Activity activity) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(Math.round(52 * activity.getResources().getDisplayMetrics().density));
        row.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        TypedValue background = new TypedValue();
        activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, background, true);
        row.setBackgroundResource(background.resourceId);
        return row;
    }

    private CompoundButton materialSwitch(Activity activity) {
        try {
            Object created = Class.forName("com.google.android.material.materialswitch.MaterialSwitch")
                    .getConstructor(Context.class)
                    .newInstance(activity);
            if (created instanceof CompoundButton) return (CompoundButton) created;
        } catch (Throwable ignored) {
        }
        return new android.widget.Switch(activity);
    }

    private void readTheme(Activity activity) {
        try {
            Class<?> themes = Class.forName("ec.m");
            Object theme = themes.getMethod("d", Context.class).invoke(null, activity);
            canvas = color(theme, "b", canvas);
            card = color(theme, "k", card);
            title = color(theme, "n", title);
            textColor = color(theme, "e", textColor);
            sub = color(theme, "m", sub);
        } catch (Throwable ignored) {
        }
    }

    private static int color(Object theme, String method, int fallback) {
        try {
            Object value = theme.getClass().getMethod(method).invoke(theme);
            if (value instanceof Integer) return (Integer) value;
        } catch (Throwable ignored) {
        }
        return fallback;
    }
}
