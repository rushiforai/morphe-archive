package patches.videoland.profile;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/** Local profile preference for the two 1.119.2 builds. All navigation uses the app's tile action. */
public final class ProfileRecall {
    private static final String MODEL = "com.bedrockstreaming.component.layout.domain.core.model.";
    private static final String READY = "com.bedrockstreaming.component.layout.presentation.LegacyEntityLayoutViewModel$d$a";
    private static final String HOME_READY = "com.bedrockstreaming.shared.common.feature.home.presentation.viewmodel.HomeViewModel$d$a";
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static boolean tv, launched, armed;
    private static Object users, contextStore;
    private static SharedPreferences prefs;
    private static int generation;
    private static String pendingAccount, pendingUid, homeUid;
    private static long deadline;

    private ProfileRecall() {}

    public static synchronized void launch(Activity activity, Bundle saved) {
        if (launched) return;
        launched = true;
        Intent i = activity.getIntent();
        armed = saved == null && i != null && Intent.ACTION_MAIN.equals(i.getAction())
                && i.getData() == null && (i.hasCategory(Intent.CATEGORY_LAUNCHER)
                || i.hasCategory(Intent.CATEGORY_LEANBACK_LAUNCHER));
    }

    public static void bindPhone(Object store, Object supplier, Context context) { bind(store, supplier, context, false); }

    public static void bindTv(Object store, Object supplier, Context context) { bind(store, supplier, context, true); }

    private static synchronized void bind(Object store, Object supplier, Context context, boolean television) {
        tv = television;
        contextStore = store;
        users = supplier;
        prefs = context.getSharedPreferences("patches.videoland.last_profile_v1", Context.MODE_PRIVATE);
    }

    public static synchronized void logout() {
        disarm();
        if (prefs != null) prefs.edit().clear().apply();
    }

    public static synchronized void incoming(Intent intent) {
        // A picker click delivers its own native navigation request to the existing
        // HomeActivity. Preserve its pending UID until the account-specific Home renders.
        if (pendingUid != null && intent != null && intent.getData() == null
                && intent.hasExtra("EXTRA_NAVIGATION_REQUEST")) {
            armed = false;
            return;
        }
        disarm();
    }

    private static void trace(String message) {
        if (Log.isLoggable("VLProfileChecks", Log.DEBUG)) Log.d("VLProfileChecks", message);
    }

    public static synchronized void disarm() {
        armed = false;
        generation++;
        pendingAccount = pendingUid = homeUid = null;
    }

    private static Object field(Object o, String name) throws ReflectiveOperationException {
        return o.getClass().getField(name).get(o);
    }

    private static Object read(Object o, String method) throws ReflectiveOperationException {
        return o.getClass().getMethod(method).invoke(o);
    }

    private static String account() throws ReflectiveOperationException {
        if (users == null || !Boolean.TRUE.equals(read(users, tv ? "a" : "c"))) return null;
        Object user = read(users, tv ? "b" : "a");
        if (user == null) return null;
        String id = (String) read(user, "getId");
        return id == null || id.isEmpty() ? null : id;
    }

    private static boolean canHostPicker(Object info) throws ReflectiveOperationException {
        if (info == null) return false;
        String entity = (String) field(info, "c");
        // On signed-in cold starts, the service can return the chooser as the Home layout itself.
        return ("main".equals(field(info, "a")) && "home".equals(entity))
                || ("frontspace".equals(field(info, "b")) && "profilesgate".equals(entity));
    }

    private static List<?> blockItems(Object page) throws ReflectiveOperationException {
        Object block = field(page, tv ? "N" : "d");
        if (block == null || !(MODEL + "Block$LayoutBlock").equals(block.getClass().getName())) return null;
        Object data = field(block, tv ? "U" : "k");
        return data == null ? null : (List<?>) field(data, tv ? "Q" : "g");
    }

    private static Object tileTarget(Object item) throws ReflectiveOperationException {
        Object action = item == null ? null : read(item, tv ? "o" : "r");
        return action == null ? null : field(action, tv ? "P" : "f");
    }

    private static boolean profileRow(Object page) throws ReflectiveOperationException {
        List<?> items = blockItems(page);
        if (items == null || items.isEmpty()) return false;
        boolean hasChoice = false;
        for (Object item : items) {
            Object target = tileTarget(item);
            if (target == null) continue;
            if (choiceUid(target) == null) return false;
            hasChoice = true;
        }
        return hasChoice;
    }

    private static boolean containsProfileRow(Object state) throws ReflectiveOperationException {
        for (Object page : (List<?>) field(state, "d")) if (profileRow(page)) return true;
        return false;
    }

    private static String choiceUid(Object target) throws ReflectiveOperationException {
        // Inspect native outer locks only to identify the tile. Dispatch always receives the entire original target.
        String attr = tv ? "N" : "d";
        Class<?> lock = Class.forName(MODEL + "Target$Lock");
        for (int depth = 0; depth < 12 && target != null && lock.isInstance(target); depth++) {
            String type = target.getClass().getName();
            if (type.equals(MODEL + "Target$Lock$RefreshAuthLock") || type.equals(MODEL + "Target$Lock$RequireProfileSwitch")) {
                Object attributes = field(target, attr);
                if (attributes == null) return null;
                String uid = (String) field(attributes, attr);
                return uid == null || uid.isEmpty() ? null : uid;
            }
            target = read(target, tv ? "b" : "h");
        }
        return null;
    }

