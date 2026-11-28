package app.southstar21.extension.instagram.liquidglass;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Gives Instagram's bottom sheets (comments, the share sheet, a post's menu and the other menus that slide
 * up) a Liquid Glass look: the sheet is frosted glass with the page behind it, the reel playing under a share
 * sheet for one, blurred inside it ({@link SheetGlass}), while the page outside the sheet stays sharp under a
 * dimmer lightened to {@link #DIMMER_KEPT} of Instagram's, so the reel still shows. Inside the sheet, text boxes
 * (Search, Write a message) become glass pills, every profile picture wears a glass ring, and a Send button
 * turns glossy purple glass.
 *
 * <p>Instagram puts every bottom sheet in one holder over the screens ({@link #HOLDER}). On each layout of the
 * window the holder's sheets are looked at: the first wide view with a background, a few levels in, is the
 * sheet's surface and wears the glass, and wide views under it painted one solid color are cleared so the glass
 * shows through. Before each frame while a sheet is up the glass records what's behind it again, and the dimmer,
 * which Instagram fades by its alpha with no layout, is lightened again. Each view's own background, foreground,
 * text color and alpha are kept and given back when the sheet closes, when the switch goes off, or when anything
 * goes wrong. Nothing in Instagram's code changes.
 */
final class GlassSheets implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
    private static final String TAG = "GlassSheets";
    private static final String PACKAGE = "com.instagram.android";
    /** Where Instagram puts a bottom sheet over the screens. */
    static final String HOLDER = "layout_container_bottom_sheet";
    /** The dimmed backdrop Instagram lays behind a sheet in the holder. */
    static final String DIMMER = "background_dimmer";

    /** How many levels into a sheet its surface and solid layers are looked for. */
    private static final int DEPTH = 4;
    /** How deep into a sheet its boxes, pictures and Send button are looked for. */
    private static final int CONTENT_DEPTH = 24;
    /** A view this share of the holder's width or wider is part of the sheet's surface, not a row in it. */
    private static final float WIDE = 0.9f;
    /** The share of Instagram's dimmer that's kept, so the page behind the sheet still shows. */
    static final float DIMMER_KEPT = 0.3f;
    /** A profile picture's size, in dp, to wear a ring. */
    private static final float PICTURE_MIN_DP = 40f, PICTURE_MAX_DP = 110f;
    /** A box's background, or a button's click, is looked for this many parents up. */
    private static final int REACH = 2;
    /** Words a Send button carries, compared in lower case. */
    private static final String[] SEND = {"send", "send separately", "அனுப்பு"};

    private static final Map<Activity, GlassSheets> WATCHING = new WeakHashMap<>();

    private final WeakReference<Activity> activity;
    private final int holderId, dimmerId;
    private final float density;
    /** Each view this changed the background of, with the background it had. */
    private final WeakHashMap<View, Drawable> before = new WeakHashMap<>();
    /** What this put on each view, to tell when Instagram has put another background on. */
    private final WeakHashMap<View, Drawable> worn = new WeakHashMap<>();
    /** The sheets' glass, refreshed before each frame. */
    private final WeakHashMap<View, SheetGlass> glasses = new WeakHashMap<>();
    /** Each picture given a ring, with the foreground it had. */
    private final WeakHashMap<View, Drawable> ringed = new WeakHashMap<>();
    /** Each Send text made white, with the colors it had. */
    private final WeakHashMap<TextView, ColorStateList> sendTexts = new WeakHashMap<>();
    /** The dimmer, with the alpha this last set on it. */
    private final WeakHashMap<View, Float> dimmed = new WeakHashMap<>();
    private WeakReference<View> dimmer = new WeakReference<>(null);
    private WeakReference<ViewGroup> holder = new WeakReference<>(null);

    GlassSheets(Activity activity) {
        this.activity = new WeakReference<>(activity);
        holderId = activity.getResources().getIdentifier(HOLDER, "id", PACKAGE);
        dimmerId = activity.getResources().getIdentifier(DIMMER, "id", PACKAGE);
        density = activity.getResources().getDisplayMetrics().density;
    }

    /** Whether the switch is on: the Liquid Glass bar is in use and Glass sheets is on. */
    static boolean on() {
        try {
            return LiquidGlassNavBarPatch.isActive() && LiquidGlassNavBarPatch.GLASS_SHEETS.get();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Starts watching [activity]'s window for sheets, once. Never throws. */
    static void watch(Activity activity) {
        try {
            if (activity == null || WATCHING.containsKey(activity)) return;
            GlassSheets sheets = new GlassSheets(activity);
            if (sheets.holderId == 0) return;
            WATCHING.put(activity, sheets);
            ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
            observer.addOnGlobalLayoutListener(sheets);
            observer.addOnPreDrawListener(sheets);
        } catch (Throwable t) {
            Log.e(TAG, "Could not watch for sheets", t);
        }
    }

    /** Stops watching [activity] and gives everything back. Never throws. */
    static void forget(Activity activity) {
        try {
            GlassSheets sheets = WATCHING.remove(activity);
            if (sheets == null) return;
            sheets.restoreAll();
            ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
            observer.removeOnGlobalLayoutListener(sheets);
            observer.removeOnPreDrawListener(sheets);
        } catch (Throwable t) {
            Log.e(TAG, "Could not stop watching for sheets", t);
        }
    }

    @Override
    public boolean onPreDraw() {
        try {
            if (glasses.isEmpty()) return true;
            View shade = dimmer.get();
            if (shade != null && shade.isAttachedToWindow()) lighten(shade);
            for (SheetGlass glass : new ArrayList<>(glasses.values())) {
                if (glass != null) glass.refresh();
            }
        } catch (Throwable t) {
            Log.e(TAG, "Sheet glass failed to refresh", t);
        }
        return true;
    }

    @Override
    public void onGlobalLayout() {
        try {
            Activity owner = activity.get();
            if (owner == null) return;
            if (!on()) {
                restoreAll();
                return;
            }
            ViewGroup sheets = holder(owner);
            boolean up = false;
            if (sheets != null) {
                boolean appDark = (sheets.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                        == Configuration.UI_MODE_NIGHT_YES;
                for (int i = 0; i < sheets.getChildCount(); i++) {
                    View sheet = sheets.getChildAt(i);
                    if (sheet.getId() == dimmerId) {
                        dimmer = new WeakReference<>(sheet);
                        continue;
                    }
                    if (sheet.getVisibility() != View.VISIBLE) continue;
                    View surface = surface(sheet, sheets.getWidth());
                    if (surface == null) continue;
                    up = true;
                    wear(surface, sheets, sheetDark(surface, sheets.getWidth(), appDark));
                    clearSolids(surface, surface.getWidth(), DEPTH);
                    dressContent(surface, 0);
                }
            }
            // Views of sheets no longer up get back what they had.
            for (View view : new ArrayList<>(before.keySet())) {
                if (view != null && !view.isAttachedToWindow()) restoreBackground(view);
            }
            for (View view : new ArrayList<>(ringed.keySet())) {
                if (view != null && !view.isAttachedToWindow()) ringed.remove(view);
            }
            for (View view : new ArrayList<>(glasses.keySet())) {
                if (view == null || !view.isAttachedToWindow()) glasses.remove(view);
            }
            if (!up) undim();
        } catch (Throwable t) {
            Log.e(TAG, "Glass sheets failed, giving the sheets back", t);
            restoreAll();
        }
    }

    private ViewGroup holder(Activity owner) {
        ViewGroup known = holder.get();
        if (known != null && known.isAttachedToWindow()) return known;
        View found = owner.getWindow().getDecorView().findViewById(holderId);
        ViewGroup group = found instanceof ViewGroup ? (ViewGroup) found : null;
        holder = new WeakReference<>(group);
        return group;
    }

    // ------------------------------------------------------------------ the sheet

    /** The sheet's surface: [sheet] or the first view under it, a few levels in, that is wide and has a background. */
    private View surface(View sheet, int holderWidth) {
        if (holderWidth <= 0) return null;
        List<View> level = new ArrayList<>();
        level.add(sheet);
        for (int depth = 0; depth < DEPTH && !level.isEmpty(); depth++) {
            List<View> next = new ArrayList<>();
            for (View view : level) {
                if (view.getVisibility() != View.VISIBLE) continue;
                boolean wide = view.getWidth() >= holderWidth * WIDE;
                if (wide && (view.getBackground() != null || glasses.containsKey(view))) return view;
                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) next.add(group.getChildAt(i));
                }
            }
            level = next;
        }
        return null;
    }

    /**
     * Whether the sheet [surface] belongs to is a dark one. Instagram themes a sheet on its own: in Reels its
     * sheets are dark with white text whatever the app's light or dark mode is, so the app's mode put light glass
     * under white text there. The sheet's own solid color decides first, the one Instagram painted on the surface
     * or a wide layer under it (kept in {@link #before} once the glass replaced it), then its text: mostly light
     * text is a dark sheet. Only a sheet with neither falls back to [appDark].
     */
    boolean sheetDark(View surface, int holderWidth, boolean appDark) {
        Integer color = solidColor(surface, holderWidth, DEPTH);
        if (color != null) return luminance(color) < 0.4f;
        int[] counts = new int[2];
        countText(surface, 0, counts);
        if (counts[0] + counts[1] > 0 && counts[0] != counts[1]) return counts[0] > counts[1];
        return appDark;
    }

    /** The opaque color Instagram painted [view] or a wide view under it, as it was before the glass, or null. */
    private Integer solidColor(View view, int holderWidth, int depth) {
        Drawable original = before.containsKey(view) ? before.get(view) : view.getBackground();
        Integer color = opaqueColor(original);
        if (color != null) return color;
        if (depth <= 0 || !(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE || child.getWidth() < holderWidth * WIDE) continue;
            Integer found = solidColor(child, holderWidth, depth - 1);
            if (found != null) return found;
        }
        return null;
    }

    /** The color of a plain or shape background painted all but opaque, or null. */
    private static Integer opaqueColor(Drawable drawable) {
        if (drawable instanceof ColorDrawable) {
            int color = ((ColorDrawable) drawable).getColor();
            return android.graphics.Color.alpha(color) >= 0xF0 ? color : null;
        }
        if (drawable instanceof android.graphics.drawable.GradientDrawable) {
            ColorStateList list = ((android.graphics.drawable.GradientDrawable) drawable).getColor();
            if (list == null) return null;
            int color = list.getDefaultColor();
            return android.graphics.Color.alpha(color) >= 0xF0 ? color : null;
        }
        return null;
    }

    /** Counts the light ([0]) and dark ([1]) text under [view], leaving out text boxes and the Send button. */
    private void countText(View view, int depth, int[] counts) {
        if (depth > CONTENT_DEPTH || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof EditText) return;
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            if (sendTexts.containsKey(text) || text.length() == 0) return;
            float light = luminance(text.getCurrentTextColor());
            if (light > 0.6f) counts[0]++;
            else if (light < 0.4f) counts[1]++;
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) countText(group.getChildAt(i), depth + 1, counts);
    }

    private static float luminance(int color) {
        return (0.2126f * android.graphics.Color.red(color) + 0.7152f * android.graphics.Color.green(color)
                + 0.0722f * android.graphics.Color.blue(color)) / 255f;
    }

    /** Puts the sheet's glass on [surface], keeping its own background, unless it already wears it. */
    private void wear(View surface, ViewGroup sheets, boolean dark) {
        SheetGlass glass = glasses.get(surface);
        if (glass == null) {
            glass = new SheetGlass(surface, sheets, dark, density);
            glasses.put(surface, glass);
        } else if (glass.dark != dark) {
            glass.dark = dark;
            glass.invalidateSelf();
        }
        put(surface, glass);
    }

    /** Sets [drawable] as [view]'s background, keeping the background Instagram gave it last. */
    private void put(View view, Drawable drawable) {
        Drawable now = view.getBackground();
        if (now == drawable) return;
        before.put(view, now);
        worn.put(view, drawable);
        view.setBackground(drawable);
    }

    /** Clears wide views under [view] painted one opaque color, so the glass shows through them. */
    private void clearSolids(View view, int width, int depth) {
        if (depth <= 0 || !(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            Drawable background = child.getBackground();
            if (background instanceof ColorDrawable && ((ColorDrawable) background).getAlpha() == 255
                    && child.getWidth() >= width * WIDE) {
                if (!before.containsKey(child)) before.put(child, background);
                worn.remove(child);
                child.setBackground(null);
            }
            clearSolids(child, width, depth - 1);
        }
    }

    /**
     * Lightens Instagram's dimmer to {@link #DIMMER_KEPT} of the alpha Instagram has set on it now. Instagram fades
     * it in and out by its alpha, so an alpha this didn't set is Instagram's and is scaled again.
     */
    private void lighten(View shade) {
        Float ours = dimmed.get(shade);
        float alpha = shade.getAlpha();
        if (ours != null && Math.abs(alpha - ours) < 0.005f) return;
        float want = alpha * DIMMER_KEPT;
        shade.setAlpha(want);
        dimmed.put(shade, want);
    }

    /** Gives the dimmer back the alpha Instagram had set, where it still has this one's. */
    private void undim() {
        for (Map.Entry<View, Float> entry : new ArrayList<>(dimmed.entrySet())) {
            View shade = entry.getKey();
            Float ours = entry.getValue();
            if (shade != null && ours != null && Math.abs(shade.getAlpha() - ours) < 0.005f) {
                shade.setAlpha(Math.min(1f, ours / DIMMER_KEPT));
            }
        }
        dimmed.clear();
        dimmer = new WeakReference<>(null);
    }

    // ------------------------------------------------------------------ inside the sheet

    /** Glass pills for text boxes, rings for profile pictures and purple glass for a Send button, under [view]. */
    private void dressContent(View view, int depth) {
        if (depth > CONTENT_DEPTH || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof EditText) {
            pill((EditText) view);
            return;
        }
        if (view instanceof TextView) {
            sendButton((TextView) view);
            return;
        }
        if (looksLikePicture(view)) ring(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) dressContent(group.getChildAt(i), depth + 1);
    }

    /** A glass pill behind [field]: on the nearest box round it with a background, or on the field itself. */
    private void pill(EditText field) {
        View box = field;
        View at = field;
        for (int up = 0; up <= REACH && at != null; up++) {
            if (at.getBackground() != null) {
                box = at;
                break;
            }
            at = at.getParent() instanceof View ? (View) at.getParent() : null;
        }
        if (glasses.containsKey(box) || box.getBackground() instanceof GlassPill) return;
        put(box, new GlassPill(density, false));
    }

    /** Purple glass on the button [text] names, when it says Send. */
    private void sendButton(TextView text) {
        CharSequence words = text.getText();
        if (words == null || words.length() > 24) return;
        String said = words.toString().trim().toLowerCase(Locale.ROOT);
        boolean send = false;
        for (String word : SEND) send |= said.equals(word);
        if (!send) return;
        // The button is the text or the nearest clickable view round it, a few levels up.
        View button = text;
        View at = text;
        for (int up = 0; up <= REACH && at != null; up++) {
            if (at.isClickable()) {
                button = at;
                break;
            }
            at = at.getParent() instanceof View ? (View) at.getParent() : null;
        }
        if (glasses.containsKey(button)) return;
        if (!(button.getBackground() instanceof GlassPill)) put(button, new GlassPill(density, true));
        if (!sendTexts.containsKey(text)) sendTexts.put(text, text.getTextColors());
        if (text.getCurrentTextColor() != 0xffffffff) text.setTextColor(0xffffffff);
    }

    private boolean looksLikePicture(View view) {
        int width = view.getWidth(), height = view.getHeight();
        if (width < PICTURE_MIN_DP * density || width > PICTURE_MAX_DP * density) return false;
        if (Math.abs(width - height) > Math.max(2, Math.round(2 * density))) return false;
        return !holdsText(view);
    }

    private static boolean holdsText(View view) {
        if (view instanceof TextView) return true;
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (holdsText(group.getChildAt(i))) return true;
        }
        return false;
    }

    private void ring(View picture) {
        Drawable now = picture.getForeground();
        if (now instanceof Ring) return;
        // A picture inside one that wears a ring already is left alone, so a picture gets one ring.
        for (View at = parentOf(picture); at != null; at = parentOf(at)) {
            if (at.getForeground() instanceof Ring) return;
        }
        if (!ringed.containsKey(picture)) ringed.put(picture, now);
        picture.setForeground(new Ring(density));
    }

    private static View parentOf(View view) {
        return view.getParent() instanceof View ? (View) view.getParent() : null;
    }

    // ------------------------------------------------------------------ giving back

    private void restoreBackground(View view) {
        Drawable own = before.remove(view);
        Drawable ours = worn.remove(view);
        // Only what still wears this change goes back; a background Instagram has set since stays.
        if (ours != null ? view.getBackground() == ours : view.getBackground() == null) view.setBackground(own);
        glasses.remove(view);
    }

    private void restoreAll() {
        for (View view : new ArrayList<>(before.keySet())) {
            if (view != null) restoreBackground(view);
        }
        for (Map.Entry<View, Drawable> entry : new ArrayList<>(ringed.entrySet())) {
            View picture = entry.getKey();
            if (picture != null && picture.getForeground() instanceof Ring) picture.setForeground(entry.getValue());
        }
        for (Map.Entry<TextView, ColorStateList> entry : new ArrayList<>(sendTexts.entrySet())) {
            if (entry.getKey() != null && entry.getValue() != null) entry.getKey().setTextColor(entry.getValue());
        }
        before.clear();
        worn.clear();
        glasses.clear();
        ringed.clear();
        sendTexts.clear();
        undim();
    }

    // ------------------------------------------------------------------ drawables

    /** A glass pill with fully round ends: frosted with a lit top edge, or glossy purple for Send. */
    static final class GlassPill extends Drawable {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint gloss = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private final boolean purple;
        private int shapedTop = Integer.MIN_VALUE, shapedHeight = -1;

        GlassPill(float density, boolean purple) {
            this.purple = purple;
            rim.setStyle(Paint.Style.STROKE);
            rim.setStrokeWidth(Math.max(1f, (purple ? 1.5f : 1f) * density));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            if (bounds.top != shapedTop || bounds.height() != shapedHeight) {
                shapedTop = bounds.top;
                shapedHeight = bounds.height();
                if (purple) {
                    fill.setShader(new LinearGradient(0, bounds.top, 0, bounds.bottom,
                            new int[]{0xff9b6bff, 0xff6d28d9, 0xff5b21b6}, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                    rim.setColor(0xa6ffffff);
                    gloss.setShader(new LinearGradient(0, bounds.top, 0, bounds.top + bounds.height() / 2f,
                            0x59ffffff, 0x00ffffff, Shader.TileMode.CLAMP));
                } else {
                    fill.setShader(new LinearGradient(0, bounds.top, 0, bounds.bottom,
                            0x33ffffff, 0x14ffffff, Shader.TileMode.CLAMP));
                    rim.setShader(new LinearGradient(0, bounds.top, 0, bounds.bottom,
                            0x99ffffff, 0x33ffffff, Shader.TileMode.CLAMP));
                }
            }
            float inset = rim.getStrokeWidth() / 2f;
            box.set(bounds.left + inset, bounds.top + inset, bounds.right - inset, bounds.bottom - inset);
            float radius = box.height() / 2f;
            canvas.drawRoundRect(box, radius, radius, fill);
            if (purple) {
                box.bottom = box.top + box.height() / 2f;
                canvas.drawRoundRect(box, radius, radius, gloss);
                box.bottom = bounds.bottom - inset;
            }
            canvas.drawRoundRect(box, radius, radius, rim);
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** A glass ring round a profile picture: a bright inner line and a faint wider halo. */
    static final class Ring extends Drawable {
        private final Paint inner = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint halo = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float innerWidth, haloWidth;

        Ring(float density) {
            innerWidth = Math.max(1.5f, 2.5f * density);
            haloWidth = Math.max(1f, 2.5f * density);
            inner.setStyle(Paint.Style.STROKE);
            inner.setStrokeWidth(innerWidth);
            inner.setColor(0xbfffffff);
            halo.setStyle(Paint.Style.STROKE);
            halo.setStrokeWidth(haloWidth);
            halo.setColor(0x24ffffff);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;
            float radius = Math.min(bounds.width(), bounds.height()) / 2f;
            float x = bounds.exactCenterX(), y = bounds.exactCenterY();
            canvas.drawCircle(x, y, radius - innerWidth / 2f, inner);
            canvas.drawCircle(x, y, radius - innerWidth - haloWidth / 2f, halo);
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
