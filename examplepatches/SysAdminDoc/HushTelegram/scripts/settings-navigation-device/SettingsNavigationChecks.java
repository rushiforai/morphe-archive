package app.hushtelegram.navigationprobe;

import android.app.Activity;
import android.app.DialogFragment;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.LocaleList;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import org.json.JSONObject;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Real system input against the installed settings dialog. Never calls its Back method.
 * Platform contracts used by this harness:
 * https://developer.android.com/reference/android/app/UiAutomation
 * https://developer.android.com/develop/ui/views/layout/sw-keyboard
 * https://developer.android.com/reference/android/content/res/Configuration#setLocales(android.os.LocaleList)
 * https://developer.android.com/guide/navigation/custom-back/predictive-back-gesture
 */
@SuppressWarnings("deprecation")
public final class SettingsNavigationChecks extends Instrumentation {
    private Bundle arguments;
    private UiAutomation automation;
    private ClassLoader loader;
    private String mode, locale, packageName;
    private String leaseSocket, leaseCapability;
    private long deadline;
    private final Map<Resources, Configuration> originals = new IdentityHashMap<>();
    private final JSONObject checks = new JSONObject();
    private final JSONObject result = new JSONObject();

    @Override public void onCreate(Bundle args) { super.onCreate(args); arguments = args; start(); }

    @Override public void onStart() {
        Throwable failure = null;
        Map<String, Boolean> switches = null;
        String accounts = null;
        try {
            mode = arguments.getString("mode");
            locale = arguments.getString("locale");
            packageName = arguments.getString("package");
            deadline = Long.parseLong(arguments.getString("leaseExpiry"));
            leaseSocket = arguments.getString("leaseSocket");
            leaseCapability = arguments.getString("leaseCapability");
            require(leaseSocket != null && leaseSocket.matches("hushtelegram-nav-[0-9a-f]{32}") &&
                leaseCapability != null && leaseCapability.matches("[0-9a-f]{64}"), "No live lease ownership channel");
            require("button".equals(mode) || "gesture".equals(mode), "Unknown navigation mode");
            require("en".equals(locale) || "ar-XB".equals(locale), "Unknown test locale");
            require(packageName.equals(getTargetContext().getPackageName()), "Wrong instrumentation target");
            require(Build.VERSION.SDK_INT == 28 || Build.VERSION.SDK_INT == 36, "Expected API28 or API36");
            require(!"gesture".equals(mode) || Build.VERSION.SDK_INT == 36, "API28 has no edge Back gesture");
            loader = getTargetContext().getClassLoader();
            stage("connect accessibility service");
            guard();
            automation = getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
            android.accessibilityservice.AccessibilityServiceInfo service = automation.getServiceInfo();
            service.flags |= android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
            guard();
            automation.setServiceInfo(service);
            android.view.accessibility.AccessibilityManager a11y = getTargetContext().getSystemService(android.view.accessibility.AccessibilityManager.class);
            require(!a11y.isTouchExplorationEnabled(), "This system-input check requires touch exploration off; existing services were retained");
            stage("open settings"); open();
            switches = switches();
            accounts = accounts();
            stage("apply locale"); applyHostLocale();
            close(); open();
            guard();
            require(automation.setRotation(UiAutomation.ROTATION_FREEZE_0), "Could not freeze portrait rotation");
            settle();
            applyHostLocale();
            close(); open();
            stage("verify localized tree"); verifyTree();
            stage("nested system Back"); nestedBack();
            stage("IME search and rotation"); searchBackAndRotation();
            require(switches.equals(switches()), "A saved switch changed during navigation");
            require(accounts.equals(accounts()), "Account activation, identity or selection changed");
            checks.put("switchesRetained", true).put("accountsRetained", true);
        } catch (Throwable error) { failure = unwrap(error); }
        finally {
            stage("preserve state and restore environment");
            try {
                if (switches != null) require(switches.equals(switches()), "Saved switches changed during a failed check");
                if (accounts != null) require(accounts.equals(accounts()), "Accounts changed during a failed check");
            } catch (Throwable preservation) { if (failure == null) failure = unwrap(preservation); else failure.addSuppressed(unwrap(preservation)); }
            try {
                guard();
                onMain(() -> {
                    for (Map.Entry<Resources, Configuration> saved : originals.entrySet())
                        saved.getKey().updateConfiguration(saved.getValue(), saved.getKey().getDisplayMetrics());
                });
                for (Map.Entry<Resources, Configuration> saved : originals.entrySet())
                    require(saved.getKey().getConfiguration().equals(saved.getValue()), "Process locale configuration did not restore exactly");
                if (automation != null) {
                    guard();
                    require(automation.setRotation(UiAutomation.ROTATION_UNFREEZE), "Could not release temporary rotation freeze");
                }
                checks.put("processLocaleRestored", true);
            } catch (Throwable cleanup) {
                if (failure == null) failure = unwrap(cleanup); else failure.addSuppressed(unwrap(cleanup));
            }
            try { if (automation != null) close(); }
            catch (Throwable cleanup) { if (failure == null) failure = unwrap(cleanup); else failure.addSuppressed(unwrap(cleanup)); }
            try {
                result.put("schemaVersion", 1).put("runId", arguments.getString("runId"))
                    .put("api", Build.VERSION.SDK_INT).put("mode", mode).put("locale", locale)
                    .put("localeScope", "process-local configuration")
                    .put("fontScale", arguments.getString("fontScale")).put("checks", checks)
                    .put("passed", failure == null);
                if (failure != null) result.put("error", failure.toString());
                Bundle output = new Bundle();
                output.putString("stream", "NAV_RESULT:" + result + "\n");
                finish(failure == null ? -1 : 0, output);
            } catch (Throwable outputFailure) { finish(0, new Bundle()); }
        }
    }

