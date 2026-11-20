package app.southstar21.extension.youtubemusic.liquidglass;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import java.util.ArrayList;

/**
 * The full player in glass: the collapse, cast and menu buttons and the previous, play/pause
 * and next buttons as two rows of liquid glass ({@link JellyGlass}: drops that swell, stretch,
 * wobble and melt together under the finger; a white play icon instead of YouTube Music's
 * white disc), a glass sheen
 * over the like / lyrics / comments chips and the song/video switch, and a queue sheet with
 * rounded glass edges. The blurred album art behind it all is drawn by the page's background
 * (see {@link MiniPlayerGlass}).
 * <p>
 * YouTube Music builds the player's views once and keeps them, but may set their backgrounds
 * again; {@link #apply()} runs every frame the full player shows and puts ours back.
 */
final class FullPlayerGlass implements TouchRouter.Watcher {
    private static final ColorStateList WHITE = ColorStateList.valueOf(Color.WHITE);
    private final ViewGroup page;
    private final float density;
    private final int collapseId, menuId, castId, toggleId, previousId, nextId, playId;
    private final int actionBarId, sheetId, topControlsId, controlsId;
    /** The action bar's chips, and the hosts that have a sheen. */
    private final ArrayList<View> chips = new ArrayList<>();
    private final ArrayList<View> sheened = new ArrayList<>();
    private final java.util.HashMap<View, Glass> sheens = new java.util.HashMap<>();
    private final int[] location = new int[2];
    private final JellyGlass topRow, controlsRow, switchGlass;
    private final SwitchThumb thumb;
    private final int songIconId, videoIconId;
    /** Found views, looked up again after a layout pass (each lookup walks the page). */
    private View top, controls, toggle, sheet, bar;
    private boolean active;
    private long lastFind;

    FullPlayerGlass(Activity activity, ViewGroup page, JellyGlass.Backdrop backdrop) {
        this.page = page;
        this.density = page.getResources().getDisplayMetrics().density;
        collapseId = LiquidGlassNavBarPatch.id(activity, "player_collapse_button");
        menuId = LiquidGlassNavBarPatch.id(activity, "contextual_menu");
        castId = LiquidGlassNavBarPatch.id(activity, "cast_button_container");
        toggleId = LiquidGlassNavBarPatch.id(activity, "audio_video_switch_toggle");
        previousId = LiquidGlassNavBarPatch.id(activity, "player_control_previous_button");
        nextId = LiquidGlassNavBarPatch.id(activity, "player_control_next_button");
        playId = LiquidGlassNavBarPatch.id(activity, "player_control_play_pause_replay_button");
        actionBarId = LiquidGlassNavBarPatch.id(activity, "video_action_bar");
        sheetId = LiquidGlassNavBarPatch.id(activity, "player_bottom_sheet");
        topControlsId = LiquidGlassNavBarPatch.id(activity, "player_top_controls");
        controlsId = LiquidGlassNavBarPatch.id(activity, "music_playback_controls");
        float d = density;
        topRow = new JellyGlass(page, d, backdrop,
                new JellyGlass.Drop(collapseId, 40 * d, 0.06f),
                new JellyGlass.Drop(castId, 40 * d, 0.06f),
                new JellyGlass.Drop(menuId, 40 * d, 0.06f));
        controlsRow = new JellyGlass(page, d, backdrop,
                new JellyGlass.Drop(previousId, 56 * d, 0.06f),
                new JellyGlass.Drop(playId, 72 * d, 0.12f),
                new JellyGlass.Drop(nextId, 56 * d, 0.06f));
        songIconId = LiquidGlassNavBarPatch.id(activity, "song_icon");
        videoIconId = LiquidGlassNavBarPatch.id(activity, "video_icon");
        thumb = new SwitchThumb();
        // The song/video switch: its pill liquid glass in place of YouTube Music's dark one, and
        // a brighter glass thumb under the chosen icon.
        switchGlass = new JellyGlass(page, d, backdrop, JellyGlass.Drop.filling(toggleId, 0.04f))
                .decor(thumb).replacingOriginal();
        TouchRouter.watch(this);
    }

    /** The full player is closing: the drops stop listening to touches. */
    void hide() {
        active = false;
        topRow.release();
        controlsRow.release();
    }

