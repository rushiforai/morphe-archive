package app.wordfeudwordfinder.extension.play;

import android.app.Activity;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import app.wordfeudwordfinder.extension.hooks.RouteTap;
import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.List;

/**
 * Android side of {@link Refresher}: sends platform messages to Wordfeud's Flutter engine and reads the debug opt-in
 * file. Flutter classes are reached by reflection only (the extension cannot link them).
 *
 * <p>Primary path (V4 testbuild 4): {@code FlutterJNI.dispatchPlatformMessage} on the FlutterJNI instance RouteTap
 * captured ({@link JniDispatch}); testbuild 3 showed that messages sent this way arrive in Dart.
 *
 * <p>Fallback path (did not work on Wordfeud 5.7.1 in testbuild 3, kept because it is cheap):
 * {@code activity.getFlutterEngine()} (FlutterActivity / FlutterFragmentActivity, protected, so searched up the class
 * hierarchy; fallback: any field holding the engine or an object with {@code getFlutterEngine()}, such as
 * FlutterFragmentActivity's FlutterFragment), then {@code engine.getDartExecutor()} (a BinaryMessenger), then
 * {@code send(String, ByteBuffer)}. Every step is recorded in a {@link RefreshDiagnostic} (Copy details).
 *
 * <p>Messages are sent on the main (platform) thread, as Flutter requires, in direct ByteBuffers whose position is
 * the message size (DartMessenger passes {@code message.position()} as the length to FlutterJNI).
 *
 * <p>Debug: the file {@code debug_refresh_order.txt} in {@code <filesDir>/wfwf/} or (API 30+ only, see
 * {@link RefreshOrder#debugFiles}) {@code <externalFilesDir>/wfwf/} is the opt-in (there is no host BuildConfig to read). Only while it exists does
 * anything get logged (tag {@value #TAG}), and only strategy and channel names, never message contents.
 */
public final class FlutterBridge implements Refresher.Env {
    static final String TAG = "WFWF-Refresh";

    private static volatile Handler main;

    private final WeakReference<Activity> activity;
    private final List<File> debugFiles;

    private FlutterBridge(Activity a, List<File> debugFiles) {
        this.activity = new WeakReference<>(a);
        this.debugFiles = debugFiles;
    }

    /** Main thread, once the activity's onCreate has run. Never throws. */
    public static void install(Activity a) {
        try {
            File internal = new File(new File(a.getFilesDir(), "wfwf"), RefreshOrder.DEBUG_FILE);
            File external = null;
            if (Build.VERSION.SDK_INT >= 30) { // scoped storage; older versions: internal file only
                try {
                    File ext = a.getExternalFilesDir(null);
                    if (ext != null) external = new File(new File(ext, "wfwf"), RefreshOrder.DEBUG_FILE);
                } catch (Throwable ignored) {
                    // no external storage: internal file only
                }
            }
            List<File> files = RefreshOrder.debugFiles(internal, external, Build.VERSION.SDK_INT);
            FlutterBridge b = new FlutterBridge(a, files);
            Refresher.install(b);
            if (b.debugOrder() != null) {
                Log.d(TAG, "debug file present: logging channel names");
                RouteTap.setChannelLogger(channel -> Log.d(TAG, "channel seen: " + channel));
            } else {
                RouteTap.setChannelLogger(null);
            }
        } catch (Throwable ignored) {
            // refreshing stays off: Wordfeud refreshes itself
        }
    }

    @Override
    public String debugOrder() {
        return RefreshOrder.readDebugFile(debugFiles);
    }

    @Override
    public void debugLog(String line) {
        Log.d(TAG, line);
    }

    @Override
    public Refresher.Messenger messenger(Refresher.DebugLog log, RefreshDiagnostic diag) {
        return (channel, sequence) -> send(channel, sequence, log, diag);
    }

    /** Sends one message; {@link #verb()} names the call and {@link #path()} the path in the diagnostic. */
    private interface Sender {
        void send(String channel, byte[] message) throws Exception;

        String verb();

        /** "jni" or "engine": the short path name in the toast summary. */
        String path();
    }