    private void open() throws Exception {
        guard();
        Intent intent = new Intent("android.intent.action.APPLICATION_PREFERENCES")
            .setClassName(packageName, arguments.getString("activity", "org.telegram.ui.LaunchActivity"))
            .putExtra("app.hushtelegram.extension.telegram.OPEN_SETTINGS", true)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        stage("dispatch settings activity");
        onMain(() -> getTargetContext().startActivity(intent));
        stage("wait for settings dialog");
        long until = Math.min(deadline, System.currentTimeMillis() + 15000);
        while (dialog() == null && System.currentTimeMillis() < until) {
            guard();
            Thread.sleep(100);
        }
        settle();
        require(dialog() != null, "Installed target did not open SettingsDialog");
    }

    private Activity host() throws Exception {
        Class<?> entry = loader.loadClass("app.hushtelegram.extension.telegram.settings.SettingsEntry");
        java.lang.ref.WeakReference<?> reference = (java.lang.ref.WeakReference<?>) field(entry, "host").get(null);
        Activity activity = reference == null ? null : (Activity) reference.get();
        require(activity != null, "No settings activity host");
        return activity;
    }

    private DialogFragment dialog() throws Exception {
        final DialogFragment[] found = {null};
        onMain(() -> {
            try {
                Class<?> entry = loader.loadClass("app.hushtelegram.extension.telegram.settings.SettingsEntry");
                java.lang.ref.WeakReference<?> reference = (java.lang.ref.WeakReference<?>) field(entry, "host").get(null);
                Activity current = reference == null ? null : (Activity) reference.get();
                if (current == null) return;
                for (android.app.Fragment fragment : current.getFragmentManager().getFragments())
                    if (fragment != null && fragment.getClass().getName().equals("app.hushtelegram.extension.telegram.settings.SettingsDialog"))
                        found[0] = (DialogFragment) fragment;
            } catch (Exception error) { throw new RuntimeException(error); }
        });
        return found[0] != null && found[0].getDialog() != null && found[0].getDialog().isShowing() ? found[0] : null;
    }

    private void close() throws Exception {
        DialogFragment current = dialog();
        if (current != null) { guard(); onMain(() -> current.dismissAllowingStateLoss()); }
        settle();
    }