    @Override
    public void onTouch(android.view.MotionEvent event) {
        if (!active) return;
        // The queue sheet, pulled up, covers the buttons.
        View s = sheet;
        if (s != null && s.isShown()) {
            s.getLocationOnScreen(location);
            if (event.getRawY() >= location[1] && event.getActionMasked() == android.view.MotionEvent.ACTION_DOWN) {
                return;
            }
        }
        topRow.onTouch(event);
        controlsRow.onTouch(event);
        // Not the switch: it stays still under the finger, only its thumb slides.
    }

    /** The page's backdrop was redrawn: the glass shows it. */
    void backdropChanged() {
        topRow.backdropChanged();
        controlsRow.backdropChanged();
        switchGlass.backdropChanged();
    }

    /** Puts the glass on the full player's parts; cheap when it's all in place already. */
    void apply(boolean relayout, long now) {
        active = true;
        boolean toggleLost = (toggle == null || !toggle.isShown()) && now - lastFind > 500;
        if (relayout || top == null || !top.isAttachedToWindow() || toggleLost) {
            lastFind = now;
            // YouTube Music keeps hidden copies of these buttons elsewhere on the page (the video
            // overlay), found first by id: look inside the visible bars.
            top = find(topControlsId);
            controls = find(controlsId);
            toggle = findShown(page, toggleId);
            sheet = find(sheetId);
            bar = find(actionBarId);
            relayout = true;
        }
        topRow.apply(top instanceof ViewGroup ? (ViewGroup) top : null, relayout);
        controlsRow.apply(controls instanceof ViewGroup ? (ViewGroup) controls : null, relayout);
        View play = find(controls, playId);
        if (play instanceof ImageView) {
            // YouTube Music's icon is dark, for its white disc: white on the glass.
            ImageView image = (ImageView) play;
            if (image.getImageTintList() != WHITE) image.setImageTintList(WHITE);
        }
        switchGlass.apply(toggle instanceof ViewGroup ? (ViewGroup) toggle : null, relayout);
        if (toggle != null) {
            // The rim of earlier versions: the switch is glass itself now.
            if (toggle.getForeground() instanceof Glass) toggle.setForeground(null);
            thumb.update((ViewGroup) toggle);
            hideOwnThumb(toggle);
        }
        sheet(sheet);
        chips(bar);
    }

    /** YouTube Music's own thumb, made clear, and the switch it belongs to. */
    private Drawable ownThumb;
    private View ownThumbOf;

