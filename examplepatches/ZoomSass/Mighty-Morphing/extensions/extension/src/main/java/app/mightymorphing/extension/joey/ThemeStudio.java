package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * The Modern theme popup: a live preview you tap to change a colour, the theme list, light and
 * dark, the sliders, My themes and icon packs. Every change is saved at once and other screens
 * repaint. The screen that opened the popup repaints when it closes.
 */
final class ThemeStudio {
    /** Roles in the order they are numbered, on the preview and in every list. */
    private static final int[] ORDER = {
            ModernTheme.BACKGROUND, ModernTheme.CARDS, ModernTheme.RAISED, ModernTheme.TOOLBAR,
            ModernTheme.DRAWER, ModernTheme.DIVIDERS, ModernTheme.TEXT, ModernTheme.READ,
            ModernTheme.SECONDARY, ModernTheme.ACCENT, ModernTheme.LINKS, ModernTheme.PINNED,
            ModernTheme.ON_ACCENT, ModernTheme.UPVOTE, ModernTheme.DOWNVOTE, ModernTheme.HIDDEN_AVATAR,
            ModernTheme.VIDEO_PLAYED, ModernTheme.VIDEO_BUFFERED, ModernTheme.VIDEO_UNPLAYED,
            ModernTheme.VIDEO_BUTTONS, ModernTheme.VIDEO_VOLUME,
    };
    private static final String[] TAB_NAMES = {"Feed", "Post", "Comments", "Drawer", "Media", "Controls"};
    private static final int T_FEED = 0;
    private static final int T_POST = 1;
    private static final int T_COMMENTS = 2;
    private static final int T_DRAWER = 3;
    private static final int T_MEDIA = 4;
    private static final int T_CONTROLS = 5;
    /** The colours each tab shows, in the order they are numbered on its preview. */
    private static final int[][] TAB_ROLES = {
            {ModernTheme.BACKGROUND, ModernTheme.CARDS, ModernTheme.RAISED, ModernTheme.TOOLBAR, ModernTheme.DIVIDERS,
                    ModernTheme.TEXT, ModernTheme.READ, ModernTheme.SECONDARY, ModernTheme.ACCENT, ModernTheme.LINKS,
                    ModernTheme.PINNED, ModernTheme.ON_ACCENT, ModernTheme.UPVOTE, ModernTheme.DOWNVOTE},
            {ModernTheme.BACKGROUND, ModernTheme.CARDS, ModernTheme.RAISED, ModernTheme.TOOLBAR, ModernTheme.DIVIDERS,
                    ModernTheme.TEXT, ModernTheme.SECONDARY, ModernTheme.ACCENT, ModernTheme.LINKS,
                    ModernTheme.UPVOTE, ModernTheme.DOWNVOTE},
            {ModernTheme.BACKGROUND, ModernTheme.CARDS, ModernTheme.RAISED, ModernTheme.TOOLBAR, ModernTheme.TEXT,
                    ModernTheme.SECONDARY, ModernTheme.LINKS, ModernTheme.HIDDEN_AVATAR},
            {ModernTheme.DRAWER, ModernTheme.BACKGROUND, ModernTheme.RAISED, ModernTheme.DIVIDERS, ModernTheme.TEXT,
                    ModernTheme.SECONDARY, ModernTheme.ACCENT},
            {ModernTheme.VIDEO_PLAYED, ModernTheme.VIDEO_BUFFERED, ModernTheme.VIDEO_UNPLAYED,
                    ModernTheme.VIDEO_BUTTONS, ModernTheme.VIDEO_VOLUME},
            {ModernTheme.ACCENT, ModernTheme.ON_ACCENT, ModernTheme.RAISED, ModernTheme.DIVIDERS, ModernTheme.TEXT,
                    ModernTheme.SECONDARY, ModernTheme.LINKS, ModernTheme.PINNED, ModernTheme.UPVOTE, ModernTheme.DOWNVOTE},
    };
    private static final String[] ORIGINAL = {
            ModernUi.ACCENT_BLUE, ModernUi.ACCENT_TEAL, ModernUi.ACCENT_PURPLE, ModernUi.ACCENT_CORAL,
            ModernUi.ACCENT_MINT, ModernUi.ACCENT_GOLD, ModernUi.ACCENT_AMBER, ModernUi.ACCENT_BLACK,
            ModernUi.ACCENT_AMOLED,
    };

    private final Activity activity;
    private final Runnable changed;
    private final float density;
    private final LinearLayout root;
    private android.app.Dialog dialog;
    private boolean dirty;
    private boolean numbers = true;
    private int tab = T_FEED;
    private LinearLayout tabExtras;

    private java.util.Map<String, Object> snapshot;
    private String startId;
    private String startPack;
    private java.util.Map<String, String> baseline;

    private String id;
    private boolean light;
    private ModernTheme.Tweaks tweaks;
    private FrameLayout previewHost;

    private ThemeStudio(Activity activity, Runnable changed) {
        this.activity = activity;
        this.changed = changed;
        this.density = activity.getResources().getDisplayMetrics().density;
        this.root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
    }

    static void show(Activity activity, Runnable changed) {
        if (activity == null) return;
        activity.closeOptionsMenu();
        new ThemeStudio(activity, changed).open();
    }

    private boolean wide() {
        return activity.getResources().getConfiguration().screenWidthDp >= 600;
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    private void open() {
        snapshot = ModernTheme.snapshotAll(activity);
        startPack = ModernIcons.saved(activity);
        build();
        startId = id;
        baseline = ModernTheme.themeState(activity, id);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        dialog = MorpheDialog.showFull(activity, root, wide() ? 1000 : 600, () -> {
            // Settings recreates the screen itself when it closes. Recreating here sent you back to
            // the main settings page.
            if (!dirty || changed != null) return;
            View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
            Runnable reload = () -> {
                if (!activity.isFinishing()) activity.recreate();
            };
            if (decor != null) decor.post(reload);
            else reload.run();
        });
        paintWindow();
    }

    /** The number a colour carries on the open tab, or 0 if it is not on this tab. */
    private int number(int role) {
        int[] roles = TAB_ROLES[tab];
        for (int i = 0; i < roles.length; i++) if (roles[i] == role) return i + 1;
        return 0;
    }

    private String label(int role) {
        int n = number(role);
        return n == 0 ? ModernTheme.LABELS[role] : n + " · " + ModernTheme.LABELS[role];
    }

    // ---------------------------------------------------------------------
    // Saving
    // ---------------------------------------------------------------------

    private void applied() {
        dirty = true;
        ModernUi.themeChanged(activity);
        if (changed != null) changed.run();
        build();
        paintWindow();
        if (popupRefresh != null) popupRefresh.run();
    }

    private void paintWindow() {
        if (dialog == null || dialog.getWindow() == null) return;
        dialog.getWindow().setBackgroundDrawable(rounded(ModernUi.getPalette(activity).container, 24));
    }

    private void select(String next) {
        // Leaving a theme drops what you changed on it. A saved theme of yours goes back to how
        // it was saved, a built-in one back to how it ships.
        if (id != null && !id.equalsIgnoreCase(next)) {
            ModernTheme.setThemeState(activity, id, ModernTheme.isMine(id) ? baseline : null);
        }
        ModernUi.applyAccent(activity, next);
        baseline = ModernTheme.themeState(activity, next);
        applied();
    }

    /** Undoes everything done since the Theme Manager opened. */
    private void cancel() {
        if (dirty) {
            ModernTheme.restoreAll(activity, snapshot);
            ModernIcons.save(activity, startPack);
            ModernUi.applyAccent(activity, startId);
            ModernUi.themeChanged(activity);
            if (changed != null) changed.run();
        }
        if (dialog != null) dialog.dismiss();
    }

    private static final int S_TUNING = 6;
    private static final String[] SCREEN_NAMES = {
            "Feed", "Post", "Comments", "Drawer", "Media viewer", "Controls and dialogs"};
    private static final String[] SCREEN_INFO = {
            "Cards, titles, votes, flairs", "The post page", "Threads and level colours",
            "The left menu", "The video player", "Buttons, switches, pinned"};
    private static final int[] ACCENTS = {
            0xFF4F8CFF, 0xFF2BB5A8, 0xFF9B6BFF, 0xFFFF6F61, 0xFF4CD9A0, 0xFFF2B01E,
    };
    private static final String G_MINE = "My themes";
    private static final String G_BUILTIN = "v2 themes";
    private static final String G_ORIGINAL = "v1 themes";

    private boolean advanced;
    private int screen = -1;
    private String group;
    private Runnable popupRefresh;

    // ---------------------------------------------------------------------
    // Layout
    // ---------------------------------------------------------------------

    /** A fixed frame: header, the body (which scrolls only if it must) and the footer. */
    private void build() {
        id = ModernUi.getMaterialAccent(activity);
        if (ModernUi.isPureAmoled(activity) && !ModernUi.ACCENT_AMOLED.equalsIgnoreCase(id)) id = ModernUi.ACCENT_AMOLED;
        light = ModernTheme.wantsLight(activity, id);
        tweaks = ModernTheme.tweaks(activity, id);
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        previewHost = null;
        tabExtras = null;

        root.removeAllViews();
        root.setBackgroundColor(Color.TRANSPARENT);
        root.setPadding(dp(18), dp(16), dp(18), dp(10));

        LinearLayout head = new LinearLayout(activity);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout titles = column();
        TextView heading = new TextView(activity);
        boolean onScreen = advanced && screen >= 0;
        heading.setText(!onScreen ? "Theme Manager" : screen == S_TUNING ? "Tuning" : SCREEN_NAMES[screen]);
        heading.setTextColor(ui.accent);
        heading.setTextSize(20);
        titles.addView(heading);
        TextView current = new TextView(activity);
        current.setText(ModernTheme.name(activity, id) + (light ? " · light" : " · dark")
                + (ModernTheme.hasChanges(activity, id) ? " · changed" : ""));
        current.setTextColor(ui.onSurfaceVariant);
        current.setTextSize(13);
        titles.addView(current);
        head.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        head.addView(modeToggle(ui));
        root.addView(head);

        LinearLayout content = column();
        content.setPadding(0, dp(8), 0, 0);
        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        if (!advanced) buildSimple(content, ui);
        else if (screen < 0) buildHome(content, ui);
        else if (screen == S_TUNING) buildTuning(content, ui);
        else buildScreen(content, ui);

        List<TextView> buttons = new ArrayList<>();
        if (advanced && screen >= 0) {
            TextView back = MorpheDialog.action(activity, "‹ Back", MorpheDialog.TEXT);
            back.setOnClickListener(v -> {
                screen = -1;
                build();
            });
            buttons.add(back);
        } else if (!advanced) {
            boolean mine = ModernTheme.isMine(id);
            TextView saveNew = MorpheDialog.action(activity, mine ? "Save as new" : "Save as my theme", MorpheDialog.TEXT);
            saveNew.setOnClickListener(v -> askName(mine ? "Save as new theme" : "Save as my theme",
                    ModernTheme.name(activity, id) + (mine ? " copy" : " (mine)"), name -> {
                String saved = ModernTheme.saveAsMine(activity, id, name);
                group = G_MINE;
                select(saved);
            }));
            buttons.add(saveNew);
            if (mine) {
                TextView save = MorpheDialog.action(activity, "Save", MorpheDialog.TEXT);
                save.setOnClickListener(v -> {
                    baseline = ModernTheme.themeState(activity, id);
                    android.widget.Toast.makeText(activity, "Theme saved",
                            android.widget.Toast.LENGTH_SHORT).show();
                });
                buttons.add(save);
            }
        }
        if (!(advanced && screen >= 0)) {
            TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
            cancel.setOnClickListener(v -> cancel());
            buttons.add(cancel);
        }
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        done.setOnClickListener(v -> {
            if (dialog != null) dialog.dismiss();
        });
        buttons.add(done);
        root.addView(MorpheDialog.actions(activity, buttons.toArray(new TextView[0])));
    }

    private LinearLayout column() {
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        return column;
    }

    private LinearLayout.LayoutParams grow() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
    }