    private void applyLocale(Activity activity) {
        Resources[] resources = {getTargetContext().getApplicationContext().getResources(), activity.getResources()};
        for (Resources resource : resources) {
            originals.putIfAbsent(resource, new Configuration(resource.getConfiguration()));
            Configuration scoped = new Configuration(resource.getConfiguration());
            scoped.setLocales(LocaleList.forLanguageTags(locale));
            resource.updateConfiguration(scoped, resource.getDisplayMetrics());
        }
    }

    private void applyHostLocale() {
        guard();
        onMain(() -> {
            try { applyLocale(host()); }
            catch (Exception error) { throw new RuntimeException(error); }
        });
    }

    private String label(String english) throws Exception {
        return (String) loader.loadClass("app.hushtelegram.extension.shared.L10n")
            .getMethod("t", Context.class, String.class).invoke(null, getTargetContext(), english);
    }

    private void verifyTree() throws Exception {
        DialogFragment current = dialog();
        boolean rtl = "ar-XB".equals(locale);
        String backLabel = label("Back"), searchLabel = label("Search settings");
        require(!rtl || (!"Back".equals(backLabel) && !"Search settings".equals(searchLabel)), "RTL labels were not localized");
        AccessibilityNodeInfo root = root();
        AccessibilityNodeInfo back = node(root, backLabel, "android.widget.Button");
        AccessibilityNodeInfo search = node(root, searchLabel, "android.widget.EditText");
        require(back != null && search != null && back.isEnabled() && search.isEnabled(), "Localized controls missing from service tree");
        final View[] backView = {null};
        onMain(() -> {
            require(current.getView().getLayoutDirection() == (rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR), "Real dialog layout direction differs");
            backView[0] = findDescription(current.getView(), backLabel);
            require(backView[0] instanceof ImageButton, "No actual Back image button");
            ImageButton image = (ImageButton) backView[0];
            require(image.getDrawable().isAutoMirrored() && image.getDrawable().getLayoutDirection() == image.getLayoutDirection(), "Back drawable does not mirror");
            ViewGroup bar = (ViewGroup) image.getParent();
            TextView brand = null;
            for (int i = 0; i < bar.getChildCount(); i++) {
                View sibling = bar.getChildAt(i);
                if (sibling instanceof TextView && "HushTelegram".equalsIgnoreCase(((TextView)sibling).getText().toString())) {
                    require(brand == null, "Ambiguous navigation brand label"); brand = (TextView)sibling;
                }
            }
            require(brand != null, "No navigation brand beside Back");
            int[] backAt = new int[2], brandAt = new int[2];
            image.getLocationOnScreen(backAt); brand.getLocationOnScreen(brandAt);
            require(rtl ? backAt[0] > brandAt[0] : backAt[0] < brandAt[0], "Back/navigation geometry was not mirrored");
            require(Math.abs(current.getResources().getConfiguration().fontScale - Float.parseFloat(arguments.getString("fontScale"))) < .01f, "Requested system font scale is not effective");
        });
        checks.put("localizedServiceTree", true).put("backAndNavigationMirrored", true).put("effectiveFontScale", true);
    }

    private void nestedBack() throws Exception {
        visibleClick("About");
        require("".equals(route()) && expanded("About"), "The About section did not open in place");
        visible("Changed switches");
        Position home = position();
        visibleClick("Changed switches");
        require("changed".equals(route()), "The Changed switches page did not open");
        if ("gesture".equals(mode)) cancelGesture();
        back();
        require("".equals(route()) && dialog() != null, "System Back did not return Changed switches to home");
        require(expanded("About"), "System Back closed the open About section");
        samePosition(home, position(), "System Back from Changed switches lost the home scroll anchor");
        checks.put("systemBackNested", true).put("nestedScrollRetained", true);
    }

    private boolean expanded(String section) throws Exception {
        java.lang.reflect.Method open = navigation().getClass().getDeclaredMethod("isExpanded", String.class);
        open.setAccessible(true);
        return (Boolean) open.invoke(navigation(), section);
    }

