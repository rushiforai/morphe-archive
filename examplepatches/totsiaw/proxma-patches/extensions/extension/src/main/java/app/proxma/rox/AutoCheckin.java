package app.proxma.rox;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/**
 * ROX is a Flutter app: its check-in request is built and signed in Dart, out of reach of Java. So
 * instead of replaying the request, this presses the app's own Check-in button through Flutter's
 * semantics tree, the same tree a screen reader uses. The app sends its own request and shows its
 * own result. It only runs while the app is open.
 */
public final class AutoCheckin {

    private static final String TAG = "PROXMA_ROX";
    private static final String PREFS = "proxma_rox";
    private static final String KEY_DONE_DAY = "done_day";
    private static final String KEY_TRY_DAY = "try_day";
    private static final String KEY_TRIES = "tries";

    private static final String FLUTTER_VIEW = "io.flutter.embedding.android.FlutterView";
    private static final String STREAK_ROUTE = "/dailyStreaksScreen";
    private static final String HOME_ROUTE = "/dashBoardScreen";

    private static final int MAX_TRIES_PER_DAY = 3;
    private static final long TICK_MS = 1500L;
    private static final long SESSION_TIMEOUT_MS = 120_000L;
    private static final long HOME_GRACE_MS = 15_000L;
    private static final long ENTRY_TILE_WAIT_MS = 6_000L;
    private static final long BUTTON_WAIT_MS = 20_000L;
    private static final long RESULT_SETTLE_MS = 6_000L;
    private static final long RESULT_WAIT_MS = 12_000L;

    private static final int ACTION_TAP = 1;
    private static final int ANDROID_ACTION_CLICK = 16;
    private static final long FLAG_HAS_ENABLED_STATE = 0x40L;
    private static final long FLAG_IS_ENABLED = 0x80L;
    private static final long FLAG_IS_HIDDEN = 0x2000L;

    private static final String[] HOME_LABELS = {"rox life", "rox ai", "profile"};
    private static final String[] LOGIN_LABELS = {
        "enter your mobile number", "please enter your mobile number", "please enter your phone number", "sign in required",
    };
    private static final String[] DONE_LABELS = {"congratulations", "you've earned"};
    private static final String[] ALREADY_LABELS = {
        "you can only check in once per day", "will be waiting for you tomorrow",
    };
    private static final String[] DISMISS_LABELS = {"got it", "continue", "ok", "okay", "done", "close"};

    private enum Phase { WAIT_HOME, WAIT_TILE, WAIT_BUTTON, WAIT_RESULT }

    private static volatile boolean sRegistered = false;
    private static Session sSession;

    private AutoCheckin() {}

    public static void onActivityCreate(Activity activity) {
        try {
            if (activity == null) return;
            if (!sRegistered) {
                sRegistered = true;
                activity.getApplication().registerActivityLifecycleCallbacks(new Callbacks());
                Log.i(TAG, "ENTRY registered");
            }
            start(activity);
        } catch (Throwable t) {
            Log.w(TAG, "ENTRY_ERR " + t);
        }
    }

    private static void start(Activity activity) {
        if (sSession != null) {
            Log.i(TAG, "START skipped, session running");
            return;
        }
        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String today = today();
        if (today.equals(prefs.getString(KEY_DONE_DAY, ""))) {
            Log.i(TAG, "START skipped, already done " + today);
            return;
        }
        int tries = today.equals(prefs.getString(KEY_TRY_DAY, "")) ? prefs.getInt(KEY_TRIES, 0) : 0;
        if (tries >= MAX_TRIES_PER_DAY) {
            Log.i(TAG, "START skipped, tries used up " + tries);
            return;
        }
        Log.i(TAG, "START session, earlier tries today " + tries);
        sSession = new Session(activity);
        sSession.run();
    }