    private android.widget.ScrollView scrolled(View inner) {
        android.widget.ScrollView scroll = new android.widget.ScrollView(activity);
        scroll.setFillViewport(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(inner, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return scroll;
    }

    /** Two panes on a wide screen (preview left, controls right). One column on a phone. */
    private LinearLayout panes(LinearLayout parent, View preview, View controls) {
        if (wide() && preview != null) {
            LinearLayout both = new LinearLayout(activity);
            both.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams leftLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f);
            leftLp.rightMargin = dp(16);
            both.addView(scrolled(preview), leftLp);
            both.addView(scrolled(controls), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
            parent.addView(both, grow());
            return both;
        }
        LinearLayout one = column();
        if (preview != null) one.addView(preview);
        one.addView(controls);
        parent.addView(scrolled(one), grow());
        return one;
    }

    private View modeToggle(ModernUi.Palette ui) {
        LinearLayout pill = new LinearLayout(activity);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setBackground(rounded(ui.containerHigh, 18));
        pill.setPadding(dp(3), dp(3), dp(3), dp(3));
        String[] names = {"Simple", "Advanced"};
        for (int i = 0; i < 2; i++) {
            boolean chosen = (i == 1) == advanced;
            boolean toAdvanced = i == 1;
            TextView chip = new TextView(activity);
            chip.setText(names[i]);
            chip.setTextSize(13);
            chip.setTypeface(chosen ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            chip.setTextColor(chosen ? ui.onAccent : ui.onSurfaceVariant);
            chip.setBackground(chosen ? rounded(ui.accent, 15) : null);
            chip.setPadding(dp(12), dp(6), dp(12), dp(6));
            chip.setOnClickListener(v -> {
                if (advanced == toAdvanced) return;
                advanced = toAdvanced;
                screen = -1;
                build();
            });
            pill.addView(chip);
        }
        return pill;
    }

    /** A tappable row: a title, a short value and an arrow. */
    private View linkRow(String title, String value, Runnable click, ModernUi.Palette ui) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setBackground(rounded(ui.containerHigh, 14));
        row.setPadding(dp(14), dp(12), dp(14), dp(12));
        TextView name = new TextView(activity);
        name.setText(title);
        name.setTextColor(ui.onSurface);
        name.setTextSize(15);
        row.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView right = new TextView(activity);
        right.setText(value == null || value.isEmpty() ? "›" : value + "  ›");
        right.setTextColor(ui.onSurfaceVariant);
        right.setTextSize(13);
        row.addView(right);
        row.setClickable(true);
        row.setOnClickListener(v -> click.run());
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        row.setLayoutParams(lp);
        return row;
    }

    // ---- Simple ------------------------------------------------------------

    private String[] idsFor(String which) {
        if (G_MINE.equals(which)) return ModernTheme.mineIds(activity).toArray(new String[0]);
        if (G_ORIGINAL.equals(which)) return ORIGINAL;
        String[] presets = new String[ModernTheme.THEMES.length];
        for (int i = 0; i < presets.length; i++) presets[i] = ModernTheme.THEMES[i].id;
        return presets;
    }

    private String groupOf(String option) {
        if (ModernTheme.isMine(option)) return G_MINE;
        for (String original : ORIGINAL) if (original.equalsIgnoreCase(option)) return G_ORIGINAL;
        return G_BUILTIN;
    }

    private void buildSimple(LinearLayout content, ModernUi.Palette ui) {
        if (group == null) group = groupOf(id);
        LinearLayout controls = column();

        List<String> groups = new ArrayList<>();
        groups.add(G_MINE);
        groups.add(G_BUILTIN);
        groups.add(G_ORIGINAL);
        HorizontalScrollView chipScroll = new HorizontalScrollView(activity);
        chipScroll.setHorizontalScrollBarEnabled(false);
        LinearLayout chips = new LinearLayout(activity);
        for (String name : groups) {
            boolean chosen = name.equals(group);
            TextView chip = new TextView(activity);
            chip.setText(name);
            chip.setTextSize(13);
            chip.setTypeface(chosen ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            chip.setTextColor(chosen ? ui.onAccent : ui.onSurfaceVariant);
            chip.setBackground(rounded(chosen ? ui.accent : ui.containerHigh, 16));
            chip.setPadding(dp(13), dp(7), dp(13), dp(7));
            chip.setOnClickListener(v -> {
                group = name;
                build();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(6);
            chips.addView(chip, lp);
        }
        chipScroll.addView(chips);
        controls.addView(chipScroll);

        HorizontalScrollView cardScroll = new HorizontalScrollView(activity);
        cardScroll.setHorizontalScrollBarEnabled(false);
        LinearLayout cards = column();
        cards.setPadding(0, dp(10), 0, dp(4));
        LinearLayout[] lines = {new LinearLayout(activity), new LinearLayout(activity)};
        for (LinearLayout line : lines) cards.addView(line);
        String[] ids = idsFor(group);
        int chosenIndex = -1;
        for (int i = 0; i < ids.length; i++) {
            if (ids[i].equalsIgnoreCase(id)) chosenIndex = i;
            lines[i % 2].addView(themeCard(ids[i], ui));
        }
        cardScroll.addView(cards);
        controls.addView(cardScroll);
        if (G_MINE.equals(group)) {
            controls.addView(note(ids.length == 0
                    ? "Nothing saved yet. Use Save as my theme below, or import a theme file."
                    : "Touch and hold a theme to rename it. ✕ deletes it.", ui));
            TextView importIt = MorpheDialog.action(activity, "Import", MorpheDialog.TEXT);
            importIt.setOnClickListener(v -> ThemeFiles.importFrom(activity, saved -> activity.runOnUiThread(() -> {
                group = G_MINE;
                select(saved);
            })));
            TextView exportIt = MorpheDialog.action(activity, "Export current", MorpheDialog.TEXT);
            exportIt.setOnClickListener(v -> {
                String text = ModernTheme.exportFile(activity, id);
                if (text != null) ThemeFiles.export(activity, ModernTheme.name(activity, id), text);
            });
            controls.addView(left(importIt, exportIt));
        }
        if (chosenIndex > 1) {
            int at = chosenIndex / 2;
            cardScroll.post(() -> {
                View shown = lines[0].getChildAt(at);
                if (shown != null) cardScroll.scrollTo(Math.max(0, shown.getLeft() - dp(24)), 0);
            });
        }

        controls.addView(MorpheDialog.section(activity, "Appearance", ui.accent));
        controls.addView(appearanceRow(ui));

        controls.addView(MorpheDialog.section(activity, "Accent", ui.accent));
        controls.addView(accentRow(ui));

        if (!light) {
            CheckBox black = MorpheDialog.check(activity, "AMOLED black background", tweaks.black, null);
            black.setOnCheckedChangeListener((b, on) -> {
                tweaks.black = on;
                ModernTheme.saveTweaks(activity, id, tweaks);
                applied();
            });
            controls.addView(black);
        }

        String pack = ModernIcons.saved(activity);
        controls.addView(linkRow("Icons", ModernIcons.NAMES[ModernIcons.index(pack)], this::iconsPopup, ui));
        controls.addView(linkRow("Comment colours", ModernTheme.DEPTH_NAMES[depthIndex()], this::commentsPopup, ui));
        controls.addView(linkRow("Tag colours", tagPresetName(), this::tagsPopup, ui));
        controls.addView(linkRow("Fine-tune colours", "", () -> {
            advanced = true;
            screen = -1;
            build();
        }, ui));

        View preview = null;
        if (wide()) {
            tab = T_FEED;
            previewHost = new FrameLayout(activity);
            repaintPreview();
            preview = previewHost;
        }
        panes(content, preview, controls);
    }

    private int depthIndex() {
        String preset = currentDepthValue().preset;
        for (int i = 0; i < ModernTheme.DEPTH_PRESETS.length; i++) {
            if (ModernTheme.DEPTH_PRESETS[i].equals(preset)) return i;
        }
        return 0;
    }

    /** A theme as a small card: its background, a card bar and its accent. */
    private View themeCard(String option, ModernUi.Palette ui) {
        boolean chosen = option.equalsIgnoreCase(id);
        boolean optionLight = light && ModernTheme.hasLight(activity, option);
        ModernUi.Palette swatch = ModernUi.paletteFor(activity, option, optionLight);
        LinearLayout card = column();
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(4), dp(4), dp(4), dp(4));
        FrameLayout face = new FrameLayout(activity);
        GradientDrawable plate = new GradientDrawable();
        plate.setCornerRadius(dp(14));
        plate.setColor(swatch.canvas);
        plate.setStroke(chosen ? dp(2) : Math.max(1, dp(1)), chosen ? ui.accent : ui.outline);
        face.setBackground(plate);
        View bar = new View(activity);
        bar.setBackground(rounded(swatch.container, 6));
        FrameLayout.LayoutParams barLp = new FrameLayout.LayoutParams(dp(56), dp(16));
        barLp.leftMargin = dp(10);
        barLp.topMargin = dp(12);
        face.addView(bar, barLp);
        View line = new View(activity);
        line.setBackground(rounded(swatch.onSurface, 2));
        FrameLayout.LayoutParams lineLp = new FrameLayout.LayoutParams(dp(40), dp(4));
        lineLp.leftMargin = dp(10);
        lineLp.topMargin = dp(36);
        face.addView(line, lineLp);
        View dot = new View(activity);
        GradientDrawable dotShape = new GradientDrawable();
        dotShape.setShape(GradientDrawable.OVAL);
        dotShape.setColor(swatch.accent);
        dot.setBackground(dotShape);
        FrameLayout.LayoutParams dotLp = new FrameLayout.LayoutParams(dp(18), dp(18));
        dotLp.gravity = Gravity.BOTTOM | Gravity.END;
        dotLp.rightMargin = dp(10);
        dotLp.bottomMargin = dp(10);
        face.addView(dot, dotLp);
        card.addView(face, new LinearLayout.LayoutParams(dp(96), dp(72)));
        TextView name = new TextView(activity);
        name.setText(ModernTheme.name(activity, option));
        name.setTextColor(chosen ? ui.accent : ui.onSurface);
        name.setTextSize(12);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(4), 0, 0);
        card.addView(name, new LinearLayout.LayoutParams(dp(96), ViewGroup.LayoutParams.WRAP_CONTENT));
        card.setClickable(true);
        card.setOnClickListener(v -> {
            if (!option.equalsIgnoreCase(id)) select(option);
        });
        if (!ModernTheme.isMine(option)) return card;
        card.setOnLongClickListener(v -> {
            askName("Rename", ModernTheme.name(activity, option), typed -> {
                ModernTheme.renameMine(activity, option, typed);
                applied();
            });
            return true;
        });
        FrameLayout holder = new FrameLayout(activity);
        holder.addView(card);
        TextView x = new TextView(activity);
        x.setText("✕");
        x.setTextSize(12);
        x.setGravity(Gravity.CENTER);
        x.setTextColor(ui.onSurface);
        x.setBackground(rounded(ui.containerHigh, 11));
        x.setOnClickListener(v -> confirmDelete(option));
        FrameLayout.LayoutParams xLp = new FrameLayout.LayoutParams(dp(22), dp(22));
        xLp.gravity = Gravity.TOP | Gravity.END;
        xLp.topMargin = dp(2);
        xLp.rightMargin = dp(2);
        holder.addView(x, xLp);
        return holder;
    }

    /** Space around a grid cell. The grid helper gives every cell the same width and drops margins. */
    private View padded(View cell, int space) {
        LinearLayout wrap = new LinearLayout(activity);
        wrap.setPadding(dp(space), dp(space), dp(space), dp(space));
        wrap.addView(cell, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return wrap;
    }

    private void confirmDelete(String option) {
        LinearLayout page = MorpheDialog.page(activity, "Delete theme?", "\"" + ModernTheme.name(activity, option)
                + "\" will be removed. This can't be undone.");
        AlertDialog[] shown = new AlertDialog[1];
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> shown[0].dismiss());
        TextView delete = MorpheDialog.action(activity, "Delete", MorpheDialog.GOLD);
        delete.setOnClickListener(v -> {
            shown[0].dismiss();
            boolean current = option.equalsIgnoreCase(id);
            String base = ModernTheme.mineBase(activity, option);
            if (current) {
                ModernUi.applyAccent(activity, base);
                baseline = ModernTheme.themeState(activity, base);
            }
            ModernTheme.deleteMine(activity, option);
            group = null;
            applied();
        });
        page.addView(MorpheDialog.actions(activity, cancel, delete));
        shown[0] = MorpheDialog.show(activity, page);
    }

    private View appearanceRow(ModernUi.Palette ui) {
        boolean both = ModernTheme.hasLight(activity, id);
        String mode = ModernTheme.mode(activity);
        String[] modes = {ModernTheme.MODE_SYSTEM, ModernTheme.MODE_LIGHT, ModernTheme.MODE_DARK};
        String[] modeNames = {"System", "Light", "Dark"};
        TextView[] views = new TextView[3];
        for (int i = 0; i < 3; i++) {
            String value = modes[i];
            TextView view = MorpheDialog.action(activity, modeNames[i], value.equals(mode) ? MorpheDialog.GOLD : MorpheDialog.TEXT);
            view.setEnabled(both);
            view.setAlpha(both ? 1f : 0.4f);
            view.setOnClickListener(v -> {
                ModernTheme.setMode(activity, value);
                applied();
            });
            views[i] = view;
        }
        LinearLayout box = column();
        box.addView(left(views));
        if (!both) box.addView(note("v1 themes are dark only.", ui));
        return box;
    }

    private View accentRow(ModernUi.Palette ui) {
        String current = ModernTheme.override(activity, id, light, ModernTheme.ACCENT);
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(2), 0, dp(4));
        // The first dot is the theme's own accent.
        for (int i = -1; i < ACCENTS.length; i++) {
            int color = i < 0 ? ownAccent() : ACCENTS[i];
            String value = i < 0 ? "" : ModernTheme.hex(color);
            boolean chosen = i < 0 ? current == null : current != null && current.equalsIgnoreCase(value);
            View dot = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setShape(GradientDrawable.OVAL);
            shape.setColor(color);
            shape.setStroke(chosen ? dp(3) : Math.max(1, dp(1)), chosen ? ui.onSurface : 0x66808080);
            dot.setBackground(shape);
            dot.setOnClickListener(v -> {
                ModernTheme.setOverride(activity, id, light, ModernTheme.ACCENT, value);
                applied();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(32), dp(32));
            lp.rightMargin = dp(10);
            row.addView(dot, lp);
        }
        // A last dot opens the colour picker for any accent.
        TextView custom = new TextView(activity);
        custom.setText("+");
        custom.setTextSize(18);
        custom.setGravity(Gravity.CENTER);
        custom.setTextColor(ui.onSurface);
        boolean picked = current != null;
        for (int c : ACCENTS) if (current != null && current.equalsIgnoreCase(ModernTheme.hex(c))) picked = false;
        GradientDrawable ring = new GradientDrawable();
        ring.setShape(GradientDrawable.OVAL);
        ring.setColor(picked ? Color.parseColor(current) : ui.containerHigh);
        ring.setStroke(picked ? dp(3) : Math.max(1, dp(1)), picked ? ui.onSurface : 0x66808080);
        custom.setBackground(ring);
        custom.setOnClickListener(v -> {
            int start = shownColor(previewPalette(), ModernTheme.ACCENT);
            pickColour("Accent colour", start, previewPalette(), current != null ? "Use the theme accent" : null, value -> {
                ModernTheme.setOverride(activity, id, light, ModernTheme.ACCENT, value);
                applied();
            });
        });
        row.addView(custom, new LinearLayout.LayoutParams(dp(32), dp(32)));
        return row;
    }

    /** The theme's own accent, without any change of yours. */
    private int ownAccent() {
        try {
            boolean amoled = ModernUi.ACCENT_AMOLED.equalsIgnoreCase(id);
            int[] base = ModernTheme.base(activity, id, light, amoled);
            if (base != null && base[ModernTheme.ACCENT] != 0) return base[ModernTheme.ACCENT];
        } catch (Throwable ignored) {
        }
        return previewPalette().accent;
    }

    // ---- Popups inside the popup ------------------------------------------------

    private void iconsPopup() {
        LinearLayout page = column();
        AlertDialog[] shown = new AlertDialog[1];
        popupRefresh = () -> {
            if (shown[0] != null && shown[0].isShowing()) fillIcons(page, shown[0]);
            else popupRefresh = null;
        };
        fillIcons(page, null);
        shown[0] = MorpheDialog.show(activity, page, 440);
        shown[0].setOnDismissListener(d -> popupRefresh = null);
        fillIcons(page, shown[0]);
    }

    private void fillIcons(LinearLayout page, AlertDialog host) {
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        page.removeAllViews();
        page.setBackgroundColor(ui.container);
        page.setPadding(dp(20), dp(18), dp(20), dp(8));
        if (host != null && host.getWindow() != null) host.getWindow().setBackgroundDrawable(new ColorDrawable(ui.container));
        TextView title = new TextView(activity);
        title.setText("Icons");
        title.setTextColor(ui.accent);
        title.setTextSize(20);
        page.addView(title);
        String pack = ModernIcons.saved(activity);
        int chosen = ModernIcons.index(pack);
        List<View> cells = new ArrayList<>();
        for (int i = 0; i < ModernIcons.NAMES.length; i++) {
            int index = i;
            LinearLayout cell = column();
            cell.setGravity(Gravity.CENTER);
            cell.setPadding(dp(8), dp(14), dp(8), dp(14));
            GradientDrawable plate = new GradientDrawable();
            plate.setCornerRadius(dp(14));
            plate.setColor(ui.containerHigh);
            plate.setStroke(i == chosen ? dp(2) : Math.max(1, dp(1)), i == chosen ? ui.accent : ui.outline);
            cell.setBackground(plate);
            TextView name = new TextView(activity);
            name.setText(ModernIcons.NAMES[i]);
            name.setTextColor(i == chosen ? ui.accent : ui.onSurface);
            name.setTextSize(14);
            name.setGravity(Gravity.CENTER);
            cell.addView(name);
            LinearLayout glyphs = new LinearLayout(activity);
            glyphs.setGravity(Gravity.CENTER);
            glyphs.setPadding(0, dp(8), 0, dp(4));
            for (String sample : ModernIcons.SAMPLE) {
                int res = ModernIcons.sampleId(activity, ModernIcons.IDS[i], sample);
                if (res == 0) continue;
                android.graphics.drawable.Drawable d = activity.getDrawable(res);
                if (d == null) continue;
                d = d.mutate();
                d.setTint(i == chosen ? ui.accent : ui.onSurface);
                android.widget.ImageView glyph = new android.widget.ImageView(activity);
                glyph.setImageDrawable(d);
                LinearLayout.LayoutParams glp = new LinearLayout.LayoutParams(dp(22), dp(22));
                glp.leftMargin = dp(3);
                glp.rightMargin = dp(3);
                glyphs.addView(glyph, glp);
            }
            cell.addView(glyphs);
            if (i == chosen) cell.addView(small("In use", ui.onSurfaceVariant, 11));
            cell.setClickable(true);
            cell.setOnClickListener(v -> {
                ModernIcons.save(activity, ModernIcons.IDS[index]);
                build();
                if (popupRefresh != null) popupRefresh.run();
            });
            cells.add(padded(cell, 6));
        }
        LinearLayout grid = column();
        grid.setPadding(0, dp(6), 0, dp(4));
        MorpheDialog.addGrid(grid, cells);
        page.addView(grid);
        List<TextView> buttons = new ArrayList<>();
        if (!pack.equals(ModernIcons.running(activity))) {
            page.addView(note("New icons need Joey to restart. Colours change straight away.", ui));
            TextView restart = MorpheDialog.action(activity, "Apply and restart", MorpheDialog.GOLD);
            restart.setOnClickListener(v -> ModernUi.restartApp(activity));
            buttons.add(restart);
        }
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        done.setOnClickListener(v -> {
            if (host != null) host.dismiss();
        });
        buttons.add(0, done);
        page.addView(MorpheDialog.actions(activity, buttons.toArray(new TextView[0])));
    }

    private void commentsPopup() {
        LinearLayout page = column();
        AlertDialog[] shown = new AlertDialog[1];
        popupRefresh = () -> {
            if (shown[0] != null && shown[0].isShowing()) fillComments(page, shown[0]);
            else popupRefresh = null;
        };
        fillComments(page, null);
        shown[0] = MorpheDialog.show(activity, page, 440);
        shown[0].setOnDismissListener(d -> popupRefresh = null);
        fillComments(page, shown[0]);
    }

    private void fillComments(LinearLayout page, AlertDialog host) {
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        page.removeAllViews();
        page.setBackgroundColor(ui.container);
        page.setPadding(dp(20), dp(18), dp(20), dp(8));
        if (host != null && host.getWindow() != null) host.getWindow().setBackgroundDrawable(new ColorDrawable(ui.container));
        TextView title = new TextView(activity);
        title.setText("Comment colours");
        title.setTextColor(ui.accent);
        title.setTextSize(20);
        page.addView(title);
        buildLevels(page, ui);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        done.setOnClickListener(v -> {
            if (host != null) host.dismiss();
        });
        page.addView(MorpheDialog.actions(activity, done));
    }

    // ---- Tag colours: OP, Mod, You, Friend, Admin ----------------------------------

    private String tagPresetName() {
        ModernTheme.Tags tags = ModernTheme.tags(activity, id, light);
        if (tags.hasCustom()) return "Custom";
        for (int i = 0; i < ModernTheme.TAG_PRESETS.length; i++) {
            if (ModernTheme.TAG_PRESETS[i].equals(tags.preset)) return ModernTheme.TAG_PRESET_NAMES[i];
        }
        return ModernTheme.TAG_PRESET_NAMES[0];
    }

    private void tagsPopup() {
        LinearLayout page = column();
        AlertDialog[] shown = new AlertDialog[1];
        popupRefresh = () -> {
            if (shown[0] != null && shown[0].isShowing()) fillTags(page, shown[0]);
            else popupRefresh = null;
        };
        fillTags(page, null);
        shown[0] = MorpheDialog.show(activity, page, 440);
        shown[0].setOnDismissListener(d -> popupRefresh = null);
        fillTags(page, shown[0]);
    }

    /** Joey's own tag colour is Joey's to pick, so the preview shows a neutral stand-in. */
    private static int[] shownTags(int[] colors, ModernUi.Palette p) {
        int[] out = colors.clone();
        for (int i = 0; i < out.length; i++) if (out[i] == 0) out[i] = p.onSurfaceVariant;
        return out;
    }

    private void saveTags(ModernTheme.Tags tags) {
        ModernTheme.saveTags(activity, id, light, tags);
        applied();
    }

    private void fillTags(LinearLayout page, AlertDialog host) {
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        ModernUi.Palette p = previewPalette();
        ModernTheme.Tags tags = ModernTheme.tags(activity, id, light);
        int[] colors = shownTags(ModernTheme.tagColors(activity, id, light, p.roles), p);
        page.removeAllViews();
        page.setBackgroundColor(ui.container);
        page.setPadding(dp(20), dp(18), dp(20), dp(8));
        if (host != null && host.getWindow() != null) host.getWindow().setBackgroundDrawable(new ColorDrawable(ui.container));
        TextView title = new TextView(activity);
        title.setText("Tag colours");
        title.setTextColor(ui.accent);
        title.setTextSize(20);
        page.addView(title);
        page.addView(note("The OP, Mod, You, Friend and Admin tags beside names in comments and posts.", ui));

        // A comment header as it will look.
        LinearLayout card = column();
        card.setBackground(rounded(p.container, 12));
        card.setPadding(dp(12), dp(10), dp(12), dp(10));
        for (int i = 0; i < ModernTheme.TAG_TYPES.length; i++) {
            LinearLayout line = new LinearLayout(activity);
            line.setOrientation(LinearLayout.HORIZONTAL);
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.setPadding(0, dp(3), 0, dp(3));
            line.addView(small("someone_" + ModernTheme.TAG_NAMES[i].toLowerCase(java.util.Locale.US), p.onSurface, 13));
            TextView chip = small(ModernTheme.TAG_NAMES[i].toUpperCase(java.util.Locale.US), colors[i], 11);
            GradientDrawable outline = new GradientDrawable();
            outline.setCornerRadius(dp(6));
            outline.setStroke(Math.max(1, dp(1)), colors[i]);
            chip.setBackground(outline);
            chip.setPadding(dp(6), dp(1), dp(6), dp(1));
            LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            chipLp.leftMargin = dp(8);
            line.addView(chip, chipLp);
            LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            TextView age = small("2h", p.onSurfaceVariant, 12);
            textLp.leftMargin = dp(8);
            line.addView(age, textLp);
            card.addView(line);
        }
        LinearLayout.LayoutParams cardLp = fullWidth();
        cardLp.topMargin = dp(8);
        page.addView(card, cardLp);

        page.addView(MorpheDialog.section(activity, "Colours", ui.accent));
        LinearLayout presets = new LinearLayout(activity);
        for (int i = 0; i < ModernTheme.TAG_PRESETS.length; i++) {
            String preset = ModernTheme.TAG_PRESETS[i];
            boolean chosen = preset.equals(tags.preset);
            LinearLayout chip = column();
            chip.setPadding(dp(10), dp(8), dp(10), dp(8));
            GradientDrawable plate = new GradientDrawable();
            plate.setCornerRadius(dp(14));
            plate.setColor(p.container);
            plate.setStroke(chosen ? dp(2) : Math.max(1, dp(1)), chosen ? ui.accent : ui.outline);
            chip.setBackground(plate);
            LinearLayout strip = new LinearLayout(activity);
            for (int color : shownTags(ModernTheme.tagPreset(preset, p.roles, light), p)) {
                View swatch = new View(activity);
                swatch.setBackground(rounded(color, 3));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(16), dp(14));
                lp.rightMargin = dp(3);
                strip.addView(swatch, lp);
            }
            chip.addView(strip);
            TextView name = small(ModernTheme.TAG_PRESET_NAMES[i], p.onSurface, 12);
            name.setPadding(0, dp(4), 0, 0);
            chip.addView(name);
            chip.setClickable(true);
            chip.setOnClickListener(v -> {
                ModernTheme.Tags next = ModernTheme.tags(activity, id, light);
                next.preset = preset;
                java.util.Arrays.fill(next.custom, "");
                saveTags(next);
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(10);
            presets.addView(chip, lp);
        }
        page.addView(presets);

        page.addView(note("Tap a tag to give it a colour of its own.", ui));
        LinearLayout swatches = new LinearLayout(activity);
        swatches.setPadding(0, dp(6), 0, dp(2));
        for (int i = 0; i < ModernTheme.TAG_TYPES.length; i++) {
            int index = i;
            boolean fixed = tags.custom[i] != null && !tags.custom[i].isEmpty();
            LinearLayout cell = column();
            cell.setGravity(Gravity.CENTER_HORIZONTAL);
            View swatch = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(dp(8));
            shape.setColor(colors[i]);
            shape.setStroke(fixed ? dp(2) : Math.max(1, dp(1)), fixed ? ui.onSurface : ui.outline);
            swatch.setBackground(shape);
            cell.addView(swatch, new LinearLayout.LayoutParams(dp(34), dp(34)));
            cell.addView(small(ModernTheme.TAG_NAMES[i], ui.onSurfaceVariant, 11));
            cell.setClickable(true);
            cell.setOnClickListener(v -> pickColour(ModernTheme.TAG_NAMES[index] + " tag", colors[index], p,
                    fixed ? "Use the preset colour" : null, value -> {
                ModernTheme.Tags next = ModernTheme.tags(activity, id, light);
                next.custom[index] = value;
                saveTags(next);
            }));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(14);
            swatches.addView(cell, lp);
        }
        page.addView(swatches);

        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
        done.setOnClickListener(v -> {
            if (host != null) host.dismiss();
        });
        page.addView(MorpheDialog.actions(activity, done));
    }

    // ---- Advanced -------------------------------------------------------------

    private boolean edited(int screenIndex) {
        for (int role : TAB_ROLES[screenIndex]) {
            if (ModernTheme.override(activity, id, light, role) != null) return true;
        }
        return false;
    }

    private void buildHome(LinearLayout content, ModernUi.Palette ui) {
        LinearLayout list = column();
        list.addView(note("Pick a screen, then tap a colour on it. Dots mark screens you have changed.", ui));
        list.addView(MorpheDialog.section(activity, "Colours by screen", ui.accent));
        for (int i = 0; i < SCREEN_NAMES.length; i++) {
            int index = i;
            list.addView(linkRow(SCREEN_NAMES[i] + (edited(i) ? "  •" : ""), SCREEN_INFO[i], () -> {
                screen = index;
                tab = index;
                build();
            }, ui));
        }
        list.addView(MorpheDialog.section(activity, "Tuning", ui.accent));
        list.addView(linkRow("Adjust", "Vibrancy, brightness, contrast", () -> {
            screen = S_TUNING;
            build();
        }, ui));
        list.addView(linkRow("Comment level colours", ModernTheme.DEPTH_NAMES[depthIndex()], this::commentsPopup, ui));
        list.addView(linkRow("Tag colours", tagPresetName(), this::tagsPopup, ui));

        content.addView(scrolled(list), grow());
    }

    private void buildTuning(LinearLayout content, ModernUi.Palette ui) {
        LinearLayout list = column();
        list.addView(slider("Vibrancy", -50, 50, tweaks.vibrancy, value -> tweaks.vibrancy = value, ui));
        list.addView(slider("Brightness", -50, 50, tweaks.brightness, value -> tweaks.brightness = value, ui));
        list.addView(slider("Contrast", 0, 50, tweaks.contrast, value -> tweaks.contrast = value, ui));
        if (!light) {
            CheckBox black = MorpheDialog.check(activity, "AMOLED black background", tweaks.black, null);
            black.setOnCheckedChangeListener((b, on) -> {
                tweaks.black = on;
                ModernTheme.saveTweaks(activity, id, tweaks);
                applied();
            });
            list.addView(black);
        }
        TextView standard = MorpheDialog.action(activity, "Restore standard votes", MorpheDialog.TEXT);
        standard.setOnClickListener(v -> {
            ModernTheme.restoreStandard(activity, id);
            applied();
        });
        list.addView(left(standard));
        list.addView(note("Restore standard puts back Reddit's orange upvote and blue downvote.", ui));

        previewHost = new FrameLayout(activity);
        tab = T_FEED;
        repaintPreview();
        panes(content, wide() ? previewHost : null, list);
        if (!wide()) {
            // On a phone the sliders sit above a live preview, so the effect is visible as you drag.
            list.addView(previewHost);
        }
    }

    private void buildScreen(LinearLayout content, ModernUi.Palette ui) {
        tab = screen;
        LinearLayout preview = column();
        LinearLayout strip = new LinearLayout(activity);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        strip.setGravity(Gravity.CENTER_VERTICAL);
        TextView hint = new TextView(activity);
        hint.setText("Tap a colour in the preview, or below");
        hint.setTextColor(ui.onSurfaceVariant);
        hint.setTextSize(13);
        strip.addView(hint, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        CheckBox show = MorpheDialog.check(activity, "Numbers", numbers, null);
        show.setTextSize(13);
        show.setOnCheckedChangeListener((b, on) -> {
            numbers = on;
            repaintPreview();
        });
        strip.addView(show);
        preview.addView(strip);
        previewHost = new FrameLayout(activity);
        LinearLayout.LayoutParams hostLp = fullWidth();
        hostLp.topMargin = dp(6);
        preview.addView(previewHost, hostLp);
        repaintPreview();

        ModernUi.Palette p = previewPalette();
        LinearLayout controls = column();
        controls.setPadding(0, dp(10), 0, 0);
        controls.addView(MorpheDialog.section(activity, "Colours on this screen", ui.accent));
        List<View> cells = new ArrayList<>();
        int[] roles = TAB_ROLES[tab];
        for (int i = 0; i < roles.length; i++) {
            int role = roles[i];
            int color = shownColor(p, role);
            boolean changedRole = ModernTheme.override(activity, id, light, role) != null;
            LinearLayout cell = new LinearLayout(activity);
            cell.setOrientation(LinearLayout.HORIZONTAL);
            cell.setGravity(Gravity.CENTER_VERTICAL);
            cell.setBackground(rounded(ui.containerHigh, 12));
            cell.setPadding(dp(8), dp(8), dp(8), dp(8));
            View swatch = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(dp(8));
            shape.setColor(color);
            shape.setStroke(Math.max(1, dp(1)), ui.outline);
            swatch.setBackground(shape);
            cell.addView(swatch, new LinearLayout.LayoutParams(dp(30), dp(30)));
            TextView name = new TextView(activity);
            name.setText((numbers ? (i + 1) + " · " : "") + ModernTheme.LABELS[role] + (changedRole ? " •" : ""));
            name.setTextColor(ui.onSurface);
            name.setTextSize(13);
            name.setPadding(dp(8), 0, 0, 0);
            cell.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            cell.setClickable(true);
            cell.setOnClickListener(v -> editRole(role));
            cells.add(padded(cell, 4));
        }
        LinearLayout grid = column();
        MorpheDialog.addGrid(grid, cells);
        controls.addView(grid);

        tabExtras = column();
        controls.addView(tabExtras);
        paintExtras();

        boolean any = false;
        for (int role : roles) if (ModernTheme.override(activity, id, light, role) != null) any = true;
        if (any) {
            TextView reset = MorpheDialog.action(activity, "Reset this screen", MorpheDialog.TEXT);
            reset.setOnClickListener(v -> {
                for (int role : TAB_ROLES[tab]) ModernTheme.setOverride(activity, id, light, role, "");
                applied();
            });
            controls.addView(left(reset));
        }
        panes(content, preview, controls);
    }


    /** Things that belong to one tab only: the video switch and its restore button. */
    private void paintExtras() {
        if (tabExtras == null) return;
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        tabExtras.removeAllViews();
        if (tab != T_MEDIA) return;
        boolean joey = ModernTheme.videoJoey(activity);
        CheckBox own = MorpheDialog.check(activity, "Use Joey's video colours", joey, null);
        own.setOnCheckedChangeListener((b, on) -> {
            ModernTheme.setVideoJoey(activity, on);
            paintExtras();
            repaintPreview();
        });
        tabExtras.addView(own);
        tabExtras.addView(note(joey
                ? "Joey's white controls are used. The colours above are kept for when you turn this off."
                : "The player's bar, buttons and volume slider follow these colours. Joey's thin line in the feed is left as it is.", ui));
        TextView restore = MorpheDialog.action(activity, "Restore video colours", MorpheDialog.TEXT);
        restore.setOnClickListener(v -> {
            ModernTheme.restoreVideo(activity, id);
            applied();
        });
        tabExtras.addView(left(restore));
    }

    /** Every colour in the theme, for the Colours section. */
    private void chooseAny(MorpheDialog.Choice then) {
        String[] labels = new String[ORDER.length];
        for (int i = 0; i < ORDER.length; i++) labels[i] = ModernTheme.LABELS[ORDER[i]];
        MorpheDialog.choices(activity, "All colours", labels, -1, index -> then.pick(ORDER[index]));
    }

    // ---------------------------------------------------------------------
    // Preview
    // ---------------------------------------------------------------------

    private ModernUi.Palette previewPalette() {
        boolean amoled = ModernUi.ACCENT_AMOLED.equalsIgnoreCase(id);
        int[] roles = ModernTheme.finish(activity, id, light, ModernTheme.base(activity, id, light, amoled), tweaks);
        return new ModernUi.Palette(roles, light);
    }

    private GradientDrawable rounded(int color, float radiusDp) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(dp(radiusDp));
        shape.setColor(color);
        return shape;
    }

    private void repaintPreview() {
        if (previewHost == null) return;
        previewHost.removeAllViews();
        ModernUi.Palette p = previewPalette();
        List<Spot> spots = new ArrayList<>();

        FrameLayout frame = new FrameLayout(activity);
        GradientDrawable clip = new GradientDrawable();
        clip.setCornerRadius(dp(16));
        clip.setColor(tab == T_MEDIA ? Color.BLACK : p.canvas);
        frame.setBackground(clip);
        frame.setClipToOutline(true);
        // The same height on every tab, so the popup does not jump when you switch.
        frame.setMinimumHeight(dp(430));

        switch (tab) {
            case T_POST:
                postTab(frame, p, spots);
                break;
            case T_COMMENTS:
                commentsTab(frame, p, spots);
                break;
            case T_DRAWER:
                drawerTab(frame, p, spots);
                break;
            case T_MEDIA:
                mediaTab(frame, p, spots);
                break;
            case T_CONTROLS:
                controlsTab(frame, p, spots);
                break;
            default:
                feedTab(frame, p, spots);
                break;
        }

        Badges badges = new Badges(activity, frame, spots);
        badges.setVisibility(numbers ? View.VISIBLE : View.GONE);
        frame.addView(badges, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        frame.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> badges.invalidate());

        previewHost.addView(frame, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private LinearLayout.LayoutParams fullWidth() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    /** A thin divider with room around it. */
    private FrameLayout rule(ModernUi.Palette p, List<Spot> spots, boolean badge) {
        FrameLayout rule = new FrameLayout(activity);
        View ruleLine = new View(activity);
        ruleLine.setBackgroundColor(p.outline);
        FrameLayout.LayoutParams lineLp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1)));
        lineLp.gravity = Gravity.CENTER_VERTICAL;
        rule.addView(ruleLine, lineLp);
        Spot spot = spot(rule, ModernTheme.DIVIDERS, TOP_RIGHT, rule);
        if (badge) spots.add(spot);
        return rule;
    }

    private LinearLayout.LayoutParams ruleLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(16));
        lp.leftMargin = dp(8);
        lp.rightMargin = dp(8);
        return lp;
    }

    /** The app bar: a title and two icons. */
    private LinearLayout toolbar(ModernUi.Palette p, List<Spot> spots, String name) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(p.primary);
        bar.setPadding(dp(10), dp(8), dp(10), dp(8));
        TextView title = small(name, p.onSurface, 14);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        bar.addView(small("⌕  ⋮", p.onSurface, 14));
        spots.add(spot(bar, ModernTheme.TOOLBAR, AFTER_TEXT, title));
        return bar;
    }