    private void searchBackAndRotation() throws Exception {
        Position home = position();
        setQuery("a", true);
        require(imeVisible(), "Actual software keyboard did not become visible; windows " + imeWindows());
        back();
        require(!imeVisible() && "a".equals(query()) && dialog() != null, "First system Back did not dismiss only IME");
        if ("gesture".equals(mode)) cancelGesture();
        back();
        require("".equals(query()) && dialog() != null, "Second system Back did not clear search");
        samePosition(home, position(), "Search Back lost the home scroll anchor");
        checks.put("imeFirstDismissal", true).put("systemBackSearch", true).put("homeScrollRetained", true);
        setQuery("a", false);
        verifySearchSwitches();
        Position before = position();
        for (int i = 0; i < 4 && position().equals(before); i++) scroll();
        Position searched = position();
        require(!searched.equals(before), "Installed build has no measurable search scroll; this acceptance needs a full settings build");
        guard();
        require(automation.setRotation(UiAutomation.ROTATION_FREEZE_90), "Could not rotate to landscape");
        settle();
        require("a".equals(query()), "Rotation lost the search query");
        guard();
        require(automation.setRotation(UiAutomation.ROTATION_FREEZE_0), "Could not rotate back to portrait");
        settle();
        require("a".equals(query()), "Portrait restoration lost the search query");
        samePosition(searched, position(), "Rotation did not restore the search scroll anchor");
        checks.put("queryAndScrollRotationRestored", true);
        back(); back();
        require(dialog() == null, "Final system Back did not close settings");
        checks.put("systemBackClosesHome", true);
    }

    private void verifySearchSwitches() throws Exception {
        AccessibilityNodeInfo tree = root();
        final int[] observed = {0};
        onMain(() -> {
            try {
                ListView list = (ListView) field(navigation().getClass(), "list").get(navigation());
                for (int i = 0; i < list.getChildCount(); i++) {
                    Object item = list.getItemAtPosition(list.getFirstVisiblePosition() + i);
                    if (!(item instanceof android.preference.SwitchPreference)) continue;
                    android.preference.SwitchPreference setting = (android.preference.SwitchPreference)item;
                    AccessibilityNodeInfo widget = checkable(tree, setting.getTitle().toString());
                    require(widget != null && widget.isChecked() == setting.isChecked(), "Saved switch state differs in the real service tree");
                    observed[0]++;
                }
            } catch (Exception error) { throw new RuntimeException(error); }
        });
        require(observed[0] > 0, "No visible saved switch state observed in service tree");
        checks.put("switchStatesInServiceTree", true);
    }

    private static AccessibilityNodeInfo checkable(AccessibilityNodeInfo node, String title) {
        if (node == null) return null;
        if (node.isVisibleToUser() && node.isCheckable() && node(node, title, null) != null) return node;
        for (int i = 0; i < node.getChildCount(); i++) { AccessibilityNodeInfo found = checkable(node.getChild(i), title); if (found != null) return found; }
        return null;
    }

