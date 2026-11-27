package com.akshaykadam.pixelboard.extension.rambler;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.os.SystemClock;
import android.os.UserManager;
import android.util.AtomicFile;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Clipboard Recent | History. Entry points are called only by the hash-pinned rc4 hooks:
 * start/finish (IME lifecycle), capture (stock clipboard read), attach/detach (clipboard panel).
 * Every entry point swallows Throwable; any failure leaves the stock panel and stock recording untouched.
 */
public final class GboardRamblerClipHistory {
    private static final String FILE = "rambler_clip_history";
    private static final int OPT_IN_PREF = 0x7f140911; // "clipboard_opt_in" in the pinned rc4 resource table
    private static volatile WeakReference<InputMethodService> ime = new WeakReference<>(null);
    private static volatile Handler main;
    private static volatile ExecutorService io;
    private static ClipHistoryStore store; // IO thread only
    private static WeakReference<ClipHistoryPanel> panel = new WeakReference<>(null); // main thread only
    private static final ClipHistoryPolicy.PrivateWindow PRIVATE = new ClipHistoryPolicy.PrivateWindow(); // main thread

    private GboardRamblerClipHistory() {}

    /** onStartInput entry (main thread). Also covers restarts, which skip onFinishInput. */
    public static void start(InputMethodService service, EditorInfo info) {
        try {
            ime = new WeakReference<>(service);
            long now = SystemClock.elapsedRealtime();
            boolean privateSession = info == null
                    || ClipHistoryPolicy.privateEditor(info.inputType, info.imeOptions) || incognito(service);
            if (privateSession) PRIVATE.enter(now); else PRIVATE.leave(now);
            if (panel.get() != null && (privateSession || !showable(service))) closePanel();
        } catch (Throwable ignored) {
            try { PRIVATE.enter(SystemClock.elapsedRealtime()); } catch (Throwable alsoIgnored) { /* fail closed */ }
            closePanel();
        }
    }

    /** onFinishInput and onDestroy entry (main thread). */
    public static void finish() {
        try { ime = new WeakReference<>(null); PRIVATE.leave(SystemClock.elapsedRealtime()); closePanel(); }
        catch (Throwable ignored) { closePanel(); }
    }

    /**
     * kvk.call, right after stock kvw.b built its candidate from the same ClipData/ClipDescription
     * (clipboard executor thread). Runs whether or not the panel is open.
     */
    public static void capture(Object handler, Object candidate, ClipData data, ClipDescription description) {
        try {
            if (handler == null || candidate == null || data == null || description == null) return;
            if (!handler.getClass().getName().equals("kvw") || !candidate.getClass().getName().equals("ksw")) return;
            ClipDescription embedded = data.getDescription();
            if (embedded == null || data.getItemCount() != 1
                    || !ClipHistoryPolicy.sameClip(embedded.getTimestamp(), description.getTimestamp())) return;
            final long timestamp = description.getTimestamp();
            if (!ClipHistoryPolicy.fresh(timestamp, System.currentTimeMillis())) return;
            final boolean sensitive = sensitive(embedded) || sensitive(description);
            final boolean masked = (Boolean) method(candidate, "m").invoke(candidate); // stock IS_SENSITIVE bit
            final boolean enabled = (Boolean) method(handler, "v").invoke(handler); // stock clipboard opt-in
            if (sensitive || masked || !enabled) return;
            CharSequence raw = data.getItemAt(0).getText(); // Text only: never coerce URIs, HTML or remote content.
            if (raw == null || raw.length() == 0 || raw.length() > ClipHistoryStore.MAX_TEXT_CHARS) return;
            final String text = raw.toString();
            final ClassLoader loader = handler.getClass().getClassLoader();
            final Context app = ((Context) field(handler, "c")).getApplicationContext();
            main().post(() -> {
                try {
                    // Re-evaluated on the main thread, where the IME session state is consistent.
                    InputMethodService service = ime.get();
                    boolean started = service != null && service.getCurrentInputStarted();
                    EditorInfo info = started ? service.getCurrentInputEditorInfo() : null;
                    if (started && info == null) return;
                    // Copied while a private session ran, even if focus moved on before this read was handled.
                    if (PRIVATE.covers(timestamp, System.currentTimeMillis(), SystemClock.elapsedRealtime())) return;
                    if (!ClipHistoryPolicy.recordClip(started, started ? info.inputType : 0,
                            started ? info.imeOptions : 0, enabled, ClipHistoryGboardPrivacy.incognito(loader),
                            sensitive, masked)) return;
                    io().execute(() -> {
                        try { if (store(app).record(text, timestamp, false)) refresh(); }
                        catch (Throwable ignored) { /* Not recorded; stock clipboard is unaffected. */ }
                    });
                } catch (Throwable ignored) { /* Unknown privacy state: do not record. */ }
            });
        } catch (Throwable ignored) { /* Unknown privacy state: do not record. */ }
    }