    public static synchronized void clicked(Object vm, Object page, Object item, Object target) {
        try {
            if (!profileRow(page)) { armed = false; return; }
            disarm();
            String uid = choiceUid(target), owner = account();
            if (uid == null || owner == null) {
                Log.d("VideolandProfile", "Picker choice lacked account or profile identity");
                return;
            }
            pendingUid = uid;
            pendingAccount = owner;
            deadline = SystemClock.elapsedRealtime() + 120_000;
            Log.d("VideolandProfile", "Native profile choice staged");
        } catch (ReflectiveOperationException | RuntimeException ignored) { disarm(); }
    }

    public static synchronized void homeState(Object state) {
        if (pendingUid == null || state == null || !HOME_READY.equals(state.getClass().getName())) return;
        try {
            Object context = field(state, "a");
            homeUid = (String) field(context, tv ? "O" : "e");
            trace("Loaded Home matches selection=" + pendingUid.equals(homeUid));
        } catch (ReflectiveOperationException | RuntimeException ignored) { homeUid = null; }
    }

    public static synchronized void rendered(Object delegate, Object binding, Object state) {
        if (prefs == null || state == null || !READY.equals(state.getClass().getName())) return;
        try {
            Object vm = field(delegate, tv ? "Q" : "g");
            View view = (View) field(binding, "a");
            if (canHostPicker(field(state, "f")) && containsProfileRow(state)) {
                if (!armed) return;
                int expected = generation;
                view.post(() -> restore(view, vm, state, expected, 0));
            } else {
                armed = false;
                if (pendingUid != null) {
                    int expected = generation;
                    view.postOnAnimation(() -> confirm(view, expected, 0));
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { armed = false; }
    }

    private static synchronized void confirm(View view, int expected, int retry) {
        if (expected != generation || pendingUid == null || !view.isAttachedToWindow()
                || SystemClock.elapsedRealtime() > deadline) return;
        try {
            String owner = account();
            Object active = read(contextStore, "e");
            if (!pendingAccount.equals(owner)) { disarm(); return; }
            String uid = (String) field(active, tv ? "O" : "e");
            // A context emission can precede PIN or session refresh. Require loaded Home state and its rendered rail.
            int railId = view.getResources().getIdentifier(tv ? "hero_poster_content" : "textView_hero_title",
                    "id", view.getContext().getPackageName());
            View rail = railId == 0 ? null : view.getRootView().findViewById(railId);
            if (retry == 0 || retry == 12) trace("Home confirmation: loaded=" + pendingUid.equals(homeUid)
                    + " active=" + pendingUid.equals(uid) + " focus=" + view.hasWindowFocus()
                    + " rail=" + (rail != null && rail.isShown()));
            if (pendingUid.equals(homeUid) && pendingUid.equals(uid) && view.hasWindowFocus()
                    && rail != null && rail.isShown()) {
                prefs.edit().putString("account", owner).putString("profile", uid).apply();
                disarm();
                Log.d("VideolandProfile", "Confirmed selection on rendered Home");
            } else if (retry < 12) {
                main.postDelayed(() -> confirm(view, expected, retry + 1), 250);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { disarm(); }
    }

    private static synchronized void restore(View view, Object vm, Object state, int expected, int retry) {
        if (!armed || expected != generation) return;
        if (!view.isAttachedToWindow() || !view.isShown()) {
            if (retry < 20) main.postDelayed(() -> restore(view, vm, state, expected, retry + 1), 80);
            return;
        }
        try {
            String owner = account();
            boolean current = read(vm, "j") == state;
            if (owner == null || !current || !canHostPicker(read(vm, "i"))) {
                trace("Picker readiness: account=" + (owner != null) + " current=" + current);
                return;
            }
            Object currentContext = read(contextStore, "e");
            if (!"".equals(field(currentContext, tv ? "O" : "e"))) { armed = false; return; }
            String savedAccount = prefs.getString("account", null);
            if (savedAccount == null) return;
            if (!owner.equals(savedAccount)) { logout(); return; }
            String uid = prefs.getString("profile", null);
            if (uid == null) return;
            Object selectedBlock = null, selectedItem = null, selectedTarget = null;
            boolean complete = true;
            int offered = 0;
            for (Object page : (List<?>)field(state, "d")) {
                if (!profileRow(page)) continue;
                Object block = field(page, tv ? "N" : "d");
                if (block == null || !(MODEL + "Block$LayoutBlock").equals(block.getClass().getName())) continue;
                Object data = field(block, tv ? "U" : "k");
                if (data == null) continue;
                if (field(data, tv ? "R" : "h") != null) complete = false;
                List<?> items = (List<?>)field(data, tv ? "Q" : "g");
                if (items == null) { complete = false; continue; }
                for (Object item : items) {
                    if (item == null) continue;
                    Object target = tileTarget(item);
                    String candidate = choiceUid(target);
                    if (candidate == null) continue;
                    offered++;
                    if (!uid.equals(candidate)) continue;
                    if (selectedItem != null) { armed = false; return; }
                    selectedBlock = page; selectedItem = item; selectedTarget = target;
                }
            }
            if (selectedItem == null) {
                if (complete && offered > 0) logout();
                return;
            }
            Method click = vm.getClass().getMethod("n", selectedBlock.getClass(),
                    Class.forName(MODEL + "Item"), Class.forName(MODEL + "Target"));
            armed = false;
            Log.d("VideolandProfile", "Dispatching remembered native tile");
            click.invoke(vm, selectedBlock, selectedItem, selectedTarget);
        } catch (InvocationTargetException failed) {
            disarm();
        } catch (ReflectiveOperationException | RuntimeException ignored) { disarm(); }
    }
}
