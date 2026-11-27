// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.tests.reseam;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.database.DataSetObserver;
import android.os.Looper;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;

import dalvik.system.PathClassLoader;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Runs against a patched rif 5.6.22 APK, including the patch-time binding for the result key. */
public final class RifSearchTest {
    private static final String SYNC = "SYNCCIT_ENABLED";
    private static final String NOTIFY = "ENABLE_NEW_POST_NOTIFICATIONS";

    public static void main(String[] args) throws Exception {
        Looper.prepareMainLooper();
        Class<?> thread = Class.forName("android.app.ActivityThread");
        Object activityThread = thread.getMethod("systemMain").invoke(null);
        Context platform = (Context) thread.getMethod("getSystemContext").invoke(activityThread);
        ClassLoader loader = new PathClassLoader(args[0], RifSearchTest.class.getClassLoader());
        Set<String> enabled = new HashSet<>(List.of(SYNC, NOTIFY));
        SharedPreferences prefs = (SharedPreferences) Proxy.newProxyInstance(loader,
                new Class<?>[]{SharedPreferences.class}, (proxy, method, values) -> {
                    if (!method.getName().equals("getBoolean")) throw new AssertionError(method);
                    return enabled.contains(values[0]);
                });
        Context isolated = new ContextWrapper(platform) {
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                check("settings".equals(name), "unexpected rif preference file");
                return prefs;
            }
        };

        // The 5.6.22 search fragment passes its XML result objects to this ArrayAdapter.
        var row = loader.loadClass("r4.c").getConstructor(String.class, String.class, String.class, String.class);
        Object synccit = row.newInstance("History", SYNC, "Synccit", "");
        Object setup = row.newInstance("History", "SYNCCIT_PREFS", "Synccit settings", "");
        Object history = row.newInstance("History", "SAVE_HISTORY", "Save browsing history", "");
        Object mail = row.newInstance("Mail", "CHECK_REGULAR_MAIL", "Check regular mail", "");
        Object notify = row.newInstance("Notifications", NOTIFY, "New post notifications", "");
        Object manage = row.newInstance("Notifications", "MANAGE_NEW_POST_NOTIFICATIONS", "Manage subscriptions", "");
        List<Object> before = List.of(synccit, setup, history, mail, notify, manage);
        var ctor = loader.loadClass("r4.a$b").getDeclaredConstructor(Context.class, List.class);
        ctor.setAccessible(true);
        ArrayAdapter<?> adapter = (ArrayAdapter<?>) ctor.newInstance(isolated, new ArrayList<>(before));
        check(adapter.getCount() == before.size(), "enabled opt-out hits available");
        RetainedSearchScreen screen = new RetainedSearchScreen(isolated);
        screen.list.setAdapter(adapter);
        int[] changes = {0};
        adapter.registerDataSetObserver(new DataSetObserver() {
            @Override public void onChanged() { changes[0]++; }
        });
        Method resume = Class.forName("app.edbfi.extension.rifisfun.settings.RetiredSearch", true, loader)
                .getMethod("filterRetained", Activity.class);
        resume.invoke(null, screen);
        check(changes[0] == 0 && screen.list.selection == -1, "unchanged view is not refreshed");

        // Simulate the existing settings activity persisting the opt-out while search is covered.
        enabled.remove(SYNC);
        resume.invoke(null, screen);
        check(screen.list.getAdapter() == adapter, "same adapter retained on resume");
        check(adapter.getCount() == 4 && adapter.getItem(0) == history && adapter.getItem(1) == mail
                && adapter.getItem(2) == notify && adapter.getItem(3) == manage, "removes the disabled service’s hits while preserving enabled and normal hits");
        check(changes[0] == 1 && screen.list.selection == 0 && screen.list.offset == -17,
                "one notification and same first row pixel offset");
        resume.invoke(null, screen);
        check(changes[0] == 1, "continued resume does not repeat the update");

        // A queued worker result populated before opt-out must be filtered at adapter creation.
        enabled.remove(NOTIFY);
        ArrayAdapter<?> queued = (ArrayAdapter<?>) ctor.newInstance(isolated, new ArrayList<>(before));
        check(queued.getCount() == 2 && queued.getItem(0) == history && queued.getItem(1) == mail,
                "stock adapter constructor filters stale delivery on the foreground thread");
        System.out.println("rif Settings Search passed retained-list, scroll and delayed-result checks.");
    }

    private static final class RetainedSearchScreen extends Activity {
        final Viewport list;

        RetainedSearchScreen(Context context) throws Exception {
            attachBaseContext(context);
            list = Viewport.create(context);
        }

        @Override @SuppressWarnings("unchecked")
        public <T extends View> T findViewById(int id) {
            return id == android.R.id.list ? (T) list : null;
        }
    }

    private static final class Viewport extends ListView {
        private View anchor;
        private ListAdapter adapter;
        int selection;
        int offset;

        private Viewport(Context context) { super(context); }

        static Viewport create(Context context) throws Exception {
            // This viewport is a test double. Its framework constructor would require DeviceConfig
            // attribution that the isolated app_process shell does not have.
            Class<?> unsafeType = Class.forName("sun.misc.Unsafe");
            var field = unsafeType.getDeclaredField("theUnsafe");
            field.setAccessible(true);
            Viewport list = (Viewport) unsafeType.getMethod("allocateInstance", Class.class)
                    .invoke(field.get(null), Viewport.class);
            list.anchor = new View(context);
            list.anchor.layout(0, -12, 100, 27);
            list.selection = -1;
            return list;
        }

        @Override public ListAdapter getAdapter() { return adapter; }

        @Override public void setAdapter(ListAdapter adapter) { this.adapter = adapter; }

        @Override public int getListPaddingTop() { return 5; }

        @Override public int getFirstVisiblePosition() { return 2; }

        @Override public View getChildAt(int index) { return index == 0 ? anchor : null; }

        @Override public void setSelectionFromTop(int position, int y) {
            selection = position;
            offset = y;
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