    /**
     * Path choice (V4 testbuild 4): the FlutterJNI path first. Testbuild 3 showed that on Wordfeud 5.7.1 the engine
     * lookup fails ({@code NoSuchMethodException getFlutterEngine} on MainActivity) while messages sent via
     * FlutterJNI.dispatchPlatformMessage do arrive. The engine path (DartExecutor.send) is kept as a fallback only:
     * it costs nothing when the JNI path works and may help when no FlutterJNI was captured yet (no platform message
     * seen since the process started) or a dispatch throws.
     */
    private boolean send(String channel, MessageSequence sequence, Refresher.DebugLog log, RefreshDiagnostic diag) {
        RefreshDiagnostic d = diag != null ? diag : new RefreshDiagnostic(null);
        try {
            Sender primary = jniSender(d);
            if (primary == null) {
                d.step("-> engine path");
                primary = engineSender(d);
            }
            if (primary == null) {
                if (log != null) log.d("no FlutterJNI or Flutter engine for " + channel);
                d.fail(RouteTap.flutterJni() == null ? "no FlutterJNI" : "no dispatch method");
                return false;
            }
            d.expect(sequence.size());
            if (sequence.size() == 0) {
                d.finish();
                return true;
            }
            if (log != null) {
                log.d("schedule " + sequence.size() + " message(s) on " + channel + " via " + primary.verb()
                        + ", over " + sequence.offset(sequence.size() - 1) + " ms");
            }
            // The sender is kept for the whole sequence: once the first message went out, the next ones go the same
            // way even if the activity is finishing meanwhile (a "background" is never left without "foreground").
            Sender target = primary;
            boolean posted = main().post(() -> sendStep(target, channel, sequence, 0, log, d));
            if (!posted) d.fail("main thread post failed");
            return posted;
        } catch (Throwable t) {
            d.fail("bridge: " + RefreshDiagnostic.reason(t));
            return false;
        }
    }

    /**
     * Main thread. Sends message {@code i}, then schedules the one {@link MessageSequence#next(int, boolean)} names
     * (after a failure: none, or the last one for a {@link MessageSequence#closeAlways} sequence). Finishes {@code d}
     * at the end.
     */
    private void sendStep(Sender sender, String channel, MessageSequence sequence, int i, Refresher.DebugLog log,
            RefreshDiagnostic d) {
        Sender used = sender;
        boolean sent;
        try {
            byte[] message = sequence.messages.get(i);
            String label = RefreshDiagnostic.message(sender.verb(), channel, message.length);
            try {
                sender.send(channel, message);
                d.sent(sender.path(), label + " OK");
            } catch (Throwable t) {
                d.step(label + " failed " + RefreshDiagnostic.reason(t));
                used = fallback(sender, d);
                if (used == null) throw t;
                used.send(channel, message);
                d.sent(used.path(), RefreshDiagnostic.message(used.verb(), channel, message.length) + " OK");
            }
            sent = true;
            if (log != null) log.d("sent " + channel + " #" + (i + 1) + " (" + message.length + " bytes)");
        } catch (Throwable t) {
            if (log != null) log.d("send failed on " + channel + " #" + (i + 1) + ": " + t.getClass().getSimpleName());
            d.fail("send #" + (i + 1) + " " + RefreshDiagnostic.reason(t));
            sent = false;
            used = sender; // the closing message (if any) tries the same paths again
        }
        int next = sequence.next(i, sent);
        if (next < 0) {
            d.finish();
            return;
        }
        Sender nextSender = used;
        boolean posted = main().postDelayed(() -> sendStep(nextSender, channel, sequence, next, log, d),
                sequence.delayAfter(i, sent));
        if (!posted) {
            d.fail("main thread post failed");
            d.finish();
        }
    }

    /** The other path after {@code failed} threw, or null when there is none. */
    private Sender fallback(Sender failed, RefreshDiagnostic d) {
        if (failed instanceof JniSender) {
            d.step("-> engine path");
            return engineSender(d);
        }
        d.step("-> FlutterJNI path");
        return jniSender(d);
    }

    private static Handler main() {
        Handler h = main;
        if (h == null) {
            h = new Handler(Looper.getMainLooper());
            main = h;
        }
        return h;
    }