    /** ClipboardKeyboard.e, just before return (main thread): the panel is bound and field i is the clip list. */
    public static void attach(Object keyboard) {
        try {
            final View stock = (View) field(keyboard, "i");
            if (stock == null) return;
            stock.post(() -> {
                try {
                    if (field(keyboard, "i") != stock || !stock.isAttachedToWindow()) return;
                    if (!showable(ime.get())) { closePanel(); return; }
                    ClipHistoryPanel old = panel.get();
                    if (old != null && old.stock == stock && old.installed()) { old.recent(); return; }
                    closePanel();
                    ClipHistoryPanel created = new ClipHistoryPanel(stock);
                    panel = new WeakReference<>(created); // before install, so closePanel can retry a failed rollback
                    created.install();
                } catch (Throwable ignored) { closePanel(); }
            });
        } catch (Throwable ignored) { closePanel(); }
    }

    /** ClipboardKeyboard.f (deactivate) and k (views discarded) entry: put the stock tree back first. */
    public static void detach(Object keyboard) {
        try {
            ClipHistoryPanel current = panel.get();
            if (current != null && current.stock != field(keyboard, "i")) return; // another keyboard instance
        } catch (Throwable unknown) { /* Cannot tell: restore stock. */ }
        closePanel();
    }

    static void load(ClipHistoryPanel target) {
        try {
            InputMethodService service = ime.get();
            if (!showable(service)) { closePanel(); return; }
            final Context app = service.getApplicationContext();
            io().execute(() -> {
                try {
                    ClipHistoryStore history = store(app);
                    final List<String> rows = history.snapshot();
                    final List<String> pinned = history.pinnedSnapshot();
                    final boolean canPin = history.canPin();
                    main().post(() -> {
                        try {
                            if (panel.get() == target && showable(ime.get())) target.showRows(rows, pinned, canPin);
                        } catch (Throwable ignored) { closePanel(); }
                    });
                } catch (Throwable ignored) { fallback(); }
            });
        } catch (Throwable ignored) { closePanel(); }
    }

    static void paste(String text) {
        try {
            InputMethodService service = ime.get();
            if (!showable(service)) { closePanel(); return; }
            InputConnection connection = service.getCurrentInputConnection();
            if (connection == null) return;
            connection.beginBatchEdit();
            try {
                connection.finishComposingText(); // keep any composing word instead of replacing it
                connection.commitText(text, 1);
            } finally { connection.endBatchEdit(); }
        } catch (Throwable ignored) { closePanel(); }
    }

    static void delete(String text) { edit(text, 0); }

    static void pin(String text, boolean pinned) { edit(text, pinned ? 1 : 2); }

    private static void edit(String text, int action) {
        try {
            InputMethodService service = ime.get();
            if (!showable(service)) { closePanel(); return; }
            final Context app = service.getApplicationContext();
            io().execute(() -> {
                try {
                    ClipHistoryStore history = store(app);
                    boolean changed = action == 0 ? history.delete(text) : history.setPinned(text, action == 1);
                    if (changed) refresh();
                } catch (Throwable ignored) { fallback(); }
            });
        } catch (Throwable ignored) { closePanel(); }
    }