    // ---- Feed ------------------------------------------------------------

    private void feedTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        LinearLayout main = column();
        main.setBackgroundColor(p.canvas);
        // Room at the bottom for the floating button, clear of the posts.
        main.setPadding(0, 0, 0, dp(60));
        spots.add(spot(main, ModernTheme.BACKGROUND, BOTTOM_LEFT, main));
        frame.addView(main, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        main.addView(toolbar(p, spots, "JoeyForReddit"));

        LinearLayout tabs = new LinearLayout(activity);
        tabs.setOrientation(LinearLayout.HORIZONTAL);
        tabs.setGravity(Gravity.CENTER_VERTICAL);
        tabs.setBackgroundColor(p.primary);
        tabs.setPadding(dp(10), 0, dp(10), dp(8));
        TextView hot = small("Hot", p.onSurface, 11);
        hot.setBackground(rounded(p.containerHigh, 10));
        hot.setPadding(dp(8), dp(3), dp(8), dp(3));
        spots.add(spot(hot, ModernTheme.RAISED, BESIDE, hot));
        tabs.addView(hot);
        tabs.addView(small("      Popular   ", p.onSurfaceVariant, 11));
        TextView joey = small("Joey", p.onSurface, 11);
        joey.setTypeface(Typeface.DEFAULT_BOLD);
        GradientDrawable line = new GradientDrawable();
        line.setColor(p.accent);
        line.setBounds(0, 0, Math.round(joey.getPaint().measureText("Joey")), dp(3));
        joey.setCompoundDrawables(null, null, null, line);
        joey.setCompoundDrawablePadding(dp(3));
        spots.add(spot(joey, ModernTheme.ACCENT, AFTER_TEXT, joey));
        tabs.addView(joey);
        main.addView(tabs);

        int up = p.upvote != 0 ? p.upvote : ModernTheme.JOEY_UPVOTE;
        int down = p.downvote != 0 ? p.downvote : ModernTheme.JOEY_DOWNVOTE;

        // An unread pinned post, upvoted.
        LinearLayout first = card(p);
        TextView pin = small("📌 Pinned", p.pinned, 10);
        spots.add(spot(pin, ModernTheme.PINNED));
        first.addView(pin);
        TextView heading = small("Mighty Morphing 1.6 is out", p.onSurface, 13);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        spots.add(spot(heading, ModernTheme.TEXT));
        first.addView(heading);
        first.addView(identity(p, "r/JoeyForReddit", " · 2h", spots));
        TextView link = small("github.com/mighty-morphing", p.links, 10);
        spots.add(spot(link, ModernTheme.LINKS));
        first.addView(link);
        first.addView(votes(p, up, "128", up, p.onSurfaceVariant, spots, ModernTheme.UPVOTE));
        spots.add(spot(first, ModernTheme.CARDS, TOP_RIGHT, first));
        main.addView(first, cardLp());

        main.addView(rule(p, spots, true), ruleLp());

        // A read post, downvoted.
        LinearLayout second = card(p);
        TextView read = small("A post you have already read", p.read, 13);
        spots.add(spot(read, ModernTheme.READ));
        second.addView(read);
        second.addView(identity(p, "r/Android", " · 5h", spots));
        second.addView(votes(p, p.onSurfaceVariant, "12", down, down, spots, ModernTheme.DOWNVOTE));
        main.addView(second, cardLp());

        // Floating button, in the space kept for it.
        TextView fab = new TextView(activity);
        fab.setText("≡");
        fab.setTextSize(18);
        fab.setGravity(Gravity.CENTER);
        fab.setTextColor(p.onAccent);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(p.accent);
        fab.setBackground(circle);
        spots.add(spot(fab, ModernTheme.ON_ACCENT, BEFORE, fab));
        FrameLayout.LayoutParams fabLp = new FrameLayout.LayoutParams(dp(40), dp(40));
        fabLp.gravity = Gravity.BOTTOM | Gravity.END;
        fabLp.rightMargin = dp(12);
        fabLp.bottomMargin = dp(10);
        frame.addView(fab, fabLp);
    }

