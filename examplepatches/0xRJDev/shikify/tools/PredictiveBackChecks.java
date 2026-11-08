import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.webkit.WebView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import android.widget.FrameLayout;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/** Real compiled runtime + Android views; fake dispatcher, no navigation of the installed app. */
public final class PredictiveBackChecks {
    static int checks;
    static Class<?> guardClass;
    static Constructor<?> guardConstructor;
    static Method attach, update, detach, needs;
    static final String UI = "com.rubenmayayo.reddit.ui.";
    static void check(boolean result, String message) {
        if (!result) throw new AssertionError(message);
        checks++;
        System.out.println("PASS: " + message);
    }
    public static final class Dispatcher implements OnBackInvokedDispatcher {
        OnBackInvokedCallback callback;
        int registrations, removals;
        @Override public void registerOnBackInvokedCallback(int priority, OnBackInvokedCallback value) {
            check(priority == PRIORITY_DEFAULT, "Custom UI callback uses default priority, preserving IME precedence");
            if (callback != null) throw new AssertionError("Duplicate callback registration");
            callback = value; registrations++;
        }
        @Override public void unregisterOnBackInvokedCallback(OnBackInvokedCallback value) {
            if (callback != value) throw new AssertionError("Wrong callback removed");
            callback = null; removals++;
        }
    }
    public static final class BackActivity extends RuntimeUiChecks.FakeActivity {
        final Dispatcher dispatcher = new Dispatcher();
        boolean root, dirty;
        int backCalls, transitions;
        public Object c, i0, I;
        public Reply replyFieldView;
        public WebView webView;
        public View mediaController;
        BackActivity(Context context) throws Exception { super(context); }
        @Override public OnBackInvokedDispatcher getOnBackInvokedDispatcher() { return dispatcher; }
        @Override public boolean isTaskRoot() { return root; }
        @Override public void onBackPressed() { backCalls++; dirty = false; }
        @Override public void overridePendingTransition(int enter, int exit) { transitions++; }
        public boolean a1() { return dirty; }
    }
    public static final class App extends Application {
        int registrations;
        ActivityLifecycleCallbacks lifecycle;
        @Override public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks value) {
            registrations++; lifecycle = value;
        }
    }
    public static final class Reply {
        String text = "";
        public String getText() { return text; }
    }
    public static final class Adapter { public ArrayList<Object> b = new ArrayList<>(); }
    public static final class Controller { public Builder a; }
    public static final class Builder { public View k, l; public Integer q = 3; }
    public static final class Drawer extends FrameLayout {
        final View panel;
        Drawer(Context context) { super(context); panel = new View(context); addView(panel); }
        public View f(int gravity) { return panel; }
        public static boolean m(View panel) { return panel.isSelected(); }
    }
    public static final class Browser extends WebView {
        boolean history;
        Browser(Context context) { super(context); }
        @Override public boolean canGoBack() { return history; }
    }
    public static final class UniversalMediaController extends FrameLayout {
        public boolean z = true;
        int hides;
        UniversalMediaController(Context context) { super(context); }
        @Override public boolean hasFocus() { return z; }
        public void a() { hides++; z = false; }
    }
    static void field(Object instance, String name, Object value) throws Exception {
        Field field = guardClass.getDeclaredField(name); field.setAccessible(true); field.set(instance, value);
    }
    static Object guard(BackActivity activity, String handler, boolean drawer, Map<String,Boolean> preferences) throws Exception {
        Object value = guardConstructor.newInstance(activity);
        field(value, "handler", handler);
        field(value, "usesDrawer", drawer);
        if (preferences != null) field(value, "preferences", Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[] { SharedPreferences.class },
            (proxy, method, args) -> {
                if (method.getName().equals("getBoolean")) return preferences.getOrDefault((String)args[0], (Boolean)args[1]);
                throw new UnsupportedOperationException(method.getName());
            }));
        return value;
    }
    static Object uninitialized(Class<?> target) throws Exception {
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Object unsafe = null;
        for (Field field : unsafeClass.getDeclaredFields()) if (field.getType() == unsafeClass) {
            field.setAccessible(true); unsafe = field.get(null); break;
        }
        return unsafeClass.getMethod("allocateInstance", Class.class).invoke(unsafe, target);
    }
    public static void main(String[] args) {
        try { run(args); }
        catch (Throwable error) { error.printStackTrace(System.out); System.exit(1); }
    }
    static void run(String[] args) throws Exception {
        ClassLoader loader = RuntimeUiChecks.initialize(args);
        Context context = RuntimeUiChecks.context;
        Class<?> runtime = Class.forName("app.morphe.extension.boost.PredictiveBackTweaks", true, loader);
        check((Boolean)runtime.getMethod("isSupported").invoke(null), "Android 13+ predictive Back path enabled");
        App app = new App();
        runtime.getMethod("install", Object.class).invoke(null, app);
        runtime.getMethod("install", Object.class).invoke(null, app);
        check(app.registrations == 1 && app.lifecycle != null, "Application hook installs lifecycle callbacks once");

        guardClass = Class.forName("app.morphe.extension.boost.PredictiveBackTweaks$Api33$Guard", true, loader);
        guardConstructor = guardClass.getDeclaredConstructor(Activity.class); guardConstructor.setAccessible(true);
        attach=guardClass.getDeclaredMethod("attach"); attach.setAccessible(true);
        update=guardClass.getDeclaredMethod("update"); update.setAccessible(true);
        detach=guardClass.getDeclaredMethod("detach"); detach.setAccessible(true);
        needs=guardClass.getDeclaredMethod("needsLegacyBack", Activity.class); needs.setAccessible(true);

        // Check real Boost's declaring classes; simulated states below use these exact strategies.
        String[][] owners = {{UI+"comments.CommentsActivity", "ih"},
            {UI+"activities.ImageActivity", "di0"}, {UI+"activities.MediaVideoActivity", "gq1"},
            {UI+"submissions.subreddit.MainActivity", UI+"submissions.subreddit.MainActivity"},
            {UI+"activities.WebViewActivity", UI+"activities.WebViewActivity"},
            {UI+"compose.ReplyActivity", UI+"compose.FormatActivity"},
            {UI+"messages.thread.ThreadActivity", UI+"messages.thread.ThreadActivity"}};
        for (String[] pair: owners) check(Class.forName(pair[0], false, loader).getMethod("onBackPressed")
            .getDeclaringClass().getName().equals(pair[1]), "Verified original Back owner for " + pair[0]);

        BackActivity ordinary = new BackActivity(context);
        Object normal = guard(ordinary, "ih", false, null);
        attach.invoke(normal); update.invoke(normal);
        check(ordinary.dispatcher.callback == null && ordinary.backCalls == 0,
            "Comments install no consuming callback: Android owns cross-activity preview and cancellation");
        runtime.getMethod("legacyTransition", Activity.class, int.class, int.class).invoke(null, ordinary, 0, 0);
        check(ordinary.transitions == 0, "Comments finish cannot force a zero-duration transition on Android 13+");
        detach.invoke(normal);

        BackActivity editor = new BackActivity(context);
        Object form = guard(editor, UI+"compose.FormatActivity", false, null);
        attach.invoke(form);
        check(editor.dispatcher.callback == null, "Empty reply editor permits native predictive exit");
        editor.dirty = true; update.invoke(form); update.invoke(form);
        check(editor.dispatcher.callback != null && editor.dispatcher.registrations == 1 && editor.backCalls == 0,
            "Draft text registers one prompt callback without acting before commit");
        editor.dispatcher.callback.onBackInvoked();
        check(editor.backCalls == 1 && editor.dispatcher.callback == null,
            "Committed draft Back calls original handler once and updates callback state");
        editor.dirty = true; update.invoke(form); detach.invoke(form);
        check(editor.dispatcher.callback == null && editor.backCalls == 1,
            "Pause/detach removes callback without dispatching another Back");
        editor.window.getDecorView().getViewTreeObserver().dispatchOnPreDraw();
        check(editor.dispatcher.callback == null, "Detached pre-draw observer cannot register stale callbacks");

        BackActivity thread = new BackActivity(context); thread.replyFieldView = new Reply();
        Object message = guard(thread, UI+"messages.thread.ThreadActivity", false, null);
        attach.invoke(message);
        check(thread.dispatcher.callback == null, "Empty message permits native exit");
        thread.replyFieldView.text = "Unsaved reply"; update.invoke(message);
        check(thread.dispatcher.callback != null, "Unsaved message keeps native draft prompt");
        detach.invoke(message);

        BackActivity selected = new BackActivity(context); Adapter adapter = new Adapter(); selected.I = adapter;
        Object picker = guard(selected, UI+"search.MultiPickSubredditActivity", false, null);
        attach.invoke(picker);
        check(selected.dispatcher.callback == null, "Empty multi-picker permits native exit");
        adapter.b.add(new Object()); update.invoke(picker);
        check(selected.dispatcher.callback != null, "Multi-picker selection preserves its original completion action");
        detach.invoke(picker);

        BackActivity browser = new BackActivity(context); Browser web = (Browser)uninitialized(Browser.class);
        browser.webView=web;
        Object history = guard(browser, UI+"activities.WebViewActivity", false, null);
        attach.invoke(history);
        check(browser.dispatcher.callback == null, "Browser with no history permits native screen exit");
        web.history=true; update.invoke(history);
        check(browser.dispatcher.callback != null && browser.backCalls == 0, "Browser history is handled before leaving the screen");
        web.history=false; update.invoke(history);
        check(browser.dispatcher.callback == null, "Exhausted browser history restores native predictive screen exit");
        detach.invoke(history);

        BackActivity gif = new BackActivity(context);
        UniversalMediaController controls = new UniversalMediaController(context); gif.mediaController=controls;
        Object media = guard(gif, "di0", false, null); attach.invoke(media);
        check(gif.dispatcher.callback != null && controls.z, "Focused GIF controls intercept Back without hiding during preview");
        gif.dispatcher.callback.onBackInvoked();
        check(controls.hides == 1 && gif.backCalls == 0 && gif.dispatcher.callback == null,
            "First GIF Back hides controls; subsequent screen exit is predictive");
        detach.invoke(media);

        BackActivity root = new BackActivity(context); root.root = true;
        Controller controller = new Controller(); Builder builder = new Builder(); controller.a = builder;
        Drawer drawer = new Drawer(context); builder.k=drawer; builder.l=drawer.panel; root.c=controller;
        Map<String,Boolean> preferences = new HashMap<>();
        preferences.put("pref_ask_exit", false); preferences.put("pref_double_exit", false);
        Object main = guard(root, UI+"submissions.subreddit.MainActivity", true, preferences);
        attach.invoke(main);
        check(root.dispatcher.callback == null, "Root with exit prompts disabled permits native back-to-home preview");
        drawer.panel.setSelected(true); update.invoke(main);
        check(root.dispatcher.callback != null && drawer.panel.isSelected(), "Open drawer intercepts Back without closing during preview");
        drawer.panel.setSelected(false); update.invoke(main);
        check(root.dispatcher.callback == null, "Closed drawer releases Back to Android");
        preferences.put("pref_ask_exit", true); update.invoke(main);
        check(root.dispatcher.callback != null, "Root exit confirmation preference remains effective");
        preferences.put("pref_ask_exit", false); preferences.put("pref_double_exit", true); update.invoke(main);
        check(root.dispatcher.callback != null, "Root double-back preference remains effective");
        root.root=false; update.invoke(main);
        check(root.dispatcher.callback == null, "Non-root feed ignores root exit preferences and permits predictive exit");
        detach.invoke(main);
        root.c=null; root.i0=controller; drawer.panel.setSelected(true);
        Object second = guard(root, UI+"submissions.subreddit.SubredditBaseActivity", true, null);
        attach.invoke(second);
        check(root.dispatcher.callback != null, "Subreddit-specific drawer also preserves its Back handler");
        detach.invoke(second);

        for (String owner: new String[] {UI+"submit.SubmitActivity", UI+"submit.v2.SubmitGenericActivity",
                UI+"submit.SubmitCrosspostActivity", UI+"activities.IndentActivity", "future.custom.Override"}) {
            BackActivity activity = new BackActivity(context); Object conservative=guard(activity,owner,false,null);
            attach.invoke(conservative);
            check(activity.dispatcher.callback != null, "Retained confirmation/result handler: " + owner);
            detach.invoke(conservative);
        }
        System.out.println("PREDICTIVE BACK CHECKS PASSED: " + checks);
        System.exit(0);
    }
}
