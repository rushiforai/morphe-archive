package software.santodan.extension.nuviobuttons;

import software.santodan.nuvio.NuvioNative;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.KeyEvent;
import android.view.ViewConfiguration;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/** Native actions and availability are collected only for the current composition, never retained. */
public final class NuvioPlaybackButtons {
    // Retain only reflection metadata, never a player, callback, or Composer instance.
    private static final Map<Class<?>, Map<String, Method>> methods = new ConcurrentHashMap<>();
    private static volatile ButtonLayout layout;
    private static final ThreadLocal<Frame> frames = new ThreadLocal<>();
    private static Object menuState;
    private static int menuRevision;
    private static String menuFocusId = "play", movingId = "", heldId = "";
    private static ButtonLayout moveDraft;
    private static boolean longHeld, consumedBack;
    private static final class Frame {
        final ButtonLayout layout;
        final Map<String, Object[]> buttons = new LinkedHashMap<>();
        Object lambda;
        boolean expanded;
        Frame(ButtonLayout layout) { this.layout = layout; }
    }
    private NuvioPlaybackButtons() {}
    private static SharedPreferences preferences() throws Exception {
        Application app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        return app.getSharedPreferences("santodan_playback_buttons", 0);
    }
    private static ButtonLayout layout() {
        ButtonLayout value = layout;
        if (value != null) return value;
        synchronized (NuvioPlaybackButtons.class) {
            if (layout == null) try {
                SharedPreferences p = preferences();
                layout = new ButtonLayout(p.getBoolean("enabled", false), p.getString("order", ""),
                    p.getString("hidden", ""), p.getString("more", "speed,aspect,engine,external,info,report"));
            } catch (Exception error) {
                Log.e("SantodanButtons", "Cannot read playback layout", error);
                return ButtonLayout.defaults(); // Retry after app initialization.
            }
            return layout;
        }
    }
    private static void save(ButtonLayout value) throws Exception {
        preferences().edit().putBoolean("enabled", value.enabled).putString("order", String.join(",", value.order))
            .putString("hidden", String.join(",", value.hidden)).putString("more", String.join(",", value.more)).apply();
        layout = value;
    }
    static Method method(Class<?> owner, String name, int count) throws Exception {
        Map<String, Method> cache = methods.computeIfAbsent(owner, ignored -> new ConcurrentHashMap<>());
        String key = name + ':' + count;
        Method cached = cache.get(key);
        if (cached != null) return cached;
        Method result = null;
        for (Method candidate : owner.getDeclaredMethods()) if (candidate.getName().equals(name) && candidate.getParameterCount() == count) {
            if (result != null) throw new NoSuchMethodException("Ambiguous " + owner.getName() + '.' + name);
            result = candidate;
        }
        if (result == null) throw new NoSuchMethodException(owner.getName() + '.' + name);
        result.setAccessible(true);
        Method previous = cache.putIfAbsent(key, result);
        return previous == null ? result : previous;
    }
    private static void nativeButton(Object[] args) {
        invokeNative(args.length == 9 ? NuvioNative.NATIVE_REPORT_METHOD : NuvioNative.NATIVE_BUTTON_METHOD, args, args.length == 9 ? 7 : 10);
    }
    private static void invokeNative(String name, Object[] args, int composerIndex) {
        try { method(args[composerIndex].getClass().getClassLoader().loadClass(NuvioNative.PLAYER_CONTROLS_NAME), name, args.length).invoke(null, args); }
        catch (Exception error) { throw new IllegalStateException("Native playback control failed", error); }
    }
    private static void capture(String id, Object[] args) {
        if (id.equals("play")) {
            frames.remove();
            ButtonLayout value = layout();
            if (value.enabled) frames.set(new Frame(value));
        }
        Frame frame = frames.get();
        if (frame == null) { nativeButton(args); return; }
        frame.buttons.put(id, args);
    }
    public static void registerMore(Object lambda) {
        Frame frame = frames.get();
        if (frame != null) frame.lambda = lambda;
    }
    public static boolean collectIntroDb(Object[] args) {
        Frame frame = frames.get();
        if (frame == null) return false;
        frame.buttons.put("introdb", args);
        return true;
    }
    public static void more(boolean visible, Object modifier, Object enter, Object exit, Object label,
            Object content, Object composer, int flags) {
        Frame frame = frames.get();
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            if (frame == null) {
                method(loader.loadClass(NuvioNative.ANIMATED_VISIBILITY_NAME), "e", 8).invoke(null, visible, modifier, enter, exit, label, content, composer, flags);
                return;
            }
            frame.expanded = visible;
            if (frame.lambda == null) throw new IllegalStateException("Missing native More content");
            // The original branch only requires a non-null empty AnimatedVisibilityScope interface.
            // Evaluate every native availability rule even while More is closed, so controls can move out of it.
            Object scope = Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass(NuvioNative.ANIMATED_SCOPE_NAME)},
                (proxy, called, args) -> called.getName().equals("hashCode") ? System.identityHashCode(proxy) :
                    called.getName().equals("equals") ? proxy == args[0] : "SantodanPlaybackScope");
            method(composer.getClass(), "d0", 1).invoke(composer, 0x53425001);
            try { method(frame.lambda.getClass(), "invoke", 3).invoke(frame.lambda, scope, composer, 0); }
            finally { method(composer.getClass(), "p", 1).invoke(composer, false); }
        } catch (Exception error) {
            frames.remove();
            throw new IllegalStateException("Playback More composition failed", error);
        }
    }
    private static void finishFrame(Object[] toggle) {
        Frame frame = frames.get();
        frames.remove(); // No player, callbacks or composer survive this composition, including failures.
        if (frame == null) { nativeButton(toggle); return; }
        Object composer = toggle[10];
        List<String> primary = frame.layout.visible(frame.buttons.keySet(), false);
        List<String> secondary = frame.layout.visible(frame.buttons.keySet(), true);
        secondary.removeAll(primary); // A conditional-main fallback must not duplicate Play in More.
        Object playFocus = frame.buttons.get("play")[4];
        Object infoFocus = frame.buttons.containsKey("info") ? frame.buttons.get("info")[4] : null;
        String mainFocus = primary.stream().filter(id -> !id.equals("report")).findFirst().orElse("play");
        for (String id : primary) render(id, frame.buttons.get(id), composer,
            id.equals(mainFocus) ? playFocus : null);
        String moreFocus = secondary.stream().filter(id -> !id.equals("report")).findFirst().orElse("");
        if (frame.expanded) for (String id : secondary) render(id, frame.buttons.get(id), composer,
            id.equals(moreFocus) ? infoFocus : null);
        if (!secondary.isEmpty() || frame.expanded) render("more", toggle, composer,
            frame.expanded && moreFocus.isEmpty() ? infoFocus : null);
    }
    private static void render(String id, Object[] original, Object composer, Object focus) {
        Object[] args = original.clone();
        // Native focus anchors follow actual visible destinations after hiding or regrouping.
        if (args.length == 13) {
            args[4] = focus;
            args[12] = focus == null ? ((Integer)args[12] | 16) : ((Integer)args[12] & ~16);
            args[11] = 0; // Re-evaluate changed inputs in the new stable group.
        } else { args[8] = 0; }
        try {
            method(composer.getClass(), "d0", 1).invoke(composer, 0x53425020 + ButtonLayout.IDS.indexOf(id));
            try { nativeButton(args); }
            finally { method(composer.getClass(), "p", 1).invoke(composer, false); }
        } catch (Exception error) { throw new IllegalStateException("Playback button composition failed", error); }
    }
    public static void report(Object id, boolean showId, Object click, boolean enabled, Object up, Object down,
            Object focused, Object composer, int flags) {
        capture("report", new Object[]{id, showId, click, enabled, up, down, focused, composer, flags});
    }
    public static void renderSettings(Object composer) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        if (menuState == null) menuState = method(loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, "");
        String page = ((String) method(menuState.getClass(), "getValue", 0).invoke(menuState)).split("\\|", 2)[0];
        ButtonLayout value = moveDraft == null ? layout() : moveDraft;
        Object toggle = ButtonsUi.callback(loader, "Function0", args -> {
            save(layout().enabled(!layout().enabled)); setPage(""); return ButtonsUi.unit(loader);
        });
        method(loader.loadClass(NuvioNative.SETTINGS_ROWS_NAME), "m", 13).invoke(null,
            "Customize playback buttons", "Choose visibility, order, and main row or More actions. Settings apply to this installation.",
            value.enabled, toggle, null, ButtonsUi.callback(loader, "Function0", args -> ButtonsUi.unit(loader)),
            false, null, 0L, false, composer, 0, 1008);
        ButtonsUi.action(composer, "Edit playback buttons", () -> setPage("list"));
        ButtonsUi.action(composer, "Reset playback buttons", () -> { save(ButtonLayout.defaults()); setPage(""); });
        if (page.equals("list")) {
            List<String> ids = settingsIds(value, loader);
            List<String> labels = new ArrayList<>();
            for (String id : ids) labels.add((id.equals(movingId) ? "Moving · " : "") + positionLabel(value, ids, id));
            ButtonsUi.iconPicker(composer, "Playback buttons", ids, labels, menuFocusId, movingId,
                NuvioPlaybackButtons::rowKey, NuvioPlaybackButtons::selectRow, () -> {
                    if (moveDraft != null) setPage("list"); else setPage("");
                });
        } else if (ButtonLayout.IDS.contains(page)) {
            List<String> actions = Arrays.asList("visibility", "group", "back");
            List<String> labels = Arrays.asList(value.hidden.contains(page) ? "Show button" : "Hide button",
                value.more.contains(page) ? "Move to main row" : "Move to More actions", "Back to buttons");
            ButtonsUi.picker(composer, ButtonLayout.label(page), actions, labels, "", action -> {
                if (!action.equals("back")) save(layout().change(page, action));
                setPage("list");
            }, () -> setPage("list"));
        }
    }
    private static void setPage(String value) throws Exception {
        moveDraft = null; movingId = ""; heldId = ""; longHeld = false;
        refreshPage(value);
    }
    private static void refreshPage(String value) throws Exception {
        // Settings actions always change the page, invalidating the native composition after edits.
        method(menuState.getClass(), "setValue", 1).invoke(menuState, value + "|" + (++menuRevision));
    }
    private static void selectRow(String id) throws Exception {
        menuFocusId = id;
        if (moveDraft != null) { save(moveDraft); setPage("list"); }
        else setPage(id);
    }
    private static void beginMove(String id) throws Exception {
        menuFocusId = movingId = id;
        moveDraft = layout();
        longHeld = true;
        refreshPage("list");
    }
    private static boolean rowKey(String id, Object nativeEvent, Object listState) throws Exception {
        KeyEvent event = (KeyEvent)nativeEvent;
        int code = event.getKeyCode(), action = event.getAction();
        if (code == KeyEvent.KEYCODE_BACK && (moveDraft != null || consumedBack)) {
            if (action == KeyEvent.ACTION_DOWN) { consumedBack = true; setPage("list"); }
            else if (action == KeyEvent.ACTION_UP) consumedBack = false;
            return true;
        }
        if (moveDraft != null && (code == KeyEvent.KEYCODE_DPAD_UP || code == KeyEvent.KEYCODE_DPAD_DOWN)) {
            if (action == KeyEvent.ACTION_DOWN) {
                ButtonLayout next = moveDraft.change(movingId, code == KeyEvent.KEYCODE_DPAD_UP ? "left" : "right");
                if (!next.order.equals(moveDraft.order)) {
                    moveDraft = next;
                    int index = settingsIds(next, NuvioPlaybackButtons.class.getClassLoader()).indexOf(movingId);
                    method(listState.getClass(), "k", 3).invoke(listState, index, 0, false);
                    refreshPage("list");
                }
            }
            return true;
        }
        if (moveDraft != null && (code == KeyEvent.KEYCODE_DPAD_LEFT || code == KeyEvent.KEYCODE_DPAD_RIGHT)) return true;
        if (code != KeyEvent.KEYCODE_DPAD_CENTER && code != KeyEvent.KEYCODE_ENTER && code != KeyEvent.KEYCODE_NUMPAD_ENTER) return false;
        if (event.isCanceled()) { heldId = ""; longHeld = false; return true; }
        boolean heldLongEnough = event.getEventTime() - event.getDownTime() >= ViewConfiguration.getLongPressTimeout();
        if (action == KeyEvent.ACTION_DOWN) {
            if (event.getRepeatCount() == 0) { heldId = id; longHeld = false; }
            else if (moveDraft == null && id.equals(heldId) && heldLongEnough) beginMove(id);
            return true;
        }
        if (action == KeyEvent.ACTION_UP) {
            if (!id.equals(heldId)) return true;
            if (longHeld) { longHeld = false; heldId = ""; return true; }
            heldId = "";
            if (moveDraft == null && heldLongEnough) { beginMove(id); longHeld = false; }
            else selectRow(id);
            return true;
        }
        return false;
    }
    private static List<String> settingsIds(ButtonLayout value, ClassLoader loader) {
        List<String> ids = new ArrayList<>(value.order);
        if (!ButtonsIcons.hasIntroDb(loader)) ids.remove("introdb");
        ids.sort((a, b) -> Boolean.compare(value.more.contains(a), value.more.contains(b)));
        return ids;
    }
    private static String positionLabel(ButtonLayout value, List<String> ids, String id) {
        int position = 0;
        for (String candidate : ids) {
            if (value.more.contains(candidate) == value.more.contains(id)) position++;
            if (candidate.equals(id)) break;
        }
        return position + ". " + ButtonLayout.label(id) + " — " + (value.hidden.contains(id) ? "Hidden" : value.more.contains(id) ? "More actions" : "Main row");
    }
    public static void play(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("play", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void next(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("next", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void subtitles(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("subtitles", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void audio(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("audio", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void chapters(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("chapters", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void sources(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("sources", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void engine(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("engine", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void episodes(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("episodes", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void party(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("party", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void speed(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("speed", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void aspect(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("aspect", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void external(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("external", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void info(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        capture("info", new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
    public static void finish(Object icon, Object painter, Object label, Object click, Object focus, Object up,
            boolean enabled, Object down, Object focused, long tint, Object composer, int flags, int defaults) {
        finishFrame(new Object[]{icon, painter, label, click, focus, up, enabled, down, focused, tint, composer, flags, defaults});
    }
}
