import dalvik.system.PathClassLoader;
import java.lang.reflect.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/** Isolated ART checks. Never invoke run() or allow maybeStart() to launch a request. */
public final class VideolandBlockReplayContinuationProbe {
    private static int checks;
    private static void check(boolean value, String label) {
        if (!value) throw new AssertionError(label);
        checks++;
        System.out.println("PASS " + label);
    }
    public static void main(String[] args) throws Exception {
        ClassLoader apk = new PathClassLoader(args[0], ClassLoader.getSystemClassLoader());
        String helper = "nl.johninnl.patches.videolandtest.";
        Class<?> continuation = Class.forName(helper + "BlockReplayContinuation", true, apk);
        Class<?> nativeContinuation = Class.forName("bv.c", false, apk);
        Class<?> callback = Class.forName("Zu.d", false, apk);
        Object empty = Class.forName("Zu.j", true, apk).getDeclaredField("N").get(null);
        AtomicInteger delivered = new AtomicInteger();
        AtomicReference<Object> observed = new AtomicReference<>();
        Object completion = Proxy.newProxyInstance(apk, new Class<?>[]{callback}, (proxy, method, values) -> {
            if (method.getName().equals("getContext")) return empty;
            if (method.getName().equals("resumeWith")) {
                observed.set(values[0]);
                delivered.incrementAndGet();
            }
            return null;
        });
        check(continuation.getSuperclass() == nativeContinuation, "extends actual native continuation");
        Object first = continuation.getConstructor(callback).newInstance(completion);
        Object marker = new Object();
        Method resume = continuation.getMethod("resumeWith", Object.class);
        resume.invoke(first, marker);
        check(delivered.get() == 1 && observed.get() == marker, "native completion preserves immediate result identity");
        Object delayed = continuation.getConstructor(callback).newInstance(completion);
        Thread worker = new Thread(() -> {
            try { resume.invoke(delayed, marker); }
            catch (Exception failure) { throw new AssertionError(failure); }
        });
        worker.start();
        worker.join(2000);
        check(!worker.isAlive() && delivered.get() == 2 && observed.get() == marker,
            "native completion preserves asynchronously delivered result identity");
        Object sink = Class.forName(helper + "BlockReplayCompletion", true, apk).getConstructor().newInstance();
        check(callback.getMethod("getContext").invoke(sink) == empty, "completion uses independent empty context");

        Class<?> run = Class.forName(helper + "BlockReplay", true, apk);
        Field startedField = run.getDeclaredField("started"); startedField.setAccessible(true);
        AtomicBoolean started = (AtomicBoolean) startedField.get(null);
        Class<?> remote = Class.forName("com.bedrockstreaming.component.layout.data.core.remote.LayoutRemoteDataSource", false, apk);
        Class<?> unsafeType = Class.forName("sun.misc.Unsafe");
        Field unsafeField = unsafeType.getDeclaredField("theUnsafe"); unsafeField.setAccessible(true);
        Object remoteFixture = unsafeType.getMethod("allocateInstance", Class.class).invoke(unsafeField.get(null), remote);
        Method start = run.getMethod("maybeStart", remote, String.class, String.class, String.class);
        start.invoke(null, remoteFixture, "main", "page", "clip_99929");
        start.invoke(null, remoteFixture, "main", "video", "different_fixture");
        check(!started.get(), "unrelated request coordinates do not arm replay");
        started.set(true); // Prevent a thread and any native request, including the matching case.
        start.invoke(null, remoteFixture, "main", "video", "clip_99929");
        check(started.get(), "already-started guard accepts no second request");
        check(delivered.get() == 2, "replay guard does not touch supplied completion");
        System.out.println("PASS: " + checks + " isolated block replay ART assertions; no requests launched");
    }
}
