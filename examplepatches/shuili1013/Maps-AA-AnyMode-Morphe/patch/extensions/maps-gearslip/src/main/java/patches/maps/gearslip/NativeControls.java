package patches.maps.gearslip;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/** Native action handlers and icons exported as CAL data; this class never places host controls. */
final class NativeControls implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnPreDrawListener {
    enum Role {
        SEARCH("Search", "Zoeken", false, "main_suggested_destinations_search_box", "destination_input_search_box", "car_search_box"),
        SETTINGS("Settings", "Instellingen", false, "map_buttons_view_settings_button", "one_bar_settings_button_view"),
        SOUND("Sound", "Geluid", false, "map_buttons_view_mute_container"),
        VOICE("Voice search", "Spraakgestuurd zoeken", false, "car_mic_button"),
        REPORT("Report incident", "Incident melden", false, "map_buttons_view_report_incident_button"),
        CHARGING("Charging filters", "Laadfilters", false, "map_buttons_view_evcs_layer_map_filters_screen_container"),
        RECENTER("Recenter", "Opnieuw centreren", true, "recenter_button_container"),
        ZOOM_IN("Zoom in", "Inzoomen", true, "map_buttons_view_zoom_in"),
        ZOOM_OUT("Zoom out", "Uitzoomen", true, "map_buttons_view_zoom_out"),
        COMPASS("Compass", "Kompas", true, "map_buttons_view_compass", "map_buttons_view_compass_container");
        final String english, dutch; final boolean map; final String[] names;
        Role(String english, String dutch, boolean map, String... names) {
            this.english = english; this.dutch = dutch; this.map = map; this.names = names;
        }
    }
    static final class Control {
        final Role role; final View source;
        String title; Bitmap icon; int stamp; boolean available;
        Control(Role role, View source) { this.role = role; this.source = source; }
    }
    private final ViewGroup root;
    private final Runnable changed;
    private final Map<Role, Control> controls = new EnumMap<>(Role.class);
    private final Map<View, Integer> hidden = new IdentityHashMap<>();
    private boolean closed, focusSearch;

