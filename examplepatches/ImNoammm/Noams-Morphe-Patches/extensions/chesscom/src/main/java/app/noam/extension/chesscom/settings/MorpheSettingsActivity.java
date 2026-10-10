package app.noam.extension.chesscom.settings;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.arcade.ArcadePreview;
import app.noam.extension.chesscom.board.BoardColors;
import app.noam.extension.chesscom.home.HomeLayout;
import app.noam.extension.chesscom.home.HomeTabs;
import app.noam.extension.chesscom.review.LichessReview;
import app.noam.extension.chesscom.theme.Accent;
import app.noam.extension.chesscom.theme.Amoled;

/**
 * The Noam's Patches screens, built in code in chess.com's dark settings style. Features with
 * options open their own page (Intent extra {@link #EXTRA_PAGE}).
 */
public final class MorpheSettingsActivity extends Activity {
    public static final String EXTRA_PAGE = "morphe_page";

    private static final String TITLE = "Noam's Patches";
    private static final int TEXT = 0xFFFFFFFF;
    private static final int TEXT_SECONDARY = 0xFFB4B2B0;
    /** Features that take effect when the app starts. */
    private static final List<String> NEED_RESTART = Arrays.asList(
        Features.AMOLED, Features.ACCENT, Features.NO_ADS, Features.CUSTOM_TABS);

    /** A change waits for the app to restart; kept across these screens until it does. */
    private static boolean restartPending;

    private int backgroundColor, cardColor, lineColor, accent;
    private String page;
    private LinearLayout root, bar, list;
    private View restartBar;
    private TextView restartButton;
    private ValueAnimator glow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        page = getIntent().getStringExtra(EXTRA_PAGE);

