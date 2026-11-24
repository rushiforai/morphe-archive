package ao;

import android.graphics.Bitmap;
import bo.j;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public final class c implements j, Future<Object> {
    @Override public boolean cancel(boolean mayInterruptIfRunning) { return false; }
    @Override public boolean isCancelled() { return false; }
    @Override public boolean isDone() { return true; }
    @Override public Object get() { return get(0L, TimeUnit.MILLISECONDS); }

    @Override public Object get(long timeout, TimeUnit unit) {
        Runnable hook = testenv.FakeLineEnv.onAvatarLoad;
        if (hook != null) hook.run();
        return Bitmap.createBitmap(8, 8, Bitmap.Config.ARGB_8888);
    }
}