    // ---- Post --------------------------------------------------------------

    private void postTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        LinearLayout main = column();
        main.setBackgroundColor(p.canvas);
        main.setPadding(0, 0, 0, dp(14));
        spots.add(spot(main, ModernTheme.BACKGROUND, BOTTOM_LEFT, main));
        frame.addView(main, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        main.addView(toolbar(p, spots, "←  r/JoeyForReddit"));

        int up = p.upvote != 0 ? p.upvote : ModernTheme.JOEY_UPVOTE;
        int down = p.downvote != 0 ? p.downvote : ModernTheme.JOEY_DOWNVOTE;

        LinearLayout post = card(p);
        TextView title = small("Mighty Morphing 1.6 is out", p.onSurface, 15);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setSingleLine(false);
        spots.add(spot(title, ModernTheme.TEXT));
        post.addView(title);
        TextView meta = small("u/ZoomSass · 2h", p.onSurfaceVariant, 10);
        spots.add(spot(meta, ModernTheme.SECONDARY));
        post.addView(meta);
        TextView body = small("Themes, video colours and a new editor. Notes and the download are below.", p.onSurface, 11);
        body.setSingleLine(false);
        body.setPadding(0, dp(8), 0, dp(4));
        post.addView(body);
        TextView link = small("github.com/mighty-morphing", p.links, 11);
        spots.add(spot(link, ModernTheme.LINKS));
        post.addView(link);

        // The action bar sits on a raised panel.
        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        actions.setBackground(rounded(p.containerHigh, 12));
        actions.setPadding(dp(10), dp(6), dp(10), dp(6));
        actions.addView(small("💬 14   ↗   ", p.onSurfaceVariant, 12));
        TextView upView = small("▲ 128   ", up, 12);
        spots.add(spot(upView, ModernTheme.UPVOTE, BEFORE, upView));
        actions.addView(upView);
        TextView downView = small("▼", down, 12);
        spots.add(spot(downView, ModernTheme.DOWNVOTE, ABOVE, downView));
        actions.addView(downView);
        spots.add(spot(actions, ModernTheme.RAISED, TOP_RIGHT, actions));
        LinearLayout.LayoutParams actionLp = fullWidth();
        actionLp.topMargin = dp(10);
        post.addView(actions, actionLp);
        spots.add(spot(post, ModernTheme.CARDS, BOTTOM_LEFT, post));
        main.addView(post, cardLp());

        main.addView(rule(p, spots, true), ruleLp());

        // A reply box with its button.
        LinearLayout reply = new LinearLayout(activity);
        reply.setOrientation(LinearLayout.HORIZONTAL);
        reply.setGravity(Gravity.CENTER_VERTICAL);
        TextView hint = small("Add a comment", p.onSurfaceVariant, 11);
        hint.setBackground(rounded(p.containerHigh, 18));
        hint.setPadding(dp(12), dp(8), dp(12), dp(8));
        reply.addView(hint, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView send = small("Reply", p.onAccent, 11);
        send.setTypeface(Typeface.DEFAULT_BOLD);
        send.setBackground(rounded(p.accent, 18));
        send.setPadding(dp(14), dp(8), dp(14), dp(8));
        spots.add(spot(send, ModernTheme.ACCENT, TOP_RIGHT, send));
        LinearLayout.LayoutParams sendLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sendLp.leftMargin = dp(8);
        reply.addView(send, sendLp);
        LinearLayout.LayoutParams replyLp = fullWidth();
        replyLp.leftMargin = dp(8);
        replyLp.rightMargin = dp(8);
        replyLp.topMargin = dp(8);
        main.addView(reply, replyLp);
    }

    // ---- Comments ------------------------------------------------------------

    private void commentsTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        LinearLayout main = column();
        main.setBackgroundColor(p.canvas);
        main.setPadding(0, 0, 0, dp(14));
        spots.add(spot(main, ModernTheme.BACKGROUND, BOTTOM_LEFT, main));
        frame.addView(main, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        main.addView(toolbar(p, spots, "←  Comments"));
        main.addView(comments(p, spots), cardLp());

        // Collapsed replies, on a raised panel.
        LinearLayout more = new LinearLayout(activity);
        more.setOrientation(LinearLayout.HORIZONTAL);
        more.setGravity(Gravity.CENTER_VERTICAL);
        more.setBackground(rounded(p.containerHigh, 12));
        more.setPadding(dp(12), dp(10), dp(12), dp(10));
        more.addView(small("4 more replies   ", p.onSurfaceVariant, 11));
        TextView show = small("Show", p.links, 11);
        show.setTypeface(Typeface.DEFAULT_BOLD);
        spots.add(spot(show, ModernTheme.LINKS));
        more.addView(show);
        spots.add(spot(more, ModernTheme.RAISED, TOP_RIGHT, more));
        main.addView(more, cardLp());
    }

    // ---- Drawer --------------------------------------------------------------

    private void drawerTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        frame.addView(row, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout drawer = column();
        drawer.setBackgroundColor(p.drawer);
        drawer.setPadding(dp(12), dp(16), dp(12), dp(12));
        spots.add(spot(drawer, ModernTheme.DRAWER, BOTTOM_LEFT, drawer));
        row.addView(drawer, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 3f));

        TextView who = small("Your account", p.onSurface, 14);
        who.setTypeface(Typeface.DEFAULT_BOLD);
        drawer.addView(who);
        TextView karma = small("Karma and trophies", p.onSurfaceVariant, 10);
        karma.setPadding(0, dp(2), 0, dp(10));
        drawer.addView(karma);
        drawer.addView(rule(p, spots, true), fullWidth());

        // The row you are on: accent text on a raised pill.
        LinearLayout pill = new LinearLayout(activity);
        pill.setBackground(rounded(p.containerHigh, 12));
        pill.setPadding(dp(10), dp(8), dp(10), dp(8));
        TextView selected = small("Home", p.accent, 13);
        selected.setTypeface(Typeface.DEFAULT_BOLD);
        pill.addView(selected);
        spots.add(spot(selected, ModernTheme.ACCENT, AFTER_TEXT, selected));
        spots.add(spot(pill, ModernTheme.RAISED, TOP_RIGHT, pill));
        LinearLayout.LayoutParams selectedLp = fullWidth();
        selectedLp.topMargin = dp(8);
        drawer.addView(pill, selectedLp);

        String[] items = {"Popular", "All", "Saved", "History"};
        for (int i = 0; i < items.length; i++) {
            TextView item = small(items[i], p.onSurface, 13);
            item.setPadding(dp(10), dp(8), dp(10), dp(8));
            if (i == 0) spots.add(spot(item, ModernTheme.TEXT));
            drawer.addView(item);
        }
        TextView section = small("SUBSCRIPTIONS", p.onSurfaceVariant, 10);
        section.setPadding(dp(10), dp(14), 0, dp(4));
        spots.add(spot(section, ModernTheme.SECONDARY));
        drawer.addView(section);
        String[] subs = {"r/JoeyForReddit", "r/Android", "r/aww"};
        for (String sub : subs) {
            TextView item = small(sub, p.onSurfaceVariant, 12);
            item.setPadding(dp(10), dp(6), dp(10), dp(6));
            drawer.addView(item);
        }

        // The feed behind the drawer, shaded.
        LinearLayout behind = column();
        behind.setBackgroundColor(p.canvas);
        behind.setPadding(dp(6), dp(60), dp(6), 0);
        for (int i = 0; i < 3; i++) {
            View card = new View(activity);
            card.setBackground(rounded(p.container, 8));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(70));
            lp.bottomMargin = dp(8);
            behind.addView(card, lp);
        }
        spots.add(spot(behind, ModernTheme.BACKGROUND, BOTTOM_LEFT, behind));
        row.addView(behind, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
    }

