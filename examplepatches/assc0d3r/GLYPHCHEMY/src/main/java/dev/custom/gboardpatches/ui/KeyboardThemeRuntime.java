package dev.custom.gboardpatches.ui;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.WeakHashMap;

/**
 * Applies the saved Gboard key theme and opens the Theme Builder from its settings entry.
 *
 * Gboard ships an obfuscated androidx.preference, so member names are resolved by signature
 * shape instead of by name.
 */
public final class KeyboardThemeRuntime {

    public static final String PREFS = "gboard_theme_studio";
    public static final String KEY_ENABLED = "theme_enabled";
    public static final String KEY_ACCENT = "theme_accent";
    public static final String KEY_KEY_BG = "theme_key_background";
    public static final String KEY_KEY_TEXT = "theme_key_text";
    public static final String KEY_RADIUS = "theme_corner_radius";
    public static final String KEY_FONT = "theme_key_font";
    public static final String KEY_BOARD_BG = "theme_board_background";
    public static final String KEY_MOD_BG = "theme_modifier_background";
    public static final String KEY_MOD_TEXT = "theme_modifier_text";
    public static final String KEY_ENTER_BG = "theme_enter_background";
    public static final String KEY_ENTER_TEXT = "theme_enter_text";
    public static final String KEY_PRESSED_BG = "theme_pressed_background";
    /** Raw "keySkin" JSON of the imported scene: the painted key faces. */
    public static final String KEY_KEY_SKIN = "theme_key_skin";
    public static final String KEY_BORDER_COLOR = "theme_border_color";
    public static final String KEY_BORDER_WIDTH = "theme_border_width";

    public static final int DEFAULT_ACCENT = 0xFF4285F4;
    public static final int DEFAULT_KEY_BG = 0xFF202124;
    public static final int DEFAULT_KEY_TEXT = 0xFFFFFFFF;
    public static final int DEFAULT_RADIUS = 8;

    private static final String THEME_PREF_KEY = "pref_key_gboard_theme_studio";

    private static long lastLoad = 0L;
    private static boolean enabled = false;
    private static int accent = DEFAULT_ACCENT;
    private static int keyBackground = DEFAULT_KEY_BG;
    private static int keyText = DEFAULT_KEY_TEXT;
    private static int radius = DEFAULT_RADIUS;
    private static String fontPath = null;
    private static Typeface keyTypeface = null;

    /** Sentinel for optional values: real colours are kept as unsigned 32-bit numbers. */
    private static final long UNSET = -1L;

    private static long boardBackground = UNSET;
    private static long modifierBackground = UNSET;
    private static long modifierText = UNSET;
    private static long enterBackground = UNSET;
    private static long enterText = UNSET;
    private static long pressedBackground = UNSET;
    private static long borderColor = UNSET;
    private static long borderWidth = UNSET;

    /** Parsed painted faces from the imported scene, or null when it has no keySkin. */
    private static KeySkin keySkin;
    private static String keySkinSource;

    /** Weak, so a recreated keyboard's old view tree can still be collected. */
    private static java.lang.ref.WeakReference<View> boardView = new java.lang.ref.WeakReference<View>(null);
    private static GradientDrawable boardDrawable;
    private static long boardBuiltFor = UNSET;
    private static Drawable boardSkinDrawable;
    private static KeySkin boardSkinFor;
    private static int boardSkinPalette;

    private KeyboardThemeRuntime() {
    }

