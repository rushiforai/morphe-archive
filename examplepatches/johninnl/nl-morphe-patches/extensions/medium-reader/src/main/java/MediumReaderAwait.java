import nl.johninnl.medium.reader.Cancellation;
import nl.johninnl.medium.reader.ReaderTask;
import java.util.concurrent.ExecutorService;

/** Uses the app's prompt-cancellable continuation and its original caller interceptor. */
final class MediumReaderAwait {
    private MediumReaderAwait() {}
    static Object run(ExecutorService workers, ReaderTask.Work<Object> work, Cancellation cancellation, yl2 caller) {
        ra1 waiting = new ra1(1, ppk.H(caller));
        waiting.r();
        waiting.t(new Cancel(cancellation));
        new ReaderTask<>(workers, work, cancellation, result -> {
            d4j token = waiting.c(result, null);
            if (token != null) waiting.A(token);
        }).start();
        return waiting.p();
    }
    private static final class Cancel implements z06 {
        private final Cancellation cancellation;
        Cancel(Cancellation cancellation) { this.cancellation = cancellation; }
        @Override public Object invoke(Object cause) { cancellation.cancel(); return tzg.a; }
    }
}
