package android.os;

/** Run callbacks deterministically; native import itself is substituted by the verified model fixture. */
public final class Handler {
    public Handler(Looper looper) {}
    public boolean post(Runnable task) { task.run(); return true; }
}
