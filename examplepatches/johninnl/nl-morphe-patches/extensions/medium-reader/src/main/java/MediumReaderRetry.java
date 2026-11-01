import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import nl.johninnl.medium.reader.ReaderRuntime;
import nl.johninnl.medium.reader.ReaderStatus;

/** Retry emits the app's existing per-post repository refresh event, never a retained collector. */
public final class MediumReaderRetry {
    private MediumReaderRetry() {}
    public static void bind(qye events, String postId) {
        WeakReference<qye> reference = new WeakReference<>(events);
        AtomicBoolean pending = new AtomicBoolean();
        ReaderRuntime.bindRetry(postId, () -> {
            qye target = reference.get();
            if (target == null || !pending.compareAndSet(false, true)) return false;
            Handler main = new Handler(Looper.getMainLooper());
            pa2 job = new pa2();
            ho2 context = ((ho2) (Object) new no6(main)).k0((ho2) (Object) job);
            Runnable timeout = () -> ((rm7) (Object) job).l(new CancellationException("Reader refresh timed out"));
            yl2 completion = new yl2() {
                public ho2 getContext() { return context; }
                public void resumeWith(Object result) {
                    main.removeCallbacks(timeout); pending.set(false);
                    if (result instanceof l0e) ReaderRuntime.publish(new ReaderStatus(postId, "UNAVAILABLE", "RETRY", null));
                }
            };
            main.postDelayed(timeout, 3000);
            try {
                Object result = target.a(new k7b(postId), completion);
                if (result != so2.COROUTINE_SUSPENDED) completion.resumeWith(result);
                return true;
            } catch (RuntimeException failure) {
                main.removeCallbacks(timeout); pending.set(false);
                ReaderRuntime.publish(new ReaderStatus(postId, "UNAVAILABLE", "RETRY", null));
                return false;
            }
        });
    }
}