    /**
     * The engine path (DartExecutor.send), recording each lookup step; null when it is not available. Fallback only
     * (see {@link #send(String, MessageSequence, Refresher.DebugLog, RefreshDiagnostic)}).
     */
    private Sender engineSender(RefreshDiagnostic d) {
        Activity a = activity.get();
        boolean usable = a != null && !a.isFinishing() && !a.isDestroyed();
        d.step("activity=" + (a == null ? "none" : a.getClass().getSimpleName() + (usable ? "" : " (finishing)")));
        if (!usable) return null;
        Object engine = null;
        try {
            engine = call(a, "getFlutterEngine");
            d.step(engine != null ? "engine=via getFlutterEngine OK" : "engine: getFlutterEngine returned null");
        } catch (NoSuchMethodException e) {
            d.step("engine: NoSuchMethodException getFlutterEngine on " + a.getClass().getSimpleName());
        } catch (Throwable t) {
            d.step("engine: getFlutterEngine " + RefreshDiagnostic.reason(t));
        }
        if (engine == null) {
            try {
                engine = engineFromFields(a);
                d.step(engine != null ? "engine=via field OK" : "engine fields: none");
            } catch (Throwable t) {
                d.step("engine fields: " + RefreshDiagnostic.reason(t));
            }
        }
        if (engine == null) return null;
        Object messenger;
        try {
            messenger = call(engine, "getDartExecutor");
        } catch (Throwable t) {
            d.step("dartExecutor: " + RefreshDiagnostic.reason(t));
            return null;
        }
        if (messenger == null) {
            d.step("dartExecutor: null");
            return null;
        }
        Method send;
        try {
            send = messenger.getClass().getMethod("send", String.class, ByteBuffer.class);
        } catch (Throwable t) {
            d.step("dartExecutor.send: " + RefreshDiagnostic.reason(t));
            return null;
        }
        d.step("dartExecutor OK");
        Object target = messenger;
        return new Sender() {
            @Override
            public void send(String channel, byte[] message) throws Exception {
                ByteBuffer buf = ByteBuffer.allocateDirect(message.length);
                buf.put(message); // position == size, as Flutter's codecs leave it
                send.invoke(target, channel, buf);
            }

            @Override
            public String verb() {
                return "send";
            }

            @Override
            public String path() {
                return "engine";
            }
        };
    }

    /** The FlutterJNI path; null when no FlutterJNI was captured or it has no dispatchPlatformMessage. */
    private static Sender jniSender(RefreshDiagnostic d) {
        Object jni = RouteTap.flutterJni();
        if (jni == null) {
            d.step("jni=none");
            return null;
        }
        JniDispatch.Lookup l;
        try {
            l = JniDispatch.lookup(jni.getClass());
        } catch (Throwable t) {
            l = null;
        }
        if (l == null) {
            d.step("jni=captured, no " + JniDispatch.METHOD + " on " + jni.getClass().getSimpleName());
            return null;
        }
        d.step("jni=captured, " + JniDispatch.METHOD + " via " + l.how);
        return new JniSender(l, jni);
    }

    /** Holds the FlutterJNI strongly only for one sequence (a few hundred ms). */
    private static final class JniSender implements Sender {
        private final JniDispatch.Lookup lookup;
        private final Object jni;

        JniSender(JniDispatch.Lookup lookup, Object jni) {
            this.lookup = lookup;
            this.jni = jni;
        }

        @Override
        public void send(String channel, byte[] message) throws Exception {
            JniDispatch.dispatch(lookup, jni, channel, message);
        }

        @Override
        public String verb() {
            return "dispatch";
        }

        @Override
        public String path() {
            return "jni";
        }
    }

    private static Object engineFromFields(Object owner) throws Exception {
        for (Class<?> c = owner.getClass(); c != null && c != Activity.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().isPrimitive()) continue;
                f.setAccessible(true);
                Object v = f.get(owner);
                if (v == null) continue;
                if (v.getClass().getName().equals("io.flutter.embedding.engine.FlutterEngine")) return v;
                try {
                    Object e = call(v, "getFlutterEngine");
                    if (e != null) return e;
                } catch (NoSuchMethodException ignored) {
                    // not an engine holder
                }
            }
        }
        return null;
    }

    /**
     * Calls a no-argument method found anywhere up the class hierarchy (may return null);
     * NoSuchMethodException when no class has it.
     */
    private static Object call(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            Method m;
            try {
                m = c.getDeclaredMethod(name);
            } catch (NoSuchMethodException ignored) {
                continue; // look in the super class
            }
            m.setAccessible(true);
            return m.invoke(target);
        }
        throw new NoSuchMethodException(name);
    }
}