    private static String today() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("Asia/Karachi"));
        return format.format(new Date());
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityResumed(Activity activity) {
            try {
                if (activity.getClass().getName().equals("com.jazz.rox.MainActivity")) start(activity);
            } catch (Throwable t) {
                Log.w(TAG, "RESUME_ERR " + t);
            }
        }

        @Override public void onActivityPaused(Activity activity) {
            if (sSession != null && sSession.activity == activity) sSession.end("paused", false);
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityStopped(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {}
    }

    private static final class Node {
        final Object raw;
        final int id;
        final String label;
        final int actions;
        final long flags;

        Node(Object raw, int id, String label, int actions, long flags) {
            this.raw = raw;
            this.id = id;
            this.label = label;
            this.actions = actions;
            this.flags = flags;
        }

        boolean disabled() {
            return (flags & FLAG_HAS_ENABLED_STATE) != 0 && (flags & FLAG_IS_ENABLED) == 0;
        }
    }

    private static final class Session implements Runnable {
        final Activity activity;
        final Handler handler = new Handler(Looper.getMainLooper());
        final long startedAt = SystemClock.uptimeMillis();
        Phase phase = Phase.WAIT_HOME;
        long phaseAt = startedAt;
        boolean routedToStreak = false;
        boolean tileTapped = false;
        boolean semanticsOn = false;
        boolean retapped = false;
        boolean finished = false;
        View view;

        Session(Activity activity) {
            this.activity = activity;
        }

        @Override public void run() {
            try {
                tick();
            } catch (Throwable t) {
                Log.w(TAG, "TICK_ERR " + t);
                end("Couldn't finish the daily check-in", true);
            }
        }

        void tick() {
            if (finished) return;
            long now = SystemClock.uptimeMillis();
            if (now - startedAt > SESSION_TIMEOUT_MS) {
                Log.w(TAG, "TIMEOUT phase " + phase);
                if (phase == Phase.WAIT_HOME) {
                    end("not signed in or home not reached", false);
                    return;
                }
                countTry();
                end("Daily check-in timed out, will retry next time", true);
                return;
            }
            handler.postDelayed(this, TICK_MS);

            View found = findFlutterView(activity.getWindow().getDecorView());
            if (found == null) {
                Log.i(TAG, "TICK no FlutterView yet");
                return;
            }
            view = found;
            if (!enableSemantics()) return;

            List<Node> nodes = readTree();
            if (nodes.isEmpty()) {
                Log.i(TAG, "TICK semantics tree empty");
                return;
            }

            switch (phase) {
                case WAIT_HOME: waitHome(nodes, now); break;
                case WAIT_TILE: waitTile(nodes, now); break;
                case WAIT_BUTTON: waitButton(nodes, now); break;
                case WAIT_RESULT: waitResult(nodes, now); break;
            }
        }

        void waitHome(List<Node> nodes, long now) {
            Node button = findCheckinButton(nodes);
            if (button != null) {
                pressButton(nodes, button, now);
                return;
            }
            if (anyContains(nodes, LOGIN_LABELS)) {
                Log.i(TAG, "HOME login screen showing, waiting");
                return;
            }
            boolean home = anyEquals(nodes, HOME_LABELS);
            if (!home && now - startedAt < HOME_GRACE_MS) {
                Log.i(TAG, "HOME not recognised yet, nodes " + nodes.size());
                return;
            }
            Log.i(TAG, "HOME ready, marker " + home);
            Node tile = findStreakTile(nodes);
            if (tile != null && tap(tile)) {
                tileTapped = true;
                Log.i(TAG, "TILE tapped");
                setPhase(Phase.WAIT_TILE, now);
                return;
            }
            openStreakRoute(now);
        }

        void waitTile(List<Node> nodes, long now) {
            Node button = findCheckinButton(nodes);
            if (button != null) {
                pressButton(nodes, button, now);
                return;
            }
            if (now - phaseAt >= ENTRY_TILE_WAIT_MS) {
                Log.i(TAG, "TILE opened no check-in button, using route");
                tileTapped = false;
                openStreakRoute(now);
            }
        }

        void waitButton(List<Node> nodes, long now) {
            Node button = findCheckinButton(nodes);
            if (button != null) {
                pressButton(nodes, button, now);
                return;
            }
            if (anyContains(nodes, ALREADY_LABELS) && now - phaseAt >= ENTRY_TILE_WAIT_MS) {
                Log.i(TAG, "BUTTON absent, screen says already checked in");
                markDone();
                leaveStreakScreen();
                end("Already checked in today", true);
                return;
            }
            if (now - phaseAt >= BUTTON_WAIT_MS) {
                Log.w(TAG, "BUTTON not found on streak screen, nodes " + nodes.size());
                countTry();
                leaveStreakScreen();
                end("Couldn't find the Check-in button", true);
            }
        }

        void waitResult(List<Node> nodes, long now) {
            if (anyContains(nodes, DONE_LABELS)) {
                Log.i(TAG, "RESULT success text showing");
                finishSuccess(nodes);
                return;
            }
            Node button = findCheckinButton(nodes);
            if (button == null && now - phaseAt >= RESULT_SETTLE_MS) {
                Log.i(TAG, "RESULT button gone after tap");
                finishSuccess(nodes);
                return;
            }
            if (now - phaseAt < RESULT_WAIT_MS) return;
            if (button != null && !retapped) {
                retapped = true;
                Log.w(TAG, "RESULT button still there, tapping once more");
                tap(button);
                setPhase(Phase.WAIT_RESULT, now);
                return;
            }
            Log.w(TAG, "RESULT button stayed after retry");
            countTry();
            leaveStreakScreen();
            end("Check-in didn't go through, will retry next time", true);
        }

        void pressButton(List<Node> nodes, Node button, long now) {
            if (button.disabled()) {
                Log.i(TAG, "BUTTON disabled, treating as already checked in");
                markDone();
                leaveStreakScreen();
                end("Already checked in today", true);
                return;
            }
            if (tap(button)) {
                Log.i(TAG, "BUTTON tapped, label " + button.label);
                setPhase(Phase.WAIT_RESULT, now);
                return;
            }
            Log.w(TAG, "BUTTON could not be tapped");
            countTry();
            end("Couldn't press the Check-in button", true);
        }

        void finishSuccess(List<Node> nodes) {
            markDone();
            Node dismiss = findDismiss(nodes);
            if (dismiss != null) {
                Log.i(TAG, "RESULT dismissing, label " + dismiss.label);
                tap(dismiss);
            } else {
                Log.i(TAG, "RESULT nothing to dismiss");
            }
            final Session self = this;
            handler.postDelayed(new Runnable() {
                @Override public void run() {
                    try {
                        self.leaveStreakScreen();
                    } catch (Throwable t) {
                        Log.w(TAG, "LEAVE_ERR " + t);
                    }
                }
            }, 1200L);
            end("Daily check-in done", true);
        }

        void openStreakRoute(long now) {
            routedToStreak = true;
            pushRoute(STREAK_ROUTE);
            Log.i(TAG, "ROUTE pushed " + STREAK_ROUTE);
            setPhase(Phase.WAIT_BUTTON, now);
        }

        void leaveStreakScreen() {
            if (routedToStreak) {
                pushRoute(HOME_ROUTE);
                Log.i(TAG, "LEAVE pushed " + HOME_ROUTE);
            } else if (tileTapped) {
                popRoute();
                Log.i(TAG, "LEAVE popped route");
            } else {
                Log.i(TAG, "LEAVE stayed, button was already on screen");
            }
        }

        void setPhase(Phase next, long now) {
            phase = next;
            phaseAt = now;
        }

        void countTry() {
            SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String today = today();
            int tries = today.equals(prefs.getString(KEY_TRY_DAY, "")) ? prefs.getInt(KEY_TRIES, 0) : 0;
            prefs.edit().putString(KEY_TRY_DAY, today).putInt(KEY_TRIES, tries + 1).apply();
        }

        void markDone() {
            activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(KEY_DONE_DAY, today()).apply();
        }

        void end(String message, boolean toast) {
            if (finished) return;
            finished = true;
            handler.removeCallbacks(this);
            if (sSession == this) sSession = null;
            Log.i(TAG, "END " + message);
            restoreSemantics();
            if (toast && message != null) {
                Toast.makeText(activity.getApplicationContext(), "ROX patch: " + message, Toast.LENGTH_LONG).show();
            }
        }

        boolean enableSemantics() {
            if (semanticsOn) return true;
            try {
                setSemantics(true);
                semanticsOn = true;
                Log.i(TAG, "SEMANTICS enabled");
                return true;
            } catch (Throwable t) {
                Log.i(TAG, "SEMANTICS not ready " + t);
                return false;
            }
        }

        void restoreSemantics() {
            if (!semanticsOn) return;
            try {
                AccessibilityManager manager =
                    (AccessibilityManager) activity.getSystemService(Context.ACCESSIBILITY_SERVICE);
                setSemantics(manager != null && manager.isEnabled());
                Log.i(TAG, "SEMANTICS restored");
            } catch (Throwable t) {
                Log.w(TAG, "SEMANTICS_RESTORE_ERR " + t);
            }
        }

        void setSemantics(boolean on) throws Exception {
            Object renderer = call(engine(), "getRenderer");
            renderer.getClass().getMethod("setSemanticsEnabled", boolean.class).invoke(renderer, on);
        }

        void pushRoute(String route) {
            try {
                Object channel = call(engine(), "getNavigationChannel");
                channel.getClass().getMethod("pushRouteInformation", String.class).invoke(channel, route);
            } catch (Throwable t) {
                Log.w(TAG, "PUSH_ROUTE_ERR " + route + " " + t);
            }
        }

        void popRoute() {
            try {
                call(call(engine(), "getNavigationChannel"), "popRoute");
            } catch (Throwable t) {
                Log.w(TAG, "POP_ROUTE_ERR " + t);
            }
        }

        Object engine() throws Exception {
            Object engine = activity.getClass().getMethod("getFlutterEngine").invoke(activity);
            if (engine == null) throw new IllegalStateException("no engine");
            return engine;
        }

        AccessibilityNodeProvider bridge() throws Exception {
            return (AccessibilityNodeProvider) field(view, "accessibilityBridge");
        }

        @SuppressWarnings("unchecked")
        List<Node> readTree() {
            List<Node> nodes = new ArrayList<>();
            try {
                Object bridge = bridge();
                if (bridge == null) return nodes;
                Map<Integer, Object> tree = (Map<Integer, Object>) field(bridge, "flutterSemanticsTree");
                for (Map.Entry<Integer, Object> entry : tree.entrySet()) {
                    Object raw = entry.getValue();
                    long flags = (Long) field(raw, "flags");
                    if ((flags & FLAG_IS_HIDDEN) != 0) continue;
                    nodes.add(new Node(raw, entry.getKey(), labelOf(raw), (Integer) field(raw, "actions"), flags));
                }
            } catch (Throwable t) {
                Log.w(TAG, "READ_TREE_ERR " + t);
            }
            return nodes;
        }

        boolean tap(Node node) {
            try {
                Object raw = node.raw;
                while (raw != null) {
                    if (((Integer) field(raw, "actions") & ACTION_TAP) != 0) {
                        return bridge().performAction((Integer) field(raw, "id"), ANDROID_ACTION_CLICK, null);
                    }
                    raw = field(raw, "parent");
                }
                Log.i(TAG, "TAP no tap action on node or parents, sending a touch");
                return touch(node);
            } catch (Throwable t) {
                Log.w(TAG, "TAP_ERR " + t);
                return false;
            }
        }

        boolean touch(Node node) throws Exception {
            Rect rect = (Rect) field(node.raw, "globalRect");
            if (rect == null || rect.isEmpty()) {
                Log.w(TAG, "TOUCH no bounds for node");
                return false;
            }
            long down = SystemClock.uptimeMillis();
            float x = rect.exactCenterX();
            float y = rect.exactCenterY();
            MotionEvent press = MotionEvent.obtain(down, down, MotionEvent.ACTION_DOWN, x, y, 0);
            MotionEvent release = MotionEvent.obtain(down, down + 60L, MotionEvent.ACTION_UP, x, y, 0);
            view.dispatchTouchEvent(press);
            view.dispatchTouchEvent(release);
            press.recycle();
            release.recycle();
            return true;
        }
    }

    private static Node findCheckinButton(List<Node> nodes) {
        Node enabled = null;
        Node disabled = null;
        for (Node node : nodes) {
            for (String line : node.label.split("\n")) {
                String text = normalize(line);
                if (text.equals("check-in") || text.equals("check in") || text.equals("checkin")
                    || text.equals("check-in now") || text.equals("check in now")) {
                    if (node.disabled()) {
                        disabled = node;
                    } else if ((node.actions & ACTION_TAP) != 0) {
                        return node;
                    } else {
                        enabled = node;
                    }
                }
            }
        }
        return enabled != null ? enabled : disabled;
    }

    private static Node findStreakTile(List<Node> nodes) {
        for (Node node : nodes) {
            if (normalize(node.label).contains("daily streak") && (node.actions & ACTION_TAP) != 0) return node;
        }
        return null;
    }

    private static Node findDismiss(List<Node> nodes) {
        for (Node node : nodes) {
            String text = normalize(node.label);
            for (String label : DISMISS_LABELS) {
                if (text.equals(label) && (node.actions & ACTION_TAP) != 0) return node;
            }
        }
        return null;
    }

    private static boolean anyContains(List<Node> nodes, String[] needles) {
        for (Node node : nodes) {
            String text = normalize(node.label);
            for (String needle : needles) {
                if (text.contains(needle)) return true;
            }
        }
        return false;
    }

    private static boolean anyEquals(List<Node> nodes, String[] wanted) {
        for (Node node : nodes) {
            for (String line : node.label.split("\n")) {
                String text = normalize(line);
                for (String word : wanted) {
                    if (text.equals(word)) return true;
                }
            }
        }
        return false;
    }

    private static String normalize(String text) {
        return text.trim().replace('’', '\'').toLowerCase(Locale.US);
    }

    private static String labelOf(Object raw) throws Exception {
        Object label = field(raw, "label");
        return label == null ? "" : (String) label;
    }

    private static View findFlutterView(View root) {
        if (root == null) return null;
        if (root.getClass().getName().equals(FLUTTER_VIEW)) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findFlutterView(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    private static Object field(Object target, String name) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }
}
