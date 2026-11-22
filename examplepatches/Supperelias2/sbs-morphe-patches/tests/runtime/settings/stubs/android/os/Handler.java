package android.os;
public class Handler {
    public Handler(Looper looper) { throw new UnsupportedOperationException("Android scheduling not exercised"); }
    public void removeCallbacks(Runnable task) { throw new UnsupportedOperationException("Android scheduling not exercised"); }
    public boolean postDelayed(Runnable task, long delayMillis) { throw new UnsupportedOperationException("Android scheduling not exercised"); }
}
