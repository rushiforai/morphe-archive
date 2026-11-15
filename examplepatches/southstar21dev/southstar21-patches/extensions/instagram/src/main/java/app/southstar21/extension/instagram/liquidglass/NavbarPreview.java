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

    // region Factories

    /** The Customize navbar page's preview, with its toolbar and presets under it. */
    static View customizer(Activity activity, Runnable refresh) {
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
        if (demo != null) addView(demo.caption, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START));
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (router == null) {
            controller.install(true);
            router = new TouchRouter(super::dispatchTouchEvent, controller.lens());
            applyTheme();
        }
    }

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
    private enum Act { NONE, DRAG, TAPS, SCROLL }

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
        private final Act act;
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
            }
            if (setting == NavbarStyle.GLARE) theme = false;
            if (setting == NavbarStyle.EDGE_CLARITY) theme = true;
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
            if (value != lastValue || style == null) {
                lastValue = value;
                Map<String, Integer> overrides = new HashMap<>(fixed);
                overrides.put(setting.key, value);
                style = NavbarStyle.withOverrides(overrides);
                caption.invalidate();
            }
            return style;
        }

        /** Once a frame, from the feed: acts out the demo's gesture. */
        void tick() {
            if (acting) return;
            acting = true;
            try {
                perform((System.nanoTime() - start) / 1_000_000L);
            } finally {
                acting = false;
            }
        }

        private boolean acting;

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
            if (demo != null) demo.tick();

            int ink = dark ? Color.WHITE : 0xFF111111;
            int faint = dark ? 0xFF3A3A3C : 0xFFDADADF;
            canvas.drawColor(dark ? 0xFF0B0F14 : Color.WHITE);
            int kind = demo != null ? 0 : backdrop;
            float post = (kind == 1 ? 200f : POST) * density;
            int first = (int) Math.floor(scroll / post);
            for (int k = first; k * post - scroll < getHeight(); k++) {
                float top = k * post - scroll;
                if (kind == 1) drawText(canvas, k, top, ink, faint);
                else if (kind == 2) drawColors(canvas, k, top, post);
                else drawPost(canvas, k, top, ink, faint);
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
            paint.setColor(style.material(dark, Math.round(255 * Math.min(1f, style.opacity))));
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