    // ---- Media viewer ------------------------------------------------------------

    private int videoColour(ModernUi.Palette p, int role, boolean joey) {
        if (joey) return ModernTheme.standard(role) | 0xFF000000;
        int value = p.roles[role];
        return (value != 0 ? value : ModernTheme.standard(role)) | 0xFF000000;
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    private void mediaTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        boolean joey = ModernTheme.videoJoey(activity);
        int played = videoColour(p, ModernTheme.VIDEO_PLAYED, joey);
        int buffered = withAlpha(videoColour(p, ModernTheme.VIDEO_BUFFERED, joey), ModernVideo.BUFFERED_ALPHA);
        int unplayed = withAlpha(videoColour(p, ModernTheme.VIDEO_UNPLAYED, joey), ModernVideo.UNPLAYED_ALPHA);
        int buttons = withAlpha(videoColour(p, ModernTheme.VIDEO_BUTTONS, joey), ModernVideo.BUTTON_ALPHA);
        int volume = videoColour(p, ModernTheme.VIDEO_VOLUME, joey);

        View scene = new View(activity);
        scene.setBackground(new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[]{0xFF2C4652, 0xFF101A1F}));
        frame.addView(scene, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        TextView title = small(joey ? "Joey's video colours" : "Media viewer", 0xBBFFFFFF, 12);
        title.setPadding(dp(14), dp(12), 0, 0);
        frame.addView(title, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout controls = column();
        controls.setClipChildren(false);
        controls.setPadding(dp(14), 0, dp(14), dp(18));
        FrameLayout.LayoutParams controlsLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        controlsLp.gravity = Gravity.BOTTOM;
        frame.addView(controls, controlsLp);

        // Volume slider, on the right above the bar.
        LinearLayout slider = column();
        slider.setGravity(Gravity.CENTER_HORIZONTAL);
        View rest = new View(activity);
        rest.setBackground(rounded(unplayed, 2));
        slider.addView(rest, new LinearLayout.LayoutParams(dp(4), dp(60)));
        View knob = new View(activity);
        GradientDrawable knobShape = new GradientDrawable();
        knobShape.setShape(GradientDrawable.OVAL);
        knobShape.setColor(volume);
        knob.setBackground(knobShape);
        LinearLayout.LayoutParams knobLp = new LinearLayout.LayoutParams(dp(14), dp(14));
        knobLp.topMargin = -dp(7);
        knobLp.bottomMargin = -dp(7);
        slider.addView(knob, knobLp);
        View fill = new View(activity);
        fill.setBackground(rounded(volume, 2));
        slider.addView(fill, new LinearLayout.LayoutParams(dp(4), dp(40)));
        spots.add(spot(fill, ModernTheme.VIDEO_VOLUME, BEFORE, fill));
        LinearLayout.LayoutParams sliderLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sliderLp.gravity = Gravity.END;
        sliderLp.rightMargin = dp(10);
        sliderLp.bottomMargin = dp(12);
        controls.addView(slider, sliderLp);

        // Progress bar: played, buffered, then the rest, as in the player.
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClipChildren(false);
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setClipChildren(false);
        View donePart = new View(activity);
        donePart.setBackground(rounded(played, 2));
        bar.addView(donePart, new LinearLayout.LayoutParams(0, dp(4), 38f));
        View head = new View(activity);
        GradientDrawable headShape = new GradientDrawable();
        headShape.setShape(GradientDrawable.OVAL);
        headShape.setColor(played);
        head.setBackground(headShape);
        LinearLayout.LayoutParams headLp = new LinearLayout.LayoutParams(dp(14), dp(14));
        headLp.leftMargin = -dp(7);
        headLp.rightMargin = -dp(7);
        bar.addView(head, headLp);
        View bufferedPart = new View(activity);
        bufferedPart.setBackground(rounded(buffered, 2));
        bar.addView(bufferedPart, new LinearLayout.LayoutParams(0, dp(4), 24f));
        View restPart = new View(activity);
        restPart.setBackground(rounded(unplayed, 2));
        bar.addView(restPart, new LinearLayout.LayoutParams(0, dp(4), 38f));
        spots.add(spot(donePart, ModernTheme.VIDEO_PLAYED, ABOVE, donePart));
        spots.add(spot(bufferedPart, ModernTheme.VIDEO_BUFFERED, ABOVE, bufferedPart));
        spots.add(spot(restPart, ModernTheme.VIDEO_UNPLAYED, ABOVE, restPart));
        spot(head, ModernTheme.VIDEO_PLAYED);
        row.addView(bar, new LinearLayout.LayoutParams(0, dp(16), 1f));

        TextView time = small("  −0:23  ", buttons, 11);
        time.setTypeface(Typeface.DEFAULT_BOLD);
        spots.add(spot(time, ModernTheme.VIDEO_BUTTONS, ABOVE, time));
        row.addView(time);
        TextView play = small("▶", buttons, 16);
        play.setPadding(dp(6), 0, dp(6), 0);
        spot(play, ModernTheme.VIDEO_BUTTONS);
        row.addView(play);
        TextView more = small("⚙", buttons, 16);
        more.setPadding(dp(6), 0, dp(6), 0);
        spot(more, ModernTheme.VIDEO_BUTTONS);
        row.addView(more);
        controls.addView(row, fullWidth());
    }

    // ---- Controls ------------------------------------------------------------------

    private void controlsTab(FrameLayout frame, ModernUi.Palette p, List<Spot> spots) {
        LinearLayout main = column();
        main.setBackgroundColor(p.canvas);
        main.setPadding(dp(12), dp(12), dp(12), dp(12));
        frame.addView(main, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int up = p.upvote != 0 ? p.upvote : ModernTheme.JOEY_UPVOTE;
        int down = p.downvote != 0 ? p.downvote : ModernTheme.JOEY_DOWNVOTE;

        // Buttons.
        main.addView(small("BUTTONS", p.onSurfaceVariant, 10));
        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.CENTER_VERTICAL);
        buttons.setPadding(0, dp(6), 0, dp(10));
        TextView save = small("Save", p.onAccent, 12);
        save.setTypeface(Typeface.DEFAULT_BOLD);
        save.setBackground(rounded(p.accent, 18));
        save.setPadding(dp(18), dp(8), dp(18), dp(8));
        spots.add(spot(save, ModernTheme.ACCENT, TOP_RIGHT, save));
        buttons.addView(save);
        TextView cancel = small("Cancel", p.accent, 12);
        cancel.setTypeface(Typeface.DEFAULT_BOLD);
        GradientDrawable outlined = rounded(0, 18);
        outlined.setStroke(Math.max(1, dp(1)), p.outline);
        cancel.setBackground(outlined);
        cancel.setPadding(dp(18), dp(8), dp(18), dp(8));
        spot(cancel, ModernTheme.ACCENT);
        LinearLayout.LayoutParams cancelLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cancelLp.leftMargin = dp(8);
        buttons.addView(cancel, cancelLp);
        TextView check = small("✓", p.onAccent, 14);
        check.setGravity(Gravity.CENTER);
        GradientDrawable dot = new GradientDrawable();
        dot.setShape(GradientDrawable.OVAL);
        dot.setColor(p.accent);
        check.setBackground(dot);
        spots.add(spot(check, ModernTheme.ON_ACCENT, BESIDE, check));
        LinearLayout.LayoutParams checkLp = new LinearLayout.LayoutParams(dp(32), dp(32));
        checkLp.leftMargin = dp(12);
        buttons.addView(check, checkLp);
        main.addView(buttons);

        // Switches and chips.
        LinearLayout toggles = new LinearLayout(activity);
        toggles.setOrientation(LinearLayout.HORIZONTAL);
        toggles.setGravity(Gravity.CENTER_VERTICAL);
        toggles.setPadding(0, 0, 0, dp(10));
        toggles.addView(switchView(p, true));
        toggles.addView(small("  On     ", p.onSurfaceVariant, 11));
        toggles.addView(switchView(p, false));
        toggles.addView(small("  Off     ", p.onSurfaceVariant, 11));
        TextView chip = small("Hot", p.onSurface, 11);
        chip.setBackground(rounded(p.containerHigh, 12));
        chip.setPadding(dp(10), dp(4), dp(10), dp(4));
        spot(chip, ModernTheme.RAISED);
        toggles.addView(chip);
        TextView join = small("Join", p.accent, 11);
        GradientDrawable chipLine = rounded(0, 12);
        chipLine.setStroke(Math.max(1, dp(1)), p.accent);
        join.setBackground(chipLine);
        join.setPadding(dp(10), dp(4), dp(10), dp(4));
        spot(join, ModernTheme.ACCENT);
        LinearLayout.LayoutParams joinLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        joinLp.leftMargin = dp(6);
        toggles.addView(join, joinLp);
        main.addView(toggles);

        // A dialog.
        LinearLayout dialogBox = column();
        dialogBox.setBackground(rounded(p.containerHigh, 14));
        dialogBox.setPadding(dp(14), dp(12), dp(14), dp(10));
        TextView dialogTitle = small("Delete this post?", p.onSurface, 13);
        dialogTitle.setTypeface(Typeface.DEFAULT_BOLD);
        spots.add(spot(dialogTitle, ModernTheme.TEXT));
        dialogBox.addView(dialogTitle);
        TextView dialogBody = small("You can undo this for a few seconds.", p.onSurfaceVariant, 11);
        dialogBody.setPadding(0, dp(3), 0, dp(8));
        spots.add(spot(dialogBody, ModernTheme.SECONDARY));
        dialogBox.addView(dialogBody);
        dialogBox.addView(rule(p, spots, true), fullWidth());
        LinearLayout dialogActions = new LinearLayout(activity);
        dialogActions.setOrientation(LinearLayout.HORIZONTAL);
        dialogActions.setGravity(Gravity.END);
        dialogActions.addView(small("Cancel     ", p.onSurfaceVariant, 12));
        TextView ok = small("Delete", p.links, 12);
        ok.setTypeface(Typeface.DEFAULT_BOLD);
        spots.add(spot(ok, ModernTheme.LINKS));
        dialogActions.addView(ok);
        dialogBox.addView(dialogActions);
        spots.add(spot(dialogBox, ModernTheme.RAISED, TOP_RIGHT, dialogBox));
        LinearLayout.LayoutParams dialogLp = fullWidth();
        dialogLp.bottomMargin = dp(10);
        main.addView(dialogBox, dialogLp);

        // Votes and pinned.
        LinearLayout voteRow = new LinearLayout(activity);
        voteRow.setOrientation(LinearLayout.HORIZONTAL);
        voteRow.setGravity(Gravity.CENTER_VERTICAL);
        voteRow.setPadding(0, 0, 0, dp(10));
        TextView pin = small("📌 Pinned   ", p.pinned, 11);
        spots.add(spot(pin, ModernTheme.PINNED));
        voteRow.addView(pin);
        TextView upView = small("▲ 128   ", up, 13);
        spots.add(spot(upView, ModernTheme.UPVOTE));
        voteRow.addView(upView);
        TextView downView = small("▼ 12", down, 13);
        spots.add(spot(downView, ModernTheme.DOWNVOTE));
        voteRow.addView(downView);
        main.addView(voteRow);

        main.addView(iconRow(p));
    }

    /** A switch drawn from the theme: accent track with the on-accent thumb, or the muted pair. */
    private View switchView(ModernUi.Palette p, boolean on) {
        FrameLayout track = new FrameLayout(activity);
        track.setBackground(rounded(on ? p.accent : p.outline, 9));
        View thumb = new View(activity);
        GradientDrawable thumbShape = new GradientDrawable();
        thumbShape.setShape(GradientDrawable.OVAL);
        thumbShape.setColor(on ? p.onAccent : p.onSurfaceVariant);
        thumb.setBackground(thumbShape);
        FrameLayout.LayoutParams thumbLp = new FrameLayout.LayoutParams(dp(12), dp(12));
        thumbLp.gravity = (on ? Gravity.END : Gravity.START) | Gravity.CENTER_VERTICAL;
        thumbLp.leftMargin = dp(3);
        thumbLp.rightMargin = dp(3);
        track.addView(thumb, thumbLp);
        track.setLayoutParams(new LinearLayout.LayoutParams(dp(34), dp(18)));
        return track;
    }

    /** The icons of the pack in use, in the theme's icon colour. Joey's own pack has none to show. */
    private View iconRow(ModernUi.Palette p) {
        LinearLayout box = column();
        String pack = ModernIcons.saved(activity);
        box.addView(small("ICONS: " + ModernIcons.NAMES[ModernIcons.index(pack)].toUpperCase(), p.onSurfaceVariant, 10));
        if (pack.isEmpty()) {
            TextView own = small("Joey's own icons are in use. Pick a pack under Icons.", p.onSurfaceVariant, 11);
            own.setPadding(0, dp(6), 0, 0);
            box.addView(own);
            return box;
        }
        String[] names = {"upvote_arrow_outline", "downvote_arrow_outline", "commentoutline", "share", "star_outline",
                "more", "search", "home", "settings_outline", "menu", "link", "download"};
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setPadding(0, dp(6), 0, 0);
        for (String name : names) {
            int res = activity.getResources().getIdentifier("mm_icon_" + pack + "_" + name, "drawable", activity.getPackageName());
            if (res == 0) continue;
            android.widget.ImageView icon = new android.widget.ImageView(activity);
            icon.setImageResource(res);
            icon.setImageTintList(android.content.res.ColorStateList.valueOf(p.onSurfaceVariant));
            line.addView(icon, new LinearLayout.LayoutParams(0, dp(22), 1f));
        }
        box.addView(line);
        return box;
    }

    /** Three nested comments. Tapping a bar opens the comment levels. Numbers there are "L". */
    private View comments(ModernUi.Palette p, List<Spot> spots) {
        LinearLayout box = card(p);
        box.setPadding(dp(8), dp(6), dp(8), dp(6));
        ModernTheme.Depth depth = currentDepthValue();
        int[] colors = depthColors(p);
        String[] names = {"u/first_comment", "u/a_reply", "u/deeper_reply"};
        String[] bodies = {"Top-level comment", "A reply to it", "A reply to the reply"};
        for (int i = 0; i < 3; i++) {
            LinearLayout line = new LinearLayout(activity);
            line.setOrientation(LinearLayout.HORIZONTAL);
            line.setPadding(dp(10 * i), dp(3), 0, dp(3));
            View barView = new View(activity);
            int color = i == 0 ? 0 : colors[(i - 1) % colors.length];
            barView.setBackgroundColor(depth.hidden ? 0 : color);
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(dp(i == 0 ? 0 : 3), ViewGroup.LayoutParams.MATCH_PARENT);
            barLp.rightMargin = dp(i == 0 ? 0 : 6);
            line.addView(barView, barLp);
            LinearLayout text = column();
            LinearLayout who = new LinearLayout(activity);
            who.setOrientation(LinearLayout.HORIZONTAL);
            who.setGravity(Gravity.CENTER_VERTICAL);
            View face = new View(activity);
            GradientDrawable faceShape = new GradientDrawable();
            faceShape.setShape(GradientDrawable.OVAL);
            int hidden = p.roles[ModernTheme.HIDDEN_AVATAR] != 0 ? p.roles[ModernTheme.HIDDEN_AVATAR] : ModernTheme.JOEY_HIDDEN_AVATAR;
            faceShape.setColor(i == 1 ? hidden : ModernTheme.mix(p.accent, p.container, 0.5f));
            face.setBackground(faceShape);
            LinearLayout.LayoutParams faceLp = new LinearLayout.LayoutParams(dp(12), dp(12));
            faceLp.rightMargin = dp(5);
            who.addView(face, faceLp);
            if (i == 1) spots.add(spot(face, ModernTheme.HIDDEN_AVATAR, BESIDE, face));
            TextView nameView = small(names[i], p.onSurfaceVariant, 10);
            who.addView(nameView);
            text.addView(who);
            TextView bodyView = small(bodies[i], p.onSurface, 11);
            text.addView(bodyView);
            if (i == 0) {
                spots.add(spot(nameView, ModernTheme.SECONDARY));
                spots.add(spot(bodyView, ModernTheme.TEXT));
            }
            line.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            if (i > 0) {
                int level = i - 1;
                barView.setClickable(true);
                line.setOnClickListener(v -> editLevel(level));
                spots.add(new Spot(barView, -1, BEFORE, "L" + (level + 1)));
            }
            box.addView(line);
        }
        return box;
    }

    private LinearLayout card(ModernUi.Palette p) {
        LinearLayout card = column();
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(dp(10));
        shape.setColor(p.container);
        card.setBackground(shape);
        card.setPadding(dp(10), dp(8), dp(10), dp(8));
        return card;
    }

    private LinearLayout.LayoutParams cardLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(8);
        lp.rightMargin = dp(8);
        lp.topMargin = dp(8);
        return lp;
    }

