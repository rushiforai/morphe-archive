package e.e.a;

import android.graphics.Canvas;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.preference.PreferenceManager;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;

/** Draw the v2.1.0 video-edge colours on the visible playback controls and cards. */
public final class AmbientCard217 {
    private static final Map<Object, Panel> PANELS = new WeakHashMap<>();
    private static final String GLOW = "e.e.a.AmbientLight$Glow";
    private static final PorterDuffXfermode MASK = new PorterDuffXfermode(PorterDuff.Mode.SRC_ATOP);
    private static final float[] FADE = {0f, .4f, .8f, 1f};
    private static final int[] OPACITY = {0xff000000, 0xb0000000, 0x35000000, 0};
    private static final PorterDuffXfermode BEHIND = new PorterDuffXfermode(PorterDuff.Mode.DST_OVER);
    private static Field glowField, colorsField, videoField, alphaField, spreadField, sidesField;

    private AmbientCard217() {}

    public static Drawable original(Drawable background) {
        return background instanceof Card ? ((Card) background).base : background;
    }

    /** Keep the ambient drawable installed when the page is rethemed. */
    public static void themedColor(View view, int color) {
        if (view == null) return;
        Drawable previous = view.getBackground();
        if (previous instanceof Card) {
            Card card = (Card) previous;
            if (card.base instanceof ColorDrawable) {
                ((ColorDrawable) card.base).setColor(color);
            } else {
                card.base = new ColorDrawable(color);
                card.setDrawable(0, card.base);
            }
            card.invalidateSelf();
        } else {
            view.setBackgroundColor(color);
        }
    }

    public static boolean update(Object layer, View target, View decor, boolean right) {
        try {
            if (glowField == null) {
                Field glow = field(layer.getClass(), "glow");
                Class<?> type = glow.getType();
                colorsField = field(type, "colors");
                videoField = field(type, "video");
                alphaField = field(type, "alpha");
                spreadField = field(type, "spread");
                sidesField = field(type, "sides");
                glowField = glow;
            }
            Object glow = glowField.get(layer);
            Panel panel = PANELS.get(layer);
            if (panel == null) {
                panel = new Panel();
                PANELS.put(layer, panel);
            }
            ViewGroup pager = panel.pager.get();
            if (pager == null || !pager.isAttachedToWindow()) {
                pager = findPager(decor);
                panel.bind(pager);
            }
            Rect picture = (Rect) videoField.get(glow);
            if (pager == null || !pager.isShown() || picture.isEmpty()) {
                clear(layer);
                return false;
            }
            target.getLocationOnScreen(panel.position);
            panel.picture.set(picture);
            panel.picture.offset(panel.position[0], panel.position[1]);
            pager.getLocationOnScreen(panel.position);
            // A narrow portrait video can also satisfy the player's split
            // width heuristic. The pager must overlap the video vertically
            // before using the right edge.
            right = right && panel.position[1] < panel.picture.bottom;
            int sides = sidesField.getInt(glow);
            int spread = spreadField.getInt(glow);
            int alpha = alphaField.getInt(glow);
            if ((sides & (right ? 8 : 2)) == 0 || spread <= 0 || alpha <= 0) {
                clear(layer);
                return false;
            }
            if (PreferenceManager.getDefaultSharedPreferences(pager.getContext())
                    .getBoolean("nicoid_ambient_full_spread", false)) {
                int reach = right ? panel.position[0] + pager.getWidth() - panel.picture.right
                        : panel.position[1] + pager.getHeight() - panel.picture.bottom;
                if (reach > 0) spread = Math.max(spread, Math.round(reach * 1.30f));
            }
            if (panel.configure((int[]) colorsField.get(glow), right, spread, alpha)) {
                panel.invalidateCards();
            }
            return true;
        } catch (ReflectiveOperationException failure) {
            clear(layer);
            android.util.Log.w("nicoid-ambient", "Unable to read player glare geometry", failure);
            return false;
        }
    }