    /**
     * The switch paints its grey thumb itself, from a GradientDrawable it keeps (and slides with
     * an animator), not from its background: found by type and made clear, under the glass one.
     */
    private void hideOwnThumb(View toggle) {
        if (toggle != ownThumbOf) {
            ownThumbOf = toggle;
            ownThumb = null;
            try {
                for (java.lang.reflect.Field f : toggle.getClass().getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())
                            || !Drawable.class.isAssignableFrom(f.getType())) continue;
                    f.setAccessible(true);
                    Object value = f.get(toggle);
                    if (value instanceof android.graphics.drawable.GradientDrawable) {
                        ownThumb = (Drawable) value;
                        break;
                    }
                }
            } catch (Throwable ignored) {
                // Another version: its thumb shows under the glass one.
            }
        }
        if (ownThumb != null && ownThumb.getAlpha() != 0) {
            ownThumb.setAlpha(0);
            toggle.invalidate();
        }
    }

    /** The view with {@code id} that's on screen: YouTube Music keeps hidden copies of some. */
    private static View findShown(View view, int id) {
        if (id == 0) return null;
        if (view.getId() == id && view.isShown()) return view;
        if (!(view instanceof ViewGroup) || view.getVisibility() != View.VISIBLE) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = findShown(group.getChildAt(i), id);
            if (found != null) return found;
        }
        return null;
    }

    private View find(int id) {
        return id == 0 ? null : page.findViewById(id);
    }

    private static View find(View parent, int id) {
        return parent == null || id == 0 ? null : parent.findViewById(id);
    }

    /** The queue sheet keeps YouTube Music's color, with rounded tops and a glass rim. */
    private void sheet(View sheet) {
        if (sheet == null) return;
        Drawable bg = sheet.getBackground();
        if (!(bg instanceof SheetBackground)) {
            int color = bg instanceof ColorDrawable ? ((ColorDrawable) bg).getColor() : 0xFF1C1B1F;
            sheet.setBackground(new SheetBackground(color, 28 * density, density));
        }
        // Its tab strip paints the same color square over the rounded corners.
        if (sheet instanceof ViewGroup) clearTabStrip((ViewGroup) sheet, 0);
    }

    private void clearTabStrip(ViewGroup group, int depth) {
        if (depth > 3) return;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getClass().getName().endsWith("TabLayout")) {
                if (child.getBackground() instanceof ColorDrawable) child.setBackground(null);
                return;
            }
            if (child instanceof ViewGroup) clearTabStrip((ViewGroup) child, depth + 1);
        }
    }

    /**
     * YouTube Music draws its chips itself (Litho), with no view background to replace: the
     * sheen is in each chip host's own overlay, so it moves, scrolls and shrinks on press with
     * the chip in the same frame (drawn over the row, following the chips, it lagged a frame:
     * a loose outline). Litho reuses hosts as the row scrolls, so the chips are checked every
     * frame (a handful of views): a host that's no longer a chip loses its sheen at once, and
     * a new one gets it at once, with no flashing.
     */
    private void chips(View bar) {
        if (!(bar instanceof ViewGroup) || bar.getWidth() == 0) return;
        chips.clear();
        findChips((ViewGroup) bar, 0);
        for (int i = sheened.size() - 1; i >= 0; i--) {
            View old = sheened.get(i);
            if (!chips.contains(old)) {
                Glass g = sheens.remove(old);
                if (g != null) old.getOverlay().remove(g);
                sheened.remove(i);
            }
        }
        for (View chip : chips) {
            Glass g = sheens.get(chip);
            if (g == null) {
                g = new Glass(Glass.CAPSULE, 0, 0);
                sheens.put(chip, g);
                sheened.add(chip);
                chip.getOverlay().add(g);
            }
            Rect b = g.getBounds();
            if (b.width() != chip.getWidth() || b.height() != chip.getHeight()) {
                g.setBounds(0, 0, chip.getWidth(), chip.getHeight());
            }
            // Earlier versions put it in the foreground.
            if (chip.getForeground() instanceof Glass) chip.setForeground(null);
        }
    }

    /** A chip: a component host inside another, pill sized (30 to 48dp tall). */
    private void findChips(ViewGroup group, int depth) {
        if (depth > 8) return;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            float h = child.getHeight() / density;
            if (child.getClass().getSimpleName().equals("ComponentHost")
                    && group.getClass().getSimpleName().equals("ComponentHost")
                    && h >= 30 && h <= 48 && child.getWidth() > child.getHeight()) {
                chips.add(child);
                continue;
            }
            if (child instanceof ViewGroup) findChips((ViewGroup) child, depth + 1);
        }
    }

    /**
     * The switch's thumb: a brighter glass capsule under the chosen icon (the one YouTube Music
     * leaves untinted), sliding to the other without overshoot or wobble.
     */
    private final class SwitchThumb extends Drawable {
        private final LiquidGlassLens.Spring x = new LiquidGlassLens.Spring(420f, 1f, 0.3f);
        private final Glass glass = new Glass(Glass.CAPSULE, 0, Glass.STRONG_FILL);
        private float width, height;
        private boolean placed;
        private long last;
        private View host;

        /** Follows YouTube Music's choice; moves the spring on a frame. */
        void update(ViewGroup toggle) {
            host = toggle;
            View song = songIconId == 0 ? null : toggle.findViewById(songIconId);
            View video = videoIconId == 0 ? null : toggle.findViewById(videoIconId);
            if (!(song instanceof ImageView) || !(video instanceof ImageView) || song.getWidth() == 0) return;
            View chosen = ((ImageView) video).getImageTintList() == null
                    && ((ImageView) song).getImageTintList() != null ? video : song;
            float target = chosen.getLeft() + chosen.getWidth() / 2f;
            width = chosen.getWidth();
            height = toggle.getHeight();
            long now = System.nanoTime();
            if (!placed) {
                placed = true;
                x.snap(target);
                last = now;
                toggle.invalidate();
                return;
            }
            x.target = target;
            if (x.isAtRest()) {
                last = now;
                return;
            }
            x.step(Math.min(1f / 30f, (now - last) / 1e9f));
            last = now;
            toggle.invalidate();
        }

        @Override
        public void draw(Canvas canvas) {
            if (!placed || width <= 0f || host == null) return;
            float inset = 4 * density;
            float w = width - 2 * inset, h = height - 2 * inset;
            glass.setBounds(Math.round(x.value - w / 2f), Math.round((height - h) / 2f),
                    Math.round(x.value + w / 2f), Math.round((height + h) / 2f));
            glass.draw(canvas);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Glass on the player's dark, album tinted background: a light translucent fill (none for
     * a sheen), a rim bright at the top and fading down, and a soft highlight across the top.
     */
    static final class Glass extends Drawable {
        static final int CIRCLE = 0, CAPSULE = 1;
        static final int NONE = 0, FILL = 1, STRONG_FILL = 2;
        private final int shape;
        /** CIRCLE: the disc's diameter in px, centered (0 = the bounds' smaller side). */
        private final int size;
        private final int fill;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint shinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private int shaderTop = Integer.MIN_VALUE, shaderHeight, shaderLeft;

        Glass(int shape, int size, int fill) {
            this.shape = shape;
            this.size = size;
            this.fill = fill;
            fillPaint.setColor(fill == STRONG_FILL ? 0x24FFFFFF : fill == FILL ? 0x14FFFFFF : 0);
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            if (shape == CIRCLE) {
                float d = size > 0 ? Math.min(size, Math.min(b.width(), b.height())) : Math.min(b.width(), b.height());
                rect.set(b.exactCenterX() - d / 2f, b.exactCenterY() - d / 2f, b.exactCenterX() + d / 2f, b.exactCenterY() + d / 2f);
            } else {
                rect.set(b);
            }
            float density = Math.max(1f, rect.height() / 40f);
            float stroke = Math.max(1f, Math.min(2.5f, 0.9f * density));
            rimPaint.setStrokeWidth(stroke);
            int top = Math.round(rect.top), h = Math.max(1, Math.round(rect.height()));
            int left = Math.round(rect.left);
            if (top != shaderTop || h != shaderHeight || left != shaderLeft) {
                shaderLeft = left;
                shaderTop = top;
                shaderHeight = h;
                // As iOS glass: bright where the edge faces the light (top left), fainter opposite.
                float span = Math.min(rect.width(), rect.height());
                rimPaint.setShader(new LinearGradient(rect.left, rect.top, rect.left + span, rect.top + span,
                        new int[]{0x99FFFFFF, 0x12FFFFFF, 0x12FFFFFF, 0x5CFFFFFF}, new float[]{0f, 0.4f, 0.6f, 1f},
                        Shader.TileMode.CLAMP));
                shinePaint.setShader(new LinearGradient(0, rect.top, 0, rect.top + rect.height() * 0.55f,
                        0x1FFFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP));
            }
            float r = rect.height() / 2f;
            if (fill != NONE) canvas.drawRoundRect(rect, r, r, fillPaint);
            canvas.drawRoundRect(rect, r, r, shinePaint);
            rect.inset(stroke / 2f, stroke / 2f);
            canvas.drawRoundRect(rect, r, r, rimPaint);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** The queue sheet: YouTube Music's color with rounded top corners and a glass rim along the top. */
    private static final class SheetBackground extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float radius;
        private final RectF rect = new RectF();
        private final android.graphics.Path path = new android.graphics.Path();

        SheetBackground(int color, float radius, float density) {
            this.radius = radius;
            fillPaint.setColor(color);
            rimPaint.setStyle(Paint.Style.STROKE);
            rimPaint.setStrokeWidth(Math.max(1f, density));
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            rect.set(bounds);
            path.reset();
            float[] radii = {radius, radius, radius, radius, 0, 0, 0, 0};
            path.addRoundRect(rect, radii, android.graphics.Path.Direction.CW);
            rimPaint.setShader(new LinearGradient(0, bounds.top, 0, bounds.top + radius * 1.5f,
                    0x55FFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            canvas.drawPath(path, fillPaint);
            canvas.drawPath(path, rimPaint);
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public boolean getPadding(Rect padding) {
            padding.set(0, 0, 0, 0);
            return false;
        }
    }
}
