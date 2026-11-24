package app.southstar21.extension.instagram.liquidglass;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

import app.southstar21.extension.instagram.settings.BooleanSetting;
import app.southstar21.extension.instagram.settings.ChoiceSetting;
import app.southstar21.extension.instagram.settings.IntSetting;
import app.southstar21.extension.instagram.settings.Setting;

/**
 * A live glass bar for the settings: the same controller, drawable and lens as on
 * Instagram's bar, over a sample feed that scrolls by itself.
 * <ul>
 *   <li>{@link #customizer}: the Customize navbar page's preview, following the settings as
 *   they change, with a toolbar (light/dark, backdrop, pause, hold to compare) and presets.</li>
 *   <li>{@link #demo}: the clip behind a setting's "?" button. That one setting sweeps between
 *   low and high on its own while the bar acts out what shows it (a drag, taps, scrolling).
 *   Drawn live, so it costs no space.</li>
 * </ul>
 * Tap or drag along the bar to try the selection; drag the feed to scroll it.
 */
@SuppressLint("ViewConstructor")
final class NavbarPreview extends FrameLayout {
    private static final int TABS = 5;
    /** How long the "Switch after the glide" demo stops for, standing in for Instagram building a page. */
    private static final long PAGE_BUILD_MS = 130;
    private static final String[] BACKDROPS = {"Photos", "Text", "Colors"};

    // Kept across page rebuilds (a preset or a switch rebuilds the page).
    private static Boolean previewDark;
    private static int backdrop;
    private static boolean paused;

    private final float density;
    private final boolean appDark;
    private boolean dark;
    private final LinearLayout bar;
    private final Feed feed;
    private final LiquidGlassController controller;
    private final Demo demo;
    private TouchRouter router;
    private boolean comparing;
    private long lastUserTouch;
    /** The demo's mock screen around the bar (a header, a share sheet), or null. */
    private Scene scene;

    // region Factories

    /** The liquid glass customize page's preview, with its toolbar and presets under it. */
    static View customizer(Activity activity, Runnable refresh) {
        return customizer(activity, refresh, true);
    }

    /** The solid bar's customize page preview: the toolbar, no presets (those are glass looks). */
    static View solidCustomizer(Activity activity, Runnable refresh) {
        return customizer(activity, refresh, false);
    }

