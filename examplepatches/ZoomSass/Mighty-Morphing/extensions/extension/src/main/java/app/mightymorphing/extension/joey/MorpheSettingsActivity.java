package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
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
        toolbar.setBackgroundColor(ModernUi.isModernUiEnabled(activity) ? ModernUi.getPalette(activity).primary : card);
        toolbar.setTitle("Morphe Settings");
        toolbar.setTitleTextColor(textColor);
        int back = activity.getResources().getIdentifier(
                "abc_ic_ab_back_material", "drawable", activity.getPackageName());
        if (back == 0) back = android.R.drawable.ic_media_previous;
        toolbar.setNavigationIcon(back);
        Drawable icon = toolbar.getNavigationIcon();
        if (icon != null) icon.setColorFilter(textColor, PorterDuff.Mode.SRC_IN);
        toolbar.setNavigationOnClickListener(v -> close.run());
        root.addView(toolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.round(56 * density)));

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(canvas);
        if (MorpheSettings.pictureControls()) {
            LinearLayout sheet = new LinearLayout(activity);
            sheet.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(sheet, activity, density);
            sheet.setLayoutParams(cardLayoutParams(activity, density));
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
            sheet.addView(profileRow);
            sheet.addView(youtubeRow);
            sheet.addView(autoplayRow);
            sheet.addView(limitRow);
            sheet.addView(sizeRow);
            sheet.addView(dragRow);
            sheet.addView(handleRow);
            applyCommentRows(activity);
            column.addView(sheet);
        }
        if (MorpheSettings.modernUiControls()) {
            LinearLayout themeCard = new LinearLayout(activity);
            themeCard.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(themeCard, activity, density);
            themeCard.setLayoutParams(cardLayoutParams(activity, density));
            themeCard.addView(sectionTitle(activity, "Appearance"));
            boolean classic = ModernUi.isClassic(activity);
            themeCard.addView(confirmToggle(activity, "Classic Joey",
                    "Joey's own theme, fonts, and post style.",
                    classic,
                    "Enable classic UI?",
                    "Use the Modern look?",
                    checked -> ModernUi.setClassicUi(activity, checked)));
            View theme = materialAccentRow(activity);
            View posts = groupLabel(activity, "Posts");
            View image = choiceRow(activity, "Image style", PostLayout.imageBlurb(),
                    value -> PostLayout.showImage(activity, value));
            View details = postDetailsRow(activity);
            View chips = subredditChipsRow(activity);
            View downloads = actionRow(activity, "Downloads",
                    "A picture, GIF, or video saves straight away. Set the file name and the folder.",
                    () -> MediaDownload.show(activity));
            View albums = toggleRow(activity, "Swipe albums closed",
                    "A diagonal swipe leaves an album, the same way a picture closes. Straight up and down still move between pictures.",
                    ModernUi.albumSwipe(activity),
                    (btn, checked) -> ModernUi.setAlbumSwipe(activity, checked));
            View bird = confirmToggle(activity, "Sidebar bird",
                    "Joey's bird in the account header.",
                    ModernUi.sidebarBird(activity),
                    "Show the Joey bird?",
                    "Hide the Joey bird?",
                    checked -> ModernUi.setSidebarBird(activity, checked));
            greyRow(theme, !classic);
            greyRow(posts, !classic);
            greyRow(image, !classic);
            greyRow(details, !classic);
            greyRow(chips, !classic);
            greyRow(downloads, !classic);
            greyRow(albums, !classic);
            themeCard.addView(theme);
            themeCard.addView(posts);
            themeCard.addView(image);
            if (!MorpheSettings.showHideControls()) {
                themeCard.addView(details);
                themeCard.addView(chips);
            }
            themeCard.addView(downloads);
            themeCard.addView(albums);
            if (!classic) themeCard.addView(bird);
            if (MorpheSplash.isEnabled()) themeCard.addView(splashRow(activity));
            column.addView(themeCard);
        } else if (MorpheSplash.isEnabled()) {
            LinearLayout splashCard = new LinearLayout(activity);
            splashCard.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(splashCard, activity, density);
            splashCard.setLayoutParams(cardLayoutParams(activity, density));
            splashCard.addView(splashRow(activity));
            column.addView(splashCard);
        }
        if (MorpheSettings.showHideControls()) {
            LinearLayout showHide = new LinearLayout(activity);
            showHide.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(showHide, activity, density);
            showHide.setLayoutParams(cardLayoutParams(activity, density));
            showHide.addView(sectionTitle(activity, "Show and hide"));
            showHide.addView(actionRow(activity, "Text formatting bar", "Which buttons show when you write a post or comment.",
                    () -> EditorBar.show(activity)));
            showHide.addView(actionRow(activity, "Sidebar",
                    "Which entries show in the left menu. Some items can't be turned on or off.",
                    () -> Sidebar.show(activity)));
            showHide.addView(actionRow(activity, "Subreddit bar", "What sits on the subreddit bar, and the order.",
                    () -> SubredditToolbar.show(activity)));
            if (MorpheSettings.modernUiControls()) {
                View chipOrder = subredditChipsRow(activity);
                View detailOrder = postDetailsRow(activity);
                greyRow(chipOrder, ModernUi.isModernUiEnabled(activity));
                greyRow(detailOrder, ModernUi.isModernUiEnabled(activity));
                showHide.addView(chipOrder);
                showHide.addView(detailOrder);
            }
            View postBar = actionRow(activity, "Post bar", "What stays on a post, and what moves into its menu.",
                    () -> PostLayout.showActions(activity));
            if (MorpheSettings.modernUiControls()) greyRow(postBar, ModernUi.isModernUiEnabled(activity));
            showHide.addView(postBar);
            column.addView(showHide);
        }

        if (MorpheSettings.backupControls()) {
            LinearLayout backup = new LinearLayout(activity);
            backup.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(backup, activity, density);
            backup.setLayoutParams(cardLayoutParams(activity, density));
            backup.addView(sectionTitle(activity, "Backup"));
            backup.addView(actionRow(activity, "Backup settings", "Save the settings you pick to a file.",
                    () -> MorpheBackup.backup(activity)));
            backup.addView(actionRow(activity, "Restore settings", "Load settings from a backup file.",
                    () -> MorpheBackup.restore(activity)));
            column.addView(backup);
        }

        // Modern UI owns the viewer and does not offer this toggle. Another patch must not
        // delete a row on Modern UI's behalf: that fails if the patches are not both applied.
        if (!MorpheSettings.modernUiControls()) dropRow(column, "Full screen media");

        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.addView(column, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return root;
    }

    private View groupLabel(Activity activity, String text) {
        TextView label = new TextView(activity);
        label.setText(text);
        label.setTextColor(sub);
        label.setTextSize(12);
        int side = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        label.setPadding(side, Math.round(8 * activity.getResources().getDisplayMetrics().density), side, 0);
        return label;
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

    private interface ValueAction {
        void run(TextView value);
    }

    private View choiceRow(Activity activity, String titleText, String subtitle, ValueAction action) {
        LinearLayout row = rowShell(activity);
        LinearLayout text = labels(titleText, subtitle);
        TextView value = (TextView) text.getChildAt(1);
        row.addView(text, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(chevron(activity));
        row.setOnClickListener(v -> action.run(value));
        return row;
    }

    private View actionRow(Activity activity, String titleText, String subtitle, Runnable action) {
        LinearLayout row = rowShell(activity);
        row.addView(labels(titleText, subtitle), new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(chevron(activity));
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

    private interface Choice {
        void save(boolean checked);
    }

    /** The switch asks before it is saved, then restarts. Cancel puts the switch back. */
    private View confirmToggle(Activity activity, String titleText, String subtitle, boolean checked,
                               String enableTitle, String disableTitle, Choice save) {
        boolean[] ignore = { false };
        return toggleRow(activity, titleText, subtitle, checked, (button, now) -> {
            if (ignore[0] || now == checked) return;
            LinearLayout page = MorpheDialog.page(activity, now ? enableTitle : disableTitle, null);
            TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
            TextView apply = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
            page.addView(MorpheDialog.actions(activity, cancel, apply));
            AlertDialog dialog = MorpheDialog.show(activity, page);
            boolean[] applied = { false };
            cancel.setOnClickListener(v -> dialog.dismiss());
            apply.setOnClickListener(v -> {
                applied[0] = true;
                save.save(now);
                ModernUi.restartApp(activity);
            });
            dialog.setOnDismissListener(d -> {
                if (applied[0]) return;
                ignore[0] = true;
                button.setChecked(checked);
                ignore[0] = false;
            });
        });
    }

    /** Leaves the row in place and stops it being changed. */
    private void greyRow(View row, boolean enabled) {
        row.setAlpha(enabled ? 1f : 0.38f);
        row.setEnabled(enabled);
        if (row instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) row;
            group.setClickable(enabled);
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                child.setEnabled(enabled);
                child.setClickable(enabled);
            }
        }
    }

    private void setRowEnabled(View row, boolean enabled) {
        row.setVisibility(enabled ? View.VISIBLE : View.GONE);
        row.setEnabled(enabled);
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
        row.addView(labels("Default size", "Starting size for pictures in comments."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
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
        row.addView(labels("GIF size limit", "GIFs over this size stay paused."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> pickLimit(activity, value));
        return row;
    }

    private void pickLimit(Activity activity, TextView value) {
        String[] labels = {"5 MB", "10 MB", "25 MB", "50 MB", "100 MB", "Unlimited", "Custom"};
        int[] values = {5, 10, 25, 50, 100, -1};
        MorpheDialog.choices(activity, "GIF size limit", labels, -1, which -> {
            if (which == labels.length - 1) {
                customLimit(activity, value);
                return;
            }
            MorpheSettings.saveLimit(activity, values[which]);
            value.setText(MorpheSettings.limitLabel(values[which]));
        });
    }

    private void customLimit(Activity activity, TextView value) {
        android.widget.EditText input = new android.widget.EditText(activity);
        input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        input.setHint("Megabytes");
        int current = MorpheSettings.mediaLimitMb(activity);
        if (current > 0) input.setText(String.valueOf(current));
        int pad = Math.round(20 * activity.getResources().getDisplayMetrics().density);
        input.setPadding(pad, pad, pad, pad);
        LinearLayout page = MorpheDialog.page(activity, "Custom limit", "Megabytes");
        input.setTextColor(MorpheDialog.TEXT);
        page.addView(input);
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        TextView save = MorpheDialog.action(activity, "Save", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, cancel, save));
        android.app.AlertDialog[] shown = new android.app.AlertDialog[1];
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        save.setOnClickListener(v -> {
            try {
                int mb = Integer.parseInt(input.getText().toString().trim());
                if (mb < 1) return;
                MorpheSettings.saveLimit(activity, mb);
                value.setText(MorpheSettings.limitLabel(mb));
            } catch (NumberFormatException ignored) {
            }
            if (shown[0] != null) shown[0].dismiss();
        });
        shown[0] = MorpheDialog.show(activity, page);
    }

    /** Drops a settings row by its title. Missing rows are left alone. */
    private static void dropRow(ViewGroup group, String title) {
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View child = group.getChildAt(i);
            if (!(child instanceof ViewGroup)) continue;
            boolean row = child instanceof LinearLayout
                    && ((LinearLayout) child).getOrientation() == LinearLayout.HORIZONTAL;
            if (row && hasText((ViewGroup) child, title)) group.removeViewAt(i);
            else dropRow((ViewGroup) child, title);
        }
    }

    private static boolean hasText(ViewGroup group, String title) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof TextView && title.contentEquals(((TextView) child).getText())) return true;
            if (child instanceof ViewGroup && hasText((ViewGroup) child, title)) return true;
        }
        return false;
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
            if (created instanceof CompoundButton) return tintSwitch(activity, (CompoundButton) created);
        } catch (Throwable ignored) {
        }
        return tintSwitch(activity, new android.widget.Switch(activity));
    }

    private CompoundButton tintSwitch(Activity activity, CompoundButton toggle) {
        if (Build.VERSION.SDK_INT < 21) return toggle;
        int on = title;
        int offThumb = sub;
        int offTrack = 0x66FFFFFF & sub | 0x33000000;
        android.content.res.ColorStateList thumb = new android.content.res.ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{on, offThumb});
        android.content.res.ColorStateList track = new android.content.res.ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{on & 0x00FFFFFF | 0x66000000, offTrack});
        try {
            toggle.getClass().getMethod("setThumbTintList", android.content.res.ColorStateList.class)
                    .invoke(toggle, thumb);
            toggle.getClass().getMethod("setTrackTintList", android.content.res.ColorStateList.class)
                    .invoke(toggle, track);
        } catch (Throwable ignored) {
            toggle.setButtonTintList(thumb);
        }
        return toggle;
    }

    private TextView chevron(Activity activity) {
        TextView mark = new TextView(activity);
        mark.setText("›");
        mark.setTextColor(sub);
        mark.setTextSize(22);
        mark.setGravity(Gravity.CENTER_VERTICAL);
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        mark.setPadding(0, 0, pad, 0);
        return mark;
    }

    private void readTheme(Activity activity) {
        if (ModernUi.isModernUiEnabled(activity)) {
            ModernUi.Palette palette = ModernUi.getPalette(activity);
            canvas = palette.canvas;
            card = palette.container;
            title = palette.accent;
            textColor = palette.onSurface;
            sub = palette.onSurfaceVariant;
            return;
        }
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

    private void applyCardContainer(View view, Activity activity, float density) {
        if (ModernUi.isModernUiEnabled(activity)) {
            ModernUi.Palette palette = ModernUi.getPalette(activity);
            GradientDrawable gd = new GradientDrawable();
            gd.setCornerRadius(16f * density);
            gd.setColor(palette.container);
            gd.setStroke(Math.max(1, Math.round(1f * density)), palette.outline);
            view.setBackground(gd);
            if (Build.VERSION.SDK_INT >= 21) {
                view.setClipToOutline(true);
            }
        } else {
            view.setBackgroundColor(card);
        }
    }

    private LinearLayout.LayoutParams cardLayoutParams(Activity activity, float density) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        if (ModernUi.isModernUiEnabled(activity)) {
            int marginH = Math.round(12 * density);
            int marginV = Math.round(6 * density);
            params.setMargins(marginH, marginV, marginH, marginV);
        } else {
            params.topMargin = Math.round(12 * density);
        }
        return params;
    }

    private static int color(Object theme, String method, int fallback) {
        try {
            Object value = theme.getClass().getMethod(method).invoke(theme);
            if (value instanceof Integer) return (Integer) value;
        } catch (Throwable ignored) {
        }
        return fallback;
    }
    private View splashRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(MorpheSplash.summary(activity));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("Splash", "Logo, colour, and animation."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> MorpheSplash.showPicker(activity, () ->
                value.setText(MorpheSplash.summary(activity))));
        return row;
    }

    private View materialAccentRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        String active = ModernUi.getMaterialAccent(activity);
        if (ModernUi.isPureAmoled(activity) && !ModernUi.ACCENT_AMOLED.equalsIgnoreCase(active)) {
            active = ModernUi.ACCENT_AMOLED;
        }
        value.setText(accentLabel(active));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("Theme", "Colour for the feed, bars, and buttons."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> pickMaterialAccent(activity, value));
        return row;
    }

    private String accentLabel(String accent) {
        if (ModernUi.ACCENT_TEAL.equalsIgnoreCase(accent)) return "Aqua";
        if (ModernUi.ACCENT_PURPLE.equalsIgnoreCase(accent)) return "Purple";
        if (ModernUi.ACCENT_CORAL.equalsIgnoreCase(accent)) return "Coral";
        if (ModernUi.ACCENT_MINT.equalsIgnoreCase(accent)) return "Mint";
        if (ModernUi.ACCENT_GOLD.equalsIgnoreCase(accent)) return "Gold";
        if (ModernUi.ACCENT_AMBER.equalsIgnoreCase(accent)) return "Amber";
        if (ModernUi.ACCENT_BLACK.equalsIgnoreCase(accent)) return "Black";
        if (ModernUi.ACCENT_MONET.equalsIgnoreCase(accent)) return "Sky";
        if (ModernUi.ACCENT_AMOLED.equalsIgnoreCase(accent)) return "AMOLED black";
        return "Blue";
    }

    private View subredditChipsRow(Activity activity) {
        return actionRow(activity, "Subreddit chips",
                "Sort, Join, and Community info. Hide takes a chip off the row.",
                () -> ModernUi.showChips(activity));
    }

    private View postDetailsRow(Activity activity) {
        return actionRow(activity, "Post details",
                "What shows under the title, and the order. Joey's own line until you change it.",
                () -> PostLayout.showDetails(activity));
    }

    private void pickMaterialAccent(Activity activity, TextView value) {
        ModernUi.showSettingsThemePicker(activity, () -> {
            String active = ModernUi.getMaterialAccent(activity);
            if (ModernUi.isPureAmoled(activity) && !ModernUi.ACCENT_AMOLED.equalsIgnoreCase(active)) {
                active = ModernUi.ACCENT_AMOLED;
            }
            value.setText(accentLabel(active));
        });
    }

}
