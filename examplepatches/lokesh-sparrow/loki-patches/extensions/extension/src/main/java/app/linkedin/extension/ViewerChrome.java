package app.linkedin.extension;

import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Tap to hide in the video and document viewers, built from LinkedIn's own show/hide state.
 * <p>
 * Both viewers are a feed-update-screen-container. In the document viewer its top bar and bottom part already show
 * only while the "showControlsBinding" state is true, but nothing flips it, and the document keeps taps for zooming:
 * a single tap on the document, seen in the touch hook, now flips the state in LinkedIn's StateManager. In the video
 * viewer only the play button has such a state; the top bar and bottom part now follow it, so they show and hide
 * with the video's own controls.
 */
@SuppressWarnings("unused")
public final class ViewerChrome {
    private static final String CONTAINER = "feed-update-screen-container";
    private static final String VIDEO_SOURCE = ".setupDataAndViewer";

    private static final int VIEW_TRACKING_FIELD = 26;
    private static final int COMPACT_DATA_FIELD = 35;
    private static final int DISPLAYED_FIELD = 40;

    private ViewerChrome() {
    }

    // region Document viewer: tap to hide

    private static final String CONTROLS_STATE = "showControlsBinding";
    private static final String CONTROLS_NAMESPACE = "MemoryNamespace";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<Object> stateManagers = Collections.newSetFromMap(new WeakHashMap<>());

    private static float downX;
    private static float downY;
    private static long downTime;
    private static boolean multiTouch;
    private static boolean secondTap;
    private static Runnable pendingToggle;

    /** Injection point, at the end of StateManager's constructor: the store of the SDUI screens' states. */
    public static void onStateManager(Object stateManager) {
        synchronized (stateManagers) {
            stateManagers.add(stateManager);
        }
    }

