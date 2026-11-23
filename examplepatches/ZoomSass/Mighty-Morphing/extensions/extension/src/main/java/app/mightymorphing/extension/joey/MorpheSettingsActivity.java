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
        toolbar.setBackgroundColor(modernTheme(activity) ? ModernUi.getPalette(activity).primary : card);
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
                    "Previews on profile comments",
                    MorpheSettings.profileCommentsEnabled(activity),
                    (button, checked) -> MorpheSettings.saveProfile(activity, checked));
            youtubeRow = toggleRow(activity, "YouTube inline preview",
                    "Play YouTube links in the comment",
                    MorpheSettings.youtubeInline(activity),
                    (button, checked) -> MorpheSettings.saveYoutubeInline(activity, checked));
            autoplayRow = toggleRow(activity, "Autoplay GIFs",
                    "Play GIFs automatically, or start them paused",
                    MorpheSettings.autoplay(activity),
                    (button, checked) -> {
                        MorpheSettings.saveAutoplay(activity, checked);
                        applyCommentRows(activity);
                    });
            sizeRow = sizeRow(activity);
            limitRow = limitRow(activity);
            handleRow = toggleRow(activity, "Invisible handle", "Hide the corner handle. Dragging still resizes",
                    MorpheSettings.invisibleHand(activity),
                    (button, checked) -> MorpheSettings.saveInvisibleHand(activity, checked));
            dragRow = toggleRow(activity, "Drag to resize", "Drag a comment image to change its size",
                    MorpheSettings.resizeEnabled(activity),
                    (button, checked) -> {
                        MorpheSettings.saveResize(activity, checked);
                        applyCommentRows(activity);
                    });
            sheet.addView(toggleRow(activity, "Inline previews",
                    "Pictures, GIFs and Reddit videos in comments",
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
        if (MorpheSettings.undeleteControls()) {
            LinearLayout removed = new LinearLayout(activity);
            removed.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(removed, activity, density);
            removed.setLayoutParams(cardLayoutParams(activity, density));
            removed.addView(sectionTitle(activity, "Removed content"));
            removed.addView(toggleRow(activity, "Restore via Arctic Shift",
                    "Adds a Restore button to removed posts and comments",
                    MorpheSettings.undelete(activity),
                    (button, checked) -> MorpheSettings.saveUndelete(activity, checked)));
            column.addView(removed);
        }
        if (MorpheSettings.mediaEnhancementControls()) {
            // Shared by Modern UI and Media enhancements, and live in both looks.
            LinearLayout media = new LinearLayout(activity);
            media.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(media, activity, density);
            media.setLayoutParams(cardLayoutParams(activity, density));
            media.addView(sectionTitle(activity, "Media"));
            media.addView(actionRow(activity, "Downloads",
                    "File name and folder for saved media",
                    () -> MediaDownload.show(activity)));
            View controlsOnOpen = toggleRow(activity, "Hide controls on open",
                    "Open media without icons or the seekbar",
                    ModernUi.hideControlsOnOpen(activity),
                    (btn, checked) -> ModernUi.setHideControlsOnOpen(activity, checked));
            controlsOnOpen.setVisibility(ModernUi.fullscreenMedia(activity) ? View.VISIBLE : View.GONE);
            media.addView(toggleRow(activity, "Full screen media",
                    "Media fills the screen, camera area included",
                    ModernUi.fullscreenMedia(activity),
                    (btn, checked) -> {
                        ModernUi.setFullscreenMedia(activity, checked);
                        controlsOnOpen.setVisibility(checked ? View.VISIBLE : View.GONE);
                    }));
            media.addView(controlsOnOpen);
            media.addView(toggleRow(activity, "Album viewer",
                    "Counter, captions and a thumbnail strip",
                    ModernUi.albumViewer(activity),
                    (btn, checked) -> ModernUi.setAlbumViewer(activity, checked)));
            media.addView(toggleRow(activity, "Swipe albums closed",
                    "Swipe diagonally to leave an album",
                    ModernUi.albumSwipe(activity),
                    (btn, checked) -> ModernUi.setAlbumSwipe(activity, checked)));
            column.addView(media);
        }
        if (MorpheSettings.modernUiControls()) {
            LinearLayout themeCard = new LinearLayout(activity);
            themeCard.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(themeCard, activity, density);
            themeCard.setLayoutParams(cardLayoutParams(activity, density));
            themeCard.addView(sectionTitle(activity, "Appearance"));
            boolean classic = ModernUi.isClassic(activity);
            themeCard.addView(confirmToggle(activity, "Classic Joey",
                    "Joey's own theme, fonts and post style",
                    classic,
                    "Enable classic UI?",
                    "Use the Modern look?",
                    checked -> ModernUi.setClassicUi(activity, checked)));
            View theme = materialAccentRow(activity);
            View fonts = fontsRow(activity);
            View bird = confirmToggle(activity, "Sidebar bird",
                    "Joey's bird in the account header",
                    ModernUi.sidebarBird(activity),
                    "Show the Joey bird?",
                    "Hide the Joey bird?",
                    checked -> ModernUi.setSidebarBird(activity, checked));
            greyRow(theme, !classic);
            greyRow(fonts, !classic);
            themeCard.addView(theme);
            themeCard.addView(fonts);
            if (SeasonalBanner.isEnabled()) themeCard.addView(seasonalRow(activity));
            else if (!classic) themeCard.addView(bird);
            if (MorpheSplash.isEnabled()) themeCard.addView(splashRow(activity));
            column.addView(themeCard);

            // Posts: Modern UI's own settings, always here whatever else is patched.
            LinearLayout postCard = new LinearLayout(activity);
            postCard.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(postCard, activity, density);
            postCard.setLayoutParams(cardLayoutParams(activity, density));
            postCard.addView(sectionTitle(activity, "Posts"));
            View layout = choiceRow(activity, "Post layout", "Flat list, or a card for each post",
                    PostLayout.layoutBlurb(), value -> PostLayout.showLayout(activity, value));
            View image = choiceRow(activity, "Image style", "Picture, or a thumbnail beside the title",
                    PostLayout.imageBlurb(), value -> PostLayout.showImage(activity, value));
            View details = postDetailsRow(activity);
            View chips = subredditChipsRow(activity);
            greyRow(layout, !classic);
            greyRow(image, !classic);
            greyRow(details, !classic);
            greyRow(chips, !classic);
            postCard.addView(layout);
            postCard.addView(image);
            postCard.addView(details);
            postCard.addView(chips);
            if (!classic) {
                postCard.addView(actionRow(activity, "Reset layout settings",
                        "Resets Joey's layout settings, but only while Modern UI is on. Turning Classic Joey on "
                                + "above, or patching without Modern UI, uses your normal layout settings.",
                        () -> confirmLayoutReset(activity)));
                if (ModernSettings.canUndo(activity)) {
                    postCard.addView(actionRow(activity, "Undo layout reset",
                            "Restores your layout settings from before the reset",
                            () -> ModernSettings.undo(activity)));
                }
            }
            column.addView(postCard);
        } else {
            if (MorpheSplash.isEnabled() || SeasonalBanner.isEnabled()) {
                LinearLayout appearance = new LinearLayout(activity);
                appearance.setOrientation(LinearLayout.VERTICAL);
                applyCardContainer(appearance, activity, density);
                appearance.setLayoutParams(cardLayoutParams(activity, density));
                appearance.addView(sectionTitle(activity, "Appearance"));
                if (SeasonalBanner.isEnabled()) appearance.addView(seasonalRow(activity));
                if (MorpheSplash.isEnabled()) appearance.addView(splashRow(activity));
                column.addView(appearance);
            }
        }
        if (MorpheSettings.showHideControls()) {
            LinearLayout showHide = new LinearLayout(activity);
            showHide.setOrientation(LinearLayout.VERTICAL);
            applyCardContainer(showHide, activity, density);
            showHide.setLayoutParams(cardLayoutParams(activity, density));
            showHide.addView(sectionTitle(activity, "Show and hide"));
            showHide.addView(actionRow(activity, "Text formatting bar", "Buttons shown when you write a post or comment",
                    () -> EditorBar.show(activity)));
            showHide.addView(actionRow(activity, "Sidebar",
                    "Entries shown in the left menu",
                    () -> Sidebar.show(activity)));
            showHide.addView(actionRow(activity, "Subreddit bar", "Icons on the top bar, and their order",
                    () -> SubredditToolbar.show(activity)));
            View postBar = actionRow(activity, "Post buttons & menu", "Buttons under each post and in its \u22ee menu",
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
            backup.addView(actionRow(activity, "Backup settings", "Save the settings you pick to a file",
                    () -> MorpheBackup.backup(activity)));
            backup.addView(actionRow(activity, "Restore settings", "Load settings from a backup file",
                    () -> MorpheBackup.restore(activity)));
            column.addView(backup);
        }

        LinearLayout help = new LinearLayout(activity);
        help.setOrientation(LinearLayout.VERTICAL);
        applyCardContainer(help, activity, density);
        help.setLayoutParams(cardLayoutParams(activity, density));
        help.addView(sectionTitle(activity, "Help"));
        help.addView(actionRow(activity, "Report a problem",
                "Build a report you can read, then send",
                () -> ProblemReport.show(activity)));
        column.addView(help);

        ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(true);
        scroll.addView(column, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return root;
    }

    private View sectionTitle(Activity activity, String text) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView heading = new TextView(activity);
        heading.setText(text);
        heading.setTextColor(title);
        heading.setTextSize(13);
        heading.setAllCaps(false);
        heading.setTypeface(heading.getTypeface(), android.graphics.Typeface.BOLD);
        heading.setPadding(Math.round(16 * density), Math.round(8 * density), Math.round(16 * density),
                Math.round(2 * density));
        return heading;
    }

    private interface ValueAction {
        void run(TextView value);
    }

    private void confirmLayoutReset(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Reset layout settings?",
                "Joey's post style, thumbnail, tab, comment and link display settings go back to their defaults "
                        + "in Modern, with the thumbnail on the right. Immersive and bottom navigation stay as they are. "
                        + "Classic keeps your settings. Undo is offered afterwards. Joey restarts.");
        android.app.AlertDialog[] shown = new android.app.AlertDialog[1];
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> shown[0].dismiss());
        TextView reset = MorpheDialog.action(activity, "Reset and restart", MorpheDialog.GOLD);
        reset.setOnClickListener(v -> {
            shown[0].dismiss();
            ModernSettings.reset(activity);
        });
        page.addView(MorpheDialog.actions(activity, cancel, reset));
        shown[0] = MorpheDialog.show(activity, page);
    }

    private View choiceRow(Activity activity, String titleText, String subtitle, String valueText,
                           ValueAction action) {
        LinearLayout row = rowShell(activity);
        row.addView(labels(titleText, subtitle), new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(valueText);
        value.setPadding(0, 0, Math.round(16 * activity.getResources().getDisplayMetrics().density), 0);
        row.addView(value);
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
        row.addView(labels("Default size", "Starting size for pictures in comments"),
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

    private LinearLayout labels(String titleText, String subtitle) {
        float density = getResources().getDisplayMetrics().density;
        int margin = Math.round(16 * density);
        LinearLayout text = new LinearLayout(this);
        text.setOrientation(LinearLayout.VERTICAL);
        text.setPadding(margin, 0, margin, 0);
        TextView main = new TextView(this);
        main.setText(titleText);
        main.setTextColor(textColor);
        main.setTextSize(14);
        TextView subView = new TextView(this);
        subView.setText(subtitle);
        subView.setTextColor(sub);
        subView.setTextSize(11.5f);
        subView.setPadding(0, Math.round(1 * density), 0, 0);
        text.addView(main);
        text.addView(subView);
        return text;
    }

    private LinearLayout rowShell(Activity activity) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        float density = activity.getResources().getDisplayMetrics().density;
        row.setMinimumHeight(Math.round(42 * density));
        row.setPadding(0, Math.round(4 * density), 0, Math.round(4 * density));
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

    /** Joey's own colours unless the Modern UI patch is installed and Classic is off. */
    private static boolean modernTheme(Activity activity) {
        return MorpheSettings.modernUiControls() && ModernUi.isModernUiEnabled(activity);
    }

    private void readTheme(Activity activity) {
        if (modernTheme(activity)) {
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
        // Room under the last row, so its text does not sit on the card's edge.
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(),
                Math.round(6 * density));
        if (modernTheme(activity)) {
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
        if (modernTheme(activity)) {
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
    private View seasonalRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(SeasonalBanner.summary(activity));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("Seasonal sidebar banner", "Hide it, use Joey's picture, or a bundled one."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> SeasonalBanner.show(activity, () ->
                value.setText(SeasonalBanner.summary(activity))));
        return row;
    }

    /** Modern's own fonts and sizes. Joey's Font settings row stays hidden in Modern. */
    private View fontsRow(Activity activity) {
        LinearLayout row = rowShell(activity);
        TextView value = new TextView(activity);
        value.setTextColor(title);
        value.setTextSize(15);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setText(ModernFonts.summary(activity));
        int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
        value.setPadding(0, 0, pad, 0);
        row.addView(labels("Fonts", "Font and size for titles, comments, and post info."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> ModernFonts.show(activity, () ->
                value.setText(ModernFonts.summary(activity))));
        return row;
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
        row.addView(labels("Theme Manager", "Colour for the feed, bars, and buttons."),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(value);
        row.addView(chevron(activity));
        row.setOnClickListener(v -> pickMaterialAccent(activity, value));
        return row;
    }

    private String accentLabel(String accent) {
        return ModernTheme.name(this, accent);
    }

    private View subredditChipsRow(Activity activity) {
        return actionRow(activity, "Subreddit buttons",
                "Sort, Join and Community info, and their order",
                () -> ModernUi.showChips(activity));
    }

    private View postDetailsRow(Activity activity) {
        return actionRow(activity, "Post info line",
                "The line under the title: subreddit, points, author, time and more, and their order.",
                () -> PostLayout.showDetails(activity));
    }

    private void pickMaterialAccent(Activity activity, TextView value) {
        ThemeStudio.show(activity, () -> {
            String active = ModernUi.getMaterialAccent(activity);
            if (ModernUi.isPureAmoled(activity) && !ModernUi.ACCENT_AMOLED.equalsIgnoreCase(active)) {
                active = ModernUi.ACCENT_AMOLED;
            }
            value.setText(accentLabel(active));
        });
    }

}
