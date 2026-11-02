package app.morphe.extension.chmate;

import android.os.SystemClock;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import javax.net.SocketFactory;

/** Narrow, reversible safeguards for the verified 191 standard DAT/subject reader. */
public final class NativeUpdatePolicy {
    private static final UpdateProgressGate PROGRESS = new UpdateProgressGate();
    private static final Map<Object, Socket> READY = new IdentityHashMap<>();
    private static final Object TABLET_RESUME_LOCK = new Object();
    private static final Map<Object, Integer> TABLET_ACTIVITY_RESUMES = new WeakHashMap<>();
    private static final Map<Object, Integer> TABLET_FRAGMENT_RESUMES = new WeakHashMap<>();
    private static final ScheduledExecutorService CLEANUP = Executors.newSingleThreadScheduledExecutor(
            new ThreadFactory() {
                @Override public Thread newThread(Runnable task) {
                    Thread thread = new Thread(task, "Haiagaru-TCP-cleanup");
                    thread.setDaemon(true);
                    return thread;
                }
            });
    private NativeUpdatePolicy() { }

    /** Replaced with the verified native callback bridge, only in 191. */
    public static void report191(Object listener, int current, int total) { }

    /** Replaced with native Call.timeout access; must run before execute(). */
    public static void configure191(Object call) { }

    /** Called only before execute, on the verified 191 board/thread reader. */
    public static void prepareRequest191(Object call, String method, String url) {
        if (!Haiagaru.fresh191UpdateConnection() || !isThreadResource(method, url)
                || call == null || !"o.putFloat".equals(call.getClass().getName())) return;
        try {
            java.lang.reflect.Field target = nativeField(call.getClass(), "g");
            Object request = target.get(call);
            Class<?> type = request.getClass();
            if (!"o.r8lambda17vlhACr7B0IDgCdn1Q67LKhir8".equals(type.getName())) return;
            Object headers = nativeField(type, "a").get(request);
            java.lang.reflect.Field values = headers.getClass().getDeclaredField("namesAndValues");
            values.setAccessible(true);
            String[] original = (String[]) values.get(headers);
            String[] changed = UpdateConnectionHeaders.apply(original);
            if (changed == original) return;
            java.lang.reflect.Constructor<?> constructor = headers.getClass().getDeclaredConstructor(String[].class);
            constructor.setAccessible(true);
            Object replacement = constructor.newInstance((Object) changed);
            // A Request may be shared by several Calls. Copy it, including tags/body,
            // rather than changing the original immutable request or its Headers.
            java.lang.reflect.Constructor<?> requestConstructor = type.getDeclaredConstructor(
                    nativeField(type, "f").getType(), String.class, headers.getClass(),
                    nativeField(type, "e").getType(), java.util.Map.class);
            requestConstructor.setAccessible(true);
            Object copy = requestConstructor.newInstance(nativeField(type, "f").get(request), method,
                    replacement, nativeField(type, "e").get(request), nativeField(type, "b").get(request));
            // Connection: close alone can still borrow a previously pooled socket once.
            // Give only this scoped Call an empty pool, preserving its original client/TLS/cookies.
            Object client=nativeField(call.getClass(),"a").get(call);
            Object pool=nativeField(client.getClass(),"h").get(client);
            if(!"o.r8lambdaSKTp07BDug1dt6rTGFYR7p2Uyw".equals(pool.getClass().getName()))return;
            Object fresh=pool.getClass().getDeclaredConstructor().newInstance();
            Object delegate=nativeField(pool.getClass(),"b").get(fresh);
            if(!"o.putFloatArray".equals(delegate.getClass().getName()))return;
            // Zero idle slots closes HTTP/2 sockets too once the active response is released.
            nativeField(delegate.getClass(),"a").setInt(delegate,0);
            nativeField(call.getClass(),"c").set(call,delegate);
            target.set(call, copy);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Preserve native I/O if the verified request layout is unavailable.
        }
    }
    private static java.lang.reflect.Field nativeField(Class<?> type, String name) throws ReflectiveOperationException {
        java.lang.reflect.Field field = type.getDeclaredField(name); field.setAccessible(true); return field;
    }

    /** Records a real TabletHomeActivity resume, distinguishing it from pane/tab changes. */
    public static void tabletActivityResume(Object activity) {
        if (activity == null || !"jp.syoboi.a2chMate.activity.TabletHomeActivity"
                .equals(activity.getClass().getName())) return;
        synchronized (TABLET_RESUME_LOCK) {
            Integer current = TABLET_ACTIVITY_RESUMES.get(activity);
            TABLET_ACTIVITY_RESUMES.put(activity, current == null ? 1 : current + 1);
        }
    }