    private static Field field(Class<?> owner, String name) throws NoSuchFieldException {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    public static void clear(Object layer) {
        Panel panel = PANELS.remove(layer);
        if (panel == null) return;
        panel.unbind();
    }

    private static ViewGroup findPager(View view) {
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        if ("com.sauzask.nicoid.NicoidViewPager".equals(view.getClass().getName())) return group;
        for (int i = 0; i < group.getChildCount(); i++) {
            ViewGroup found = findPager(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static void restore(View view, Card card) {
        if (view != null && view.getBackground() == card) setBackground(view, card.base);
    }

    private static void setBackground(View view, Drawable value) {
        int left = view.getPaddingLeft(), top = view.getPaddingTop();
        int right = view.getPaddingRight(), bottom = view.getPaddingBottom();
        view.setBackground(value);
        view.setPadding(left, top, right, bottom);
    }

    private static boolean hasPageGlow(Drawable background) {
        if (background == null) return false;
        if (GLOW.equals(background.getClass().getName())) return true;
        if (!(background instanceof LayerDrawable)) return false;
        LayerDrawable layers = (LayerDrawable) background;
        for (int i = 0; i < layers.getNumberOfLayers(); i++) {
            if (hasPageGlow(layers.getDrawable(i))) return true;
        }
        return false;
    }

    private static final class Panel {
        final Map<View, Card> cards = new WeakHashMap<>();
        final Rect picture = new Rect(), visible = new Rect();
        final Paint paint = new Paint();
        final int[] position = new int[2], palette = new int[4];
        WeakReference<ViewGroup> pager = new WeakReference<>(null);
        WeakReference<ViewTreeObserver> observer = new WeakReference<>(null);
        boolean dirty;
        final ViewTreeObserver.OnScrollChangedListener scroll = () -> dirty = true;
        final ViewTreeObserver.OnGlobalLayoutListener layout = () -> dirty = true;
        final ViewTreeObserver.OnPreDrawListener preDraw = this::beforeDraw;
        int x, y, endX, endY, sampledAlpha;
        boolean rightEdge, configured;

        void bind(ViewGroup next) {
            unbind();
            pager = new WeakReference<>(next);
            if (next == null) return;
            ViewTreeObserver tree = next.getViewTreeObserver();
            observer = new WeakReference<>(tree);
            tree.addOnScrollChangedListener(scroll);
            tree.addOnGlobalLayoutListener(layout);
            tree.addOnPreDrawListener(preDraw);
            dirty = true;
            next.invalidate();
        }

        void unbind() {
            ViewTreeObserver tree = observer.get();
            if (tree != null && tree.isAlive()) {
                tree.removeOnScrollChangedListener(scroll);
                tree.removeOnGlobalLayoutListener(layout);
                tree.removeOnPreDrawListener(preDraw);
            }
            for (Map.Entry<View, Card> entry : cards.entrySet()) restore(entry.getKey(), entry.getValue());
            cards.clear();
            observer.clear();
            pager.clear();
        }

        boolean beforeDraw() {
            ViewGroup group = pager.get();
            if (group == null) return true;
            // A cached display list can retain a Card drawn at the old
            // pager offset. Recheck on actual layout/scroll and when any
            // visible background was replaced by the host.
            if (!dirty && !hasStaleCard()) return true;
            dirty = false;
            for (int i = 0; i < group.getChildCount(); i++) {
                View page = group.getChildAt(i);
                if (!page.getGlobalVisibleRect(visible)) continue;
                View actions = find(page, "videomenulist");
                View form = find(page, "commentediterlay");
                // Always own the menu's page background, including a
                // transparent base. Its gaps and rows share one light origin.
                scan(page, actions, form, actions != null || form != null, actions != null);
            }
            invalidateCards();
            return true;
        }

        private boolean hasStaleCard() {
            for (Map.Entry<View, Card> entry : cards.entrySet()) {
                View view = entry.getKey();
                if (view != null && view.isShown() && view.getGlobalVisibleRect(visible)
                        && view.getBackground() != entry.getValue())
                    return true;
            }
            return false;
        }

        private View find(View root, String name) {
            int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
            return id != 0 ? root.findViewById(id) : null;
        }

        private boolean inside(View view, ViewGroup group) {
            for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
                if (parent == group) return true;
            }
            return false;
        }

        boolean configure(int[] colors, boolean right, int spread, int alpha) {
            int left = right ? picture.right : picture.left;
            int top = right ? picture.top : picture.bottom;
            int endRight = right ? left + spread : picture.right;
            int endBottom = right ? picture.bottom : top + spread;
            int opacity = Math.min(180, alpha);
            int start = right ? 12 : 4;
            boolean shaderChanged = !configured || rightEdge != right || x != left || y != top
                    || endX != endRight || endY != endBottom;
            for (int i = 0; i < palette.length; i++) {
                int color = 0xff000000 | colors[start + i];
                shaderChanged |= palette[i] != color;
                palette[i] = color;
            }
            if (!shaderChanged && sampledAlpha == opacity) return false;
            x = left;
            y = top;
            endX = endRight;
            endY = endBottom;
            rightEdge = right;
            configured = true;
            if (shaderChanged) {
                Shader hue = new LinearGradient(x, y, right ? x : endX, right ? endY : y,
                        palette, null, Shader.TileMode.CLAMP);
                Shader fade = new LinearGradient(x, y, right ? endX : x, right ? y : endY,
                        OPACITY, FADE, Shader.TileMode.CLAMP);
                paint.setShader(new ComposeShader(hue, fade, PorterDuff.Mode.DST_IN));
            }
            sampledAlpha = opacity;
            paint.setAlpha(opacity);
            return true;
        }

        void invalidateCards() {
            ViewGroup group = pager.get();
            if (group == null) return;
            for (Iterator<Map.Entry<View, Card>> it = cards.entrySet().iterator(); it.hasNext();) {
                Map.Entry<View, Card> entry = it.next();
                View view = entry.getKey();
                Card card = entry.getValue();
                if (view == null || view.getBackground() != card || !inside(view, group)) {
                    restore(view, card);
                    it.remove();
                } else if (view.getGlobalVisibleRect(visible)) {
                    card.invalidateSelf();
                }
            }
        }

        void scan(View view, View actions, View form, boolean menu, boolean actionRow) {
            if (!view.isShown() || view.getWidth() <= 0 || view.getHeight() <= 0
                    || view instanceof SurfaceView || view instanceof TextureView || view instanceof WebView) return;
            Drawable base = view.getBackground();
            boolean control = menu && (actionRow || view instanceof Button || view instanceof EditText);
            if (!(base instanceof Card) && (base != null || control) && !hasPageGlow(base)) {
                Card card = new Card(view, this, base, control);
                setBackground(view, card);
                // View clears the previous drawable callback when replacing
                // its background, after LayerDrawable adopted that drawable.
                if (base != null) base.setCallback(card);
                cards.put(view, card);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                boolean rows = view == actions || view == form || view instanceof AdapterView;
                for (int i = 0; i < group.getChildCount(); i++) {
                    scan(group.getChildAt(i), actions, form, menu, rows);
                }
            }
        }

        boolean locateLight(Canvas canvas, int[] position, Rect bounds) {
            if (!configured) return false;
            int left = Math.max(bounds.left, x - position[0]);
            int top = Math.max(bounds.top, y - position[1]);
            int right = Math.min(bounds.right, endX - position[0]);
            int bottom = Math.min(bounds.bottom, endY - position[1]);
            return left < right && top < bottom
                    && !canvas.quickReject(left, top, right, bottom, Canvas.EdgeType.AA);
        }

        void paintLight(Canvas canvas, int[] position, Rect bounds) {
            int saved = canvas.save();
            canvas.clipRect(bounds);
            canvas.translate(-position[0], -position[1]);
            canvas.drawRect(x, y, endX, endY, paint);
            canvas.restoreToCount(saved);
        }
    }

    private static final class Card extends LayerDrawable {
        Drawable base;
        final WeakReference<View> view;
        final Panel panel;
        final boolean control;
        final int[] position = new int[2];

        Card(View view, Panel panel, Drawable base, boolean control) {
            super(new Drawable[]{base == null ? new ColorDrawable(0) : base});
            this.base = base;
            this.view = new WeakReference<>(view);
            this.panel = panel;
            this.control = control;
        }

        @Override public void getOutline(Outline outline) {
            if (base == null) super.getOutline(outline);
            else base.getOutline(outline);
        }

        @Override public void draw(Canvas canvas) {
            View owner = view.get();
            Rect bounds = getBounds();
            if (owner != null) owner.getLocationOnScreen(position);
            if (owner == null || bounds.isEmpty() || !panel.locateLight(canvas, position, bounds)) {
                super.draw(canvas);
                return;
            }
            if (base == null) {
                panel.paintLight(canvas, position, bounds);
                return;
            }
            // Isolate the original drawable so the blends cannot modify the page behind it.
            int surface = canvas.saveLayer(bounds.left, bounds.top, bounds.right, bounds.bottom, null);
            super.draw(canvas);
            try {
                panel.paint.setXfermode(MASK);
                panel.paintLight(canvas, position, bounds);
                if (control) {
                    panel.paint.setXfermode(BEHIND);
                    panel.paintLight(canvas, position, bounds);
                }
            } finally {
                panel.paint.setXfermode(null);
                canvas.restoreToCount(surface);
            }
        }
    }
}
