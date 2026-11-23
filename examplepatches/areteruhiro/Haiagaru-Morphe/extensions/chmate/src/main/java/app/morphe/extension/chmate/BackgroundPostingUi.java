package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.widget.EditText;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Returns to the calling screen while the native ChMate posting task remains alive. */
public final class BackgroundPostingUi {
    static final String ENABLED = "backgroundPostingUi";
    private static final String TAG = "Haiagaru.Posting";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Binding> BINDINGS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity, WeakReference<Object>> READERS = new WeakHashMap<>();
    private static final Map<Object, Binding> POST_REFRESH = new WeakHashMap<>();
    private static volatile WeakReference<Activity> lastPaused = new WeakReference<>(null);

    private static final class Binding {
        final WeakReference<Object> fragment;
        final WeakReference<Activity> editor;
        final WeakReference<Activity> parent;
        final WeakReference<EditText> body;
        final String version;
        final WeakReference<Object> reader;
        final String thread;
        final String postTarget;
        Object[] previousTasks;
        int attempt;
        boolean waiting;
        boolean hidden;
        boolean failed;
        boolean succeeded;
        String submittedBody;

        Binding(Object fragment, Activity editor, Activity parent, String version, String thread,
                String postTarget, EditText body) {
            this.fragment = new WeakReference<>(fragment);
            this.editor = new WeakReference<>(editor);
            this.parent = new WeakReference<>(parent);
            this.body = new WeakReference<>(body);
            this.version = version;
            WeakReference<Object> activeReader = READERS.get(parent);
            this.reader = activeReader == null ? new WeakReference<>(null) : activeReader;
            this.thread = thread;
            this.postTarget = postTarget;
        }
    }

    static void activityPaused(Activity activity) {
        if (activity == null || isEditor(activity)) return;
        lastPaused = new WeakReference<>(activity);
    }

    static void bind(Object fragment, Object model) { bind(fragment, model, null, null, null); }

    static void bind(Object fragment, Object model, String thread, EditText body, String postTarget) {
        try {
            Activity editor = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (editor == null || !isEditor(editor)) return;
            String version = editor.getPackageManager().getPackageInfo(editor.getPackageName(), 0).versionName;
            if (!supported(version)) return;
            Activity parent = lastPaused.get();
            if (!validParent(editor, parent)) parent = null;
            Binding binding = new Binding(fragment, editor, parent, version, thread, postTarget, body);
            binding.previousTasks = taskObjects(fragment, version);
            BINDINGS.put(fragment, binding);
            if (model != fragment) BINDINGS.put(model, binding);
        } catch (Throwable error) {
            android.util.Log.w(TAG, "Background posting binding unavailable", error);
        }
    }

    public static void readerResumed(Object reader) {
        Activity activity = ExternalBoardAuth.activity(reader);
        if (activity != null) READERS.put(activity, new WeakReference<>(reader));
    }

    /** The reader's original post-result path is already issuing its update. */
    public static void nativeReload(Object reader) {
        // A concurrent native request may have started before the post was
        // accepted. Keep the post-success refresh queued until it finishes.
    }

    public static void nativePosted(Object callback) {
        Object fragment = findFragment(callback, 0);
        Binding binding = BINDINGS.get(fragment);
        if (binding == null) return;
        synchronized (binding) {
            if (binding.succeeded) return;
            binding.succeeded = true;
            binding.waiting = false;
            binding.failed = false;
        }
        clearSubmittedEdgeDraft(binding);
        if (!binding.hidden || binding.thread == null) return;
        Object reader = binding.reader.get();
        if (reader == null) return;
        POST_REFRESH.put(reader, binding);
        refreshAfterPost(reader, binding, 0);
    }