    /**
     * Injection point, at the start of AndroidComposeView.dispatchTouchEvent. A single tap on the document (not a
     * swipe, long press or double tap to zoom) shows or hides its top bar and bottom part.
     */
    public static void onTouch(View view, MotionEvent event) {
        try {
            if (!Settings.viewerTapToHide() || !SduiMediaDownload.resumedScreen().endsWith(".DocumentViewer")) return;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getRawX();
                    downY = event.getRawY();
                    downTime = event.getEventTime();
                    multiTouch = false;
                    secondTap = pendingToggle != null;
                    if (secondTap) {
                        MAIN.removeCallbacks(pendingToggle);
                        pendingToggle = null;
                    }
                    break;
                case MotionEvent.ACTION_POINTER_DOWN:
                    multiTouch = true;
                    break;
                case MotionEvent.ACTION_UP:
                    if (multiTouch || secondTap) return;
                    if (event.getEventTime() - downTime > ViewConfiguration.getLongPressTimeout()) return;
                    int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                    if (Math.hypot(event.getRawX() - downX, event.getRawY() - downY) > slop) return;
                    if (controlsShown() && onControls(view, downX, downY)) return;
                    // Waits out a second tap, which zooms the document.
                    pendingToggle = () -> {
                        pendingToggle = null;
                        try {
                            setControlsShown(!controlsShown());
                        } catch (Throwable t) {
                            Diagnostics.error("viewer controls toggle failed", t);
                        }
                    };
                    MAIN.postDelayed(pendingToggle, ViewConfiguration.getDoubleTapTimeout());
                    break;
                default:
                    break;
            }
        } catch (Throwable t) {
            Diagnostics.error("viewer tap failed", t);
        }
    }

    /** Whether a tap is on the top bar, the bottom part or the reactions on the right, which have buttons. */
    private static boolean onControls(View view, float x, float y) {
        View root = view.getRootView();
        float density = view.getResources().getDisplayMetrics().density;
        int[] origin = new int[2];
        root.getLocationOnScreen(origin);
        float top = y - origin[1];
        float left = x - origin[0];
        if (top < 160 * density) return true;
        if (top > root.getHeight() - 240 * density) return true;
        return left > root.getWidth() - 72 * density && top > root.getHeight() * 0.45f;
    }

    private static boolean controlsShown() throws ReflectiveOperationException {
        for (Object manager : managers()) {
            for (Map.Entry<?, ?> entry : states(manager).entrySet()) {
                if (!isControlsKey(entry.getKey())) continue;
                Object update = field(entry.getValue(), "stateUpdate");
                if (update == null) continue;
                Object value = update.getClass().getMethod("getValue").invoke(update);
                return (Boolean) value.getClass().getMethod("getBooleanValue").invoke(value);
            }
        }
        // Not stored yet: the controls show at first.
        return true;
    }

    /** Sets the state the way LinkedIn's own SetState action does. */
    private static void setControlsShown(boolean shown) throws ReflectiveOperationException {
        int updated = 0;
        for (Object manager : managers()) {
            List<Object> keys = new ArrayList<>();
            for (Object key : states(manager).keySet()) if (isControlsKey(key)) keys.add(key);
            for (Object key : keys) update(manager, key, shown);
            if (!keys.isEmpty()) updated++;
        }
        if (updated == 0) {
            // Not stored yet: created in every store.
            for (Object manager : managers()) {
                Constructor<?> key = manager.getClass().getClassLoader()
                        .loadClass("com.linkedin.android.infra.sdui.state.StateKey")
                        .getConstructor(String.class, String.class, boolean.class);
                update(manager, key.newInstance(CONTROLS_STATE, CONTROLS_NAMESPACE, false), shown);
                updated++;
            }
        }
        Settings.debugLog("viewer tap to hide: document controls " + (shown ? "shown" : "hidden")
                + " in " + updated + " of " + managers().size() + " state stores");
    }

    private static void update(Object manager, Object key, boolean shown) throws ReflectiveOperationException {
        ClassLoader loader = manager.getClass().getClassLoader();
        Class<?> valueClass = loader.loadClass("proto.sdui.StateUpdate$Value");
        Constructor<?> valueConstructor = valueClass.getDeclaredConstructor();
        valueConstructor.setAccessible(true);
        Object value = valueConstructor.newInstance();
        java.lang.reflect.Method setBoolean = valueClass.getDeclaredMethod("setBooleanValue", boolean.class);
        setBoolean.setAccessible(true);
        setBoolean.invoke(value, shown);
        Class<?> sourceClass = loader.loadClass("proto.sdui.StateUpdate$Source");
        Object source = sourceClass.getMethod("forNumber", int.class).invoke(null, 1);
        manager.getClass().getMethod("updateLocalState", key.getClass(), valueClass, sourceClass, boolean.class,
                String.class).invoke(manager, key, value, source, false, "");
    }

    private static List<Object> managers() {
        synchronized (stateManagers) {
            return new ArrayList<>(stateManagers);
        }
    }

    private static Map<?, ?> states(Object manager) throws ReflectiveOperationException {
        Object store = field(manager, "stateStore");
        Object states = store == null ? null : field(store, "states");
        return states instanceof Map ? (Map<?, ?>) states : Collections.emptyMap();
    }

    private static boolean isControlsKey(Object key) throws ReflectiveOperationException {
        return CONTROLS_STATE.equals(field(key, "value")) && CONTROLS_NAMESPACE.equals(field(key, "namespace"));
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }

    // endregion

    interface ComponentEditor {
        /** Returns the edited component, or the same array when unchanged. */
        byte[] edit(byte[] component);
    }

    /** Called with every SDUI component; returns it, or an edited copy for the viewers. */
    static Object rewrite(Object component, String viewName, String source, byte[] bytes) {
        if (!CONTAINER.equals(viewName) || bytes == null) return component;
        try {
            byte[] edited = source.endsWith(VIDEO_SOURCE) ? video(bytes) : null;
            if (edited == null) return component;
            Object copy = component.getClass().getMethod("parseFrom", byte[].class).invoke(null, (Object) edited);
            return copy != null ? copy : component;
        } catch (Throwable t) {
            Diagnostics.error("viewer tap to hide failed", t);
            return component;
        }
    }

    /** The top bar and bottom part get the play button's show/hide state. */
    static byte[] video(byte[] container) {
        byte[] playButton = null;
        for (byte[] child : children(container)) {
            if ("media-video-play-pause".equals(viewName(child))) playButton = field(child, DISPLAYED_FIELD);
        }
        if (playButton == null) return null;
        final byte[] displayed = playButton;
        final int[] count = {0};
        byte[] edited = mapChildren(container, child -> {
            if (field(child, DISPLAYED_FIELD) != null || viewName(child).startsWith("media-video-play")) return child;
            count[0]++;
            return withField(child, DISPLAYED_FIELD, displayed);
        });
        Settings.debugLog("viewer tap to hide: video, " + count[0] + " parts follow the play button");
        return count[0] > 0 ? edited : null;
    }

    private static byte[] withField(byte[] message, int number, byte[] data) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return message;
        fields.add(new ProtoEdit.Field(number, 2, data));
        return ProtoEdit.write(fields);
    }

    // region Component tree

    static String viewName(byte[] component) {
        byte[] tracking = field(component, VIEW_TRACKING_FIELD);
        byte[] name = tracking == null ? null : field(tracking, 1);
        return name == null ? "" : new String(name, java.nio.charset.StandardCharsets.UTF_8);
    }

    /** The first length-delimited field with this number, or null. */
    static byte[] field(byte[] message, int number) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return null;
        for (ProtoEdit.Field f : fields) if (f.number == number && f.wireType == 2) return f.data;
        return null;
    }

    static boolean isComponent(byte[] bytes) {
        byte[] compact = field(bytes, COMPACT_DATA_FIELD);
        if (compact == null) return false;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(compact);
        if (fields == null) return false;
        for (ProtoEdit.Field f : fields) if (f.number == 1 && f.wireType == 0) return true;
        return false;
    }

    /** The components directly inside a component (in its compact data, through the messages that hold them). */
    static List<byte[]> children(byte[] component) {
        List<byte[]> out = new ArrayList<>();
        mapChildren(component, child -> {
            out.add(child);
            return child;
        });
        return out;
    }

    /** Edits the components directly inside a component; returns the component, rebuilt when one changed. */
    static byte[] mapChildren(byte[] component, ComponentEditor editor) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(component);
        if (fields == null) return component;
        boolean changed = false;
        for (ProtoEdit.Field f : fields) {
            if (f.number != COMPACT_DATA_FIELD || f.wireType != 2) continue;
            List<ProtoEdit.Field> compact = ProtoEdit.parse(f.data);
            if (compact == null) continue;
            for (ProtoEdit.Field c : compact) {
                if (c.number != 2 || c.wireType != 2) continue;
                byte[] payload = mapComponents(c.data, editor, 0);
                if (payload != c.data) {
                    c.data = payload;
                    f.data = ProtoEdit.write(compact);
                    changed = true;
                }
            }
        }
        return changed ? ProtoEdit.write(fields) : component;
    }

    private static byte[] mapComponents(byte[] message, ComponentEditor editor, int hops) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return message;
        boolean changed = false;
        for (ProtoEdit.Field f : fields) {
            if (f.wireType != 2 || f.data.length < 2) continue;
            byte[] edited = isComponent(f.data) ? editor.edit(f.data)
                    : hops < 4 ? mapComponents(f.data, editor, hops + 1) : f.data;
            if (edited != f.data) {
                f.data = edited;
                changed = true;
            }
        }
        return changed ? ProtoEdit.write(fields) : message;
    }

    // endregion
}