    private static boolean showable(InputMethodService service) throws Exception {
        if (service == null || !service.isInputViewShown() || !service.getCurrentInputStarted()) return false;
        EditorInfo info = service.getCurrentInputEditorInfo();
        return info != null && ClipHistoryPolicy.showHistory(info.inputType, info.imeOptions,
                optedIn(service), incognito(service));
    }

    private static boolean incognito(InputMethodService service) {
        return ClipHistoryGboardPrivacy.incognito(service.getClassLoader());
    }

    /** Same preference stock kvw.v() reads: ahbz.I(context).x(clipboard_opt_in, false). */
    private static boolean optedIn(InputMethodService service) throws Exception {
        Class<?> prefsClass = Class.forName("ahbz", false, service.getClassLoader());
        Object prefs = prefsClass.getMethod("I", Context.class).invoke(null, service);
        return (Boolean) prefs.getClass().getMethod("x", int.class, boolean.class).invoke(prefs, OPT_IN_PREF, false);
    }

    private static boolean sensitive(ClipDescription description) {
        PersistableBundle extras = description.getExtras();
        return extras != null && extras.getBoolean("android.content.extra.IS_SENSITIVE", false);
    }

    /** IO thread only. Credential-encrypted storage is unreadable before first unlock: never cache that as empty. */
    private static ClipHistoryStore store(Context app) throws IOException {
        if (store != null) return store;
        UserManager users = app.getSystemService(UserManager.class);
        if (users == null || !users.isUserUnlocked()) throw new IOException("user locked");
        final AtomicFile file = new AtomicFile(new File(app.getNoBackupFilesDir(), FILE));
        store = new ClipHistoryStore(new ClipHistoryStore.Storage() {
            public byte[] read() throws IOException {
                try {
                    // Larger than any valid file: treat as corrupt, so the next clip replaces it.
                    if (file.getBaseFile().length() > 2L * (ClipHistoryStore.LIMIT + ClipHistoryStore.MAX_PINNED)
                            * (ClipHistoryStore.MAX_TEXT_CHARS + 8) + 4096) return null;
                    return file.readFully();
                } catch (FileNotFoundException absent) { return null; }
            }
            public void write(byte[] value) throws IOException {
                FileOutputStream out = file.startWrite();
                try { out.write(value); file.finishWrite(out); }
                catch (Throwable failure) { file.failWrite(out); throw new IOException(failure); }
            }
        });
        return store;
    }

    private static void refresh() {
        main().post(() -> {
            try { ClipHistoryPanel current = panel.get(); if (current != null && current.history) load(current); }
            catch (Throwable ignored) { closePanel(); }
        });
    }

    static void fallback() {
        try {
            if (Looper.myLooper() == Looper.getMainLooper()) closePanel();
            else main().post(GboardRamblerClipHistory::closePanel);
        } catch (Throwable ignored) { /* Nothing may escape a hook. */ }
    }

    /** Main thread only. */
    static void closePanel() {
        try {
            ClipHistoryPanel current = panel.get();
            panel = new WeakReference<>(null);
            if (current != null) current.restore();
        } catch (Throwable ignored) { /* Preserve IME operation even on an unexpected view tree. */ }
    }

    private static Handler main() {
        Handler handler = main;
        if (handler == null) main = handler = new Handler(Looper.getMainLooper());
        return handler;
    }

    private static synchronized ExecutorService io() {
        if (io == null) io = Executors.newSingleThreadExecutor();
        return io;
    }

    private static Method method(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try { Method m = type.getDeclaredMethod(name); m.setAccessible(true); return m; }
            catch (NoSuchMethodException next) { /* Continue to superclass. */ }
        }
        throw new NoSuchMethodException(name);
    }

    private static Object field(Object target, String name) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }
}