    public static void initializePreferences(Object preferenceGroup) {
        try {
            Object preference = findPreference(preferenceGroup, THEME_PREF_KEY);
            if (preference == null) {
                return;
            }
            attachClickListener(preference);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Called from the preference row-binding hook with (preference, holder). Wiring here does not
     * depend on the settings fragment class, which is why the group-init hook alone was not enough
     * for every screen that shows the entry.
     */
    public static void applyRow(final Object preference, Object holder) {
        try {
            if (!hasOurKey(preference)) {
                return;
            }
            // This runs at the start of the row-bind method, before Gboard assigns the row's
            // click handler from the preference field, so replacing that field here is what makes
            // the row respond. Setting it on the item view now would be too early: the holder
            // has not been bound yet.
            Context context = resolveContext(preference);
            java.lang.reflect.Field intentField = findField(preference, Intent.class);
            if (context != null && intentField != null) {
                Intent intent = new Intent(context, KeyboardThemeStudioActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                intentField.setAccessible(true);
                intentField.set(preference, intent);
            }
            java.lang.reflect.Field clickField = findField(preference, View.OnClickListener.class);
            if (clickField == null) {
                return;
            }
            View.OnClickListener listener = new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    try {
                        launch(preference);
                    } catch (Throwable ignored) {
                    }
                }
            };
            try {
                clickField.setAccessible(true);
                clickField.set(preference, listener);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean hasOurKey(Object preference) {
        if (preference == null) {
            return false;
        }
        Class<?> type = preference.getClass();
        while (type != null) {
            java.lang.reflect.Field[] fields = type.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (!String.class.equals(fields[i].getType())) {
                    continue;
                }
                try {
                    fields[i].setAccessible(true);
                    Object value = fields[i].get(preference);
                    if (THEME_PREF_KEY.equals(value)) {
                        return true;
                    }
                } catch (Throwable ignored) {
                }
            }
            type = type.getSuperclass();
        }
        return false;
    }

    private static final WeakHashMap<View, KeyStyle> STYLES = new WeakHashMap<View, KeyStyle>();
    private static final WeakHashMap<View, Boolean> WATCHED = new WeakHashMap<View, Boolean>();
    private static final WeakHashMap<TextView, Typeface> APPLIED_FONTS =
        new WeakHashMap<TextView, Typeface>();
    /** Cached background and colours for one key view, rebuilt when the saved theme changes. */
    private static final class KeyStyle {
        Drawable background;
        int faceBackground;
        int faceText;
        int borderColor;
        int borderWidth;
        int radius;
        int pressedBackground;
        KeySkin skin;
        String slot;

        boolean matches(int faceBackground, int faceText, int borderColor, int borderWidth,
                        int radius, int pressedBackground, KeySkin skin, String slot) {
            return background != null
                && this.faceBackground == faceBackground
                && this.faceText == faceText
                && this.borderColor == borderColor
                && this.borderWidth == borderWidth
                && this.radius == radius
                && this.pressedBackground == pressedBackground
                && this.skin == skin
                && (slot == null ? this.slot == null : slot.equals(this.slot));
        }
    }

    public static void applyKey(final View keyView, Object softKeyDef) {
        if (keyView == null) {
            return;
        }
        final Context context = keyView.getContext();
        if (context == null) {
            return;
        }
        watch(keyView);
        // Gboard repaints the key inside its own render pass, after this hook runs at entry, so
        // the styling is applied once the pass has finished...
        keyView.post(new Runnable() {
            @Override
            public void run() {
                styleKey(keyView, context, softKeyDef);
            }
        });
    }

    /**
     * ...and then re-asserted immediately before every draw, because some keys are rebuilt by
     * Gboard while the keyboard is already visible.
     */
    private static void watch(final View keyView) {
        if (WATCHED.containsKey(keyView)) {
            return;
        }
        WATCHED.put(keyView, Boolean.TRUE);
        try {
            keyView.getViewTreeObserver().addOnPreDrawListener(
                new ViewTreeObserver.OnPreDrawListener() {
                    @Override
                    public boolean onPreDraw() {
                        try {
                            styleKey(keyView, keyView.getContext(), null);
                        } catch (Throwable ignored) {
                        }
                        return true;
                    }
                });
        } catch (Throwable ignored) {
        }
    }

    private static void styleKey(View keyView, Context context, Object softKeyDef) {
        if (context == null || keyView == null) {
            return;
        }
        refresh(context);
        if (!enabled) {
            return;
        }
        String entry = entryName(keyView);
        boolean enter = isEnterKey(entry);
        boolean modifier = isModifierKey(entry);

        int faceBackground = keyBackground;
        if (enter && enterBackground != UNSET) {
            faceBackground = (int) enterBackground;
        } else if (modifier && modifierBackground != UNSET) {
            faceBackground = (int) modifierBackground;
        }
        int faceText = keyText;
        if (enter && enterText != UNSET) {
            faceText = (int) enterText;
        } else if (modifier && modifierText != UNSET) {
            faceText = (int) modifierText;
        }
        int strokeColor = borderColor != UNSET ? (int) borderColor : accent;
        int strokeWidth = borderWidth != UNSET ? (int) borderWidth : 2;
        int downColor = pressedBackground != UNSET ? (int) pressedBackground : faceBackground;
        // A painted face's press layers only move their own art, so the flat pressed colour is
        // blended over the finished face at 60% to keep it visible without hiding the artwork.
        int pressedTint = pressedBackground != UNSET && downColor != faceBackground
            ? (downColor & 0x00FFFFFF) | 0x99000000 : 0;

        String skinSlot = keySkin == null ? null : keySkin.slotFor(enter, modifier, entry);
        if (skinSlot != null) {
            // The scene can give a slot its own letter colour (e.g. a dark enter label on a light
            // enter face); "previewLabel" just means "keep the flat theme's colour".
            faceText = KeySkin.labelColor(keySkin.slotNamed(skinSlot),
                paletteFor(faceBackground), faceText);
        }
        KeyStyle style = STYLES.get(keyView);
        if (style == null || !style.matches(faceBackground, faceText, strokeColor, strokeWidth,
                radius, downColor, keySkin, skinSlot)) {
            float density = keyView.getResources().getDisplayMetrics().density;
            style = new KeyStyle();
            // A painted face draws the scene's own outline in its layers, so the flat theme's
            // border only applies to the plain GradientDrawable path.
            Drawable painted = skinSlot == null ? null
                : KeySkin.buildKeyDrawable(keySkin, skinSlot, paletteFor(faceBackground),
                    pressedTint);
            style.background = painted != null
                ? new PressAwareDrawable(painted, keyView, skinSlot)
                : buildKeyBackground(faceBackground, downColor, strokeColor,
                    strokeWidth * density, radius * density);
            style.skin = keySkin;
            style.slot = skinSlot;
            style.faceBackground = faceBackground;
            style.faceText = faceText;
            style.borderColor = strokeColor;
            style.borderWidth = strokeWidth;
            style.radius = radius;
            style.pressedBackground = downColor;
            STYLES.put(keyView, style);
        }
        if (keyView.getBackground() != style.background) {
            keyView.setBackgroundDrawable(style.background);
        }
        // Some keys paint their face with an inner view that carries its own background, which
        // covers the one set on the key container itself.
        clearKeyFaceChildren(keyView, 0);
        styleLabels(keyView, style.faceText, keyTypeface);
        layoutLabel(keyView, skinSlot);
        styleBoard(keyView);
    }

    /** Theme colours the painted-face colour tokens ("face:lighten:0.3" and friends) resolve to. */
    private static KeySkin.Palette paletteFor(int faceBackground) {
        KeySkin.Palette palette = new KeySkin.Palette();
        palette.face = faceBackground;
        palette.board = boardBackground != UNSET ? (int) boardBackground : faceBackground;
        palette.chassis = palette.board;
        palette.accent = accent;
        palette.special = modifierBackground != UNSET
            ? (int) modifierBackground : faceBackground;
        palette.specialPressed = pressedBackground != UNSET
            ? (int) pressedBackground : palette.special;
        palette.label = keyText;
        palette.border = borderColor != UNSET ? (int) borderColor : accent;
        return palette;
    }

    /**
     * Wraps a painted key background so the letter can follow the face while it is held down.
     * The scenes' labelShift is the same nudge their layers apply to the face on press, so it has
     * to be re-applied whenever the view's pressed state flips – not only when the key is styled.
     */
    private static final class PressAwareDrawable extends Drawable {
        private final Drawable inner;
        private final View keyView;
        private final String slot;
        private boolean pressed;

        PressAwareDrawable(Drawable inner, View keyView, String slot) {
            this.inner = inner;
            this.keyView = keyView;
            this.slot = slot;
            this.pressed = keyView.isPressed();
        }

        @Override
        public boolean setState(int[] state) {
            boolean down = false;
            if (state != null) {
                for (int i = 0; i < state.length; i++) {
                    if (state[i] == android.R.attr.state_pressed) {
                        down = true;
                        break;
                    }
                }
            }
            if (down != pressed) {
                pressed = down;
                layoutLabel(keyView, slot);
            }
            return inner.setState(state);
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        public void draw(android.graphics.Canvas canvas) {
            inner.draw(canvas);
        }

        @Override
        public void setAlpha(int alpha) {
            inner.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter filter) {
            inner.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return inner.getOpacity();
        }

        @Override
        protected void onBoundsChange(android.graphics.Rect bounds) {
            inner.setBounds(bounds);
        }

        @Override
        public void setBounds(int left, int top, int right, int bottom) {
            inner.setBounds(left, top, right, bottom);
            super.setBounds(left, top, right, bottom);
        }
    }

    /** Normal and pressed faces of a key, with the theme's border. */
    private static Drawable buildKeyBackground(int normal, int pressed, int strokeColor,
                                               float strokeWidth, float radius) {
        GradientDrawable up = new GradientDrawable();
        up.setColor(normal);
        up.setCornerRadius(radius);
        GradientDrawable down = new GradientDrawable();
        down.setColor(pressed);
        down.setCornerRadius(radius);
        if (strokeWidth > 0f) {
            int width = Math.max(1, Math.round(strokeWidth));
            up.setStroke(width, strokeColor);
            down.setStroke(width, strokeColor);
        }
        if (pressed == normal) {
            return up;
        }
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[] {android.R.attr.state_pressed}, down);
        states.addState(new int[] {}, up);
        return states;
    }

    private static String entryName(View view) {
        try {
            if (view.getId() != View.NO_ID) {
                return view.getResources().getResourceEntryName(view.getId());
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isEnterKey(String entry) {
        return entry != null && entry.contains("ime_action");
    }

    private static boolean isModifierKey(String entry) {
        if (entry == null || !entry.startsWith("key_pos_")) {
            return false;
        }
        if (entry.startsWith("key_pos_qwerty") || entry.contains("space")
            || entry.contains("ime_action")) {
            return false;
        }
        return true;
    }

    /** Paints the keyboard board behind the keys when the theme defines one. */
    private static void styleBoard(View keyView) {
        if (boardBackground == UNSET && (keySkin == null || !keySkin.hasBoard())) {
            return;
        }
        View board = findBoardView(keyView);
        if (board == null) {
            return;
        }
        if (keySkin != null && keySkin.hasBoard()) {
            int palettePrint = paletteFor(keyBackground).fingerprint();
            if (boardSkinDrawable == null || boardSkinFor != keySkin
                    || boardSkinPalette != palettePrint) {
                boardSkinDrawable = KeySkin.buildBoardDrawable(keySkin, paletteFor(keyBackground));
                boardSkinFor = keySkin;
                boardSkinPalette = palettePrint;
            }
            if (boardSkinDrawable != null && board.getBackground() != boardSkinDrawable) {
                board.setBackgroundDrawable(boardSkinDrawable);
            }
            return;
        }
        if (boardBuiltFor != boardBackground) {
            boardDrawable = new GradientDrawable();
            boardDrawable.setColor((int) boardBackground);
            boardBuiltFor = boardBackground;
        }
        if (board.getBackground() != boardDrawable) {
            board.setBackgroundDrawable(boardDrawable);
        }
    }

    private static View findBoardView(View keyView) {
        View cached = boardView.get();
        // getWindowToken() is the API-1-safe way to ask "is this view still attached?".
        if (cached != null && cached.getWindowToken() != null) {
            return cached;
        }
        if (cached != null) {
            // Detached: the keyboard was rebuilt, so drop it and resolve the live tree.
            boardView = new java.lang.ref.WeakReference<View>(null);
        }
        View outermost = null;
        View current = keyView;
        int guard = 0;
        while (current != null && guard++ < 12) {
            String simple = current.getClass().getSimpleName();
            String name = entryName(current);
            boolean isBoard = simple.contains("SoftKeyboardView")
                || (name != null && name.contains("keyboard_holder"));
            if (isBoard) {
                outermost = current;
            }
            android.view.ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        if (outermost != null) {
            boardView = new java.lang.ref.WeakReference<View>(outermost);
        }
        return outermost;
    }


    private static void refresh(Context context) {
        long now = System.currentTimeMillis();
        if (now - lastLoad < 1000L) {
            return;
        }
        lastLoad = now;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            enabled = prefs.getBoolean(KEY_ENABLED, false);
            accent = prefs.getInt(KEY_ACCENT, DEFAULT_ACCENT);
            keyBackground = prefs.getInt(KEY_KEY_BG, DEFAULT_KEY_BG);
            keyText = prefs.getInt(KEY_KEY_TEXT, DEFAULT_KEY_TEXT);
            radius = prefs.getInt(KEY_RADIUS, DEFAULT_RADIUS);
            boardBackground = readColor(prefs, KEY_BOARD_BG);
            modifierBackground = readColor(prefs, KEY_MOD_BG);
            modifierText = readColor(prefs, KEY_MOD_TEXT);
            enterBackground = readColor(prefs, KEY_ENTER_BG);
            enterText = readColor(prefs, KEY_ENTER_TEXT);
            pressedBackground = readColor(prefs, KEY_PRESSED_BG);
            borderColor = readColor(prefs, KEY_BORDER_COLOR);
            borderWidth = readNumber(prefs, KEY_BORDER_WIDTH);
            String skin = prefs.getString(KEY_KEY_SKIN, null);
            if (skin == null ? keySkinSource != null : !skin.equals(keySkinSource)) {
                keySkinSource = skin;
                keySkin = skin == null ? null : KeySkin.parse(skin);
                STYLES.clear();
                boardSkinDrawable = null;
                boardSkinFor = null;
            }
            String savedFont = prefs.getString(KEY_FONT, null);
            if (savedFont != null && !savedFont.equals(fontPath)) {
                fontPath = savedFont;
                keyTypeface = loadTypeface(savedFont);
            }
        } catch (Throwable ignored) {
        }
    }

    /** Loads a font file copied into app storage; a broken or missing file falls back to Gboard's. */
    /**
     * Puts the letter where the scene's labelBox asks for it. The box is in the slot's design space,
     * so it goes through the same stretch mapping as the painted face; labelShift is the nudge that
     * keeps the letter glued to a face that sinks when pressed.
     */
    private static void layoutLabel(View keyView, String slotName) {
        if (keySkin == null || slotName == null) {
            return;
        }
        KeySkin.Slot slot = keySkin.slotNamed(slotName);
        if (slot == null) {
            return;
        }
        int width = keyView.getWidth();
        int height = keyView.getHeight();
        if (width <= 0 || height <= 0) {
            return;
        }
        View label = findLabel(keyView);
        if (label == null) {
            return;
        }
        float dx = 0f;
        float dy = 0f;
        float[] box = keySkin.labelRect(slot, width, height);
        if (box != null) {
            // The scene draws the letter inside its labelBox, so a box smaller than the glyph must
            // shrink the letter rather than let it hang over the painted plate.
            final View key = keyView;
            final String name = slotName;
            if (fitLabel(label, box[2] - box[0], box[3] - box[1])) {
                // A resized letter only reports its new centre once the layout pass has run, so
                // re-centre on the next frame instead of using the pre-resize bounds.
                key.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        layoutLabel(key, name);
                    }
                }, 48);
            }
            float[] centre = centreInside(keyView, label);
            dx = (box[0] + box[2]) / 2f - centre[0];
            dy = (box[1] + box[3]) / 2f - centre[1];
        }
        if (keyView.isPressed()) {
            float[] shift = keySkin.labelShiftPixels(slot, width, height);
            if (shift != null) {
                dx += shift[0];
                dy += shift[1];
            }
        }
        translate(label, dx, dy);
    }


    /** Text size each label had before any fitting, and the scale currently applied to it. */
    private static final java.util.WeakHashMap<View, Float> BASE_TEXT_SIZES =
        new java.util.WeakHashMap<View, Float>();
    private static final java.util.WeakHashMap<View, Float> FITTED_SCALES =
        new java.util.WeakHashMap<View, Float>();

    /**
     * Scales a letter down when its labelBox is narrower or shorter than the glyph. The box is
     * measured in pixels already, so the text is resized in px; a box that fits leaves it alone, and
     * the original size is remembered so a later, larger box restores it.
     */
    private static boolean fitLabel(View label, float boxWidth, float boxHeight) {
        if (!(label instanceof TextView) || boxWidth <= 0f || boxHeight <= 0f) {
            return false;
        }
        TextView text = (TextView) label;
        CharSequence content = text.getText();
        String value = content == null ? "" : content.toString();
        if (value.length() == 0) {
            return false;
        }
        Float known = BASE_TEXT_SIZES.get(label);
        if (known == null) {
            known = Float.valueOf(text.getTextSize());
            BASE_TEXT_SIZES.put(label, known);
        }
        float base = known.floatValue();
        float current = text.getTextSize();
        if (base <= 0f || current <= 0f) {
            return false;
        }
        float scale = 1f;
        try {
            android.graphics.Paint paint = text.getPaint();
            if (paint != null) {
                // Measure at the untouched size, then compare with the box.
                float ratio = base / current;
                float width = paint.measureText(value) * ratio;
                android.graphics.Paint.FontMetrics metrics = paint.getFontMetrics();
                float height = (metrics.descent - metrics.ascent) * ratio;
                if (width > boxWidth) {
                    scale = Math.min(scale, boxWidth / width);
                }
                if (height > boxHeight) {
                    scale = Math.min(scale, boxHeight / height);
                }
            }
        } catch (Throwable ignored) {
            return false;
        }
        scale = Math.max(scale, 0.3f);
        Float applied = FITTED_SCALES.get(label);
        float previous = applied == null ? 1f : applied.floatValue();
        if (Math.abs(scale - previous) < 0.02f) {
            return false;
        }
        try {
            text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, base * scale);
            FITTED_SCALES.put(label, Float.valueOf(scale));
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * A key carries the letter plus smaller number/icon hints, and on the first styling pass every
     * child still has zero width, so area cannot tell them apart. The letter is the text drawn at
     * the largest size; area only breaks ties between equally sized views.
     */
    private static View findLabel(View view) {
        View[] best = new View[1];
        int[] bestArea = new int[1];
        float[] bestSize = new float[1];
        collectLabels(view, best, bestArea, bestSize);
        return best[0];
    }

    private static void collectLabels(View view, View[] best, int[] bestArea, float[] bestSize) {
        if (view instanceof TextView) {
            TextView textView = (TextView) view;
            CharSequence text = textView.getText();
            if (text != null && text.length() > 0) {
                int area = view.getWidth() * view.getHeight();
                float size = textView.getTextSize();
                boolean larger = size > bestSize[0] + 0.5f;
                boolean tie = Math.abs(size - bestSize[0]) <= 0.5f && area > bestArea[0];
                if (best[0] == null || larger || tie) {
                    best[0] = view;
                    bestArea[0] = area;
                    bestSize[0] = size;
                }
            }
            return;
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                collectLabels(group.getChildAt(i), best, bestArea, bestSize);
            }
        }
    }

    /** Centre of a descendant in the key's coordinate space. */
    private static float[] centreInside(View keyView, View label) {
        float x = label.getLeft() + label.getWidth() / 2f;
        float y = label.getTop() + label.getHeight() / 2f;
        android.view.ViewParent parent = label.getParent();
        int guard = 0;
        while (parent instanceof View && parent != keyView && guard++ < 6) {
            View view = (View) parent;
            x += view.getLeft();
            y += view.getTop();
            parent = view.getParent();
        }
        return new float[] {x, y};
    }

    private static java.lang.reflect.Method setTranslationX;
    private static java.lang.reflect.Method setTranslationY;
    private static final java.util.WeakHashMap<View, float[]> LABEL_OFFSETS =
        new java.util.WeakHashMap<View, float[]>();

    /** Moves the letter; the two View methods are resolved once and then reused every frame. */
    private static void translate(View label, float dx, float dy) {
        float[] previous = LABEL_OFFSETS.get(label);
        if (previous != null && Math.abs(previous[0] - dx) < 0.05f
                && Math.abs(previous[1] - dy) < 0.05f) {
            return;
        }
        try {
            if (setTranslationX == null) {
                setTranslationX = View.class.getMethod("setTranslationX", float.class);
                setTranslationY = View.class.getMethod("setTranslationY", float.class);
            }
            setTranslationX.invoke(label, Float.valueOf(dx));
            setTranslationY.invoke(label, Float.valueOf(dy));
            LABEL_OFFSETS.put(label, new float[] {dx, dy});
        } catch (Throwable ignored) {
        }
    }


    /**
     * The render hook receives the SoftKeyView container, not the label itself, so every
     * descendant TextView (letter, hint, symbol) is styled individually.
     */
    /**
     * Inner views that carry their own background hide the themed one and would draw a second
     * rounded face on top of it, so their background is dropped and the key's shows through.
     */
    private static void clearKeyFaceChildren(View view, int depth) {
        if (depth > 2 || !(view instanceof android.view.ViewGroup)) {
            return;
        }
        android.view.ViewGroup group = (android.view.ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (!(child instanceof TextView) && child.getBackground() != null) {
                child.setBackgroundDrawable(null);
            }
            clearKeyFaceChildren(child, depth + 1);
        }
    }

    private static void styleLabels(View view, int textColor, Typeface typeface) {
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            if (text.getCurrentTextColor() != textColor) {
                text.setTextColor(textColor);
            }
            if (typeface != null && APPLIED_FONTS.get(text) != typeface) {
                APPLIED_FONTS.put(text, typeface);
                text.setTypeface(typeface);
                // AutoCenterScaleTextView renders through a StaticLayout cached by text, so the
                // text is re-applied once to rebuild that layout with the new typeface.
                CharSequence current = text.getText();
                if (current != null && current.length() > 0) {
                    text.setText("");
                    text.setText(current);
                }
            }
            return;
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                styleLabels(group.getChildAt(i), textColor, typeface);
            }
        }
    }

    private static long readColor(SharedPreferences prefs, String key) {
        try {
            return prefs.contains(key) ? (prefs.getInt(key, 0) & 0xFFFFFFFFL) : UNSET;
        } catch (Throwable ignored) {
            return UNSET;
        }
    }

    private static long readNumber(SharedPreferences prefs, String key) {
        try {
            return prefs.contains(key) ? prefs.getInt(key, 0) : UNSET;
        } catch (Throwable ignored) {
            return UNSET;
        }
    }

    private static Typeface loadTypeface(String path) {
        if (path == null || path.length() == 0) {
            return null;
        }
        try {
            java.io.File file = new java.io.File(path);
            if (!file.isFile()) {
                return null;
            }
            return Typeface.createFromFile(file);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object findPreference(Object group, String key) {
        if (group == null) {
            return null;
        }
        Class<?> type = group.getClass();
        while (type != null) {
            Method[] methods = type.getDeclaredMethods();
            for (int i = 0; i < methods.length; i++) {
                Class<?>[] params = methods[i].getParameterTypes();
                if (params.length == 1
                    && params[0] == CharSequence.class
                    && "androidx.preference.Preference".equals(
                        methods[i].getReturnType().getName())) {
                    try {
                        methods[i].setAccessible(true);
                        Object found = methods[i].invoke(group, key);
                        if (found != null) {
                            return found;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            type = type.getSuperclass();
        }
        return null;
    }

    /**
     * Gboard's androidx.preference fork exposes no listener setter: the row click handler is a
     * plain {@code View.OnClickListener} field, and the preference keeps an {@code Intent} field
     * that its own click path launches. Setting that Intent is what Gboard itself does for
     * "open an activity" preferences, so the row works without replacing any internal listener.
     */
    private static void attachClickListener(final Object preference) throws Exception {
        Context context = resolveContext(preference);
        java.lang.reflect.Field intentField = findField(preference, Intent.class);
        if (context != null && intentField != null) {
            Intent intent = new Intent(context, KeyboardThemeStudioActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intentField.setAccessible(true);
            intentField.set(preference, intent);
        }

        // Belt and braces: if the preference has a directly assignable click listener field,
        // point it at the builder as well (it may be final on some Gboard builds, so ignore
        // failures and let the Intent above do the work).
        java.lang.reflect.Field target = findField(preference, View.OnClickListener.class);
        if (target == null) {
            return;
        }
        View.OnClickListener listener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    launch(preference);
                } catch (Throwable ignored) {
                }
            }
        };
        try {
            target.setAccessible(true);
            target.set(preference, listener);
        } catch (Throwable ignored) {
        }
    }

    private static java.lang.reflect.Field findField(Object instance, Class<?> fieldType) {
        if (instance == null) {
            return null;
        }
        Class<?> type = instance.getClass();
        while (type != null) {
            java.lang.reflect.Field[] fields = type.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                if (fieldType.equals(fields[i].getType())) {
                    return fields[i];
                }
            }
            type = type.getSuperclass();
        }
        return null;
    }

    private static void launch(Object preference) {
        Context context = resolveContext(preference);
        if (context == null) {
            return;
        }
        Intent intent = new Intent(context, KeyboardThemeStudioActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    private static Context resolveContext(Object preference) {
        if (preference instanceof View) {
            return ((View) preference).getContext();
        }
        if (preference == null) {
            return null;
        }
        // Gboard keeps the context in a plain field; there is no getContext() accessor to call.
        java.lang.reflect.Field contextField = findField(preference, Context.class);
        if (contextField != null) {
            try {
                contextField.setAccessible(true);
                Object value = contextField.get(preference);
                if (value instanceof Context) {
                    return (Context) value;
                }
            } catch (Throwable ignored) {
            }
        }
        Class<?> type = preference.getClass();
        while (type != null) {
            Method[] methods = type.getDeclaredMethods();
            for (int i = 0; i < methods.length; i++) {
                if (methods[i].getParameterTypes().length == 0
                    && methods[i].getReturnType() == Context.class) {
                    try {
                        methods[i].setAccessible(true);
                        Object value = methods[i].invoke(preference);
                        if (value instanceof Context) {
                            return (Context) value;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            type = type.getSuperclass();
        }
        return null;
    }
}
