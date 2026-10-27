package app.hushfeed.verification;

import android.app.Activity;
import android.app.Application;
import android.app.Fragment;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.util.Log;
import android.view.View;
import android.widget.ListView;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.lang.ref.WeakReference;
import java.security.MessageDigest;
import java.util.concurrent.atomic.AtomicBoolean;

/** Owned settings navigation only. No global dispatch, social input, preference writes or native getters. */
@SuppressWarnings("deprecation")
public final class PineDramaCoreProbe extends Instrumentation {
    private static final String TAG = "HushfeedPineCore";
    private static final String UTILS = "app.morphe.extension.shared.Utils";
    private static final String FRAGMENT = "app.morphe.extension.tiktok.settings.preference.TikTokPreferenceFragment";
    private static final AtomicBoolean STARTED = new AtomicBoolean();
    private static final AtomicBoolean BUSY = new AtomicBoolean();
    private static WeakReference<Activity> nativeOwner = new WeakReference<>(null);
    private static WeakReference<PreferenceFragment> settingsOwner = new WeakReference<>(null);

    @Override public Application newApplication(ClassLoader loader, String name, Context context)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        Application app = super.newApplication(loader, name, context);
        if (STARTED.compareAndSet(false, true)) {
            Thread thread = new Thread(() -> listen(app), "hushfeed-pine-core");
            thread.setDaemon(true);
            thread.start();
        }
        return app;
    }

    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    @Override public void onStart() { }

    private void listen(Context context) {
        try {
            long deadline = android.os.SystemClock.elapsedRealtime() + 120_000L;
            Class<?> utils = context.getClassLoader().loadClass(UTILS);
            while (utils.getMethod("getContext").invoke(null) == null) {
                if (android.os.SystemClock.elapsedRealtime() >= deadline) { Log.i(TAG, "pine-core-ready=false"); return; }
                Thread.sleep(250L);
            }
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context received, Intent intent) {
                    String request = intent.getStringExtra("request");
                    if (request == null || !request.matches("[a-f0-9]{32}")) { Log.i(TAG, "pine-core-unavailable=true"); return; }
                    if (!BUSY.compareAndSet(false, true)) { Log.i(TAG, "pine-core-busy=true"); return; }
                    PendingResult pending = goAsync();
                    Thread thread = new Thread(() -> {
                        try {
                            // Hash off the UI thread. A failed identity never reaches a UI operation.
                            NativeFacts facts = new NativeFacts(context, intent);
                            runOnMainSync(() -> {
                                try {
                                    String profile = intent.getStringExtra("profile");
                                    String action = intent.getStringExtra("action");
                                    Log.i(TAG, "pine-core-response-" + request + " "
                                            + (PineDramaInlineCoreState.PROFILE.equals(profile)
                                            ? PineDramaInlineCoreState.run(facts, profile, action)
                                            : PineDramaCoreState.run(facts, profile, action)));
                                }
                                catch (RuntimeException | LinkageError unavailable) { Log.i(TAG, "pine-core-unavailable=true"); }
                            });
                        } catch (Exception | LinkageError unavailable) { Log.i(TAG, "pine-core-unavailable=true"); }
                        finally { BUSY.set(false); pending.finish(); }
                    }, "hushfeed-pine-core-request");
                    thread.setDaemon(true);
                    thread.start();
                }
            };
            IntentFilter filter = new IntentFilter("app.hushfeed.verification.PINE_CORE");
            if (Build.VERSION.SDK_INT >= 33) context.registerReceiver(receiver, filter, "android.permission.DUMP", null, Context.RECEIVER_EXPORTED);
            else context.registerReceiver(receiver, filter, "android.permission.DUMP", null);
            Log.i(TAG, "pine-core-ready=true");
        } catch (Exception | LinkageError unavailable) { Log.i(TAG, "pine-core-ready=false"); }
    }

    private static final class NativeFacts implements PineDramaInlineCoreState.Facts {
        final Context context;
        final PackageInfo info;
        final boolean identity;

        NativeFacts(Context context, Intent request) throws Exception {
            this.context = context;
            info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            long code = Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
            String expected = request.getStringExtra("apkSha256");
            String[] splits = context.getApplicationInfo().splitSourceDirs;
            identity = Long.toString(code).equals(request.getStringExtra("versionCode"))
                    && (splits == null || splits.length == 0) && expected != null
                    && expected.matches("[a-f0-9]{64}") && expected.equals(hash(context.getApplicationInfo().sourceDir));
        }

        @Override public String packageName() { return context.getPackageName(); }
        @Override public String versionName() { return info.versionName; }
        @Override public boolean installedIdentityMatches() { return identity; }
        Activity visible() {
            try {
                Object value = context.getClassLoader().loadClass(UTILS).getMethod("getVisibleActivity").invoke(null);
                return value instanceof Activity ? (Activity) value : null;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) { return null; }
        }
        @Override public boolean foregroundOwned() {
            Activity activity = visible();
            return activity != null && PineDramaCoreState.PACKAGE.equals(activity.getPackageName())
                    && !activity.isFinishing() && activity.hasWindowFocus();
        }
        @Override public boolean mainVisible() {
            Activity activity = visible();
            return activity != null && PineDramaCoreState.MAIN.equals(activity.getClass().getName());
        }
        PreferenceFragment current() {
            Activity activity = visible();
            if (activity == null || !PineDramaCoreState.SETTINGS.equals(activity.getClass().getName())) return null;
            Fragment root = activity.getFragmentManager().findFragmentByTag("hushfeed_settings_root");
            if (root == null) return null;
            Fragment fragment = activity.getFragmentManager().findFragmentById(root.getId());
            if (!(fragment instanceof PreferenceFragment) || !FRAGMENT.equals(fragment.getClass().getName())
                    || !fragment.isAdded() || fragment.getView() == null || !fragment.getView().isShown()) return null;
            return (PreferenceFragment) fragment;
        }
        @Override public boolean homeVisible() {
            PreferenceFragment fragment = current();
            if (fragment == null) return false;
            try {
                java.lang.reflect.Method page = fragment.getClass().getDeclaredMethod("pageKey");
                page.setAccessible(true);
                return "home".equals(page.invoke(fragment)) && fragment.findPreference("action_search_settings") != null;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) { return false; }
        }
        @Override public boolean commentsVisible() {
            PreferenceFragment fragment = current();
            return fragment != null && fragment.getArguments() != null
                    && "COMMENTS".equals(fragment.getArguments().getString("morphe_settings_section"))
                    && fragment.getPreferenceScreen() != null && fragment.getPreferenceScreen().getPreferenceCount() > 0;
        }
        @Override public boolean commentsRowPresent() {
            PreferenceFragment fragment = current();
            Preference row = fragment == null ? null : fragment.findPreference("section_comments");
            return row != null && row.isEnabled() && row.isSelectable()
                    && "app.morphe.extension.tiktok.settings.preference.SettingsMenuPreference".equals(row.getClass().getName());
        }
        @Override public boolean nativeOwnerRestored() { return nativeOwner.get() != null && nativeOwner.get() == visible(); }
        @Override public boolean settingsOwnerRetained() { return settingsOwner.get() != null && settingsOwner.get() == current(); }
        private Boolean expanded(Preference row) {
            if (!(row instanceof PreferenceGroup)) return null;
            try {
                if (!Boolean.TRUE.equals(row.getClass().getMethod("isExpandable").invoke(row))) return null;
                Object value = row.getClass().getMethod("isExpanded").invoke(row);
                return value instanceof Boolean ? (Boolean) value : null;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) { return null; }
        }
        private boolean commentsState(boolean expectedExpanded) {
            PreferenceFragment fragment = current();
            Preference row = fragment == null ? null : fragment.findPreference("section_comments");
            Boolean state = expanded(row);
            if (state == null || state != expectedExpanded) return false;
            PreferenceGroup group = (PreferenceGroup) row;
            ListView list = fragment.getView().findViewById(android.R.id.list);
            if (list == null || list.getAdapter() == null || (expectedExpanded && group.getPreferenceCount() == 0)) return false;
            boolean visibleChild = false;
            for (int child = 0; child < group.getPreferenceCount(); child++) {
                boolean inAdapter = false;
                for (int index = 0; index < list.getAdapter().getCount(); index++) {
                    if (list.getAdapter().getItem(index) != group.getPreference(child)) continue;
                    inAdapter = true;
                    View view = list.getChildAt(index - list.getFirstVisiblePosition());
                    visibleChild |= view != null && view.isShown();
                    break;
                }
                if (inAdapter != expectedExpanded) return false;
            }
            return !expectedExpanded || visibleChild;
        }
        @Override public boolean commentsExpanded() { return commentsState(true); }
        @Override public boolean commentsCollapsed() { return commentsState(false); }
        @Override public boolean openSettings() {
            try {
                nativeOwner = new WeakReference<>(visible());
                settingsOwner = new WeakReference<>(null);
                context.getClassLoader().loadClass("app.morphe.extension.tiktok.settings.TikTokActivityHook")
                        .getMethod("openSettings").invoke(null);
                return true;
            } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) { return false; }
        }
        @Override public boolean openComments() {
            return clickComments(false);
        }
        @Override public boolean toggleComments() {
            return clickComments(true);
        }
        private boolean clickComments(boolean inline) {
            PreferenceFragment fragment = current();
            if (fragment == null || !commentsRowPresent()) return false;
            Preference row = fragment.findPreference("section_comments");
            Boolean state = expanded(row);
            if (inline && state == null) return false;
            if (inline && state && !settingsOwnerRetained()) return false;
            ListView list = fragment.getView().findViewById(android.R.id.list);
            if (list == null || list.getAdapter() == null) return false;
            for (int position = 0; position < list.getAdapter().getCount(); position++) {
                Object item = list.getAdapter().getItem(position);
                if (!(item instanceof Preference) || !"section_comments".equals(((Preference) item).getKey())) continue;
                final int index = position;
                final Preference selected = (Preference) item;
                if (inline && !state) settingsOwner = new WeakReference<>(fragment);
                list.setSelection(index);
                list.postOnAnimation(new Runnable() {
                    int attempts;
                    @Override public void run() {
                        // A fresh row after layout on the still-owned home page.
                        if (!foregroundOwned() || !homeVisible() || current() != fragment || !commentsRowPresent()) return;
                        if (inline && (!settingsOwnerRetained() || !state.equals(expanded(selected)))) return;
                        if (list.getAdapter() == null || index >= list.getAdapter().getCount()
                                || list.getAdapter().getItem(index) != selected) return;
                        View child = list.getChildAt(index - list.getFirstVisiblePosition());
                        if (child != null && child.isShown()) {
                            list.performItemClick(child, index, list.getAdapter().getItemId(index));
                        } else if (++attempts < 4) {
                            list.postOnAnimation(this);
                        }
                    }
                });
                return true;
            }
            return false;
        }
        @Override public boolean back() {
            Activity activity = visible();
            if (activity == null) return false;
            activity.onBackPressed();
            return true;
        }
    }

    private static String hash(String path) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (BufferedInputStream input = new BufferedInputStream(new FileInputStream(path))) {
            byte[] buffer = new byte[65_536];
            int count;
            while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count);
        }
        StringBuilder text = new StringBuilder(64);
        for (byte value : digest.digest()) text.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        return text.toString();
    }
}