    private LinearLayout votes(ModernUi.Palette p, int upColor, String score, int scoreColor, int downColor,
                               List<Spot> spots, int role) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        row.setPadding(0, dp(4), 0, 0);
        TextView upView = small("▲ ", upColor, 13);
        TextView scoreView = small(score + " ", scoreColor, 11);
        TextView downView = small("▼", downColor, 13);
        row.addView(upView);
        row.addView(scoreView);
        row.addView(downView);
        TextView marked = role == ModernTheme.UPVOTE ? upView : downView;
        spots.add(role == ModernTheme.UPVOTE ? spot(marked, role, BEFORE, upView) : spot(marked, role, ABOVE, downView));
        return row;
    }

    /** The calm post row's first line: the community in the accent, the rest muted. */
    private LinearLayout identity(ModernUi.Palette p, String sub, String rest, List<Spot> spots) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        TextView name = small(sub, p.accent, 10);
        spots.add(spot(name, ModernTheme.ACCENT));
        row.addView(name);
        TextView tail = small(rest, p.onSurfaceVariant, 10);
        spots.add(spot(tail, ModernTheme.SECONDARY));
        row.addView(tail);
        return row;
    }

    private TextView small(String text, int color, float size) {
        TextView view = new TextView(activity);
        view.setText(text);
        view.setTextColor(color);
        view.setTextSize(size);
        view.setSingleLine(true);
        return view;
    }

    /** Where a number sits: after the text, at a corner, beside, or above. */
    private static final int AFTER_TEXT = 0;
    private static final int TOP_RIGHT = 1;
    private static final int BOTTOM_LEFT = 2;
    private static final int BESIDE = 3;
    private static final int ABOVE = 4;
    private static final int BEFORE = 5;

    private Spot spot(View view, int role) {
        return spot(view, role, view instanceof TextView ? AFTER_TEXT : TOP_RIGHT, view);
    }

    private Spot spot(View view, int role, int place, View anchor) {
        view.setClickable(true);
        view.setOnClickListener(v -> editRole(role));
        int n = number(role);
        return new Spot(anchor, role, place, n == 0 ? "" : String.valueOf(n));
    }

    private static final class Spot {
        final View view;
        final int role;
        final int place;
        final String label;

        Spot(View view, int role, int place, String label) {
            this.view = view;
            this.role = role;
            this.place = place;
            this.label = label;
        }
    }

    /** Numbered dots over the preview. They do not take touches. */
    private static final class Badges extends View {
        private final View frame;
        private final List<Spot> spots;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float density;

        Badges(Context context, View frame, List<Spot> spots) {
            super(context);
            this.frame = frame;
            this.spots = spots;
            density = context.getResources().getDisplayMetrics().density;
            fill.setColor(0xE6000000);
            ring.setColor(Color.WHITE);
            ring.setStyle(Paint.Style.STROKE);
            ring.setStrokeWidth(density);
            text.setColor(Color.WHITE);
            text.setTextSize(9 * density);
            text.setTypeface(Typeface.DEFAULT_BOLD);
            text.setTextAlign(Paint.Align.CENTER);
            setClickable(false);
            setFocusable(false);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float radius = 7.5f * density;
            float gap = 3f * density;
            List<float[]> placed = new ArrayList<>();
            for (Spot spot : spots) {
                if (spot.label.isEmpty()) continue;
                float[] at = offset(spot.view);
                if (at == null || spot.view.getWidth() == 0) continue;
                View v = spot.view;
                float cx;
                float cy;
                switch (spot.place) {
                    case AFTER_TEXT: {
                        TextView text = (TextView) v;
                        float width = text.getLayout() != null && text.getLayout().getLineCount() > 0
                                ? text.getLayout().getLineWidth(0) : text.getPaint().measureText(text.getText().toString());
                        cx = at[0] + text.getPaddingLeft() + width + gap + radius;
                        cy = at[1] + v.getHeight() / 2f;
                        break;
                    }
                    case BOTTOM_LEFT:
                        cx = at[0] + radius + gap;
                        cy = at[1] + v.getHeight() - radius - gap;
                        break;
                    case BESIDE:
                        cx = at[0] + v.getWidth() + gap + radius;
                        cy = at[1] + v.getHeight() / 2f;
                        break;
                    case BEFORE:
                        cx = at[0] - gap - radius;
                        cy = at[1] + v.getHeight() / 2f;
                        break;
                    case ABOVE:
                        cx = at[0] + v.getWidth() / 2f;
                        cy = at[1] - radius + 2f * density;
                        break;
                    default:
                        cx = at[0] + v.getWidth() - radius - gap;
                        cy = at[1] + radius + gap;
                        break;
                }
                cx = Math.max(radius + 1f, Math.min(getWidth() - radius - 1f, cx));
                cy = Math.max(radius + 1f, Math.min(getHeight() - radius - 1f, cy));
                // Step left past any number already drawn there.
                for (int tries = 0; tries < 6; tries++) {
                    boolean clash = false;
                    for (float[] other : placed) {
                        if (Math.abs(other[0] - cx) < radius * 2f + 2f && Math.abs(other[1] - cy) < radius * 2f + 2f) {
                            clash = true;
                            break;
                        }
                    }
                    if (!clash) break;
                    cx -= radius * 2f + 3f;
                }
                placed.add(new float[]{cx, cy});
                canvas.drawCircle(cx, cy, radius, fill);
                canvas.drawCircle(cx, cy, radius, ring);
                canvas.drawText(spot.label, cx, cy + 3.2f * density, text);
            }
        }

        private float[] offset(View view) {
            float x = 0f;
            float y = 0f;
            View at = view;
            while (at != null && at != frame) {
                x += at.getLeft();
                y += at.getTop();
                ViewParent parent = at.getParent();
                at = parent instanceof View ? (View) parent : null;
            }
            return at == frame ? new float[]{x, y} : null;
        }
    }

    /** A row of buttons lined up with the text above, wrapping onto a second line if needed. */
    private LinearLayout left(TextView... buttons) {
        LinearLayout row = MorpheDialog.actions(activity, buttons);
        row.setGravity(Gravity.START);
        if (row.getChildCount() > 0) {
            ViewGroup.LayoutParams lp = row.getChildAt(0).getLayoutParams();
            if (lp instanceof LinearLayout.LayoutParams) ((LinearLayout.LayoutParams) lp).leftMargin = 0;
        }
        return row;
    }

    private LinearLayout left(List<TextView> buttons) {
        return left(buttons.toArray(new TextView[0]));
    }

    // ---------------------------------------------------------------------
    // Comment levels
    // ---------------------------------------------------------------------

    private ModernTheme.Depth currentDepthValue() {
        return ModernTheme.depth(activity, id, light);
    }

    private int[] depthColors(ModernUi.Palette p) {
        int[] colors = ModernTheme.depthColors(activity, id, light, p.roles);
        return colors.length > 0 ? colors : ModernTheme.JOEY_DEPTH;
    }

    private void saveDepth(ModernTheme.Depth depth) {
        ModernTheme.saveDepth(activity, id, light, depth);
        applied();
    }

    private void buildLevels(LinearLayout column, ModernUi.Palette ui) {
        column.addView(MorpheDialog.section(activity, "Comment levels", ui.accent));
        ModernTheme.Depth depth = currentDepthValue();
        ModernUi.Palette p = previewPalette();

        LinearLayout presets = column();
        LinearLayout[] presetLines = {new LinearLayout(activity), new LinearLayout(activity)};
        for (LinearLayout line : presetLines) presets.addView(line);
        for (int i = 0; i < ModernTheme.DEPTH_PRESETS.length; i++) {
            String preset = ModernTheme.DEPTH_PRESETS[i];
            boolean chosen = preset.equals(depth.preset);
            LinearLayout chip = new LinearLayout(activity);
            chip.setOrientation(LinearLayout.VERTICAL);
            chip.setPadding(dp(10), dp(6), dp(10), dp(6));
            GradientDrawable plate = new GradientDrawable();
            plate.setCornerRadius(dp(14));
            plate.setColor(p.container);
            plate.setStroke(chosen ? dp(2) : Math.max(1, dp(1)), chosen ? ui.accent : ui.outline);
            chip.setBackground(plate);
            LinearLayout strip = new LinearLayout(activity);
            strip.setOrientation(LinearLayout.HORIZONTAL);
            // Five are plenty for a preview, whatever the preset gives.
            for (int color : ModernTheme.depthPreset(preset, 5, p.roles, light)) {
                View swatch = new View(activity);
                swatch.setBackgroundColor(color);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(10), dp(14));
                lp.rightMargin = dp(2);
                strip.addView(swatch, lp);
            }
            chip.addView(strip);
            TextView name = small(ModernTheme.DEPTH_NAMES[i], p.onSurface, 12);
            name.setPadding(0, dp(4), 0, 0);
            chip.addView(name);
            chip.setClickable(true);
            chip.setOnClickListener(v -> {
                ModernTheme.Depth next = currentDepthValue();
                next.preset = preset;
                if ("joey".equals(preset)) next.count = 9;
                else if (next.count > 8) next.count = 8;
                java.util.Arrays.fill(next.custom, "");
                saveDepth(next);
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            lp.rightMargin = dp(8);
            lp.bottomMargin = dp(8);
            presetLines[i / 3].addView(chip, lp);
        }
        column.addView(presets);

        column.addView(note("Colours repeat after the last level.", ui));
        List<TextView> counts = new ArrayList<>();
        int[] options = "joey".equals(depth.preset) ? new int[]{2, 3, 4, 5, 9} : new int[]{2, 3, 4, 5, 8};
        for (int option : options) {
            TextView count = MorpheDialog.action(activity, option == 9 ? "All 9" : String.valueOf(option),
                    option == depth.count ? MorpheDialog.GOLD : MorpheDialog.TEXT);
            count.setOnClickListener(v -> {
                ModernTheme.Depth next = currentDepthValue();
                next.count = option;
                saveDepth(next);
            });
            counts.add(count);
        }
        column.addView(left(counts));

        // The levels themselves. Tap one to change it.
        LinearLayout levels = new LinearLayout(activity);
        levels.setOrientation(LinearLayout.HORIZONTAL);
        levels.setPadding(0, dp(10), 0, dp(2));
        int[] colors = depthColors(p);
        int shown = Math.min(depth.count, colors.length);
        for (int i = 0; i < shown; i++) {
            int level = i;
            LinearLayout cell = column();
            cell.setGravity(Gravity.CENTER_HORIZONTAL);
            View swatch = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(dp(8));
            shape.setColor(colors[i]);
            boolean fixed = depth.custom[i] != null && !depth.custom[i].isEmpty();
            shape.setStroke(fixed ? dp(2) : Math.max(1, dp(1)), fixed ? ui.onSurface : ui.outline);
            swatch.setBackground(shape);
            cell.addView(swatch, new LinearLayout.LayoutParams(dp(30), dp(30)));
            TextView label = small(String.valueOf(i + 1), ui.onSurfaceVariant, 11);
            cell.addView(label);
            cell.setClickable(true);
            cell.setOnClickListener(v -> editLevel(level));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(10);
            levels.addView(cell, lp);
        }
        column.addView(levels);

        CheckBox hide = MorpheDialog.check(activity, "Hide the colour bars", depth.hidden, null);
        hide.setOnCheckedChangeListener((b, on) -> {
            ModernTheme.Depth next = currentDepthValue();
            next.hidden = on;
            saveDepth(next);
        });
        column.addView(hide);
    }

    private void editLevel(int level) {
        ModernUi.Palette p = previewPalette();
        int[] colors = depthColors(p);
        if (level >= colors.length) return;
        ModernTheme.Depth depth = currentDepthValue();
        boolean fixed = depth.custom[level] != null && !depth.custom[level].isEmpty();
        pickColour("Comment level " + (level + 1), colors[level], p, fixed ? "Use the preset colour" : null, value -> {
            ModernTheme.Depth next = currentDepthValue();
            if ("joey".equals(next.preset) && next.count == 9 && !next.hasCustom()) {
                // Joey's nine stay Joey's until one is changed. Keep them, now as our own list.
                next.count = 9;
            }
            next.custom[level] = value;
            saveDepth(next);
        });
    }

    private interface ColourSink {
        void put(String value);
    }

    /** Swatches from the theme, hue, saturation and lightness, or a hex code. "" means reset. */
    private void pickColour(String title, int color, ModernUi.Palette p, String resetLabel, ColourSink sink) {
        ModernUi.Palette ui = ModernUi.getPalette(activity);
        LinearLayout page = MorpheDialog.page(activity, title, null);
        AlertDialog[] shown = new AlertDialog[1];
        HorizontalScrollView scroll = new HorizontalScrollView(activity);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(8), 0, dp(8));
        List<Integer> seen = new ArrayList<>();
        List<Integer> offer = new ArrayList<>();
        for (int c : ModernTheme.JOEY_DEPTH) offer.add(c);
        for (int r : ORDER) offer.add(shownColor(p, r));
        for (int c : offer) {
            if (seen.contains(c)) continue;
            seen.add(c);
            View dot = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setShape(GradientDrawable.OVAL);
            shape.setColor(c);
            shape.setStroke(Math.max(1, dp(1)), 0x66808080);
            dot.setBackground(shape);
            dot.setOnClickListener(v -> {
                shown[0].dismiss();
                sink.put(ModernTheme.hex(c));
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(28), dp(28));
            lp.rightMargin = dp(8);
            row.addView(dot, lp);
        }
        scroll.addView(row);
        page.addView(scroll);

        float[] hsl = ModernTheme.hsl(color);
        View live = new View(activity);
        GradientDrawable liveShape = new GradientDrawable();
        liveShape.setCornerRadius(dp(8));
        liveShape.setColor(color);
        live.setBackground(liveShape);
        EditText field = new EditText(activity);
        field.setText(ModernTheme.hex(color));
        field.setSingleLine(true);
        field.setTextColor(ui.onSurface);
        Runnable sync = () -> {
            int mixed = ModernTheme.fromHsl(hsl);
            liveShape.setColor(mixed);
            field.setText(ModernTheme.hex(mixed));
        };
        page.addView(bar("Hue", 360, Math.round(hsl[0]), value -> hsl[0] = value, sync, ui));
        page.addView(bar("Saturation", 100, Math.round(hsl[1] * 100), value -> hsl[1] = value / 100f, sync, ui));
        page.addView(bar("Lightness", 100, Math.round(hsl[2] * 100), value -> hsl[2] = value / 100f, sync, ui));
        LinearLayout fixedRow = new LinearLayout(activity);
        fixedRow.setOrientation(LinearLayout.HORIZONTAL);
        fixedRow.setGravity(Gravity.CENTER_VERTICAL);
        fixedRow.addView(live, new LinearLayout.LayoutParams(dp(32), dp(32)));
        LinearLayout.LayoutParams fieldLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        fieldLp.leftMargin = dp(10);
        fixedRow.addView(field, fieldLp);
        page.addView(fixedRow);

        List<TextView> buttons = new ArrayList<>();
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> shown[0].dismiss());
        buttons.add(cancel);
        if (resetLabel != null) {
            TextView reset = MorpheDialog.action(activity, resetLabel, MorpheDialog.TEXT);
            reset.setOnClickListener(v -> {
                shown[0].dismiss();
                sink.put("");
            });
            buttons.add(reset);
        }
        TextView use = MorpheDialog.action(activity, "Use", MorpheDialog.GOLD);
        use.setOnClickListener(v -> {
            try {
                int typed = Color.parseColor(field.getText().toString().trim());
                shown[0].dismiss();
                sink.put(ModernTheme.hex(typed));
            } catch (Throwable ignored) {
                field.setError("Use #RRGGBB");
            }
        });
        buttons.add(use);
        page.addView(MorpheDialog.actions(activity, buttons.toArray(new TextView[0])));
        shown[0] = MorpheDialog.show(activity, page, 440);
    }

    private View bar(String title, int max, int value, IntSink sink, Runnable sync, ModernUi.Palette ui) {
        LinearLayout box = column();
        TextView label = small(title, ui.onSurfaceVariant, 12);
        box.addView(label);
        SeekBar seek = new SeekBar(activity);
        seek.setMax(max);
        seek.setProgress(value);
        try {
            seek.getThumb().setTint(ui.accent);
            seek.getProgressDrawable().setTint(ui.accent);
        } catch (Throwable ignored) {
        }
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) return;
                sink.put(progress);
                sync.run();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        box.addView(seek);
        return box;
    }

    private TextView note(String text, ModernUi.Palette ui) {
        TextView view = new TextView(activity);
        view.setText(text);
        view.setTextColor(ui.onSurfaceVariant);
        view.setTextSize(12);
        view.setPadding(0, dp(4), 0, dp(2));
        return view;
    }

    private void themeRow(LinearLayout column, String title, String[] ids, ModernUi.Palette ui) {
        TextView label = new TextView(activity);
        label.setText(title);
        label.setTextColor(ui.onSurfaceVariant);
        label.setTextSize(12);
        label.setPadding(0, dp(6), 0, dp(4));
        column.addView(label);
        HorizontalScrollView scroll = new HorizontalScrollView(activity);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        boolean previewLight = light;
        for (String option : ids) {
            boolean chosen = option.equalsIgnoreCase(id);
            boolean optionLight = previewLight && ModernTheme.hasLight(activity, option);
            ModernUi.Palette swatch = ModernUi.paletteFor(activity, option, optionLight);
            LinearLayout chip = new LinearLayout(activity);
            chip.setOrientation(LinearLayout.HORIZONTAL);
            chip.setGravity(Gravity.CENTER_VERTICAL);
            chip.setPadding(dp(8), dp(6), dp(12), dp(6));
            GradientDrawable plate = new GradientDrawable();
            plate.setCornerRadius(dp(18));
            plate.setColor(swatch.canvas);
            plate.setStroke(chosen ? dp(2) : Math.max(1, dp(1)), chosen ? ui.accent : ui.outline);
            chip.setBackground(plate);
            View dot = new View(activity);
            GradientDrawable dotShape = new GradientDrawable();
            dotShape.setShape(GradientDrawable.OVAL);
            dotShape.setColor(swatch.accent);
            dot.setBackground(dotShape);
            chip.addView(dot, new LinearLayout.LayoutParams(dp(14), dp(14)));
            TextView name = new TextView(activity);
            name.setText(ModernTheme.name(activity, option));
            name.setTextColor(swatch.onSurface);
            name.setTextSize(13);
            name.setPadding(dp(6), 0, 0, 0);
            chip.addView(name);
            chip.setClickable(true);
            chip.setOnClickListener(v -> {
                if (!option.equalsIgnoreCase(id)) select(option);
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(8);
            row.addView(chip, lp);
        }
        scroll.addView(row);
        column.addView(scroll);
        if (ids.length > 0) {
            int chosenIndex = -1;
            for (int i = 0; i < ids.length; i++) if (ids[i].equalsIgnoreCase(id)) chosenIndex = i;
            if (chosenIndex > 0) {
                int index = chosenIndex;
                scroll.post(() -> {
                    View chosenChip = row.getChildAt(index);
                    if (chosenChip != null) scroll.scrollTo(Math.max(0, chosenChip.getLeft() - dp(24)), 0);
                });
            }
        }
    }

    private interface IntSink {
        void put(int value);
    }

    /** Moves the preview while dragging and saves when let go. */
    private View slider(String title, int min, int max, int value, IntSink sink, ModernUi.Palette ui) {
        LinearLayout box = column();
        TextView label = new TextView(activity);
        label.setTextColor(ui.onSurface);
        label.setTextSize(13);
        label.setText(title + "  " + signed(value));
        box.addView(label);
        SeekBar bar = new SeekBar(activity);
        bar.setMax(max - min);
        bar.setProgress(value - min);
        try {
            bar.getThumb().setTint(ui.accent);
            bar.getProgressDrawable().setTint(ui.accent);
        } catch (Throwable ignored) {
        }
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) return;
                sink.put(progress + min);
                label.setText(title + "  " + signed(progress + min));
                repaintPreview();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                ModernTheme.saveTweaks(activity, id, tweaks);
                applied();
            }
        });
        box.addView(bar);
        return box;
    }

    private static String signed(int value) {
        return value > 0 ? "+" + value : String.valueOf(value);
    }

    private interface NameSink {
        void put(String name);
    }

    private void askName(String title, String start, NameSink sink) {
        LinearLayout page = MorpheDialog.page(activity, title, null);
        EditText field = new EditText(activity);
        field.setText(start);
        field.setSelectAllOnFocus(true);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        field.setTextColor(MorpheDialog.text(activity));
        page.addView(field);
        AlertDialog[] shown = new AlertDialog[1];
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> shown[0].dismiss());
        TextView ok = MorpheDialog.action(activity, "Save", MorpheDialog.GOLD);
        ok.setOnClickListener(v -> {
            String name = field.getText().toString().trim();
            if (name.isEmpty()) return;
            shown[0].dismiss();
            sink.put(name);
        });
        page.addView(MorpheDialog.actions(activity, cancel, ok));
        shown[0] = MorpheDialog.show(activity, page);
    }

    // ---------------------------------------------------------------------
    // One colour
    // ---------------------------------------------------------------------

    private void editRole(int role) {
        new RoleEditor(role).open();
    }

    private final class RoleEditor {
        private int role;
        private AlertDialog shown;
        private final LinearLayout page;
        private final float[] hsl = new float[3];

        RoleEditor(int role) {
            this.role = role;
            page = column();
        }

        void open() {
            build();
            shown = MorpheDialog.show(activity, page, 440);
        }

        private void build() {
            ModernUi.Palette ui = ModernUi.getPalette(activity);
            ModernUi.Palette p = previewPalette();
            page.removeAllViews();
            page.setBackgroundColor(ui.container);
            page.setPadding(dp(20), dp(18), dp(20), dp(8));
            if (shown != null && shown.getWindow() != null) {
                shown.getWindow().setBackgroundDrawable(new ColorDrawable(ui.container));
            }

            TextView title = new TextView(activity);
            title.setText(ModernTheme.LABELS[role]);
            title.setTextColor(ui.accent);
            title.setTextSize(20);
            page.addView(title);
            page.addView(note(ModernTheme.name(activity, id) + ", " + (light ? "light" : "dark") + " colours", ui));

            TextView other = MorpheDialog.action(activity, "Colour: " + ModernTheme.LABELS[role] + "  ▾", MorpheDialog.TEXT);
            other.setOnClickListener(v -> chooseAny(next -> {
                role = next;
                build();
            }));
            LinearLayout otherRow = left(other);
            page.addView(otherRow);

            int color = shownColor(p, role);
            LinearLayout now = new LinearLayout(activity);
            now.setOrientation(LinearLayout.HORIZONTAL);
            now.setGravity(Gravity.CENTER_VERTICAL);
            now.setPadding(0, dp(12), 0, dp(4));
            View swatch = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(dp(10));
            shape.setColor(color);
            shape.setStroke(Math.max(1, dp(1)), ui.outline);
            swatch.setBackground(shape);
            now.addView(swatch, new LinearLayout.LayoutParams(dp(48), dp(48)));
            TextView hex = new TextView(activity);
            hex.setText(ModernTheme.hex(color) + "\n" + readability(p, role, color));
            hex.setTextColor(ui.onSurface);
            hex.setTextSize(13);
            hex.setPadding(dp(12), 0, 0, 0);
            now.addView(hex);
            page.addView(now);

            String current = ModernTheme.override(activity, id, light, role);
            boolean follows = current == null;
            boolean same = current != null && current.startsWith("=");
            String sameName = same ? ModernTheme.LABELS[Math.max(0, ModernTheme.indexOf(current.substring(1)))] : null;

            page.addView(MorpheDialog.section(activity, "Use", ui.accent));
            TextView follow = MorpheDialog.action(activity, "Follow theme", follows ? MorpheDialog.GOLD : MorpheDialog.TEXT);
            follow.setOnClickListener(v -> save(""));
            TextView sameAs = MorpheDialog.action(activity, same ? "Same as " + sameName : "Same as…",
                    same ? MorpheDialog.GOLD : MorpheDialog.TEXT);
            sameAs.setOnClickListener(v -> {
                List<Integer> roles = new ArrayList<>();
                List<String> labels = new ArrayList<>();
                for (int r : ORDER) {
                    if (r == role) continue;
                    roles.add(r);
                    labels.add(ModernTheme.LABELS[r]);
                }
                MorpheDialog.choices(activity, "Same as", labels.toArray(new String[0]), -1,
                        index -> save("=" + ModernTheme.KEYS[roles.get(index)]));
            });
            LinearLayout useRow = left(follow, sameAs);
            page.addView(useRow);
            if (role == ModernTheme.UPVOTE || role == ModernTheme.DOWNVOTE) {
                TextView standard = MorpheDialog.action(activity, "Standard Reddit colour", MorpheDialog.TEXT);
                standard.setOnClickListener(v -> save(ModernTheme.hex(ModernTheme.standard(role))));
                LinearLayout standardRow = left(standard);
                page.addView(standardRow);
            }

            page.addView(MorpheDialog.section(activity, "Fixed colour" + (!follows && !same ? " (in use)" : ""), ui.accent));
            page.addView(note("From this theme", ui));
            page.addView(paletteRow(p));
            float[] start = ModernTheme.hsl(color);
            System.arraycopy(start, 0, hsl, 0, 3);
            View live = new View(activity);
            GradientDrawable liveShape = new GradientDrawable();
            liveShape.setCornerRadius(dp(8));
            liveShape.setColor(color);
            live.setBackground(liveShape);
            EditText field = new EditText(activity);
            field.setText(ModernTheme.hex(color));
            field.setSingleLine(true);
            field.setTextColor(ui.onSurface);
            field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
            Runnable sync = () -> {
                int mixed = ModernTheme.fromHsl(hsl);
                liveShape.setColor(mixed);
                field.setText(ModernTheme.hex(mixed));
            };
            page.addView(hslBar("Hue", 360, Math.round(hsl[0]), value -> hsl[0] = value, sync, ui));
            page.addView(hslBar("Saturation", 100, Math.round(hsl[1] * 100), value -> hsl[1] = value / 100f, sync, ui));
            page.addView(hslBar("Lightness", 100, Math.round(hsl[2] * 100), value -> hsl[2] = value / 100f, sync, ui));
            LinearLayout fixedRow = new LinearLayout(activity);
            fixedRow.setOrientation(LinearLayout.HORIZONTAL);
            fixedRow.setGravity(Gravity.CENTER_VERTICAL);
            fixedRow.addView(live, new LinearLayout.LayoutParams(dp(32), dp(32)));
            LinearLayout.LayoutParams fieldLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            fieldLp.leftMargin = dp(10);
            fixedRow.addView(field, fieldLp);
            TextView use = MorpheDialog.action(activity, "Use", MorpheDialog.GOLD);
            use.setOnClickListener(v -> {
                try {
                    int typed = Color.parseColor(field.getText().toString().trim());
                    save(ModernTheme.hex(typed));
                } catch (Throwable ignored) {
                    field.setError("Use #RRGGBB");
                }
            });
            fixedRow.addView(use);
            page.addView(fixedRow);

            TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.SUB);
            done.setOnClickListener(v -> shown.dismiss());
            page.addView(MorpheDialog.actions(activity, done));
        }

        private View paletteRow(ModernUi.Palette p) {
            HorizontalScrollView scroll = new HorizontalScrollView(activity);
            scroll.setHorizontalScrollBarEnabled(false);
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            List<Integer> seen = new ArrayList<>();
            for (int r : ORDER) {
                int color = shownColor(p, r);
                if (seen.contains(color)) continue;
                seen.add(color);
                View dot = new View(activity);
                GradientDrawable shape = new GradientDrawable();
                shape.setShape(GradientDrawable.OVAL);
                shape.setColor(color);
                shape.setStroke(Math.max(1, dp(1)), 0x66808080);
                dot.setBackground(shape);
                dot.setOnClickListener(v -> save(ModernTheme.hex(color)));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(28), dp(28));
                lp.rightMargin = dp(8);
                row.addView(dot, lp);
            }
            scroll.addView(row);
            return scroll;
        }

        private View hslBar(String title, int max, int value, IntSink sink, Runnable sync, ModernUi.Palette ui) {
            LinearLayout box = column();
            TextView label = new TextView(activity);
            label.setText(title);
            label.setTextColor(ui.onSurfaceVariant);
            label.setTextSize(12);
            box.addView(label);
            SeekBar bar = new SeekBar(activity);
            bar.setMax(max);
            bar.setProgress(value);
            try {
                bar.getThumb().setTint(ui.accent);
                bar.getProgressDrawable().setTint(ui.accent);
            } catch (Throwable ignored) {
            }
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override
                public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                    if (!fromUser) return;
                    sink.put(progress);
                    sync.run();
                }

                @Override
                public void onStartTrackingTouch(SeekBar seekBar) {
                }

                @Override
                public void onStopTrackingTouch(SeekBar seekBar) {
                }
            });
            box.addView(bar);
            return box;
        }

        private void save(String value) {
            ModernTheme.setOverride(activity, id, light, role, value);
            applied();
            build();
        }
    }

    private static int shownColor(ModernUi.Palette p, int role) {
        int color = p.roles[role];
        return color != 0 ? color : ModernTheme.standard(role);
    }

    /** Text needs 4.5:1 on the background and cards. Icons, dividers and votes need 3:1. */
    private static String readability(ModernUi.Palette p, int role, int color) {
        boolean text = role == ModernTheme.TEXT || role == ModernTheme.SECONDARY || role == ModernTheme.LINKS
                || role == ModernTheme.READ;
        boolean mark = role == ModernTheme.UPVOTE || role == ModernTheme.DOWNVOTE || role == ModernTheme.PINNED
                || role == ModernTheme.ACCENT;
        if (role == ModernTheme.ON_ACCENT) {
            double ratio = ModernTheme.contrast(color, p.accent);
            return verdict(ratio, 4.5) + " on the accent";
        }
        if (!text && !mark) return "Surface colour";
        double ratio = Math.min(ModernTheme.contrast(color, p.canvas), ModernTheme.contrast(color, p.container));
        return verdict(ratio, text ? 4.5 : 3.0) + " on the background and cards";
    }

    private static String verdict(double ratio, double need) {
        String value = String.format(java.util.Locale.US, "%.1f:1", ratio);
        return ratio >= need ? "Easy to read (" + value + ")" : "Hard to read (" + value + ")";
    }
}