    /**
     * ChMate calls its automatic refresh action from a thread Fragment's onResume. In the
     * tablet pager, revisiting a thread can resume the same Fragment without resuming the
     * activity. Skip only that second in-activity resume; real activity resumes still refresh.
     */
    public static boolean shouldSkipTabletResumeReload(Object fragment) {
        if (fragment == null || !Haiagaru.suppressTabletThreadResumeReload()) return false;
        try {
            Object activity = fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (activity == null || !"jp.syoboi.a2chMate.activity.TabletHomeActivity"
                    .equals(activity.getClass().getName())) return false;
            synchronized (TABLET_RESUME_LOCK) {
                Integer generation = TABLET_ACTIVITY_RESUMES.get(activity);
                int currentGeneration = generation == null ? 0 : generation;
                Integer previousGeneration = TABLET_FRAGMENT_RESUMES.put(fragment, currentGeneration);
                return previousGeneration != null && previousGeneration == currentGeneration;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Keep ChMate's native refresh behavior if the host lifecycle shape changes.
            return false;
        }
    }

    public static boolean shouldReport(Object listener, int current, int total) {
        return !Haiagaru.optimize191UpdateProgress()
                || PROGRESS.allow(listener, current, total, SystemClock.uptimeMillis());
    }

    public static long timeoutNanos(String method, String url) {
        int seconds = Haiagaru.update191TimeoutSeconds();
        if (seconds == 0 || !isThreadResource(method, url)) return 0;
        return TimeUnit.SECONDS.toNanos(seconds);
    }

    // These accessors are bound to the verified 191 native types by the patch.
    public static Object call191(Object finder) { return null; }
    public static String method191(Object call) { return null; }
    public static String url191(Object call) { return null; }
    public static boolean cancelled191(Object call) { return false; }
    public static boolean direct191(Object route) { return false; }
    public static List<Object> candidates191(Object finder, Object route) { return null; }
    public static InetSocketAddress endpoint191(Object route) { return null; }
    public static SocketFactory socketFactory191(Object route) { return null; }
    public static void commitRoute191(Object finder, Object original, Object route) { }

    public static Object race191(Object finder, Object original, int timeout) throws IOException {
        if (!Haiagaru.fast191UpdateConnect() || !direct191(original)) return original;
        final Object call = call191(finder);
        if (!isThreadResource(method191(call), url191(call))) return original;
        List<Object> candidates = candidates191(finder, original);
        final List<Object> routes = new ArrayList<>();
        List<InetSocketAddress> addresses = new ArrayList<>();
        for (Object route : candidates) {
            InetSocketAddress address = endpoint191(route);
            if (direct191(route) && !address.isUnresolved() && !addresses.contains(address)) {
                routes.add(route);
                addresses.add(address);
            }
        }
        if (routes.size() < 2) return original;
        TcpConnectRace.Result result = TcpConnectRace.connect(addresses, socketFactory191(original), timeout,
                new TcpConnectRace.Cancellation() {
                    @Override public boolean cancelled() { return cancelled191(call); }
                });
        if (result == null) return original;
        final Object winner = routes.get(result.index);
        final Socket socket = result.socket;
        try {
            if (cancelled191(call)) throw new InterruptedIOException("TCP connection cancelled");
            commitRoute191(finder, original, winner);
            synchronized (READY) { TcpConnectRace.close(READY.put(winner, socket)); }
            CLEANUP.schedule(new Runnable() {
                @Override public void run() {
                    synchronized (READY) {
                        if (READY.get(winner) == socket) TcpConnectRace.close(READY.remove(winner));
                    }
                }
            }, 5, TimeUnit.SECONDS);
            return winner;
        } catch (IOException | RuntimeException error) {
            synchronized (READY) { if (READY.get(winner) == socket) READY.remove(winner); }
            TcpConnectRace.close(socket);
            throw error;
        }
    }

    public static Socket takeSocket191(Object route, Object call) throws IOException {
        Socket socket;
        synchronized (READY) { socket = READY.remove(route); }
        if (socket != null && cancelled191(call)) {
            TcpConnectRace.close(socket);
            throw new InterruptedIOException("TCP connection cancelled");
        }
        return socket;
    }

    static boolean isThreadResource(String method, String url) {
        return UpdateConnectPolicy.isThreadResource(method, url);
    }
}