    /** Clear only the submitted Edge reply after native success; preserve edits made while it sent. */
    private static void clearSubmittedEdgeDraft(Binding binding) {
        if (!isEdgeThread(binding.postTarget)) return;
        EditText body = binding.body.get();
        String submitted = binding.submittedBody;
        if (body == null || submitted == null) return;
        Runnable clear = () -> {
            Activity editor = binding.editor.get();
            if (editor != null && !editor.isDestroyed() && submitted.contentEquals(body.getText())) {
                body.setText("");
                body.setSelection(0);
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) clear.run();
        else MAIN.post(clear);
    }

    private static boolean isEdgeThread(String address) {
        try {
            return "bbs.eddibb.cc".equalsIgnoreCase(android.net.Uri.parse(address).getHost());
        } catch (RuntimeException invalid) { return false; }
    }

    private static void refreshAfterPost(Object reader, Binding binding, int attempt) {
        MAIN.postDelayed(() -> {
            if (POST_REFRESH.get(reader) != binding) return;
            Activity parent = binding.parent.get();
            if (parent == null || parent.isFinishing() || parent.isDestroyed()
                    || ExternalBoardAuth.activity(reader) != parent) { POST_REFRESH.remove(reader); return; }
            try {
                String url = NativeThreadContext.url(NativeThreadContext.board(reader, binding.version), binding.version, 1);
                if (!sameThread(binding.thread, url)) { POST_REFRESH.remove(reader); return; }
                if (!Boolean.TRUE.equals(reader.getClass().getMethod("isResumed").invoke(reader))
                        || readerDownloading(reader, binding.version)) {
                    if (attempt < 120) refreshAfterPost(reader, binding, attempt + 1);
                    else POST_REFRESH.remove(reader);
                    return;
                }
                POST_REFRESH.remove(reader);
                OpenTabsRefresh.refreshWatchedFragment(reader);
                android.util.Log.i(TAG, "Post-success reader refresh dispatched");
            } catch (Exception error) {
                POST_REFRESH.remove(reader);
                android.util.Log.w(TAG, "Post-success reader refresh unavailable", error);
            }
        }, attempt == 0 ? 350 : 250);
    }

    private static boolean readerDownloading(Object reader, String version) throws ReflectiveOperationException {
        String field = version.contains("191") ? "K" : version.contains("226") ? "B" : null;
        if (field == null) return false;
        Object task = NativeFields.find(reader.getClass(), field).get(reader);
        if (task == null) return false;
        for (Field candidate : NativeFields.all(task.getClass())) {
            if (!java.util.concurrent.Future.class.isAssignableFrom(candidate.getType())) continue;
            candidate.setAccessible(true);
            java.util.concurrent.Future<?> future = (java.util.concurrent.Future<?>) candidate.get(task);
            if (future != null && !future.isDone()) return true;
        }
        return false;
    }

    static boolean sameThread(String posted, String opened) {
        if (posted == null || opened == null) return false;
        ThreadWatchRules.Target first = ThreadWatchRules.target(posted);
        ThreadWatchRules.Target second = ThreadWatchRules.target(opened);
        if (first != null && second != null) return first.url.equals(second.url);
        return GlobalTitleSearchRules.key(posted).equals(GlobalTitleSearchRules.key(opened));
    }

    /** Snapshot before native submit mutates its task fields. */
    public static void beforeNativeSubmit(Object owner) {
        Binding binding = BINDINGS.get(owner);
        if (binding == null) return;
        Activity editor = binding.editor.get();
        EditText body = binding.body.get();
        synchronized (binding) {
            binding.succeeded = false;
            binding.submittedBody = body == null ? null : body.getText().toString();
            if (editor == null || !enabled(editor) || !validParent(editor, binding.parent.get())) return;
            binding.attempt++;
            binding.waiting = true;
            binding.hidden = false;
            binding.failed = false;
            binding.previousTasks = taskObjects(binding.fragment.get(), binding.version);
        }
    }

    /** Called after the unmodified native submit method returns. */
    public static void afterNativeSubmit(Object owner) {
        Binding binding = BINDINGS.get(owner);
        if (binding == null) return;
        synchronized (binding) {
            if (!binding.waiting) return;
        }
        poll(binding, binding.attempt, 0);
    }

    private static void poll(Binding binding, int attempt, int elapsedMs) {
        MAIN.postDelayed(() -> {
            synchronized (binding) {
                if (attempt != binding.attempt || !binding.waiting || binding.failed) return;
            }
            Activity editor = binding.editor.get();
            Object fragment = binding.fragment.get();
            Activity parent = binding.parent.get();
            if (editor == null || fragment == null || editor.isFinishing() || editor.isDestroyed()) return;
            if (!enabled(editor) || !validParent(editor, parent)) {
                synchronized (binding) { binding.waiting = false; }
                return;
            }
            if (hasNewTask(fragment, binding)) {
                boolean moved;
                synchronized (binding) {
                    if (attempt != binding.attempt || !binding.waiting || binding.failed) return;
                    moved = binding.hidden = moveTo(editor, parent);
                    binding.waiting = false;
                }
                if (moved) {
                    android.util.Log.i(TAG, "Native post running behind the calling screen");
                }
                return;
            }
            if (elapsedMs >= 1200) {
                synchronized (binding) { binding.waiting = false; }
                return; // Validation or a board-specific path that was not recognized: keep the editor visible.
            }
            poll(binding, attempt, elapsedMs + 40);
        }, 40);
    }

    private static boolean hasNewTask(Object fragment, Binding binding) {
        Object[] current = taskObjects(fragment, binding.version);
        for (int i = 0; i < current.length; i++) {
            if (current[i] != null && current[i] != binding.previousTasks[i]) return true;
        }
        return false;
    }

    private static Object[] taskObjects(Object fragment, String version) {
        String[] names = version.contains("191") ? new String[]{"B", "R"}
                : version.contains("226") ? new String[]{"m", "w"}
                // 242 stores the new-thread coroutine in q and the reply task in s.
                : new String[]{"q", "s"};
        Object[] values = new Object[names.length];
        if (fragment == null) return values;
        for (int i = 0; i < names.length; i++) {
            try { values[i] = NativeFields.find(fragment.getClass(), names[i]).get(fragment); }
            catch (Throwable ignored) { }
        }
        return values;
    }

    /** ChMate publishes the confirmation to the editor's lifecycle-bound UI, then waits for input. */
    public static void beforeCookiePrompt(Object fragment) {
        Binding binding = BINDINGS.get(fragment);
        if (binding == null) return;
        final int attempt;
        synchronized (binding) {
            if (binding.succeeded || (!binding.waiting && !binding.hidden)) return;
            binding.waiting = false;
            binding.failed = true;
            if (!binding.hidden) return;
            attempt = binding.attempt;
        }
        java.util.concurrent.CountDownLatch ready = new java.util.concurrent.CountDownLatch(1);
        // A return to the reader may already be queued. Get the editor back in front
        // before the native worker emits its one-shot confirmation event.
        MAIN.postDelayed(() -> {
            Activity editor = binding.editor.get();
            Activity parent = binding.parent.get();
            if (!validParent(editor, parent) || !reopen(editor, parent)) {
                ready.countDown();
                return;
            }
            awaitCookiePromptEditor(binding, attempt, ready, 0);
        }, 80);
        if (Looper.myLooper() == Looper.getMainLooper()) return;
        try {
            ready.await(3, java.util.concurrent.TimeUnit.SECONDS);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        }
    }

    private static void awaitCookiePromptEditor(Binding binding, int attempt,
            java.util.concurrent.CountDownLatch ready, int checks) {
        MAIN.postDelayed(() -> {
            Activity editor = binding.editor.get();
            Object fragment = binding.fragment.get();
            if (attempt != binding.attempt || !validParent(editor, binding.parent.get())
                    || fragment == null || checks >= 48) {
                ready.countDown();
                return;
            }
            try {
                if (Boolean.TRUE.equals(fragment.getClass().getMethod("isResumed").invoke(fragment))) {
                    ready.countDown();
                    return;
                }
            } catch (ReflectiveOperationException unavailable) {
                ready.countDown();
                return;
            }
            awaitCookiePromptEditor(binding, attempt, ready, checks + 1);
        }, 50);
    }

    /** Called by narrowly hooked native failure callbacks, before their error state is displayed. */
    public static void nativeResult(Object callback, Object result) {
        try {
            Object fragment = findFragment(callback, 0);
            if (fragment == null) return;
            Binding binding = BINDINGS.get(fragment);
            if (binding == null || !isError(result, binding.version)) return;
            nativeFailure(fragment);
        } catch (Throwable error) {
            android.util.Log.w(TAG, "Could not restore editor after native post error", error);
        }
    }

    /** New-thread coroutine failures do not use the reply callback classes. */
    public static void nativeFailure(Object fragment, Object reason) {
        if (reason == null || isCancellation(reason)) return;
        nativeFailure(fragment);
    }

    public static void nativeFailure(Object fragment) {
        Binding binding = BINDINGS.get(fragment);
        if (binding == null) return;
        synchronized (binding) {
            if (binding.failed || (!binding.waiting && !binding.hidden)) return;
            binding.failed = true;
            binding.waiting = false;
            if (!binding.hidden) return;
        }
        Activity editor = binding.editor.get();
        Activity parent = binding.parent.get();
        if (editor != null && validParent(editor, parent)) {
            MAIN.postDelayed(() -> {
                if (!editor.isFinishing() && !editor.isDestroyed()) reopen(editor, parent);
            }, 80);
        }
    }

    private static boolean isCancellation(Object reason) {
        for (Class<?> type = reason.getClass(); type != null; type = type.getSuperclass())
            if (type.getName().equals("java.util.concurrent.CancellationException")) return true;
        return false;
    }

    private static Object findFragment(Object object, int depth) {
        if (object == null || depth > 2) return null;
        if (isFragment(object)) return object;
        for (Class<?> type = object.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if ((field.getModifiers() & java.lang.reflect.Modifier.STATIC) != 0) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(object);
                    if (isFragment(value)) return value;
                    if (value != null && value.getClass().getName().startsWith("jp.syoboi.a2chMate.feature.resedit")) {
                        Object found = findFragment(value, depth + 1);
                        if (found != null) return found;
                    }
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static boolean isFragment(Object value) {
        if (value == null) return false;
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass())
            if (type.getName().equals("androidx.fragment.app.Fragment")) return true;
        return false;
    }

    private static boolean isError(Object result, String version) {
        if (result instanceof Exception) return !isCancellation(result);
        if (result == null) return false;
        String name = result.getClass().getName();
        if (version.contains("226")) return name.endsWith("Jdk8WithJettyBootPlatformCompanion$write");
        if (version.contains("242")) return name.endsWith("TTAdDislikeToast$IconCompatParcelizer");
        if (!name.equals("o.getMediatedNetwork")) return false;
        try {
            boolean success = NativeFields.find(result.getClass(), "b").getBoolean(result);
            String detail = (String) NativeFields.find(result.getClass(), "e").get(result);
            if (success || detail == null) return false;
            Class<?> json = Class.forName("o.getJsonData", false, result.getClass().getClassLoader());
            Method method = json.getDeclaredMethod("j", String.class);
            method.setAccessible(true);
            return !Boolean.TRUE.equals(method.invoke(null, detail));
        } catch (Throwable ignored) {
            return false; // Fail safe: do not raise the editor for an unclassified result.
        }
    }

    private static boolean moveTo(Activity editor, Activity parent) {
        try {
            if (!validParent(editor, parent)) return false;
            Intent intent = new Intent(editor, parent.getClass()).addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            editor.startActivity(intent);
            return true;
        } catch (Throwable error) {
            android.util.Log.w(TAG, "Could not return to the calling screen", error);
            return false;
        }
    }

    private static boolean reopen(Activity editor, Activity parent) {
        try {
            if (!validParent(editor, parent)) return false;
            parent.startActivity(new Intent(parent, editor.getClass()).addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT));
            android.util.Log.i(TAG, "Native post error returned to the editor");
            return true;
        } catch (Throwable error) {
            android.util.Log.w(TAG, "Could not reopen editor after post error", error);
            return false;
        }
    }

    static void migrateSetting(android.content.SharedPreferences preferences) {
        if (preferences.getBoolean("backgroundPostingOptInMigrationV1", false)) return;
        preferences.edit().putBoolean(ENABLED, false)
                .putBoolean("backgroundPostingOptInMigrationV1", true).apply();
    }

    private static boolean enabled(Activity activity) {
        try { return SettingsProfiles.prefs(activity).getBoolean(ENABLED, false); }
        catch (Throwable ignored) { return true; }
    }

    private static boolean supported(String version) {
        return "0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version)
                || "0.8.10.242 dev".equals(version);
    }

    private static boolean isEditor(Activity activity) {
        return activity.getClass().getName().contains("ResEditActivity");
    }

    private static boolean validParent(Activity editor, Activity parent) {
        if (editor == null || parent == null || editor == parent) return false;
        try {
            return !editor.isFinishing() && !editor.isDestroyed() && !parent.isFinishing()
                    && !parent.isDestroyed() && editor.getTaskId() == parent.getTaskId();
        } catch (Throwable ignored) { return false; }
    }

    private BackgroundPostingUi() { }
}