    NativeControls(ViewGroup root, Runnable changed) {
        this.root = root; this.changed = changed;
        root.getViewTreeObserver().addOnGlobalLayoutListener(this);
        root.getViewTreeObserver().addOnPreDrawListener(this);
        onGlobalLayout();
    }
    boolean owns(View view) { return view == root; }
    List<Control> snapshot() {
        List<Control> result = new ArrayList<>();
        for (Control control : controls.values()) if (control.available) result.add(control);
        return Collections.unmodifiableList(result);
    }
    String moreTitle() {
        return "nl".equals(root.getResources().getConfiguration().getLocales().get(0).getLanguage()) ? "Meer bediening" : "More controls";
    }
    @Override public void onGlobalLayout() {
        if (closed) return;
        Map<Role, View> found = new EnumMap<>(Role.class);
        collect(root, found);
        boolean updated = false;
        for (Role role : Role.values()) {
            View source = found.get(role); Control old = controls.get(role);
            if (source == null) { if (old != null) { controls.remove(role); updated = true; } }
            else if (old == null || old.source != source) { controls.put(role, new Control(role, source)); updated = true; }
        }
        updated |= update();
        hideExportedControls();
        focusNativeEditor();
        if (updated) changed.run();
    }
    @Override public boolean onPreDraw() {
        if (!closed) {
            boolean updated = update(); hideExportedControls(); focusNativeEditor();
            if (updated) changed.run();
        }
        return true;
    }
    private void collect(View view, Map<Role, View> found) {
        String name = name(view);
        if (name != null && nativeVisibility(view) != View.GONE) for (Role role : Role.values()) {
            boolean matches = false;
            for (String candidate : role.names) if (candidate.equals(name)) { matches = true; break; }
            if (!matches) continue;
            View source = clickable(view), previous = found.get(role);
            if (source != null && (previous == null || (!nativeShown(previous) && nativeShown(source)))) found.put(role, source);
        }
        // Native destination panels are layered above the map's older controls.
        // Prefer the frontmost matching owner when both remain in the tree.
        if (view instanceof ViewGroup) for (int i = ((ViewGroup) view).getChildCount() - 1; i >= 0; i--) collect(((ViewGroup) view).getChildAt(i), found);
    }
    private View clickable(View view) {
        if (nativeVisibility(view) == View.GONE) return null;
        // A named container can own its ripple/touch action while its children
        // expose other actions (profile, clear or collapse). Preserve that owner.
        if (view.hasOnClickListeners() || view.isClickable()) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View child = ((ViewGroup) view).getChildAt(i);
            if (nativeVisibility(child) != View.VISIBLE) continue;
            View found = clickable(child); if (found != null) return found;
        }
        return null;
    }
    private boolean update() {
        boolean updated = false;
        for (Control control : controls.values()) {
            boolean available = enabled(control.source) && nativeVisibility(control.source) == View.VISIBLE;
            String title = title(control);
            Drawable drawable = drawable(control.source);
            int stamp = drawable == null ? control.source.getWidth() * 31 + control.source.getHeight()
                    : System.identityHashCode(drawable) * 31 + Arrays.hashCode(drawable.getState()) + drawable.getLevel();
            if (control.icon == null || control.stamp != stamp) {
                Bitmap icon = icon(control.source, drawable);
                if (icon != null) { control.icon = icon; control.stamp = stamp; updated = true; }
            }
            available &= control.icon != null;
            if (available != control.available || !title.equals(control.title)) updated = true;
            control.title = title; control.available = available;
        }
        return updated;
    }
    private String title(Control control) {
        CharSequence description = control.role == Role.COMPASS ? null : control.source.getContentDescription();
        if (description != null && !description.toString().trim().isEmpty()) return description.toString();
        boolean dutch = "nl".equals(root.getResources().getConfiguration().getLocales().get(0).getLanguage());
        return dutch ? control.role.dutch : control.role.english;
    }
    private void hideExportedControls() {
        for (Control control : controls.values()) {
            if (!control.available) continue;
            View cover = control.source;
            for (View node = control.source; node != null && node != root; node = parent(node)) {
                if ("map_buttons_view_container".equals(name(node))) { cover = node; break; }
            }
            if (control.role == Role.SEARCH && parent(cover) != null && parent(cover).getClass().getName().endsWith(".CardView")) cover = parent(cover);
            View editor = find(cover, "destination_input_keyboard_search_edit_text");
            if (editor != null) {
                // Re-hiding an active editor's ancestor would clear native focus
                // before its asynchronous input-connection/IME work completes.
                // Return only adapter-owned visibility to the native editor.
                for (View restored : reveal(editor)) hidden.remove(restored);
                continue;
            }
            if (cover.getVisibility() == View.VISIBLE) {
                hidden.put(cover, View.VISIBLE); cover.setVisibility(View.INVISIBLE);
            }
        }
    }
    private int nativeVisibility(View view) {
        Integer previous = hidden.get(view);
        return previous != null && view.getVisibility() == View.INVISIBLE ? previous : view.getVisibility();
    }
    private boolean nativeShown(View view) {
        for (View node = view; node != null; node = parent(node)) if (nativeVisibility(node) != View.VISIBLE) return false;
        return true;
    }
    private boolean enabled(View view) {
        for (View node = view; node != null; node = parent(node)) {
            if (!node.isEnabled()) return false;
            if (node == root) return true;
        }
        return false;
    }
    void invoke(Control control) {
        if (closed || controls.get(control.role) != control || !control.available || !enabled(control.source) || nativeVisibility(control.source) != View.VISIBLE)
            throw new SecurityException("Maps action was retired");
        List<View> restored = reveal(control.source);
        try {
            if (control.role == Role.SEARCH) focusSearch = true;
            if (!control.source.performClick()) touch(control.source);
        } finally {
            // Both changes occur in one main-thread callback, before any frame is drawn.
            conceal(restored);
        }
    }
    private void focusNativeEditor() {
        if (!focusSearch) return;
        View editor = find(root, "destination_input_keyboard_search_edit_text");
        if (editor != null && editor.isAttachedToWindow() && enabled(editor)) {
            focusSearch = false;
            List<View> restored = reveal(editor);
            try { editor.performClick(); }
            finally { conceal(restored); }
        }
    }
    private List<View> reveal(View source) {
        List<View> restored = new ArrayList<>();
        for (View node = source; node != null; node = parent(node)) if (hidden.containsKey(node) && node.getVisibility() == View.INVISIBLE) {
            node.setVisibility(View.VISIBLE); restored.add(node);
        }
        return restored;
    }
    private void conceal(List<View> restored) {
        for (View view : restored) if (view.getVisibility() == View.VISIBLE) {
            if (find(view, "destination_input_keyboard_search_edit_text") != null) hidden.remove(view);
            else view.setVisibility(View.INVISIBLE);
        }
    }
    private static void touch(View view) {
        if (view.getWidth() <= 0 || view.getHeight() <= 0) throw new SecurityException("Maps action is not ready");
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, view.getWidth() / 2f, view.getHeight() / 2f, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 1, MotionEvent.ACTION_UP, view.getWidth() / 2f, view.getHeight() / 2f, 0);
        down.setSource(0x1002); up.setSource(0x1002);
        try { view.dispatchTouchEvent(down); view.dispatchTouchEvent(up); }
        finally { down.recycle(); up.recycle(); }
    }
    private static View parent(View view) { ViewParent parent = view.getParent(); return parent instanceof View ? (View) parent : null; }
    private static String name(View view) {
        if ((view.getId() >>> 24) == 0 || view.getId() == View.NO_ID) return null;
        try { return view.getResources().getResourceEntryName(view.getId()); }
        catch (android.content.res.Resources.NotFoundException missing) { return null; }
    }
    private View find(View view, String name) {
        if (name.equals(name(view)) && nativeShown(view)) return view;
        if (view instanceof ViewGroup) for (int i = ((ViewGroup) view).getChildCount() - 1; i >= 0; i--) {
            View found = find(((ViewGroup) view).getChildAt(i), name); if (found != null) return found;
        }
        return null;
    }
    private static Drawable drawable(View view) {
        if (view instanceof ImageView && ((ImageView) view).getDrawable() != null) return ((ImageView) view).getDrawable();
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            Drawable found = drawable(((ViewGroup) view).getChildAt(i)); if (found != null) return found;
        }
        return null;
    }
    private static Bitmap icon(View view, Drawable drawable) {
        if (drawable == null && (view.getWidth() <= 0 || view.getHeight() <= 0)) return null;
        Bitmap bitmap = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888);
        bitmap.setDensity(Bitmap.DENSITY_NONE);
        Canvas canvas = new Canvas(bitmap);
        if (drawable != null) {
            Rect previous = new Rect(drawable.getBounds());
            try { drawable.setBounds(0, 0, 48, 48); drawable.draw(canvas); }
            finally { drawable.setBounds(previous); }
        } else {
            canvas.scale(48f / view.getWidth(), 48f / view.getHeight()); view.draw(canvas);
        }
        return bitmap;
    }
    static Bitmap moreIcon() {
        Bitmap bitmap = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888);
        bitmap.setDensity(Bitmap.DENSITY_NONE);
        Canvas canvas = new Canvas(bitmap); Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG); paint.setColor(Color.BLACK);
        for (int x : new int[]{10, 24, 38}) canvas.drawCircle(x, 24, 3, paint);
        return bitmap;
    }
    void close() {
        if (closed) return; closed = true;
        if (root.getViewTreeObserver().isAlive()) {
            root.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            root.getViewTreeObserver().removeOnPreDrawListener(this);
        }
        for (Map.Entry<View, Integer> entry : hidden.entrySet()) if (entry.getKey().getVisibility() == View.INVISIBLE) entry.getKey().setVisibility(entry.getValue());
        controls.clear(); hidden.clear(); focusSearch = false;
    }
}