    /**
     * The navigation bar page's choice of style: two big cards, each a small bar in its style,
     * the chosen one ringed. Tapping the other switches to it.
     */
    static View styleCards(Activity activity, Runnable refresh) {
        int mode = activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        boolean dark = mode == Configuration.UI_MODE_NIGHT_YES;
        Chrome ui = new Chrome(activity, dark);
        boolean solid = LiquidGlassNavBarPatch.SOLID.get();

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row = new LinearLayout(activity);
        String[] names = {"Solid", "Liquid Glass"};
        for (int i = 0; i < names.length; i++) {
            boolean isSolid = i == 0;
            Map<String, Integer> look = new HashMap<>();
            look.put(LiquidGlassNavBarPatch.SOLID.key, isSolid ? 1 : 0);
            boolean chosen = isSolid == solid;
            PresetCard card = new PresetCard(activity, names[i], NavbarStyle.withOverrides(look), dark, chosen);
            // Solid draws a fraction of what the glass does every frame.
            card.badge = isSolid ? "Recommended for older, slower devices" : "Recommended for newer, faster devices";
            card.badgeColor = isSolid ? 0xFF34C759 : 0xFF5E5CE6;
            card.setContentDescription(names[i] + " style, " + card.badge + (chosen ? ", chosen" : ""));
            card.setOnClickListener(v -> {
                if (LiquidGlassNavBarPatch.SOLID.get() == isSolid) return;
                LiquidGlassNavBarPatch.SOLID.set(isSolid);
                refresh.run();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ui.dp(128), 1f);
            if (i > 0) lp.leftMargin = ui.dp(12);
            row.addView(card, lp);
        }
        column.addView(row);

        TextView note = new TextView(activity);
        note.setText(solid
                ? "A plain bar floating over the page. Nothing behind it is blurred or bent, so it's by far the "
                + "lightest on the phone. Recommended for older phones."
                : "Glass like iOS 26: what's behind the bar is blurred and bent at its edges, redrawn every frame. "
                + "It's the heaviest look; on an older phone, Solid runs much smoother.");
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        note.setTextColor(dark ? 0xFF98989F : 0xFF6C6C70);
        note.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), 0);
        column.addView(note);
        return column;
    }

    private static View customizer(Activity activity, Runnable refresh, boolean withPresets) {
        NavbarPreview preview = new NavbarPreview(activity, null);
        Chrome ui = new Chrome(activity, preview.appDark);

        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(preview, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(220)));

        // Toolbar: theme and backdrop as segmented controls, then pause and compare.
        java.util.List<PresetCard> cards = new java.util.ArrayList<>();
        LinearLayout tools = ui.row();
        tools.addView(ui.segmented(new String[]{"Auto", "Light", "Dark"},
                previewDark == null ? 0 : previewDark ? 2 : 1, index -> {
                    previewDark = index == 0 ? null : index == 2;
                    preview.applyTheme();
                    // The preset cards follow, so they show each look in the same theme.
                    for (PresetCard card : cards) card.setDark(preview.dark);
                }));
        tools.addView(ui.gap());
        tools.addView(ui.segmented(BACKDROPS, backdrop, index -> backdrop = index));
        tools.addView(ui.gap());
        TextView pause = ui.chip(paused ? "\u25B6" : "\u275A\u275A", false);
        pause.setContentDescription(paused ? "Play" : "Pause");
        pause.setOnClickListener(v -> {
            paused = !paused;
            pause.setText(paused ? "\u25B6" : "\u275A\u275A");
            pause.setContentDescription(paused ? "Play" : "Pause");
        });
        tools.addView(pause);
        TextView compare = ui.chip("Hold to compare", false);
        compare.setOnTouchListener((v, event) -> {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                preview.comparing = true;
                ui.mark(compare, true);
                compare.setText("Default look");
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                preview.comparing = false;
                ui.mark(compare, false);
                compare.setText("Hold to compare");
            }
            return true;
        });
        tools.addView(compare);
        column.addView(ui.scroller(tools));
        if (!withPresets) return column;

        // Presets: each one a tiny navbar in its own look. Each starts from the defaults.
        TextView presetsLabel = ui.label("Presets");
        presetsLabel.setPadding(ui.dp(4), ui.dp(14), 0, ui.dp(2));
        column.addView(presetsLabel);
        LinearLayout presets = ui.row();
        String active = NavbarStyle.activePreset();
        boolean cardsDark = previewDark != null ? previewDark : preview.appDark;
        for (String name : NavbarStyle.PRESETS.keySet()) {
            PresetCard card = new PresetCard(activity, name, NavbarStyle.presetStyle(name), cardsDark,
                    name.equals(active));
            card.setOnClickListener(v -> {
                NavbarStyle.applyPreset(name);
                refresh.run();
            });
            cards.add(card);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(116), ui.dp(96));
            lp.rightMargin = ui.dp(10);
            presets.addView(card, lp);
        }
        column.addView(ui.scroller(presets));
        return column;
    }

    /** The looping demo of one setting, for its "?" button. */
    static View demo(Activity activity, Setting setting) {
        return new NavbarPreview(activity, setting);
    }

    // endregion

    private NavbarPreview(Activity activity, Setting demoSetting) {
        super(activity);
        density = getResources().getDisplayMetrics().density;
        int mode = getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        appDark = mode == Configuration.UI_MODE_NIGHT_YES;
        demo = demoSetting != null ? new Demo(demoSetting) : null;
        dark = themeDark();

        setClipToOutline(true);
        setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 20 * density);
            }
        });

        feed = new Feed();
        addView(feed, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // Header demos sit between the feed and the bar, like Instagram's header.
        if (demo != null && (demo.setting == LiquidGlassNavBarPatch.HEADER_BLUR
                || demo.setting == LiquidGlassNavBarPatch.GLASS_HEADER_BUTTONS)) {
            scene = new HeaderScene(activity, demo.setting == LiquidGlassNavBarPatch.GLASS_HEADER_BUTTONS);
        }

        bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        for (int i = 0; i < TABS; i++) {
            FrameLayout tab = new FrameLayout(activity);
            tab.addView(new TabIcon(i), new FrameLayout.LayoutParams(dp(26), dp(26), Gravity.CENTER));
            tab.setOnClickListener(this::select);
            tab.setContentDescription(new String[]{"Home", "Reels", "Messages", "Search", "Profile"}[i]);
            bar.addView(tab, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        }
        bar.getChildAt(0).setSelected(true);
        // Instagram's bar is 48dp; the controller grows it to the chosen height.
        addView(bar, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(48), Gravity.BOTTOM));

        NavbarStyle.Source source = demo != null ? demo::style
                : () -> comparing ? NavbarStyle.defaults() : NavbarStyle.get();
        controller = new LiquidGlassController(bar, null, true, source);
        // The share sheet covers the bar, like Instagram's.
        if (demo != null && demo.setting == LiquidGlassNavBarPatch.GLASS_SHARE_MENU) scene = new ShareScene(activity);
        // Above a share sheet, and over a scene's header, moved down out of its way.
        if (demo != null) demo.caption.setTranslationZ(dp(32));
        if (demo != null) addView(demo.caption, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                (scene instanceof HeaderScene ? Gravity.CENTER_VERTICAL : Gravity.TOP) | Gravity.START));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (router == null) {
            controller.install(true);
            router = new TouchRouter(super::dispatchTouchEvent, controller.lens());
            applyTheme();
        }
        if (demo != null) android.view.Choreographer.getInstance().postFrameCallback(ticker);
    }

    @Override
    protected void onDetachedFromWindow() {
        android.view.Choreographer.getInstance().removeFrameCallback(ticker);
        super.onDetachedFromWindow();
    }

    /**
     * Moves the demo on once a frame, before drawing. Not from the feed's drawing: the glass and
     * the blurs draw the feed again to record it, which would run the demo several times a frame.
     */
    private final android.view.Choreographer.FrameCallback ticker = new android.view.Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            if (!isAttachedToWindow()) return;
            demo.tick();
            android.view.Choreographer.getInstance().postFrameCallback(this);
        }
    };

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        lastUserTouch = System.nanoTime();
        // Like on Instagram: taps go to the tabs, a drag along the bar glides the selection.
        return router != null ? router.dispatchTouchEvent(event) : super.dispatchTouchEvent(event);
    }

    private boolean themeDark() {
        if (demo != null && demo.forcedDark != null) return demo.forcedDark;
        return previewDark != null ? previewDark : appDark;
    }

    private void applyTheme() {
        dark = themeDark();
        boolean forced = (demo != null && demo.forcedDark != null) || previewDark != null;
        controller.forceDark(forced ? dark : null);
        feed.invalidate();
        for (int i = 0; i < bar.getChildCount(); i++) ((ViewGroup) bar.getChildAt(i)).getChildAt(0).invalidate();
    }

    private void select(View tab) {
        if (demo != null && demo.act == Act.TAP_SWITCH && !tab.isSelected()) {
            // Like Instagram building the page that was tapped: the app stops for a moment, and
            // a new page shows.
            SystemClock.sleep(PAGE_BUILD_MS);
            feed.newPage();
        }
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            child.setSelected(child == tab);
            ((ViewGroup) child).getChildAt(0).invalidate();
        }
    }

    private int selectedIndex() {
        for (int i = 0; i < bar.getChildCount(); i++) if (bar.getChildAt(i).isSelected()) return i;
        return 0;
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    // region Demo

    /** What a demo acts out so its setting shows. */
    private enum Act { NONE, DRAG, TAPS, SCROLL, TAP_SWITCH }

    /** Settings only the liquid glass bar has: their demos show it whatever the chosen style. */
    private static final java.util.Set<Setting> LIQUID_ONLY = new java.util.HashSet<>(java.util.Arrays.asList(
            LiquidGlassNavBarPatch.BLUR_RADIUS, LiquidGlassNavBarPatch.REFRACTION, NavbarStyle.OPACITY,
            NavbarStyle.VIBRANCY, NavbarStyle.EDGE_CLARITY, NavbarStyle.GLARE, LiquidGlassNavBarPatch.TILT_LIGHT,
            LiquidGlassNavBarPatch.SOUTHSTAR21_STYLE, LiquidGlassNavBarPatch.GLASSY_PILL,
            LiquidGlassNavBarPatch.GLASS_WHILE_DRAGGING, LiquidGlassNavBarPatch.EDGE_COLORS, NavbarStyle.DROP_SIZE,
            LiquidGlassNavBarPatch.BLUR_VIDEOS, LiquidGlassNavBarPatch.REELS_BLUR,
            LiquidGlassNavBarPatch.REELS_CLEAR_GLASS));

    /**
     * Sweeps one setting between low and high while the bar acts out what shows it. The values
     * only live here: the stored settings and Instagram's bar are untouched.
     */
    private final class Demo {
        private static final long SWEEP_MS = 5000;
        private static final long ACT_MS = 2800;

        final Setting setting;
        final Caption caption = new Caption();
        /** Light or dark for settings that only show in one, else null. */
        final Boolean forcedDark;
        final Act act;
        /** Tilt light: the glint follows a tilt that sweeps by itself. */
        private final boolean tilt;
        /** Blur videos: the feed is a playing video, which the bar can't see with the setting off. */
        final boolean video;
        /** Content behind bar: off, the page stops at the top of the bar. */
        final boolean extend;
        /** Reels: reels page up under the bar (see Feed#drawReels). */
        final boolean reels;
        private int lastTilt;
        private int tapTarget;
        private final int low, high;
        private final Map<String, Integer> fixed = new HashMap<>();
        private final long start = System.nanoTime();
        private int lastValue = Integer.MIN_VALUE;
        private NavbarStyle style;
        private long cycle = -1;
        private int step;

        Demo(Setting setting) {
            this.setting = setting;
            String key = setting.key;
            Act a = Act.NONE;
            Boolean theme = null;
            // Haptics would buzz on every demo drag; only its own demo feels them.
            fixed.put(LiquidGlassNavBarPatch.HAPTICS.key, 0);
            // The bar in the style chosen, unless the setting only exists on the glass.
            fixed.put(LiquidGlassNavBarPatch.SOLID.key,
                    !LIQUID_ONLY.contains(setting) && LiquidGlassNavBarPatch.SOLID.get() ? 1 : 0);
            tilt = setting == LiquidGlassNavBarPatch.TILT_LIGHT;
            video = setting == LiquidGlassNavBarPatch.BLUR_VIDEOS;
            extend = setting == LiquidGlassNavBarPatch.EXTEND_CONTENT;
            reels = setting == LiquidGlassNavBarPatch.REELS_BLUR || setting == LiquidGlassNavBarPatch.REELS_CLEAR_GLASS;
            if (setting == NavbarStyle.DROP_SIZE || setting == LiquidGlassNavBarPatch.EDGE_COLORS) {
                a = Act.DRAG;
                fixed.put(LiquidGlassNavBarPatch.SOUTHSTAR21_STYLE.key, 1);
            } else if (setting == LiquidGlassNavBarPatch.SOUTHSTAR21_STYLE || setting == LiquidGlassNavBarPatch.HAPTICS) {
                a = Act.DRAG;
            } else if (setting == LiquidGlassNavBarPatch.GLASS_WHILE_DRAGGING) {
                a = Act.DRAG;
                fixed.put(LiquidGlassNavBarPatch.SOUTHSTAR21_STYLE.key, 0);
            } else if (setting == NavbarStyle.SELECTION_SHADE || setting == NavbarStyle.SELECTION_WIDTH
                    || setting == NavbarStyle.SELECTION_INSET || setting == LiquidGlassNavBarPatch.GLASSY_PILL) {
                a = Act.TAPS;
            } else if (setting == NavbarStyle.SHRUNK_SIZE || setting == LiquidGlassNavBarPatch.SHRINK_ON_SCROLL) {
                a = Act.SCROLL;
                fixed.put(LiquidGlassNavBarPatch.SHRINK_ON_SCROLL.key, 1);
            } else if (setting == LiquidGlassNavBarPatch.SWITCH_AFTER_GLIDE) {
                a = Act.TAP_SWITCH;
            }
            if (setting == NavbarStyle.GLARE) theme = false;
            // Reels is always dark.
            if (reels) theme = true;
            if (setting == NavbarStyle.EDGE_CLARITY) theme = true;
            // The glint is white light: on a dark bar it shows.
            if (setting == LiquidGlassNavBarPatch.TILT_LIGHT) theme = true;
            act = a;
            forcedDark = theme;
            int[] range = NavbarStyle.demoRange(setting);
            low = range[0];
            high = range[1];
        }

        /**
         * The style for this frame, with the demo's value. Only reads: the bar calls this from
         * inside the lens, so acting from here would call back into the lens without end.
         */
        NavbarStyle style() {
            long ms = (System.nanoTime() - start) / 1_000_000L;
            int value = valueAt(ms);
            // A slow tilt back and forth, in steps of 0.02 radians.
            int tiltNow = tilt ? Math.round((float) Math.sin(ms / 1000.0 * 1.4) * 60) * 20 : 0;
            if (value != lastValue || tiltNow != lastTilt || style == null) {
                lastValue = value;
                lastTilt = tiltNow;
                Map<String, Integer> overrides = new HashMap<>(fixed);
                overrides.put(setting.key, value);
                if (tilt) overrides.put(NavbarStyle.DEMO_TILT, tiltNow);
                if (video) overrides.put(NavbarStyle.DEMO_VIDEO_HOLE, value == 0 ? 1 : 0);
                style = NavbarStyle.withOverrides(overrides);
                caption.invalidate();
            }
            return style;
        }

        /** Once a frame, before drawing: moves the scene on and acts out the demo's gesture. */
        void tick() {
            if (acting) return;
            acting = true;
            try {
                long ms = (System.nanoTime() - start) / 1_000_000L;
                if (scene != null) scene.update(ms % ACT_MS, valueAt(ms) != 0);
                if (reels) controller.forceOverMedia(clearGlass(ms));
                perform(ms);
            } finally {
                acting = false;
            }
        }

        private boolean acting;

        /** Reels: the frosted strip shows (always, in the clear glass demo). */
        boolean reelsStrip(long ms) {
            return setting == LiquidGlassNavBarPatch.REELS_CLEAR_GLASS || valueAt(ms) != 0;
        }

        /** Reels: the bar is clearer glass, as Instagram's would be with these settings. */
        private boolean clearGlass(long ms) {
            if (setting == LiquidGlassNavBarPatch.REELS_CLEAR_GLASS) return valueAt(ms) != 0;
            return valueAt(ms) != 0 && LiquidGlassNavBarPatch.REELS_CLEAR_GLASS.get();
        }

        long elapsedMs() {
            return (System.nanoTime() - start) / 1_000_000L;
        }

        private int valueAt(long ms) {
            if (setting instanceof BooleanSetting) {
                return (int) ((ms / ACT_MS) % 2);
            }
            if (setting instanceof ChoiceSetting) {
                return (int) ((ms / 1200) % ((ChoiceSetting) setting).labels.length);
            }
            if (act != Act.NONE) {
                // Low, middle, high, one per act, so each look holds still while it's shown.
                int phase = (int) ((ms / ACT_MS) % 4);
                float f = phase == 0 ? 0f : phase == 1 || phase == 3 ? 0.5f : 1f;
                return Math.round(low + (high - low) * f);
            }
            float t = (ms % SWEEP_MS) / (float) SWEEP_MS;
            float wave = 0.5f - 0.5f * (float) Math.cos(t * 2 * Math.PI);
            return Math.round(low + (high - low) * wave);
        }

        /** Acts out the demo's gesture; waits while you touch the preview yourself. */
        private void perform(long ms) {
            if (act == Act.NONE || router == null) return;
            if (System.nanoTime() - lastUserTouch < 2_500_000_000L && lastUserTouch != 0) return;
            LiquidGlassLens lens = controller.lens();
            long c = ms / ACT_MS;
            long t = ms % ACT_MS;
            if (c != cycle) {
                cycle = c;
                step = 0;
            }
            switch (act) {
                case DRAG: {
                    // Press one tab, glide to another and let go; back again next time.
                    int from = c % 2 == 0 ? 0 : 3, to = c % 2 == 0 ? 3 : 0;
                    float x0 = lens.tabCenterX(from), x1 = lens.tabCenterX(to);
                    if (Float.isNaN(x0) || Float.isNaN(x1)) return;
                    if (step == 0 && t >= 300) {
                        step = 1;
                        lens.beginPress(x0);
                    } else if (step == 1 && t >= 500 && t < 1500) {
                        float f = (t - 500) / 1000f;
                        f = f * f * (3 - 2 * f);
                        lens.dragTo(x0 + (x1 - x0) * f);
                    } else if (step == 1 && t >= 1500) {
                        step = 2;
                        lens.endDrag(x1);
                    }
                    break;
                }
                case TAPS:
                    if (step == 0) {
                        step = 1;
                        bar.getChildAt((selectedIndex() + 1) % TABS).performClick();
                    }
                    break;
                case TAP_SWITCH: {
                    // A quick tap on the next tab, as a finger would: down, then up 90ms later.
                    if (step == 0 && t >= 300) {
                        step = 1;
                        tapTarget = (selectedIndex() + 1) % 4;
                        float x = lens.tabCenterX(tapTarget);
                        if (Float.isNaN(x)) return;
                        lens.beginPress(x);
                    } else if (step == 1 && t >= 390) {
                        step = 2;
                        if (!lens.deferTapOnOtherTab()) {
                            lens.release();
                            bar.getChildAt(tapTarget).performClick();
                        }
                    }
                    break;
                }
                case SCROLL:
                    if (step == 0 && t < ACT_MS / 2) {
                        step = 1;
                        lens.onContentScroll(-1f);
                    } else if (step == 1 && t >= ACT_MS / 2) {
                        step = 2;
                        lens.onContentScroll(1f);
                    }
                    break;
                default:
                    break;
            }
        }

        String valueText() {
            int v = lastValue == Integer.MIN_VALUE ? low : lastValue;
            if (setting instanceof BooleanSetting) return v != 0 ? "On" : "Off";
            if (setting instanceof ChoiceSetting) return ((ChoiceSetting) setting).labels[v];
            IntSetting s = (IntSetting) setting;
            if (s.unit == null) return String.valueOf(v);
            return "%".equals(s.unit) ? v + "%" : v + " " + s.unit;
        }
    }

    /** The demo's caption: the setting's name and its value right now. */
    private final class Caption extends View {
        private final Paint pill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        Caption() {
            super(NavbarPreview.this.getContext());
            label.setTextSize(13 * density);
            label.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(dp(260), dp(44));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            String text = demo.setting.title + "  " + demo.valueText();
            float w = label.measureText(text) + 24 * density;
            rect.set(10 * density, 10 * density, 10 * density + w, 38 * density);
            pill.setColor(0xB3000000);
            canvas.drawRoundRect(rect, rect.height() / 2, rect.height() / 2, pill);
            label.setColor(Color.WHITE);
            canvas.drawText(text, rect.left + 12 * density, rect.centerY() + 4.5f * density, label);
        }
    }

    // endregion

    // region Scenes

    /** A demo's mock screen around the bar, moved on once a frame. */
    private interface Scene {
        /** @param t ms into the demo's act; {@code on} the setting's value right now */
        void update(long t, boolean on);
    }

    /**
     * Home's top: a status bar and the "For you" header over the feed. With the header blur on,
     * the header is see-through and the real top blur fades the feed out under the status bar;
     * off, it's Instagram's solid header. With {@code buttons}, the blur stays on and the two
     * header buttons get the real glass circles, which come and go with the setting.
     */
    private final class HeaderScene implements Scene {
        private final EdgeBlurView blur;
        private final View header;
        private final int statusH = dp(24), rowH = dp(44);
        private boolean opaque;
        private final java.util.ArrayList<GlassButtonDrawable> circles = new java.util.ArrayList<>();
        private final View[] buttons = new View[2];
        private HeaderGlass group;
        private float reveal;
        private long lastStep;

        HeaderScene(Activity activity, boolean withButtons) {
            blur = new EdgeBlurView(activity, density, true);
            addView(blur, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, statusH + blur.extraTop, Gravity.TOP));
            header = new View(activity) {
                private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

                @Override
                protected void onDraw(Canvas canvas) {
                    int ink = dark ? Color.WHITE : 0xFF111111;
                    if (opaque) canvas.drawColor(dark ? 0xFF0B0F14 : Color.WHITE);
                    paint.setColor(ink);
                    paint.setTextSize(12 * density);
                    paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    canvas.drawText("9:41", dp(16), statusH - dp(7), paint);
                    canvas.drawRoundRect(getWidth() - dp(40), statusH - dp(15), getWidth() - dp(16),
                            statusH - dp(7), dp(3), dp(3), paint);
                    paint.setTextSize(19 * density);
                    paint.setTextAlign(Paint.Align.CENTER);
                    canvas.drawText("For you", getWidth() / 2f, statusH + rowH / 2f + dp(7), paint);
                    paint.setTextAlign(Paint.Align.LEFT);
                    if (group == null) drawIcons(canvas, paint, ink);
                }
            };
            addView(header, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, statusH + rowH, Gravity.TOP));
            if (!withButtons) return;
            group = new HeaderGlass(density, c -> feed.draw(c), circles);
            for (int i = 0; i < 2; i++) {
                final int which = i;
                View button = new View(activity) {
                    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

                    @Override
                    protected void onDraw(Canvas canvas) {
                        int ink = dark ? Color.WHITE : 0xFF111111;
                        canvas.save();
                        canvas.translate(getWidth() / 2f - dp(12), getHeight() / 2f - dp(12));
                        drawIcon(canvas, paint, ink, which);
                        canvas.restore();
                    }
                };
                GlassButtonDrawable circle = new GlassButtonDrawable(density, group);
                button.setBackground(circle);
                circles.add(circle);
                buttons[i] = button;
                LayoutParams lp = new LayoutParams(dp(44), dp(44), Gravity.TOP | (i == 0 ? Gravity.START : Gravity.END));
                lp.topMargin = statusH;
                lp.leftMargin = dp(8);
                lp.rightMargin = dp(8);
                addView(button, lp);
            }
        }

        /** The header's new post and heart icons, drawn by the header itself when there are no circles. */
        private void drawIcons(Canvas canvas, Paint paint, int ink) {
            for (int i = 0; i < 2; i++) {
                canvas.save();
                float cx = i == 0 ? dp(30) : getWidth() - dp(30);
                canvas.translate(cx - dp(12), statusH + rowH / 2f - dp(12));
                drawIcon(canvas, paint, ink, i);
                canvas.restore();
            }
        }

        /** A 24dp icon: a plus, or a heart. */
        private void drawIcon(Canvas canvas, Paint paint, int ink, int which) {
            paint.setColor(ink);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2 * density);
            paint.setStrokeCap(Paint.Cap.ROUND);
            float u = density;
            if (which == 0) {
                canvas.drawLine(12 * u, 4 * u, 12 * u, 20 * u, paint);
                canvas.drawLine(4 * u, 12 * u, 20 * u, 12 * u, paint);
            } else {
                Path heart = new Path();
                heart.moveTo(12 * u, 20 * u);
                heart.cubicTo(1 * u, 12 * u, 4 * u, 3 * u, 12 * u, 8 * u);
                heart.cubicTo(20 * u, 3 * u, 23 * u, 12 * u, 12 * u, 20 * u);
                canvas.drawPath(heart, paint);
            }
            paint.setStyle(Paint.Style.FILL);
        }

        @Override
        public void update(long t, boolean on) {
            boolean blurOn = group != null || on;
            opaque = !blurOn;
            blur.setVisibility(blurOn ? VISIBLE : GONE);
            if (blurOn) {
                blur.setDark(dark);
                blur.setBackgroundColorBehind(dark ? 0xFF0B0F14 : Color.WHITE);
                blur.setExtent(-1);
                blur.invalidate();
            }
            header.invalidate();
            if (group == null) return;
            long now = System.nanoTime();
            float dt = lastStep == 0 ? 0f : Math.min(1f / 30f, (now - lastStep) / 1e9f);
            lastStep = now;
            // The circles fade in and out over a quarter second, like scrolling away from the top.
            reveal = on ? Math.min(1f, reveal + dt * 4f) : Math.max(0f, reveal - dt * 4f);
            group.beginFrame(getWidth(), statusH + rowH + dp(24));
            for (int i = 0; i < buttons.length; i++) {
                View button = buttons[i];
                GlassButtonDrawable circle = circles.get(i);
                circle.setDark(dark);
                circle.setReveal(reveal);
                circle.setDiameter(dp(40));
                circle.setPlacement(button.getLeft() + button.getWidth() / 2f, button.getTop() + button.getHeight() / 2f);
                circle.step(dt);
                button.invalidate();
            }
        }
    }

    /**
     * The share menu rising over the feed and the bar, holding, and going down again, once per
     * act. On, it's the real frosted glass sheet; off, Instagram's plain one.
     */
    private final class ShareScene implements Scene {
        private final View dim;
        private final View sheet;
        private final ShareGlassDrawable glass;
        private final GradientDrawable plain = new GradientDrawable();
        private boolean glassy;

        ShareScene(Activity activity) {
            dim = new View(activity);
            dim.setBackgroundColor(0x59000000);
            dim.setAlpha(0f);
            addView(dim, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            sheet = new View(activity) {
                private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
                private final RectF r = new RectF();

                @Override
                protected void onDraw(Canvas canvas) {
                    float w = getWidth(), u = density;
                    int ink = dark ? Color.WHITE : 0xFF111111;
                    // On glass the fields are lighter glass; on the plain sheet, grey.
                    int field = glassy ? (dark ? 0x2EFFFFFF : 0x66FFFFFF) : (dark ? 0xFF2C2C2E : 0xFFEFEFF2);
                    paint.setStyle(Paint.Style.FILL);
                    paint.setColor(dark ? 0x66FFFFFF : 0x33000000);
                    r.set(w / 2 - 18 * u, 8 * u, w / 2 + 18 * u, 12 * u);
                    canvas.drawRoundRect(r, 2 * u, 2 * u, paint);
                    paint.setColor(field);
                    r.set(16 * u, 22 * u, w - 16 * u, 50 * u);
                    canvas.drawRoundRect(r, 14 * u, 14 * u, paint);
                    paint.setColor(dark ? 0xFF98989F : 0xFF8E8E93);
                    paint.setTextSize(13 * u);
                    canvas.drawText("Search", 38 * u, 41 * u, paint);
                    int[][] avatars = {{0xFFFF7E5F, 0xFFFEB47B}, {0xFF2193B0, 0xFF6DD5ED},
                            {0xFF8E2DE2, 0xFF4A00E0}, {0xFF11998E, 0xFF38EF7D}};
                    float step = (w - 32 * u) / 4f;
                    for (int i = 0; i < 4; i++) {
                        float cx = 16 * u + step * (i + 0.5f);
                        paint.setShader(new LinearGradient(cx - 22 * u, 62 * u, cx + 22 * u, 106 * u,
                                avatars[i][0], avatars[i][1], Shader.TileMode.CLAMP));
                        canvas.drawCircle(cx, 84 * u, 22 * u, paint);
                        paint.setShader(null);
                        paint.setColor(ink);
                        r.set(cx - 18 * u, 112 * u, cx + 18 * u, 117 * u);
                        canvas.drawRoundRect(r, 2.5f * u, 2.5f * u, paint);
                        // The action row: grey circles, glass ones on the glass sheet.
                        paint.setColor(field);
                        canvas.drawCircle(cx, 148 * u, 20 * u, paint);
                        paint.setColor(ink);
                        canvas.drawCircle(cx, 148 * u, 4 * u, paint);
                    }
                }
            };
            glass = new ShareGlassDrawable(sheet, density);
            glass.setSkip(dim);
            float corner = ShareGlassDrawable.CORNER_DP * density;
            plain.setCornerRadii(new float[]{corner, corner, corner, corner, 0, 0, 0, 0});
            addView(sheet, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(180), Gravity.BOTTOM));
            // The bar has elevation for its shadow, which would draw it over the sheet: lift the
            // dimmer and the sheet above it, without shadows of their own.
            for (View v : new View[]{dim, sheet}) {
                v.setOutlineProvider(null);
                v.setTranslationZ(dp(24));
            }
        }

        @Override
        public void update(long t, boolean on) {
            if (on != glassy || sheet.getBackground() == null) {
                glassy = on;
                plain.setColor(dark ? 0xFF262628 : Color.WHITE);
                sheet.setBackground(on ? glass : plain);
            }
            glass.setDark(dark);
            // Up over 0.4s, held, and down again in the last half second of the act.
            float up = Math.min(1f, Math.max(0f, (t - 200) / 400f));
            float down = Math.min(1f, Math.max(0f, (t - 2200) / 400f));
            float f = up * (1f - down);
            f = f * f * (3 - 2 * f);
            sheet.setTranslationY((1f - f) * sheet.getHeight());
            dim.setAlpha(f);
            sheet.invalidate();
        }
    }

    // endregion

    // region Tab icons

    /** Simple versions of Instagram's tab icons, filled when their tab is selected. */
    private final class TabIcon extends View {
        private final int type;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF rect = new RectF();

        TabIcon(int type) {
            super(NavbarPreview.this.getContext());
            this.type = type;
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            boolean selected = ((View) getParent()).isSelected();
            int ink = dark ? Color.WHITE : 0xFF111111;
            float s = getWidth() / 24f;
            canvas.save();
            canvas.scale(s, s);
            paint.setShader(null);
            paint.setColor(ink);
            paint.setStrokeWidth(2f);
            paint.setStyle(selected ? Paint.Style.FILL_AND_STROKE : Paint.Style.STROKE);
            path.reset();
            switch (type) {
                case 0: // Home
                    path.moveTo(3f, 10f);
                    path.lineTo(12f, 3f);
                    path.lineTo(21f, 10f);
                    path.lineTo(21f, 20f);
                    path.lineTo(15f, 20f);
                    path.lineTo(15f, 14f);
                    path.lineTo(9f, 14f);
                    path.lineTo(9f, 20f);
                    path.lineTo(3f, 20f);
                    path.close();
                    canvas.drawPath(path, paint);
                    break;
                case 1: // Reels
                    paint.setStyle(Paint.Style.STROKE);
                    rect.set(3f, 3f, 21f, 21f);
                    canvas.drawRoundRect(rect, 5f, 5f, paint);
                    paint.setStyle(Paint.Style.FILL_AND_STROKE);
                    path.moveTo(10f, 8.5f);
                    path.lineTo(16f, 12f);
                    path.lineTo(10f, 15.5f);
                    path.close();
                    canvas.drawPath(path, paint);
                    break;
                case 2: // Messages
                    path.moveTo(21f, 3f);
                    path.lineTo(3f, 9.5f);
                    path.lineTo(10f, 13f);
                    path.lineTo(13.5f, 20.5f);
                    path.close();
                    canvas.drawPath(path, paint);
                    if (!selected) canvas.drawLine(10f, 13f, 21f, 3f, paint);
                    break;
                case 3: // Search
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(selected ? 2.8f : 2f);
                    canvas.drawCircle(10.5f, 10.5f, 6.5f, paint);
                    canvas.drawLine(15.5f, 15.5f, 20.5f, 20.5f, paint);
                    break;
                default: // Profile: an avatar, ringed when selected
                    paint.setStyle(Paint.Style.FILL);
                    paint.setShader(new LinearGradient(4f, 4f, 20f, 20f, 0xFFFFB86C, 0xFFFF5E8A, Shader.TileMode.CLAMP));
                    canvas.drawCircle(12f, 12f, selected ? 8f : 10f, paint);
                    if (selected) {
                        paint.setShader(null);
                        paint.setStyle(Paint.Style.STROKE);
                        paint.setStrokeWidth(1.6f);
                        canvas.drawCircle(12f, 12f, 11f, paint);
                    }
                    break;
            }
            canvas.restore();
        }
    }

    // endregion

    // region Feed

    /**
     * Sample posts scrolling up by themselves, so there's always something moving under the
     * glass: photos, text or bold colors. Dragging scrolls it by hand.
     */
    private final class Feed extends View {
        /** One post, in dp. */
        private static final float POST = 560f;
        private static final float SPEED_DP = 34f;
        private final int[][] palettes = {
                {0xFFFF7E5F, 0xFFFEB47B}, {0xFF2193B0, 0xFF6DD5ED},
                {0xFF8E2DE2, 0xFF4A00E0}, {0xFF11998E, 0xFF38EF7D}};
        private final int[] colors = {0xFFFF375F, 0xFFFFD60A, 0xFF30D158, 0xFF0A84FF, 0xFFBF5AF2, 0xFFFF9F0A};
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final Path path = new Path();
        private float scroll;
        private long lastFrame;
        private long pausedUntil;
        private float lastY;

        Feed() {
            super(NavbarPreview.this.getContext());
            text.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            long now = System.nanoTime();
            if (lastFrame != 0 && now > pausedUntil && !(paused && demo == null)) {
                scroll += SPEED_DP * density * Math.min((now - lastFrame) / 1e9f, 0.05f);
            }
            lastFrame = now;

            int ink = dark ? Color.WHITE : 0xFF111111;
            int faint = dark ? 0xFF3A3A3C : 0xFFDADADF;
            canvas.drawColor(dark ? 0xFF0B0F14 : Color.WHITE);
            // Scene demos use bold colors, so there's always something to see under the glass.
            int kind = demo != null ? (demo.video ? 3 : scene != null ? 2 : 0) : backdrop;
            if (demo != null && demo.reels) {
                drawReels(canvas);
                postInvalidateOnAnimation();
                return;
            }
            if (kind == 3) {
                drawVideo(canvas);
                postInvalidateOnAnimation();
                return;
            }
            float post = (kind == 1 ? 200f : POST) * density;
            int first = (int) Math.floor(scroll / post);
            for (int k = first; k * post - scroll < getHeight(); k++) {
                float top = k * post - scroll;
                if (kind == 1) drawText(canvas, k, top, ink, faint);
                else if (kind == 2) drawColors(canvas, k, top, post);
                else drawPost(canvas, k, top, ink, faint);
            }
            if (demo != null && demo.extend && demo.lastValue == 0) {
                // Like stock Instagram: the page ends where the bar starts, plain background below.
                paint.setShader(null);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(dark ? 0xFF0B0F14 : Color.WHITE);
                canvas.drawRect(0, bar.getTop(), getWidth(), getHeight(), paint);
            }
            // Keeps the frames coming, which also keeps the glass and the demo running.
            postInvalidateOnAnimation();
        }

        private void drawPost(Canvas canvas, int index, float top, int ink, int faint) {
            float d = density;
            float w = getWidth();
            int[] palette = palettes[Math.floorMod(index, palettes.length)];

            // Header: avatar, name and subtitle.
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(new LinearGradient(16 * d, top + 12 * d, 48 * d, top + 44 * d,
                    palette[0], palette[1], Shader.TileMode.CLAMP));
            canvas.drawCircle(32 * d, top + 28 * d, 16 * d, paint);
            paint.setShader(null);
            paint.setColor(ink);
            rect.set(58 * d, top + 18 * d, 150 * d, top + 28 * d);
            canvas.drawRoundRect(rect, 5 * d, 5 * d, paint);
            paint.setColor(faint);
            rect.set(58 * d, top + 34 * d, 120 * d, top + 41 * d);
            canvas.drawRoundRect(rect, 4 * d, 4 * d, paint);

            // The picture: a gradient with a sun, stripes and big lettering for the glass to bend.
            float imageTop = top + 58 * d, imageBottom = imageTop + 360 * d;
            paint.setShader(new LinearGradient(0, imageTop, w, imageBottom, palette[0], palette[1], Shader.TileMode.CLAMP));
            canvas.drawRect(0, imageTop, w, imageBottom, paint);
            paint.setShader(new RadialGradient(w * 0.72f, imageTop + 110 * d, 70 * d,
                    0xD9FFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP));
            canvas.drawCircle(w * 0.72f, imageTop + 110 * d, 70 * d, paint);
            paint.setShader(null);
            paint.setColor(0x33FFFFFF);
            paint.setStrokeWidth(10 * d);
            for (int i = -4; i < 10; i++) {
                float x = i * 46 * d;
                canvas.drawLine(x, imageBottom, x + 200 * d, imageTop + 160 * d, paint);
            }
            text.setColor(Color.WHITE);
            text.setTextSize(44 * d);
            text.setShadowLayer(6 * d, 0, 2 * d, 0x55000000);
            canvas.drawText(new String[]{"Glass", "Liquid", "Refract", "Bend"}[Math.floorMod(index, 4)],
                    20 * d, imageBottom - 34 * d, text);
            text.clearShadowLayer();

            // Actions: heart, comment and send, then a count.
            float ay = imageBottom + 30 * d;
            paint.setColor(ink);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2 * d);
            path.reset();
            path.moveTo(28 * d, ay + 9 * d);
            path.cubicTo(14 * d, ay - 1 * d, 18 * d, ay - 13 * d, 28 * d, ay - 5 * d);
            path.cubicTo(38 * d, ay - 13 * d, 42 * d, ay - 1 * d, 28 * d, ay + 9 * d);
            canvas.drawPath(path, paint);
            canvas.drawCircle(66 * d, ay - 1 * d, 10 * d, paint);
            path.reset();
            path.moveTo(114 * d, ay - 11 * d);
            path.lineTo(94 * d, ay - 4 * d);
            path.lineTo(102 * d, ay);
            path.lineTo(106 * d, ay + 9 * d);
            path.close();
            canvas.drawPath(path, paint);
            paint.setStyle(Paint.Style.FILL);
            text.setColor(ink);
            text.setTextSize(15 * d);
            canvas.drawText((1204 + index * 377) + " likes", 16 * d, ay + 38 * d, text);
            paint.setColor(faint);
            rect.set(16 * d, ay + 52 * d, w - 40 * d, ay + 60 * d);
            canvas.drawRoundRect(rect, 4 * d, 4 * d, paint);
            rect.set(16 * d, ay + 68 * d, w * 0.55f, ay + 76 * d);
            canvas.drawRoundRect(rect, 4 * d, 4 * d, paint);
        }

        /** Another page: the feed jumps on, as if a different tab had opened. */
        void newPage() {
            scroll += 300 * density;
        }

        /** A video playing full screen: bands of color and a ball, moving all the time. */
        private void drawVideo(Canvas canvas) {
            float d = density;
            float w = getWidth(), h = getHeight();
            float t = (System.nanoTime() % 60_000_000_000L) / 1e9f;
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            float band = 70 * d;
            float offset = (t * 160 * d) % (band * colors.length);
            for (int i = -1; i * band - offset < w + h; i++) {
                paint.setColor(colors[Math.floorMod(i, colors.length)]);
                float x = i * band - offset;
                path.reset();
                path.moveTo(x, 0);
                path.lineTo(x + band, 0);
                path.lineTo(x + band - h * 0.6f, h);
                path.lineTo(x - h * 0.6f, h);
                path.close();
                canvas.drawPath(path, paint);
            }
            paint.setColor(Color.WHITE);
            float bx = w * (0.5f + 0.38f * (float) Math.sin(t * 2.1)), by = h * (0.55f + 0.3f * (float) Math.cos(t * 3.3));
            canvas.drawCircle(bx, by, 26 * d, paint);
            // A play badge and a running time, so it reads as a video.
            paint.setColor(0x99000000);
            rect.set(w - 92 * d, 12 * d, w - 12 * d, 38 * d);
            canvas.drawRoundRect(rect, 13 * d, 13 * d, paint);
            paint.setColor(Color.WHITE);
            path.reset();
            path.moveTo(w - 82 * d, 18 * d);
            path.lineTo(w - 70 * d, 25 * d);
            path.lineTo(w - 82 * d, 32 * d);
            path.close();
            canvas.drawPath(path, paint);
            text.setColor(Color.WHITE);
            text.setTextSize(13 * d);
            int sec = (int) t % 60;
            canvas.drawText("0:" + (sec < 10 ? "0" : "") + sec, w - 62 * d, 30 * d, text);
        }

        /** Recorded reels for the frosted strip, two since two reels show mid-scroll. */
        private final android.graphics.RenderNode[] reelNodes = new android.graphics.RenderNode[2];
        private final android.graphics.RenderNode[] blurNodes = new android.graphics.RenderNode[2];
        private final Paint stripMask = new Paint();
        private final Paint stripTint = new Paint();
        private int stripMaskFor = -1;

        /**
         * Reels paging up under the bar, one every act. With the strip on, each reel runs down
         * behind the bar and the strip under its caption is a frosted copy of it, which scrolls
         * away with it. Off, like stock Instagram: the reel stops above the bar, black below.
         */
        private void drawReels(Canvas canvas) {
            float d = density;
            int w = getWidth();
            int h = getHeight();
            long ms = demo.elapsedMs();
            boolean strip = demo.reelsStrip(ms);
            int barTop = bar.getTop() > 0 ? bar.getTop() : h - dp(70);
            int pageH = strip ? h : barTop;
            // Where the strip starts, a little above the pill, as in Instagram.
            int stripTop = barTop - dp(10);
            canvas.drawColor(Color.BLACK);

            // Hold, then swipe on to the next reel, settled before the setting flips.
            long act = ms / Demo.ACT_MS;
            float f = Math.max(0f, Math.min(1f, (ms % Demo.ACT_MS - 1500) / 650f));
            f = f * f * (3 - 2 * f);
            float position = act + f;
            int first = (int) Math.floor(position);
            for (int k = first; k <= first + 1; k++) {
                float top = (k - position) * pageH;
                if (top >= h) break;
                int save = canvas.save();
                canvas.translate(0, top);
                canvas.clipRect(0, 0, w, pageH);
                int slot = Math.floorMod(k, 2);
                boolean frosted = strip && android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S
                        && canvas.isHardwareAccelerated();
                if (frosted) {
                    android.graphics.RenderNode node = reelNode(slot, w, pageH);
                    android.graphics.RecordingCanvas rc = node.beginRecording(w, pageH);
                    try {
                        drawReelVideo(rc, k, w, pageH);
                    } finally {
                        node.endRecording();
                    }
                    canvas.drawRenderNode(node);
                    drawStrip(canvas, slot, node, w, pageH, pageH - (h - stripTop));
                } else {
                    drawReelVideo(canvas, k, w, pageH);
                }
                // The caption and buttons end above the strip (or the bar).
                drawReelChrome(canvas, k, w, strip ? pageH - (h - stripTop) : pageH - dp(8));
                canvas.restoreToCount(save);
            }
        }

        private android.graphics.RenderNode reelNode(int slot, int w, int h) {
            if (reelNodes[slot] == null) {
                reelNodes[slot] = new android.graphics.RenderNode("PreviewReel" + slot);
                blurNodes[slot] = new android.graphics.RenderNode("PreviewReelBlur" + slot);
                float r = 20 * density;
                blurNodes[slot].setRenderEffect(android.graphics.RenderEffect.createBlurEffect(r, r,
                        Shader.TileMode.CLAMP));
            }
            reelNodes[slot].setPosition(0, 0, w, h);
            return reelNodes[slot];
        }

        /** The frosted strip from {@code top} to the reel's bottom, easing in over its top. */
        private void drawStrip(Canvas canvas, int slot, android.graphics.RenderNode reel, int w, int pageH, int top) {
            int sh = pageH - top;
            if (sh <= 0) return;
            if (stripMaskFor != sh) {
                stripMaskFor = sh;
                float feather = Math.min(0.6f, 56 * density / sh);
                stripMask.setXfermode(new android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
                stripMask.setShader(new LinearGradient(0, 0, 0, sh, new int[]{0, 0xFF000000, 0xFF000000},
                        new float[]{0f, feather, 1f}, Shader.TileMode.CLAMP));
                stripTint.setShader(new LinearGradient(0, 0, 0, sh, new int[]{0, 0x18000000, 0x38000000},
                        new float[]{0f, feather, 1f}, Shader.TileMode.CLAMP));
            }
            android.graphics.RenderNode blur = blurNodes[slot];
            blur.setPosition(0, 0, w, pageH);
            android.graphics.RecordingCanvas rc = blur.beginRecording(w, pageH);
            try {
                rc.drawRenderNode(reel);
            } finally {
                blur.endRecording();
            }
            int save = canvas.save();
            canvas.translate(0, top);
            int layer = canvas.saveLayer(0, 0, w, sh, null);
            canvas.translate(0, -top);
            canvas.drawRenderNode(blur);
            canvas.translate(0, top);
            canvas.drawRect(0, 0, w, sh, stripMask);
            canvas.restoreToCount(layer);
            canvas.drawRect(0, 0, w, sh, stripTint);
            canvas.restoreToCount(save);
        }

        /** A reel's video: bold diagonal bands and a ball, in colors of its own. */
        private void drawReelVideo(Canvas canvas, int index, int w, int h) {
            float d = density;
            float t = (System.nanoTime() % 60_000_000_000L) / 1e9f;
            int[] palette = palettes[Math.floorMod(index, palettes.length)];
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(new LinearGradient(0, 0, w, h, palette[0], palette[1], Shader.TileMode.CLAMP));
            canvas.drawRect(0, 0, w, h, paint);
            paint.setShader(null);
            float band = 64 * d;
            float offset = (t * 60 * d) % (band * 2);
            for (int i = -2; i * band - offset < w + h; i += 2) {
                paint.setColor(colors[Math.floorMod(i / 2 + index, colors.length)] & 0x99FFFFFF);
                float x = i * band - offset;
                path.reset();
                path.moveTo(x, 0);
                path.lineTo(x + band, 0);
                path.lineTo(x + band - h * 0.5f, h);
                path.lineTo(x - h * 0.5f, h);
                path.close();
                canvas.drawPath(path, paint);
            }
            paint.setColor(Color.WHITE);
            float bx = w * (0.5f + 0.35f * (float) Math.sin(t * 1.7 + index));
            float by = h * (0.7f + 0.2f * (float) Math.cos(t * 2.3 + index));
            canvas.drawCircle(bx, by, 30 * d, paint);
        }

        /** The name, caption and button column, ending at {@code bottom}. */
        private void drawReelChrome(Canvas canvas, int index, int w, int bottom) {
            float d = density;
            paint.setShader(null);
            paint.setStyle(Paint.Style.FILL);
            int[] palette = palettes[Math.floorMod(index + 1, palettes.length)];
            paint.setShader(new LinearGradient(16 * d, bottom - 64 * d, 48 * d, bottom - 32 * d,
                    palette[0], palette[1], Shader.TileMode.CLAMP));
            canvas.drawCircle(32 * d, bottom - 48 * d, 15 * d, paint);
            paint.setShader(null);
            paint.setColor(Color.WHITE);
            rect.set(56 * d, bottom - 54 * d, 150 * d, bottom - 43 * d);
            canvas.drawRoundRect(rect, 5 * d, 5 * d, paint);
            paint.setColor(0xCCFFFFFF);
            rect.set(16 * d, bottom - 22 * d, w * 0.62f, bottom - 13 * d);
            canvas.drawRoundRect(rect, 4 * d, 4 * d, paint);
            // Like, comment, share and more, up the right edge.
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(2 * d);
            paint.setColor(Color.WHITE);
            for (int i = 0; i < 4; i++) {
                canvas.drawCircle(w - 30 * d, bottom - 24 * d - i * 46 * d, 11 * d, paint);
            }
            paint.setStyle(Paint.Style.FILL);
        }

        /** Lines of crisp text, where blur and refraction are easiest to read. */
        private void drawText(Canvas canvas, int index, float top, int ink, int faint) {
            float d = density;
            text.setColor(ink);
            text.setTextSize(22 * d);
            canvas.drawText(new String[]{"Liquid Glass", "Refraction", "Frosted blur", "Rim and glare"}
                    [Math.floorMod(index, 4)], 18 * d, top + 40 * d, text);
            text.setTextSize(14 * d);
            text.setColor(dark ? 0xFFB0B0B5 : 0xFF48484A);
            String body = "The quick brown fox jumps over the lazy dog. 0123456789";
            for (int line = 0; line < 6; line++) {
                canvas.drawText(body, 18 * d - (line % 2) * 30 * d, top + (70 + line * 22) * d, text);
            }
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(faint);
            canvas.drawRect(0, top + 196 * d, getWidth(), top + 198 * d, paint);
        }

        /** Big bands of bold color, where tint and vibrancy show most. */
        private void drawColors(Canvas canvas, int index, float top, float height) {
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            int bands = 3;
            for (int b = 0; b < bands; b++) {
                paint.setColor(colors[Math.floorMod(index * bands + b, colors.length)]);
                canvas.drawRect(0, top + height * b / bands, getWidth(), top + height * (b + 1) / bands, paint);
            }
            paint.setColor(0x66FFFFFF);
            canvas.drawCircle(getWidth() * (0.2f + 0.6f * Math.floorMod(index, 3) / 2f), top + height / 2,
                    46 * density, paint);
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    lastY = event.getY();
                    pausedUntil = Long.MAX_VALUE;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    scroll = Math.max(0f, scroll + lastY - event.getY());
                    lastY = event.getY();
                    return true;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    // Carry on by itself a moment after letting go.
                    pausedUntil = System.nanoTime() + 1_200_000_000L;
                    return true;
                default:
                    return true;
            }
        }
    }

    // endregion

    // region Presets

    /**
     * A preset as a tiny navbar: its pill drawn in the preset's material, opacity, tint,
     * roundness, height, rim and selection over a small photo, with the name under it. The
     * preset the settings match now is ringed.
     */
    private static final class PresetCard extends View {
        private static final int ACCENT = 0xFF0095F6;
        private final String name;
        private final NavbarStyle style;
        private boolean dark;
        private final boolean active;
        private final float density;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF pill = new RectF();
        /** A small label in the card's top left corner (up to two lines), or null, and its color. */
        String badge;
        int badgeColor;
        private android.text.StaticLayout badgeLayout;
        private int badgeLayoutWidth = -1;

        PresetCard(Activity activity, String name, NavbarStyle style, boolean dark, boolean active) {
            super(activity);
            this.name = name;
            this.style = style;
            this.dark = dark;
            this.active = active;
            this.density = activity.getResources().getDisplayMetrics().density;
            text.setTextSize(13 * density);
            text.setTextAlign(Paint.Align.CENTER);
            setContentDescription(name + " preset");
        }

        void setDark(boolean dark) {
            if (this.dark == dark) return;
            this.dark = dark;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float d = density;
            float w = getWidth();
            float frameH = getHeight() - 22 * d;
            rect.set(2 * d, 2 * d, w - 2 * d, frameH);
            float corner = 14 * d;

            // A small photo: a sky gradient with a sun, so the glass's opacity shows.
            canvas.save();
            android.graphics.Path clip = new android.graphics.Path();
            clip.addRoundRect(rect, corner, corner, android.graphics.Path.Direction.CW);
            canvas.clipPath(clip);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(new LinearGradient(0, rect.top, w, rect.bottom,
                    dark ? 0xFF3B2667 : 0xFFFF9A8B, dark ? 0xFF0B486B : 0xFFFFD86F, Shader.TileMode.CLAMP));
            canvas.drawRect(rect, paint);
            paint.setShader(new RadialGradient(w * 0.7f, rect.top + 18 * d, 18 * d,
                    0xCCFFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP));
            canvas.drawCircle(w * 0.7f, rect.top + 18 * d, 18 * d, paint);
            paint.setShader(null);

            // The pill: height and side margin scaled to the card, at the preset's roundness.
            float scale = 0.42f;
            float ph = style.heightDp * scale * d;
            float side = Math.min(style.sideMarginDp * scale * d, w * 0.25f) + 6 * d;
            float bottom = rect.bottom - 6 * d;
            pill.set(rect.left + side, bottom - ph, rect.right - side, bottom);
            float r = ph / 2f * style.roundness;

            // Shadow, then the material at the preset's opacity, then the rim.
            paint.setColor(Color.argb(Math.round(70 * style.shadow), 0, 0, 0));
            paint.setShadowLayer(4 * d * style.shadow + 0.5f, 0, 1.5f * d, Color.argb(Math.round(110 * style.shadow), 0, 0, 0));
            canvas.drawRoundRect(pill, r, r, paint);
            paint.clearShadowLayer();
            paint.setColor(style.material(dark, style.solid ? 255 : Math.round(255 * Math.min(1f, style.opacity))));
            canvas.drawRoundRect(pill, r, r, paint);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(1f, 0.8f * d));
            paint.setColor(Color.argb(Math.min(255, Math.round((dark ? 0x66 : 0xF2) * style.rim)), 0xFF, 0xFF, 0xFF));
            canvas.drawRoundRect(pill, r, r, paint);
            paint.setStyle(Paint.Style.FILL);

            // Five tabs, the first selected in the preset's capsule.
            float inset = Math.max(1f, style.selectionInsetDp * scale * d);
            float tabInset = style.tabInsetDp * scale * d;
            float tabW = (pill.width() - 2 * tabInset) / 5f;
            float cy = pill.centerY();
            int shade = Math.min(255, Math.round((dark ? 0x36 : 0x29) * style.selectionShade));
            if (shade > 0) {
                float cw = Math.min(tabW + style.selectionWidthDp * scale * d, pill.width());
                float cx = pill.left + tabInset + tabW / 2f;
                float left = Math.max(pill.left + inset, cx - cw / 2f);
                RectF capsule = new RectF(left, pill.top + inset, left + cw, pill.bottom - inset);
                float cr = capsule.height() / 2f * style.roundness;
                paint.setColor(dark ? Color.argb(shade, 0xFF, 0xFF, 0xFF) : Color.argb(shade, 0, 0, 0));
                canvas.drawRoundRect(capsule, cr, cr, paint);
            }
            paint.setColor(dark ? Color.WHITE : 0xFF111111);
            for (int i = 0; i < 5; i++) {
                float x = pill.left + tabInset + tabW * (i + 0.5f);
                canvas.drawCircle(x, cy, (i == 0 ? 2.6f : 2.1f) * d, paint);
            }
            canvas.restore();

            if (badge != null) {
                // Wrapped to the card: a rounded tag with the text in white.
                int maxW = Math.round(rect.width() - 16 * d - 16 * d);
                if (badgeLayout == null || badgeLayoutWidth != maxW) {
                    badgeLayoutWidth = maxW;
                    android.text.TextPaint tp = new android.text.TextPaint(Paint.ANTI_ALIAS_FLAG);
                    tp.setTextSize(11 * d);
                    tp.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    tp.setColor(Color.WHITE);
                    badgeLayout = android.text.StaticLayout.Builder.obtain(badge, 0, badge.length(), tp, Math.max(1, maxW))
                            .setMaxLines(2).build();
                }
                float lw = 0;
                for (int line = 0; line < badgeLayout.getLineCount(); line++) {
                    lw = Math.max(lw, badgeLayout.getLineWidth(line));
                }
                RectF tag = new RectF(rect.left + 8 * d, rect.top + 8 * d,
                        rect.left + 8 * d + lw + 16 * d, rect.top + 8 * d + badgeLayout.getHeight() + 8 * d);
                paint.setColor(badgeColor);
                canvas.drawRoundRect(tag, 9 * d, 9 * d, paint);
                canvas.save();
                canvas.translate(tag.left + 8 * d, tag.top + 4 * d);
                badgeLayout.draw(canvas);
                canvas.restore();
            }

            // Ring around the active preset.
            if (active) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(2.5f * d);
                paint.setColor(ACCENT);
                canvas.drawRoundRect(rect, corner, corner, paint);
                paint.setStyle(Paint.Style.FILL);
            }

            text.setColor(active ? ACCENT : (dark ? 0xFFF5F5F5 : Color.BLACK));
            text.setTypeface(Typeface.create("sans-serif-medium", active ? Typeface.BOLD : Typeface.NORMAL));
            canvas.drawText(name, w / 2f, getHeight() - 5 * d, text);
        }
    }

    // endregion

    // region Chrome

    /** Small chips and rows for the preview's toolbar, in the menu's colors. */
    private static final class Chrome {
        private static final int ACCENT = 0xFF0095F6;
        private final Activity activity;
        private final boolean dark;
        private final float density;

        Chrome(Activity activity, boolean dark) {
            this.activity = activity;
            this.dark = dark;
            this.density = activity.getResources().getDisplayMetrics().density;
        }

        int dp(float v) {
            return Math.round(v * density);
        }

        LinearLayout row() {
            LinearLayout row = new LinearLayout(activity);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(0, dp(8), 0, 0);
            return row;
        }

        HorizontalScrollView scroller(View content) {
            HorizontalScrollView scroller = new HorizontalScrollView(activity);
            scroller.setHorizontalScrollBarEnabled(false);
            scroller.addView(content);
            return scroller;
        }

        TextView chip(String label, boolean on) {
            TextView chip = new TextView(activity);
            chip.setText(label);
            chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            chip.setPadding(dp(12), dp(6), dp(12), dp(6));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = dp(6);
            chip.setLayoutParams(lp);
            mark(chip, on);
            return chip;
        }

        void mark(TextView chip, boolean on) {
            GradientDrawable pill = new GradientDrawable();
            pill.setCornerRadius(dp(16));
            pill.setColor(on ? ACCENT : (dark ? 0xFF2C2C2E : 0xFFE5E5EA));
            chip.setBackground(pill);
            chip.setTextColor(on ? Color.WHITE : (dark ? 0xFFF5F5F5 : Color.BLACK));
        }

        TextView label(String text) {
            TextView label = new TextView(activity);
            label.setText(text.toUpperCase());
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            label.setLetterSpacing(0.03f);
            label.setTextColor(dark ? 0xFF98989F : 0xFF6C6C70);
            label.setPadding(dp(4), 0, dp(10), 0);
            return label;
        }

        interface Pick {
            void onPick(int index);
        }

        /**
         * An iOS style segmented control: a grey track with the chosen segment raised on a
         * lighter pill.
         */
        LinearLayout segmented(String[] labels, int chosen, Pick pick) {
            LinearLayout track = new LinearLayout(activity);
            track.setPadding(dp(2), dp(2), dp(2), dp(2));
            GradientDrawable trackShape = new GradientDrawable();
            trackShape.setCornerRadius(dp(10));
            trackShape.setColor(dark ? 0xFF1C1C1E : 0xFFE3E3E8);
            track.setBackground(trackShape);
            TextView[] segments = new TextView[labels.length];
            for (int i = 0; i < labels.length; i++) {
                final int index = i;
                TextView segment = new TextView(activity);
                segment.setText(labels[i]);
                segment.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                segment.setGravity(Gravity.CENTER);
                segment.setPadding(dp(12), dp(5), dp(12), dp(5));
                segment.setOnClickListener(v -> {
                    for (int k = 0; k < segments.length; k++) markSegment(segments[k], k == index);
                    pick.onPick(index);
                });
                segments[i] = segment;
                track.addView(segment);
                markSegment(segment, i == chosen);
            }
            return track;
        }

        private void markSegment(TextView segment, boolean on) {
            if (on) {
                GradientDrawable pill = new GradientDrawable();
                pill.setCornerRadius(dp(8));
                pill.setColor(dark ? 0xFF5A5A5E : Color.WHITE);
                segment.setBackground(pill);
                segment.setElevation(dp(1));
                segment.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            } else {
                segment.setBackground(null);
                segment.setElevation(0);
                segment.setTypeface(Typeface.DEFAULT);
            }
            segment.setTextColor(dark ? 0xFFF5F5F5 : Color.BLACK);
        }

        View gap() {
            View gap = new View(activity);
            gap.setLayoutParams(new LinearLayout.LayoutParams(dp(8), 1));
            return gap;
        }
    }

    // endregion
}