        root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);

        bar = toolbar(title());
        root.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));

        ScrollView scroll = new ScrollView(this);
        scroll.setClipToPadding(false);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(0, 0, 0, dp(16));
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        restartBar = restartBar();
        root.addView(restartBar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));

        // The app targets an SDK where activities draw edge to edge: keep content off the bars.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top;
            int bottom;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                top = bars.top;
                bottom = bars.bottom;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
            }
            bar.setPadding(bar.getPaddingLeft(), top, bar.getPaddingRight(), 0);
            root.setPadding(0, 0, 0, bottom);
            return insets;
        });
        setContentView(root);
        render();
    }

    @Override
    protected void onResume() {
        super.onResume();
        render();
        if (glow != null) glow.resume();
    }

    @Override
    protected void onPause() {
        if (glow != null) glow.pause();
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        if (glow != null) glow.cancel();
        super.onDestroy();
    }

    private String title() {
        if (Features.PAGE_HOME.equals(page)) return "Home screen";
        if (Features.PAGE_TABS.equals(page)) return "Bottom bar";
        if (Features.PAGE_BOARD_COLORS.equals(page)) return "Board colors";
        if (Features.PAGE_ARCADE.equals(page)) return "Arcade animations";
        if (Features.PAGE_ACCENT.equals(page)) return "Accent color";
        if (Features.PAGE_LICHESS.equals(page)) return "Review on Lichess";
        return TITLE;
    }

    private void render() {
        if (list == null) return;
        boolean amoled = Amoled.enabled();
        backgroundColor = amoled ? 0xFF000000 : 0xFF262421;
        cardColor = amoled ? 0xFF161616 : 0xFF312E2B;
        lineColor = amoled ? 0xFF262626 : 0xFF3C3A37;
        accent = Accent.current();
        root.setBackgroundColor(backgroundColor);
        bar.setBackgroundColor(backgroundColor);
        restartBar.setBackgroundColor(cardColor);
        restartBar.setVisibility(restartPending ? View.VISIBLE : View.GONE);
        GradientDrawable button = new GradientDrawable();
        button.setColor(accent | 0xFF000000);
        button.setCornerRadius(dp(18));
        restartButton.setBackground(button);
        restartButton.setTextColor(contrast(accent));
        getWindow().setStatusBarColor(backgroundColor);
        getWindow().setNavigationBarColor(restartPending ? cardColor : backgroundColor);

        list.removeAllViews();
        if (Features.PAGE_HOME.equals(page)) renderHome();
        else if (Features.PAGE_TABS.equals(page)) renderTabs();
        else if (Features.PAGE_BOARD_COLORS.equals(page)) renderBoardColors();
        else if (Features.PAGE_ARCADE.equals(page)) renderArcade();
        else if (Features.PAGE_ACCENT.equals(page)) renderAccent();
        else if (Features.PAGE_LICHESS.equals(page)) renderLichess();
        else renderMain();
    }

    private void open(String target) {
        startActivity(new Intent(this, MorpheSettingsActivity.class).putExtra(EXTRA_PAGE, target));
    }

    private void restartNeeded() {
        restartPending = true;
        render();
    }

    /** Starts the app afresh, as Settings would after a force stop. */
    private void restartApp() {
        try {
            Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
            if (launch == null || launch.getComponent() == null) return;
            Intent restart = Intent.makeRestartActivityTask(launch.getComponent());
            restart.setPackage(getPackageName());
            startActivity(restart);
            Runtime.getRuntime().exit(0);
        } catch (Throwable throwable) {
            Utils.logError("Restart failed", throwable);
        }
    }

    private void renderMain() {
        List<Features.Feature> features = Features.patched();
        if (features.isEmpty()) {
            list.addView(caption("No features were selected when this app was patched."));
            return;
        }
        for (String section : Features.SECTIONS) {
            LinearLayout group = null;
            for (Features.Feature feature : features) {
                if (!section.equals(feature.section)) continue;
                if (group == null) {
                    list.addView(header(section));
                    group = card();
                    list.addView(group, cardParams());
                } else {
                    group.addView(divider(56));
                }
                group.addView(featureRow(feature));
            }
        }
        list.addView(caption("Only the features selected when the app was patched are listed."));
    }

    private void renderHome() {
        list.addView(header("Tiles"));
        LinearLayout tiles = card();
        list.addView(tiles, cardParams());
        List<String> order = HomeLayout.tileOrder();
        Set<String> hidden = HomeLayout.hiddenTiles();
        for (int i = 0; i < order.size(); i++) {
            String id = order.get(i);
            int index = i;
            if (i > 0) tiles.addView(divider(16));
            tiles.addView(reorderRow(HomeLayout.tileTitle(id), !hidden.contains(id),
                checked -> HomeLayout.setTileHidden(id, !checked),
                index > 0 ? () -> moveTile(order, index, -1) : null,
                index < order.size() - 1 ? () -> moveTile(order, index, 1) : null));
        }
        list.addView(header("Sections"));
        LinearLayout sections = card();
        list.addView(sections, cardParams());
        Set<String> hiddenSections = HomeLayout.hiddenSections();
        for (int i = 0; i < HomeLayout.SECTIONS.length; i++) {
            String id = HomeLayout.SECTIONS[i];
            if (i > 0) sections.addView(divider(16));
            sections.addView(switchRow(HomeLayout.SECTION_TITLES[i], null, !hiddenSections.contains(id),
                checked -> HomeLayout.setSectionHidden(id, !checked)));
        }
        list.addView(caption("Changes show when you go back to the Home screen. chess.com's own "
            + "Home settings (streak, Chess TV, recommendations) stay in its Settings."));
    }

    private void moveTile(List<String> order, int index, int delta) {
        List<String> moved = new ArrayList<>(order);
        String id = moved.remove(index);
        moved.add(index + delta, id);
        HomeLayout.setTileOrder(moved);
        render();
    }

    private void renderTabs() {
        list.addView(header("Between Home and More"));
        LinearLayout tabs = card();
        list.addView(tabs, cardParams());
        List<String> order = HomeTabs.order();
        List<String> shown = HomeTabs.shownTabs();
        for (int i = 0; i < order.size(); i++) {
            String name = order.get(i);
            int index = i;
            if (i > 0) tabs.addView(divider(16));
            tabs.addView(reorderRow(tabTitle(name), shown.contains(name),
                checked -> toggleTab(name, checked),
                index > 0 ? () -> moveTab(order, index, -1) : null,
                index < order.size() - 1 ? () -> moveTab(order, index, 1) : null));
        }
        list.addView(caption("Up to " + HomeTabs.MAX_MIDDLE_TABS + " tabs. Bots and Train are tabs "
            + "chess.com shows only in some experiments. The new bar shows after a restart."));
    }

    private String tabTitle(String name) {
        int index = Arrays.asList(HomeTabs.TABS).indexOf(name);
        return index < 0 ? name : HomeTabs.TAB_TITLES[index];
    }

    private void toggleTab(String name, boolean checked) {
        List<String> order = HomeTabs.order();
        List<String> shown = new ArrayList<>(HomeTabs.shownTabs());
        if (checked && !shown.contains(name)) {
            if (shown.size() >= HomeTabs.MAX_MIDDLE_TABS) {
                Toast.makeText(this, "Up to " + HomeTabs.MAX_MIDDLE_TABS + " tabs", Toast.LENGTH_SHORT).show();
                render();
                return;
            }
            shown.add(name);
        } else if (!checked) {
            shown.remove(name);
        }
        saveTabs(order, shown);
        restartNeeded();
    }

    private void moveTab(List<String> order, int index, int delta) {
        List<String> moved = new ArrayList<>(order);
        String name = moved.remove(index);
        moved.add(index + delta, name);
        saveTabs(moved, HomeTabs.shownTabs());
        restartNeeded();
    }

    /** Shown tabs follow the order of the full list. */
    private void saveTabs(List<String> order, List<String> shown) {
        List<String> ordered = new ArrayList<>();
        for (String name : order) if (shown.contains(name)) ordered.add(name);
        HomeTabs.save(order, ordered);
    }

    private void renderBoardColors() {
        int dark = BoardColors.dark(), light = BoardColors.light();
        LinearLayout preview = card();
        preview.setPadding(dp(12), dp(12), dp(12), dp(12));
        preview.addView(boardPreview(dark, light), new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(84)));
        list.addView(preview, cardParams(16));

        list.addView(header("chess.com colors"));
        List<View> presets = new ArrayList<>();
        for (String[] preset : BoardColors.PRESETS) {
            int presetDark = Color.parseColor(preset[1]), presetLight = Color.parseColor(preset[2]);
            boolean selected = presetDark == dark && presetLight == light;
            presets.add(choice(miniBoard(presetDark, presetLight, selected), 56, preset[0], selected, () -> {
                BoardColors.set(presetDark, presetLight);
                render();
            }));
        }
        list.addView(grid(4, presets), cardParams());

        list.addView(header("Your own"));
        LinearLayout custom = card();
        list.addView(custom, cardParams());
        custom.addView(colorRow("Light squares", light, color -> BoardColors.set(BoardColors.dark(), color)));
        custom.addView(divider(56));
        custom.addView(colorRow("Dark squares", dark, color -> BoardColors.set(color, BoardColors.light())));
        list.addView(caption("Every board uses these colours while Board colors is on. Boards already "
            + "open change when they next redraw."));
    }

    private void renderArcade() {
        LinearLayout preview = card();
        preview.setPadding(dp(12), dp(12), dp(12), dp(12));
        preview.addView(new ArcadePreview(this), new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(156)));
        list.addView(preview, cardParams(16));
        list.addView(caption("A light trail follows each move, the square lights up where the piece "
            + "lands and captures burst. In games, pieces also flash as you pick them up and drop "
            + "them, a king in check flashes and move hints are animated."));
        list.addView(caption("The effects are chess.com's own Arcade images from its website, "
            + "downloaded once and kept in the app."));
    }

    private void renderAccent() {
        int chosen = Accent.color();
        LinearLayout preview = card();
        preview.setPadding(dp(16), dp(16), dp(16), dp(16));
        preview.addView(accentPreview(chosen));
        list.addView(preview, cardParams(16));

        list.addView(header("Colors"));
        List<View> presets = new ArrayList<>();
        for (String[] preset : Accent.PRESETS) {
            int color = Color.parseColor(preset[1]);
            boolean selected = (color | 0xFF000000) == (chosen | 0xFF000000);
            presets.add(choice(dot(color, selected), 44, preset[0], selected, () -> setAccent(color)));
        }
        list.addView(grid(5, presets), cardParams());

        list.addView(header("Your own"));
        LinearLayout custom = card();
        list.addView(custom, cardParams());
        custom.addView(colorRow("Accent color", chosen, this::setAccent));

        String note = "chess.com's green becomes this colour, with its lighter and darker shades: "
            + "buttons, highlights, icons and text. It shows everywhere after a restart.";
        if (!Features.isEnabled(Features.ACCENT)) note = "Accent color is switched off on the main page. " + note;
        list.addView(caption(note));
    }

    private void setAccent(int color) {
        Accent.setColor(color);
        restartNeeded();
    }

    private void renderLichess() {
        list.addView(header("When"));
        LinearLayout group = card();
        list.addView(group, cardParams());
        group.addView(switchRow("Always use Lichess",
            "When off, chess.com's own Game Review is used while you have a free review left, and "
                + "Lichess once it's used up.",
            LichessReview.always(), LichessReview::setAlways));
        list.addView(caption("Your game is imported to lichess.org (no account needed) and opens in a "
            + "browser inside the app, with Lichess's free analysis: the engine's evaluation, best "
            + "moves, inaccuracies, mistakes and blunders. \"Open in browser\" moves it to your own "
            + "browser."));
    }

    /** Two ranks of a board in the given colours. */
    private View boardPreview(int dark, int light) {
        return new View(this) {
            private final Paint paint = new Paint();
            private final Path clip = new Path();
            private final RectF bounds = new RectF();

            @Override
            protected void onDraw(Canvas canvas) {
                float size = Math.min(getWidth() / 8f, getHeight() / 2f);
                float left = (getWidth() - size * 8) / 2;
                bounds.set(left, 0, left + size * 8, size * 2);
                clip.reset();
                clip.addRoundRect(bounds, dp(6), dp(6), Path.Direction.CW);
                canvas.save();
                canvas.clipPath(clip);
                for (int row = 0; row < 2; row++) {
                    for (int column = 0; column < 8; column++) {
                        paint.setColor((row + column) % 2 == 0 ? light : dark);
                        canvas.drawRect(left + column * size, row * size, left + (column + 1) * size,
                            (row + 1) * size, paint);
                    }
                }
                canvas.restore();
            }
        };
    }

    /** A 3×3 corner of a board, ringed in the accent colour when chosen. */
    private View miniBoard(int dark, int light, boolean selected) {
        return new View(this) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path clip = new Path();
            private final RectF bounds = new RectF();

            @Override
            protected void onDraw(Canvas canvas) {
                float side = Math.min(getWidth(), getHeight());
                float ring = dp(3);
                float left = (getWidth() - side) / 2 + ring * 1.5f, top = (getHeight() - side) / 2 + ring * 1.5f;
                float inner = side - ring * 3, square = inner / 3;
                bounds.set(left, top, left + inner, top + inner);
                clip.reset();
                clip.addRoundRect(bounds, dp(6), dp(6), Path.Direction.CW);
                canvas.save();
                canvas.clipPath(clip);
                paint.setStyle(Paint.Style.FILL);
                for (int row = 0; row < 3; row++) {
                    for (int column = 0; column < 3; column++) {
                        paint.setColor((row + column) % 2 == 0 ? light : dark);
                        canvas.drawRect(left + column * square, top + row * square,
                            left + (column + 1) * square, top + (row + 1) * square, paint);
                    }
                }
                canvas.restore();
                if (selected) {
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(ring);
                    paint.setColor(accent);
                    bounds.inset(-ring, -ring);
                    canvas.drawRoundRect(bounds, dp(8), dp(8), paint);
                }
            }
        };
    }

    /** A round swatch, with a ring and a check when chosen. */
    private View dot(int color, boolean selected) {
        return new View(this) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private final Path check = new Path();

            @Override
            protected void onDraw(Canvas canvas) {
                float cx = getWidth() / 2f, cy = getHeight() / 2f;
                float radius = Math.min(getWidth(), getHeight()) / 2f - dp(3);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(color | 0xFF000000);
                canvas.drawCircle(cx, cy, selected ? radius - dp(4) : radius, paint);
                if (!selected) return;
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(dp(2.5f));
                paint.setColor(TEXT);
                canvas.drawCircle(cx, cy, radius, paint);
                float s = radius * 0.32f;
                check.reset();
                check.moveTo(cx - s, cy);
                check.lineTo(cx - s * 0.25f, cy + s * 0.75f);
                check.lineTo(cx + s * 1.1f, cy - s * 0.7f);
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                paint.setColor(contrast(color));
                canvas.drawPath(check, paint);
            }
        };
    }

    /** What the accent looks like: a chess.com button, a switch, a link and the shades. */
    private View accentPreview(int color) {
        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int[] ladder = Accent.ladder(color);

        TextView button = text("Play", 17, contrast(color));
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        GradientDrawable edge = new GradientDrawable();
        edge.setColor(ladder[7]);
        edge.setCornerRadius(dp(10));
        GradientDrawable face = new GradientDrawable();
        face.setColor(color | 0xFF000000);
        face.setCornerRadius(dp(10));
        LayerDrawable shape = new LayerDrawable(new Drawable[] {edge, face});
        shape.setLayerInset(1, 0, 0, 0, dp(4));
        button.setBackground(shape);
        button.setPadding(dp(28), dp(10), dp(28), dp(14));
        row.addView(button);

        LinearLayout side = new LinearLayout(this);
        side.setOrientation(LinearLayout.VERTICAL);
        side.setGravity(Gravity.END);
        Switch sample = new Switch(this);
        tint(sample, color);
        sample.setChecked(true);
        sample.setClickable(false);
        sample.setFocusable(false);
        side.addView(sample, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView link = text("Best move", 15, color | 0xFF000000);
        link.setTypeface(Typeface.DEFAULT_BOLD);
        link.setPadding(0, dp(6), 0, 0);
        side.addView(link, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));
        row.addView(side, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        column.addView(row);

        LinearLayout strip = new LinearLayout(this);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        GradientDrawable rounded = new GradientDrawable();
        rounded.setCornerRadius(dp(8));
        rounded.setColor(Color.TRANSPARENT);
        strip.setBackground(rounded);
        strip.setClipToOutline(true);
        for (int shade : ladder) {
            View swatch = new View(this);
            swatch.setBackgroundColor(shade);
            strip.addView(swatch, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        }
        LinearLayout.LayoutParams stripParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(20));
        stripParams.topMargin = dp(16);
        column.addView(strip, stripParams);
        return column;
    }

    /** Black or white, whichever reads better on the colour. */
    private static int contrast(int color) {
        double luminance = (0.299 * Color.red(color) + 0.587 * Color.green(color) + 0.114 * Color.blue(color)) / 255;
        return luminance > 0.62 ? 0xFF262421 : TEXT;
    }

    private interface OnChecked {
        void onChecked(boolean checked);
    }

    private View featureRow(Features.Feature feature) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(64));

        LinearLayout main = new LinearLayout(this);
        main.setOrientation(LinearLayout.HORIZONTAL);
        main.setGravity(Gravity.CENTER_VERTICAL);
        main.setPadding(dp(16), dp(12), dp(8), dp(12));
        main.setMinimumHeight(dp(64));
        main.setBackground(ripple());
        View icon = icon(feature.icon, accent);
        if (icon != null) main.addView(icon, new LinearLayout.LayoutParams(dp(24), dp(24)));
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textParams.setMarginStart(icon != null ? dp(16) : 0);
        main.addView(texts(feature.title, feature.summary), textParams);
        if (feature.page != null) {
            View chevron = icon("glyph_arrow_chevron_right", TEXT_SECONDARY);
            if (chevron == null) chevron = text("›", 22, TEXT_SECONDARY);
            LinearLayout.LayoutParams chevronParams = new LinearLayout.LayoutParams(dp(20), dp(20));
            chevronParams.setMarginStart(dp(8));
            main.addView(chevron, chevronParams);
        }
        row.addView(main, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = toggle(Features.isEnabled(feature.id), checked -> {
            Features.setEnabled(feature.id, checked);
            if (NEED_RESTART.contains(feature.id)) restartNeeded();
        });
        if (feature.page != null) {
            View separator = new View(this);
            separator.setBackgroundColor(lineColor);
            row.addView(separator, new LinearLayout.LayoutParams(Math.max(1, dp(1)), dp(36)));
            main.setOnClickListener(view -> open(feature.page));
        } else {
            main.setOnClickListener(view -> toggle.toggle());
        }
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        switchParams.setMarginStart(dp(12));
        switchParams.setMarginEnd(dp(12));
        row.addView(toggle, switchParams);
        return row;
    }

    private LinearLayout texts(String title, String summary) {
        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(text(title, 16, TEXT));
        if (summary != null) {
            TextView detail = text(summary, 13, TEXT_SECONDARY);
            detail.setPadding(0, dp(2), 0, 0);
            texts.addView(detail);
        }
        return texts;
    }

    private View switchRow(String title, String summary, boolean checked, OnChecked onChecked) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(12), dp(12), dp(12));
        row.setMinimumHeight(dp(56));
        row.setBackground(ripple());
        row.addView(texts(title, summary), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch toggle = toggle(checked, onChecked);
        LinearLayout.LayoutParams switchParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        switchParams.setMarginStart(dp(12));
        row.addView(toggle, switchParams);
        row.setOnClickListener(view -> toggle.toggle());
        return row;
    }

    private View reorderRow(String title, boolean checked, OnChecked onChecked, Runnable up, Runnable down) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(12), dp(4), dp(8), dp(4));
        row.setMinimumHeight(dp(52));

        TextView label = text(title, 16, checked ? TEXT : TEXT_SECONDARY);
        Switch toggle = toggle(checked, isChecked -> {
            label.setTextColor(isChecked ? TEXT : TEXT_SECONDARY);
            onChecked.onChecked(isChecked);
        });
        row.addView(toggle);

        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.setMarginStart(dp(12));
        row.addView(label, labelParams);
        label.setOnClickListener(view -> toggle.toggle());

        row.addView(arrow(true, up));
        row.addView(arrow(false, down));
        return row;
    }

    /** A colour with its hex value; tapping it opens the colour picker. */
    private View colorRow(String title, int color, ColorPicker.Listener onColor) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(8), dp(16), dp(8));
        row.setMinimumHeight(dp(56));
        row.setBackground(ripple());
        GradientDrawable swatch = new GradientDrawable();
        swatch.setColor(color | 0xFF000000);
        swatch.setCornerRadius(dp(6));
        swatch.setStroke(Math.max(1, dp(1)), 0x33FFFFFF);
        View box = new View(this);
        box.setBackground(swatch);
        row.addView(box, new LinearLayout.LayoutParams(dp(24), dp(24)));
        TextView label = text(title, 16, TEXT);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.setMarginStart(dp(16));
        row.addView(label, labelParams);
        row.addView(text(String.format(Locale.ROOT, "#%06X", color & 0xFFFFFF), 15, TEXT_SECONDARY));
        row.setOnClickListener(view -> ColorPicker.show(this, title, color, picked -> {
            onColor.onColor(picked);
            render();
        }));
        return row;
    }

    /** A tappable swatch with its name below. */
    private View choice(View swatch, int sizeDp, String name, boolean selected, Runnable onClick) {
        LinearLayout cell = new LinearLayout(this);
        cell.setOrientation(LinearLayout.VERTICAL);
        cell.setGravity(Gravity.CENTER_HORIZONTAL);
        cell.setPadding(dp(4), dp(10), dp(4), dp(8));
        cell.setBackground(ripple());
        cell.addView(swatch, new LinearLayout.LayoutParams(dp(sizeDp), dp(sizeDp)));
        TextView label = text(name, 12, selected ? accent : TEXT_SECONDARY);
        label.setGravity(Gravity.CENTER);
        label.setMaxLines(2);
        label.setPadding(0, dp(4), 0, 0);
        cell.addView(label, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));
        cell.setOnClickListener(view -> onClick.run());
        return cell;
    }

    /** Cells in rows of {@code columns}, on a card. */
    private LinearLayout grid(int columns, List<View> cells) {
        LinearLayout grid = card();
        grid.setPadding(dp(4), dp(4), dp(4), dp(4));
        LinearLayout row = null;
        for (int i = 0; i < cells.size(); i++) {
            if (i % columns == 0) {
                row = new LinearLayout(this);
                row.setOrientation(LinearLayout.HORIZONTAL);
                grid.addView(row);
            }
            row.addView(cells.get(i), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }
        // Keep the last row's cells the same width as the others.
        for (int i = cells.size() % columns; i > 0 && i < columns; i++) {
            row.addView(new View(this), new LinearLayout.LayoutParams(0, 0, 1f));
        }
        return grid;
    }

    private Switch toggle(boolean checked, OnChecked onChecked) {
        Switch toggle = new Switch(this);
        tint(toggle, accent);
        toggle.setChecked(checked);
        toggle.setOnCheckedChangeListener((button, isChecked) -> onChecked.onChecked(isChecked));
        return toggle;
    }

    private static void tint(Switch toggle, int color) {
        int[][] states = {new int[] {android.R.attr.state_checked}, new int[] {}};
        toggle.setThumbTintList(new ColorStateList(states, new int[] {color | 0xFF000000, 0xFFD0CFCD}));
        toggle.setTrackTintList(new ColorStateList(states, new int[] {(color & 0xFFFFFF) | 0x80000000, 0x55FFFFFF}));
    }

    private View arrow(boolean up, Runnable action) {
        int color = action == null ? 0x33FFFFFF : TEXT;
        View arrow = icon(up ? "glyph_arrow_chevron_top" : "glyph_arrow_chevron_bottom", color);
        if (arrow != null) {
            ((ImageView) arrow).setScaleType(ImageView.ScaleType.CENTER);
        } else {
            TextView text = text(up ? "▲" : "▼", 16, color);
            text.setGravity(Gravity.CENTER);
            arrow = text;
        }
        arrow.setContentDescription(up ? "Move up" : "Move down");
        arrow.setLayoutParams(new LinearLayout.LayoutParams(dp(44), dp(44)));
        if (action != null) {
            arrow.setBackground(ripple());
            arrow.setOnClickListener(view -> action.run());
        }
        return arrow;
    }

    private View restartBar() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(10), dp(12), dp(10));
        row.addView(text("Restart the app to apply your changes", 14, TEXT),
            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        restartButton = text("Restart", 15, TEXT);
        restartButton.setTypeface(Typeface.DEFAULT_BOLD);
        restartButton.setPadding(dp(18), dp(8), dp(18), dp(8));
        restartButton.setOnClickListener(view -> restartApp());
        row.addView(restartButton);
        return row;
    }

    private LinearLayout toolbar(String titleText) {
        LinearLayout toolbar = new LinearLayout(this);
        toolbar.setOrientation(LinearLayout.HORIZONTAL);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout content = new LinearLayout(this);
        content.setGravity(Gravity.CENTER_VERTICAL);
        content.setMinimumHeight(dp(56));

        View back = backButton();
        back.setOnClickListener(view -> finish());
        content.addView(back, new LinearLayout.LayoutParams(dp(page == null ? 48 : 56), dp(56)));

        TextView title = text(titleText, 20, TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        if (page == null) glow(title);
        content.addView(title);

        toolbar.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));
        return toolbar;
    }

    /** The main title glows in the accent colour, softly pulsing. */
    private void glow(TextView title) {
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        // Room around the text so the glow isn't cut off at the view's edges.
        title.setPadding(dp(12), dp(12), dp(24), dp(12));
        float low = dp(3), high = dp(13);
        title.setShadowLayer(high, 0, 0, 0xFF000000 | (Accent.current() & 0xFFFFFF));
        glow = ValueAnimator.ofFloat(0f, 1f);
        glow.setDuration(1600);
        glow.setRepeatMode(ValueAnimator.REVERSE);
        glow.setRepeatCount(ValueAnimator.INFINITE);
        glow.setInterpolator(new AccelerateDecelerateInterpolator());
        glow.addUpdateListener(animation -> {
            float amount = (float) animation.getAnimatedValue();
            int alpha = Math.round(150 + 105 * amount);
            title.setShadowLayer(low + (high - low) * amount, 0, 0, (alpha << 24) | (accent & 0xFFFFFF));
        });
        glow.start();
    }

    private View backButton() {
        View icon = icon("glyph_arrow_chevron_left", TEXT);
        if (icon instanceof ImageView) {
            ((ImageView) icon).setScaleType(ImageView.ScaleType.CENTER);
            icon.setContentDescription("Back");
            icon.setBackground(ripple());
            return icon;
        }
        TextView text = text("‹", 28, TEXT);
        text.setGravity(Gravity.CENTER);
        text.setContentDescription("Back");
        return text;
    }

    /** One of the app's own glyphs, tinted; null if the app doesn't have it. */
    private ImageView icon(String name, int tint) {
        int id = Utils.resourceId(name, "drawable");
        if (id == 0) return null;
        try {
            Drawable drawable = getDrawable(id);
            if (drawable == null) return null;
            drawable = drawable.mutate();
            drawable.setTint(tint);
            ImageView image = new ImageView(this);
            image.setImageDrawable(drawable);
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            return image;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private LinearLayout card() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(cardColor);
        shape.setCornerRadius(dp(14));
        card.setBackground(shape);
        card.setClipToOutline(true);
        return card;
    }

    private LinearLayout.LayoutParams cardParams() {
        return cardParams(0);
    }

    private LinearLayout.LayoutParams cardParams(int topDp) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(12), dp(topDp), dp(12), 0);
        return params;
    }

    private Drawable ripple() {
        return new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), null, new ColorDrawable(Color.WHITE));
    }

    private TextView header(String value) {
        TextView header = text(value, 14, accent);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(dp(28), dp(22), dp(16), dp(8));
        return header;
    }

    private View divider(int startDp) {
        View divider = new View(this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2));
        params.setMarginStart(dp(startDp));
        divider.setLayoutParams(params);
        divider.setBackgroundColor(lineColor);
        return divider;
    }

    private TextView caption(String value) {
        TextView caption = text(value, 13, TEXT_SECONDARY);
        caption.setPadding(dp(28), dp(14), dp(28), dp(4));
        return caption;
    }

    private TextView text(String value, int sp, int color) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextColor(color);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        return text;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