    private void setQuery(String text, boolean showIme) throws Exception {
        AccessibilityNodeInfo search = node(root(), label("Search settings"), "android.widget.EditText");
        require(search != null, "Search control unavailable");
        if (showIme) {
            Rect bounds = new Rect(); search.getBoundsInScreen(bounds); tap(bounds.centerX(), bounds.centerY());
        }
        Bundle value = new Bundle(); value.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text);
        guard(); require(search.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, value), "Service tree refused search input");
        settle();
        if (showIme) {
            long until = Math.min(deadline, System.currentTimeMillis() + 5000);
            while (!imeVisible() && System.currentTimeMillis() < until) { guard(); Thread.sleep(100); }
        }
    }

    private AccessibilityNodeInfo root() throws Exception {
        String back = label("Back");
        for (AccessibilityWindowInfo window : automation.getWindows()) {
            AccessibilityNodeInfo candidate = window.getRoot();
            if (candidate != null && packageName.contentEquals(candidate.getPackageName()) && node(candidate, back, "android.widget.Button") != null)
                return candidate;
        }
        throw new AssertionError("No settings service tree for the exact installed target");
    }

    private static AccessibilityNodeInfo node(AccessibilityNodeInfo root, String text, String type) {
        if (root == null) return null;
        if (root.isVisibleToUser() && (type == null || type.contentEquals(root.getClassName())) &&
                (text.equals(String.valueOf(root.getText())) || text.equals(String.valueOf(root.getContentDescription())))) return root;
        for (int i = 0; i < root.getChildCount(); i++) { AccessibilityNodeInfo found = node(root.getChild(i), text, type); if (found != null) return found; }
        return null;
    }

    private void visible(String english) throws Exception {
        for (int i = 0; i < 10; i++) { if (node(root(), label(english), null) != null) return; scroll(); }
        throw new AssertionError("Required settings row unavailable: " + english);
    }

    private void visibleClick(String english) throws Exception {
        visible(english);
        AccessibilityNodeInfo target = node(root(), label(english), null);
        while (target != null && !target.isClickable()) target = target.getParent();
        guard(); require(target != null && target.performAction(AccessibilityNodeInfo.ACTION_CLICK), "Settings row refused click: " + english);
        settle();
    }

    private void scroll() throws Exception {
        AccessibilityNodeInfo list = findScrollable(root());
        guard(); require(list != null, "No scrollable settings list");
        list.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD); settle();
    }

    private static AccessibilityNodeInfo findScrollable(AccessibilityNodeInfo node) {
        if (node == null) return null;
        if (node.isScrollable()) return node;
        for (int i = 0; i < node.getChildCount(); i++) { AccessibilityNodeInfo found = findScrollable(node.getChild(i)); if (found != null) return found; }
        return null;
    }

    private boolean imeVisible() throws Exception {
        DialogFragment current = dialog();
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsets insets = current.getDialog().getWindow().getDecorView().getRootWindowInsets();
            return insets != null && insets.isVisible(WindowInsets.Type.ime());
        }
        for (AccessibilityWindowInfo window : automation.getWindows()) {
            Rect bounds = new Rect(); window.getBoundsInScreen(bounds);
            if (window.getType() == AccessibilityWindowInfo.TYPE_INPUT_METHOD && !bounds.isEmpty()) return true;
        }
        return false;
    }
    private String imeWindows() {
        StringBuilder types = new StringBuilder();
        for (AccessibilityWindowInfo window : automation.getWindows()) {
            Rect bounds = new Rect(); window.getBoundsInScreen(bounds);
            types.append(window.getType()).append(':').append(bounds.width()).append('x').append(bounds.height()).append(' ');
        }
        return types.toString();
    }

    private void back() throws Exception {
        if ("gesture".equals(mode)) gesture(false);
        else {
            long time = SystemClock.uptimeMillis();
            guard(); require(automation.injectInputEvent(new KeyEvent(time, time, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_BACK, 0), true), "System Back DOWN failed");
            guard(); require(automation.injectInputEvent(new KeyEvent(time, SystemClock.uptimeMillis(), KeyEvent.ACTION_UP, KeyEvent.KEYCODE_BACK, 0), true), "System Back UP failed");
        }
        settle();
    }

    private void cancelGesture() throws Exception {
        String beforeRoute = route(), beforeQuery = query(); Position before = position();
        gesture(true); settle();
        require(dialog() != null && beforeRoute.equals(route()) && beforeQuery.equals(query()), "Cancelled gesture changed settings navigation");
        samePosition(before, position(), "Cancelled gesture moved the list");
        checks.put("cancelledGestureRetainsState", true);
    }

    private void gesture(boolean cancel) throws Exception {
        Bitmap before = automation.takeScreenshot();
        require(before != null, "No system screenshot for gesture recognition");
        float y = before.getHeight() / 2f, end = before.getWidth() * .45f;
        long time = SystemClock.uptimeMillis();
        boolean released = false;
        try {
            motion(time, MotionEvent.ACTION_DOWN, 1, y);
            for (int i = 1; i <= 12; i++) { motion(time, MotionEvent.ACTION_MOVE, 1 + (end - 1) * i / 12, y); Thread.sleep(25); }
            Thread.sleep(150);
            Bitmap progressed = automation.takeScreenshot();
            require(progressed != null && progressed.getWidth() == before.getWidth() && progressed.getHeight() == before.getHeight(), "Gesture screen changed dimensions");
            int changed = 0;
            int half = Math.round(80 * getTargetContext().getResources().getDisplayMetrics().density);
            for (int x = 0; x < before.getWidth() / 4; x += 2)
                for (int py = Math.max(0, (int)y - half); py < Math.min(before.getHeight(), (int)y + half); py += 2)
                    if (before.getPixel(x, py) != progressed.getPixel(x, py)) changed++;
            progressed.recycle();
            require(changed > 32, "No visible system Back gesture progress; cancellation cannot be counted");
            result.put(cancel ? "cancelledGestureProgressPixels" : "committedGestureProgressPixels", changed);
            if (cancel) {
                for (int i = 1; i <= 12; i++) { motion(time, MotionEvent.ACTION_MOVE, end - (end - 1) * i / 12, y); Thread.sleep(25); }
                motion(time, MotionEvent.ACTION_UP, 1, y);
            } else motion(time, MotionEvent.ACTION_UP, end, y);
            released = true;
        } finally {
            if (!released) {
                guard();
                MotionEvent rollback = MotionEvent.obtain(time, SystemClock.uptimeMillis(), MotionEvent.ACTION_CANCEL, 1, y, 0);
                rollback.setSource(InputDevice.SOURCE_TOUCHSCREEN);
                try { automation.injectInputEvent(rollback, true); } finally { rollback.recycle(); }
            }
            before.recycle();
        }
    }

    private void tap(float x, float y) throws Exception {
        long time = SystemClock.uptimeMillis(); motion(time, MotionEvent.ACTION_DOWN, x, y); motion(time, MotionEvent.ACTION_UP, x, y); settle();
    }
    private void motion(long down, int action, float x, float y) {
        guard(); MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { require(automation.injectInputEvent(event, true), "System touch injection failed"); }
        finally { event.recycle(); }
    }

    private Object navigation() throws Exception {
        DialogFragment current = dialog(); require(current != null, "Settings unexpectedly closed");
        Object page = current.getChildFragmentManager().findFragmentById(0x48464301);
        require(page != null, "No restored settings preference fragment");
        return field(page.getClass(), "navigation").get(page);
    }
    private String route() throws Exception { return (String) field(navigation().getClass(), "route").get(navigation()); }
    private String query() throws Exception { return (String) field(navigation().getClass(), "query").get(navigation()); }
    private Position position() throws Exception {
        final Position[] position = {null};
        onMain(() -> {
            try {
                ListView list = (ListView) field(navigation().getClass(), "list").get(navigation());
                position[0] = new Position(list.getFirstVisiblePosition(), list.getChildAt(0) == null ? 0 : list.getChildAt(0).getTop());
            } catch (Exception error) { throw new RuntimeException(error); }
        });
        return position[0];
    }
    private static final class Position {
        final int index, top;
        Position(int index, int top) { this.index = index; this.top = top; }
        @Override public boolean equals(Object other) { return other instanceof Position && index == ((Position)other).index && Math.abs(top - ((Position)other).top) <= 2; }
        @Override public String toString() { return index + "/" + top; }
    }
    private static void samePosition(Position expected, Position actual, String message) { require(expected.equals(actual), message + " (" + expected + " -> " + actual + ")"); }

    private Map<String, Boolean> switches() throws Exception {
        Map<String, Boolean> snapshot = new TreeMap<>();
        for (Field setting : loader.loadClass("app.hushtelegram.extension.telegram.settings.Settings").getFields()) {
            if (!java.lang.reflect.Modifier.isStatic(setting.getModifiers())) continue;
            Object instance = setting.get(null);
            if (instance == null) continue;
            try { Object value = instance.getClass().getMethod("savedValue").invoke(instance); if (value instanceof Boolean) snapshot.put(setting.getName(), (Boolean)value); }
            catch (NoSuchMethodException ignored) { }
        }
        require(!snapshot.isEmpty(), "No actual saved settings switches observed");
        return snapshot;
    }
    private String accounts() throws Exception {
        Class<?> users = loader.loadClass("org.telegram.messenger.UserConfig");
        int count = users.getField("MAX_ACCOUNT_COUNT").getInt(null);
        StringBuilder state = new StringBuilder().append(users.getField("selectedAccount").getInt(null));
        for (int i = 0; i < count; i++) {
            Object user = users.getMethod("getInstance", int.class).invoke(null, i);
            state.append('/').append(users.getMethod("isClientActivated").invoke(user));
            state.append('/').append(users.getMethod("getClientUserId").invoke(user));
        }
        return state.toString(); // Compared in memory only. No account identifiers enter output.
    }
    private static Field field(Class<?> type, String name) throws Exception {
        while (type != null) { try { Field field = type.getDeclaredField(name); field.setAccessible(true); return field; } catch (NoSuchFieldException missing) { type = type.getSuperclass(); } }
        throw new NoSuchFieldException(name);
    }
    private static View findDescription(View view, String description) {
        if (description.equals(String.valueOf(view.getContentDescription()))) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup)view).getChildCount(); i++) { View found = findDescription(((ViewGroup)view).getChildAt(i), description); if (found != null) return found; }
        return null;
    }
    private void settle() throws Exception {
        guard(); stage("wait for accessibility idle"); automation.waitForIdle(250, 5000);
        Thread.sleep(250); stage("wait for main callback"); onMain(() -> {});
        stage("settled");
    }
    private void onMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) { guard(); action.run(); return; }
        Handler handler = new Handler(Looper.getMainLooper());
        CountDownLatch done = new CountDownLatch(1);
        AtomicBoolean cancelled = new AtomicBoolean();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Runnable task = () -> {
            try {
                if (!cancelled.get()) {
                    guard();
                    if (!cancelled.get()) action.run();
                }
            }
            catch (Throwable error) { failure.set(error); }
            finally { done.countDown(); }
        };
        require(handler.post(task), "Main thread refused navigation callback");
        try {
            long until = Math.min(deadline, System.currentTimeMillis() + 5000);
            while (!done.await(100, TimeUnit.MILLISECONDS)) {
                guard();
                require(System.currentTimeMillis() < until, "Main navigation callback timed out");
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new AssertionError("Main navigation callback interrupted", interrupted);
        } finally { cancelled.set(true); handler.removeCallbacks(task); }
        Throwable error = failure.get();
        if (error instanceof Error) throw (Error)error;
        if (error instanceof RuntimeException) throw (RuntimeException)error;
        if (error != null) throw new AssertionError("Main navigation callback failed", error);
    }
    private void stage(String name) {
        Bundle progress = new Bundle(); progress.putString("stream", "NAV_STAGE:" + name + "\n"); sendStatus(0, progress);
    }
    private void guard() {
        require(System.currentTimeMillis() < deadline, "Lease expired during system input; test stopped");
        try (LocalSocket socket = new LocalSocket()) {
            socket.connect(new LocalSocketAddress(leaseSocket, LocalSocketAddress.Namespace.ABSTRACT));
            socket.setSoTimeout(1000);
            socket.getOutputStream().write((leaseCapability + "\n").getBytes(StandardCharsets.US_ASCII));
            require(socket.getInputStream().read() == 1, "Whole-device lease ownership lost; test stopped");
        } catch (java.io.IOException unavailable) {
            throw new AssertionError("Live whole-device lease check unavailable; test stopped", unavailable);
        }
    }
    private static void require(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    private static Throwable unwrap(Throwable error) { while ((error instanceof java.lang.reflect.InvocationTargetException || error instanceof RuntimeException) && error.getCause() != null) error = error.getCause(); return error; }
}
